---
title: Asset Templates
description: Learn about Asset templates in AEM Assets and how to use Asset templates to create marketing collateral.
uuid: 26ee7c45-e8de-4ee1-a704-b5c7d2809654
contentOwner: AG
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
discoiquuid: 9abb6816-b75d-4068-9c7d-e707e55224ec
docset: aem65

---

# Asset Templates {#asset-templates}

Asset templates are a special class of assets that facilitate quick re-purposing of visually-rich content for digital and print media. An asset template includes two parts, the fixed messaging section and the editable section.

The fixed messaging section can contain proprietary content, such as brand logo and copyright information that are disabled for editing. The editable section can contain visual and textual content in fields that can be edited to customize messaging.

The flexibility to make limited edits while securing global signage makes asset templates ideal building blocks for quick content adaptation and distribution as content artifacts for various functions. Re-purposing content helps reduce the cost for managing print and digital channels and deliver holistic and consistent experiences across these channels.

As a marketer, you can store and manage templates within AEM Assets and use a single base template to create multiple personalized print experiences with ease. You can create various types of marketing collateral, including brochures, flyers, postcards, business cards, and so on to lucidly convey your marketing message to customers. You can also assemble multi-page print outputs from existing or new print outputs. Above all, you can simultaneously deliver both digital and print experiences with ease to provide a consistent, integrated experience for users.

While asset templates are mostly Adobe InDesign files, proficiency in Adobe InDesign is not a barrier to creating stellar artifacts. You need not map the fields of your Adobe InDesign template with your product fields that you otherwise require to when creating catalogs. You can edit the templates in WYSIWYG mode directly on the web interface. However, for Adobe InDesign to process your editing changes, you must first configure AEM Assets to integrate with Adobe InDesign server.

The ability to edit Adobe InDesign templates from the web interface helps foster greater collaboration between Creative and Marketing personnel, while reducing the time to market for local promotion initiatives.

You can do the following with asset templates:

* Modify editable template fields from the web interface
* Control the basic styling of text, for example font size, style, and type at the tag level
* Change images within the template using Content Picker
* Preview template edits
* Merge multiple template files to create a multi-page artifact

When you choose a template for your collateral, AEM Assets creates a copy of the template that you can edit. The original template is preserved, which ensures that your global signage remains intact and can be reused to enforce brand consistency.

You can export the updated file within the parent folder in the following formats:

* INDD
* PDF
* JPG

You can also download the output in these formats to your local system.

## Create a Collateral {#creating-a-collateral}

Consider a scenario where you want to create digital printable collateral, such as brochures, flyers, and ads for an upcoming campaign and share with outlet stores globally. Creating collateral based on a template helps deliver a unified customer experience across channels. Designers can create the campaign templates (single-page or multi-page) using a creative solution, such as InDesign and upload the templates to AEM Assets for you. Before creating a collateral, have one or more INDD templates uploaded to and available in Experience Manager in advance.

1. Click or tap the AEM logo, and then click/tap Assets.

1. From the options, choose **[!UICONTROL Templates]**.

   ![chlimage_1-101](assets/chlimage_1-306.png)

1. Click/tap **[!UICONTROL Create]**, and then choose the collateral you want to create from the menu. For example, choose **[!UICONTROL Brochure]**.

   ![chlimage_1-102](assets/chlimage_1-307.png)

1. Have one or more INDD templates uploaded to and available in Experience Manager in advance. Choose a template for your brochure, and click/tap **[!UICONTROL Next]**.

   ![chlimage_1-103](assets/chlimage_1-308.png)

1. Specify a name and an optional description for the brochure.

   ![chlimage_1-104](assets/chlimage_1-309.png)

1. (Optional) Tap **[!UICONTROL Tags]** and select one or more tags for the brochure. Tap **[!UICONTROL Confirm]** to confirm your selection.

   ![chlimage_1-105](assets/chlimage_1-310.png)

1. Click **[!UICONTROL Create]**. A dialog confirms that a new brochure is created. Click/tap **[!UICONTROL Open]** to open the brochure in edit mode.

   ![chlimage_1-106](assets/.png)

   Alternatively, close the dialog and navigate to the folder in the Templates page you started with to view the brochure you created. The type of the collateral appears on its thumbnail in card view. For example, in this case, Brochure is displayed on the thumbnail.

   ![chlimage_1-107](assets/chlimage_1-312.png)

## Editing a Collateral {#editing-a-collateral}

You can edit a collateral immediately after you create it. Alternatively, you open it from the Templates page or the asset page.

1. To open the collateral for editing, do one of the following:

    * Open the collateral (brochure in this case) you created in step 7 of [Creating a Collateral](/help/assets/asset-templates.md#creating-a-collateral).
    * From the Templates page, navigate to a folder where you created the collateral, and click/tap the Edit quick action on the thumbnail of a collateral.
    * In the asset page for the collateral, tap **[!UICONTROL Edit]** from the toolbar.
    * Select the collateral and tap **[!UICONTROL Edit]** from the toolbar.

   ![chlimage_1-108](assets/chlimage_1-108.png)

   The asset finder and the text editor is displayed on the left of the page. The text editor is open by default.

   You can uses the text editor to modify the text you want displayed in the text field. You can modify the font size, style, color, and type at the tag level.

   Using the asset finder, you can browse or search for images within AEM Assets and replace the editable images in the template with images of your choice.

   ![chlimage_1-109](assets/chlimage_1-109.png)

   The editable are displayed on the right. For a field to be editable in AEM Assets, corresponding field in the template must be tagged in InDesign. In other words, they should be marked as editable in InDesign.

   ![chlimage_1-110](assets/chlimage_1-110.png)

   >[!NOTE]
   >
   >Ensure that your AEM instance is integrated with an InDesign server to enable AEM Assets to extract data from the InDesign template and make it available for editing. For details, see [Integrating AEM Assets with InDesign Server](/help/assets/indesign.md).

1. To modify the text in an editable field, click/tap the text field from the list of editable fields and edit the text in the field.

   ![chlimage_1-111](assets/chlimage_1-111.png)

   You can edit the text properties, for example font style, color, size using the options provided.

1. Tap **[!UICONTROL Preview]** to preview the text changes.

   ![chlimage_1-112](assets/chlimage_1-112.png)

1. To swap an image, tap the **[!UICONTROL Asset Finder]**.

   ![chlimage_1-113](assets/chlimage_1-113.png)

1. Select the image field from the list of editable fields and then drag a desired image from the asset picker to the editable field.

   ![chlimage_1-114](assets/chlimage_1-114.png)

   You can also search for images using keywords, tags, and based on their publish status. You can browse through the AEM Assets repository and navigate to the location of the desired image.

   ![chlimage_1-115](assets/chlimage_1-115.png)

1. Tap **[!UICONTROL Preview]** to preview the image.

   ![chlimage_1-116](assets/chlimage_1-116.png)

1. To edit a specific page in a multi-page collateral, use the page navigator at the bottom.

   ![chlimage_1-117](assets/chlimage_1-117.png)

1. Tap **[!UICONTROL Preview]**  on the toolbar to preview all the changes. Click/tap **[!UICONTROL Done]** to save the editing changes to the collateral.

   >[!NOTE]
   >
   >The Preview and Done icons are enabled only when the editable image fields within the collateral do not have any missing icons. If there are missing icons in your collateral, it is because AEM is unable to resolve the images in the InDesign template. Usually, AEM is unable to resolve images in the following cases:
   >
   >    * Images are not embedded in the underlying InDesign template
   >    * Images are linked from the local file system
   >
   >To enable AEM to resolve images, do the following:
   >
   >    * Embed images while creating InDesign templates (See [About links and embedded graphics](https://helpx.adobe.com/indesign/using/graphics-links.html)).
   >    * Mount AEM to your local file system, and then map missing icons with existing AEM assets.
   >
   >For more information around working with InDesign documents, see [Best Practices for Working with InDesign Documents in AEM](https://helpx.adobe.com/experience-manager/kb/best-practices-idd-docs-aem.html).

1. To generate a PDF rendition for the brochure, select the Acrobat option in the dialog and then click **[!UICONTROL Continue]**.
1. The collateral is created in the folder you started with. To view the renditions, open the collateral and choose **[!UICONTROL Renditions]** from the GlobalNav list.

   ![chlimage_1-118](assets/chlimage_1-118.png)

1. Click/tap the PDF rendition from the list of renditions to download the PDF file. Open the PDF file to review the collateral.

   ![chlimage_1-119](assets/chlimage_1-119.png)

## Merge Collateral {#merge-collateral}

1. Click or tap the AEM logo, and then click/tap Assets on the Navigation page.
1. From the options, choose **[!UICONTROL Templates]**.
1. Click/tap **[!UICONTROL Create]** and the choose **[!UICONTROL Merge]** from the menu.

   ![chlimage_1-120](assets/chlimage_1-120.png)

1. From the [!UICONTROL Template Merge] page, tap **[!UICONTROL Merge]**.

   ![chlimage_1-121](assets/chlimage_1-121.png)

1. Navigate to the location of the collateral you want to merge, click/tap the thumbnails of the collateral you want to merge to select them.

   ![chlimage_1-122](assets/chlimage_1-122.png)

   You can even search for templates from the Omnisearch box.

   ![chlimage_1-123](assets/chlimage_1-123.png)

   You can browse through the AEM Assets repository or collections, and navigate to the location of the desired templates and then select them to merge.

   ![chlimage_1-124](assets/chlimage_1-124.png)

   You can apply various filters to search the desired templates. For example, you can search for templates based on file type or tags.

   ![chlimage_1-125](assets/chlimage_1-125.png)

1. Click/tap **[!UICONTROL Next]** from the toolbar.
1. In the **[!UICONTROL Preview & Reorder]** screen, rearrange the templates if required and preview the selection of templates to merge. Then, click/tap **[!UICONTROL Next]** from the toolbar.

   ![chlimage_1-126](assets/chlimage_1-126.png)

1. In the Configure Template screen, specify a name for the collateral. Optionally, specify any tags that you consider appropriate. If you want to export the output in PDF format, select the **Acrobat (.PDF)** option. By default, the collateral is exported in JPG and InDesign format. To change the display thumbnail for the multi-page collateral, click/tap **[!UICONTROL Change Thumbnail]**.

   ![chlimage_1-127](assets/chlimage_1-127.png)

1. Click/tap **[!UICONTROL Save]** and then click/tap **[!UICONTROL OK]** in the dialog to close the dialog. The multi-page collateral is created in the folder you started with.

   >[!NOTE]
   >
   >You cannot edit a merged collateral later or use it to create other collateral.
