---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
solution: Experience Manager
feature: Release Information
role: User,Admin,Architect,Developer
exl-id: 811fccbc-6f63-4309-93c8-13b7ace07925
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in this release information, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession -->

<!-- DO NOT DELETE THIS HIDDEN NOTE      DO NOT DELETE THIS HIDDEN NOTE
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, November 30, 2023. In addition, a list of Forms fixes and enhancements is added to this section. -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.22.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, November 21, 2024 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.22.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.22.0 {#what-is-included-in-aem-6522}

[!DNL Experience Manager] 6.5.22.0 includes new features, key customer-requested enhancements, and bug fixes. It also includes performance, stability, and security improvements released since the initial availability of 6.5 in April 2019. [Install this Service Pack](#install) on [!DNL Experience Manager] 6.5.

<!-- UPDATE FOR EACH NEW RELEASE -->

## Key features and enhancements

### Forms {#forms-sp22}

Key features and enhancements in this release include the following:

* [hCaptcha](/help/forms/using/integrate-adaptive-forms-hcaptcha.md) and [Cloudfare Turnstile Captcha services](/help/forms/using/integrate-adaptive-forms-turnstile.md): AEM Forms support the following Captcha services:
  * hCaptcha protects forms from bots, spam, and automated abuse by challenging users with a checkbox widget. It ensures that only human users proceed, enhancing security for online transactions.
  * Cloudflare Turnstile offers a security measure that aims to protect forms from automated bots, malicious attacks, spams and unwanted automated traffic. It presents a checkbox on form submission to verify that they are human, before allowing them to submit the form.

* Adaptive Form versioning:
  * [Create multiple versions of an Adaptive Form](/help/forms/using/add-versioning-reviews-comments.md): Now users can easily manage variations of existing forms. This simplifies version control and facilitates comparison for form optimization, all within a single, streamlined workflow.
  * [Compare Adaptive Forms](/help/forms/using/compare-forms-core-components.md): Now users can easily compare two forms to identify differences. It facilitates smooth collaboration by enabling team members to compare revisions and discuss changes efficiently.

* Added support to enable font embedding in [Interactive Communications Batch APIs](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/interactive-communications/create-interactive-communication#output-format-print-channel):  Interactive Communications now includes support for embedding Adobe Ming and Adobe Myungjo fonts in PDFs generated through the Batch API. This enhancement ensures accurate text rendering in generated documents, even when using font subsets, providing improved support for multilingual content in PDF outputs.

* [Table of Content API for PDF Accessibility](/help/forms/using/aem-document-services-programmatically.md#auto-tag-pdf-documents-auto-tag-api): AEM Forms on OSGi now support the new TOC Tag API to enhance PDF for accessibility standards. It makes PDFs more accessible for users with assistive technology.

* [Fragment XDP resolution](/help/forms/using/assembler-service.md#resolve-references-on-crx-repository-resolve-references-on-crx-repository): AEM Forms on OSGi now resolves Fragment XDPs referenced in Master XDPs and stored in the AEM CRX Repository.

* [PDF/A compliance enhancements](/help/forms/developing/pdf-a-documents.md#converting-documents-to-pdfa-documents-converting-documents-to-pdf-a-documents): Now users can convert PDFs to PDF/A formats (1a, 2a, 3a) for archival purposes while ensuring accessibility and verifying compliance with these standards.

* **Support for Auto Sizing of Font for Static PDF documents**: AEM Forms Designer, OutputService and FormsService now supports auto sizing of fonts for static PDF's. If user mentions font size 0 in the template for fields like text field, numeric field, password field, or datetime field, the font size auto adjust inside these fields without any change in the size of the field itself. 
**To use the feature, user pass a flag in the custom xci**: <behaviorOverride>patch-LC-3921991:1</behaviorOverride>.

<!-- * _6.5.21.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE?_ -->

### Sites {#sites}

[The Universal Editor](/help/sites-developing/universal-editor/introduction.md) is now available on AEM 6.5 for headless use cases with the application of a feature pack.

### [!DNL Assets]

The IPTC tab now supports [!UICONTROL Alt Text] and [!UICONTROL Extended Description] text fields. (ASSETS-34918)

<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## Fixed issues in Service Pack 22 {#fixed-issues}


### [!DNL Sites]{#sites-6522}


#### Accessibility {#sites-accessibility-6522}

* Annotation swatch selector button was missing an accessible name. That is, using a screen reader, there is no human-understandable name for the button to select after entering a new hex value. (SITES-11992) 
* The following elements in the left rail menu appear like a list but are not marked up as such in the screen reader:

  * Site
  * Live copy
  * Launch
  * Language Copy
  * Folder
  * CSV Report (SITES-2874)

* The AEM Core Web Content Management requires an accessibility label for hyperlinks in the Rich Text Editor. When a hyperlink is used in the text component, the anchor tag should include the `aria-label` attribute to ensure that screen readers can read and convey the link text accurately for accessibility purposes. (SITES-11511)
* In AEM, interactive elements in the table header in List View do not have the required "button" role. As such, the NVDA screen reader does not announce the expected button roles for the following table headers: Title, Name, Modified, Published, Preview, Template, Operation, Workflow. Each interactive element in the table header should be assigned a "button" role to ensure compatibility with assistive technologies like NVDA. (SITES-10962)


#### Admin User Interface{#sites-adminui-6522}

* In some instances of AEM, the version preview and comparison functionalities were not working as expected across several pages. Specifically:

    * **Preview Issue:** When attempting to preview a page version, an error appears initially. After retrying, the preview results in a blank page.
    * **Version Comparison Issue:** The "Compare to Current" feature only displayed the current version, without highlighting any differences between versions. (SITES-23988) 

* An unexpected `<br>` tag appears in the Rich Text Editor (RTE) field when using the `defaultPasteMode` set to `plaintext` during a copy and paste action. This issue results in different markup for the same content, resulting in the same text content being translated twice in a customer's translation memory. (SITES-23606) 
* In AEM 6.5.20.0, a functionality issue was encountered with the **Manage Publication** feature. When selecting a node and scheduling it for future publication, an error message&mdash;"Failed to retrieve child resources for selected items"&mdash;could appear when trying to include child nodes. This issue was blocking the use of the **Include Children** option, preventing complete publication of the intended content hierarchy. (SITES-23000) 
* A template's "Published" timestamp was not updating in the author environment, even though the template was successfully replicated to the publish instances. The expected behavior was for the timestamp on the author instance to reflect the latest publication, but this update was not occurring as intended. (SITES-21585) 
* There was a discrepancy in the count of Incoming Links in the AEM author environment. The left side rail showed fewer links compared to the Classic UI. Also, some Incoming Links that were legitimate, do not work. (SITES-24837)
* Extremely long loading times were being reported when viewing page versions in the Timeline view of AEM. It was taking up to 19 minutes to display versions. This issue was ongoing since the upgrade from AEM 6.4.8 to 6.5.18, significantly disrupting workflow efficiency. (SITES-22468 & SITES-22467)

<!-- #### Classic UI{#sites-classicui-6522} 

* A -->


#### [!DNL Content Fragments]{#sites-contentfragments-6522}

* In the upgraded AEM 6.5.17, saving Content Fragments resulted in the following error: *ERROR: Could not save Content Fragment.* (SITES-22993) 
* An issue was identified with an unclosed resource resolver in `ContentFragmentModelOmniSearchHandler` on the publisher in AEM. (SITES-24903)


#### [!DNL Content Fragments] - Admin{#sites-admin-6522}

Clicking the link in the email notification directs the user to the default asset viewer or editor. It does so instead of the Content Fragment editor, even when the asset in the workflow is determined to be a Content Fragment. (SITES-24338) 


#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6522}

When using Content Fragments with Multiline Text field items, the markup generated when querying using GraphQL was not retaining the formatting as specified in the HTML. For example, a newline was missing after the list. The impact was that the last paragraph became part of the list. (SITES-23233)


<!-- #### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6522}

* A


#### [!DNL Content Fragments] - REST API{#sites-restapi-6522}

* A -->

#### Core Backend{#sites-core-backend-6522}

* Recurring `SegmentNotFoundException` errors was reported on an AEM author instance. Restarting the author temporarily resolved the issue but a long-term fix was needed to prevent further occurrences. (SITES-22573)
* An issue was raised regarding the timeline functionality in AEM Sites, specifically around handling missing `cq:lastModified` properties on annotations. After applying AEM 6.5.20, there was uncertainty about whether existing content needed remediation for the missing property, or if the timeline was updated to function correctly without it. (SITES-21861)


#### Core Components{#sites-core-components-6522}

* Following an upgrade from AEM 6.5.18 to 6.5.21, an issue was identified with the functionality that checks the live usage of components. When attempting to scroll for additional items on the Live Usage page, the table failed to load more results even though "Loading more items" was seen in the UI. (SITES-23919)
* An issue was reported with the validation of required fields in an AEM component dialog box containing two tabs. Tab 1 included a Rich Text Editor (RTE) and text fields, while Tab 2 had path fields and text fields. Although all fields are marked as mandatory (`required=true`), error notifications persist incorrectly in Tab 1, even after filling in all required fields. In contrast, errors in Tab 2 cleared as expected. (SITES-23243)
* After migrating to AEM 6.5.21, the HTML Template Language `data-sly-include` statement no longer functioned as expected, specifically failing to support `appendPath` and `prependPath` expressions. As a result, the included resource's output was not rendered properly, even though it worked correctly prior to the migration. This issue caused rendering failures for resources that rely on these expressions for path manipulation. (GRANITE-52970)


<!-- #### Campaign integration{#sites-campaign-integration-6522}

* A -->


#### Experience Fragments{#sites-experiencefragments-6522}

* Experience Fragments do not sort by title as expected when the **Title** column header is clicked in the List View. A quick flicker of the screen is observed, but it does not sort. (SITES-23706) 

* In AEM 6.5.17, an issue was encountered when converting a page component into an Experience Fragment using the out-of-the-box feature. After conversion, the Experience Fragment appeared empty during editing, despite displaying correctly on the page where it was used. The issue stemmed from incorrect node creation: the component node was placed outside the root / container node, violating the template's structure. You needed to move the component node manually into the correct root / container node to restore the fragment's editability. (SITES-22974) 

* After migrating from AEM 6.5.11 to 6.5.20, Cloud configurations on Experience Fragments were not saving correctly. Although the configurations appeared to save in `crx/de`, they would not display upon reopening the configurations console, indicating an issue with persistence. (SITES-22287) 


<!-- #### Foundation Components (Legacy){#sites-foundation-components-legacy-6522}

* A -->


#### Launches{#sites-launches-6522}

When adding Experience Fragment assets using the tagging filter in AEM production, the user could select it, but then encountered an error after selecting **Create language copy**. The expected behavior was that the Experience Fragment asset selected from the tagging filter was supposed to get added to the translation project. (SITES-24152) 

#### Link Checker{#sites-link-checker-6522}

The LinkCheckerTask fails to authenticate because the HTTP client tries NTLM before Basic Authentication, causing the proxy to block users after multiple failed attempts. The system should instead use Basic Authentication to authenticate against the proxy, allowing the LinkCheckerTask services to function correctly. (SITES-25034) 


#### MSM - Live Copies{#sites-msm-live-copies-6522}

* When SEO Robots tags are applied to the primary copy and rolled out to Live Copy pages, the values appeared correctly in `crx/de`. However, the values were not reflected in the user interface under the Page Properties of the Live Copy pages. (SITES-23475) 
* Errors related to Launches were appearing when an attempt was made to promote a Launch through the user interface. The Promote Launch wizard remained empty, preventing the completion of the promotion process. (SITES-19718)
* Issues arose with Experience Fragments in AEM following attempts to create Live Copies and perform rollouts. The problem occurred when users encountered a `NotFound` error when trying to navigate back to the Experience Fragments management screen from the Rollout screen. (SITES-21933)


#### Page Editor{#sites-pageeditor-6522}

* The Undo button changed the position of the component in addition to changing the text to the last version. (SITES-17465) 
* When a copied container component was pasted, it visually appeared twice, resulting in three instances on the page. However, after refreshing the page, the duplicate disappeared, suggesting the issue was likely a temporary visual glitch. (SITES-21890) 
* While navigating the Components left pane using the keyboard's Tab or Shift+Tab keys, multiple text elements were not clearly visible, both visually and in tab mode. This issue affected accessibility, making it difficult to identify or interact with these components during keyboard navigation. (SITES-2266)

#### Replication{#sites-replication-6522}

In AEM 6.5.18 and 6.5.19, on deactivating a parent page, multiple deactivation requests were generated for each child page. This issue also broke the bulk unpublishing of the GraphQL endpoints. (NPR-42075 & NPR42010) 


### [!DNL Assets]{#assets-6522}

* While using the Connected Assets feature, the updates made in AEM Assets do not reflect on AEM Sites environment. (ASSETS-42344) 
* Issues with the asset publish status when you move assets from one location to another within Experience Manager. (ASSETS-41158) 
* Uploading assets using the API results in `unclosed resource resolver` error message. (ASSETS-41049) 
* Issues with `AssetReferenceResolverImpl` reference query after upgrading to Adobe Experience Manager, Service Pack 21. (ASSETS-40384) 
* In AEM version 6.5.19, while removing one option from the search panel results, it unchecks all other available checkboxes as well. (ASSETS-37335) 
* Junk values are displayed in the Excel output while performing the bulk metadata export operation. (ASSETS-37260) 
* In AEM version 6.5.19, when you upload an SVG file in UTF-8 format, the output is blurred. (ASSETS-36616) 
* `Fetch original rendition for Dynamic Media Connected Assets` option is missing within Connected Assets configuration. (ASSETS-41726)
* Asset properties are saved even if you do not define a value for mandatory fields. (ASSETS-37914)
* If the processing status of an asset is Failed or Metadata Failed, the captions and audio tracks UI does not work appropriately. (ASSETS-37281)
* When you save an asset metadata and try to edit it, the language name does not display. (ASSETS-37281)

#### [!DNL Dynamic Media]{#assets-dm-6522}

A production issue disrupted the migration process when a video upload to Dynamic Media failed, displaying a process failure error in the user interface. (ASSETS-36038)

<!--

### [!DNL Forms]{#forms-6522}

Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the AEM 6.5.22.0 Forms add-on package release is scheduled for Thursday, November 28, 2024. A list of Forms fixes and enhancements is added to this section post the release.

-->

#### Forms {#forms-bug-fixes-sp22} 

* The URLs generated for file attachments in saved drafts in AEM Forms does not reflect the configured Apache Sling Resource Resolver Factory mappings. (FORMS-16949) 
* When a user on AEM Forms Service Pack 19 (6.5.19.0) previews a letter, the content does not align properly, as the spaces appear missing and the character ‘'x” appears at some locations. (FORMS-16670) 
* When a user on AEM Forms Service Pack 18 (6.5.18.0), attempts to print the files using CIFS protocol, it fails with the error: (FORMS-16629) 
`ALC-OUT-001-401: Unknown error while printing using CIFS on the Printer: \\\\\\\\NSMVPLUETEST01\\\\TH_Test`. 
* When a user upgrades from AEM Forms Service Pack 17 (6.5.17.0) to AEM Forms Service Pack 20 (6.5.20.0), the Rule Editor icon does not appear at the Form Container level. (FORMS-16430) 
* When a user upgrades from AEM Forms Service Pack 17 (6.5.17.0) to AEM Forms Service Pack 21 (6.5.21.0), the modified Adaptive Form submit URL Path fails to work. (FORMS15894) 
* On AEM Forms Service Pack 19 (6.5.19.0), AEM Forms 6.5 PDF/A validation fails for certain files with the error `creation date and modification date mismatch with timezone`, while it runs smoothly on Acrobat Pro PDF/A validation for a compliance check. (FORMS-15840)
* When a user deletes form drafts using “Drafts and Submissions” component on a site page on AEM Forms Service Pack 15 (6.5.15.0) on OSGi, deletion fails. (FORMS-15755) 
* When a user has a SharePoint list with more than 999 entries and the form includes an attachment, the form submission fails. (FORMS-15057) 
* When a user employs two date picker components labeled as Start Date and End Date, after adding a validation rule to ensure that the end date is not earlier than the start date and setting a custom script validation message, the validation does not trigger if the end date is earlier than the start date. (FORMS-14757) 
* When a user employs the show and hide functionality on a table in an adaptive form, the field size shrinks. The field size corrects itself on adding and removing a row. (FORMS-14756) 
* When a user print forms on AEM Forms Service Pack 19 (6.5.19.0), some forms do not render correctly on the server, causing errors during the printing process. (FORMS14734) 
* When user updates from AEM Forms Service Pack 15 (6.5.15.0) to AEM Forms Service Pack 19 (6.5.19.0), and uses a form where a particular variable is set as number and the custom display pattern is set as num{$zzz,zz9.99}, the pattern does not render correctly in preview and Agent UI. (FORMS-14694) 
* When a user previews a letter in an Interactive Communication with a saved data xml, the letter becomes stuck in the "Loading" state on AEM UI. Previewing the letter again with the same XML works fine. (FORMS-14521) 
* When a user on AEM Forms Service Pack 20 (6.5.20.0), sends an email with an attachment using a ‘Send Email’ submit action button in an adaptive form, the attachment name appears on the next line rather than inline. (FORMS-14426) 
* When a user generates a PDF in AEM Forms with bulleted lists set to the default “Disc” style, the PDF fails the Accessibility Check in Adobe Acrobat's accessibility tool. List with 'Bullet' and 'Square' styles pass the accessibility check. (FORMS-13802, LC-3922179) 
* When a user upgrades from AEMForms-6.5.0-0065 to AEMForms-6.5.0-0087 on Standalone RHEL8 JBoss setup, it fails to connect with the LiveCycle service container. (FORMS-15907) • 
* On AEM Forms on JEE, In AEM Workspace when a user selects a previously submitted form and start a new form process, forms with prepopulated data processes wipe out all previously submitted data and replace it with the prepopulated data, not retaining any fields that were manually filled out in the previous form. (FORMS-15376) 
* On AEM Forms Service Pack 20 (6.5.20.0) when a user converts Tiff file to PDF using PDFG service, it fails with the error: (FORMS-14879) ALC-PDG-011-028-Error occurred while converting the input image file to PDF. com/sun/image/codec/jpeg/JPEGCodec 
* Upgrade in AEM Forms on JEE jar files: The `commons-collections:commons-collections:jar` library is now included to improve dependency resolution and functionality across various AEM Forms JEE job such as:
  * Assembler Job enhancement to improve job processing and error handling. 
  * PDF Generator (PDFG) Job enhancement to ensure smoother operations for document generation and conversion. 
  * LC-Upgrade Job enhancement to improve the upgrade process while ensuring a stable transition between versions. 
  * Rights Management Job enhancement to secure document handling and improved rights management capabilities. 
  * Process Management Job enhancement for more reliable job processing and system management.


#### XMLFM {#forms-xmlfm-sp22}

* In AEM Forms Service Pack 21 (6.5.21.0) when a user adds non-standard tags to PDFs using XMLFM, the document fails to comply with PDF specification requirements. (LC-3922484) 
* When a user generates a PDF using the Output Service on AEM Forms Service Pack 20 (6.5.20.0), it fails with CORBA.COMM_FAILURE and displays the error: `15:04:35,973 ERROR [com.adobe.formServer.PA.XMLFormAgentWrapper] (default task-14) ALCOUT-002-013: XMLFormFactory, PAexecute failure: "org.omg.CORBA.COMM_FAILURE"`. The service passes successfully when the Accessibility role "Reference" is excluded from the XDP template’s subform. however, this role is needed for 508 compliance. (LC-3922402) 
* When a user converts an XFA form to an AcroForm PDF, it fails. (LC-3922363) 
* In AEM Forms Service Pack 19 (6.5.19.0) when a user creates an XDP with the unnamed subforms, FS_DATA_SOM appears empty for unnamed subforms. (LC-3922034) 

#### Forms Designer {#forms-designer-sp22} 

* When a user opens a fragment library by selecting a fragment folder in AEM Forms Designer version 6.5.21.0, it crashes. (LC-3922439) 
* When a user uninstalls the 32-bit AEM Forms Designer version 6.5.20.0 and installs AEM Forms Designer version 6.5.21.0, Forms Designer fails to start. The error logs show insufficient memory allocation for the Java Runtime Environment (JRE). (LC-3922404) 
* After a user installs AEM Forms Designer version 6.5.20.0, the Macros option does not appear in the menu, only the default 'Accessibility Checker' macro appears and fails to run. (LC-3922321) 
* When a user adds a new template location for creating XDPs in AEM Forms Designer version 6.5.20.0, Forms Designer crashes. (LC-3922316) 
* When a user generates output using ExportData method in AEM Forms 6.5 Service Pack 15 (6.5.15.0) OSGI, it produces incomplete and incorrect data. (LC-3922340)


<!-- #### [!DNL Adaptive Forms] {#forms-6522}

* A


#### [!DNL Forms Designer] {#forms-designer-6522}

* A -->


### Foundation {#foundation-6522}

In the AEM Assets console, an issue occurred when attempting to reorder DITA documents. The breadcrumb at the top of the path browser dialog box incorrectly displays the node name instead of the node title for the root parent. The correct node title only appears after selecting an item within the breadcrumb, indicating a temporary display error. (NPR-42106) 


<!-- #### Apache Felix {#foundation-apachefelix-6522}


* A

#### Campaign{#foundation-campaign-6522}

* A


#### Cloud Services{#foundation-cloudservices-6522}

* A -->


#### Communities {#foundation-communities-6522}

After upgrading from AEM 6.5.19 to 6.5.20, an issue emerged where `Connection evic` threads failed to close properly after calls to `UgcSearch`. This problem, observed in the production environment, causes these threads to persist and accumulate over time, potentially impacting performance. (NPR-42019) 


<!-- #### Content distribution{#foundation-content-distribution-6522}

* A -->


#### CRX {#foundation-crx-6522}

* Sorting was not working as per **Groups** in the left side menu in CRX Package Manager. (GRANITE-53277)
* The Package Manager in AEM restricts the installation of lower package versions by default but allows forceful installations of older versions. However, using the force install option can interfere with future installations through the standard pipeline. For instance, if version 1.21 is installed and version 1.24 is added, the installation succeeds, listing both versions. However, trying to install version 1.22 over 1.24 fails through the pipeline but works if forcefully installed, listing all versions. Similarly, installing version 1.23 is blocked if version 1.24 is already present, as the pipeline does not permit downgrades. (GRANITE-53263)


#### Granite{#foundation-granite-6522}

* Snapshot packages were being installed in AEM using CURL commands. During installation, the JCR installer scanned the packages by way of the OSGI Installer to ensure that no additional OSGI bundles or configurations are required. If a package version contained "SNAPSHOT," the OSGI Installer triggered VLT to create a corresponding snapshot package. However, because each AEM author instance runs its own OSGI Installer, both instances may attempt to generate the snapshot simultaneously, leading to session conflicts within the repository. (NPR-42003) 
* A lock contention existed in `ScriptDependencyResolver` with AEM 6.5.21. (GRANITE-53181) 
* After upgrading AEM to 6.5.21, issues arose when relative paths were used in Sightly (HTL) syntax, such as `data-sly-use`. (GRANITE-53080) 


#### Integrations{#foundation-integrations-6522}

* Added legal attribution statement for Cloud Services user interface. (FORMS-16373)
* Addition of read permissions for the **fd-cloudservice** user to access hCaptcha and Turnstile configurations, letting it retrieve the client ID and client secret necessary for captcha rendering and validation. Additionally, an Access Control List model was implemented to manage access to these configurations. (FORMS-16360)


#### Localization{#foundation-localization-6522}

In ![Hammer icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Hammer_18_N.svg) Tools  >  **Security** > ![User icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_User_18_N.svg) **Users**, on the User Management page, the data in **Status** column of the table was displaying vertically. (GRANITE-48304)


<!-- #### Oak {#foundation-oak-6522}

* A -->


#### Platform{#foundation-platform-6522}

* The Enterprise Information Management tracking introduced in AEM 6.5.18 caused anomalies in calculating product adoption scores. The Adobe Metrics library caused this issue by overwriting user data supplied by the Omega tracking library. As a result, adoption scores for many AEM Sites and AEM Assets customers dropped to zero starting February 2024. (CQ-4358438) 
* A critical issue has been identified in the production environment where the Garbage Collector was improperly handling tags. Specifically, when a tag was moved or renamed, the Garbage Collector failed to update the `cq:MovedTo` property, causing the tag to disappear from pages. (CQ-4358293) 
* A problem with ContextHub in AEM 6.5.19 was causing segments to resolve incorrectly when a context path was added to an AEM instance. The issue specifically affected the URL field within the JavaScript objects generated by the page component, where the required context path prefix was missing. This omission prevented segments from functioning as expected. (SITES-21852)
* Updated AEM Quickstart to use the library `commons-collections-3.2.2-adobe-2`. The update ensures that the application can continue to run smoothly. (NPR-42150)
* The SMTP OAuth2 setup in AEM 6.5 differs significantly from what is used in AEM as a Cloud Service. To streamline configuration and ensure consistency, the setup in AEM 6.5 needed to be aligned with the standards used in AEM as a Cloud Service. (GRANITE-53273)
* An issue was found when you clicked ![Compass icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Compass_18_N.svg) > ![Project icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Project_18_N.svg) Projects, then hovered your mouse pointer over ![Rail left icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_RailLeft_18_N.svg) ![Chevron Down icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_ChevronDown_18_N.svg), a grave accent appeared before the tooltip text "Content Only." (CQ-4356633)

#### Security{#foundation-security-6522}

* Issues were encountered with an outdated JSAFE cryptographic library (version 6.0.0) in AEM. A patched bundle with JSAFE version 6.2.5 is included in AEM 6.5.22. (NPR-42006) 
* When validating allowed protocols during XSS checks, handlers compare against "http" and "https." However, the `protocol` property of a URL object returned these values with a trailing colon, such as `http:` and `https:`. This mismatch caused validation issues. To ensure accurate parsing, the protocol check needed to account for the colon or adjust the comparison logic accordingly.  (NPR-42119)
* After installing AEM 6.5.21 (the previous version was AEM 6.5.19) on IBM&reg; WebSphere&reg; Liberty Profile and Semeru Java 8.0, it was not possible to open any pages. Error logs indicated issues related to servlet versions that different bundles required. To address this issue, the dependency on `org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar` had to be reverted because it related to the problem. (NPR-42116)
* Several browsers are phasing out support for **SameSite=None** cookies, which are used to allow cross-site access to cookies. As an alternative, **Partitioned cookies** are being introduced. These cookies isolate storage by the context in which they are used, enhancing privacy and security by preventing tracking across sites while still allowing cookies to function within specific partitions, such as embedded third-party content. (GRANITE-51953)


<!-- #### Sling{#foundation-sling-6522}

* A -->


#### Translation{#foundation-translation-6522}

* Added support for recent changes in Core Components to default translation rules. (NPR-42029) 
* An issue was identified with the export of XLIFF files in AEM Forms. When using the **Export selection as XLIFF (strings only)** option, the sequence of components was not consistently maintained. However, the sequence remains correct when exporting XLIFF for a specific language. Two files were provided to demonstrate the issue: **DE-CH_Export.xliff** (correct sequence) and **String_Export.xliff** (incorrect sequence). (NPR-42118) 


#### User interface{#foundation-ui-6522}

* The `coralui-component-dialog` was altering the placement of `cq-dialog-actions`, potentially affecting the layout or behavior of action buttons within dialog boxes in AEM. (NPR-42294) 
* The color picker functionality in AEM was malfunctioning. When accessed, it displayed a blank modal, preventing color selection. This issue began after installing AEM 6.5.20 in the Stage environment. The color picker worked correctly *prior* to the update. (NPR-42163)
* In ![Hammer icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Hammer_18_N.svg) **Tools** > **Workflow** > **Models** > select any model > **Start Workflow**, the Browse icon was missing from the Payload field in the **Run Workflow** dialog box. (NPR-42162)


<!-- #### WCM{#foundation-wcm-6522}

* A


#### Workflow{#foundation-workflow-6522}

* A -->


## Install [!DNL Experience Manager] 6.5.22.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.22.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The Service Pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.22.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.22.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.22.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->
<!-- For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->


### Install the Service Pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the Service Sack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.22.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>The dialog box on the Package Manager UI sometimes exits during the installation of the Service Pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installation is successful. Typically, this issue occurs in the [!DNL Safari] browser but can intermittently occur in any browser.

**Automatic installation**

There are two different methods that you can use to install [!DNL Experience Manager] 6.5.22.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.22.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.22.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.20 or later (Use Web Console: `/system/console/bundles`). <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE. CHECK WITH SAMEER DHAWAN -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the Service Pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

>[!NOTE]
>
>The Adaptive Forms feature, available in [AEM 6.5 QuickStart](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/implementing/deploying/deploying/deploy), is designed for exploration and evaluation purposes only. For production use, it is essential to obtain a valid license for AEM Forms, as Adaptive Forms functionality requires proper licensing.

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL must install the [Experience Manager Content Fragment with GraphQL Index Package 1.1.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/cfm-graphql-index-def-1.1.1.zip). 

Doing so lets you add the required index definition based on the features they actually use.

Failure to install this package may result in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.22.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.22/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

  ```shell
    <dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.5.22</version>
    <scope>provided</scope>          
    </dependency>
  ```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.


## Deprecated and removed features{#removed-deprecated-features}

See [Deprecated and removed features](/help/release-notes/deprecated-removed-features.md/).

## Known issues{#known-issues}

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THIS LIST.-->

<!-- * **Page publishing not working in Page Editor after upgrading to Service Pack 18 (6.5.18.0)** -->

  <!-- https://jira.corp.adobe.com/browse/SITES-15856 REMOVE FOR 6.5.19.0 --> 
  <!-- After you upgrade an instance of AEM 6.5.0.0&mdash;6.5.17.0 to AEM 6.5.19.0, when you click **Publish Page** inside the Page Editor, you are redirected to a URL that does not exist.

  To work around this issue, do one of the following:

  * Remove the following "path" property.

       `/libs/wcm/core/content/editor/jcr:content/content/items/content/header/items/headerbar/items/pageinfopopover/items/list/items/publish/granite:data`

  * Paste the correct URL directly into the browser.

       `http://localhost:4504/editor.html/libs/wcm/core/content/sites/publishpagewizard.html?item=/content/we-retail/language-masters/en/about-us.html` -->


* **Related to Oak**
  From Service Pack 13 and above, the following error log has begun to appear which affects the persistence cache:

  ```shell
  org.h2.mvstore.MVStoreException: The write format 1 is smaller than the supported format 2 [2.0.202/5]
  at org.h2.mvstore.DataUtils.newMVStoreException(DataUtils.java:1004)
      at org.h2.mvstore.MVStore.getUnsupportedWriteFormatException(MVStore.java:1059)
      at org.h2.mvstore.MVStore.readStoreHeader(MVStore.java:878)
      at org.h2.mvstore.MVStore.<init>(MVStore.java:455)
      at org.h2.mvstore.MVStore$Builder.open(MVStore.java:4052)
      at org.h2.mvstore.db.Store.<init>(Store.java:129)
  ```

  Or

  ```shell
  org.h2.mvstore.MVStoreException: The write format 1 is smaller than the supported format 2 [2.1.214/5].
  ```

  To resolve this exception, do the following:

    1. Delete the following two folders from `crx-quickstart/repository/`

        * `cache`
        * `diff-cache`

    1. Install the Service Pack, or restart Experience Manager as a Cloud Service. 
      New folders of `cache` and `diff-cache` are automatically created and you no longer experience an exception related to `mvstore` in the `error.log`.

* Update your GraphQL queries that may have used a custom API name for your content model to use the default name of the content model instead.

* A GraphQL query may use the `damAssetLucene` index instead of the `fragments` index. This action might result in GraphQL queries that fail, or take a long time to run.

  To correct the problem, `damAssetLucene` has to be configured to include the following two properties under `/indexRules/dam:Asset/properties`:

  * `contentFragment`
    * `jcr:primaryType="nt:unstructured"`
    * `name="jcr:content/contentFragment"`
    * `propertyIndex="{Boolean}true"`
    * `type="Boolean"`
  * `model`
    * `jcr:primaryType="nt:unstructured"`
    * `name="jcr:content/data/cq:model"`
    * `ordered="{Boolean}true"`
    * `propertyIndex="{Boolean}true"`
    * `type="String"`

  After the index definition is changed, a reindexing is required (`reindex` = `true`).

  After these steps, the GraphQL queries should perform faster.

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched. The background query fails. That is, the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

* If you upgrade your [!DNL Experience Manager] instance from 6.5.0 - 6.5.4 to the latest Service Pack on Java&trade; 11, you see `RRD4JReporter` exceptions in the `error.log` file. To stop the exceptions, restart your instance of [!DNL Experience Manager]. <!-- THIS BULLET POINT WAS UPDATED AS PER CQDOC-20021, JANUARY 23, 2023 --> 

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* The following errors and warning messages may be displayed during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at `granite/operations/maintenance`.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` : No maintenance windows found at `granite/operations/maintenance`.
  * The hotspot in a Dynamic Media interactive image is not visible when previewing the asset through the Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* Starting with AEM 6.5.15, the Rhino JavaScript Engine provided by the ```org.apache.servicemix.bundles.rhino``` bundle has a new hoisting behavior. Scripts that use the strict mode (```use strict;```) have to declare their correct variables. Otherwise, they do not get run, and end up throwing a runtime error.
 
* Installing tagging related out-of-the-box content by way of an official update package resets the languages property of the `/content/cq:tags` node to default. This action is true for Service Packs, Security Service Packs, Extended Feature Packs, Cumulative Feature Packs, patches, and so on. Therefore, it is necessary to add it from the properties before installation.

### Known issue for AEM Sites {#known-issues-aem-sites-6522}

* Content Fragments-Preview fails due to DoS protection for a large tree of fragments. See the [KB article about Default GraphQL Query Executor configuration options](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-23945) (SITES-17934)


### Known issues for AEM Forms {#known-issues-aem-forms-6522}

* After installing AEM Forms JEE Service Pack 21 (6.5.21.0), if you find duplicate entries of Geode jars `(geode-*-1.15.1.jar and geode-*-1.15.1.2.jar)` under the `<AEM_Forms_Installation>/lib/caching/lib` folder (FORMS-14926), perform the following steps to resolve the issue:

  1. Stop the locators, if they are running.
  1. Stop the AEM Server. 
  1. Go to the `<AEM_Forms_Installation>/lib/caching/lib`. 
  1. Remove all the Geode patch files except `geode-*-1.15.1.2.jar`. Confirm that only the Geode jars with `version 1.15.1.2` are present.
  1. Open the command prompt in administrator mode.  
  1. Install the Geode patch using the `geode-*-1.15.1.2.jar` file. 

* If a user tries to preview a draft letter with saved XML data, it gets stuck in `Loading` state for some specific letters. To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (FORMS-14521)
  
* After upgrading to AEM Forms Service Pack 6.5.21.0, the `PaperCapture` service fails to perform OCR (Optical Character Recognition) operations on PDFs. The service does not generate output in the form of a PDF or a log file. To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (CQDOC-21680)

* When users upgraded from AEM 6.5 Forms Service Pack 18 or 19 to Service Pack 20 or 21, they encountered a JSP compilation error. This error prevented them from opening or creating adaptive forms. It also caused issues with other AEM interfaces. Those interfaces included the page editor, AEM Forms UI, Workflow editor, and System Overview UI. (FORMS-15256)

  If you face such an issue, perform the following steps to resolve it:
    1. Navigate to the directory `/libs/fd/aemforms/install/` in CRXDE.
    1. Delete the bundle with the name `com.adobe.granite.ui.commons-5.10.26.jar`.
    1. Restart your AEM Server.

* After updating to AEM Forms Service Pack 20 (6.5.20.0) with the Forms Add-On, configurations relying on the legacy Adobe Analytics Cloud Service using credential-based authentication stop working. This issue prevented analytics rules from executing correctly. To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (FORMS-15428)

* When a user updates to AEM Forms Service Pack 20 (6.5.20.0) on the JEE server and generates PDFs using output services, the PDFs render with accessibility issues. To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (LC-3922112)
* When a user generates Tagged PDFs using the output service on JEE, it shows "Inappropriate structure warning." To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (LC-3922038)
* When a form is submitted on AEM Forms JEE, the instances of a repeating XML element are removed from the data. To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (LC-3922017)
* When a user in a Linux&reg; environment renders an adaptive form (on JEE) in HTML, it fails to render properly. To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (LC-3921957)
* When a user converts an XTG file to PostScript format using the Output Service on AEM Forms JEE, it fails with the error: `AEM_OUT_001_003: Unexpected Exception: PAExecute Failure: XFA_RENDER_FAILURE`. To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (LC-3921720)
* After upgrading to AEM Forms Service Pack 18 (6.5.18.0) on JEE server, when a user submits a form, it fails to render HTML5 or PDF Forms and XMLFM crashes. To download and install the hotfix, refer to the [Adobe Experience Manager Forms Hotfixes](/help/release-notes/aem-forms-hotfix.md#hotfix-for-adaptive-forms) article. (LC-3921718)
* In the Print Preview of the Interactive Communications Agent UI, the currency symbol (such as the dollar sign $) is inconsistently displayed for all field values. It appears for values up to 999 but is missing for values of 1000 and above. (FORMS-16557)
* Any modifications to nested layout fragments' XDP in an Interactive Communication are not reflected in the IC editor. (FORMS-16575)
* In the Print Preview of the Interactive Communications Agent UI, some calculated values are not displayed correctly. (FORMS-16603)
* When the letter is viewed in Print Preview, the content is changed. That is, some spaces disappear, and certain letters are replaced with 'x'. (FORMS-15681)
* When a user configures a WebLogic 14c instance, the PDFG service in AEM Forms Service Pack 21 (6.5.21.0) on JEE running on JBoss fails due to classloader conflicts involving the SLF4J library. The error is displayed as follows (CQDOC-22178):
  
    ```java

    Caused by: java.lang.LinkageError: loader constraint violation: when resolving method "org.slf4j.impl.StaticLoggerBinder.getLoggerFactory()Lorg/slf4j/ILoggerFactory;"
    the class loader org.ungoverned.moduleloader.ModuleClassLoader @404a2f79 (instance of org.ungoverned.moduleloader.ModuleClassLoader, child of 'deployment.adobe-livecycle-jboss.ear'
    @7e313f80 org.jboss.modules.ModuleClassLoader) of the current class, org/slf4j/LoggerFactory, and the class loader 'org.slf4j.impl@1.1.0.Final-redhat-00001' @506ab52
    (instance of org.jboss.modules.ModuleClassLoader, child of 'app' jdk.internal.loader.ClassLoaders$AppClassLoader) for the method's defining class, org/slf4j/impl/StaticLoggerBinder,
    have different Class objects for the type org/slf4j/ILoggerFactory used in the signature

    ```

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.22.0](/help/release-notes/assets/65220-bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.22.0](/help/release-notes/assets/65220-packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/en/docs/customer-one/using/home).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65)
>* [Subscribe to Adobe Priority product updates](https://www.adobe.com/subscription/priority-product-update.html)
