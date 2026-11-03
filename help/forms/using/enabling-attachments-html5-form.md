---
title: Enabling attachments for an HTML5 form
description: By default, the attachment support for HTML5 forms is disabled.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 8eebfcd6-0597-44ed-b718-bf9a1baa6c12
feature: HTML5 Forms,Mobile Forms
exl-id: 68912260-179a-4d1b-b944-0a1777c021ac
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 97aafc4b-2598-52d6-9012-295a95969e38
    internal-label: HTML5 Forms
  - id: 59f95943-e802-56ac-990d-21ab923984c1
    internal-label: Mobile Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Enabling attachments for an HTML5 form {#enabling-attachments-for-an-html-form}

You can upload, preview, and submit attachments with HTML5 forms. By default, the attachment support is disabled. To enable the attachment support:

1. Create a [custom profile](/help/forms/using/custom-profile.md) with a `mfAttachmentOptions` multiselect string property. Each string in the `mfAttachmentOptions` property must have a `property=value` format to configure options of the file attachment widget. The `property` and `value` can have any of the following values:

   | Property | Value |
   |--- |---|
   | multiSelect| true or false (true by default) |
   | fileSizeLimit | Number in MBs (2 MBs by default). For example, 5. |
   | buttonText | Button text for pop-up window ("Attach" by default)|
   | accept | comma-separated list of file types to accept ("audio/&ast;, video/&ast;, image/&ast;, text/&ast;, .pdf" by default)  |

   For example:

   ![configure options](assets/mfAttachmentOptions.png)

   As required, you can also specify more custom options for the `mfAttachmentOptions` property.

   >[!NOTE]
   >
   >In Microsoft Internet Explorer 9, users can attach files larger than the specified limit. It is a known issue.

1. Use the [metadata editor](/help/forms/using/manage-form-metadata.md) to select the custom profile that you have created above for HTML 5 forms.
1. Render your form template with custom profile and the attachments icon would appear on the forms toolbar.

   >[!NOTE]
   >
   >Out of the box, the forms portal provides a custom profile with drafts and attachments capability enabled. For more information about the **Save as Draft** profile, see [Saving HTML5 forms as a draft](/help/forms/using/saving-html5-form-draft.md).

1. Click the attachment icon, an attachment selection dialog box appears. Browse and select the attachment and click **Attach**.

   >[!NOTE]
   >
   >To preview an attachment, click the attachment name.

   >[!NOTE]
   >
   >The file preview option is not available for anonymous users.

## Attachment submission format {#attachment-submission-format}

When attachments are enabled, HTML5 form submits multipart data. The multi-part submission data has two parts **dataXml** and **attachments**.

>[!NOTE]
>
>For backward compatibility, if `mfAllowAttachments` option is turned off, then the HTML5 forms does not send the multi-part data. It sends simple data xml in **application/xml** format.

If the mfAllowAttachments flag is turned on, the [submit service proxy service](/help/forms/using/service-proxy.md) also posts multipart data with dataXml and attachments.
