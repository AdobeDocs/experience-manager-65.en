---
title: Manage compound assets with references and multi-page assets in Experience Manager
description: Learn how to create references to AEM assets from within InDesign, Illustrator, and Photoshop. Use the Page Viewer feature to view individual subasset pages of multi-page files such as PDF, INDD, PPT, PPTX, and AI files.
contentOwner: AG
---

# Manage compound and multi-page assets {#managing-compound-assets}

Adobe Experience Manager (AEM) Assets can identify if an uploaded file contains references to assets that already exist in the repository. This feature is available for supported file formats only. If the uploaded asset contains any references to AEM assets, a bidirectional link is created between the uploaded and referenced assets.

Besides eliminating redundancy, referencing AEM assets in Adobe Creative Cloud applications enhances collaboration and increases the efficiency and productivity of users.

AEM Assets supports bidirectional referencing. You can find referenced assets in the asset detail page of the uploaded file. In addition, you can view the referencing files for AEM assets in the asset details page of the referenced asset.

References are resolved on the basis of path, document ID, and instance ID of the referenced assets.

## Add AEM Assets as references in Adobe Illustrator {#refai}

You can reference existing AEM assets from within an Adobe Illustrator file.

1. Using [AEM desktop app](https://docs.adobe.com/content/help/en/experience-manager-desktop-app/using/using.html), mount AEM Assets repository as a drive on your local machine. Within the mounted drive, navigate to the location of the asset that you want to reference.
1. Drag the asset from the mounted drive to the Illustrator file.
1. Save the Illustrator file to the mounted drive, or [upload](/help/assets/managing-assets-touch-ui.md#uploading-assets) to the AEM repository.
1. After the workflow completes, go to the asset details page for the asset. The references to existing AEM assets are listed under **[!UICONTROL Dependencies]** in the **[!UICONTROL References]** column.

   ![chlimage_1-84](assets/chlimage_1-258.png)

1. The referenced assets that appear under **[!UICONTROL Dependencies]** can also be referenced by files other than the current one. To view a list of referencing files for an asset, click the asset in the under **[!UICONTROL Dependencies]**.

   ![chlimage_1-85](assets/chlimage_1-259.png)

1. Click **[!UICONTROL View Properties]** from the toolbar. In the [!UICONTROL Properties] page, the list of files that reference the current asset appear under the **[!UICONTROL References]** column in the **[!UICONTROL Basic]** tab.

   ![chlimage_1-86](assets/chlimage_1-260.png)

## Add AEM assets as references in Adobe InDesign {#add-aem-assets-as-references-in-adobe-indesign}

To reference AEM assets from within an InDesign file, either drag AEM assets to the InDesign file or export the InDesign file as a ZIP file.

Referenced assets already exist in AEM Assets. You can extract subassets by [configuring InDesign server](/help/assets/indesign.md). Embedded assets in an InDesign file are extracted as subassets.

>[!NOTE]
>
>If the InDesign server is proxied, InDesign files have their preview embedded within their XMP metadata. In this case, thumbnail extraction is not explicitly required. However, if the InDesign server is not proxied, thumbnails must be explicitly extracted for InDesign files.

### Create references by dragging assets {#create-references-by-dragging-aem-assets}

This procedure is similar to [Add AEM assets as references in Adobe Illustrator](#refai).

### Create references to assets by exporting a ZIP file {#create-references-to-aem-assets-by-exporting-a-zip-file}

1. Perform the steps in [Create workflow models](/help/sites-developing/workflows-models.md) to create a new workflow.
1. Use the Package feature of Adobe InDesign to export the document.
   Adobe InDesign can export a document and the linked assets as a package. In this case, the exported folder contains a Links folder that contains sub-assets in the InDesign file.
1. Create a ZIP file and upload it to the AEM repository.
1. Start the `Unarchiver` workflow.
1. When the workflow completes, the references in the Links folder are automatically referenced as subassets. To view a list of referred assets, navigate to the asset details page of the InDesign asset and close the [Rail](/help/sites-authoring/basic-handling.md#rail-selector).

## Add AEM assets as references in Adobe Photoshop {#refps}

1. Using a WebDav client, mount AEM Assets as a drive.
1. To create references to AEM assets in a Photoshop file, navigate to the corresponding assets in the mounted drive using the Place linked functionality in Photoshop.

   ![chlimage_1-87](assets/chlimage_1-261.png)

1. Save in Photoshop file to the mounted drive or or [upload](/help/assets/managing-assets-touch-ui.md#uploading-assets) to the AEM repository.
1. After the workflow completes, the references to existing AEM assets are listed in the asset details page.

   To view the referenced assets, close the [Rail](/help/sites-authoring/basic-handling.md#rail-selector) in the asset details page.

1. The referenced assets also contain the list of assets they are referenced from. To view a list of referenced assets, navigate to the asset details page and close the [Rail](/help/sites-authoring/basic-handling.md#rail-selector).

>[!NOTE]
>
>The assets within compound assets can also be referenced based on their Document ID and Instance ID. This functionality is available with Adobe Illustrator and Adobe Photoshop versions only. For others, referencing is done on the basis of relative path of linked assets in the main compound asset as done in earlier versions of AEM.

## Create subassets {#generate-subassets}

For the supported assets with multi-page formats &mdash; PDF files, AI files, Microsoft PowerPoint and Apple Keynote files, and Adobe InDesign files &mdash; AEM can generate subassets that correspond to each individual page of the original asset. These subassets are linked to the *parent* asset and facilitate multi-page view. For all other purposes, the subassets are treated like normal assets in AEM.

Subasset generation is disabled by default. To enable subasset generation, follow these steps:

1. Log into Experience Manager as an administrator. Access **[!UICONTROL Tools > Workflow > Models]**.
1. Select **[!UICONTROL DAM Update Asset]** workflow and click **[!UICONTROL Edit]**.
1. Click **[!UICONTROL Toggle Side Panel]** and locate the **[!UICONTROL Create Sub Asset]** step. Add the step to the workflow. Click **[!UICONTROL Sync]**.

To generate the subassets do one of the following:

* New assets: The [!UICONTROL DAM Update Assets] workflow executes on any new asset that is uploaded to AEM. Subassets are auto-generated for new multi-page assets.
* Existing multi-page assets: Manually execute the [!UICONTROL DAM Update Assets] workflow following either of the steps:

  * Select an asset and click [!UICONTROL Timeline] to open the left panel. Alternately, use the keyboard shortcut `alt + 3`. Click [!UICONTROL Start Workflow], select [!UICONTROL DAM Update Asset], click [!UICONTROL Start], and click [!UICONTROL Proceed].
  * Select an asset and click [!UICONTROL Create > Workflow] from the toolbar. From the popup dialog, select [!UICONTROL DAM Update Asset] workflow, click [!UICONTROL Start], and click [!UICONTROL Proceed].

Specifically for Microsoft Word documents, execute the **[!UICONTROL DAM Parse Word Documents]** workflow. It generates a `cq:Page` component from the contents of the Microsoft Word document. The images extracted from the document are referenced from the `cq:Page` component. These images are extracted even if subasset generation is disabled.

## View subassets {#viewing-subassets}

The subassets are displayed only if the subassets are generated and are available for the selected multi-page asset. To view the generated subassets, open the multi-page asset. In the upper-left area of the page, click ![Left rail icon](assets/do-not-localize/aem_leftrail_contentonly.png) and click **[!UICONTROL Subassets]** from the list. When you select **[!UICONTROL Subassets]** from the list. Alternately, use the keyboard shortcut `alt + 5`.

![View subassets for a multi-page asset](assets/view_subassets_simulation.gif)

## View pages of a multi-page file {#view-pages-of-a-multi-page-file}

You can view a multi-page file, such as PDF, INDD, PPT, PPTX, and AI file, using the Page Viewer feature of AEM Assets. Open a multi-page asset and click **[!UICONTROL View Pages]** from the upper-left corner of the page. The Page Viewer that opens displays the pages of the asset and the controls to browse through and zoom each page.

![View and see pages of a multi-page asset](assets/view_multipage_asset_fmr.gif)

For InDesign, you can extract pages using InDesign server. If the previews of pages are saved during InDesign file creation, then InDesign Server is not required for page extraction.

The following options are available in the toolbar, in the left rail, and in the Page Viewer controls:

* **[!UICONTROL Desktop Actions]** to open or reveal a specific subasset using AEM desktop app. See how to [configure Desktop Actions](https://docs.adobe.com/content/help/en/experience-manager-desktop-app/using/using.html#desktopactions-v2) if you are using AEM desktop app.

* **[!UICONTROL Properties]** option opens the [!UICONTROL Properties] page of the specific subasset.

* **[!UICONTROL Annotate]** option allows you to annotate the specific subasset. The annotations you use on separate subassets are collected and displayed together when the parent asset is opened for viewing.

* **[!UICONTROL Page Overview]** option displays all the subassets simultaneously.

* **[!UICONTROL Timeline]** option from the left rail after clicking ![Left rail icon](assets/do-not-localize/aem_leftrail_contentonly.png) displays the activity stream for the file.
