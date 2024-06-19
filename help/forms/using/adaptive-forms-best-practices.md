---
title: Best practices for working with adaptive forms
description: Explains best practices for setting up an AEM Forms project, developing adaptive forms, and optimizing the performance for AEM Forms system.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
feature: Adaptive Forms, Foundation Components, Core Components
exl-id: 5c75ce70-983e-4431-a13f-2c4c219e8dde
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Best practices for working with adaptive forms {#best-practices-for-working-with-adaptive-forms}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

## Overview {#overview}

Adobe Experience Manager (AEM) forms can help you transform complex transactions into simple, delightful digital experiences. However, it requires concerted effort to implement, build, execute, and maintain an efficient and productive AEM Forms ecosystem.

This document provides guidelines and recommendations that forms administrator, authors, and developers can benefit from when working with AEM Forms, especially adaptive forms component. It discusses best practices right from setting up a forms development project to configuring, customizing, authoring, and optimizing AEM Forms. These best practices collectively contribute to the overall performance of AEM Forms ecosystem.

In addition, here are some recommended reads for general AEM best practices:

* [Best practices: Deploying and maintaining AEM](/help/sites-deploying/best-practices.md)
* [Best practices: Authoring content](/help/sites-authoring/best-practices.md)
* [Best practices: Administering AEM](/help/sites-administering/administer-best-practices.md)
* [Best practices: Developing solutions](/help/sites-developing/best-practices.md)

## Set up and configure AEM Forms {#set-up-and-configure-aem-forms}

### Setting up forms development project {#setting-up-forms-development-project}

A simplified and standardized project structure can significantly reduce development and maintenance efforts. Apache Maven is an open source tool recommended for building AEM projects.

* Use Apache Maven `aem-project-archetype` to create and manage structure for AEM project. It creates recommended structure and templates for your AEM project. Also, it provides build automation and change control systems to help manage the project.

    * Use the maven `archetype:generate` command to generate the initial structure.
    * Use maven `eclipse:eclipse` command to generate the eclipse project files and import the project into eclipse.

For more information, see [How to Build AEM Projects using Apache Maven](/help/sites-developing/ht-projects-maven.md).

* The FileVault tool or VLT helps you map the content of a CRX or AEM instance to your file system. It provides change control management operations, such as check-in and check-out of the AEM project content. See [How to use the VLT Tool](/help/sites-developing/ht-vlttool.md).

* If you use Eclipse-integrated development environment, you can use AEM Developer tools for seamless integration of Eclipse IDE with AEM instances to create AEM applications. For details, see [AEM developer tools for Eclipse](/help/sites-developing/aem-eclipse.md).

* Do not store any content or make any modifications in /libs folder. Create overlays in /app folders to extend or overwrite default functionalities.  

* When you create packages to move content, ensure package filter paths are correct and only required paths are mentioned. 

* Do not store any content or make any modifications in /libs folder. Create overlays in /app folders to extend or overwrite default functionalities.  

* Define correct dependencies for the packages to force a pre-determined installation order/sequence. 

* Do not create any referenceable node in /libs or /apps.  

### Planning for authoring environment {#planning-for-authoring-environment}

Once you have your AEM project set up, define strategy for authoring and customizing adaptive forms templates and components.

* An adaptive form template is a specialized AEM page that defines structure and the header-footer information of an adaptive form. A template has preconfigured layouts, styles, and basic structure for an adaptive form. AEM Forms provides out-of-the-box templates and components that you can use to author adaptive forms. However, you can create custom templates and components as per your requirements. It is recommended to gather requirements for additional templates and components you will need in your adaptive forms. For details, see [Customizing adaptive forms and components](/help/forms/using/adaptive-forms-best-practices.md#customize-components).
* It is recommended to upload the form packages using the Form Manager user interface instead of the CRX Package Manager user interface, as uploading packages via CRX Package Manager may sometimes lead to anomalies.
* AEM Forms lets you create adaptive forms based on the following form models. The form models act as interface for data exchange between a form and AEM system and provide an XML-based structure for data flow within and outside an adaptive form. Also, the form models impose rules and constraints on adaptive forms in the form of schema and XFA constraints.

    * **None**: Adaptive forms created with this option do not use any form model. The data XML generated from such forms has flat structure with fields and corresponding values.
    * **XML or JSON schema**: XML and JSON schemas represent the structure in which data is produced or consumed by the back-end system in your organization. You can associate a schema to an adaptive form and use its elements to add dynamic content to the adaptive form. The elements of the schema are available in the Data Model Object tab of the content browser for authoring adaptive forms. You can drag-drop the schema elements to build the form.
    * **XFA form template**: It is an ideal form model if you have investments in XFA-based HTML5 forms. It provides a direct way to convert your XFA-based forms into adaptive forms. Any existing XFA rules are retained in the associated adaptive forms. The resulting adaptive forms support XFA constructs, such as validations, events, properties, and patterns.
    * **Form Data Model**: It is a preferred form model if you are looking to integrate your backend systems like databases, web services, and AEM user profile to prefill adaptive forms and write submitted form data back into the backend systems. A Form Data Model editor lets you define and configure entities and services in a form data model that you can use to create adaptive forms. For more information, see [AEM Forms Data Integration](/help/forms/using/data-integration.md).

It is important to carefully choose the data model that not only suits your requirements but extends your existing investments in XFA and XSD assets, if any. Use the XSD Model to create form templates because the generated XML contains data as per XPATH defined by schema. Using XSD Model as a default choice for Form Data Model also helps because it decouples form design from back end system that processes and consumes data and it improves the performance of form because of one to one mapping of form field. Also, BindRef of the field can be made the XPATH of its data value in XML.

For more information, see [Create an adaptive form](/help/forms/using/creating-adaptive-form.md).

* There are some common sections across adaptive forms. You can identify them and define a strategy to promote content reuse. Adaptive forms let you create stand-alone fragments and reuse them across forms. You can also save a panel in an adaptive form as a fragment. Any change in a fragment is reflected in all associated forms. It helps you reduce the authoring time and ensures consistency across forms. In addition, the use of fragments makes adaptive forms lightweight resulting in improved authoring experience, especially of large forms. For more information, see [Adaptive form fragments](/help/forms/using/adaptive-form-fragments.md).

### Customizing adaptive forms and components {#customize-components}

* AEM Forms provides out-of-the-box adaptive form templates that you can use to create adaptive forms. You can also create your own templates. AEM provides static and editable templates.

    * Static templates are defined and configured by developers.
    * Editable templates are created by authors using template editor. The template editor lets you define a basic structure and initial content in a template. Any modification in the structure layer is reflected in all forms using that template. The initial content may include pre-configured theme, prefill service, submit action, and so on. However, these settings can be modified for a form using the form editor. For more information, see [Adaptive form templates](/help/forms/using/template-editor.md).

* For styling a specific field or panel instance, use [inline styling](/help/forms/using/inline-style-adaptive-forms.md). Alternatively, you can define a class in a CSS file and specify the class name in the CSS Class property of the component.
* Include a client library in a component to consistently apply styles across adaptive forms or fragments that use that component. For more information, see [Create an adaptive form page component](/help/forms/using/custom-adaptive-forms-templates.md).
* Apply styles defined in a client library to select adaptive forms by specifying the path to the client library in the CSS file path field in the adaptive form container properties.
* To create a client library of your styles, you can configure the custom CSS file in the Theme Editor base clientlib or in the Form Container properties.
* Adaptive forms provide panel layouts, such as responsive, tabbed, accordions, and wizard, to control how form components are laid out in a panel. You can create custom panel layouts and make them available for use by form authors. For more information, see [Creating custom layout components for adaptive forms](/help/forms/using/custom-layout-components-forms.md).
* You can also customize specific adaptive form components like fields and panel layout.

    * Use the [Overlay](/help/sites-developing/overlays.md) functionality of AEM to modify a copy of a component. It is not recommended to modify default components.
    * To customize the layout of out-of-the-box adaptive form components in /libs, [create custom layout components](/help/forms/using/custom-layout-components-forms.md) in addition to the [default layouts](/help/forms/using/layout-capabilities-adaptive-forms.md).
    * Introduce custom interactivities by creating custom widgets or appearances. It is not recommended to modify default components. For more information, see [Appearance framework](/help/forms/using/introduction-widgets.md).

* See [Handling personally identifiable information](/help/forms/using/adaptive-forms-best-practices.md#p-handling-personally-identifiable-information-p) for recommendations on handling PII data.

### Creating Form Templates 

You can create an adaptive form using the form templates enabled in **Configuration Browser**. To enable the form templates, see [Creating Adaptive Form Template](https://experienceleague.adobe.com/docs/experience-manager-learn/forms/creating-your-first-adaptive-form/create-adaptive-form-template.html?lang=en).

The form templates can also be uploaded from Adaptive Form packages that are created on another author machine. Form templates are  made available by installing [aemforms-references-* packages](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html?lang=en). Some of the best practices recommended are:

* The **nosamplecontent** runmode is recommended only for author and not for the publish nodes.
* Authoring of assets such as adaptive form, themes, templates, or cloud configurations are performed over Author nodes only, which can be published at the configured Publish nodes.
For more information, see [Publishing and unpublishing forms and documents](https://experienceleague.adobe.com/docs/experience-manager-65/forms/publish-process-aem-forms/publishing-unpublishing-forms.html?lang=en)
* Forms addon package is required for Authoring and for Publishing to support the document service operations; hence it can be considered as a dependency. 
If you only want Forms related sample template, themes, and DOR packages, then you can download them from [aemforms-references-* packages](https://experienceleague.adobe.com/docs/experience-manager-65/forms/publish-process-aem-forms/publishing-unpublishing-forms.html?lang=en).

For further information, see the best practices in [Introduction to authoring adaptive forms](/help/forms/using/introduction-forms-authoring.md).

## Author adaptive forms {#author-adaptive-forms}

### Using touch-optimized UI for authoring {#using-touch-optimized-ui-for-authoring}

* Use Objects browser in the sidebar to quickly access fields deep down in the form hierarchy. You can use the search box to search for objects in the form or objects tree to navigate from one object to another.
* To view and edit the properties of a component in the components browser in the sidebar, select the component and click ![cmppr-1](assets/cmppr-1.png). You can also double-click a component to view its properties in the properties browser.
* Use keyboard shortcuts to take quick actions on your forms. See [AEM Forms Keyboard Shortcuts](/help/forms/using/keyboard-shortcuts.md).

* Adaptive form components are recommended for use only in adaptive form pages. The components have dependency on their parent hierarchy. Hence, do not use them in an AEM page.

Also, see component descriptions and best practices in [Introduction to authoring adaptive forms](/help/forms/using/introduction-forms-authoring.md).

### Using rules in adaptive forms {#using-rules-in-adaptive-forms}

AEM Forms provides a [rule editor](/help/forms/using/rule-editor.md) that lets you create rules to add dynamic behavior to adaptive form components. Using these rules, you can evaluate conditions and trigger actions on components, such as show or hide fields, calculate values, change drop-down list dynamically, and so on.

Rule editor provides a visual editor and a code editor for writing rules. Consider the following when writing rules using the code editor mode:

* Use meaningful and unique names for form fields and components to avoid any possible conflicts while writing rules.
* Use `this` operator for a component to refer to itself in a rule expression. It ensures that the rule remains valid even if the component name changes. For example, `field1.valueCommit script: this.value > 10`.

* Use component names when referring to other form components. Use the `value` property to fetch the value of a field or component. For example, `field1.value`.

* Refer components by relative unique hierarchy to avoid any conflict. For example, `parentName.fieldName`.

* When handling complex or commonly used rules, consider writing business logic as functions in a separate client library that you can specify and reuse across adaptive forms. The client library should be a self-contained library and should not have any external dependencies, except on jQuery and Underscore.js. You can also use the client library to enforce [server-side revalidation](/help/forms/using/configuring-submit-actions.md#server-side-revalidation-in-adaptive-form) of submitted form data.
* Adaptive forms provide a set of APIs that you can use to communicate with and perform actions on adaptive forms. Some of the key APIs are as follows. For more information, see [JavaScript Library API reference for Adaptive Forms](https://adobe.com/go/learn_aemforms_documentation_63).

    * `guideBridge.reset()`: Resets a form.
    * `guideBridge.submit()`: Submits a form.
    * `guideBridge.setFocus(somExp, focusOption, runCompletionExp)`: Sets focus to a field.
    * `guideBridge.validate(errorList, somExpression, focus)`: Validates a form.
    * `guideBridge.getDataXML(options)`: Gets form data as XML.
    * `guideBridge.resolveNode(somExpression)`: Gets a form object.
    * `guideBridge.setProperty(somList, propertyName, valueList)`: Sets property of a form object.
    * In addition, you can use the following field properties:

        * `field.value` to change value of a field.
        * `field.enabled` to enable/disable a field.
        * `field.visible` to change visibility of a field.

* Adaptive form authors may need to write JavaScript code to build business logic in a form. While JavaScript is powerful and effective, it is likely that it could compromise on security expectations. Therefore, you must ensure that the form author is a trusted persona and there are processes to review and approve the JavaScript code before a form is put into production. Administrator can restrict the access to rule editor access to user groups based on their role or function. See [Grant rule editor access to select user groups](/help/forms/using/rule-editor-access-user-groups.md).
* You can use expressions in rules to make adaptive forms dynamic. All the expressions are valid JavaScript expressions and use adaptive forms scripting model APIs. These expressions return values of certain types. For more information about expressions and best practices around them, see [Adaptive form expressions](/help/forms/using/adaptive-form-expressions.md).

* Adobe recommends using JavaScript synchronous operations over asynchronous ones when creating rules with the Rule editor. Use of asynchronous operations is strongly discouraged. However, if you find yourself in a situation where asynchronous operations are unavoidable, it is essential to implement JavaScript Closure functions. By doing so, you can effectively safeguard against any potential race conditions, ensuring your rule implementations deliver optimal performance and maintain stability throughout. 

     For example, let's assume we need to fetch data from an external API and then apply some rules based on that data. We use a closure to handle the asynchronous API call and ensure that the rules are applied after the data is fetched. Here is the sample code: 

    ```JavaScript 

         function fetchDataFromAPI(apiEndpoint, callback) {
          // Simulate asynchronous API call with setTimeout
          setTimeout(() => {
            // Assuming the API call is successful, we receive some data
            const data = {
              someValue: 42,
            };
            // Invoke the callback with the fetched data
            callback(data);
          }, 2000); // Simulate a 2-second delay for the API call
        }
        // Rule implementation using Closure
        function ruleImplementation(apiEndpoint) {
          // Using a closure to handle the asynchronous API call and rule application
          // say you have set this value in street field inside address panel
          var streetField = address.street;
          fetchDataFromAPI(apiEndpoint, (data) => {
            streetField.value = data.someValue;
          });
        }
        // Example usage of the rule implementation
        const apiEndpoint = "https://example-api.com/data";
        ruleImplementation(apiEndpoint);


    ```

    In this example, `fetchDataFromAPI` simulates an asynchronous API call using `setTimeout`. Once the data is fetched, it invokes the provided callback function, which is the closure to handle the subsequent rule application. The `ruleImplementation` function contains the rule logic.


### Working with themes {#working-with-themes}

Adaptive for themes let you create reusable styles that can be applied across forms for consistent look and styling. Use Themes to define styling for form components and panels. Some best practices around themes are as follows:

* Use asset library for quick application of text styles, background and images. When a style is added in the asset library, it is available for other themes and in the style mode of the form editor.
* Apply global settings like font and page background using page-level selector.
* Use client libraries to import existing or advanced styling into your themes.
* You can override styling for specific fields, panels, or buttons in a form style layer.
* If a theme does not fulfill your styling requirement, you can use predefined classes such as guideFieldNode, guideFieldLabel, guideFieldWidget, and guidePanelNode to apply common style across forms.

For more information, see [Themes](/help/forms/using/themes.md).

### Optimizing performance of large and complex forms {#optimizing-performance-of-large-and-complex-forms}

Form authors and end users typically face performance issues when loading large forms in authoring mode or at runtime. As number of objects (fields and panels) in form increases, the authoring and runtime experience starts degrading. It also prevents multiple authors to collaborate and author a form simultaneously.

Consider the following best practices to overcome performance issues with large forms:

* It is recommended to create adaptive forms using XSD form data model even when converting an XFA to adaptive form, if possible.
* Include only those fields and panels in adaptive forms that capture information from the user. Consider keeping static content minimal or use URLs to open them in a separate window.
* While every form is designed for a specific purpose, there are some common segments in most forms. For example, personal details, address, employment details, and so on. Create [adaptive form fragments](/help/forms/using/adaptive-form-fragments.md) for common form elements and sections and use them across forms. You can also save a panel in an existing form as a fragment. Any change in a fragment is reflected in all associated adaptive forms. It promotes collaborative authoring as multiple authors can work simultaneously on different fragments that make up a form.

    * Similar to adaptive forms, it is recommended that all fragment-specific styling and custom scripts are defined in the client library using the fragment container dialog. Also, try creating self-sufficient fragments that do not depend on objects outside it.
    * Avoid using cross-fragments scripting. If there's any object outside the fragment that you must refer to, try to make that object a part of the parent form. If the object must still reside in another fragment, refer to it by its name in the script.

* Use Save and Resume with auto-save to save the adaptive form periodically and enable users to revisit later to complete the form.
* Configure fragments to load lazily. At runtime, fragment marked to load lazily are rendered only when they are required. It significantly reduces the load time for large forms. It is also supported in fragments with repeatable panels. For more information, see [Configure lazy loading](/help/forms/using/lazy-loading-adaptive-forms.md).

    * Do not configure lazy loading on fragments in a responsive grid layout or in the first panel.
    * File attachment and Terms and conditions components are not supported in lazily loaded fragments.
    * Mark a value in a lazy loaded panel as Use Value Globally if that value is used in some other part the form so that the value is available for use when the containing panel is unloaded.
    * Consider writing visibility rules for fragments that should show or hide based on a condition.
* Set the value of the **Number of calls per request** in the **Apache Sling Main Servlet** to a fairly large number. It enables the Forms server to allow additional calls. The configuration displays a default value of 1500. The value, 1500 calls, is for other Experience Manager components like Sites and Assets. The default value set of adaptive forms is 20000. If you encounter the `too many calls` error in logs or the form fails to render, try increasing the value to a large number to resolve the issue. If the number of calls are exceeding 20000, that means the form is complex and it might take some time to render the form in browser. This only happens for the first time the form is loaded, after that the form is cached and once the form is cached, there is no significant impact on performance.

### Prefilling adaptive forms {#prefilling-adaptive-forms}

You can prefill adaptive form fields with data fetched from backend to help users quickly fill the form and avoid typing mistakes.

* AEM Forms provides a prefill service to read data from a pre-defined data XML file and prefill the fields of an adaptive form with the content in the prefill XML file.
* The prefill data XML must be compliant with the schema of the form model associated with the adaptive form.
* Include `afBoundedData` and `afUnBoundedData` sections in the prefill XML to prefill both bound and unbound fields in an adaptive form.

* For adaptive forms based on form data model, AEM Forms provides out-of-the-box Form Data Model Prefill Service. The prefill service queries data sources for data model objects in the adaptive form and prefills field values when rendering the form.
* You can also use the file, crx, service, or http protocols prefill adaptive forms.
* AEM Forms supports custom prefill services that you can plug in as an OSGi service to prefill adaptive forms.

For more information, see [Prefill adaptive form fields](/help/forms/using/prepopulate-adaptive-form-fields.md).

### Signing and submitting adaptive forms {#signing-and-submitting-adaptive-forms}

Adaptive forms require Submit actions to process user-specified data. A Submit action determines the task performed on the data that you submit using an adaptive form.

* There are several submit actions available out-of-the-box in adaptive forms. For details, see [Configuring the Submit action](/help/forms/using/configuring-submit-actions.md).
* You can write a custom submit action if the default submit actions do not fulfill your use case. For more information, see [Writing custom Submit action for adaptive forms](/help/forms/using/custom-submit-action-form.md).
* Include server-side validations to prevent submission of invalid data submission.

You can use multi-sign experience of Adobe Sign in adaptive forms. Consider the following when configuring Adobe Sign in adaptive forms. For details, see [Using Adobe Sign in an adaptive form](/help/forms/using/working-with-adobe-sign.md).

* Adobe Sign enabled adaptive form is submitted only after all the signers have signed the form. Forms appear in Pending Sign state until the form is signed by all signers.
* You can configure in-form signing experience or redirect signers to a signing page on submission.
* Configure sequential or parallel signing experience, as appropriate.

### Generating document of record {#generating-document-of-record}

A document of record (DoR) is a flattened PDF version of an adaptive form that you can print, sign, or archive.

* Depending on the form data model an adaptive form is based on, you can configure a template for DoR as follows:

    * **XFA form template**: Use the associated XDP file as the DoR template.
    * **XSD schema**: Use the associated XFA template that uses the same XML schema as used by the adaptive form.
    * **None**: Use auto-generated DoR.

* Configure header, footer, images, color, font, and so on, right from the Document of Record tab of the adaptive form editor.
* Use `DoRService` to generate the DoR programmatically.
* Exclude hidden fields from the DoR.
* Use `afAcceptLang` request parameter to view DoR in another locale.

### Debugging and testing adaptive forms {#debugging-and-testing-adaptive-forms}

[AEM Chrome Plug-in](https://adobe-consulting-services.github.io/acs-aem-tools/aem-chrome-plugin/) is a browser extension for Google Chrome that provides tools for debugging adaptive forms. Form authors and developers can use these tools to:

* Identify bottlenecks and optimize performance of form rendering
* Debug keywords and bindRef errors in the form
* Enable and configure logs
* Debug rules and scripts in the form
* Explore and learn about guideBridge APIs

For more information, see [AEM Chrome Plug-in - Adaptive Form](https://adobe-consulting-services.github.io/acs-aem-tools/aem-chrome-plugin/adaptive-form/).

### Validating adaptive forms on AEM server {#validating-adaptive-forms-on-aem-server}

Server-side validations are required to prevent any attempts to bypass validations on the client and any possible compromise of data submissions and business rules violations. Server-side validations are executed on server by loading the required client library.

* Include functions in a client library for validating expressions in adaptive forms and specify the client library in the adaptive forms container dialog. For more information, see [Server-side revalidation](/help/forms/using/configuring-submit-actions.md#p-server-side-revalidation-in-adaptive-form-p).
* Server-side validation validates the form model. It is recommended to create a separate client library for validations and not mix it with other things like HTML styling and DOM manipulation in the same client library.

### Localizing adaptive forms {#localizing-adaptive-forms}

AEM provides translation workflows that you can use to localize adaptive forms. For information, see [Using AEM translation workflow to localize adaptive forms](/help/forms/using/using-aem-translation-workflow-to-localize-adaptive-forms.md).

Some best practices when localizing adaptive forms are as follows:

* Use adaptive form fragments for common elements across forms and localize fragments. It ensures that you localize a fragment once and it reflects in all forms where the localized fragment is used.
* Any modifications like adding a new component or applying a script in a localized form are not localized automatically. Therefore, you must finalize a form before localizing it to avoid multiple localization cycles.
* Use `afAcceptLang` request parameter to override the browser locale and render the form in the specified locale. For example, the following URL is forced to render the form in Japanese locale, irrespective of the locale specified in the browser setting:

  `https://'[server]:[port]'/<contextPath>/<formFolder>/<formName>.html?wcmmode=disabled&afAcceptLang=ja`

* AEM Forms currently supports localization of adaptive forms content in English (en), Spanish (es), French (fr), Italian (it), German (de), Japanese (ja), Portuguese-Brazilian (pt-BR), Chinese (zh-CN), Chinese-Taiwan (zh-TW), and Korean (ko-KR) locales. However, you can add support for new locales for adaptive forms at runtime. For more information, see [Supporting new locales for adaptive forms localization](/help/forms/using/supporting-new-language-localization.md).

## Prepare forms project for production {#prepare-forms-project-for-production}

### Adding forms processing server {#adding-forms-processing-server}

You can configure an additional instance of AEM Forms server that resides behind the firewall in a secured zone. You can use this instance for:

* **Batch processing**: jobs that are recurring or scheduled in batches with heavy load. For example, printing statements, generating correspondences, and using document services like PDF Generator, Output, and Assembler.
* **Storing PII data**: Save PII data on the processing server. It is not required if you are already using custom storage provider for storing PII data.

### Moving project to another environment {#moving-project-to-another-environment}

You often need to move your AEM projects from one environment to another. Some of the key things to remember when moving are as follows:

* Take backup of your existing client libraries, custom code, and configurations.
* Deploy product packages and patches manually and in the specified order in the new environment.
* Deploy project-specific code packages and bundles manually and as a separate package or bundle on the new AEM server.
* (*AEM Forms on JEE only*) Deploy LCAs and DSCs manually on Forms Workflow server.
* Use [Export-Import](/help/forms/using/import-export-forms-templates.md) functionality to move assets to the new environment. You can also configure the replication agent and publish the assets.
* When you upgrade, replace all the deprecated APIs and features with new APIs and features.  

### Configuring AEM {#configuring-aem}

Some best practices to configure AEM to improve the overall performance are as follows:

* Enable HTML client library compression for JavaScript and CSS from Felix Console. 
* Cache all client libraries at `/etc.clientlibs/fd` and any additional custom client libraries on AEM dispatcher to increase the responsiveness and security of your published forms. For more information, see [Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher.html).

* Do not cache `/content/forms/af/` and `/content/dam/formsanddocuments/*` paths. for detailed information about configuring adaptive forms caching, see [Caching adaptive forms](/help/forms/using/configure-adaptive-forms-cache.md).

* Enable HTML via web server compression module. For more information, see [Performance tuning of AEM Forms server](/help/forms/using/performance-tuning-aem-forms.md).
* Increase calls per request configuration for large forms. See [Optimizing performance of large and complex forms](/help/forms/using/adaptive-forms-best-practices.md#optimizing-performance-of-large-and-complex-forms).
* Create [custom error pages shown by error handler](https://experienceleague.adobe.com/docs/experience-manager-65/developing/platform/customizing-errorhandler-pages.html).
* Secure AEM Forms server.

    * Use `nosamplecontent` run mode to ensure there are no sample content and sample users deployed on the production server. See [Running AEM in Production Ready Mode](/help/sites-administering/production-ready.md).

* Keep the heap size to a minimum of 8 GB. For other settings, see [Performance tuning of AEM Forms server](/help/forms/using/performance-tuning-aem-forms.md).
* Use service user sessions instead of admin sessions for executing service-level tasks. For more information, see [Service authentication](https://sling.apache.org/documentation/the-sling-engine/service-authentication.html).

>[!VIDEO](https://vimeo.com/)

### Configuring external storage for drafts and submitted forms data {#external-storage}

In a production environment, it is recommended not to store submitted form data in AEM repository. The default implementation of Forms Portal Store, Store Content, and Store PDF submit actions store form data in AEM repository. These submit actions are meant only for demonstration purposes. Also, the Save and Resume and Auto Save features use portal storage by default. Therefore, consider the following recommendations:

* **Storing draft data**: If you are using the Draft feature of adaptive forms, you should implement a custom Service Provide Interface (SPI) to store draft data in more secure storage like database. For more information, see [Sample for integrating drafts & submissions component with database](/help/forms/using/integrate-draft-submission-database.md).

* **Storing submission data**: If you are using Form Portal Submit Store, you should implement a custom SPI to store submission data in a database. See [Sample for integrating drafts & submissions component with database](/help/forms/using/integrate-draft-submission-database.md) for a sample integration.

  You can also write a custom submit action that stores form data and attachment in secure storage. See [Writing custom Submit action for adaptive forms](/help/forms/using/custom-submit-action-form.md) for more information.

* **Length of draft ID**: When you save an adaptive form as a draft, a draft ID gets generated to uniquely identify the draft. The minimum value for the length of the draft ID field is 26 characters. Adobe recommends setting the draft ID length to 26 or more characters.

### Handling personally identifiable information {#handling-personally-identifiable-information}

One of the key challenges for organizations is how to handle personally identifiable (PII) data. Some best practices that will help you handle such data are as follows:

* Use a secure, external storage like database to store data from draft and submitted forms. See [Configuring external storage for drafts and submitted forms data](/help/forms/using/adaptive-forms-best-practices.md#external-storage).
* Use Terms and Conditions form component to take explicit consent from user before enabling auto save. In this case, enable auto save only when user agrees to the conditions in Terms and Conditions component.

## Choose the Rule Editor, Code Editor, or Custom Client Libs for your Adaptive Form {#RuleEditor-CodeEditor-ClientLibs}

### Rule editor {#rule-editor}

<!--The AEM Forms Rule Editor offers predefined functions for defining rules in adaptive forms without extensive programming. It facilitates the implementation of conditional logic, data validation, and integration with external sources. This visual interface is especially valuable for business users and form designers, enabling them to create dynamic and complex rules with ease, here we discusss few use cases where rule editor allows you to:-->

The AEM Forms Rule Editor provides a visual interface for creating and managing rules, reducing the need for extensive coding. It can be especially useful for business users or form designers who may not have advanced programming skills but need to define and maintain business rules within the forms, here we discuss few use cases where rule editor allows you:

* <!-- Allows you --> To define business rules for your forms without the need for extensive programming.
* <!-- Use the Rule Editor when you need --> To implement conditional logic within your forms. This includes showing or hiding form elements, altering field values based on certain conditions, or dynamically changing the behavior of your forms.
* <!--When you want --> To enforce data validation rules on form submissions, the Rule Editor can be used to define validation conditions.
* <!-- When you need --> To integrate your forms with external data sources (FDM) or services, the Rule Editor can help define rules for fetching, displaying, or manipulating data during form interactions.
* <!-- If you want -->To create dynamic and interactive forms that respond to user actions, the Rule Editor allows you to define rules that govern the behavior of form elements in real time.

Rule Editor is available for both AEM Forms Foundation Components and Core Components.

### Code editor {#code-editor}  

Code Editor is a tool within Adobe Experience Manager (AEM) Forms that allows you to write custom scripts and code for more complex and advanced functionality in your forms, here we discuss few use cases:

* When you need to implement custom client-side logic or behavior that goes beyond the capabilities of the AEM Forms Rule Editor. The Code Editor allows you to write JavaScript code to handle complex interactions, calculations, or validations.
* If your form requires server-side processing or integration with external systems, you can use the Code Editor to write custom server-side script. You can access guideBridge API in code editor to implement any complex logic on form events and objects.
* When you require highly customized user interfaces that go beyond the standard capabilities of AEM Forms components, the Code Editor allows you to implement custom styles, behaviors, or even create custom form components.
* If your form involves asynchronous operations such as asynchronous data loading, you can use the Code Editor to manage these operations through custom asynchronous JavaScript code.

It's important to note that using the Code Editor requires a good understanding of JavaScript and AEM Forms architecture. Additionally, when implementing custom code, ensure that you follow best practices, adhere to security guidelines, and thoroughly test your code to prevent potential issues in production environments. You can implement a callback for FDM using code editor.

Code Editor is available for AEM Forms Foundation Component only. For Adaptive Form Core Components, you can use custom functions to create your own form rules, described in the next section.

### Custom Functions {#custom-client-libs}

Using custom client libraries in AEM Forms (Adobe Experience Manager Forms) can be beneficial in various scenarios to enhance the functionality, styling, or behavior of your forms. Here are some situations where using custom client libraries might be appropriate:

* If you need to implement a unique design or branding for your forms that go beyond the capabilities of the default styling options provided by AEM Forms, you may choose to create custom client libraries to control the look and feel.
* When you require custom client-side logic, reusability of methods across multiple forms or behavior that cannot be achieved through the standard AEM Forms features. This could include dynamic form interactions, custom validation, or integration with third-party libraries.
* To improve the performance of your forms by optimizing and minifying client-side resources. Custom client libraries can be used to bundle and compress JavaScript and CSS files, reducing the overall page load time.
* When you need to integrate additional JavaScript libraries or frameworks that are not included in the default AEM Forms setup. This might be necessary for features like enhanced date pickers, charts, or other interactive components.

Before you decide to use custom client libraries, it's important to consider the maintenance overhead, potential conflicts with future updates, and adherence to best practices. Ensure that your customizations are well-documented and tested to avoid issues during upgrades or when collaborating with other developers.

>[!NOTE]
> Custom Function is available for both AEM Forms Foundation Components and Core Components.

**Advantages of Custom Functions:**

**Custom Functions** provide a notable advantage over the **Code Editor** because it provide a clear separation between content and code which enhances collaboration and streamlines workflows. It is recommended to use custom functions for the following advantages:

* **Seamlessly use versioning control like Git:**
   * The isolation of code from content significantly reduces Git conflicts during content management and promotes a well-organized repository.
   * Custom Functions is valuable for projects with multiple contributors working simultaneously.

* **Technical Benefits:**
   * Custom Functions offer modularity and encapsulation.
   * Modules can be developed, tested, and maintained independently.
   * Enhances code reusability and maintainability.

* **Efficient Development Process:**
   * Modularity allows developers to focus on specific functionalities.
   * Lowers the burden of developers by reducing the complexities of the entire codebase for a more efficient development process.



