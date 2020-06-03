---
title: What's new in Adobe Experience Manager 6.5 Service Pack 5
description: What's new in Adobe Experience Manager 6.5 Service Pack 5
contentOwner: AK
mini-toc-levels: 1
---

# What's new in AEM 6.5 Service Pack 5 {#aem-whats-new-service-pack-5}

Adobe Experience Manager 6.5 service packs provide you new features, customer requested enhancements, performance, and stability related improvements at quarterly intervals. The quarterly delivery model makes it easier to access and adopt new features and innovations.  

This article highlights the features included in the latest 6.5 Service Pack, [key features included in the previous 6.5 Service Packs](#key-features-previous-service-packs), and some of the [key releases since Experience Manager 6.5.4.0](#key-features-sice-sp3) release.

## AEM Sites {#aem-sites}

### Accessibility improvements {#accessibility-sites}

* Improved error reporting by adding text information

* Improved UI focus during keyboard navigation

* Improved text contrast (luminosity ratio)

* Improved consistency of alt attributes for page images

* Improved consistency of Accessible Rich Internet Applications (ARIA) labels

* Improved Non-Visual Desktop Access (NVDA) capabilities

* Improved screen reader support

### Other key enhancements {#other-enhancements-sites}

* When copying or pasting a page tree, you now have the option of either pasting the root page or pasting the root page with the subpages of the tree.

* AEM Experience Fragments exported to Adobe Target workspaces now appear as unique offer types and offer sources in [!DNL Target].

* Multi Site Manager - The Publish trigger now successfully deletes a component from the published page if a component is deleted from the source page.

* Multi Site Manager - When the name of a local component in a LiveCopy is identical to the name of a component in the blueprint and the component is rolled out from blueprint, term _msm_moved is now successfully added to the name of the local component.

## AEM Assets {#aem-assets}

### Accessibility enhancements in Assets {#assets-accessibility}

[!DNL Adobe Experience Manager] Assets functionalities are now more accessible in compliance with Web Content Accessibility Guidelines (WCAG). The accessibility has improved in the following areas:

* User interface elements, controls, pages and dialogs are screen reader friendly.

* User interface elements, controls, and input form fields are accessible using keyboard.

* Change in color and contrast of some graphics to be distinguishable by users with limited vision and without perception of color. For example, the color of star rating icons (such as in [!UICONTROL Rating] section of [!UICONTROL Advanced] tab in asset [!UICONTROL Properties] or in card view) is changed for appropriate contrast.

![color of star rating icons changed to improve contrast](assets/star-rating-icons.png)

### Enhanced Exception handling {#exception-handling}

Assets user interface flow has better exception handling. Earlier if an asset did not have proper type for its dimension, exception was observed that was caught silently with no trace in logs. This behavior has changed and all exceptions are caught in logs.  

## [!DNL Dynamic Media] {#dynamic-media}

### 3D support in [!DNL Dynamic Media] {#3d-support}

3D Support in [!DNL Dynamic Media] now enables customers to publish and add 3D content to web pages and applications. It includes:

* Publishing of common 3D asset formats to generate an asset URL.

* Interactive viewing of published 3D assets using a new 3D Web Viewer available in the [!DNL Dynamic Media] viewer library, powered by Adobe Dimension.

* 3D publishing and viewing on [!DNL Experience Manager Sites] page using the [!DNL Sites] WCM component.

## AEM Forms {#aem-forms}

### Customize the AEM Inbox columns {#customize-aem-inbox-columns}

You can customize an AEM Inbox to change the default title of a column, reorder the position of a column, and display additional columns based on the data of a workflow. You shall be a member of `administrators` or `workflow-administrators` group to customize the columns.

![Customize AEM Inbox columns](assets/customize-columns.gif)

### Save Interactive Communications as a draft {#save-as-draft}

You can use the Agent UI to save one or more drafts for each Interactive Communication and retrieve the draft later to continue working on it. You can specify a different name to each draft for easier identification.

![Save as draft](assets/save-as-draft.gif)

### [!DNL Oracle WebLogic] application server support {#weblogic-support}

AEM Forms has added support for [!DNL Oracle WebLogic 12] for AEM Forms on JEE. You can upgrade from a previous version or set up a new AEM 6.5 Forms on JEE server on [!DNL Oracle WebLogic] 12.2.1.4 and later. Later corresponds to the minor version changes, where x in 12.2.1.x is replaced with a version number.

### Accessibility improvements {#accessibility-improvements}

AEM Forms includes the following accessibility enhancements:

* When a user previews an adaptive form as an HTML form, the [!UICONTROL Scribble Signature] field retains the tab focus.

* The error messages displayed on submitting an adaptive form now contains the `aria-describedBy` attribute. The attribute is attached to the fields referred in the error message. The `aria-describedby` attribute indicates IDs of the elements that describe the object. It helps establish a relationship between widgets or groups and text that described them.

* If an adaptive form has some mandatory fields, the mandatory attribute is set to `True` for such fields in ARIA accessibility schema.

### X-509 certificate-based authentication for SOAP-based web services in form data model {#x509-based-authentication-soap}

Form data model now supports X-509 certificate-based authentication while using SOAP web services as the data source.

### Other key improvements {#other-improvements}

* AEM 6.5 Forms on JEE Document Security is now based on [!DNL Apache Struts 2].

* Added support for [!DNL Oracle Real Applications Cluster (RAC) 19c].

## Key features in previous AEM 6.5 Service Packs {#key-features-previous-service-packs}

### AEM Sites {#aem-sites-previous-service-packs}

#### Style System enhancements (6.5.4.0) {#style-system-enhancements}

You can now select styles within the component dialog using the enhanced Style System.

#### Performance improvements in various areas (6.5.4.0) {#performance-improvements}

* Reduced the time for loading and initializing ContextHub within a site (`contexthub.kernel.js`). It results in faster page loads during a site visit.

* Reduced the time to refresh a page after dragging Experience Fragments to Sites Page Editor.

* Shortened the load time for entries on a Sites page with more than 200 live copies in **[!UICONTROL Live Copy Overview]**.

* Improved handling of incomplete or invalid URLs. Such URLs can slow down the Template Editor.

### AEM Assets {#aem-assets-previous-service-packs}

#### Configure AEM Assets with Brand Portal (6.5.4.0) {#configure-assets-bp}

The authorization channel between AEM Assets and Brand Portal is changed. Earlier, Brand Portal was configured in Classic UI via Legacy OAuth Gateway, which uses the JWT token exchange to obtain an IMS Access token for authorization. AEM Assets is now configured with Brand Portal through Adobe I/O, which procures an IMS token for authorization of your Brand Portal tenant.

The steps to configure AEM Assets with Brand Portal are different depending on your AEM version, and whether you are configuring for the first-time, or upgrading the existing configurations. See [Configure AEM Assets with Brand Portal](https://docs.adobe.com/content/help/en/experience-manager-brand-portal/using/publish/configure-aem-assets-with-brand-portal.html) for details.

#### Accessibility enhancements (6.5.4.0) {#accessibility-enhancements}

Experience Manager Assets includes the following accessibility enhancements:

* Arrow keys on keyboard can be used to move and pan areas within zoomed images. For more information, see [preview assets using keyboard keys only](../assets/managing-assets-touch-ui.md#previewing-assets).

* The mixed state checkboxes (in which unless you select all the nested predicates the first-level checkboxes are not selected and are stricken through) in Filters panel are readable by screen readers.

* Date and time format constraints are provided in field labels of date fields, to enable the users to enter the date in correct format using keyboard.

  For example, `On Time (MM-DD-YYYY HH:mm)`. Here MM is month in two-digit format, YYYY is year, DD is day in two-digit format, HH is hour in 24-hour military format, and mm is minute.

* The `X` symbol on the button to remove the currently selected tags are now announced by screen readers along with the number of selected tags.

#### Visual search for AEM Assets (6.5.2.0) {#visual-search}

Assets users can search visually similar images. AEM displays the smart tagged images from the DAM repository that are similar to a user-selected image. See [Visual search](../assets/search-assets.md).

### Dynamic Media {#dynamic-media-previous-service-packs}

#### Smart Imaging for Dynamic Media {#smart-imaging}

Smart imaging uses each user's unique viewing characteristics to automatically serve the right images optimized for their experience, resulting in better performance and engagement. Smart imaging works with your existing image presets and uses intelligence at the last millisecond of delivery to further reduce image file size based on browser or network connection speed. See [Smart Imaging](../assets/imaging-faq.md).

#### Smart crop in video profiles for Dynamic Media (6.5.3.0) {#smart-crop-video}

Smart crop for video–an optional feature available in Video Profiles– is a tool that uses the power of artificial intelligence in Adobe Sensei to automatically detect and crop the focal point in any adaptive video or progressive video that you have uploaded, regardless of size. See [About using smart crop in video profiles](../assets/video-profiles.md).

### AEM Forms {#aem-forms-previous-service-packs}

#### Generate printable output in AEM Forms workflows (6.5.4.0) {#generate-printable-output}

The Generate Printable Output workflow step enables you to integrate a source template file with a data file. This integration enables you to print or save different copies of the template file. The step generates a PCL, PostScript, ZPL, IPL, TPCL, or DPL output. For more information on this feature, see [Forms-centric workflow on OSGi - Step Reference](../forms/using/aem-forms-workflow-step-reference.md).

![Generate Printable Output](assets/generate-print-output-step.gif)

#### Multicolumn support for adaptive forms and interactive communications in Layout mode (6.5.4.0) {#multi-column-adaptive-forms}

You can now define the number of columns for a panel in adaptive forms and interactive communications. Switch to layout mode to use the new multicolumn option. For more information, see [Use Layout mode to resize components](../forms/using/resize-using-layout-mode.md).

![Multi column layout](assets/multi-column-layout.gif)

#### AEM Inbox customizations (6.5.4.0) {#aem-inbox}

The new Admin Control option enables the administrators to:

* Customize header text and logo

* Control the display of navigation links available in the header

The Admin Control option is visible only to the members of the administrators or workflow-administrators group. For more information on this feature, see [Your Inbox](../sites-authoring/inbox.md).

#### Rich text support in HTML5 forms (6.5.4.0) {#rich-text-support}

Convert a text field in an XFA form to a rich text field in an HTML5 form. For more information, see [Designing form templates for HTML5 forms](../forms/using/designing-form-template.md).

#### Accessibility enhancements (6.5.4.0) {#forms-accessibility-enhancements-6540}

Experience Manager Forms includes the following accessibility enhancements:

* Screen readers announce checkboxes, links, Date Picker, and Date Input fields correctly in an adaptive form.

* Each page of an adaptive form now includes one title and one main landmark label.

#### Share and request access to Inbox items of an AEM Forms  user (6.5.3.0) {#share-request-access}

You can share your Inbox items with another user. Once another user gains access to your Inbox items, the user can claim and take appropriate action on shared items. Similarly, you can request access to Inbox items from other users. See [Share and request access to Inbox items of a user](../forms/using/configure-shared-queues-osgi.md).

#### Configure the out-of-office settings for Inbox items of an AEM Forms user (6.5.3.0) {#configure-out-of-office}

If you plan to be out of the office, you can specify what happens to items that are assigned to you for that period.
You have the option of specifying a start date and time and an end date and time for your out-of-office settings to be in effect. You can set a default person to whom all of your items are sent. See [Configure Out of Office settings](../forms/using/configure-out-of-office-settings.md).

#### Generate multiple interactive communications using Batch API for AEM Forms (6.5.3.0) {#generate-multiple-ic}

You can use the Batch API to produce multiple interactive communications from a template. The template is an interactive communication without any data. The Batch API combines data with a template to produce an interactive communication. The API is useful in the mass production of interactive communications. For example, telephone bills, credit card statements for multiple customers. See [Generate multiple interactive communications using Batch API](../forms/using/generate-multiple-interactive-communication-using-batch-api.md).

## Key releases since AEM 6.5 SP4 {#key-releases-since-last-sp}

Between March 05, 2020 and June 04, 2020, Adobe released following capabilities that are outside of the core AEM deliverable:

* AEM Cloud Manager [2020.3.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-2020-3-0.html), [2020.4.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-2020-4-0.html), and [2020.5.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-current.html)

* [AEM Assets: Desktop App 2.0.2.0](https://docs.adobe.com/content/help/en/experience-manager-desktop-app/using/release-notes.html)  

* [AEM Screens: Feature Pack 202004](https://docs.adobe.com/content/help/en/experience-manager-screens/user-guide/release-notes/release-notes-fp-202004.html)  

## Helpful resources

* [AEM 6.5 user guides](../user-guide/home.md)

* [General Release Notes for Adobe Experience Manager 6.5](release-notes.md)

* [Service Pack Release Notes for Adobe Experience Manager 6.5](sp-release-notes.md)
