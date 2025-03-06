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

## AEM 6.5, Service Pack 18&mdash;December 7, 2023

* Enabled Sites Page Editor/Image Component user to reference assets from the remote Assets Cloud Service. (SITES-13448, SITES-13433) 
* AEM now supports server-side sorting for quicker project navigation in List view. Project nodes are sorted based on the user-selected column before appearing in the interface.

### [!DNL Forms]

* **New Adaptive Form Core Components**: Vertical tabs, Terms & Conditions, and Checkbox are added to enhance the scalability of forms.
  * **[Checkbox component](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/checkbox.html)**: Adaptive Forms based on Core Components can now include a checkbox component. It allows users to make binary choices, selecting or deselecting a particular option. It typically appears as a small box that can be clicked or tapped to toggle between two states: checked and unchecked. The checkbox is a common form element used to present a yes/no or true/false choice.

  * **[Terms and Conditions component](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/terms-and-conditions.html)**: Adaptive Forms based on Core Components can now include a Terms and Conditions component. It allows Forms authors to introduce a specific section within the form where users are presented with the terms, conditions, or legal agreements associated with the use of a service, product, or platform. This component is designed to inform users about the rules, regulations, and obligations they are agreeing to by submitting the form.

    ![Vertical tabs, Terms & Conditions and Checkbox components](/help/forms/using/assets/forms-components.png)

  * **[Vertical tabs component](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/vertical-tabs.html)**: Adaptive Forms based on Core Components can now organize form content into a vertical list of tabs, providing a structured and navigable layout. The use of vertical tabs in a form can enhance the overall user experience by simplifying navigation and improving the organization of form content, especially in situations where a form contains multiple sections or complex information.
  
* **[64-bit version of AEM Forms Designer](/help/forms/using/installing-configuring-designer.md)**: The 64-bit version of AEM Forms Designer brings enhanced performance, scalability, and memory management to empower your form creation experience. With the 64-bit architecture, you can tackle even larger and more complex projects with ease, ensuring seamless design workflows and optimized efficiency. Elevate your form design capabilities and embrace the future of AEM Forms Designer with this cutting-edge release.

* **[Connect an Adaptive Forms with Microsoft&reg; SharePoint List](/help/forms/using/configuring-submit-actions.md#submit-to-microsoft&reg;-sharepoint-list)**: AEM Forms provide an out-of-the-box integration to submit forms data directly to SharePoint List, letting you use SharePoint's Lists capabilities. You can configure Microsoft&reg; SharePoint List as a datasource for a Form Data Model and use the Submit using Form Data Model submit action to connect an Adaptive Form with SharePoint List.

* **[Support to configure Document of Record properties for Adaptive Form Fragments](/help/forms/using/generate-document-of-record-for-non-xfa-based-adaptive-forms.md)**: You can now easily customize your Adaptive Form fragments and its fields in  Adaptive Form editor.

* **64-bit XMLFM**: The 64-bit iteration of XMLFM introduces heightened performance, scalability, and refined memory management. It is the first 64-bit native service deployed on the server-side. By harnessing its inherent capability to access larger memory resources compared to its 32-bit counterpart, XMLFM 64-bit empowers seamless handling of larger rendering workloads. This milestone not only represents a leap in performance but also introduces key enhancements to the native service framework within the AEM Forms Server. This update equips AEM Forms Server to seamlessly support any 64-bit native service.

## AEM 6.5, Service Pack 18&mdash;August 24, 2023

* Assets, Dynamic Media - [Multiple caption and audio track support for videos in Dynamic Media](/help/assets/video.md#about-msma)&mdash;You can now easily add multiple subtitles and multiple audio tracks to a primary video. This capability means that your videos are accessible across a global audience. You can customize a single, published primary video to a global audience in multiple languages and adhere with accessibility guidelines for different geographical regions. Authors can also manage the subtitles and audio tracks from a single tab in the user interface.
* Assets - From Search results, you can now navigate to the folder location that contains an asset to let you perform various asset management tasks. 
* Sites Polaris Picker in Content Fragments has improved performance.
* Enabled Sites Page Editor/Image Component user to reference assets from the remote Assets Cloud Service.
* To quickly find a project in List view, where you may have many projects in your system, Adobe now supports server-side sorting. Project nodes are sorted on the backend based on the column selected by the user before rendering them in the user interface.
* AEM 6.5.18.0 supports MongoDB 5.0 to 6.0.

### [!DNL Forms]

* **[Enhanced error handling with custom error handlers in the rule editor](https://experienceleague.adobe.com/docs/experience-manager-65/forms/adaptive-forms-advanced-authoring/standard-validation-error-messages-adaptive-forms.html)** &ndash; You can now invoke a custom function (using Client Library) in response to an error returned by an external service. And, you can provide a tailored response to end users. Or, you can take specific actions for errors returned by a service. For example, you can invoke a custom workflow in the backend for specific error codes or inform the customer that the service is down 

* **[Enhanced Adobe Sign Workflow step](https://experienceleague.adobe.com/docs/experience-manager-65/forms/workflows/aem-forms-workflow-step-reference.html#sign-document-step)** &ndash; Adobe Sign workflow step in AEM Workflows is available with the following enhancements.  

   * **Enhanced Security with Government ID-Based Authentication for Adobe Sign** &ndash; Adobe Acrobat Sign's Government ID-Based Authentication offers an additional layer of verification. It enables users to authenticate their identity using government-issued IDs (driver's license, national ID, passport). By using trusted identification documents, this enhancement adds an extra level of confidence to the signing process, making it ideal for scenarios that require heightened security, compliance, and user validation. 
   
   * **Enhanced Transparency with Audit Trail for Adobe Sign Documents** &ndash; Use the Audit Trail feature for detailed insights into the lifecycle of your Adobe Sign documents. With the Audit Trail, you can now maintain a comprehensive record of all actions and interactions related to your documents. This includes details such as who viewed, edited, or signed the document, along with timestamps for each event. This enhancement is crucial for maintaining compliance, resolving disputes, and ensuring the integrity of your digital agreements.  

 
   * **Expanded the roles for Agreement recipients beyond just the Signer** &ndash; Adobe Acrobat Sign lets you expand the roles for Agreement recipients beyond just the Signer to better match their workflow requirements. When enabled, each recipient in an Agreement has their role individually configurable, with Signer being the default. 

 
* **[AEM Forms on JEE full installer](https://experienceleague.adobe.com/docs/experience-manager-65/forms/install-aem-forms/jee-installation/aem-forms-jee-supported-platforms.html)** &ndash; The service pack brings a full installer for AEM Forms on JEE that brings support for multiple new software combinations, including: 
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
* **Dynamic Media _Snapshot_** - Experiment with test images or Dynamic Media URLs, to see the output of different image modifiers, and Smart Imaging optimizations for file size (with WebP and AVIF delivery), network bandwidth, and Device Pixel Ratio. See [Dynamic Media Snapshot](https://experienceleague.adobe.com/docs/experience-manager-learn/assets/dynamic-media/images/dynamic-media-snapshot.html).
* **DASH streaming with Dynamic Media** - New protocol (DASH - Dynamic Adaptive Streaming over HTTP) launched for Adaptive streaming in Dynamic Media video delivery (with CMAF enabled). Available now for all regions.
* **Integration of Experience Manager Sites and Content Fragments with Assets Next-Generation Dynamic Media** - Users of Experience Manager Assets as a Cloud Service Next-Generation Dynamic Media can now use those cloud-hosted assets for authoring and delivery with on-premise or Managed Services instances of Experience Manager Sites 6.5. 

### [!DNL Forms]

* **[Adaptive Forms within AEM Page Editor](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md)**: You can now use AEM Page Editor to quickly create and add multiple forms to your sites pages. This capability allows content authors to create seamless data capture experiences within Sites pages using the power of adaptive forms components including dynamic behavior, validations, data integration, generate document of record and business process automation. You can:
    * Create an Adaptive Form by dragging and dropping form components to Adaptive Forms Container Component in AEM Sites editor or Experience Fragments.
    * Use the Adaptive Forms Wizard within AEM Sites editor so you can create forms independent of any Sites page, providing you the freedom to reuse such forms across multiple pages.
    * Add multiple forms to a Sites page, streamlining the user experience and providing greater flexibility.
* **[Support of reCAPTCHA Enterprise in Experience Manager Forms](/help/forms/using/captcha-adaptive-forms.md)**: Added support for reCAPTCHA Enterprise in Experience Manager Forms, providing enhanced protection against fraudulent activity and spam, in addition to existing Google reCAPTCHA v2 support. 
* **[Support for Adobe Acrobat Sign for Government with Experience Manager Forms](/help/forms/using/adobe-sign-integration-adaptive-forms.md)**: AEM Forms now integrate with Adobe Acrobat Sign for Government (FedRAMP compliant). This integration provides an advanced level of compliance and security for e-Signatures with Adaptive Form submissions for government associated accounts (Government departments and agencies). Integration with Adobe Acrobat Sign for Government enables Adobe's partners and government customers to use electronic signatures in Adaptive Forms for some of the most mission-critical and sensitive lines of business. This additional layer of security ensures that all e-signatures are fully compliant with FedRAMP Moderate compliance, providing Adobe's government customers with peace of mind.
* **Enable Salesforce integration with Experience Manager Forms for data exchange**: Configure the integration between Experience Manager Forms and the Salesforce application using the OAuth 2.0 client credentials flow. This ability enables secure and direct authentication and authorization of the application and allows seamless communication without user involvement.
* **Optimization and enhanced functionality of workflow engine**: Increase the performance of the workflow engines by minimizing the number of workflow instances. In addition to `COMPLETED` and `RUNNING` status values, the workflow also supports three new status values: `ABORTED`, `SUSPENDED`, and `FAILED`.

## AEM 6.5, Service Pack 16&mdash;February 23, 2023

New protocol DASH (Dynamic Adaptive Streaming over HTTP) launched for adaptive bitrate streaming in Dynamic Media video delivery (with CMAF [Common Media Application Format] enabled).

* Adaptive streaming (DASH/HLS) ensures better end user viewing experience for videos.
* DASH is the international standard protocol for adaptive video streaming and is widely adopted in the industry.
* Available now in Asia-Pacific and North America; coming soon in Europe-Middle East-Africa.

### [!DNL Forms]

* [Headless Adaptive Forms](https://experienceleague.adobe.com/docs/experience-manager-headless-adaptive-forms/using/overview.html) enable your developers to create, publish, and manage interactive forms that can be accessed and interacted with through APIs, rather than through a traditional graphical user interface. 

* [Adaptive Forms Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html#features) are a set of 24 open-source, BEM-compliant components that are built on the foundation of the Adobe Experience Manager WCM Core Components. These components are open-source and provide developers the ability to easily customize and extend these components to match the specific needs of their organization. Anyone with existing skills to customize [WCM Core components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/get-started/authoring.html) can easily customize and style these components.

* The Reader Extension service on OSGi now provides separate options to enable import and export usage rights on a PDF to import or export data in Adobe Acrobat Reader.

## AEM 6.5, Service Pack 15&mdash;November 24, 2022

### [!DNL Forms]

* AEM Forms Designer is now available in [Spanish locale](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html).
* You can now use [OAuth2 to authenticate with Microsoft&reg; Office 365 mail server protocols (SMTP and IMAP)](/help/forms/using/oauth2-support-for-mail-service.md).
* You can set [Revalidate on server](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/configure-submit-actions-and-metadata-submission/configuring-submit-actions.html#enabling-server-side-validation-br) property to true to identify the hidden fields for exclusion from a Document of Record on server-side.
* AEM Forms Designer requires 32-bit version of Visual C++ 2019 Redistributable (x86).

## AEM 6.5, Service Pack 14&mdash;August 25, 2022

Bug fixes only.

## AEM 6.5, Service Pack 13&mdash;May 26, 2022

* Use invisible CAPTCHA in an adaptive form: You can now use an invisible CAPTCHA to show the CAPTCHA challenge only if there is suspicious activity. If no suspicious activity is found, the CAPTCHA challenge is not displayed. It helps assess human form completion without checkbox requirements, reduce customization efforts, and improve the end-user experience.

* Added support to fetch response headers in Form Data Model post processor for REST endpoints.

* Now, on generating an Adaptive Form translation file, the same sequence of texts the generated XLIFF file is identical to the sequence of components in the corresponding Adaptive Form.

* When you localize an Adaptive Form and make even a small change made to text of the base language, the complete translation goes missing for all the other languages. The issue is fixed in [!DNL Experience Manager] 6.5.13.0.

* Accessibility improvements for Forms:

  * Added support for screen readers to recognize header and body of a table as continues and connected entities. It helps screen readers navigate the tables properly. (NPR-37139)
  * Added support for screen readers to stop navigating HTML workspace until a dialog is open.

## AEM 6.5, Service Pack 12&mdash;February 24, 2022

* After configuring a connection between remote DAM and Sites deployments, the assets on remote DAM are made available on the Sites deployment. You can now perform the update, delete, rename, and move operations on the remote DAM assets or folders. The updates, with some delay, are available automatically on the Sites deployment.
* Push-rollouts of a live copy source to multiple live copies is now possible by default, without requiring a blueprint configuration.
* The status of in-progress async operations is now shown in the user interface to help prevent users from accidentally triggering multiple async operations on the same path.
* Support for IMS-based authentication is provided for Analytics 2.0 APIs.
* API support for JSON offer type experience fragment.
* Offer request is now provided for Delete offer (Experience Fragment API) in IMS.
* The built-in repository (Apache Jackrabbit Oak) still remains at 1.22.9.
