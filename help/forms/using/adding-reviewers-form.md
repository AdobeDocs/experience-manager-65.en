---
title: Associating submission reviewers with a form

description: Learn how to associate submission reviewers with a form in AEM Forms. Associated reviewers review a form submitted via forms portal.


products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author

docset: aem65
feature: Adaptive Forms, Foundation Components
exl-id: 46e7b858-44d1-41c8-9f44-4e959e593dc1
solution: Experience Manager, Experience Manager Forms
role: "User, Developer"
---
# Associating submission reviewers with a form {#associating-submission-reviewers-with-a-form}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

When you create a form, you can specify users who review the submissions of the form via forms portal and provide feedback. Your organization can collect feedback and rework on the submitted forms.

AEM Forms lets you associate a reviewer group with a form. Users added to a review group of a form see submissions of this form, and provide feedback.

Reviewer groups assigned to a form can only review the submissions of the specified form.

## Prerequisite {#prerequisite}

### Enabling submission reviewer groups property for adaptive forms using metadata schema editor {#enabling-submission-reviewer-groups-property-for-adaptive-forms-using-metadata-schema-editor}

To associate a reviewer group with a form, edit the metadata schema of adaptive forms. By default, you cannot add a reviewer group to a submitted form.

To edit metadata schema:

1. In the author mode, under Experience Manager, click **Tools** &gt; **Assets** &gt; **Metadata Schemas**.
1. In the Schema Forms page, navigate to **Forms** &gt; **Forms Authored in AEM.**

   The URL of the page is:

   ```html
   https://<hostname>:<port>/mnt/overlay/dam/gui/content/metadataschemaeditor/
    schemalist.html/forms/aem-authored
   ```

1. Select **Adaptive Form** and click **Edit**.
1. In the Edit Form page, click **Advanced**.
1. In the Advanced tab, drag-and-drop the **Single Line Text** component available under Build Form.
1. Select the added text component to see its settings.

   Under Settings, enter `./jcr:content/metadata/form-submission-reviewer-group` in the Map to Property field.

   The submission reviewer group field in the Advanced properties of your adaptive form is enabled with the name you specify under Field Label.

## Associating submission reviewers with a form {#associating-submission-reviewers-with-a-form-1}

To associate submission reviewers with an adaptive form, create a reviewer group and add users to it. Add the created reviewer group under the form submission reviewer field in the advanced properties of the form.
User groups let you associate different sets of submission reviewers with different adaptive forms. This feature prevents a submission review from an unauthorized user.

Before you perform the following steps, see [Prerequisite](../../forms/using/adding-reviewers-form.md#prerequisite).

To create a group and add members to it, navigate to **Tools** &gt; **Operations** &gt; **Security** &gt; **Groups**.
For more information, see [User Administration and Services](/help/sites-administering/security.md).
Ensure that you add the group you create as a member of the out-of-the-box user group: **forms-submission-reviewers**. This user group is shipped with AEM Forms, and it ensures that users are added as submission reviewers.

To associate user groups with an adaptive form:

1. In the authoring mode, navigate to **Forms** &gt; **Forms & Documents**.
1. Use the **Select **option to select an adaptive form, and click **View Properties**.
1. In the Properties window of the form, click **Edit**, and then click **ADVANCED**.
1. Enter the group in the submission reviewer group field, and click **Done**.

   The submission reviewer group field appears with the name you specified in the edited metadata schema of adaptive forms.

>[!NOTE]
>
>Replicate users and forms to ensure availability of the users and forms in the remote implementation of AEM Forms.
>
>Ensure that all users are replicated as reviewing members of the user groups in the remote implementation.
