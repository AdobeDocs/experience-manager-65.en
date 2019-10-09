---
title: DO NOT PUBLISH - Changing the template applied to an adaptive form
seo-title: DO NOT PUBLISH - Changing the template applied to an adaptive form
description: To change the appearance, design, or layout of an adaptive form, you can change the template applied to it without impacting the form contents.
seo-description: To change the appearance, design, or layout of an adaptive form, you can change the template applied to it without impacting the form contents.
page-status-flag: never-activated
uuid: b8f4ec1f-5330-476c-a61d-8c22a6ba92cf
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: b8a569d4-9ead-4587-85c6-1b04e1628a52
---

# DO NOT PUBLISH - Changing the template applied to an adaptive form {#do-not-publish-changing-the-template-applied-to-an-adaptive-form}

Changing an adaptive form’s template updates the appearances, the layout, and the design of the form. A change in the template does not impact the form data or the information present in the form.

1. Select an adaptive form and click **[!UICONTROL Edit Template]** ![aem6forms_tableedit](assets/aem6forms_tableedit.png) in the toolbar.
1. On the Edit Template Wizard, select the new template. To search for the applicable template, use the search box and select from the search results.

   >[!NOTE]
   >
   >You can use text strings or strings with wildcards to search for available templates. To know more, see [Searching for forms and assets](/help/forms/using/searching-forms-or-assets.md). The template search behaves similar to the asset search.

   ![Edit Template Wizard](assets/apply_new_template.png)

1. After selecting the applicable template, click **[!UICONTROL Update]** in upper right corner. If the change is successful, a success message is displayed. Optionally, you can open the adaptive form with newly applied template from this dialog.

The following form properties are updated with new values, when a new template is applied to an adaptive form:

* `cq:designPath`
* `sling:resourceSuperType`
* `sling:resourceType`
* `cq:template`

