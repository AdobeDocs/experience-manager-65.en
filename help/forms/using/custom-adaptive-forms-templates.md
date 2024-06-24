---
title: Creating a custom adaptive form template
description: This article describes how to create custom adaptive form templates.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization
docset: aem65
exl-id: 35b50573-0be8-469d-a1ac-f51b9aaa5fef
solution: Experience Manager, Experience Manager Forms
role: User, Developer
feature: Adaptive Forms,Foundation Component 
---
# Creating a custom adaptive form template{#creating-a-custom-adaptive-form-template}

>[!NOTE]
>
>AEM Forms has introduced dynamic templates. You can use AEM Sites template editor to [create or edit dynamic templates](../../forms/using/template-editor.md). The templates mentioned in the below article are static templates. These are not available on a default installation. [Install Compatibility package](../../forms/using/compatibility-package.md) to get these templates on your evironment.

## Prerequisites {#prerequisites}

* Understanding of AEM [Page Template](/help/sites-authoring/templates.md) and [Adaptive Form Authoring](https://helpx.adobe.com/aem-forms/6-1/introduction-forms-authoring.html)

* Understanding of AEM [Client Side Libraries](/help/sites-developing/clientlibs.md)

## Adaptive form template {#adaptive-form-template}

An Adaptive Form template is specialized AEM Page Template, with certain properties and content structure that is used to create Adaptive Form. The template has preconfigured layouts, styles, and basic initial content structure.

Once you create a form, any changes to the original template content structure are not reflected in the form.

## Default adaptive form templates {#default-adaptive-form-templates}

AEM QuickStart provides the following adaptive form templates:

* Survey template: Lets you create a single page adaptive form using the Responsive layout that has multiple columns configured. The layout automatically adjusts based on the dimensions of the various screens on which you want to display the form.
* Simple Enrollment template: Lets you create a multi-step adaptive form using a wizard layout. In this layout, you can specify a step completion expression for each step, which is validated before the wizard proceeds to the next step.
* Tabbed Enrollment template: Lets you create a multi-tab adaptive form using a tabs-on-left layout, where you can visit tabs in any random order.
* Advanced Enrollment template: Lets you create a form with mulitple tabs and wizard. It uses a tabs-on-left layout that lets you visit tabs in any order. It uses Adobe Document Cloud esign services for signing and verification.
* Blank Template: Lets you create a form without any header, footer, and initial content. You can add components such as text boxes, buttons, and images. The blank template lets you create a form that you can [embed in AEM Site pages](/help/forms/using/embed-adaptive-form-aem-sites.md).

These templates have the `sling:resourceType` property set to the corresponding page component. The page component renders the CQ page, containing adaptive form container, which in turn renders adaptive form.

The following table enumerates the association between templates and page component:

<table>
 <tbody>
  <tr>
   <td><p><strong>Template</strong></p> </td>
   <td><p><strong>Page Component</strong></p> </td>
  </tr>
  <tr>
   <td><p>/libs/fd/af/templates/surveyTemplate</p> </td>
   <td><p>/libs/fd/af/components/page/survey</p> </td>
  </tr>
  <tr>
   <td><p>/libs/fd/af/templates/simpleEnrollmentTemplate</p> </td>
   <td><p>/libs/fd/af/components/page/base</p> </td>
  </tr>
  <tr>
   <td><p>/libs/fd/af/templates/tabbedEnrollmentTemplate</p> </td>
   <td><p>/libs/fd/af/components/page/tabbedenrollment</p> </td>
  </tr>
  <tr>
   <td><p>/libs/fd/afaddon/templates/advancedEnrollmentTemplate</p> </td>
   <td><p>/libs/fd/afaddon/components/page/advancedenrollment</p> </td>
  </tr>
 </tbody>
</table>

## Creating an adaptive form template using template editor {#creating-an-adaptive-form-template-using-template-editor}

You can specify the structure and initial content of an adaptive form using Template Editor. For example, you want all form authors to have few text boxes, navigation buttons, and a submit button in an enrollment form. You can create a template that authors can use to create a form that is consistent with other enrollment forms. AEM Template Editor lets you:

* Add header and footer components of a form in the structure layer
* Provide the initial content for the form.
* Specify a theme.
* Specify actions such as submit, reset, and navigate.

For more informtion, see [Template Editor](../../forms/using/template-editor.md).

## Creating an adaptive form template from CRXDE {#creating-an-adaptive-form-template-from-crxde}

Instead of using the available templates, you can create a template and use it to create adaptive forms. Custom templates are based on various page components that reference adaptive form containers and page elements, such as header and footer.

You can create these components using the base page component for your website. Alternatively, you can extend the page component of the adaptive form that out of the box templates use.

Perform the following steps to create a custom template, such as simpleEnrollmentTemplate.

1. Navigate to CRXDE Lite on your authoring instance.

1. Under the /apps directory, create the folder structure for your application. For example, if the application name is mycompany, create a folder with this name. Typically, the application folder contains components, configuration, templates, src, and installation directories. For this example, create the components, configuration, and templates folders.

1. Navigate to the folder /libs/fd/af/templates.
1. Copy the `simpleEnrollmentTemplate` node.
1. Navigate to the folder /apps/mycompany/templates. Right-click it and select **[!UICONTROL Paste]**.
1. If necessary, rename the template node you copied. For example, rename it as enrollment-template.

1. Navigate to the location /apps/mycompany/templates/enrollment-template.

1. Modify the `jcr:title` and `jcr:description` properties for the `jcr:content` node to distinguish the template from the template you copied.

1. The `jcr:content` node of the modified template contains the `guideContainer` and `guideformtitle` components. `guideContainer` is the container that holds the adaptive form. The `guideformtitle` component displays the application name, description, and so on.

   Instead of `guideformtitle`, you can include a custom component or the `parsys` component. For example, remove `guideformtitle`, and add a custom component or the `parsys` component node. Ensure that the `sling:resourceType` property of the component references the component and the same is defined in the page `component.jsp` file.

1. Navigate to the location /apps/mycompany/templates/enrollment-template/jcr:content.

1. Open the **[!UICONTROL Properties]** tab and change the value of the `cq:designPath` property to /etc/designs/mycompany.

1. Now create a /etc/designs/mycompany node for the `cq:Page` type.

## Create an adaptive form page component {#create-an-adaptive-form-page-component}

The custom template has the same styling as the default template because the template references the page component /libs/fd/af/components/page/base. You can find the component reference as the property `sling:resourceType` defined at the node /apps/mycompany/templates/enrollment-template/jcr:content. Because base is a core product component, do not modify this component.

1. Navigate to the node /apps/mycompany/templates/enrollment-template/jcr:content and modify the value of the property `sling:resourceType` to /apps/mycompany/components/page/enrollmentpage
1. Copy the node /libs/fd/af/components/page/base to the folder /apps/mycompany/components/page.

1. Rename the copied component to `enrollmentpage`.

1. **(Only if you already have a contentpage)** Perform the following steps (a-d), if you have an existing `contentpage`component for your website. If you do not have an existing `contentpage`component for your website, you can leave the `resourceSuperType`property to point to the out-of-the-box base page.

    1. For the `enrollmentpage` node, set value of the property `sling:resourceSuperType` to mycompany/components/page/contentpage. The `contentpage` component is the base page component for your site. Other page components can extend it. Remove script files under `enrollmentpage`, except `head.jsp`, `content.jsp`, and `library.jsp`. The `sling:resourceSuperType` component, which is `contentpage` in this case, includes all such scripts. Headers, including navigation bar and footer are inherited from the `contentpage` component.

    1. Open the file `head.jsp`.

       The JSP file contains the line `<cq.include script="library.jsp"/>`.

       The `library.jsp` file contains the `guide.theme.simpleEnrollment` client library, which contains the styling for the adaptive form.

       The page component `enrollmentpage` has an exclusive `head.jsp` file that overrides the `head.jsp` file of the `contentpage` component.

    1. Include all scripts in the `head.jsp` file for the `contentpage` component to the `head.jsp` file for the `enrollmentpage` component.
    1. In the `content.jsp` script, you can add additional page content or references to other components that are included when a page renders. For example, if you add the custom component `applicationformheader`, ensure that you add the following reference to the component in the JSP file:

       `<cq:include path="applicationformheader" resourceType="mycompany/components/applicationformheader"/>`

       Similarly, if you add a `parsys` component in the template node structure, also include the custom component.

## Creating an adaptive form client library {#creating-an-adaptive-form-client-library}

The `head.jsp` file of the `enrollmentpage` component for the new template includes a client library `guide.theme.simpleEnrollment`. The default template also uses this client library. Change the style in the new template using on of these methods:

* Define a custom theme and replace the default theme `guide.theme.simpleEnrollment` with the custom theme.
* Define a new client library under /etc/designs/mycompany. Include the client library after the default theme entry in the jsp page. Include all overridden styles and additional Java Script files in this client library.

>[!NOTE]
>
>Theme refers to a client library that is included in the page component used to render an adaptive form. The client library mainly governs the appearance of an adaptive form.
