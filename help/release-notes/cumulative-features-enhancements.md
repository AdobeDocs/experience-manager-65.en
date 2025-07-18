---
title: Cumulative Key Features and Enhancements in Adobe Experience Manager 6.5 release.
description: A cumulative list of key features and enhancements made in Adobe Experience Manager 6.5 from the previous eight service pack releases.
content-type: reference
docset: aem65
feature: Release Information
role: User,Admin,Architect,Developer
exl-id: 01fe5b53-2244-445f-a4d0-bd58ea38b611
solution: Experience Manager
---
# Cumulative key features and enhancements

A cumulative list of key features and enhancements in Adobe Experience Manager 6.5 for the previous eight service pack releases.

See also [Adobe Experience Manager 6.5 Latest Service Pack Release Notes](/help/release-notes/release-notes.md).


## AEM 6.5, Service Pack 23&mdash;May 22, 2025

### Forms {#forms-sp23}

* [Accessible Hyperlinks with mixed text styling in Static PDFs](https://helpx.adobe.com/content/dam/help/en/experience-manager/6-5/forms/pdf/using-designer.pdf): Hyperlinks containing mixed text styles in static PDFs are now tagged as a single accessible element. This enhancement simplifies the tag tree structure, improves screen reader navigation, and supports better accessibility compliance. 

* [Updated Supported Platform Matrix](/help/forms/using/aem-forms-jee-supported-platforms.md) 

  The latest version introduces updates to the supported platform matrix, ensuring compatibility with newer technologies. 

    * IBM&reg; Content Manager Client 8.7 

    * MongoDB Enterprise 7.0 

    * MySQL 8.4 

    * Microsoft&reg; SQL Server 2022 

    * Microsoft&reg; SQL Server JDBC Driver 12.8 

    * Red Hat&reg; Enterprise Linux&reg; 9 (Kernel 4.x, 64-bit)

* [Hardened file attachment component](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/file-attachment): As a security measure, the component now prevents submission of files with modified extensions that attempt to bypass allowed file type checks. Such files are blocked during submission to ensure that only valid file types are accepted. 

## AEM 6.5, Service Pack 22&mdash;November 21, 2024

### Sites {#sites}

[The Universal Editor](/help/sites-developing/universal-editor/introduction.md) is now available on AEM 6.5 for headless use cases with the application of a feature pack.

### [!DNL Assets]

The IPTC tab now supports [!UICONTROL Alt Text] and [!UICONTROL Extended Description] text fields. (Assets-34918)

### Forms {#forms-sp22}

#### New GA features in AEM Forms {#ga-aem-forms-sp22}

* Added support to enable font embedding in [Interactive Communications Batch APIs](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/interactive-communications/create-interactive-communication#output-format-print-channel) - Interactive Communications now includes support for embedding Adobe Ming and Adobe Myungjo fonts in PDFs generated through the Batch API. This enhancement ensures accurate text rendering in generated documents, even when using font subsets, providing improved support for multilingual content in PDF outputs.

* [Table of Content API for PDF Accessibility](/help/forms/using/aem-document-services-programmatically.md#auto-tag-pdf-documents-auto-tag-api) - AEM Forms on OSGi now support the new TOC Tag API to enhance PDF for accessibility standards. It makes PDFs more accessible for users with assistive technology.

* [Fragment XDP resolution](/help/forms/using/assembler-service.md#resolve-references-on-crx-repository-resolve-references-on-crx-repository) - AEM Forms on OSGi now resolves Fragment XDPs referenced in Primary XDPs and stored in the AEM CRX Repository.

* [PDF/A compliance enhancements](/help/forms/developing/pdf-a-documents.md#converting-documents-to-pdfa-documents-converting-documents-to-pdf-a-documents) - Now users can convert PDFs to PDF/A formats (1a, 2a, 3a) for archival purposes while ensuring accessibility and verifying compliance with these standards.

* **Support for Auto Sizing of Font for Static PDF documents** - AEM Forms Designer, OutputService, and FormsService now supports auto sizing of fonts for static PDFs. If the user sets the font size 0 for text, numeric, password, or datetime fields, the font size auto-adjusts within these fields without altering the field's overall size. To use the feature, users pass a flag in the custom XCI: `<behaviorOverride>patch-LC-3921991:1</behaviorOverride>`.

#### New Beta features in AEM Forms {#beta-aem-forms-sp22}

The beta feature offers a unique opportunity to you to get exclusive access to cutting-edge innovations, and help shape their development. Interested in enabling a beta feature for your environments? Send an email from your official address to aem-forms-ea@adobe.com with the list of capabilities that you are interested in.

* [hCaptcha](/help/forms/using/integrate-adaptive-forms-hcaptcha.md) and [Cloudflare Turnstile CAPTCHA services](/help/forms/using/integrate-adaptive-forms-turnstile.md): AEM Forms support the following Captcha services:
  * hCaptcha protects forms from bots, spam, and automated abuse by challenging users with a checkbox widget. It ensures that only human users proceed, enhancing security for online transactions.
  * Cloudflare Turnstile offers a security measure that aims to protect forms from automated bots, malicious attacks, spams and unwanted automated traffic. It presents a checkbox on form submission to verify that they are human, before allowing them to submit the form.

* Adaptive Form versioning:
  * [Create multiple versions of an Adaptive Form](/help/forms/using/add-versioning-reviews-comments.md) -  Now users can easily manage variations of existing forms. This process simplifies version control and facilitates comparison for form optimization, all within a single, streamlined workflow.
  * [Compare Adaptive Forms](/help/forms/using/compare-forms-core-components.md): Now users can easily compare two forms to identify differences. It facilitates smooth collaboration by enabling team members to compare revisions and discuss changes efficiently.

## AEM 6.5, Service Pack 21&mdash;June 6, 2024

### [!DNL Assets]

#### Enhancements

The IPTC tab now supports [!UICONTROL Alt Text] and [!UICONTROL Extended Description] text fields. (Assets-34918)

#### Accessibility

* If the processing status of an asset is Failed or Metadata Failed, the captions and audio tracks UI now works appropriately. (Assets-37281)
* When you save an asset metadata and try to edit it, the language name is now displayed. (Assets-37281)

### [!DNL Forms]

* **Support for Oauth Credentials**: A new and easier to use credential for server-to-server authentication, replacing the existing Service Account (JWT) credential. (NPR-41994)
* [Rule Editor enhancements in AEM Forms](/help/forms/using/rule-editor-core-components.md):
  * Support for implementing nested conditions with `When-then-else` functionality.
  * Validate or reset panels and forms, including fields.
  * Support for modern JavaScript features such as let and arrow functions (ES10 support) within the Custom Functions.
* [AutoTag API for PDF Accessibility](/help/forms/using/aem-document-services-programmatically.md#doc-utility-services-doc-utility-services): AEM Forms on OSGi now support the new AutoTag API to enhance PDF for accessibility standards by adding tags: paragraphs, and lists. It makes PDFs more accessible for users with assistive technology.
* **16-bit PNG support**: PDF Generator's ImageToPdf service now supports conversion of PNGs with 16-bit color depth.
* **Apply artifacts to individual text blocks in XDPs**: Forms Designer now lets users configure settings on individual text blocks in XDP files. This ability lets you control the elements that are treated as artifacts in the resulting PDFs. These elements, such as headers and footers, are made accessible for assistive technologies. The key features include marking text blocks as artifacts, and embedding these settings in the XDP metadata. The Forms Output service applies these settings during PDF generation, ensuring proper PDF/UA tagging.
* **AEM Forms Designer is certified with `GB18030:2022` standard**: With the `GB18030:2022` certification, now Forms Designer supports the Chinese Unicode character set that lets you input Chinese characters into all editable fields and dialog boxes.
* [Support for WebToPDF route in JEE Server](/help/forms/using/admin-help/configure-service-settings.md#generate-pdf-service-settings-generate-pdf-service-settings) using the PDF Generator service now supports the WebToPDF route for converting HTML files to PDF documents on JEE. This support is in addition to the existing Webkit and WebCapture (Windows only) routes. While the WebToPDF route is already available on OSGi and extended to JEE. Now, on both JEE and OSGi platforms, the PDF Generator service supports the following routes across different operating systems:
  * **Windows**: Webkit, WebCapture, WebToPDF
  * **Linux&reg;**: Webkit, WebToPDF


## AEM 6.5, Service Pack 20&mdash;February 22, 2024

### [!DNL Assets]

* Dynamic Media now supports lossless HEIC image format for Apple iOS/iPadOS. See [fmt](https://experienceleague.adobe.com/en/docs/dynamic-media-developer-resources/image-serving-api/image-serving-api/http-protocol-reference/command-reference/r-is-http-fmt) in the Dynamic Media Image Serving and Rendering API.
* Multisite Manager (MSM) now supports Experience Fragment structures including folders and subfolders, for efficient bulk rollout of Experience Fragments to Live Copies. 

### [!DNL Forms]

* **Transaction Reporting in AEM Forms on JEE**: Transaction reporting capability has been introduced for AEM Forms on JEE. It enables comprehensive recording of document transactions, such as Conversions, Renditions, and Submissions. This enhancement boosts efficiency and facilitates better record-keeping. The feature is disabled by default. You can enable it from the Admin UI.
* **Enhanced Security with ECDSA Support**: AEM Forms now offer robust support for the Elliptic Curve Digital Signature Algorithm (ECDSA) across both JEE and OSGi stacks. Users can now Sign, Certify, and Verify PDF documents with heightened security. Supported EC curve algorithms include:
  * ECDSA elliptic curve P256 with SHA256 digest algorithm
  * ECDSA elliptic curve P384 with SHA384 digest algorithm
  * ECDSA elliptic curve P512 with SHA512 digest algorithm
* **Seamless Compatibility with Windows 11 for Forms Designer**: AEM Forms Designer now supports Windows 11, ensuring smooth installation and operation. Users can confidently upgrade to Windows 11 without the hassle of reinstalling Forms Designer or worrying about compatibility issues, ensuring uninterrupted workflow.
* **Enhanced Accessibility with Custom "Caption" Role in AEM Forms Designer**: AEM Forms Designer now includes a custom accessibility role called "Caption," empowering users to create XDPs with personalized captioning elements. This feature enhances accessibility by letting users integrate custom captions into their document designs so they can improve inclusivity and user experience.

## AEM 6.5, Service Pack 19&mdash;December 7, 2023

* Enabled Sites Page Editor/Image Component user to reference assets from the remote Assets Cloud Service. (SITES-13448, SITES-13433) 
* AEM now supports server-side sorting for quicker project navigation in the List view. Project nodes are sorted based on the user-selected column before appearing in the interface.

### [!DNL Forms]

* **New Adaptive Form Core Components**: Vertical tabs, Terms & Conditions, and Checkbox are added to enhance the scalability of forms.
  * **[Checkbox component](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/checkbox)**: Adaptive Forms based on Core Components can now include a checkbox component. It allows users to make binary choices, selecting or deselecting a particular option. It typically appears as a small box that can be clicked or tapped to toggle between two states: checked and unchecked. The checkbox is a common form element used to present a yes/no or true/false choice.

  * **[Terms and Conditions component](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/terms-and-conditions)**: Core Component-based Adaptive Forms now include a Terms and Conditions component. Form authors add this section to show users the terms, conditions, or legal agreements for the service, product, or platform. This component is designed to inform users about the rules, regulations, and obligations they are agreeing to by submitting the form.

    ![Vertical tabs, Terms & Conditions and Checkbox components](/help/forms/using/assets/forms-components.png)

  * **[Vertical tabs component](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/vertical-tabs)**: Adaptive Forms based on Core Components can now organize form content into a vertical list of tabs, providing a structured and navigable layout. Vertical tabs in a form enhance the user experience by simplifying navigation and organizing content. They are especially helpful when the form contains multiple sections or complex information.
  
* **[64-bit version of AEM Forms Designer](/help/forms/using/installing-configuring-designer.md)**: The 64-bit version of AEM Forms Designer brings enhanced performance, scalability, and memory management to empower your form creation experience. With the 64-bit architecture, you can tackle even larger and more complex projects with ease, ensuring seamless design workflows and optimized efficiency. Elevate your form design capabilities and embrace the future of AEM Forms Designer with this cutting-edge release.

* **[Connect an Adaptive Forms with Microsoft&reg; SharePoint List](/help/forms/using/configuring-submit-actions.md#submit-to-microsoft&reg;-sharepoint-list)**: AEM Forms provide an out-of-the-box integration to submit forms data directly to SharePoint List, letting you use SharePoint's Lists capabilities. You can configure Microsoft&reg; SharePoint List as a datasource for a Form Data Model and use the Submit using Form Data Model submit action to connect an Adaptive Form with SharePoint List.

* **[Support to configure Document of Record properties for Adaptive Form Fragments](/help/forms/using/generate-document-of-record-for-non-xfa-based-adaptive-forms.md)**: You can now easily customize your Adaptive Form fragments and its fields in the  Adaptive Form editor.

* **64-bit XMLFM**: The 64-bit iteration of XMLFM introduces heightened performance, scalability, and refined memory management. It is the first 64-bit native service deployed on the server-side. By harnessing its inherent capability to access larger memory resources compared to its 32-bit counterpart, XMLFM 64-bit empowers seamless handling of larger rendering workloads. This milestone not only represents a leap in performance but also introduces key enhancements to the native service framework within the AEM Forms Server. This update equips AEM Forms Server to support any 64-bit native service seamlessly.

## AEM 6.5, Service Pack 18&mdash;August 24, 2023

* Assets, Dynamic Media - [Multiple caption and audio track support for videos in Dynamic Media](/help/assets/video.md#about-msma) &mdash; You can now easily add multiple subtitles and multiple audio tracks to a primary video. This capability means that your videos are accessible to a global audience. You can customize a single, published primary video to a global audience in multiple languages and adhere with accessibility guidelines for different geographical regions. Authors can also manage the subtitles and audio tracks from a single tab in the user interface.
* Assets - From Search results, you can now navigate to the folder location that contains an asset to let you perform various asset management tasks. 
* Sites Polaris Picker in Content Fragments has improved performance.
* Enabled Sites Page Editor/Image Component user to reference assets from the remote Assets Cloud Service.
* To find a project in List view quickly, where you may have many projects in your system, Adobe now supports server-side sorting. Project nodes are sorted on the backend based on the column selected by the user before rendering them in the user interface.
* AEM 6.5.18.0 supports MongoDB 5.0 to 6.0.

### [!DNL Forms]

* **[Enhanced error handling with custom error handlers in the rule editor](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/adaptive-forms-advanced-authoring/standard-validation-error-messages-adaptive-forms)** &ndash; You can now invoke a custom function (using Client Library) in response to an error returned by an external service. And, you can provide a tailored response to end users. Or, you can take specific actions for errors returned by a service. For example, you can invoke a custom workflow in the backend for specific error codes or inform the customer that the service is down 

* **[Enhanced Adobe Sign Workflow step](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/workflows/aem-forms-workflow-step-reference#sign-document-step)** &ndash; Adobe Sign workflow step in AEM Workflows is available with the following enhancements.  

   * **Enhanced security with government ID-based authentication for Adobe Sign** &ndash; Adobe Acrobat Sign's Government ID-Based Authentication offers an additional layer of verification. It enables users to authenticate their identity using government-issued IDs (driver's license, national ID, passport). By using trusted identification documents, this enhancement adds an extra level of confidence to the signing process, making it ideal for scenarios that require heightened security, compliance, and user validation. 
   
   * **Enhanced transparency using Audit Trail for Adobe Sign documents** &ndash; Use the Audit Trail feature for detailed insights into the lifecycle of your Adobe Sign documents. With Audit Trail, you can now maintain a comprehensive record of all actions and interactions related to your documents. These actions and interactions include who viewed, edited, or signed the document, along with timestamps for each event. This enhancement is crucial for maintaining compliance, resolving disputes, and ensuring the integrity of your digital agreements.  

 
   * **Expanded the roles for Agreement recipients beyond just the Signer** &ndash; Adobe Acrobat Sign lets you expand the roles for Agreement recipients beyond just the Signer to match their workflow requirements better. When enabled, each recipient in an Agreement has their role individually configurable, with Signer being the default. 

 
* **[AEM Forms on JEE full installer](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/install-aem-forms/jee-installation/aem-forms-jee-supported-platforms)** &ndash; The service pack brings a full installer for AEM Forms on JEE that brings support for multiple new software combinations, including: 
  * Microsoft&reg; Windows Server 2022 
  * Microsoft&reg; Active Directory 2022 
  * Oracle WebLogic 14C on Windows Server 2022
  * Red Hat&reg; JBoss&reg; 7.4.10 
  * MongoDB 6.0 <!-- it was previously MongoDB 4.4 --> 
  * MySQL JDBC Connector 8 

If you are installing or planning to use the latest software for your AEM 6.5 Forms on JEE environment, Adobe recommends using AEM 6.5.18.0 Forms on JEE full installer. To explore the complete list of newly added and deprecated software, refer to the documentation for AEM Forms on JEE or AEM Forms on OSGi. 

## AEM 6.5, Service Pack 17&mdash;May 25, 2023

* **Search experience enhancements** - You can now quickly perform the following operations on the assets that display in the search results:
  * Create a workflow
  * Create a version
  * Relate or Unrelate assets

  You do not need to navigate to the asset location and view its properties to perform these operations.

* **Dynamic Media _Snapshot_** lets you preview image modifiers and Smart Imaging optimizations — such as WebP or AVIF output, bandwidth-aware compression, and Device Pixel Ratio scaling — using test images or Dynamic Media URLs. You can then immediately compare how each setting affects quality and file size.
  See [Dynamic Media Snapshot](https://experienceleague.adobe.com/en/docs/experience-manager-learn/assets/dynamic-media/images/dynamic-media-snapshot).
* **DASH streaming with Dynamic Media** - New protocol (DASH - Dynamic Adaptive Streaming over HTTP) launched for Adaptive Streaming in Dynamic Media video delivery (with CMAF enabled). Available now for all regions.
* **Integration of Experience Manager Sites and Content Fragments with Assets Next-Generation Dynamic Media** - Users can now use their cloud-hosted assets in Experience Manager Sites 6.5. They can author and deliver those assets on on-premise or Managed Services instances.

### [!DNL Forms]

* **[Adaptive Forms within AEM Page Editor](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md)** - You can now use AEM Page Editor to create and add multiple forms to your sites pages quickly. This capability allows content authors to create seamless data capture experiences within Sites pages using the power of adaptive forms components including dynamic behavior, validations, data integration, generate document of record and business process automation. You can:
    * Create an Adaptive Form by dragging and dropping form components to the Adaptive Forms Container Component in AEM Sites editor or Experience Fragments.
    * Use the Adaptive Forms Wizard within AEM Sites editor so you can create forms independent of any Sites page, providing you with the freedom to reuse such forms across multiple pages.
    * Add multiple forms to a Sites page, streamlining the user experience and providing greater flexibility.
* **[Support of reCAPTCHA Enterprise in Experience Manager Forms](/help/forms/using/captcha-adaptive-forms.md)** - Added support for reCAPTCHA Enterprise in Experience Manager Forms. This ability provides enhanced protection against fraudulent activity and spam, in addition to existing Google reCAPTCHA v2 support. 
* **[Added support for Adobe Acrobat Sign for Government with Experience Manager Forms](/help/forms/using/adobe-sign-integration-adaptive-forms.md)** - AEM Forms now integrate with Adobe Acrobat Sign for Government (FedRAMP compliant). This integration provides an advanced level of compliance and security for e-Signatures with Adaptive Form submissions for government associated accounts (Government departments and agencies). Integrations with Adobe Acrobat Sign for Government enables Adobe's partners and government customers to use electronic signatures in Adaptive Forms for some of the most mission-critical and sensitive lines of business. This additional layer of security ensures that all e-signatures are fully compliant with FedRAMP Moderate compliance, providing Adobe's government customers with peace of mind.
* **Enable Salesforce integration with Experience Manager Forms for data exchange** - Configure the integration between Experience Manager Forms and the Salesforce application using the OAuth 2.0 client credentials flow. This ability enables secure and direct authentication and authorization of the application and allows seamless communication without user involvement.
* **Optimization and enhanced functionality of workflow engine**: Increase the performance of the workflow engines by minimizing the number of workflow instances. In addition to `COMPLETED` and `RUNNING` status values, the workflow also supports three new status values: `ABORTED`, `SUSPENDED`, and `FAILED`.

## AEM 6.5, Service Pack 16&mdash;February 23, 2023

New protocol DASH (Dynamic Adaptive Streaming over HTTP) launched for adaptive bitrate streaming in Dynamic Media video delivery (with CMAF [Common Media Application Format] enabled).

* Adaptive streaming (DASH/HLS) ensures a better end user viewing experience for videos.
* DASH is the international standard protocol for adaptive video streaming and is widely adopted in the industry.
* Available now in Asia-Pacific and North America; coming soon in Europe-Middle East-Africa.

### [!DNL Forms]

* [Headless Adaptive Forms](https://experienceleague.adobe.com/en/docs/experience-manager-headless-adaptive-forms/using/overview) enable your developers to create, publish, and manage interactive forms that can be accessed and interacted with through APIs, rather than through a traditional graphical user interface. 

* [Adaptive Forms Core Components](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/introduction#features) are a set of 24 open-source, BEM-compliant components that are built on the foundation of the Adobe Experience Manager WCM Core Components. These components are open-source and provide developers the ability to customize and extend these components easily to match the specific needs of their organization. Anyone with existing skills to customize [WCM Core components](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/get-started/authoring) can easily customize and style these components.

* The Reader Extension service on OSGi now provides separate options to enable import and export usage rights on a PDF to import or export data in Adobe Acrobat Reader.
