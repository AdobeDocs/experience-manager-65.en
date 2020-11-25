---
title: What's new in Adobe Experience Manager 6.5 Service Pack 7
description: What's new in Adobe Experience Manager 6.5 Service Pack 7
contentOwner: AK
mini-toc-levels: 1
---

# What's new in Adobe Experience Manager 6.5 Service Pack 7 {#aem-whats-new-service-pack}

![Whats-new](assets/whatsnew.jpeg)

[!DNL Adobe Experience Manager] 6.5 service packs provide new features, customer-requested enhancements, and performance, stability, and security improvements at quarterly intervals. The quarterly availability makes it easy to access and adopt new features and innovations.

This article highlights the features included in the latest 6.5 Service Pack, [key features included in the previous 6.5 Service Packs](#key-features-previous-service-packs), and the [key AEM releases since the last service pack](#key-releases-since-last-sp) release.

## Adobe [!DNL Experience Manager Sites] {#aem-sites}

### Sort the Live Copy pages available for rollout {#sort-livecopy-pages}

You can now sort the Live Copy pages available for rollout using the [!UICONTROL Name], [!UICONTROL Last modified date], and [!UICONTROL Last rollout date] properties. The [!UICONTROL Last rollout date] for a page is a new property introduced in this release.

### Availability of page moves and MSM rollouts as asynchronous operations {#page-moves-msm-asynchronous}

You can now perform the page moves and MSM rollouts as asynchronous operations to reduce their impact on runtime performance. You can schedule the operations for immediate or later execution. The status of associated jobs and process steps is displayed in a console, which is helpful for monitoring large-scale MSM rollouts.

## [!DNL Adobe Experience Manager Assets] {#aem-assets}

* Users can sort digital assets in Card and Column views.

* [!DNL Assets] and [!DNL Dynamic Media] provide multiple accessibility enhancements. The enhancements are related to keyboard navigation, use of screen readers, similar enhancements to enable use of assistive technologies (AT). See [Assets enhancements](/help/release-notes/sp-release-notes.md#assets-6570) and [[!DNL Dynamic Media] enhancements](/help/release-notes/sp-release-notes.md#dynamic-media-6570). <!-- TBD: Add link to a11y article after go-live. Adding RN link for now. -->

## [!DNL Adobe Experience Manager Forms] {#aem-forms}

>[!NOTE]
>
>[!DNL Experience Manager Forms] add-on packages are made available about a week after the scheduled [!DNL Experience Manager] Service Pack release. [!DNL Experience Manager] 6.5 Service Pack 7 (6.5.7.0) is scheduled to release on November 26, 2020.

## Key features in previous [!DNL Experience Manager] 6.5 Service Packs {#key-features-previous-service-packs}

### [!DNL Experience Manager Sites] {#aem-sites-previous-service-packs}

#### Availability of Page Move operation in asynchronous mode (6.5.6.0) {#page-move-asynchronous}

Page Move operation is now available in asynchronous mode. In addition to immediate execution, you can also schedule the Page Move operation for later execution.

#### Accessibility improvements (6.5.5.0) {#accessibility-sites}

* Improved error reporting by adding text information.

* Improved user interface focus during keyboard navigation.

* Improved contrast ratio for various user interface elements.

* Improved consistency of alt attributes for page images.

* Improved consistency of Accessible Rich Internet Applications (ARIA) labels.

* Improved Non-Visual Desktop Access (NVDA) capabilities.

* Improved screen reader support.

#### Other key enhancements (6.5.5.0) {#other-enhancements-sites}

* Anonymous access to CRXDE Lite is disallowed to enhance security. Instead, the users are directed to the login screen. See [Developing with CRXDE Lite](/help/sites-developing/developing-with-crxde-lite.md).

* When copying or pasting a page tree, you now have the option of either pasting the root page or pasting the root page with the subpages of the tree.

* [!DNL Adobe Experience Manager Experience Fragments] exported to [!DNL Adobe Target] workspaces now appear as unique offer types and offer sources in [!DNL Target].

* Multi Site Manager - The Publish trigger now deletes a component from the published page if a component is deleted from the source page.

* Multi Site Manager - When the name of a local component in a [!UICONTROL Live Copy] is identical to the name of a component in the blueprint and the component is rolled out from the blueprint, then the term `_msm_moved` is now added to the name of the local component.

#### Style System enhancements (6.5.4.0) {#style-system-enhancements}

You can now select styles within the component dialog using the enhanced Style System.

#### Performance improvements in various areas (6.5.4.0) {#performance-improvements}

* Reduced the time to load and initialize ContextHub within a site (`contexthub.kernel.js`). It results in faster page loads during a site visit.

* Reduced the time to refresh a page after dragging [!DNL Experience Fragments] to [!DNL Sites] Page Editor.

* Shortened the load time for entries on a [!DNL Sites] page with more than 200 live copies in **[!UICONTROL Live Copy Overview]**.

* Improved handling of incomplete or invalid URLs. Such URLs can slow the Template Editor.

### [!DNL Adobe Experience Manager Assets] {#aem-assets-previous-service-packs}

#### Accessibility enhancements (6.5.6.0) {#accessibility-assets-6560}

* **Enhanced user interface focus during keyboard navigation**, for example focus on:

  * `x` icon in [!UICONTROL Version Preview] dialog of an asset in [!UICONTROL Timeline].

  * Actionable user interface options.

  * Email field on the [!UICONTROL Share Link] dialog, and field to add closed user group in [!UICONTROL Permission] tab of folder [!UICONTROL Properties].
  
* **Enhanced functionality using keyboard keys**

  Users can use keyboard keys to drag controls in Metadata Schema Form editor in browse mode of screen reader.

* **Enhanced usability for screen reader users**, due to the following:

  * Screen readers announce the purpose of video and audio players.

  * Screen readers announce the purpose of the user interface options to remove the tags selected using [!UICONTROL Tags selection dialog] on asset [!UICONTROL Properties].

  * Screen readers announce the row headers and row items of tables, so users know which entries belong to the same row.

  * Descriptive and meaningful page title of search page.
  
  * Screen readers announce the options in search filter panel as expandable accordions.
  
#### Other enhancements in [!DNL Assets] (6.5.6.0) {#other-enhancements-assets-6560}

* User groups associated with folders (private and non-private) are now removed from the repository on [deletion of those folders](/help/assets/private-folder.md#delete-private-folder). However, the existing redundant, orphaned, unused, and auto-generated user groups can be removed from the repository using JMX.

#### Accessibility enhancements in [!DNL Assets] (6.5.5.0) {#assets-accessibility}

[!DNL Experience Manager Assets] is now more accessible in compliance with Web Content Accessibility Guidelines (WCAG). The accessibility has improved because of the following enhancements:

* Many user interface elements, controls, pages, and dialogs are screen reader friendly.

* Many user interface elements, controls, and input form fields are accessible using keyboard.

* Color and contrast of some user interface elements are updated so that users with limited vision or users without perception of color can distinguish these user interface elements. For example, the color of star rating icons (such as in [!UICONTROL Rating] section of [!UICONTROL Advanced] tab in asset [!UICONTROL Properties] or in card view) is changed for appropriate contrast.

  ![Rating icons with improved contrast](assets/star-rating-icons.png)

#### Enhanced exception handling (6.5.5.0) {#exception-handling}

[!DNL Assets] user interface flow has better exception handling. If an asset does not have a type for its dimension, the observed exception is recorded in the log files.

#### Support for 3D assets in [!DNL Dynamic Media] (6.5.5.0) {#support-for-3d}

Support for 3D images in [!DNL Dynamic Media] enables customers to publish and add 3D content to web pages and applications. The support includes:

* Publish common 3D asset formats and generate an asset URL that can be used in web pages and other applications.

* A 3D Web Viewer, powered by [!DNL Adobe Dimension], to interactively view the published 3D assets.

* Publish and view common 3D assets on [!DNL Experience Manager Sites] pages using the [!DNL Sites] WCM component.

#### Configure [!DNL Experience Manager Assets] with [!DNL Brand Portal] (6.5.4.0) {#configure-assets-bp}

The authorization channel between [!DNL Experience Manager Assets] and [!DNL Brand Portal] is changed. Earlier, [!DNL Brand Portal] was configured in Classic UI via Legacy OAuth Gateway, which uses the JWT token exchange to obtain an IMS Access token for authorization. [!DNL Experience Manager Assets] is now configured with [!DNL Brand Portal] through Adobe I/O, which procures an IMS token for authorization of your [!DNL Brand Portal] tenant.

The steps to configure [!DNL Experience Manager Assets] with [!DNL Brand Portal] are different depending on your [!DNL Experience Manager] version, and whether you are configuring for the first time, or upgrading the existing configurations. See [Configure Experience Manager Assets with Brand Portal](https://docs.adobe.com/content/help/en/experience-manager-brand-portal/using/publish/configure-aem-assets-with-brand-portal.html) for details.

#### Accessibility enhancements (6.5.4.0) {#accessibility-enhancements}

[!DNL Experience Manager Assets] includes the following accessibility enhancements:

* Arrow keys on keyboard can be used to move and pan areas within zoomed images. For more information, see [preview assets using keyboard keys only](../assets/manage-assets.md#previewing-assets).

* The mixed state checkboxes (in which unless you select all the nested predicates the first-level checkboxes are not selected and are stricken through) in Filters panel are readable by screen readers.

* Date and time format constraints are provided in field labels of date fields, to enable the users to enter the date in correct format using keyboard.
For example, `On Time (MM-DD-YYYY HH:mm)`. Here MM is month in two-digit format, YYYY is year, DD is day in two-digit format, HH is hour in 24-hour military format, and mm is minute.

* Screen readers announce the option to remove selected tags (`X` symbol) and the number of the selected tags.

#### Sortable column for Created date of assets in list view (6.5.3.0) {#sortable-date-created-column}

A new sortable column for created date of assets is added in DAM list view and on asset search results in list view.

![Sortable column for date created](assets/asset-created-date.png)

#### Visual search for [!DNL Adobe Experience Manager Assets] (6.5.2.0) {#visual-search}

[!DNL Assets] users can search visually similar images. Experience Manager displays the smart tagged images from the DAM repository that are similar to a user-selected image. See [Visual search](../assets/search-assets.md).

### Dynamic Media {#dynamic-media-previous-service-packs}

#### Invalidate CDN cached content (6.5.6.0) {#invalidate-cdn-cached-content}

You can now use the [!DNL Dynamic Media] user interface to invalidate Content Delivery Network (CDN) cached content. As a result, the updated assets are available instantly instead of waiting for the cache to expire. You can invalidate CDN by:

* Creating a CDN invalidation template: Selecting assets and form associated template-based URLs

* Selecting assets and associated presets through asset picker

* Adding complete asset URLs

#### Selective publishing of assets to [!DNL Experience Manager] and [!DNL Dynamic Media] (6.5.6.0) {#selective-publishing}

You can now choose to selectively publish or unpublish assets to either [!DNL Experience Manager] or [!DNL Dynamic Media] using [!UICONTROL Quick Publish] or [!UICONTROL Manage Publication] wizard. You can also set the `Publish` or `Unpublish` mode at folder level.

#### Smart Imaging for Dynamic Media {#smart-imaging}

Smart imaging uses each user's unique viewing characteristics to automatically serve the right images optimized for their experience, resulting in better performance and engagement. Smart imaging works with your existing image presets and uses intelligence at the last millisecond of delivery to further reduce image file size based on browser or network connection speed. See [Smart Imaging](../assets/imaging-faq.md).

#### Smart crop in video profiles for Dynamic Media (6.5.3.0) {#smart-crop-video}

Smart crop for video–an optional feature available in Video Profiles– is a tool that uses the power of artificial intelligence in Adobe Sensei to automatically detect and crop the focal point in any adaptive video or progressive video that you have uploaded, regardless of size. See [About using smart crop in video profiles](../assets/video-profiles.md).

### Experience Manager Forms {#aem-forms-previous-service-packs}

#### Prefill an adaptive form at the client (6.5.6.0) {#prefill-merge-data-at-client}

When you prefill an adaptive form, the [!DNL Experience Manager Forms] server merges data with an adaptive form and delivers the filled form to you. By default, the data merge action takes place at the server.
You can now configure the [!DNL Experience Manager Forms] server to [perform the data merge action at the client](../../help/forms/using/prepopulate-adaptive-form-fields.md) instead of the server. It significantly reduces the time required to prefill and render adaptive forms.

#### Form data model integration with RESTful APIs on a server with two-way SSL implementation (6.5.6.0) {#fdm-integration-rest-apis-two-way-ssl}

[!DNL Experience Manager Forms] form data model can now [integrate with RESTful APIs on a server that has a two-way SSL implemented on it](../../help/forms/using/configure-data-sources.md).

#### Added support for [!DNL Adobe Sign] Text Tags in Automated Forms Conversion Service (6.5.6.0) {#sign-integration-acroform-afcs}

If an AcroForm includes [!DNL Adobe Sign] Text Tags, those fields are now recognized and represented as [!DNL Adobe Sign] fields in the adaptive form converted using [!DNL Automated Forms Conversion service]. A signer can fill such fields while signing the adaptive form.

#### Support to convert colored PDF forms to adaptive forms (6.5.6.0) {#colored-PDF-forms}

You can use [!DNL Automated Forms Conversion service] to convert colored PDF forms to adaptive forms.

#### Support for SMB 2 and SMB 3 protocols (6.5.6.0) {#smb-support}

[!DNL Experience Manager Forms] now supports SMB 2 and SMB 3 protocols.

#### Enhanced caching for translated adaptive form pages (6.5.6.0) {#enhanced-caching-translated-adaptive-forms}

You can now specify [locale as a selector in the adaptive form URL instead of an argument in adaptive form URL](../../help/forms/using/supporting-new-language-localization.md). It helps cache translated adaptive forms on [!DNL Experience Manager Dispatcher]. Caching translated adaptive form was not possible in previous versions. For detailed information about configuring caching for using locale as a selector in the adaptive form URL, see [Configure adaptive form cache at dispatcher](../../help/forms/using/configure-adaptive-forms-cache.md).

#### Save output of form data model service to a variable (6.5.6.0) {#save-fdm-service-to-variable}

Form data model allows you to save output of a form data model service to a variable. [!DNL Experience Manager Forms] now automatically maps the type of the form data model service to the type of variable.

#### Attach multiple files for File Attachment component (6.5.6.0) {#attach-multiple-files}

You can now [attach multiple files](../../help/forms/using/introduction-forms-authoring.md) to the [!UICONTROL File Attachment] component of adaptive forms.

#### Customize the Adobe Experience Manager Inbox columns (6.5.5.0) {#customize-aem-inbox-columns}

You can customize an [!DNL Experience Manager] Inbox to change the default title of a column, reorder the position of a column, and display additional columns based on the data of a workflow. Members of `administrators` or `workflow-administrators` group can customize the columns. For more information, see [Admin Control](../sites-authoring/inbox.md#inbox-admin-control).

![Customize Experience Manager Inbox columns](assets/customize-columns.gif)

#### Save Interactive Communications as a draft (6.5.5.0) {#save-as-draft}

You can use the Agent UI to save one or more drafts for each Interactive Communication and retrieve the draft later to continue working on it. You can specify a different name for each draft to identify it. For more information, see [Save Interactive Communications as a draft](../forms/using/prepare-send-interactive-communication.md#save-as-draft).

![Save as draft](assets/save-as-draft.gif)

#### [!DNL Oracle WebLogic] application server support (6.5.5.0) {#weblogic-support}

Adobe Experience Manager Forms has added support for [!DNL Oracle WebLogic 12] for Adobe Experience Manager Forms on JEE. You can upgrade from a previous version or set up a new Experience Manager 6.5 Forms on JEE server on [!DNL Oracle WebLogic] 12.2.1.4 and later. Later corresponds to the minor version changes, where x in 12.2.1.x is replaced with a version number.

#### Accessibility improvements (6.5.5.0) {#accessibility-improvements}

Adobe Experience Manager Forms includes the following accessibility enhancements:

* When a user previews an adaptive form as an HTML form, the [!UICONTROL Scribble Signature] field retains the tab focus.

* The error messages displayed on submitting an adaptive form now contain the `aria-describedBy` attribute. The attribute is attached to the fields referred in the error message. The `aria-describedby` attribute indicates IDs of the elements that describe the object. It helps establish a relationship between widgets or groups and text that described them.

* If an adaptive form has some mandatory fields, the mandatory attribute is set to `True` for such fields in ARIA accessibility schema.

#### X-509 certificate-based authentication for SOAP-based web services in form data model (6.5.5.0) {#x509-based-authentication-soap}

Form data model now supports X-509 certificate-based authentication while using SOAP web services as the data source. For more information, see [Configure SOAP web services](../forms/using/configure-data-sources.md#configure-soap-web-services).

#### Other key improvements (6.5.5.0) {#other-improvements}

* Experience Manager 6.5 Forms on JEE Document Security is now based on [!DNL Apache Struts 2].

* Added support for [!DNL Oracle Real Applications Cluster (RAC) 19c].

#### Generate printable output in Experience Manager Forms workflows (6.5.4.0) {#generate-printable-output}

The Generate Printable Output workflow step enables you to integrate a source template file with a data file. This integration enables you to print or save different copies of the template file. The step generates a PCL, PostScript, ZPL, IPL, TPCL, or DPL output. For more information on this feature, see [Forms-centric workflow on OSGi - Step Reference](../forms/using/aem-forms-workflow-step-reference.md).

![Generate Printable Output](assets/generate-print-output-step.gif)

#### Multi-column support for adaptive forms and interactive communications in Layout mode (6.5.4.0) {#multi-column-adaptive-forms}

You can now define the number of columns for a panel in adaptive forms and interactive communications. Switch to layout mode to use the new multi-column option. For more information, see [Use Layout mode to resize components](../forms/using/resize-using-layout-mode.md).

![Multi column layout](assets/multi-column-layout.gif)

#### Experience Manager Inbox customizations (6.5.4.0) {#aem-inbox}

The new Admin Control option enables the administrators to:

* Customize header text and logo.

* Control the display of navigation links available in the header.

The Admin Control option is visible only to the members of the `administrators` or `workflow-administrators` group. For more information on this feature, see [Your Inbox](../sites-authoring/inbox.md).

#### Rich text support in HTML5 forms (6.5.4.0) {#rich-text-support}

Convert a text field in an XFA form to a rich text field in an HTML5 form. For more information, see [Designing form templates for HTML5 forms](../forms/using/designing-form-template.md).

#### Accessibility enhancements (6.5.4.0) {#forms-accessibility-enhancements-6540}

Experience Manager Forms includes the following accessibility enhancements:

* Screen readers announce checkboxes, links, Date Picker, and Date Input fields correctly in an adaptive form.

* Each page of an adaptive form now includes one title and one main landmark label.

#### Share and request access to Inbox items of an Experience Manager Forms user (6.5.3.0) {#share-request-access}

You can share your Inbox items with another user. Once another user gains access to your Inbox items, the user can claim and take appropriate action on shared items. Similarly, you can request access to Inbox items from other users. See [Share and request access to Inbox items of a user](../forms/using/configure-shared-queues-osgi.md).

#### Configure the out-of-office settings for Inbox items of an Experience Manager Forms user (6.5.3.0) {#configure-out-of-office}

If you plan to be out of the office, you can specify what happens to items that are assigned to you for that period.
You have the option of specifying a start date and time and an end date and time for your out-of-office settings to be in effect. You can set a default person to whom all of your items are sent. See [Configure Out of Office settings](../forms/using/configure-out-of-office-settings.md).

#### Generate multiple interactive communications using Batch API for Experience Manager Forms (6.5.3.0) {#generate-multiple-ic}

You can use the Batch API to produce multiple interactive communications from a template. The template is an interactive communication without any data. The Batch API combines data with a template to produce an interactive communication. The API is useful in the mass production of interactive communications. For example, telephone bills, credit card statements for multiple customers. See [Generate multiple interactive communications using Batch API](../forms/using/generate-multiple-interactive-communication-using-batch-api.md).

## Key releases since Adobe Experience Manager 6.5 SP6 {#key-releases-since-last-sp}

Between September 03, 2020 and November 26, 2020, Adobe released the following, in addition to the service packs and cumulative fix packs:

* [!DNL Adobe Experience Manager] as a Cloud Service [2020.9.0](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/release-notes/release-notes/release-notes-2020-9-0.html?lang=en#release-notes) and [2020.10.0](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/release-notes/release-notes/release-notes-2020-10-0.html?lang=en#release-notes).

* [[!DNL Experience Manager] desktop app 2.0 (2.0.3.2)](https://experienceleague.adobe.com/docs/experience-manager-desktop-app/using/release-notes.html).

* [WKND Reference Site - 0.0.6](https://github.com/adobe/aem-guides-wknd/releases/tag/aem-guides-wknd-0.0.6)

* [Experience Manager Screens: Feature Pack 202008](https://experienceleague.adobe.com/docs/experience-manager-screens/user-guide/release-notes/release-notes-fp-202008.html)

* [Adobe Asset Link v2.2](https://helpx.adobe.com/enterprise/admin-guide.html/enterprise/using/adobe-asset-link.ug.html)

>[!MORELIKETHIS]
>
>* [[!DNL Adobe Experience Manager] 6.5 documentation](../user-guide/home.md)
>* [General release notes for [!DNL Adobe Experience Manager] 6.5](release-notes.md)
>* [Service pack release notes for [!DNL Adobe Experience Manager] 6.5](sp-release-notes.md)
