---
title: What's new in Adobe Experience Manager 6.5 Service Pack 4
description: What's new in Adobe Experience Manager 6.5 Service Pack 4
contentOwner: AK
mini-toc-levels: 1
---

# What's new in Adobe Experience Manager 6.5 Service Pack 4 {#aem-whats-new-service-pack-4}

Adobe Experience Manager (AEM) 6.5 delivers features and continuous improvements through quarterly Service Packs this year. The new approach benefits our customers as they get to adopt the innovations quicker.

The latest AEM Service Pack 4 (6.5.4.0) is released on **March 5, 2020**. This article highlights the features that the latest Service Pack offers to make your AEM journey more enriching.

## AEM Sites {#aem-sites}

### Performance improvements in various areas {#performance-improvements}

* Reduced the time for loading and initializing ContextHub within a site (contexthub.kernel.js). It results in faster page loads during a site visit.

* Reduced the time to refresh a page after dragging & dropping Experience Fragments to Sites page editor.

* Shortened the time to load entries for a Sites page with more than 200 live copies in Live Copy Overview.

* Improved handling of incomplete or invalid URLs. Such URLs can slow down the Template Editor.

In addition, AEM 6.5.4.0 includes Style System enhancements. You can now select styles within the component dialog.

## AEM Assets {#aem-assets}

### Configure AEM Assets with Brand Portal {#configure-assets-bp}

The authorization channel between AEM Assets and Brand Portal is changed. Earlier, Brand Portal was configured in Classic UI via Legacy OAuth Gateway, which uses the JWT token exchange to obtain an IMS Access token for authorization. AEM Assets is now configured with Brand Portal through Adobe I/O, which procures an IMS token for authorization of your Brand Portal tenant.

The steps to configure AEM Assets with Brand Portal are different depending on your AEM version, and whether you are configuring for the first-time, or upgrading the existing configurations. See [Configure AEM Assets with Brand Portal](https://docs.adobe.com/content/help/en/experience-manager-brand-portal/using/publish/configure-aem-assets-with-brand-portal.html) for details.


### Accessibility enhancements {#accessibility-enhancements}

Experience Manager Assets includes the following accessibility enhancements:

* Arrow keys on keyboard can be used to move and pan areas within zoomed images. For more information, see [preview assets using keyboard keys only](../assets/managing-assets-touch-ui.md#previewing-assets).

* The mixed state checkboxes (in which unless you select all the nested predicates the first-level checkboxes are not selected and are stricken through) in Filters panel are readable by screen readers.

* Date and time format constraints are provided in field labels of date fields, to enable the users to enter the date in correct format using keyboard.

  For example, `On Time (MM-DD-YYYY HH:mm)`. Here MM is month in two-digit format, YYYY is year, DD is day in two-digit format, HH is hour in 24-hour military format, and mm is minute.

* The `X` symbol on the button to remove the currently selected tags are now announced by screen readers along with the number of selected tags.

## AEM Forms {#aem-forms}

### Generate printable output in AEM Forms workflows {#generate-printable-output}

If you want a solution to print or save multiple copies of a source template file and integrate it with a data file with numerous records, a new Generate Printable Output workflow step is available in AEM Forms. For example, if you want to print a source form with a different name each time it is printed, you can have those names in the data file and integrate it with a standard template file.

Take advantage of this feature using **Tools** > **[!UICONTROL Workflow]** > **[!UICONTROL Models]** > **[!UICONTROL Create]** and then search for the **[!UICONTROL Generate Printable Output]** workflow step.

![Generate Printable Output](assets/generate-print-output-demo.gif)

For more information on this feature, see [Forms-centric workflow on OSGi - Step Reference](../forms/using/aem-forms-workflow-step-reference.md).

### Multi-column support for adaptive forms and interactive communications in Layout mode {#multi-column-adaptive-forms}

You can now define the number of columns for a panel in adaptive forms and interactive communications.

You can find the new option by switching to Layout mode. Tap the panel that you want to convert to a multi-column format, select its parent and tap the multi-column icon, to define the number of columns for the panel.

![Multi column layout](assets/multi-column-layout.gif)

For more information, see [Use Layout mode to resize components](../forms/using/resize-using-layout-mode.md).

### AEM Inbox customizations {#aem-inbox}

Do you ever feel the need to customize options available in AEM header? It is now possible with our new Service Pack release with the introduction of an **[!UICONTROL Admin Control]** option.  

**Customize header text**

Workflow administrators can now specify header text of your own choice.

You can find the new **[!UICONTROL Customize header text]** option under view selector (available at top-right of the toolbar) > **[!UICONTROL Admin Control]**.

**Customize logo**

Similar to customizing header text, workflow administrators can now specify header logo of your own choice. 

You can find the new **[!UICONTROL Customize Logo]** option under view selector > **[!UICONTROL Admin Control]**.

For more information on this feature, see [Your Inbox](../sites-authoring/inbox.md).

### User navigation control {#user-navigation-control}

Workflow administrators now have the option of making the users work on AEM in a restricted mode based on their role. The administrators can control the display of navigation options available in the header to restrict the users to switch to workflow authoring mode or other solution links.

Check out the new **[!UICONTROL Hide navigation options]** under view selector > **[!UICONTROL Admin Control]**.

For more information on this feature, see [Your Inbox](../sites-authoring/inbox.md).

### Rich text support in HTML5 forms {#rich-text-support}

The text field can now display a list of formatting options in the rendered HTML5 form. You must define a format for the text field in Forms Designer to apply appropriate settings to the field.

To use this feature, tap the text field in **[!UICONTROL Design View]** in Forms Designer. In the **[!UICONTROL Field]** tab, select **[!UICONTROL Rich Text]** from the **[!UICONTROL Field Format]** drop-down list to apply the settings.

For more information, see [Designing form templates for HTML5 forms](../forms/using/designing-form-template.md).

## Key highlights

In addition to new features, AEM 6.5 Service Pack 4 includes the following key highlights:

* You can now sync selective content subtrees to *Dynamic Media - Scene7 mode* instead of all available at `content/dam`.

* Form data model integration with SOAP web service now supports choice groups or attributes on elements.

* SOAP input or output and complex data structures now support Dynamic Group Substitution.

## Key features in previous AEM 6.5 Service Packs

### Smart Imaging for Dynamic Media {#smart-imaging}

Smart imaging leverages each user's unique viewing characteristics to automatically serve the right images optimized for their experience, resulting in better performance and engagement. Smart imaging works with your existing image presets and uses intelligence at the last millisecond of delivery to further reduce image file size based on browser or network connection speed. See [Smart Imaging](../assets/imaging-faq.md).

### Visual search for AEM Assets {#visual-search}

Assets users can search visually similar images. AEM displays the smart tagged images from the DAM repository that are similar to a user-selected image. See [Visual search](../assets/search-assets.md).

### Share and request access to Inbox items of a user {#share-request-access}

You can share your Inbox items with another user. Once another user has access to your Inbox items, the user can claim and take appropriate action on shared items. Similarly, you can request access to Inbox items from other users. See [Share and request access to Inbox items of a user](../forms/using/configure-shared-queues-osgi.md).

### Configure out of office setting for your Inbox items {#configure-out-of-office}

If you plan to be out of the office, you can specify what happens to items that are assigned to you for that period.
You have the option of specifying a start date and time and an end date and time for your out-of-office settings to be in effect. You can set a default person to which all of your items are sent. See [Configure Out of Office settings](../forms/using/configure-out-of-office-settings.md).

### Generate multiple interactive communications using Batch API {#generate-multiple-ic}

You can use the Batch API to produce multiple interactive communications from a template. The template is an interactive communication without any data. The Batch API combines data with a template to produce an interactive communication. The API is useful in the mass production of interactive communications. For example, telephone bills, credit card statements for multiple customers. See [Generate multiple interactive communications using Batch API](../forms/using/generate-multiple-interactive-communication-using-batch-api.md).

### Standard validation error messages for adaptive forms {#standard-validation}

Adaptive forms can now integrate with custom services to perform data validations. If the input values do not meet the validation criteria and the validation error message that the server returns is in the standard message format, the error messages display at field-level in the form. If the input values do not meet the validation criteria and the server validation error message is not in the standard message format, the adaptive forms provide a mechanism to transform the validation error messages into a standard format so that they display at field-level in the form. See [Standard validation error messages for adaptive forms](../forms/using/standard-validation-error-messages-adaptive-forms.md).

## Key releases since AEM 6.5 SP3

Between December 12, 2019 and March 5th, 2020 Adobe released following capabilities that are outside of the core AEM deliverable:

* AEM Cloud Manager 2020.1.0 and 2020.2.0
Monthly improvements to Cloud Manager, last two releases focused on improving the pipeline status and the ability to download logs for the various steps. Read the full release notes here:
  * [Cloud Manager 2020.1.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-2020-1-0.html)

  * [Cloud Manager 2020.2.0](https://docs.adobe.com/content/help/en/experience-manager-cloud-manager/using/release-notes/release-notes-current.html)

* AEM Cloud Manager CLI Updates
Automate Cloud Manager tasks using the command line tool. We are continuously extending the CLI - join on [GitHub](https://github.com/adobe/aio-cli-plugin-cloudmanager/releases).

* AEM Sites: Project Archetype 23
The best way to start a new AEM project. With Archetype 23 we are [merging the Project Archetype for SPA and regular sites into one](https://github.com/adobe/aem-project-archetype/releases/tag/aem-project-archetype-23), further providing a default theme to kick-start your front-end development.

* AEM Sites: WKND Reference Site
All [new reference project](https://www.wknd.site/) packed with best practices on how to build sites with AEM. Learn more by ereading the completely updated [WKND tutorial](https://helpx.adobe.com/experience-manager/kt/sites/using/getting-started-wknd-tutorial-develop.html) and grabbing the code from [GitHub](https://github.com/adobe/aem-guides-wknd/releases).

* AEM Sites: Commerce CIF Core Components 0.7.0 and 0.9.0
Integrating AEM Sites and Magento Commerce. We are continuously [extending dedicated Core Components and a Project Archetype with focus on Commerce](https://github.com/adobe/aem-core-cif-components/releases).

* AEM Assets: Desktop App 2.0.1.1
[Get desktop access to the assets](https://docs.adobe.com/content/help/en/experience-manager-desktop-app/using/release-notes.html)

* AEM Screens: Feature Pack 202001
Digital Signage directly from within AEM. Grab the latest improvements with the latest Feature Pack, this time we are [enabling the synchronous playback across multiple media players](https://docs.adobe.com/content/help/en/experience-manager-screens/user-guide/release-notes/release-notes-fp-202001.html).

## Helpful resources

* [AEM 6.5 user guides](../user-guide/capabilities.md)

* [General Release Notes for Adobe Experience Manager 6.5](release-notes.md)

* [Service Pack Release Notes for Adobe Experience Manager 6.5](sp-release-notes.md)
