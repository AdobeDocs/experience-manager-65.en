---
title: Release Notes for [!DNL Adobe Experience Manager] 6.5
description: Find release information, what's new, install how-tos, and a detailed change list for [!DNL Adobe Experience Manager] 6.5.
mini-toc-levels: 4
exl-id: cac14ac1-9cda-46ae-8aa3-94674bb79157
---
# [!DNL Adobe Experience Manager] 6.5 Latest Service Pack Release Notes {#aem-service-pack-release-notes}

<!-- For an itemized list of all issues found in these release notes, see the following spreadsheet: https://adobe-my.sharepoint.com/:x:/r/personal/anujkapo_adobe_com/_layouts/15/Doc.aspx?sourcedoc=%7B3ea81ae4-e605-4153-b132-f2698c86f84e%7D&action=edit&wdinitialsession=d8c7b903-87fc-4f2d-9ef2-542a82169570&wdrldsc=3&wdrldc=1&wdrldr=SessionMemoryQuotaExceededDuringSession -->

<!-- DO NOT DELETE THIS HIDDEN NOTE      DO NOT DELETE THIS HIDDEN NOTE
>[!NOTE]
>
>Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the add-on packages release Thursday, November 30, 2023. In addition, a list of Forms fixes and enhancements is added to this section. -->

## Release information {#release-information}

| Product | [!DNL Adobe Experience Manager] 6.5 |
| -------- | ---------------------------- |
| Version  | 6.5.19.0 <!-- UPDATE FOR EACH NEW RELEASE -->                     |
| Type     | Service Pack release         |
| Date     | Thursday, December 07, 2023 <!-- UPDATE FOR EACH NEW RELEASE -->              |
| Download URL | [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.19.0.zip) <!-- UPDATE FOR EACH NEW RELEASE -->|

## What is included in [!DNL Experience Manager] 6.5.19.0 {#what-is-included-in-aem-6519}

[!DNL Experience Manager] 6.5.19.0 includes new features, key customer-requested enhancements, bug fixes, and performance, stability, and security improvements that have been released since the initial availability of 6.5 in April 2019. [Install this service pack](#install) on [!DNL Experience Manager] 6.5. 

<!-- UPDATE FOR EACH NEW RELEASE -->

<!-- Some of the key features and improvements are the following:

* _REVIEWERS: WHAT ARE THE KEY FEATURES AND ENHANCEMENTS YOU WANT TO HIGHLIGHT IN THIS RELEASE?_ -->

## Key features and enhancements

Some of the key features and enhancements in this release include the following:

* Enabled Sites Page Editor/Image Component user to reference assets from the remote Assets Cloud Service. (SITES-13448, SITES-13433) 
* AEM now supports server-side sorting for quicker project navigation in List view. Project nodes are sorted based on the user-selected column before appearing in the interface.

### [!DNL Forms]

* **New Adaptive Form Core Components**: Vertical tabs, Terms & Conditions, and Checkbox are added to enhance the scalability of forms.
  * **[Checkbox component](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/checkbox.html)**: Adaptive Forms based on Core Components can now include a checkbox component. It allows users to make binary choices, selecting or deselecting a particular option. It typically appears as a small box that can be clicked or tapped to toggle between two states: checked and unchecked. The checkbox is a common form element used to present a yes/no or true/false choice.

  * **[Terms and Conditions component](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/terms-and-conditions.html)**: Adaptive Forms based on Core Components can now include a Terms and Conditions component. It allows Forms authors to introduce a specific section within the form where users are presented with the terms, conditions, or legal agreements associated with the use of a service, product, or platform. This component is designed to inform users about the rules, regulations, and obligations they are agreeing to by submitting the form.

    ![Vertical tabs, Terms & Conditions and Checkbox components](/help/forms/using/assets/forms-components.png)

  * **[Vertical tabs component](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/adaptive-forms-components/vertical-tabs.html)**: Adaptive Forms based on Core Components can now organize form content into a vertical list of tabs, providing a structured and navigable layout. The use of vertical tabs in a form can enhance the overall user experience by simplifying navigation and improving the organization of form content, especially in situations where a form contains multiple sections or complex information.
  
* **[64-bit version of AEM Forms Designer](/help/forms/using/installing-configuring-designer.md)**: The 64-bit version of AEM Forms Designer brings enhanced performance, scalability, and memory management to empower your form creation experience. With the 64-bit architecture, you can tackle even larger and more complex projects with ease, ensuring seamless design workflows and optimized efficiency. Elevate your form design capabilities and embrace the future of AEM Forms Designer with this cutting-edge release.

* **[Connect an Adaptive Forms with Microsoft&reg; SharePoint List](/help/forms/using/configuring-submit-actions.md#submit-to-microsoft&reg;-sharepoint-list)**: AEM Forms provide an OOTB integration to submit forms data directly to SharePoint List, letting you use SharePoint's Lists capabilities. You can configure Microsoft&reg; SharePoint List as a datasource for a Form Data Model and use the Submit using Form Data Model submit action to connect an Adaptive Form with SharePoint List.

* **[Support to configure Document of Record properties for Adaptive Form Fragments](/help/forms/using/generate-document-of-record-for-non-xfa-based-adaptive-forms.md)**: You can now easily customize your Adaptive Form fragments and its fields in  Adaptive Form editor.

* **64-bit XMLFM**: The 64-bit iteration of XMLFM introduces heightened performance, scalability, and refined memory management. It is the first 64-bit native service deployed on the server-side. By harnessing its inherent capability to access larger memory resources compared to its 32-bit counterpart, XMLFM 64-bit empowers seamless handling of larger rendering workloads. This milestone not only represents a leap in performance but also introduces key enhancements to the native service framework within the AEM Forms Server. This update equips AEM Forms Server to seamlessly support any 64-bit native service.


<!-- UPDATE BELOW FOR EACH NEW RELEASE -->

## Fixed issues in Service Pack 19 {#fixed-issues}

### [!DNL Sites]{#sites-6519}

#### Accessibility{#sites-accessibility-6519}

* On an AEM Sites page, when you zoom in 200% on the page, the links **[!UICONTROL Language Copy]** and **[!UICONTROL CSV Report]** in the References rail disappear. (SITES-11011)

#### Admin User Interface{#sites-adminui-6519}

* AEM Screens Channel **[!UICONTROL Preview]** functionality does not work or display on the Dashboard. (SITES-15730) 
* During a page move operation, if the user interface cannot display the references but states that these are automatically republished, they are *not* republished. (SITES-16435) 
* In AEM 6.5 with Service Pack 16 or 17, when in the List view of sites with the "Workflow" column enabled, you cannot sort the list based on the items in that column. No sorting occurs. (SITES-15385) 
* For a redirect page template, the redirect field has been made mandatory. However, the validation for the required field is not getting applied nor working in these two scenarios: when a page is created without a mandatory redirect value; cannot create a redirect page. The validation does not work when navigating using keyboard shortcuts and when the field is marked as invalid, it does not proceed. (SITES-15903) 
* Some **Incoming Links** were not getting included in the displayed count in the **References** panel. For example, the panel was showing **Incoming Links (6)** but there were actually nine incoming links. (SITES-14816) 

#### Classic UI{#sites-classicui-6519}

* After installing hotfix in SITES-15827, dialog box titles that had whitespace between words were getting replaced with `" "`. Line breaks were also being removed. (SITES-16089) 
* Encoded dialog box titles are now resulting in a double encoding of the title. (SITES-15841) 
* Update of AEM servers from service pack 6.5.16 to 6.5.17 resulted in a double encoding of Classic UI dialog box titles. (SITES-15634) 

#### [!DNL Content Fragments]{#sites-contentfragments-6519}

* An Internal Server Error message appears in the Content Fragment Editor. (SITES-13550) 
* The update of the `org.json` library by way of NPR-41291 caused data error conversions in the `DefaultDataTypeConverter` of the `cfm-impl` bundle. Data type conversion must be more flexible. (SITES-16473) 
* Getting the error pop-up message, "This content fragment version cannot be compared to the current version because of incompatible content." Content fragments should be comparable but it is not. (SITES-16317) 
* Changed the asset selector JS URL from 
`https://experience.adobe.com/solutions/CQ-assets-selectors/assets/resources/assets-selectors.js` 
to 
`https://experience.adobe.com/solutions/CQ-assets-selectors/static-assets/resources/assets-selectors.js` (SITES-16068) 
* Adapt new Polaris metadata API response schema for CFM-Polaris integration. (SITES-15166) 
* All content fragments should be listed where the selected content fragment is referenced. Instead, asset references in the content fragment reference panel show 0(zero) references. (SITES-15036) 

#### Core Backend{#sites-core-backend-6519}

* Improve `StyleImpl`. (SITES-15164)
* Improve the release/650 branch of the WCM pipeline to be able to run integration tests for its modules. (SITES-12938) 

<!--#### Core Components{#sites-core-components-6519}

* A -->

#### Campaign integration{#sites-campaign-integration-6519}

* On the signature component (`/apps/fpl/components/campaign/signature`), the link Externalizer was not working. The domain was not getting appended to the image source, if the HTML comment above the image tag was removed. This issue was found only with the signature component in the production environment, not the staging environment. (SITES-16120) 

<!--#### Experience Fragments{#sites-experiencefragments-6519}

* A -->

#### Foundation Components (Legacy){#sites-foundation-components-legacy-6519}

* Adobe Experience Manager (AEM) Sites Search component breaks the user interface. (SITES-15087) 

#### GraphQL Query Editor{#sites-graphql-query-editor-6519}

* GraphQL Editor user interface does not let you scroll through all the persisted queries when there is a high number of queries (for example, more than 25). (SITES-16008) 
* The GraphQL Editor is not saving the publishing status of persisted queries. The unpublish button appears in the GraphQL Editor, but the icon that indicates that the persisted query is published does not appear. Refreshing the page shows that the persisted query is not even published. (SITES-15858) 

#### Launches{#sites-launches-6519}

* Changes in the repository are not save due to `Oak0001` conflicts when multiple pages are being edited or content is being authored. It is normal to perform a retry in such an event but this does not occur. (SITES-14840) 

#### MSM - Live Copies{#sites-msm-live-copies-6519}

* MSM Rollout Button does not work in the touch graphical user interface. (SITES-16991) 
* Link Reference does not get updated inside Experience Fragment when creating a live copy or rolling out an Experience Fragment. (SITES-15460) 

#### Page Editor{#sites-pageeditor-6519}

* In Forms > Themes, if you opened a theme in the theme editor and made a few changes and saved, then clicked Preview, a loading icon is visible but the actual preview does not load. (SITES-17164)
* Selection of multiple document filetypes on asset type filter is not working on the page console. No results are found even if the results of one particular filetype are available. As a result, authors are unable to filter multiple documents. They must use multiple document types and they are having to filter it one at a time. (SITES-14047) 
* After upgrading an instance from AEM 6.5.17 and AEM 6.5.18, from inside the Page Editor, if you selected **[!UICONTROL Publish Page]**, you are redirected to a URL that does not exist. The user should be redirected to the Publish wizard. (SITES-15856) 
* Redundant copy from AEM's Clipboard during a paste from the operating system's Clipboard. (SITES-15704) 
* In Assets, selecting **[!UICONTROL Documents]**, then under **[!UICONTROL Filtertype]**, selecting **[!UICONTROL Microsoft&reg;&reg; Word]** or **[!UICONTROL Microsoft&reg;&reg; Excel]** shows no results even though files of both types exist. (SITES-14837) 

### [!DNL Assets]{#assets-6519}

* When you create or save a public folder, three groups are created in an admin dashboard. (ASSETS-26700) 
* Unable to differentiate publishing assets to Experience Manager or Brand Portal. (NPR-41320) 
* In the search panel, when you select checkboxes and deselect any one of them, all the checkboxes are unchecked. (ASSETS-26377) 

#### [!DNL Dynamic Media]{#assets-dm-6519}

* After an asset is uploaded to AEM, the `update_asset` workflow is triggered. The workflow never finishes. Looking at the workflow instances, the workflow finishes up to the product upload step. The next step is Scene7 batch upload. User can see that the asset is in Scene7 from the Dynamic Media Classic app. (ASSETS-30443) 
* A custom Servlet (API endpoint) is returning an incorrect Dynamic Media (Scene7) file name. It occurs when an asset is deleted and replaced with an asset of the same name. The custom servlet is returning the old Dynamic Media (Scene7) file name, while a "jcr" API call returns the correct file name. (ASSETS-29476) 
* Even after Sync is turned off at the Folder level, the Logs show the trigger of "Scene7 ReplicateOnModifyListener". The `ReplicateOnModifyListener/Worker` should skip processing on non-Dynamic Media folder assets and content fragments. (ASSETS-26705) 
* People with low vision are impacted if the Focus is not visible in drop-down elements (Content Only, View, More Options) in high contrast black and white modes. (ASSETS-25759) 
* People with low vision are impacted if luminosity contrast ratio for text on a page is less than 4.5:1. (ASSETS-25756) 
* Screen readers are not narrating the displayed pop-up message after submitting the data. (ASSETS-25755) 
* Screen readers are not recognizing landmarks in the page (Dynamic Media; creating a video encoding profile), when navigated using landmark/region shortcut key `D/R`. (ASSETS-25752) 
* Screen readers are not recognizing multiple landmarks in the page (Dynamic Media; creating interactive video), when navigated using landmark/region shortcut key `D/R`. (ASSETS-25750) 
* Screen readers (NVDA/JAWS/Narrator) are not recognizing the Landmarks in **Edit Asset** page while navigating using the shortcut keys `D/R`. (ASSETS-25744) 
* User gets an empty/false async job message but the connected asset is published successfully. (ASSETS-29342) 

### [!DNL Forms]{#forms-6519}

#### [!DNL Adaptive Forms]

<!-- Fixes in [!DNL Experience Manager] Forms are delivered through a separate add-on package one week after the scheduled [!DNL Experience Manager] Service Pack release date. In this case, the AEM 6.5.19.0 Forms add-on package release is scheduled for Thursday, November 30, 2023. A list of Forms fixes and enhancements would be added to this section post the release.-->

<!--* Adding Access Control List for `fd-cloudservice` user to be able to read or update the Microsoft&reg; configurations under `cloudconfigs/microsoftoffice`. (FORMS-11142) -->

<!--LEFT BULLET LIST HERE IN CASE OF REUSE BY FORMS IN THE FUTURE 
* **Document Services**
  * text
* **Adaptive Forms** 
  * text
* **Accessibility**
  * text
* **Interactive Communications**
  * text -->

<!--### Commerce{#commerce-6519}

* A -->

* When a user adds a toolbar to Adaptive Form, the Form Container Label shows erratic behavior because it does not change to the preferred language the Author selected for Forms. (FORMS-11371) 
* In AEM Forms Workspace, the dropdown field selects the first option by default on the UI. (FORMS-11346) 
* The language configuration in AEM is not affected if you use locales with five characters and the decimal separator is not correctly rendered in the letter. (FORMS-11344) 
* When a user generates the XML output using the workbench process, it fails for a few of the files. (FORMS-11314) 
* When a user generates preview for Document of record (DOR) in languages other than English, it does not work. (FORMS-11106) 
* When a user converts some image files with PDFG on an OSGI instance based on Linux&reg; with JDK11, it does not convert. (FORMS-11105) 
* When user installs AEM Forms add-on, it breaks the content tree panel in AEM Sites. (FORMS-10912) 
* When a user copies dates using NVDA screen reader from Date picker component, it does not read correctly. (FORMS-10805)  
* In Forms rule editor, the user is unable to set the value of the Radio button/Checkbox when the data value type is Boolean. (FORMS-10713) 
* When a user adds added items in an Adaptive Form, it is added in reverse order to a drop-down List. (FORMS-10456) 
* When a dropdown is cleared using the rule editor, the first provided value still appears even though the value has been cleared. (FORMS-9963)  
* Users are not able to access Form Title using screen readers such as NVDA. (FORMS-8815)  
* Users are not able to access `Sub Title` in a Form using screen readers such as NVDA. (FORMS-8814)  
* In the page source of html form, the access key attribute is empty and is not working. (FORMS-5753)  
* In the About Workspace dialog, the text "Adobe Experience Manager – Forms" is presented as text. (FORMS-5748)

#### [!DNL Forms Designer]{#forms-designer-6519}

* When a user tries to read non-interactive PDF forms through screen readers, some list items are not read or skipped. (LC-3921645)  
* When a user tabs through the editable fields, it does not traverse to all the PDF form fields consistently. (LC-3921631)  
* Ordering of the tags are randomly changed in PDF even tagging in Forms Designer is correct. (LC-3921313)  
* A list does not display correctly in the tags in Adobe Acrobat Reader or Adobe Acrobat DC. (LC-3921306)
* Heading levels which are assigned correctly in Forms Designer are randomly changed to a `<P>` tag in Adobe Acrobat. (LC-3921305) 
* In a table the ID of any object cannot be modified once it is assigned. (LC-3921134)  
* If merged cells are in the table, no GUI is available for setting the span (row and column) and scope in a complex table in AEM Forms Designer. (LC-3919532)
* When a user tries to generate PDF documents after installing the forms add-on package on AEM Forms Service Pack 6.5.15.0, it fails intermittently and shows the error:
  * `OutputServiceException AEM_OUT_001_003:Unexpected Exception: 0 Out of Memory Caused by: org.omg.CORBA.COMM_FAILURE: null` (LC-3921530)

### Foundation{#foundation-6519}

* Creating a language copy at the language root level does not adjust paths in the page. In the case where the language copy was created, not for the language root but for the pages under it, the path changed correctly. (NPR-41364) 
* The "Relative Date Presentation" tooltip can only be closed by pressing Escape (ESC) on the keyboard. The tooltip should close when the user selects any part of the user interface. (NPR-41394) 
* Unlocalized string `Something went wrong while adding the private key.` when adding the wrong Private Key File in **Edit User** > **Keystore**. (NPR-41366) 
* Icons are needed for Microsoft&reg; SharePoint and Microsoft&reg; One Drive in the AEM 6.5 environment. (NPR-41354) 
* Unlocalized "UserId/Password mismatch." string in **Security** > **User** > **Create** dialog box. (NPR-41245) 
* Popover code and Event handlers are loaded twice, breaking user-created Coral3-based user interfaces. (NPR-41171) 
* Deselection does not work correctly after using "Select All" in the AEM Sites console. (NPR-41304) 

<!--#### Content distribution{#foundation-content-distribution-6519}

* T -->

#### Integrations{#integrations-6519}

* SMS links in an AEM email campaign are not correctly written; they contain an HTML anchor element. (NPR-41211) 
* Wording used on account configuration screen should not use new credential type. (NPR-41210) 
* Moving Analytics report import scheduler from `ManagedPollConfig` to sling jobs. When two different analytics frameworks were attached with different report suites to two different sites, `ManagedPollConfig` polls only one of them. (NPR-41209) 
* When the value is reset to default, the previously selected timeframe button stays enabled. In the content insight dashboard of AEM, by default the time frame is set at the week and shows content insights as weekly data. Now, if the user selects other time frame options, such as hour, day, month, and year, the data changes according to the selected value. However, if the values are reset, by default, the visible time frame is week but still the previously selected time frame option is selected. (NPR-41246) 

#### Oak{#oak-6519}

* Backport utility to rate limit writes to AEM in case async indexing is delayed. (NPR-40985) 

#### Platform{#foundation-platform-6519}

* QueryBuilder queries with square brackets are wrongly translated to xpath . (NPR-41298) 

<!--#### Replication{#foundation-replication-6519}

* R -->

<!--#### Sling{#foundation-sling-6519}

* W -->

#### Translation projects{#foundation-translation-6519}

* While creating the language copy of page "A", it should automatically create the language copies of the referenced Pages, Experience Fragments, Content Fragments, and Assets. Also, the newly created language copy of Page "A" at the new path should have its references updated to the respective newly created language copies of the Pages, Experience Fragments, Content Fragments, and Assets. (NPR-41076) 

<!--#### User interface{#foundation-ui-6519}

* A -->

<!--#### WCM{#wcm-6519}

* A -->

#### Workflow{#foundation-workflow-6519}

* Unable to complete a task in the Inbox. Only an "undefined" value is observed in the drop-down menu when trying to complete the task and select an action. This means that users cannot apply the AEM 6.5.18 service pack. (NPR-41402 and NPR-41473) 
* Unable to complete tasks in Inbox. There is no value (only "undefined") in the drop-down list when trying to complete the task for zip files, Asset reports, move (success or failure), or asset expiration. (NPR-41305) 
* When a user selects **[!UICONTROL Tools]** > **[!UICONTROL Workflow]** > instances, then selects the running workflow, then select **[!UICONTROL View Payload]**, it results in a 500 error page. (NPR-41325) 

## Install [!DNL Experience Manager] 6.5.19.0{#install}

<!-- Remaining content from here to bottom stays the same except for version updating as needed as per update team feedback. -->

* [!DNL Experience Manager] 6.5.19.0 requires [!DNL Experience Manager] 6.5. See [upgrade documentation](/help/sites-deploying/upgrade.md) for detailed instructions. <!-- UPDATE FOR EACH NEW RELEASE -->
* The service pack download is available on Adobe [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.19.0.zip).
* On a deployment with MongoDB and multiple instances, install [!DNL Experience Manager] 6.5.19.0 on one of the Author instances using the Package Manager.<!-- UPDATE FOR EACH NEW RELEASE -->

>[!IMPORTANT]
>
> Adobe does not recommend that you remove or uninstall the [!DNL Experience Manager] 6.5.19.0 package. As such, before you install the pack, you should create a backup of the `crx-repository` in case you must roll it back. <!-- UPDATE FOR EACH NEW RELEASE -->
<!-- For instructions to install Service Pack for Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md). -->


### Install the service pack on [!DNL Experience Manager] 6.5{#install-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.19.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installation is successful. Typically, this issue occurs in the [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.19.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.19.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.19.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.17 or later (Use Web Console: `/system/console/bundles`). <!-- NPR-41292 for 6.5.19.0 --> <!-- OAK Oak oak VERSION -MAY- NEED TO BE UPDATED FOR EACH NEW RELEASE -->

### Install Service Pack for [!DNL Experience Manager] Forms{#install-aem-forms-add-on-package}

For instructions to install the service pack on Experience Manager Forms, see [Experience Manager Forms Service Pack installation instructions](/help/release-notes/aem-forms-current-service-pack-installation-instructions.md).

>[!NOTE]
>
>The Adaptive Forms feature, available in [AEM 6.5 QuickStart](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/deploying/deploy.html), is designed for exploration and evaluation purposes only. For production use, it is essential to obtain a valid license for AEM Forms, as Adaptive Forms functionality requires proper licensing.

### Install GraphQL Index Package for Experience Manager Content Fragments{#install-aem-graphql-index-add-on-package}

Customers using GraphQL must install the [Experience Manager Content Fragment with GraphQL Index Package 1.1.1](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/cfm-graphql-index-def-1.1.1.zip). 

Doing so lets you add the required index definition based on the features they actually use.

Failure to install this package may result in slow or failed GraphQL queries.

>[!NOTE]
>
>Only install this package once per instance; it does not need to be reinstalled with every Service Pack.

### UberJar{#uber-jar}

The UberJar for [!DNL Experience Manager] 6.5.19.0 is available in the [Maven Central repository](https://repo.maven.apache.org/maven2/com/adobe/aem/uber-jar/6.5.19/). <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

To use UberJar in a Maven project, see [how to use UberJar](/help/sites-developing/ht-projects-maven.md) and include the following dependency in your project POM: <!-- CHECK FOR UPDATE EACH NEW RELEASE -->

```shell
<dependency>
     <groupId>com.adobe.aem</groupId>
     <artifactId>uber-jar</artifactId>
     <version>6.5.19</version>
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

* When trying to move, delete, or publish either Content Fragments, Sites, or Pages, there is an issue when Content Fragment references are fetched, as the background query fails. That is, the functionality does not work.
  To ensure correct operation, you must add the following properties to the index definition node `/oak:index/damAssetLucene` (no reindexing is required):

   ```xml
   "tags": [
       "visualSimilaritySearch"
     ]
   "refresh": true
   ```

* When executing a GraphQL query using optional variables, if a specific value is **not** provided for the optional variable, then the value for that variable will be considered an implicit `null`. This means that the filter will match only `null` values for the corresponding property.

  For example, in the query below, where no value is specified for the property `lastName`:

  ```graphql
  query getAuthorsFilteredByLastName($authorLastName: String) {
  authorList(filter:
    {
      lastName: {_expressions: {value: $authorLastName}
      }}) {
    items {
      lastName
      }
    }
  }
  ```

  Only authors with the `lastName` property set to null will be returned:

  ```graphql
  {
  "data": {
    "authorList": {
      "items": [
        {
          "lastName": null
        }
      ]
    }
  }
  }
  ```

* If you upgrade your [!DNL Experience Manager] instance from 6.5.0 - 6.5.4 to the latest service pack on Java&trade; 11, you see `RRD4JReporter` exceptions in the `error.log` file. To stop the exceptions, restart your instance of [!DNL Experience Manager]. <!-- THIS BULLET POINT WAS UPDATED AS PER CQDOC-20021, JANUARY 23, 2023 --> 

* Users can rename a folder in a hierarchy in [!DNL Assets] and publish a nested folder to [!DNL Brand Portal]. However, the title of the folder is not updated in [!DNL Brand Portal] until the root folder is republished.

* The following errors and warning messages may be displayed during installation of [!DNL Experience Manager] 6.5.x.x:
  * "When the Adobe Target integration is configured in [!DNL Experience Manager] using the Target Standard API (IMS authentication), then exporting Experience Fragments to Target results in wrong offer types getting created. Instead of type "Experience Fragment"/source "Adobe Experience Manager," Target creates several offers with type "HTML"/source "Adobe Target Classic."
  * `com.adobe.granite.maintenance.impl.TaskScheduler`: No maintenance windows found at granite/operations/maintenance.
  * Adaptive Form server-side validation fails when aggregate functions such as SUM, MAX, and MIN are used (CQ-4274424).
  * `com.adobe.granite.maintenance.impl.TaskScheduler` - No maintenance windows found at granite/operations/maintenance.
  * The hotspot in a Dynamic Media interactive image is not visible when previewing the asset through the Shoppable Banner viewer.
  * `com.adobe.cq.social.cq-social-jcr-provider bundle com.adobe.cq.social.cq-social-jcr-provider:1.3.5 (395)[com.adobe.cq.social.provider.jcr.impl.SpiSocialJcrResourceProviderImpl(2302)]` : Timeout waiting for register change to complete unregistered.

* Starting with AEM 6.5.15, the Rhino JavaScript Engine provided by the ```org.apache.servicemix.bundles.rhino``` bundle has a new hoisting behavior. Scripts that use the strict mode (```use strict;```) have to correctly declare their variables, otherwise they do not get run, instead throwing a runtime error.
 
### Known issues for AEM Forms

#### Supported platforms 

* JDK 11.0.20 is not supported to install AEM Forms on JEE Installer. Only JDK 11.0.19 or earlier versions are supported to install AEM Forms on JEE Installer. (FORMS-10659)

#### Installation 

* On JBoss&reg; 7.1.4 platform, when user installs Experience Manager 6.5.16.0 or later service pack, `adobe-livecycle-jboss.ear` deployment fails. (CQ-4351522, CQDOC-20159)

<!-- 
* After upgrading to AEM Forms 6.5.18.0 JBoss&reg; Turnkey full installer environment on Windows Server 2022, when compiling Output client application code using Java&trade; 11, the following compilation error may occur:
  
  ```
  error: error reading [AEM_Forms_Installation_dir]\sdk\client-libs\common\adobe-output-client.jar; java.net.URISyntaxException: 
  Illegal character in path at index 70: file:/[AEM_Forms_Installation_dir]/sdk/client-libs/common/${clover.jar.name} 1 error
  
  ```
  
  To resolve the issue, perform the following steps:
    1. Navigate to `[AEM_Forms_Installation_dir]\sdk\client-libs\common\` and unzip `adobe-output-client.jar` to extract the `Manifest.mf` file.
    1. Update the `Manifest.mf` file by removing the entry `${clover.jar.name}` from the class-path attribute. 

        >[!NOTE]
        >
        > You can also use an in-place editing tool, for example, 7-zip, to update the `Manifest.mf` file.  

    1. Save the updated the `Manifest.mf` in the `adobe-output-client.jar` archive. 
    1. Save the modified `adobe-output-client.jar` file and rerun the setup. (CQDOC-20878) -->

* After installing AEM Service Pack 6.5.19.0 full installer, the EAR deployment fails on JEE using JBoss&reg; Turnkey. 
To resolve the issue, locate the `<AEM_Forms_Installation_dir>\jboss\bin\standalone.bat` file and update `Adobe_Adobe_JAVA_HOME` to `Adobe_JAVA_HOME` for all occurrences before running the configuration manager. (CQDOC-20803)

#### Install the servlet fragment (AEM Service Pack 6.5.14.0 or earlier)

* If you are upgrading to AEM Service Pack 6.5.15.0 or higher, and your AEM instance is operating on Tomcat 8.5.88, it is mandatory that you install the servlet fragment *before* you proceed with the installation of Service Pack 6.5.15.0 or higher.
* It is mandatory that you install the servlet fragment for all application servers except those running on JBoss&reg; EAP 7.4.0.

**To install the servlet fragment:**

1. Download the servlet fragment from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar).
1. Start the application server. 
1. Wait for the logs to stabilize and check the bundle state.
1. Open Web Console Bundles. The default URL is `http://[Server]:[Port]/system/console/bundles`.
1. Select **[!UICONTROL Install]** or **[!UICONTROL Update]**. 
1. Select the downloaded fragment 
`org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar` 
1. Select **[!UICONTROL Install]** or **[!UICONTROL Update]**. 
1. Wait for the application server to stabilize.
1. Stop the application server.

#### Adaptive Forms

* When an Adaptive Form is published, all its dependencies, including policies, get republished, even if no modifications have been made to them. (FORMS-10454)
* When a user selects to configure a field for the first time in an adaptive form, the option to save a configuration does not display in Properties Browser. Selecting to configure some other field of the Adaptive Form in the same editor resolves the issue. 
* When users perform the submit action, the submission fails with an error: 
`javax.servlet.ServletException: java.lang.NoSuchMethodError`
To resolve the issue, [recompile the Sling scripts such as JSP, Java&trade;, and Sightly](https://experienceleague.adobe.com/docs/experience-cloud-kcs/kbarticles/KA-16543.html#resolution). (FORMS-8542)
* After installing AEM Service Pack 6.5.14.0 and onwards, users are unable to select a font from the JEE Admin UI for PDF documents when navigating to `Home` > `Services` > `PDF Generator` > `Adobe PDF Settings`, as the font list appears empty. (FORMS-12095)

#### AEM Forms on JEE 

* Critical security vulnerabilities have been reported for Struts 2 RCE, a popular and open-source web application framework for developing Java EE web applications. Adobe has released [AEM 6.5 Service Pack 19.1 (6.5.19.1)](/help/forms/using/mitigating-struts-2-rce-vulnerabilities-for-experience-manager-manager-form.md) to address the vulnerability in AEM Forms on JEE. 


<!--The font enumeration fails due to the missing Ps2Pdf service file.-->

## OSGi bundles and content packages included{#osgi-bundles-and-content-packages-included}

The following text documents list the OSGi bundles and Content Packages included in [!DNL Experience Manager] 6.5.19.0: <!-- UPDATE FOR EACH NEW RELEASE -->

* [List of OSGi bundles included in Experience Manager 6.5.19.0](/help/release-notes/assets/65190_bundles.txt) <!-- UPDATE FOR EACH NEW RELEASE -->
* [List of Content Packages included in Experience Manager 6.5.19.0](/help/release-notes/assets/65190_packages.txt) <!-- UPDATE FOR EACH NEW RELEASE -->

## Restricted websites{#restricted-sites}

These websites are only available to customers. If you are a customer and need access, contact your Adobe account manager.

* [Product download at licensing.adobe.com](https://licensing.adobe.com/)
* [Contact Adobe Customer Support](https://experienceleague.adobe.com/docs/customer-one/using/home.html).

>[!MORELIKETHIS]
>
>* [[!DNL Experience Manager] product page](https://business.adobe.com/products/experience-manager/adobe-experience-manager.html)
>* [[!DNL Experience Manager] 6.5 documentation](https://experienceleague.adobe.com/docs/experience-manager-65.html)
>* [Subscribe to Adobe priority product updates](https://www.adobe.com/subscription/priority-product-update.html)
