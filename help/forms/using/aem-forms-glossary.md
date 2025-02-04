---
title: AEM Forms Glossary
description: AEM Forms Glossary provides a comprehensive list of key terms, definitions, and concepts used in Adobe Experience Manager Forms (AEM Forms), helping users understand and work with adaptive forms and related features.
feature: Adaptive Forms
role: Admin, User, Developer
---
# AEM Forms Glossary

## [Adaptive Forms](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/create-an-adaptive-form-on-forms-cs/creating-adaptive-form)

Dynamic, responsive forms that adjust their layout and presentation based on the user's device and input, enhancing user experience across various platforms. Includes conditional logic, dynamic data binding, and rule-based behavior.

## [AEM Forms Add-On Package](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/install-aem-forms/osgi-installation/installing-configuring-aem-forms-osgi)

An application deployed into Adobe Experience Manager (AEM) as a package, containing services (API providers) and servlets or JSPs managed by the AEM Sling framework.

## [AEM Forms on JEE](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/install-aem-forms/jee-installation/aem-forms-jee-supported-platforms)

A deployment option of AEM Forms that leverages Java Enterprise Edition (JEE) servers, providing enterprise-level scalability, transaction management, and support for complex enterprise workflows.

## [AEM Forms on OSGi](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/implementing/deploying/introduction/technical-requirements)

AEM Forms on the OSGi environment is standard AEM Author or AEM Publish with AEM Forms package deployed on it. You can run AEM Forms on OSGi in a single server environment, Farm, and clustered setups. Cluster setup is available only for AEM Author instances.

## [Adobe Sign in AEM Forms](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/adaptive-forms-advanced-authoring/adobe-sign-integration-adaptive-forms)  

A RESTful service for secure and seamless digital signature workflows. It integrates with AEM Forms using OAuth-based authentication, enabling automated signature collections and real-time tracking.

## [AEM Forms Document Services 6.5](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-document-services/overview-aem-document-services)

APIs provided by AEM Forms' web layer for remote consumption by HTTP-based clients, such as the forms mobile SDK.Functionalities within AEM Forms that enable the creation, assembly, distribution, and archiving of PDF documents, addition of digital signatures, and decoding of Barcoded Forms.

| **Service Name**|**Description**| **Documentation Link**|
|------------------------------|---------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| **Forms Service**| Render PDF forms using templates and XML, integrate form data for import/export, and support fragment-based rendering. | [Forms Service documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-document-services/output-service) |
| **Output Service**           | Generates documents by merging data with templates in formats like PDF, PCL, or PostScript.      | [Output Service documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-document-services/output-service) |
| **Assembler Service**        | Combines, rearranges, validates, and augments PDF and XDP documents.                             | [Assembler Service documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-document-services/assembler-service) |
| **ConvertPDF Service**       | Converts PDF documents to PostScript or image formats like PNG, JPEG, or TIFF.                   | [ConvertPDF Service documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-document-services/using-convertpdf-service) |
| **Barcoded Forms Service**   | Extracts data from barcodes in TIFF and PDF files to automate data capture processes.             | [Barcoded Forms Service documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-document-services/using-barcoded-forms-service) |
| **DocAssurance Service**     | Encrypts, decrypts, digitally signs, and applies document security policies to PDFs.              | [DocAssurance Service documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-document-services/overview-aem-document-services#doc-assurance-service) |
| **PDF Generator Service**    | Converts native file formats (for example: Microsoft Word, Excel) into PDF documents.                   | [PDF Generator Service documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-document-services/aem-document-services-programmatically#pdfgeneratorservice) |

## [Forms as a Cloud Service Communication APIs](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/using-communications/aem-forms-cloud-service-communications-introduction)

AEM Forms as a Cloud Service provides advanced tools for managing forms and communication workflows, supporting seamless digital form creation, data capture, and personalized communications. Cloud Communication APIs provide secure on-demand and batch document generation, manipulation, validation, and integration with external systems via HTTP, ensuring streamlined and secure operations.

| **Service Name**| **Description**|**Documentation Link**|
|-------------------------------|------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| **Document Generation**        | Combine a template (XFA or PDF) with XML data to generate documents in PDF and Print Formats like PS, PCL, DPL, IPL, and ZPL formats.  | [Document Generation documentation](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/using-communications/aem-forms-cloud-service-communications-introduction.html#document-generation) |
| **Document Manipulation**        | Combine, rearrange PDF documents. | [Document Manipulation documentation](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/using-communications/aem-forms-cloud-service-communications-introduction#document-manipulation) |
| **Document Conversion**|Convert a PDF to PDF/A and check PDF/A compliance. | [Document Conversion documentation](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/using-communications/aem-forms-cloud-service-communications-introduction#document-conversion) |
| **Document Assurance**| Add or remove signature fields, sign, certify, encrypt, decrypt, and apply usage rights to PDF documents.| [Document Assurance documentation](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/using-communications/aem-forms-cloud-service-communications-introduction#doc-assurance) |
| **Digital Signatures**| Integrates Adobe Sign for secure e-signing of forms and documents.| [Digital Signatures documentation](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/using-communications/aem-forms-cloud-service-communications-introduction.html#digital-signatures)|


## [AEM Forms Workbench](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/install-aem-forms/jee-installation/install-workbench)

A desktop application for creating, editing, and deploying workflows, as well as managing form-centric business processes. It provides integration with back-end services and systems.

## [Archetype](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/developing/archetype/overview)

A template or pattern in AEM used to generate a new project with a predefined structure, facilitating standardization, quick setup, and adherence to AEM development best practices.

## [Author Instance](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/publish-process-aem-forms/publishing-unpublishing-forms)

The environment where content creators and administrators design, create, and manage content before publishing it. Supports versioning, previewing, and testing.

## [Authoring Frontend](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/install-aem-forms/aem-forms-architecture-deployment#architecture)

A user interface for authoring and managing forms within AEM Forms.

## [Core Components](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/introduction)

Out-of-the-box reusable building blocks for creating forms, including form fields, layout containers, buttons, and other interactive elements.

## [Correspondence Management](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/letters-correspondences/cm-overview)

A module that enables businesses to create, manage, and deliver personalized correspondence using predefined templates, rules, and data sources. Includes letter templates, customer communications, and batch generation.

## [CRX (Content Repository Extreme)](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-aem-forms-workspace/html-workspace-architecture)

The built-in Java Content Repository (JCR) in AEM that stores structured and unstructured data, enabling hierarchical storage of content, templates, and configurations.

## [Data Integration](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/form-data-model/data-integration)

Seamless integration of external data sources, such as databases, web services, or REST APIs, into forms and workflows to enable dynamic and personalized user experiences.

## [Document Fragments](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/letters-correspondences/lists)

Reusable components of documents, such as headers, footers, disclaimers, or clauses, which can be dynamically included in forms or correspondence to ensure consistency.

## [Document of Record (DoR)](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/generate-document-of-record-for-non-xfa-based-adaptive-forms)

A feature in AEM Forms that generates a non-editable, archival version of a submitted form, typically in PDF format, preserving the exact content and layout as a record of the transaction.

## [Form Data Model (FDM)](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/integrate/use-form-data-model/using-form-data-model)

A representation layer that connects adaptive forms to backend data sources, enabling integration with RESTful web services, SOAP services, and OData. FDM allows form authors to map form fields directly to backend data structures, ensuring seamless synchronization of user input with external systems.

## [Form Localization](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/supporting-new-language-localization)

The process of adaptive forms to support multiple languages and regional settings, ensuring that forms are accessible and user-friendly to a diverse audience.

## [Form Portal](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/use-forms-portal/creating-form-portal-page)

Forms Portal components equip Web Developers with components to create and customize a Forms Portal on websites authored using Adobe Experience Manager (AEM). It allows users to discover, access, and submit forms efficiently across web and mobile platforms.

## [Form Rendition and Submission Frontend](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/install-aem-forms/aem-forms-architecture-deployment#architecture)

An end-user interface in AEM Forms that allows users to view and submit forms via a web browser.

## [Form Sets](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/html5-forms/formset-in-aem-forms)

A collection of related forms grouped together to be presented as a single entity to users, allowing for complex data collection processes to be broken down into manageable sections.

## [Forms Designer](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/using-communications/installing-configuring-designer)

A stand-alone application used to design forms template in XDP form and use it in your AEM Forms to generate Document of Record.

## [Interactive Communication](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/getting-started/interactive-communications-overview)

A custom implementation for managing highly personalized, multichannel communications. It combines data from various sources, like CRM or ERP systems, to deliver communications across formats such as web, mobile, email, and print. 

## [JCR (Java Content Repository)](https://experienceleague.adobe.com/en/docs/experience-manager-learn/cloud-service/underlying-technology/introduction-jcr)

A hierarchical, standards-based repository for storing content, configurations, and metadata in AEM, supporting structured and unstructured data storage.

## [PDF Generator](https://experienceleague.adobe.com/en/docs/experience-manager-learn/forms/document-services/using-pdfg-in-aem-forms)

A tool in AEM Forms that converts various file formats (for example: Word, Excel, PowerPoint) into PDF documents and provides features like encryption, watermarking, and merging.

## [Publish Instance](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/publish-process-aem-forms/publishing-unpublishing-forms)

The environment in AEM that serves live content to end-users. It delivers forms, pages, and other digital experiences with optimized performance.

## [Rule Editor](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-core-components/create-an-adaptive-form-on-forms-cs/rule-editor-core-components/rule-editor-core-components)

A visual tool in Adaptive Forms that allows authors to define custom rules and logic for form fields, such as visibility, validation, and data prepopulation, without requiring coding expertise.

## [Scribble Signatures](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/add-components-to-an-adaptive-form/signing-forms-using-scribble)

A feature in AEM Forms that allows users to electronically sign forms by drawing their signature directly on the form using a mouse or touch-enabled device.

## [Web Layer](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/install-aem-forms/aem-forms-architecture-deployment#architecture)

Comprises JSPs or servlets built over common and forms services, providing functionalities such as authoring front-end, form rendition and submission front-end, and REST APIs.

## [Forms-centric workflow](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/workflows/aem-forms-workflow)

A set of automated or manual steps in AEM Forms that manage business processes, such as document approval, content publishing, or user notifications.

## [Custom XCI (XML Configuration Information)](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/administrator-help/configure-forms/specifying-xci-configuration-options) 

In Adobe Experience Manager (AEM) Forms, a Custom XCI (XML Configuration Information) file allows administrators to define specific rendering properties for forms and documents. By configuring XCI settings in the administration console, you can override system defaults with custom options, ensuring tailored processing and presentation of forms.

## [XDP (XML Data Package)](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/manage-administer-aem-forms/get-xdp-pdf-documents-aem)

A file format used in AEM Forms for designing and structuring forms, enabling rendering as PDFs or HTML while supporting dynamic content and interactivity.

## [XFA (XML Forms Architecture)](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/adaptive-forms-basic-authoring/creating-adaptive-form#create-an-adaptive-form-based-on-an-xfa-form-template)

A legacy technology for creating interactive and dynamic PDF forms. XFA forms allow for advanced capabilities, such as dynamic layout adjustments, scripting, and seamless integration with backend systems.

## [XML or JSON Schema](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/adaptive-forms-basic-authoring/creating-adaptive-form#create-an-adaptive-form-based-on-xml-or-json-schema)

A standardized structure used to define the format and organization of XML or JSON data in forms and workflows. These schemas ensure consistent data handling and enable interoperability with external systems.



## [Letters](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/letters-correspondences/create-letter#create-a-letter-template)  

Generated customer communications leveraging AEM Forms Document Services. Letters are created using a combination of XDP templates, data models, and reusable fragments, ensuring scalability in high-volume scenarios.

## [Submit Action in AEM Forms](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/adaptive-forms-basic-authoring/configuring-submit-actions)  

Server-side or client-side actions executed upon form submission. Examples include REST API calls, invoking a workflow, or writing data to a JCR (Java Content Repository).

## [Data Sources](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/form-data-model/configure-data-sources)  

Interfaces for integrating external data into forms, including JDBC for relational databases, REST endpoints for web services, and OData for SAP systems. Managed via AEM Forms Data Integration framework.

## [Adaptive Form Block](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/edge-delivery/build-forms/forms-references/form-components)  

An encapsulation unit that logically groups related components and metadata, enabling dynamic data handling and easy scalability in multi-step forms.

## [Edge Delivery Services](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/edge-delivery/overview)  

Optimized content delivery for AEM Forms ensuring reduced latency for assets like forms, themes, and client libraries where where authors can update and publish content quickly.

## [Forms Integration](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/form-data-model/data-integration)  

Involves connecting AEM Forms to enterprise systems (e.g., SAP, Salesforce) using OSGi bundles and connectors, supporting bidirectional data flows and real-time updates.

## [Custom Component](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/customize-adaptive-forms-core-components) 

A bespoke component extending AEM Forms functionality, developed using Sling Models, Sightly (HTL), and Java. Typically used for unique business logic or advanced client-side interactivity.

## [Themes](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-core-components/create-an-adaptive-form-on-forms-cs/using-themes-in-core-components)  

CSS-driven styling frameworks applied to adaptive forms, utilizing LESS/SASS for preprocessors. Themes ensure compliance with branding guidelines and accessibility standards, you can customize a theme, change its design elements, layout, colors, typography, and sometimes the underlying code.

## [Template](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/sample-themes-templates-form-data-models-core-components)  

Blueprints for adaptive forms, comprising structural elements (fields, layouts) and pre-configured scripts, you can create and customize new templates or use existing out-of-the-box templates.


## [Metadata in AEM Forms](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/manage-administer-aem-forms/manage-form-metadata)
Metadata enables efficient asset categorization and retrieval. AEM Forms includes predefined metadata for each asset type and allows customization. It also provides tools to create, manage, and exchange metadata seamlessly.



## [Form Review](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/create-reviews-forms)  

A workflow-driven feature allowing stakeholders to review adaptive forms, add annotations, and approve changes before publishing. Uses AEM Inbox and Task Management.

## [Adpative Form Versioning](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/adaptive-forms-core-components/add-versioning-reviews-comments)  

Capability to manage multiple versions of a form in the repository, using JCR node versioning. Ensures audit trails and easy rollback for adaptive forms.

## [Adobe Analytics Forms Integration](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/integrate/services/enable-adobe-analytics-adaptive-form-using-experience-cloud-setup-automation)

Provides detailed insights into user interactions (e.g., field drop-offs, time spent per section) using Adobe Analytics, enabling data-driven optimization of form design.

<!--

## **Custom Properties**  

Developer-defined metadata attributes added to components or forms for advanced behaviors, accessed via Sling APIs or Groovy scripts for dynamic processing.

## **Embedding** 

Integrating adaptive forms into AEM Sites or external web pages using `<iframe>` or SPA (Single Page Application) models. Embedding supports seamless session handling and cross-origin resource sharing (CORS).

## **CDN (Content Delivery Network)**  

Distributed networks (e.g., Akamai) used for caching and delivering forms-related resources, ensuring high availability and faster load times for geographically distributed users.
-->

## **Dispatcher**  

An AEM caching and load balancing tool configured to optimize delivery of adaptive forms. Its filter rules ensure secure access control while caching frequently accessed forms and assets.

## **Editors**  

Tools like the Adaptive Forms Editor, Theme Editor, and Rule Editor, enabling developers and content authors to customize forms and their behavior without extensive coding.

## **Responsive UI**  

An implementation of media queries and flexible grids, ensuring adaptive forms render seamlessly across various screen sizes and devices.

## **Custom Functions**  

JavaScript-based utilities or REST microservices that provide additional logic (e.g., complex field validation or data pre-population), extending the out-of-the-box capabilities of AEM Forms.

## **Package Manager**  

AEM's CRX Package Manager facilitates importing/exporting adaptive forms, data schemas, or configurations as .zip files, enabling modular deployment in distributed environments.

## **UE (User Experience)**  

Design principles and optimizations applied in AEM Forms to enhance usability, including accessibility features (ARIA roles, tab navigation) and intuitive layouts.

## **Forms Submission Services**

Back-end services for handling form submissions, integrating with the AEM Workflow engine, third-party APIs, or direct JCR persistence.

<!--

Foundation components
e-signing
adobe sign
letters
submit action
data sources
adaptive form block
edge delivery services
forms integration
custom component 
themes
template 
custom properties
embedding
CDN
Dispatcher
editors
responsive UI
custom functions
package manager
communication APIs
UE
Forms submission services
Form review
Forms Versioning
Adobe analytics forms integration specific

-->

<!--

## **AEM Forms Foundation Components**  
Core reusable elements within AEM Forms, built on Granite UI, enabling developers to create complex forms. They provide robust features like data bindings, field validations, and support for multilingual content.


## **e-Signing**  
An implementation of digital signature standards (e.g., PKCS #7) within AEM Forms, integrated with Adobe Sign APIs to ensure secure and legally binding electronic signatures.

## Workspace

A browser-based interface for users to interact with AEM Forms workflows, tasks, and approvals.

## Sling

A REST-based web framework used in AEM to map request URLs to content resources, enabling efficient content rendering and delivery.

-->