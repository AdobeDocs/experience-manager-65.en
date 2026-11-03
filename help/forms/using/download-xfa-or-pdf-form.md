---
title: Download an XFA or a PDF form template
description: You can export forms from the repository to the local system and migrate the downloaded forms to new repository.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-manager
role: Admin,User
exl-id: 5b7b9816-38c1-4780-b1fc-8184971f3772
solution: Experience Manager, Experience Manager Forms
feature: Interactive Communication
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: aa28c6c8-3ede-445b-a351-eeb0c9f9aec4
    internal-label: Interactive Communication
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
---
# Download an XFA or a PDF form template {#download-an-xfa-or-a-pdf-form-template}

The download operation, as the name implies, lets you export forms from the repository to the local system. In combination with the upload operation, this operation helps you migrate your forms from one repository to another.

In AEM Forms, the download operation is supported for the following asset types:

* Form templates (XFA Forms)
* PDF forms
* Documents (flat PDF files)

AEM Forms supports download of these form types individually or in a folder containing one or more supported forms.

Aside from these assets, you can download the `Resource` type of asset if it is present in a folder. This functionality is provided to enable you to download the resource referred to by an XFA form along with the form.

## Download one or more forms {#download-one-or-more-forms}

1. Log in to the AEM Forms user interface at `https://<server>:<port>/aem/forms.html`.

1. Navigate to the location of the asset you want to download.

1. Select the asset. Click the **[!UICONTROL Download]** ![aem6forms_download](assets/aem6forms_download.png) icon in the toolbar.

   >[!NOTE]
   >
   >You can select only one form for download. If you want to download multiple forms, you must download them as a folder.

1. In the dialog box that appears, click **[!UICONTROL Download]**.

   AEM Forms generates a ZIP file containing the selected file or the selected folder.

   If you're downloading a folder, the supported assets inside the folder are downloaded in their existing hierarchy.

   The ZIP file is saved to the `Downloads` folder on your system.

## Related considerations for the upload operation {#related-considerations-for-the-upload-operation}

* You can upload the ZIP file to any other location in the same repository or another repository
* The hierarchy of the assets in a folder is retained during the upload operation
* Any metadata changes made to the downloaded assets before download are reflected upon upload
