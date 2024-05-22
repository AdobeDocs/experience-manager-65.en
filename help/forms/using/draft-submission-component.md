---
title: Drafts and submissions component

description: Drafts and submissions component lists forms that are in the draft state and are already submitted. You can customize appearance and style of the component.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: publish

docset: aem65
exl-id: f3f013a7-a399-4178-a901-d4a8c65ddbd3
solution: Experience Manager, Experience Manager Forms
feature: Forms Portal
role: "Admin, User, Developer"
---
# Drafts and submissions component{#drafts-and-submissions-component}

The Drafts & Submissions component lists all the forms that are in the draft state and the forms that are already submitted. The component has separate sections (tabs) for drafts and submitted forms. The users can view only their drafts and submitted forms.

## Configuring the component {#configuring-the-component}

The Drafts & Submissions component has two tabs: Drafts and Submissions.

To enable submission of an adaptive form to appear in the submissions tab, set the **Submit action** to **[Forms Portal Submit Action](../../forms/using/configuring-submit-actions.md). Alternatively,** enable the Forms Portal Submit option. Whenever, a user submits the form, the form is added to the submissions tab.

The drafts functionality is enabled out of the box. When a user clicks **Save** on an adaptive form, the form is added to the drafts tab.

Perform the following steps to add and configure a Drafts & Submissions component:

1. Drag-and-drop the **Drafts & Submissions** component under Document Services category in the components browser on to your page.
1. Select the component and then select ![settings_icon](assets/settings_icon.png) to open the Edit dialog for the component.

   ![Drafts & Submission component](assets/drafts-submissions-edit.png)

1. In the Edit dialog, specify the following details and select **Done** to save the settings.

<table>
 <tbody>
  <tr>
   <th>Tab</th>
   <th>Configuration</th>
   <th>Description</th>
  </tr>
  <tr>
   <td>General</td>
   <td>Total Result</td>
   <td>Specifies the maximum number of results to display. If the count of results increases the Total Result limit, a <strong>More </strong>link appears at the bottom of the component. Clicking <strong>More </strong>shows all the forms. </td>
  </tr>
  <tr>
   <td> </td>
   <td>Style Type</td>
   <td>Specifies the style of the component. You can specify <strong>No Style</strong>, <strong>Default Style</strong>, or <strong>Custom Style</strong> for listing the forms. For Custom Style Option, you can specify the path of custom CSS file in the <strong>Custom Style Path </strong>field<strong>.</strong></td>
  </tr>
  <tr>
   <td> </td>
   <td>Custom Style Path</td>
   <td>If you choose <strong>Custom Style</strong> option in the <strong>Style Type</strong> field, use the <strong>Custom Style Path</strong> field to specify the path of custom CSS file. </td>
  </tr>
  <tr>
   <td> </td>
   <td>Display Options</td>
   <td><p>Specifies the tabs to display. You can choose to display draft forms, submitted forms, or both. </p> <p><strong>Note</strong>:<em> For <strong>Display options</strong>, if you select an option other than <strong>Both</strong>, the <strong>Default Tab</strong> field option is not used.</em></p> </td>
  </tr>
  <tr>
   <td> </td>
   <td>Default Tab</td>
   <td>Specifies the tab to display when the forms portal page loads. You can choose between <strong>Draft Forms Tab</strong> and <strong>Submitted Forms Tab</strong>.</td>
  </tr>
  <tr>
   <td>Draft Forms Tab Configuration</td>
   <td>Custom Title</td>
   <td>Specifies title of the <strong>Draft Forms</strong> tab. The default value is <strong>Draft Forms.</strong></td>
  </tr>
  <tr>
   <td> </td>
   <td>Layout Template</td>
   <td>Specifies the layout to use for Draft Forms list.</td>
  </tr>
  <tr>
   <td>Submitted Forms Tab Configuration</td>
   <td>Custom Title </td>
   <td>Specifies title of the <strong>Submitted Forms </strong>tab. The default value is <strong>Submitted Forms.</strong></td>
  </tr>
  <tr>
   <td> </td>
   <td>Layout Template</td>
   <td>Specifies the layout to use for Submitted Forms<strong> </strong>list. </td>
  </tr>
 </tbody>
</table>

## Customizing the storage {#customizing-the-storage}

When you use the Forms Portal submit action or enable the Store data in forms portal option in adaptive form, the form data is stored in AEM repository. In a production environment, it is recommended not to store draft or submitted form data in AEM repository. Instead, you must integrate the drafts and submission component with a secure storage like enterprise database to store drafts and submitted forms data.

Forms portal lets you store data at local AEM repository, remote AEM repository, or to a database. AEM Forms lets you customize the implementation of storing user data for drafts and submissions. You can override default methods to specify how draft and submissions data is stored at a storage of your choice. For example, you can store the data in a data store currently implemented in your organization.

Forms portal provides out of the box services (APIs) to store data on crx-repository of local and remote AEM Forms publish instances. You can replace the default implementations, described in [Configuring storage services for drafts and submissions](/help/forms/using/configuring-draft-submission-storage.md) article, with custom implementations to replace default functionality. For detailed information about the methods required in a custom implementation to store content at a secured location, see [Customizing Draft and Submission data services](/help/forms/using/custom-draft-submission-data-services.md) and [Custom storage for drafts and submissions component.](/help/forms/using/adding-custom-storage-provider-forms.md)

AEM Forms documentation provides a [Sample for integrating drafts & submissions component with database](integrate-draft-submission-database.md). You can use the sample implementation to develop your own custom implementation.

## Related Articles

* [Enable forms portal components](/help/forms/using/enabling-forms-portal-components.md)
* [Create forms portal page](/help/forms/using/creating-form-portal-page.md)
* [List forms on a web page using APIs](/help/forms/using/listing-forms-webpage-using-apis.md)
* [Use Drafts and submissions component](/help/forms/using/draft-submission-component.md)
* [Customize storage of drafts and submitted forms](/help/forms/using/draft-submission-component.md)
* [Sample for integrating drafts & submissions component with database](/help/forms/using/integrate-draft-submission-database.md)
* [Customizing templates for forms portal components](/help/forms/using/customizing-templates-forms-portal-components.md)
* [Introduction to publishing forms on a portal](/help/forms/using/introduction-publishing-forms.md)
