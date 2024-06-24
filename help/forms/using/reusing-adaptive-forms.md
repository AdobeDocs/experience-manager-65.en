---
title: Reusing adaptive forms
description: You can reuse an existing adaptive form to create new adaptive forms.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
discoiquuid: ef564750-f107-41cb-887e-fc6d22b7d32e
feature: Adaptive Forms,Foundation Components
exl-id: d8ee4e82-3137-430e-aa47-b00191f2729c
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Reusing adaptive forms {#reusing-adaptive-forms}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/manage-metadata/reusing-adaptive-forms.html)                  |
| AEM 6.5     | This article         |

## Introduction {#introduction}

If you want to use some of the properties of an existing adaptive form to generate a new one, you can simply use the copy-paste functionality. In addition, you can paste the new adaptive form at the desired folder path. All metadata properties are replicated and the XFA and XSDs for XFA- and XSD-based adaptive forms are also copied.

>[!NOTE]
>
>The status and the review details are not copied. For example, if your adaptive form is published and then if you copy it, the pasted adaptive form is in unpublished state. Similarly, if a copied asset is under review, the pasted asset is not under the same review.

### Copy an adaptive form {#copy-an-adaptive-form}

Copy an adaptive form using either of the following approaches:

1. Click copy ![aem6forms_copy](assets/aem6forms_copy.png) icon from Quick actions.

   >[!NOTE]
   >
   >Quick actions are the action items that get displayed over a thumbnail on mouse hover.

1. Select the adaptive form. The selection process is different for different views.

   If you are in card view, go to selection mode by clicking the selection ![aem6forms_check-circle](assets/aem6forms_check-circle.png) icon and click all the adaptive forms that you want to copy.

   If you are in list view, click the check boxes of all adaptive forms to select them.

   >[!NOTE]
   >
   >All selected assets must be adaptive forms because copy-paste functionality is supported only for adaptive forms, and all assets that are selected must be present in the same folder.

   After selecting the assets, click the copy ![aem6forms_copy](assets/aem6forms_copy.png) icon present in the toolbar to copy the selected adaptive form.

### Paste an adaptive form {#paste-an-adaptive-form}

Clicking the copy action automatically exits the selection mode and makes the paste ![aem6forms_paste](assets/aem6forms_paste.png) icon visible. Now go to the desired folder path and click the paste ![aem6forms_paste](assets/aem6forms_paste.png) icon to paste the copied adaptive form.

If you are pasting in the same folder or another file with the same node name (with which it is stored in the CRX repository) exists in this target folder, 1 is appended to the suffix (for example, myaf becomes myaf1 and if myaf1 exists at the same location, myaf becomes myaf2. All other properties remain same as the original adaptive form.

After clicking the paste ![aem6forms_paste](assets/aem6forms_paste.png) icon, it will again become hidden. At one time, you can only paste once. To again create a copy of same asset, copy it again.

### Change contents of new adaptive form {#change-contents-of-new-adaptive-form}

The content of a pasted adaptive forms can be changed using the following approaches to make it different from the copied form:

1. **Change metadata properties:**

   You can change the metadata properties of the adaptive form for example, title and description. For more details about metadata properties and how they can be changed, see [Managing Form Metadata](/help/forms/using/manage-form-metadata.md)

1. **Change XFA/XSD for XFA/XSD-based Adaptive Forms:**

   You can change the XFA/XSD used in adaptive forms. To know how these adaptive forms can be changed, see [Managing form metadata](/help/forms/using/manage-form-metadata.md)

1. **Republish:**

   The pasted asset is different from the copied one. You can publish it as a new asset to make it available for end users. To know how to publish an asset, see [Publishing and unpublishing forms](/help/forms/using/publishing-unpublishing-forms.md)
