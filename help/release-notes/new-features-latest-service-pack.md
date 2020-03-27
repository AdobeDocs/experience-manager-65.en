---
title: What's new in Adobe Experience Manager 6.5 Service Pack 4
description: What's new in Adobe Experience Manager 6.5 Service Pack 4
contentOwner: AK
mini-toc-levels: 1
---

# What's new in Adobe Experience Manager 6.5 Service Pack 4 {#aem-whats-new-service-pack-4}

Adobe Experience Manager (AEM) 6.5 delivers features and continuous improvements through quarterly Service Packs. The new approach benefits our customers as they get to adopt the innovations quicker.

The latest AEM Service Pack 4 (6.5.4.0) is released on **March 5, 2020**. This article highlights the features that the latest Service Pack offers to make your AEM journey more enriching.

## AEM Sites {#aem-sites}

### Performance improvements in various areas {#performance-improvements}

* Reduced the time for loading and initializing ContextHub within a site (`contexthub.kernel.js`). It results in faster page loads during a site visit.

* Reduced the time to refresh a page after dragging Experience Fragments to Sites Page Editor.

* Shortened the load time for entries on a Sites page with more than 200 live copies in **[!UICONTROL Live Copy Overview]**.

* Improved handling of incomplete or invalid URLs. Such URLs can slow down the Template Editor.

In addition, AEM 6.5.4.0 includes Style System enhancements. You can now select styles within the component dialog.

## AEM Assets {#aem-assets}

### Configure AEM Assets with Brand Portal {#configure-assets-bp}

The authorization channel between AEM Assets and Brand Portal is changed. Earlier, Brand Portal was configured in Classic UI via Legacy OAuth Gateway, which uses the JWT token exchange to obtain an IMS Access token for authorization. AEM Assets is now configured with Brand Portal through Adobe I/O, which procures an IMS token for authorization of your Brand Portal tenant.

The steps to configure AEM Assets with Brand Portal are different depending on your AEM version, and whether you are configuring for the first-time, or upgrading the existing configurations. See [Configure AEM Assets with Brand Portal](https://docs.adobe.com/content/help/en/experience-manager-brand-portal/using/publish/configure-aem-assets-with-brand-portal.html) for details.


### Known issues {#known-issues-bp}

* Brand Portal users are not able to publish contribution folder assets to AEM Assets on upgrading to Adobe I/O on AEM 6.5.4.

### Accessibility enhancements {#accessibility-enhancements}

Experience Manager Assets includes the following accessibility enhancements:

* Arrow keys on keyboard can be used to move and pan areas within zoomed images. For more information, see [preview assets using keyboard keys only](../assets/managing-assets-touch-ui.md#previewing-assets).

* The mixed state checkboxes (in which unless you select all the nested predicates the first-level checkboxes are not selected and are stricken through) in Filters panel are readable by screen readers.

* Date and time format constraints are provided in field labels of date fields, to enable the users to enter the date in correct format using keyboard.

  For example, `On Time (MM-DD-YYYY HH:mm)`. Here MM is month in two-digit format, YYYY is year, DD is day in two-digit format, HH is hour in 24-hour military format, and mm is minute.

* The `X` symbol on the button to remove the currently selected tags are now announced by screen readers along with the number of selected tags.

## AEM Forms {#aem-forms}

### Generate printable output in AEM Forms workflows {#generate-printable-output}

The new Generate Printable Output workflow step enables you to integrate a source template file with a data file. This integration enables you to print or save different copies of the template file. For example, you can print a source form with a different name each time it is printed. Save the names in the data file and integrate the data file with a standard template file. For more information on this feature, see [Forms-centric workflow on OSGi - Step Reference](../forms/using/aem-forms-workflow-step-reference.md).

![Generate Printable Output](assets/generate-print-output-demo.gif)

### Multicolumn support for adaptive forms and interactive communications in Layout mode {#multi-column-adaptive-forms}

You can now define the number of columns for a panel in adaptive forms and interactive communications. Switch to layout mode to use the new multicolumn option. For more information, see [Use Layout mode to resize components](../forms/using/resize-using-layout-mode.md).


![Multi column layout](assets/multi-column-layout.gif)



### AEM Inbox customizations {#aem-inbox}

The new Admin Control option enables the administrators to:

* Customize header text and logo

* Control the display of navigation links available in the header

The Admin Control option is visible only to the members of the administrators or workflow-administrators group. For more information on this feature, see [Your Inbox](../sites-authoring/inbox.md).

### Rich text support in HTML5 forms {#rich-text-support}

You can now convert a text field in an XFA form to a rich text field when rendered in an HTML5 form. As a result, the text field displays a list of other formatting options in an HTML5 form. For more information, see [Designing form templates for HTML5 forms](../forms/using/designing-form-template.md).

### Accessibility enhancements {#forms-accessibility-enhancements-6540}

Experience Manager Forms includes the following accessibility enhancements:

* Users can shift tab focus without any issues for the Ultramarine-Accessible reference theme of an adaptive form.

* Screen readers announce checkboxes, links, Date Picker, and Date Input fields correctly in an adaptive form.

* Each page of an adaptive form now includes one title and one main landmark label.

## Key features in previous AEM 6.5 Service Packs

### Smart Imaging for Dynamic Media (6.5.3.0) {#smart-imaging}

Smart imaging uses each user's unique viewing characteristics to automatically serve the right images optimized for their experience, resulting in better performance and engagement. Smart imaging works with your existing image presets and uses intelligence at the last millisecond of delivery to further reduce image file size based on browser or network connection speed. See [Smart Imaging](../assets/imaging-faq.md).

### Visual search for AEM Assets (6.5.2.0) {#visual-search}

Assets users can search visually similar images. AEM displays the smart tagged images from the DAM repository that are similar to a user-selected image. See [Visual search](../assets/search-assets.md).

### Share and request access to Inbox items of a user (6.5.3.0) {#share-request-access}

You can share your Inbox items with another user. Once another user gains access to your Inbox items, the user can claim and take appropriate action on shared items. Similarly, you can request access to Inbox items from other users. See [Share and request access to Inbox items of a user](../forms/using/configure-shared-queues-osgi.md).

### Configure the out-of-office setting for your Inbox items (6.5.3.0) {#configure-out-of-office}

If you plan to be out of the office, you can specify what happens to items that are assigned to you for that period.
You have the option of specifying a start date and time and an end date and time for your out-of-office settings to be in effect. You can set a default person to whom all of your items are sent. See [Configure Out of Office settings](../forms/using/configure-out-of-office-settings.md).

### Generate multiple interactive communications using Batch API (6.5.3.0) {#generate-multiple-ic}

You can use the Batch API to produce multiple interactive communications from a template. The template is an interactive communication without any data. The Batch API combines data with a template to produce an interactive communication. The API is useful in the mass production of interactive communications. For example, telephone bills, credit card statements for multiple customers. See [Generate multiple interactive communications using Batch API](../forms/using/generate-multiple-interactive-communication-using-batch-api.md).



## Key releases since AEM 6.5 SP3

Between December 12, 2019 and March 5, 2020, Adobe released following capabilities that are outside of the core AEM deliverable:

* AEM Cloud Manager 2020.1.0 and 2020.2.0
The release updates improve the pipeline status and the ability to download logs for various steps. For more information, see:
  * [Cloud Manager 2020.1.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-2020-1-0.html)

  * [Cloud Manager 2020.2.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-current.html)

* AEM Cloud Manager CLI updates

  The release updates include automating Cloud Manager tasks using the command-line tool. See [GitHub](https://github.com/adobe/aio-cli-plugin-cloudmanager/releases).

* AEM Sites: Project Archetype 23

  The best way to start a new AEM project. Archetype 23 merges the [Project Archetype for SPA and regular sites into one](https://github.com/adobe/aem-project-archetype/releases/tag/aem-project-archetype-23) and provides a default theme to kick-start your front-end development.

* AEM Sites: WKND reference site

  [New reference project](https://www.wknd.site/) packed with best practices on how to build sites with AEM. Learn more by reading the updated [WKND tutorial](https://helpx.adobe.com/experience-manager/kt/sites/using/getting-started-wknd-tutorial-develop.html). You can take the latest code from [GitHub](https://github.com/adobe/aem-guides-wknd/releases).

* AEM Sites: Commerce CIF Core Components 0.7.0 and 0.9.0

  Integrate AEM Sites with Magento Commerce. See [extending dedicated Core Components and Project Archetype with focus on Commerce](https://github.com/adobe/aem-core-cif-components/releases).

* AEM Assets: Desktop App 2.0.1.1

  For more information, see [Get desktop access to the assets](https://docs.adobe.com/content/help/en/experience-manager-desktop-app/using/release-notes.html).

* AEM Screens: Feature Pack 202001

  Digital Signage directly from within AEM. Install the improvements with the latest Feature Pack to [enable the synchronous playback across multiple media players](https://docs.adobe.com/content/help/en/experience-manager-screens/user-guide/release-notes/release-notes-fp-202001.html).

## Helpful resources

* [AEM 6.5 user guides](../user-guide/home.md)

* [General Release Notes for Adobe Experience Manager 6.5](release-notes.md)

* [Service Pack Release Notes for Adobe Experience Manager 6.5](sp-release-notes.md)
