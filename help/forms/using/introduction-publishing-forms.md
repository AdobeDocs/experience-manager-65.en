---
title: Introduction to publishing forms on a portal
seo-title: Introduction to publishing forms on a portal
description: AEM Forms provides with components that you can use to build your forms portal. This articles introduces you to the available forms portal components.
seo-description: AEM Forms provides with components that you can use to build your forms portal. This articles introduces you to the available forms portal components.
uuid: 96aa4fe2-a111-4675-a33c-7dee8b82cbc2
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: publish
discoiquuid: 44871fe1-ddc9-492c-8784-5df3ca392f9b
---

# Introduction to publishing forms on a portal {#introduction-to-publishing-forms-on-a-portal}

## AEM Forms portal components overview {#aem-forms-portal-components-overview}

In a typical forms-centric portal deployment scenario, forms development and portal development are two disjoint activities. While Form Designers design and store forms in a repository, Web Developers create a web application to list forms and handle submission of forms. Forms are copied over to the web tier as there is no communication between the forms repository and the web application.

Such scenarios often result in management issues and production delays. For example, if there is a newer version of a form available in the repository, you need to replace the form on the web tier, modify the web application, and redeploy the form on the public site. Redeploying the web application might cause some server downtime. Typically, the server downtime is a planned activity and therefore the changes cannot be pushed to the public site instantaneously.

AEM Forms provides portal components that reduce management overheads and production delays. The components equip Web Developers to create and customize a forms portal on websites authored using Adobe Experience Manager (AEM).

![AEM Forms portal](assets/aem-forms-portal.png)

The form portal components allow you to add the following functionality:

* List forms in customized layouts. Out of the box, List view, Card view, and Panel view layouts are provided. You can create your own custom layouts.
* Enables you to display custom metadata as well as custom actions while listing them.
* List forms published by AEM Forms UI on the publish instance where Forms Portal components are being used.
* Allow end users to render forms in HTML as well as PDF format.  
* Use custom HTML profile to render forms.
* Enable searching of forms based on a various criteria, such as form properties, metadata, and tags.  
* Submit form data to a servlet.  
* Use custom CSS to customize the look and feel of the portal.  
* Create links to forms.  
* Lists drafts and submissions related to Adaptive Form created by end user.

## Available AEM Forms portal components {#available-aem-forms-portal-components}

AEM Forms provides the following portal components out of the box, grouped under **Document Services **and **Document Services Predicates **component groups:

### Search &amp; Lister {#search-amp-lister}

The Search & Lister component allows you to list forms from the forms repository onto your portal page and provides configuration options to list forms based on specified criteria. It also allows you to specify search criteria to enable your portal users to search across the list of forms.

### Drafts &amp; Submissions {#drafts-amp-submissions}

While Search & Lister component displays forms which are made public by Forms author, the Drafts & Submissions component displays forms that are saved as draft for completing later and submitted forms. This component provides personalized experience to any logged in user.

### Link {#link}

The Link component allows you to create a link to a form anywhere on the page. Consider a scenario where you are offering a training program, and you want your users to submit a form to register for the training. On your website, you have posted the program details. Below the details, you want to provide a link to the registration form. The Link component can help you create that link.

## Forms Portal Workflow {#forms-portal-workflow}

Forms portal enables you to list forms from the forms repository onto your portal page. It also allows you to specify search criteria to enable your portal users to search across the list of forms. You can also use the Drafts & Submissions component to display forms that are saved as a draft for completing later and submitted forms. You have to perform a certain set of operations before these functionalities become available on a Sites page. Perform the steps in the listed sequence to make the components and respective functionalities available on a sites page:

1. **Enable Forms Portal components**: Out of the box, forms portal components are not available for use. [Enable the components from AEM sidekick](/help/forms/using/enabling-forms-portal-components.md) for an AEM Sites page. 
1. **List forms on a page (create forms portal page):** You can list forms on both AEM Sites and non-AEM Site pages. The list contains forms available on the publish instance. A user can open forms and start filling those. Whenever a user opens a form, a new instance of the form is created:

    1. **List forms on an AEM Sites page**: Add the **[Search & Lister](/help/forms/using/creating-form-portal-page.md)** component to the page and configure the **[List Pane](/help/forms/using/creating-form-portal-page.md#p-list-pane-p)** in it, to list forms on a page. Add and configure the **[Search Pane](/help/forms/using/creating-form-portal-page.md#search-pane)** component to the **Search & Lister** component also to add search functionality to the page. The page with forms portal component is known as [forms portal page](/help/forms/using/creating-form-portal-page.md).
    1. **List forms on a non-AEM Sites page:** Use the [forms portal search APIs](/help/forms/using/listing-forms-webpage-using-apis.md) to query, retrieve, and list forms on non-AEM Sites pages.

1. **List draft and submitted forms on a forms portal page**: Add and configure the Drafts & Submissions component to the forms portal page. The component lists all the forms that are in the draft state and the forms that are already submitted.

   To enable a submitted adaptive form to appear in the submissions tab, set the **Submit action** to **[Forms Portal Submit Action](https://helpx.adobe.com/in/experience-manager/6-4/forms/using/configuring-submit-actions.html).** Alternatively, enable the Forms Portal Submit option. Whenever a user submits the form, the form is added to the submissions tab.

1. **Configure storage for the draft and submitted forms data:** By default, draft and submissions data is stored in the AEM repository. In a production environment, it is recommended not to store draft or submitted form data in AEM repository. [Configure forms portal component to save data to a secure location](/help/forms/using/draft-submission-component.md#customizing-the-storage). 
1. **(Optional) Customizing the forms portal components:**  [Customize your forms portal page templates](/help/forms/using/customizing-templates-forms-portal-components.md) to provide a distinctive appearance to the components.
1. **(Optional) Add custom metadata to forms:** [Add custom metadata to forms](/help/forms/using/customizing-templates-forms-portal-components.md) to improve listing and search experience. 
1. **Publish the forms portal page:** Your forms portal page is now ready. Publish the page.

## Related articles {#related-articles}

* [Enable forms portal components](/help/forms/using/enabling-forms-portal-components.md)
* [Create forms portal page](/help/forms/using/creating-form-portal-page.md)
* [List forms on a web page using APIs](/help/forms/using/listing-forms-webpage-using-apis.md)
* [Use Drafts and submissions component](/help/forms/using/draft-submission-component.md)
* [Customize storage of drafts and submitted forms](/help/forms/using/draft-submission-component.md#customizing-the-storage)
* [Sample for integrating drafts & submissions component with database](https://helpx.adobe.com/in/experience-manager/6-4/forms/using/integrate-draft-submission-database.html)  

* [Customizing templates for forms portal components](/help/forms/using/customizing-templates-forms-portal-components.md)
* [Introduction to publishing forms on a portal](/help/forms/using/introduction-publishing-forms.md)

