---
title: What's new in Adobe Experience Manager 6.5 Service Pack 5
description: What's new in Adobe Experience Manager 6.5 Service Pack 5
contentOwner: AK
mini-toc-levels: 1
---

# What's new in Adobe Experience Manager 6.5 Service Pack 5 {#aem-whats-new-service-pack-5}

Adobe Experience Manager 6.5 service packs provide new features, customer-requested enhancements, and performance, stability, and security improvements at quarterly intervals. The quarterly availability makes it easy to access and adopt new features and innovations.

This article highlights the features included in the latest 6.5 Service Pack, [key features included in the previous 6.5 Service Packs](#key-features-previous-service-packs), and some of the [key releases since Experience Manager 6.5.4.0](#key-releases-since-last-sp) release.

## Adobe Experience Manager Sites {#aem-sites}

### Accessibility improvements {#accessibility-sites}

* Improved error reporting by adding text information.

* Improved user interface focus during keyboard navigation.

* Improved contrast ratio for various user interface elements.

* Improved consistency of alt attributes for page images.

* Improved consistency of Accessible Rich Internet Applications (ARIA) labels.

* Improved Non-Visual Desktop Access (NVDA) capabilities.

* Improved screen reader support.

### Other key enhancements {#other-enhancements-sites}

* When copying or pasting a page tree, you now have the option of either pasting the root page or pasting the root page with the subpages of the tree.

* [!DNL Adobe Experience Manager Experience Fragments] exported to [!DNL Adobe Target] workspaces now appear as unique offer types and offer sources in [!DNL Target].

* Multi Site Manager - The Publish trigger now deletes a component from the published page if a component is deleted from the source page.

* Multi Site Manager - When the name of a local component in a [!UICONTROL Live Copy] is identical to the name of a component in the blueprint and the component is rolled out from the blueprint, then the term `_msm_moved` is now added to the name of the local component.

## [!DNL Adobe Experience Manager Assets] {#aem-assets}

### Accessibility enhancements in [!DNL Assets] {#assets-accessibility}

[!DNL Experience Manager Assets] is now more accessible in compliance with Web Content Accessibility Guidelines (WCAG). The accessibility has improved because of the following enhancements:

* Many user interface elements, controls, pages, and dialogs are screen reader friendly.

* Many user interface elements, controls, and input form fields are accessible using keyboard.

* Color and contrast of some user interface elements are updated so that users with limited vision or users without perception of color can distinguish these user interface elements. For example, the color of star rating icons (such as in [!UICONTROL Rating] section of [!UICONTROL Advanced] tab in asset [!UICONTROL Properties] or in card view) is changed for appropriate contrast.

  ![Rating icons with improved contrast](assets/star-rating-icons.png)

### Enhanced exception handling {#exception-handling}

[!DNL Assets] user interface flow has better exception handling. If an asset does not have a type for its dimension, the observed exception is recorded in the log files.

### Support for 3D assets in [!DNL Dynamic Media] {#support-for-3d}

Support for 3D images in [!DNL Dynamic Media] enables customers to publish and add 3D content to web pages and applications. The support includes:

* Publish common 3D asset formats and generate an asset URL that can be used in web pages and other applications.

* A 3D Web Viewer, powered by [!DNL Adobe Dimension], to interactively view the published 3D assets.

* Publish and view common 3D assets on [!DNL Experience Manager Sites] pages using the [!DNL Sites] WCM component.

## Adobe Experience Manager Forms {#aem-forms}

### Customize the Adobe Experience Manager Inbox columns {#customize-aem-inbox-columns}

You can customize an [!DNL Experience Manager] Inbox to change the default title of a column, reorder the position of a column, and display additional columns based on the data of a workflow. Members of `administrators` or `workflow-administrators` group can customize the columns. For more information, see [Admin Control](../sites-authoring/inbox.md#inbox-admin-control).

![Customize Experience Manager Inbox columns](assets/customize-columns.gif)

### Save Interactive Communications as a draft {#save-as-draft}

You can use the Agent UI to save one or more drafts for each Interactive Communication and retrieve the draft later to continue working on it. You can specify a different name for each draft to identify it. For more information, see [Save Interactive Communications as a draft](../forms/using/prepare-send-interactive-communication.md#save-as-draft).

![Save as draft](assets/save-as-draft.gif)

### [!DNL Oracle WebLogic] application server support {#weblogic-support}

Adobe Experience Manager Forms has added support for [!DNL Oracle WebLogic 12] for Adobe Experience Manager Forms on JEE. You can upgrade from a previous version or set up a new Experience Manager 6.5 Forms on JEE server on [!DNL Oracle WebLogic] 12.2.1.4 and later. Later corresponds to the minor version changes, where x in 12.2.1.x is replaced with a version number.

### Accessibility improvements {#accessibility-improvements}

Adobe Experience Manager Forms includes the following accessibility enhancements:

* When a user previews an adaptive form as an HTML form, the [!UICONTROL Scribble Signature] field retains the tab focus.

* The error messages displayed on submitting an adaptive form now contain the `aria-describedBy` attribute. The attribute is attached to the fields referred in the error message. The `aria-describedby` attribute indicates IDs of the elements that describe the object. It helps establish a relationship between widgets or groups and text that described them.

* If an adaptive form has some mandatory fields, the mandatory attribute is set to `True` for such fields in ARIA accessibility schema.

### X-509 certificate-based authentication for SOAP-based web services in form data model {#x509-based-authentication-soap}

Form data model now supports X-509 certificate-based authentication while using SOAP web services as the data source. For more information, see [Configure SOAP web services](../forms/using/configure-data-sources.md##configure-soap-web-services).

### Other key improvements {#other-improvements}

* Experience Manager 6.5 Forms on JEE Document Security is now based on [!DNL Apache Struts 2].

* Added support for [!DNL Oracle Real Applications Cluster (RAC) 19c].

## Key features in previous Experience Manager 6.5 Service Packs {#key-features-previous-service-packs}

### Experience Manager Sites {#aem-sites-previous-service-packs}

#### Style System enhancements (6.5.4.0) {#style-system-enhancements}

You can now select styles within the component dialog using the enhanced Style System.

#### Performance improvements in various areas (6.5.4.0) {#performance-improvements}

* Reduced the time to load and initialize ContextHub within a site (`contexthub.kernel.js`). It results in faster page loads during a site visit.

* Reduced the time to refresh a page after dragging [!DNL Experience Fragments] to [!DNL Sites] Page Editor.

* Shortened the load time for entries on a [!DNL Sites] page with more than 200 live copies in **[!UICONTROL Live Copy Overview]**.

* Improved handling of incomplete or invalid URLs. Such URLs can slow the Template Editor.

### [!DNL Adobe Experience Manager Assets] {#aem-assets-previous-service-packs}

#### Configure [!DNL Experience Manager Assets] with [!DNL Brand Portal] (6.5.4.0) {#configure-assets-bp}

The authorization channel between [!DNL Experience Manager Assets] and [!DNL Brand Portal] is changed. Earlier, [!DNL Brand Portal] was configured in Classic UI via Legacy OAuth Gateway, which uses the JWT token exchange to obtain an IMS Access token for authorization. [!DNL Experience Manager Assets] is now configured with [!DNL Brand Portal] through Adobe I/O, which procures an IMS token for authorization of your [!DNL Brand Portal] tenant.

The steps to configure [!DNL Experience Manager Assets] with [!DNL Brand Portal] are different depending on your [!DNL Experience Manager] version, and whether you are configuring for the first time, or upgrading the existing configurations. See [Configure Experience Manager Assets with Brand Portal](https://docs.adobe.com/content/help/en/experience-manager-brand-portal/using/publish/configure-aem-assets-with-brand-portal.html) for details.

#### Accessibility enhancements (6.5.4.0) {#accessibility-enhancements}

[!DNL Experience Manager Assets] includes the following accessibility enhancements:

* Arrow keys on keyboard can be used to move and pan areas within zoomed images. For more information, see [preview assets using keyboard keys only](../assets/managing-assets-touch-ui.md#previewing-assets).

* The mixed state checkboxes (in which unless you select all the nested predicates the first-level checkboxes are not selected and are stricken through) in Filters panel are readable by screen readers.

* Date and time format constraints are provided in field labels of date fields, to enable the users to enter the date in correct format using keyboard. 
For example, `On Time (MM-DD-YYYY HH:mm)`. Here MM is month in two-digit format, YYYY is year, DD is day in two-digit format, HH is hour in 24-hour military format, and mm is minute.

* Screen readers now announce the `X` symbol to remove the selected tags along with the number of the selected tags.

#### Visual search for [!DNL Adobe Experience Manager Assets] (6.5.2.0) {#visual-search}

[!DNL Assets] users can search visually similar images. Experience Manager displays the smart tagged images from the DAM repository that are similar to a user-selected image. See [Visual search](../assets/search-assets.md).

### Dynamic Media {#dynamic-media-previous-service-packs}

#### Smart Imaging for Dynamic Media {#smart-imaging}

Smart imaging uses each user's unique viewing characteristics to automatically serve the right images optimized for their experience, resulting in better performance and engagement. Smart imaging works with your existing image presets and uses intelligence at the last millisecond of delivery to further reduce image file size based on browser or network connection speed. See [Smart Imaging](../assets/imaging-faq.md).

#### Smart crop in video profiles for Dynamic Media (6.5.3.0) {#smart-crop-video}

Smart crop for video–an optional feature available in Video Profiles– is a tool that uses the power of artificial intelligence in Adobe Sensei to automatically detect and crop the focal point in any adaptive video or progressive video that you have uploaded, regardless of size. See [About using smart crop in video profiles](../assets/video-profiles.md).

### Experience Manager Forms {#aem-forms-previous-service-packs}

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

#### Configure the out-of-office settings for Inbox items of an AEM Forms user (6.5.3.0) {#configure-out-of-office}

If you plan to be out of the office, you can specify what happens to items that are assigned to you for that period.
You have the option of specifying a start date and time and an end date and time for your out-of-office settings to be in effect. You can set a default person to whom all of your items are sent. See [Configure Out of Office settings](../forms/using/configure-out-of-office-settings.md).

#### Generate multiple interactive communications using Batch API for AEM Forms (6.5.3.0) {#generate-multiple-ic}

You can use the Batch API to produce multiple interactive communications from a template. The template is an interactive communication without any data. The Batch API combines data with a template to produce an interactive communication. The API is useful in the mass production of interactive communications. For example, telephone bills, credit card statements for multiple customers. See [Generate multiple interactive communications using Batch API](../forms/using/generate-multiple-interactive-communication-using-batch-api.md).

## Key releases since Adobe Experience Manager 6.5 SP4 {#key-releases-since-last-sp}

Between March 05, 2020 and June 04, 2020, Adobe released the following, in addition to the service packs and cumulative fix packs:

* [Software Distribution portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html) is available to download Experience Manager service packs, cumulative fix packs, hot fixes, and feature packs.

* [!DNL Adobe Experience Manager Cloud Manager] [2020.3.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-2020-3-0.html), [2020.4.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-2020-4-0.html), and [2020.5.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-current.html).

* [Experience Manager desktop app 2.0.2.0](https://docs.adobe.com/content/help/en/experience-manager-desktop-app/using/release-notes.html).

* [Experience Manager Screens: Feature Pack 202004](https://docs.adobe.com/content/help/en/experience-manager-screens/user-guide/release-notes/release-notes-fp-202004.html).

>[!MORELIKETHIS]
>
>* [Adobe Experience Manager 6.5 documentation](../user-guide/home.md)
>* [General release notes for Adobe Experience Manager 6.5](release-notes.md)
>* [Service pack release notes for Adobe Experience Manager 6.5](sp-release-notes.md)
