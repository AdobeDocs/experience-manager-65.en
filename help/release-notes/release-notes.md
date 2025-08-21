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
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, May 29, 2025. In addition, a list of Forms fixes and enhancements is added to this section. -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.23.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, May 22, 2025 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.23.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.23.0 {#what-is-included-in-aem-6523}

[!DNL Experience Manager] 6.5.23.0 includes new features, key customer-requested enhancements, and bug fixes. It also includes performance, stability, and security improvements released since the initial availability of 6.5 in April 2019. [Install this Service Pack](#install) on [!DNL Experience Manager] 6.5.

<!-- UPDATE FOR EACH NEW RELEASE -->

## Key features and enhancements

<!--### Sites {#sites}

* A () -->

<!--
### [!DNL Assets]

* A ()
-->

### Forms {#forms-sp23}

Key features and enhancements in this release include the following:

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

* FORMS-20533, FORMS-20532: AEM Forms now includes an upgrade of Struts version from 2.5.33 to 6.x. The support was added via a [Hotfix](/help/release-notes/aem-forms-hotfix.md) that you can [download and install](/help/release-notes/aem-forms-hotfix.md) to add support for the latest version of Struts.

* **LC-3922769**: Certain AEM Forms features now require OpenSSL 3 to function correctly. The system must have OpenSSL 3 installed with libraries `libcrypto.so.3` and `libssl.so.3`. As security updates are only available in versions with OpenSSL 3.0.14 and above, and SafeLogic support ends in February 2025, we have removed bsafe and now use OpenSSL 3 for security compliance. For platform compatibility and detailed requirements, see [Supported Platforms for AEM Forms on JEE](/help/forms/using/aem-forms-jee-supported-platforms.md) and [Technical Requirements](/help/sites-deploying/technical-requirements.md). 

  **To verify OpenSSL 3 installation:**
  
  * **RHEL/CentOS/Fedora-based systems**: `rpm -qa | grep   openssl3`
  * **Ubuntu/Debian-based systems**: `dpkg -l | grep openssl3`
  * **Alternative verification**: `ldd /path/to/XMLForm |   grep -E 'libcrypto.so.3|libssl.so.3'` (if libraries are in  LD_LIBRARY_PATH)





<!--* **Two-Factor authentication with SAML for AdminUI** 

  AdminUI in AEM Forms JEE now supports two-factor authentication using Security Assertion Markup Language (SAML) single sign-on (SSO), providing stronger security and a seamless login experience for administrators, similar to what is available in HTML Workspace. 

#### New GA features in AEM Forms {#ga-aem-forms-sp23}

* A ()

#### New Beta features in AEM Forms {#beta-aem-forms-sp23}
-->

## Fixed issues in Service Pack 23 {#fixed-issues}

<!-- 6.5.23.0 REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS THAT YOU WANT TO HIGHLIGHT IN THIS RELEASE? -->

<!-- UPDATE BELOW FOR EACH NEW RELEASE --> 

### [!DNL Sites]{#sites-6523}

#### Accessibility {#sites-accessibility-6523}

* Canvas sections in AEM Editor pages now support full keyboard accessibility. Users can activate section titles and edit buttons using only the keyboard, without relying on mouse hover. This update ensures compliance with WCAG 2.1.1 and improves usability across components (such as Teaser, Image, Carousel, Layout, Timewarp, and Annotation modals). (SITES-25256) <!-- 6.5 LTS SP1 -->
* Fixed an accessibility issue in the AEM Page Editor where keyboard focus unexpectedly resets to the start of the Demographic toolbar after activating buttons such as Persona, Cart, or Abandoned. Focus now remains on the activated button to support consistent keyboard navigation and screen reader workflows. (SITES-25306) 
* Fixed a critical accessibility issue in AEM Page Editor where canvas elements across multiple dialog boxes and modals (for example, Asset rail or Layout preview) could not be operated using only a keyboard. All interactive canvas elements now support keyboard-only navigation, ensuring compliance with WCAG 2.1 success criterion 2.1.1 (SITE-25256) 
* Fixed an accessibility issue in the Sites Admin UI where interactive list items in the Create pop-up used incorrect ARIA roles. Elements that behaved like links were assigned `role="listitem"` instead of `role="menuitem"`, violating ARIA design patterns and confusing screen readers. Updates ensure that all list components follow proper semantic roles for improved keyboard and assistive technology support. (SITES-24493) 
* Fixed accessibility label association issue for page title and tags fields. The AEM interface now correctly associates accessibility labels with the "Title" and "Page Title" fields when using screen readers like JAWS. The fix ensures proper label reading and improves ADA compliance across page creation, properties, and move workflows. (SITES-27149) 
* Fixed an accessibility issue with table identification in the permissions dialog box. The permissions table in AEM now uses correct ARIA roles and attributes to ensure screen readers like JAWS properly identify it as a table. The fix improves accessibility compliance and ensures that users receive accurate navigation and content announcements. (SITES-27140) 
* Fixed missing visual label for comment input fields in timeline. Corrected missing visual labels for "comment" input fields under the timeline section to improve accessibility. The update ensures that screen readers can accurately announce the field labels. This experience enhances form navigation and submission for all users, particularly those individuals that rely on assistive technologies. (SITES-26903) 
* Fixed keyboard accessibility for ellipsis button in timeline comments. Enabled keyboard navigation for the ellipsis (three dots) button next to comments under the timeline section. Users can now access and interact with the button using the tab key, improving accessibility for users who rely on keyboard-only navigation. (SITES-26891) 
* Improved NVDA/Narrator announcements for search results in selection dialog boxes. Updated the Open Selection dialog box to announce whether search results are found or not when using screen readers, such as NVDA or Narrator. This improvement helps users relying on assistive technologies understand the outcome of their search actions without needing visual confirmation. (SITES-26883) 
* Corrected ARIA role for ellipsis icon beside comment input field. Updated the ellipsis (three dots) icon beside the comment input field to use the correct ARIA role, ensuring screen readers can accurately identify the element. This improvement enhances accessibility compliance and improves the experience for users relying on assistive technologies. (SITES-26881) 
* Corrected invalid ARIA attributes in Coral UI components. Updated Coral UI components to ensure all ARIA attributes use valid values, improving accessibility-compliance. In particular, cases were addressed where invalid values like `aria-modal="dialog"` were incorrectly assigned. This enhancement enables screen readers to interpret dialog box elements correctly, improving accessibility for users relying on assistive technologies. (SITES-26873) 
* Improved visibility and tooltips for icons in Reflow scenarios. Enhanced the Reflow behavior to ensure tooltips display correctly for **Download**, **Reprocess assets**, and **Checkout** icons. Focused on an accessibility issue where icons and their labels became invisible when the viewport resized or browser zoom settings changed. This fix supports users with low vision by maintaining visibility and providing proper icon descriptions during Reflow. (SITES-26871) 

#### Admin User Interface{#sites-adminui-6523}

Fixed Universal Editor URL Service exception with missing Externalizer endpoints. The Universal Editor URL Service now handles missing author, publish, or local Externalizer endpoints without throwing exceptions. Admin users can open the Page Editor successfully even when some Externalizer configurations are incomplete. (SITES-28877)  <!-- LTS -->

#### Classic UI{#sites-classicui-6523} 

* An issue in Classic UI dialogs boxes where toggling a button would hide a text area and fail to display it again on subsequent clicks. The fix ensures that the text area properly reappears when toggled, restoring expected behavior and preventing disruptions to dynamic dialog box workflows. (SITES-30230) 
* Fixed broken Classic UI image asset finder functionality after Service Pack 22 upgrade. The Classic UI image asset finder now properly handles asset names containing spaces or special characters. This update ensures that the asset finder encodes file names correctly, preventing search failures and allowing authors to locate and select image assets without errors. (SITES-29151) 

#### [!DNL Content Fragments]{#sites-contentfragments-6523}

* Fixed validation test failure for `DeleteVariationIT.testUpdateBasic`. The `DeleteVariationIT.testUpdateBasic` test no longer fails during Service Pack validation runs. The fix corrects a missing text mapping issue in the JSON handling logic, ensuring test stability and avoiding unnecessary test disruptions. (SITES-28022)
* AEM now prevents performance degradation caused by malformed XMP metadata in image assets. Assets that contain invalid or non-compliant XMP property names, such as those with numeric segments or unqualified structures, no longer trigger repeated warning logs during processing. The system filters out problematic metadata to ensure that asset ingestion and validation is complete without errors. (SITES-30683) <!-- AEM 6.5 LTS SP1 -->


<!-- #### [!DNL Content Fragments] - Admin{#sites-admin-6523}

* A () -->


#### [!DNL Content Fragments] - Fragments Editor{#sites-fragments-editor-6523}

Other authors can still publish Content Fragments even when another author checks them out, which is contrary to the intended behavior of the checkout feature. This fix prevents other users from seeing or using the publish buttons in the authoring interface when a Content Fragment is checked out. (SITES-30578)  <!-- LTS -->

#### [!DNL Content Fragments] - GraphQL API {#sites-graphql-api-6523}

Fixed GraphQL QueryValidationError with Content Fragment schemas. Refreshing the `cq-dam-cfm-graphql` bundle corrects schema validation errors when using Content Fragment references. The fix ensures that GraphQL queries function properly without requiring manual schema re-alignment or re-publishing after package deployments. (SITES-27001)  <!-- LTS -->


<!-- #### [!DNL Content Fragments] - GraphQL Query Editor{#sites-graphql-query-editor-6523}

* A () -->

<!-- #### [!DNL Content Fragments] - REST API{#sites-restapi-6523}

* A () -->


#### Component Console{#sites-component-console-6523}

Improvements to "Component Live Usage" page loading. Optimizes the "Components Live Usage" page in AEM to prevent empty rows from appearing when scrolling through large datasets. Users loading components with extensive usage references can now experience continuous data loading without unnecessary gaps or empty entries. This experience improves page navigation, tracking accuracy, and management efficiency across component usage reporting. (SITES-26454) 

#### Core Backend{#sites-core-backend-6523}

* Fixed Content Finder asset listing failure caused by invalid asset names. The Content Finder now handles asset names with non-encodable characters correctly. Asset listing in the Page Editor no longer fails or throw exceptions when encountering assets with problematic names. (SITES-28722)  
* An issue where the `SearchPathLimiter` component generated excessive log entries by printing messages at the ERROR level for each invocation. This behavior began after Service Pack 17 and led to performance concerns due to extremely high log volumes. The fix downgrades the log level to DEBUG, significantly reducing log noise and improving system monitoring and diagnostic efficiency. (SITES-29835) 
* Improperly formatted XMP metadata triggered an error during processing of image assets in the `ValidationDataServlet`. The fix ensures compliant metadata handling and avoids redundant parsing of invalid properties. (SITE-30683)  <!-- LTS -->


<!-- #### Core Components{#sites-core-components-6523}

* A () -->

<!-- #### Campaign integration{#sites-campaign-integration-6523}

* A () -->

<!-- #### Experience Fragments{#sites-experiencefragments-6523}

* A () -->

<!-- #### Foundation Components (Legacy){#sites-foundation-components-legacy-6523}

* A () -->


#### Launches{#sites-launches-6523}

* Fixed incorrect launch date display between December 25 and December 31. The Launches UI now displays dates between December 25 and December 31 with the correct year. The fix ensures that dates no longer incorrectly show the following year, avoiding confusion during campaign planning and scheduling. (SITES-28706) 
* Fixed broken AEM Launch templates after Service Pack 22 upgrade. AEM Launch templates now load correctly after a Service Pack 22 upgrade. The fix corrects invalid data in internal launch configurations, allowing users to view, edit, and create Launches without errors or missing fields. (SITES-28504) 


<!-- #### Link Checker{#sites-link-checker-6523}

* A () -->

<!-- #### MSM - Live Copies{#sites-msm-live-copies-6523}

* A () -->


#### Page Editor{#sites-pageeditor-6523}

* Fixed AssetPicker loading issue at lower screen resolutions. The AssetPicker now loads assets correctly when users scroll at lower screen resolutions (1728&times;1117 or smaller). Users no longer experience missing assets while scrolling, improving asset management across different device breakpoints. (SITES-28065) 
* Fixed missing screen reader announcement for page lock and unlock actions. The Page Editor now announces the "Info: The page has been locked/unlocked" message correctly when users activate the lock/unlock button. The fix improves accessibility compliance and ensures that screen reader users receive dynamic updates during page editing. (SITES-27143) 
* Improved keyboard focus behavior for component actions in AEM Authoring. Enhanced keyboard navigation in the AEM Author tool to ensure focus remains on the newly created or selected component after actions such as Configure, Delete, or Convert. Previously, focus shifted to the top of the page, causing accessibility compliance issues. This update improves the user experience for keyboard and assistive technology users. It does so by maintaining logical focus progression within the editing workflow. (SITES-26549) 
* Improved tab navigation in Author dialog boxes. Enhances keyboard navigation in AEM Author dialog boxes by allowing users to continue tabbing forward after reaching the Description edit box. Previously, focus trapping at the Description field blocked further navigation without using special key combinations. The update ensures that users can move through fields seamlessly using only the Tab key, improving accessibility compliance and user experience. (SITES-26524) 
* A regression was introduced in AEM 6.5 Service Pack 22 that prevented users from including spaces in Launch titles. The fix restores the ability to use spaces, allowing teams to define and organize Launch names more flexibly, in line with expected behavior. (SITES-29414) 
* Fixed resizing issue for components inside Layout Containers after hide/unhide actions. The Page Editor now properly calculates column values after hiding and unhiding a Layout Container. Users can resize components without errors, and columns display correctly during resizing actions. (SITES-28463) 
* Fixed Content Tree button misplacement in Page Editor. The Page Editor now correctly positions the Content Tree configuration button under the intended "Head Teaser" dialog box instead of the wrong section. The fix updates the CSS for the Content Tree dialog box to use `top:0` instead of `bottom:0`, ensuring proper button placement. (SITES-28448) 


<!-- #### Replication{#sites-replication-6523}

* A () -->


#### Rich Text Editor{#sites-rte-6523}

Fix unexpected `<br>` tags in Rich Text Editor with plaintext paste mode. The Rich Text Editor now correctly handles cut-and-paste operations when using plaintext `defaultPasteMode`. The fix prevents the insertion of unexpected `<br>` tags when users cut and paste text inside RTE fields, ensuring clean formatting during content editing. (SITES-27780) 

#### Universal editor {#sites-universal-editor-6523}

* When multiple requests containing the query parameter are sent to AEM, the login-token cookie may not be returned in time, which can lead to a failed login. (SITES-30659)  <!-- LTS -->
* To ensure compatibility and support with SAML handlers, you must configure the `service.ranking` property so that the `Query Token Auth` handler runs *before* the `SAML Auth` handler. (SITES-29684) 

### [!DNL Assets]{#assets-6523}

* The following issues occur on [!DNL AEM] On-Premise (6.5.22.0) Navigation page after selecting  ![Assets](/help/assets/assets/Smock_Asset_18_N.svg)**[!UICONTROL Assets]**, navigating to **[!UICONTROL Search Adobe Stock]** folder, and selecting a stock image:
  * The selected stock image cannot be licensed and saved as clicking **[!UICONTROL License & Save]** displays an empty dropdown.
  * Selecting the Stock image or re-entering the stock page URL redirects to the [!DNL AEM] homepage, preventing access to the Adobe Stock image. (ASSETS-48687) 
* Issues while managing folders if the name of the folder includes a `/` in its name on the [!DNL AEM] On-Premise (6.5.22.0) Navigation page. (ASSETS-46740)  
* On [!DNL AEM] 6.5, the asset details page does not load from ![Collection](/help/assets/assets/Smock_Collection_18_N.svg)**[!UICONTROL Collections]** view due to high memory usage. (ASSETS-46738) 
* Integration issues with [!DNL InDesign] as `Day CQ DAM Mime Type OSGI` Service incorrectly identifies [!DNL InDesign] files as `x-adobe-indesign` instead of `x-indesign`. (ASSETS-45953) 
* [!DNL AEM 6.5.21] session leak traced to the out-of-the-box **[!UICONTROL Scheduled publish to Brand Portal]** workflow step. (ASSETS-44104) 
* **[!UICONTROL Out of Memory (OOM)]** errors display in [!DNL AEM] when processing and publishing images. This issue was due to deprecated methods in workflows, such as **[!DNL Dam Asset update]** and **[!DNL Dynamic Media: Reprocess assets]**. (ASSETS-43343) 
* After you make a minor change, such as updating the title, you reopen and resave the **[!DNL Connected Assets configuration]** on the local Sites instance. The remote instance then loses its connection to the local instance. As a result, it cannot establish communication with the local Sites instance. (ASSETS-44484) 
* In [!DNL AEM 6.5.21], when an asset upload in list view is canceled and a second upload is performed, [!DNL AEM] displays a **[!UICONTROL 0 of NaN assets uploaded]** error. (ASSETS-44124) 

#### [!DNL Dynamic Media]{#assets-dm-6523}

Added a metadata property (`jcr:content/metadata/dam:scene7SmartCropStatus`) to assets for identifying failed Smart Crop generations. Enables efficient search, filtering, and reprocessing of assets with Smart Crop issues through manual or automated workflows. (ASSETS-46237) 

#### [!DNL Dynamic Media] - Hybrid Mode {#assets-dm-hybrid-6523}

##### Dynamic Media - Hybrid add-on package (AEM 6.5.23 and later)

Starting with AEM 6.5 Service Pack 23, a new add-on package is available for Dynamic Media - Hybrid mode. This package includes the `cq-scene7-imaging` bundle specifically compatible with the Dynamic Media - Hybrid run mode.

**Key fix included**

Fixed an issue in Dynamic Media - Hybrid deployments where updates to the `catalog.expiration` parameter under `/conf/global/settings/dam/dm/imageserver` were not reflected on the server or author URLs, despite replication succeeding without errors. The update ensures consistent expiration values between CRX/DE, the server response, and public delivery URLs. In turn, it improves the cache behavior and reliability of image transformations. (ASSETS-44837)

**Important considerations**

* The `cq-scene7-imaging` bundle in the base AEM 6.5.23 (and later) installation is *not compatible* with Dynamic Media - Hybrid run mode.
* Installing Service Pack 23 (and later) alone does *not automatically update* existing `cq-scene7-imaging` bundle on AEM instances configured for Dynamic Media - Hybrid (`-r dynamicmedia` run mode).

**When to install the Hybrid add-on package**

* When upgrading directly to AEM 6.5.23 (and later) from AEM 6.5.19 or earlier.
* When needing fixes specific to the Dynamic Media - Hybrid functionality.
* When deploying a new Dynamic Media - Hybrid instance directly from AEM 6.5 GA (General Availability) to Service Pack 23 (and later).

**Download Hybrid add-on package**

The Hybrid add-on package is publicly available on Adobe Software Distribution starting Thursday, May 22, 2025, with the official release of AEM 6.5.23. Users can find it by searching for **AEM 6.5 Dynamic Media Hybrid Add-on Package** in Software Distribution.


### [!DNL Forms]{#forms-6523}

#### Forms Designer 

* When a user exports the data for an XFA-based PDF using the exportDataAPI, the resulting XML shows discrepancies when compared with the XML data exported manually using Acrobat Reader. Values of some fields were missing in the output compared to the output generated from Acrobat Reader. (LC-3922791)  

* In AEM Forms 6.5.22.0, generating a tagged PDF with the Output Service in Workbench adds an unexpected label tag under the reference tag in a table of contents item. (LC-3922756) 

* When a user places field captions with bottom or right alignment in AEM Forms Designer, the tag tree includes only the caption without the corresponding value, leading to incomplete accessibility tagging. (LC-3922619) 

* On upgrading from AEM Forms 6.5 Service Pack 6 to AEM Forms Service Pack 20, the QR codes in generated PDFs become unreadable. The alternative text for the QR codes also fails accessibility testing, affecting screen reader compatibility. (LC-3922551) 

* When a user renders a letter in Agent UI on AEM Forms Service Pack 18, the content fails to display correctly due to the FormService.render() API. (LC-3922461) 

#### Forms

* In AEM Forms, enabling "Allow Rich Text for Title" on the root panel causes "Exclude Title from Document of Record" on a nested panel to hide the root panel's title incorrectly. It does so in the generated Document of Record. (FORMS-19696) 

* The system ignores the custom `sling:resourceType` assigned through `aem:afProperties` in a JSON schema on AEM 6.5. The custom resource type is ignored during rendering. (FORMS-19691) 

* When a user submits an Adaptive Form with prefilled attachments using URIs, the form submission fails with a NullPointerException due to missing binary data. (FORMS-19371) (FORMS-19486) 

* When a user uploads a PDF under the 'Forms and Documents' section in AEM 6.5 Forms, the timeline feature stops functioning. (FORMS-19407)(FORMS-19234) 

* When a user uploads files using the out-of-the-box (OOTB) file attachment component in AEM Forms, security vulnerabilities are identified. This issue leads to potential interception of the submission process by unauthorized entities. (FORMS-19271) 

* When a user configures an out-of-the-box Adaptive Form in AEM Forms to generate a Document of Record (DoR) automatically, the "Title" field in Acrobat Reader's Document Properties does not display the captured DoR title. By default, the form title does not appear in place of the filename. (FORMS-19263) 

* When a user opens an Interactive Communication in Agent UI, the prefilled data cannot be completely erased; upon removal, it automatically refills with the same data. (FORMS-19151) 

* When a user previews a date field in the Agent UI, the date unexpectedly changes. This issue occurs due to time zone discrepancies between the VM's UTC setting and the system's interpretation of the date. (FORMS-19115) 

* When a user submits a form, file attachments may duplicate, leading to multiple uploads of the same file. (FORMS-19045)(FORMS-19051) 

* Adding coordinators to policy sets in AEM 6.5 Document Security fails across both production and lower environments. (FORMS-18603, FORMS-18212, FORMS-19697) 

* When a user clicks the "datepicker-calendar-icon" in desktop mode with an empty field in AEM Forms Service Pack 22, an error occurs due to the undefined _$focusedDate variable, disrupting associated custom scripts. (FORMS-18483)(FORMS-18268) 

* On AEM Forms Service Pack 19 (6.5.19.0), when a customer previews a letter, the 'Amount in words' field fails to display or update number values incorrectly, leading to misalignment and missing spaces in the content. (FORMS-18437, FORMS-17330, FORMS-18209, FORMS-18557, CTG-4150848,FORMS-19614, LC-3922004) 

* When a customer previews a saved letter in AEM Forms 6.5 SP19 on RHEL, the content misaligns, spaces are missing, and unexpected characters like 'x' appear. (FORMS-18422)(FORMS-17641) 

* When a user navigates between tabs in AEM Forms, selecting components on the first tab becomes unresponsive. (FORMS-18345) 

* In AEM Forms 6.5.21.0, when a user converts an HTML file to PDF using the WebToPDF option, the output PDF is missing the header section, including metadata and title tags. (FORMS-18223, FORMS-17835, FORMS-19642, FORMS-18224) 

* In the AEM JEE Process Manager SDK, when a user invokes the retryAction(long actionOid) method, the system incorrectly retries the first action found in the tb_action_instance table. This workflow occurs even when a specific action ID is provided or when the ID is null, resulting in unintended behavior. (FORMS-18187) 

* After updating to SP22, a user encounters issues where the saved draft and submission functionalities fail without displaying any error message. (FORMS-18069) 

* In AEM 6.5.21.0, transitioning from XSD-based foundation components to core components prevents the implementation of cross-file references in JSON schemas, impacting Adaptive Forms migration. (FORMS-18065) 

* When a user previews a letter in the Agent UI, the date field shows an incorrect value due to IC time conversion issues. These discrepancies arise from time zone differences between the VM environment and the system's interpretation of time (UTC versus local time). (FORMS-17988) (FORMS-17248) 

* When a user previews letters using Notice IC templates in AEM Forms, PDF generation times vary significantly, from 1.5 seconds to more than 10 seconds, even on the same server. This inconsistency affects business critical workflows. (FORMS-17951) 

* When a user binds a Scribble Signature object in an Adaptive Form to an XDP using the 'Data Sources' option, changes cannot be saved. The reason is due to persistent aspect ratio validation errors, even when using valid values. (FORMS-17587) 

* When a user uses a specific XDP with many hidden fields for document fragments, AEM creates CRX nodes with the `cm:optional` property set to false, which causes the Interactive Communication (IC) submission to fail. (FORMS-17538) 

* On AEM Forms 6.5.19.0, when a customer previews a letter, the numeric box field fails to handle negative values correctly when digit limits for Lead and Frac are defined. This issue occurs due to the use of parseFloat, which treats the minus sign as part of the number. (FORMS-17451)

* On AEM Forms 6.5, when a letter is previewed, the use of the "*" wildcard in the Adobe.json file is noticed, raising a concern about its purpose and potential modification. (FORMS-17317)

* When a user uses a screen reader on the `Apply for a Fixed Rate Saver joint account` the headings are incorrectly announced as `clickable`, causing accessibility issues. (FORMS-17038) 

* When a form is embedded, the generated iframe is missing a title attribute, leading to an accessibility compliance issue. (FORMS-17010)

* Downloading a form using the Forms Manager UI always includes associated dependencies, such as themes and fragments. (FORMS-15811) 

* When a user accesses the form on mobile devices (iOS and Android&trade;), the 'next' and 'previous' buttons on the first page are disabled. However, the screen reader does not identify them as disabled. (FORMS-15773)

* When a user saves a large form with fragments and lazy loading enabled, it fails to retrieve drafts, disrupting the workflow. (FORMS-19890, FORMS-19808) 

#### Forms JEE 

* When a user reconfigures the database in AEM Forms, the connection fails due to hardcoded parameters. (FORMS-19568, FORMS-17621) 

* When a user sets up AEM 6.5 with MySQL 8.4 using the partial turnkey method, the LiveCycle Configuration Manager (LCM) fails to recognize the required MySQL connector driver. This causes the database connection test and setup to fail. (FORMS-19442) 

* When a user runs LCM with JDBC 12.8.1 on JRE 11 in a JEE environment, the setup fails due to incompatibility issues. (FORMS-19276)

* When a user opens a task in AEM On-Premise, the system executes the Workspace Start Action Profile instead of the AssignedUserProfile. (FORMS-19065) 

* When a user uses the retryAction(long actionOid) method in the AEM JEE Process Manager, unexpected behavior occurs. (FORMS-18357)(FORMS-18187)

* On AEM Forms 6.5.21.0, the PDFG conversion fails with the following error: (FORMS-16851)(FORMS-14613)   
 
#### Forms Captcha {#forms-captcha-6523} 

* Improved reCAPTCHA alerting in Adaptive Forms by updating submit error codes to 400. Also, refined log alerts to distinguish between timeouts, expirations, and bot detection failures, enhancing troubleshooting accuracy and system observability. (FORMS-19240) 
* Closed an unclosed `ResourceResolver` instance in `ReCaptchaConfigurationServiceImpl` to prevent potential resource leaks and improve system stability when using reCAPTCHA integrations in AEM Forms. (FORMS-19242) 
* Improved CAPTCHA configuration handling for AEM Forms by ensuring the correct configuration binds to each form when multiple entries exist in the `/conf/global` folder. Prevents unintended use of incorrect CAPTCHA settings when the configuration container is not explicitly selected. (FORMS-19239)

<!--
#### XMLFM {#forms-xmlfm-6523}

* A () -->

<!--
#### [!DNL Adaptive Forms] {#adaptive-forms-6523}

* A () -->

<!--
#### [!DNL Forms Designer] {#forms-designer-6523}

* A () -->


### Foundation {#foundation-6523}

* Fixed an issue in Coral Alert Banners where text color appears white instead of black after upgrading to Service Pack 21. Ensures that correct styling is applied to maintain proper contrast and readability of alert messages across the interface. (NPR-42359) 
* Added support for OAuth integration in Smart Tags configuration to align with the deprecation of JWT (JSON Web Token). Ensures continued functionality of Smart Tags features using updated authentication methods. (NPR-42296) 

#### Apache Felix {#foundation-apachefelix-6523}

Fixed a NullPointerException that occurred when uploading private key files to a binary-type property field in CRX, restoring compatibility that was present through Service Pack 16. Enables secure keyfile upload workflows in AEM Managed Services without server errors or disruption to certificate renewal processes. (CQ-4359178) 


<!--
#### Campaign{#foundation-campaign-6523}

* A () -->

<!--
#### Cloud Services{#foundation-cloudservices-6523}

* A () -->

<!--
#### Communities {#foundation-communities-6523}

* A () -->

<!--
#### Content distribution{#foundation-content-distribution-6523}

* A () -->

<!--
#### CRX {#foundation-crx-6523}

* A () -->


#### Granite{#foundation-granite-6523}

* Resolved OSGi dependency cycles between Apache Sling scripting services that caused delays or failures when loading HTML pages after upgrading to Service Pack 21. Updated internal service references to eliminate cyclic dependencies involving `SightlyScriptingEngineFactory` and related components, improving reliability and startup behavior of the scripting engine. (GRANITE-56808) 
* Updated JS Use Scripts in Apache Sling to load only On-demand instead of eagerly at startup, eliminating thread contention and reducing the risk of publish servers becoming unresponsive under load. This change improves server stability and response times during high-traffic scenarios by preventing resource locking caused by early script resolution. (GRANITE-56611) 
* Corrected an issue in AEM Omnisearch where placeholders for input fields incorrectly display as labels, leading to visual confusion. Ensures proper rendering of placeholders across filter fields, maintaining consistent and accessible form behavior. (GRANITE-51791) 
* Resolved a server error triggered when selecting more than 30 CFMs (Content Fragment Models) with multifield references in the Content Fragment model editor. Enhanced the filter suggestion component to support POST operations. This ability allows the proper handling of large reference sets during Content Fragment creation and improving stability for high-volume model configurations. (GRANITE-57164) 
* Resolved an issue in CFMs where clicking close to a checkbox toggled its state unintentionally. Updated styles to restrict click activation strictly to the checkbox element, preventing accidental user interactions and improving form usability and accessibility. (GRANITE-52384) 


<!--
#### Integrations{#foundation-integrations-6523}

* A () -->


#### Jetty{#foundation-jetty-6523}

Resolved an issue where SNI validation blocked API calls over HTTPS for AEM customers using Dispatcher SSL configurations with custom host headers. Introduces an option to disable SNI validation as part of Jetty configuration, enabling compatibility with specific reverse proxy setups where `mod_proxy` is not feasible. (NPR-42614) 


<!--
#### Localization{#foundation-localization-6523}

* A () -->

<!--
#### Oak {#foundation-oak-6523}

* A () -->


#### Platform{#foundation-platform-6523}

* Fixed inconsistent tag merging behavior by ensuring the merged tag value always displays correctly across assets, regardless of whether tags are created inline or through the standard tag creation method. Prevents residual values from `EN:title` fields from overriding merged tag display. (CQ-4358812) 
* Fixed repeated encoding of ampersand characters in tag values within the tag editing dialog box. Prevents extra "&amp;" entities from being appended on each save, ensuring tag values remain clean and consistent across edits and avoiding display errors in authored content. (CQ-4359048) 
* Resolved a `ClassCastException` error that prevents email delivery on Adaptive Form submission in AEM 6.5 running on WebSphere&reg;. The fix enables successful email transmission by ensuring compatibility between `com.sun.mail.handlers.text_plain` and `java.activation.DataContentHandler`, aligning with the mail handler configuration expected by WebSphere&reg; environments. (NPR-42500) 
* Improved error handling in Package Manager by ensuring AEM surfaces a clear message when the installation fails and the error response is otherwise empty. This fix prevents silent failures and aids in faster debugging during package deployment. (NPR-42375) 

<!--
#### Security{#foundation-security-6523}

* A -->

<!--
#### Sling{#foundation-sling-6523}

* A () -->


#### Translation{#foundation-translation-6523}

Fixed a NullPointerException (NPE) issue triggered when updating Content Fragments in workflows using **Update Language Copy**. This fix ensures that workflows do not enter a failed state or remain stuck in a running state when editing content tied to translation references. (NPR-42115) 

#### User interface{#foundation-ui-6523}

Adds missing `title` attributes to Coral UI dialog box buttons such as **Done** and **Cancel** in component edit dialog boxes to improve accessibility and enable automated validation. Ensures that buttons retain expected attributes across markup rendering, preventing failures in Selenium-based UI tests. (NPR-42412) 

#### WCM{#foundation-wcm-6523}

Fixed an issue that prevents pages from being added to translation jobs when using **Update Language Copy** in environments with Service Pack 19 or later. Ensures that translation workflows proceed as expected, enabling proper page transfer between language copies without manual intervention. (CQ-4357929) 

#### Workflow{#foundation-workflow-6523}

Resolved an issue in the `EmailNotificationServiceProcessor` where the `getSegmentId` method returns `null` after hotfix deployment, causing email triggers to fail during workflow processing. Restores correct segment ID resolution logic by ensuring the processor retrieves the required `SegmentInfo` values to support email notification workflows across AEM instances. (CQ-4359755) 


## Install [!DNL Experience Manager] 6.5.23.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.23.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The Service Pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.23.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.23.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.23.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->

<!-- FORMS For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->

### Install the Service Pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the Service Sack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.23.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>The dialog box on the Package Manager UI sometimes exits during the installation of the Service Pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installation is successful. Typically, this issue occurs in the [!DNL Safari] browser but can intermittently occur in any browser.

**Automatic installation**

There are two different methods that you can use to install [!DNL Experience Manager] 6.5.23.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.23.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.23.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

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

The UberJar for [!DNL Experience Manager] 6.5.23.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.22/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

  ```shell
    <dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.5.23</version>
    <scope>provided</scope>          
    </dependency>
  ```

>[!NOTE]
>
>UberJar and the other related artifacts are available on Maven Central Repository instead of Adobe Public Maven repository (`repo.adobe.com`). The main UberJar file is renamed to `uber-jar-<version>.jar`. So, there is no `classifier`, with `apis` as the value, for the `dependency` tag.



## Deprecated and removed features{#removed-deprecated-features}

See [Deprecated and removed features](/help/release-notes/deprecated-removed-features.md/) for a detailed list of all features deprecated or removed for AEM 6.5.

### SPA Editor {#spa-editor}

[The SPA Editor](/help/sites-developing/spa-overview.md) has been deprecated for new projects starting with release 6.5.23 of AEM 6.5. The SPA Editor remains supported for existing projects, but should not be used for new projects.

The preferred editors for managing headless content in AEM are now:

* [The Universal Editor](/help/sites-developing/universal-editor/introduction.md) for visual editing.
* [The Content Fragment Editor](/help/sites-developing/universal-editor/introduction.md) for form-based editing.

## Known issues{#known-issues}

<!-- THESE KNOWN ISSUES CARRY OVER EACH RELEASE. THE "PRODUCT UPDATES TEAM" IS SUPPOSED TO VERIFY EACH ISSUE AND LET YOU KNOW IF ANYTHING NEEDS TO BE ADDED, DELETED, OR CHANGED IN THIS LIST. -->

* **Issue with JSP scripting bundle in AEM 6.5.21-6.5.23 and AEM 6.5 LTS GA**
AEM 6.5.21, 6.5.22, 6.5.23, and AEM 6.5 LTS GA ship with the `org.apache.sling.scripting.jsp:2.6.0` bundle, which contains a known issue. The issue typically occurs under high load when the AEM instance handles many concurrent requests.

  When this issue occurs, one of the following exceptions may appear in the error logs alongside references to `org.apache.sling.scripting.jsp:2.6.0`:

  * `java.io.IOException: classFile.delete() failed`
  * `java.io.IOException: tmpFile.renameTo(classFile) failed`
  * `java.lang.ArrayIndexOutOfBoundsException: Index 0 out of bounds for length 0`
  * `java.io.FileNotFoundException`

  When this error occurs, the only recovery method is to restart the AEM instance.

  Contact Adobe Customer Support and reference this release note for a resolution.

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

### Known issue for AEM Sites {#known-issues-aem-sites-6523}

Content Fragments-Preview fails due to DoS protection for a large tree of fragments. See the [KB article about Default GraphQL Query Executor configuration options](https://experienceleague.adobe.com/en/docs/experience-cloud-kcs/kbarticles/ka-23945) (SITES-17934)

### Known issues for AEM Forms {#known-issues-aem-forms-6523}

>[!NOTE]
>
> Do not upgrade to Service Pack 6.5.23.0 for issues that do not have hotfixes available, as it may lead to unexpected errors. Upgrade to Service Pack 6.5.23.0 only after the required hotfixes are released. 

#### Issues with Hotfixes available {#aem-forms-issues-with-hotfixes}

The following issues have a hotfix available for download and installation. You can [download and install the Hotfix](/help/release-notes/aem-forms-hotfix.md) to resolve these issues:

* **FORMS-20203**: When a user upgrades the Struts framework from version 2.5.x to 6.x, the Policies UI in AEM Forms fails to display all configurations, such as the option to add a watermark.

* **FORMS-20360**: After upgrading to AEM Forms Service Pack 6.5.23.0, the ImageToPDF conversion service fails with the error:
    ```17:15:44,468 ERROR [com.adobe.pdfg.GeneratePDFImpl] (default task-49) ALC-PDG-001-000-ALC-PDG-011-028-Error occurred while converting the input image file to PDF. com/adobe/internal/pdftoolkit/core/encryption/EncryptionImp```

* **FORMS-20478**: When attempting to convert type 7/8 TIFF files to PDF, the conversion process fails with error "ALC-PDG-001-000-Image2Pdf conversion failed, caused by: com/sun/image/codec/jpeg/JPEGCodec" and "ALC-PDG-016-003-An unknown/unexpected error occurred during PDF post-processing." The system attempts to retry using TM ImageIO TIFF decoder but ultimately fails to complete the job.

* **FORMS-14521**: If a user tries to preview a draft letter with saved XML data, it gets stuck in `Loading` state for some specific letters.

* AEM Forms now includes an upgrade of Struts version from 2.5.33 to 6.x for the forms component. This delivers previously missed Struts changes that were not included in SP23. The support was added via a [Hotfix](/help/release-notes/aem-forms-hotfix.md) that you can download and install to add support for the latest version of Struts.

#### Other Known Issues {#aem-forms-other-known-issues}

* After installing AEM Forms JEE Service Pack 21 (6.5.21.0), if you find duplicate entries of Geode jars `(geode-*-1.15.1.jar and geode-*-1.15.1.2.jar)` under the `<AEM_Forms_Installation>/lib/caching/lib` folder (FORMS-14926), perform the following steps to resolve the issue:

  1. Stop the locators, if they are running.
  2. Stop the AEM Server. 
  3. Go to the `<AEM_Forms_Installation>/lib/caching/lib`. 
  4. Remove all the Geode patch files except `geode-*-1.15.1.2.jar`. Confirm that only the Geode jars with `version 1.15.1.2` are present.
  5. Open the command prompt in administrator mode.  
  6. Install the Geode patch using the `geode-*-1.15.1.2.jar` file. 

* When users upgraded from AEM 6.5 Forms Service Pack 18 or 19 to Service Pack 20 or 21, they encountered a JSP compilation error. This error prevented them from opening or creating adaptive forms. It also caused issues with other AEM interfaces. Those interfaces included the Page Editor, AEM Forms UI, Workflow editor, and System Overview UI. (FORMS-15256)

  If you face such an issue, perform the following steps to resolve it:
    1. Navigate to the directory `/libs/fd/aemforms/install/` in CRXDE.
    2. Delete the bundle with the name `com.adobe.granite.ui.commons-5.10.26.jar`.
    3. Restart your AEM Server.

* In the Print Preview of the Interactive Communications Agent UI, the currency symbol (such as the dollar sign $) is inconsistently displayed for all field values. It appears for values up to 999 but is missing for values of 1000 and above. (FORMS-16557)
* Any modifications to nested layout fragments' XDP in an Interactive Communication are not reflected in the IC editor. (FORMS-16575)
* In the Print Preview of the Interactive Communications Agent UI, some calculated values are not displayed correctly. (FORMS-16603)
* When the letter is viewed in Print Preview, the content is changed. That is, some spaces disappear, and certain letters are replaced with `x`. (FORMS-15681)
* **FORMS-15428**: After updating to AEM Forms Service Pack 20 (6.5.20.0) with the Forms Add-On, configurations relying on the legacy Adobe Analytics Cloud Service using credential-based authentication stop working. This issue prevented analytics rules from executing correctly.

* When a user configures a WebLogic 14c instance, the PDFG service in AEM Forms Service Pack 21 (6.5.21.0) on JEE running on JBoss&reg; fails due to classloader conflicts involving the SLF4J library. The error is displayed as follows (CQDOC-22178):
  
    ```java
    Caused by: java.lang.LinkageError: loader constraint violation: when resolving method "org.slf4j.impl.StaticLoggerBinder.getLoggerFactory()Lorg/slf4j/ILoggerFactory;"
    the class loader org.ungoverned.moduleloader.ModuleClassLoader @404a2f79 (instance of org.ungoverned.moduleloader.ModuleClassLoader, child of 'deployment.adobe-livecycle-jboss.ear'
    @7e313f80 org.jboss.modules.ModuleClassLoader) of the current class, org/slf4j/LoggerFactory, and the class loader 'org.slf4j.impl@1.1.0.Final-redhat-00001' @506ab52
    (instance of org.jboss.modules.ModuleClassLoader, child of 'app' jdk.internal.loader.ClassLoaders$AppClassLoader) for the method's defining class, org/slf4j/impl/StaticLoggerBinder,
    have different Class objects for the type org/slf4j/ILoggerFactory used in the signature.

    ```



## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in this [!DNL Experience Manager] 6.5 Service Pack release:

* [List of OSGi bundles included in Experience Manager 6.5.23.0](/help/release-notes/assets/65230-bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.23.0](/help/release-notes/assets/65230-packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are available to customers only. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/en/docs/customer-one/using/home).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/en/docs/experience-manager-65)
>* [Subscribe to Adobe Priority product updates](https://www.adobe.com/subscription/priority-product-update.html)
