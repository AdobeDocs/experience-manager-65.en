---
title: Carousel banners
description: Learn how to work with carousel banners in Dynamic Media
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
docset: aem65
feature: Carousel Banners
role: User, Admin
exl-id: 53d34d3a-ecb6-4fa0-9665-60d21f48021e
solution: Experience Manager, Experience Manager Assets
---
# Carousel banners{#carousel-banners}

Carousel banners enable marketers to drive conversion by easily creating interactive rotating promotional content and delivering it to any screen.

Creating and modifying content featured in promotional banners can be time-consuming, limiting your ability to quickly publish new content or make it more targeted. Carousel banners let you quickly create or modify rotating banners. You can add interactivity such as hotspots linking to product details or related resources, and deliver them to any screen &ndash; letting you bring new promotional content to market faster.

Carousel banners are designated by a banner with the word **[!UICONTROL CAROUSELSET]**

![chlimage_1-438](assets/chlimage_1-438.png)

On your website, a carousel banner can look as follows:

![chlimage_1-439](assets/chlimage_1-439.png)

Here you can navigate through the images (by clicking the numbers). In addition, the slides automatically rotate based on a time interval you can customize. Images that you add in carousel banners support both hotspots and image maps, where users can either select or to go to a hyperlink or access a Quickview window.

In this example, a user has tapped or clicked an image map and accessed the Quickview window for gloves:

![chlimage_1-440](assets/chlimage_1-440.png)

## Watch how carousel banners are created {#watch-how-carousel-banners-are-created}

Play a walkthrough on [how carousel banners are created](https://s7d5.scene7.com/s7viewers/html5/VideoViewer.html?videoserverurl=https://s7d5.scene7.com/is/content/&emailurl=https://s7d5.scene7.com/s7/emailFriend&serverUrl=https://s7d5.scene7.com/is/image/&config=Scene7SharedAssets/Universal_HTML5_Video_social&contenturl=https://s7d5.scene7.com/skins/&asset=S7tutorials/InteractiveCarouselBanner)(10 minutes and 33 seconds). You also learn how to preview, edit, and deliver carousel banners.

>[!NOTE]
>
>Non-administrative users must be added to the **[!UICONTROL `dam-users`]** group to be able to create or edit carousel banners. If you are having trouble creating or editing,  see your system administrator who can add you to the **[!UICONTROL `dam-users`]** group.

## Quick Start: Carousel banners {#quick-start-carousel-banners}

To get you up and running quickly with carousel banners:

1. [Identify hotspot and image map variables](#identifying-hotspot-and-image-map-variables) (only for customers using Experience Manager Assets + Dynamic Media)

   Start by identifying dynamic variables used by the existing Quickview implementation so that you can enter hotspots and image map data properly during the carousel banner creation process in Adobe Experience Manager Assets.

   >[!NOTE]
   >
   >If you are an Experience Manager Sites or Ecommerce customer, you can use the built-in feature to navigate to product pages and lookup the existing SKUs (Stock Keeping Unit) in the product catalog. You do not need to manually enter hotspot or image map variables. See information on [setting up eCommerce](/help/commerce/cif-classic/administering/generic.md).
   >
   >
   >If you are an Experience Manager Assets and Dynamic Media customer, you manually enter data for hotspots and image maps, and then integrate the published URL or Embed code with your third-party content management system.

1. Optional: [Create a Carousel Set viewer preset](/help/assets/managing-viewer-presets.md), as needed.

   If you are an administrator, you can customize the behavior and appearance of the carousel by creating your own Carousel viewer preset. The main benefit is that you can reuse this custom viewer preset for multiple carousels. However, users can optionally customize the behavior and appearance of the carousel directly while authoring the carousel. This method is the preferred approach when you want a specific design for a given carousel.

1. [Upload an Image Banner](#uploading-image-banners).

   Upload image banners that you want to make interactive.

1. [Create Carousel Sets](#creating-carousel-sets).

   In Carousels Sets, users navigate through banner images and select hotspots or image maps to access relevant content.

   To create a Carousel Set in Assets, select **[!UICONTROL Create]**, then select **[!UICONTROL Carousel Sets]**. Add assets to each slide and select **[!UICONTROL Save]**. You can also edit the appearance and behavior of the carousel directly within the editor.

1. [Add hotspots or image maps to an Image Banner](#adding-hotspots-or-image-maps-to-an-image-banner).

   Add one or more hotspots or image maps to an image banner and associate each one with an action such as a link, a Quickview, or an Experience Fragment. After you add hotspots or image maps, you finish this task by publishing the carousel set. Publishing creates the embed code that you can use to copy and apply to your website landing page.

   See [(Optional) Preview carousel banners](#optional-previewing-carousel-banners) - Optional. If desired, you can view a representation of your carousel set and test its interactivity.

1. [Publish carousel banners](#publishing-carousel-banners).

   You publish a Carousel Set as you would any asset. In Assets, navigate to the Carousel Set and select it and select **[!UICONTROL Publish]**. Publishing a Carousel Set activates the URL and Embed string.

1. Do one of the following:

    * [Add a carousel banner to your website page](#adding-a-carousel-banner-to-your-website-page) You can add the carousel banner URL or embed code you have copied onto the website page.

        * [Integrate the carousel banner with an existing Quickview](#integrating-the-carousel-banner-with-an-existing-quickview). If you use a third-party web content management system, you must integrate the new carousel banner with the existing Quickview implementation on your website.

    * [Add a carousel banner to your website in Experience Manager](/help/assets/adding-dynamic-media-assets-to-pages.md) If you are an Experience Manager Sites customer you can add the carousel set directly to the page in Experience Manager, using the Interactive Media component.

To edit Carousel Sets, see [editing Carousel Sets](#editing-carousel-sets). In addition, you can view and edit [Carousel Set properties](manage-assets.md#editing-properties).

## Identify hotspot and Image Map variables {#identifying-hotspot-and-image-map-variables}

Start by identifying dynamic variables used by the existing Quickview implementation so that you can enter hotspots or image map data properly during the carousel set creation process in Experience Manager Assets.

When you add hotspots or image maps to a banner image in Experience Manager Assets, assign a SKU and optional extra variables to each hotspot or image map. Such variables are used later to match hotspots or image maps with Quickview content.

>[!NOTE]
>
>If you are an Experience Manager Sites and/or Experience Manager Ecommerce customer, skip this step. You do not need to manually identify hotspot or image map variables; you can use the integration with Ecommerce for product integration. See information on [setting up eCommerce](/help/commerce/cif-classic/administering/generic.md). In addition, you can use the Interactive component and add it to your web page.
>
>If you are an Experience Manager Assets or Media customer, you publish the URL or Embed code and then integrate with your third-party content management system and identify hotspots and image maps manually.

It is important to properly identify the number and type of variables to associate with hotspot or image map data. Each hotspot or image map added to a banner image must carry enough information to unambiguously identify the product in the existing backend system. At the same time, each hotspot or image map must not include more data than is necessary. The reason is because that would make the data entry process overly complex and on-going hotspot or image map management more error-prone.

There are different ways to identify a set of variables to use for hotspot or image map data.

Sometimes it is enough to consult with IT specialists responsible for the existing Quickview implementation. They are likely to know what is the minimum set of data required to identify Quickview in the system. However, usually it is also possible to simply analyze the existing behavior of the front-end code.

Most Quickview implementations use the following paradigm:

* User activates a user interface element on the website. For example, tapping a **[!UICONTROL Quickview]** button.
* The website sends an Ajax request to the backend to load the Quickview data or content, if needed.
* The Quickview data is translated into the content in preparation for rendering on the web page.
* Finally, the front-end code visually renders such content on the screen.

The approach then is to visit different areas of the existing website where the Quickview feature is implemented. Trigger the Quickview, and capture the Ajax URL sent by web page for loading the Quickview data or content.

Normally there is no need for you to use any specialized debugging tools. Modern web browsers feature web inspectors that do an adequate job. The following are a few examples of web browsers that include web inspectors:

* To see all outgoing HTTP requests in Google Chrome, press F12 (Windows) or Command-Option-I (Mac) to open the Developer Tools panel, and then select the Network tab.
* In Firefox, you can either activate the Firebug plug-in by pressing F12 (Windows) or Command-Option-I (Mac) and use its Net tab, or you can use the built-in Inspector tool and its Network tab.

When network monitoring is turned on in the browser, trigger the Quickview on the page.

Now find the Quickview Ajax URL in the network log and copy the recorded URL for future analysis. Usually when you trigger the Quickview there are numerous requests that are sent out to the server. Typically, the Quickview Ajax URL is one of the first in the list. It has either a complex query string portion or path, and its response MIME type is either `text/html`, `text/xml`, or `text/javascript`.

During this process, it is important to visit different areas of your website, with different product categories and types. The reason is that Quickview URLs have parts that are common for a given website category, but change only if you visit a different area of the website.

In the simplest case, the only variable part in the Quickview URL is the product SKU. In this case, the SKU value is the only data piece that you need for adding hotspots or image maps to the banner image.

However, in complex cases, the Quickview URL has varying elements that differ in addition to the SKU, such as category ID, color code, and size code. In such cases, every element is a separate variable in your hotspot or image map data definition in the carousel banner feature.

Consider the following examples of Quickview URLs and their resulting hotspot or image map variables:

<table>
 <tbody>
  <tr>
   <td>Single SKU, found in the query string.</td>
   <td><p>The recorded Quickview URLs include the following:</p>
    <ul>
     <li><p><code>https://server/json?productId=866558&amp;source=100</code></p> </li>
     <li><p><code>https://server/json?productId=1196184&amp;source=100</code></p> </li>
     <li><p><code>https://server/json?productId=1081492&amp;source=100</code></p> </li>
     <li><p><code>https://server/json?productId=1898294&amp;source=100</code></p> </li>
    </ul> <p>The only variable part in the URL is the value of the <code>productId=</code> query string parameter, and it is clearly a SKU value. Therefore, the hotspots or image maps only need SKU fields populated with values like <code>866558,</code> <code>1196184,</code> <code>1081492,</code> <code>1898294.</code></p> </td>
  </tr>
  <tr>
   <td>Single SKU, found in the URL path.</td>
   <td><p>The recorded Quickview URLs include the following:</p>
    <ul>
     <li><p><code>https://server/product/6422350843</code></p> </li>
     <li><p><code>https://server/product/1607745002</code></p> </li>
     <li><p><code>https://server/product/0086724882</code></p> </li>
    </ul> <p>The variable part is in the last portion of the path, and it becomes the SKU value of the hotspots/image maps:<strong><code>6422350843</code>, <code>1607745002,</code> </strong><code>0086724882.</code></p> </td>
  </tr>
  <tr>
   <td>SKU and category ID in the query string.</td>
   <td><p>The recorded Quickview URLs include the following:</p>
    <ul>
     <li><p><code>https://server/quickView/product/?category=1100004&amp;prodId=305466</code></p> </li>
     <li><p><code>https://server/quickView/product/?category=1100004&amp;prodId=310181</code></p> </li>
     <li><p><code>https://server/quickView/product/?category=1740148&amp;prodId=308706</code></p> </li>
    </ul> <p>In this case, there are two varying parts in the URL. The SKU is stored in the <code>prodId</code> parameter and the category ID is stored in the <code>category=</code>parameter.</p> <p>As such, the hotspot/image map definitions are pairs. That is, a SKU value and an extra variable called <code>categoryId</code>. The resulting pairs are the following:</p>
    <ul>
     <li><p>SKU is <strong><code>305466</code></strong> and <code>categoryId</code> is <code>1100004</code>.</p> </li>
     <li><p>SKU is <strong><code>310181</code></strong> and <code>categoryId</code> is <strong><code>1100004</code></strong>.</p> </li>
     <li><p>SKU is <strong><code>308706</code></strong> and <code>categoryId</code> is <strong><code>1740148</code></strong>.</p> </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## Upload Image Banners {#uploading-image-banners}

If you have already uploaded the images that you want to use, advance to the next step, [Create Carousel Sets](#creating-carousel-sets). Note the images used in the carousel must be uploaded after Dynamic Media has been enabled.

To upload image banners, see [Upload assets](/help/assets/manage-assets.md).

## Create Carousel Sets {#creating-carousel-sets}

>[!NOTE]
>
>Non-administrative users must be added to the **[!UICONTROL `dam-users`]** group to be able to create or edit carousel banners. If you are having trouble creating or editing, see your system administrator who can add you to the **[!UICONTROL `dam-users`]** group.

**To create Carousel Sets:**

1. In Assets, navigate to the folder where you want to create the Carousel Set and go to **[!UICONTROL Create]** > **[!UICONTROL Carousel Set]**.
1. On the carousel banner editor page, select **[!UICONTROL Tap to open Asset Selector]** to select the image for your first slide.

   On the carousel banner editor page, do either one of the following:

    * Near the upper-left corner of the page, select **[!UICONTROL Add Slide]** icon.

    * Near the middle of the page, select **[!UICONTROL Tap to open Asset Selector]**.

   Select to select assets that you want to include in your Carousel Set. Selected assets have a checkmark icon over them. When you are finished, near the upper-right corner of the page, select **[!UICONTROL Select]**.

   With the Asset Selector, you can search for assets by typing in a keyword and tapping or clicking **[!UICONTROL Return]**. You can also apply filters to refine your search results. You can filter by path, collection, file type, and tag. Select the filter and then select the **[!UICONTROL Filter]** icon on the toolbar. Change the view by tapping the View icon and selecting **[!UICONTROL Column View]**, **[!UICONTROL Card View]**, or **[!UICONTROL List View]**.

   See [Work with Selectors](/help/assets/working-with-selectors.md) for more information.

1. Continue to add slides until you have added all the images that you want to rotate through in the Carousel Set.
1. (Optional) Do any of the following:

    * If necessary, drag slide's to reorder images intheset list.
    * To delete an image, select the image, then select **[!UICONTROL Delete Slide]** on the toolbar.

    * To apply a preset, near the upper-right corner of the page, select the preset drop-down list, then select a preset to apply to the set at once.

   To delete a slide, select the slide and then on the toolbar, select **[!UICONTROL Delete Slide]**. To move a slide, select the reorder icon and hold and move to the desired location.

1. After you have added the images in slides, you can add a hotspot, image map, or both to your image. See [Add hotspots or image maps to an Image Banner](#adding-hotspots-or-image-maps-to-an-image-banner).
1. You can change the visual design and behavior of carousel sets. Select the **[!UICONTROL Behavior]** and **[!UICONTROL Appearance]** tabs and adjust how your carousel banner appears or how specific components behave. See [Manage viewer presets](/help/assets/viewer-presets.md) for more information on how to use the viewer editor.

   >[!NOTE]
   >
   >For carousel banners, the following are things you can adjust:
   >
   >    * Duration that an image displays. By default, each image displays for 9 seconds.
   >    * Animation. By default, each slide transition is a fade. You can change that to a slide transition.
   >    * Style of the buttons. Users can rotate through the banners by tapping each dot or number. You can change where the set indicator buttons appear (and if they are numeric or a dotted style) and how large they are.
   >    * Change the highlight style of an image map or the icon used for hotspots.
   >    * Before you edit a viewer preset, choose the style that you want the preset based on. If you do not choose a style, when you start to edit the viewer preset, you lose all of your changes if you decide change to a different preset.
   >
   >See [Special considerations for carousel banners](/help/assets/managing-viewer-presets.md#special-considerations-for-creating-a-carousel-banner-viewer-preset) for detailed instructions and more information on the viewer editor.

   You can also preview how the carousel banner appears. See [(Optional) Preview carousel banners](#optional-previewing-carousel-banners).

1. Select **[!UICONTROL Save]** when finished.

## Adding hotspots or image maps to an Image Banner {#adding-hotspots-or-image-maps-to-an-image-banner}

You can add hotspots or image maps to a banner using the Carousel Set editor.

When you add hotspots or image maps, you can define them as a Quickview pop-up display, as a hyperlink, or an Experience Fragment.

See [Experience Fragment](/help/sites-authoring/experience-fragments.md).

>[!NOTE]
>
>The social media sharing tools in carousel banner are not supported when you embed the viewer in an Experience Fragment.
>
>To work around this issue, you can use or create viewer presets that do not have social media sharing tools. Such viewer presets let you successfully embed it in Experience Fragments.

As you add hotspots or image maps to an image, remember to save your work. Undo and Redo options, near the upper-right corner of the page, are supported during your current creation/editing session.

When you finish creating your carousel banner, you can optionally use Preview to see a representation of how your carousel banner appears to customers.

See [(Optional) Preview carousel banners](#optional-previewing-carousel-banners).

>[!NOTE]
>
>When you add hotspots to an image in an [Interactive Image](/help/assets/interactive-images.md) or a carousel banner, the hotspot information is stored in the same metadata location. That location is relative to the image's location, regardless of whether it is an Interactive Image or a carousel banner. This functionality means that you can easily reuse the same image &ndash; along with its defined hotspot data &ndash; in either viewer.
>
>Be aware, however, that carousel banners support image maps on images that can also contain hotspots; an Interactive Image does not. Keep this rule in mind if you intend to create an Interactive Image or carousel banner that uses the same image. Consider creating Interactive Images and carousel banners using separate copies of the same image instead.

>[!NOTE]
>
>If you are editing interactive images with hotspots and crop the image, your hotspots are removed.

See also [Add image maps](/help/assets/image-maps.md).

**To add hotspots or image maps to an Image Banner:**

1. From Assets, navigate to the carousel set you want to make interactive.
1. Select the carousel set and select **[!UICONTROL Edit]**. The Carousel Viewer Editor opens.
1. Select the slide that you want to make interactive.
1. Near the upper-left corner of the page, select **[!UICONTROL Hotspot]** or **[!UICONTROL Image Map]**.
1. Do either of the following:

    * For hotspots: On the image, select a location where you want the hotspot to appear.
    * For image maps: On the image, select, then drag from the top left to the bottom right to create the image map area. You can adjust the size of the image map by dragging the corners.

   If necessary, drag the hotspot or the image map to a new location. Add more hotspots or image maps as necessary.

   To delete a hotspot or image map, select the **[!UICONTROL Actions]** tab. Under the **[!UICONTROL Maps & Hotspots]** heading, from the **[!UICONTROL Selected Type]** drop-down menu, select the name of the hotspot or image map you want to remove. Select the **[!UICONTROL Trash]** icon next to the menu, then select **[!UICONTROL Delete]**.

1. In the Name text field, type the name of the hotspot or the image map. This name also appears in the **[!UICONTROL Maps & Hotspot]** drop-down list. Providing a name makes it easy to identify the hotspot or image map if you decide to change it in the future.
1. Do one of the following in the **[!UICONTROL Actions]** tab:

    * Select **[!UICONTROL Quickview]**.

        * If you are an Experience Manager Sites and Ecommerce customer, select the Product Picker icon (magnifying glass) to open the Select Product page. Select the product that you want to use, then select the check mark in the upper-right corner of the page so you can return to the carousel banner editor.
        * If you are not an Experience Manager Sites or Ecommerce customer

            * See [Identify hotspot variables](#identifying-hotspot-and-image-map-variables) if you want to define these variables.
            * Then, manually enter the SKU value. In the SKU Value text field, type the product's SKU (Stock Keeping Unit), which is a unique identifier for each distinct product or service that you offer. The entered SKU value automatically populates the variable portion of the Quickview template so that the system knows to associate the tapped hotspot with a particular SKU's Quickview.
            * (Optional) If there are other variables within the Quickview that you must use to further identify a product, select **[!UICONTROL Add Generic Variable]**. In the text field, specify an extra variable. For example, category=Mens is an added variable.

            * See [Work with Selectors](/help/assets/working-with-selectors.md) for more information.

    * Select **[!UICONTROL Hyperlink]**.

        * If you are an Experience Manager Sites customer, select the Site Selector icon (folder) to navigate to a URL.
          >[!NOTE]
          >
          >The URL-based method of linking is not possible if your interactive content has links with relative URLs, particularly links to Experience Manager Sites pages.

        * If you are a standalone customer, in the HREF text field, specify the full URL path to a linked web page.

   Be sure you specify whether to open the link in a new browser tab (recommended default) or the same tab.

   See [Working with Selectors](/help/assets/working-with-selectors.md) for more information.

    * Select **[!UICONTROL Experience Fragment]**.

        * If you are an Experience Manager Sites customer, select the Search icon (magnifying glass) to open the Experience Fragment page. Select the Experience Fragment you want to use, then select **[!UICONTROL Select]** in the upper-right corner of the page so you can return to the hotspot management page.
          See [Experience Fragments](/help/sites-authoring/experience-fragments.md).

        * Specify the width and height of the Experience Fragment as it appears on the banner.

          >[!NOTE]
          >
          >The social media sharing tools in carousel banner are not supported when you embed the viewer in an Experience Fragment.
          >
          >To work around this issue, create viewer presets that do not have social media sharing tools. Such viewer presets let you successfully embed it in Experience Fragments.

   ![experience_fragment-carouselbanner](assets/experience_fragment-carouselbanner.png)

   You can also preview how the carousel banner appears. See [(Optional) Previewing carousel banners](#optional-previewing-carousel-banners).

1. Select **[!UICONTROL Save]**.
1. Publish the carousel set. Publishing creates the embed code or URL that you can use on your website page. If you are an Experience Manager Sites customer, you can add the carousel set directly to your webpage.

   See [Publishing assets](/help/assets/publishing-dynamicmedia-assets.md).

   See [Adding a carousel set to your website landing page](#adding-a-carousel-banner-to-your-website-page)

## Edit Carousel Sets {#editing-carousel-sets}

>[!NOTE]
>
>Non-administrative users must be added to the **[!UICONTROL `dam-users`]** group to be able to create or edit carousel banners. If you are having trouble creating or editing, see your system administrator who can add you to the **[!UICONTROL dam-users]** group.

You can perform various editing tasks on Carousel Sets such as the following:

* Add slides to a Carousel Set. See also [Work with Selectors](/help/assets/working-with-selectors.md).
* Reorder slides in the Carousel Set.
* Delete assets in the Carousel Set.
* Apply a viewer preset.
* Delete the Carousel Set.
* Add or edit hotspots and image maps. See also [Work with Selectors](/help/assets/working-with-selectors.md).

**To edit Carousel Sets:**

1. Do any one of the following:

    * Hover over a Carousel Set asset, then select **[!UICONTROL Edit]** (pencil icon).
    * Hover over a Carousel Set asset, select **[!UICONTROL Select]** (checkmark icon), then select **[!UICONTROL Edit]** on the toolbar.

    * Select a Carousel Set asset, then in the upper-left corner of the page, select **[!UICONTROL Edit]** (pencil icon).

1. To edit the Carousel Set, do any of the following:

    * To add a slide, select the **[!UICONTROL Add Slide]** icon then navigate to the asset you want to add to that slide and select the checkmark.
    * To reorder slides, drag a slide to a new location (select the reorder icon to move items).
    * To add a hotspot or image map, select the hotspot or image map icons and see [adding hotspots and image maps](#adding-hotspots-or-image-maps-to-an-image-banner).
    * To edit the appearance or behavior of the carousel set, select the **[!UICONTROL Appearance]** tab or **[!UICONTROL Behavior]** tab, then set the options you want.
    * To edit hotspots or image maps, on the appropriate slide, select a hotspot or image map and change as necessary under the **[!UICONTROL Actions]** tab.
    * To delete a slide, select it, then select **[!UICONTROL Delete Slide]** on the toolbar.
    * To apply a preset, near the upper-right corner of the page, select the **[!UICONTROL Preset]** drop-down list, then select a viewer preset.
    * To delete an entire Carousel Set, navigate to the Carousel Set, select it, then select **[!UICONTROL Delete]**.

   >[!NOTE]
   >
   >If you are editing interactive images with hotspots and crop the image, your hotspots are removed.
   >
   >

## (Optional) Preview carousel banners {#optional-previewing-carousel-banners}

You can use Preview to see how your carousel banner appears to customers and to test the carousel banners hotspots and image maps to ensure they are behaving as expected.

When you are satisfied with the carousel banner, you can publish it.
See [Embedding the Video or Image Viewer on a Web Page](/help/assets/embed-code.md).
See [Linking URLs to your web application](/help/assets/linking-urls-to-yourwebapplication.md). The URL-based method of linking is not possible if your interactive content has links with relative URLs, particularly links to Experience Manager Sites pages.
See [Adding Dynamic Media Assets to pages](/help/assets/adding-dynamic-media-assets-to-pages.md).

You can preview carousel banners from the Carousel Editor (preferred method) or from the **[!UICONTROL Viewers]** list.

**To preview carousel banners:**

1. In **[!UICONTROL Assets]**, navigate to an existing carousel banner that you have created and select to open it.
1. Select **[!UICONTROL Edit]**.
1. In the viewer presets list in the right-hand corner of the toolbar, select a viewer to preview the carousel Banner.

   ![experience_fragment-carouselbanner-viewerdropdown](assets/experience_fragment-carouselbanner-viewerdropdown.png)

1. Select **[!UICONTROL Preview]**.
1. Select the hotspots or image maps on the image so you can test their associated actions.

**To preview carousel banners from the Viewers list:**

1. In **[!UICONTROL Assets]**, navigate to an existing carousel banner that you have created and select to open it.
1. Near the upper-left corner of the Preview page, select the Content icon.
1. In the **[!UICONTROL Viewers]** list in the panel on the left side of the page, select the name of the carousel banner viewer preset you want to use.
1. Select the hotspots or image maps on the image so you can test their associated actions.

## Publish carousel banners {#publishing-carousel-banners}

Publish the carousel so you can use it. Publishing a Carousel Set activates the URL and Embed Code. It also publishes the carousel to the Dynamic Media cloud which is integrated with a CDN for scalable and performant delivery.

>[!NOTE]
>
>If you use an existing interactive image with hotspots for your carousel banner, you must publish the interactive image separately after you publish the carousel banner.
>
>Also, if you modify a pre-existing published interactive image that you are using in a carousel banner, you must publish the interactive image before those changes are reflected in the carousel banner.

See [Publish Dynamic Media Assets](/help/assets/publishing-dynamicmedia-assets.md) for info on how to publish carousel banners.

## Add a carousel banner to your website page {#adding-a-carousel-banner-to-your-website-page}

After you have uploaded banner images to create a carousel, added hotspots and/or image maps to the banner, and published the carousel set, you are now ready to add it to your existing website page.

>[!NOTE]
>
>If you are an Experience Manager Sites customer, you can add the carousel banner directly to your page by dragging the Interactive Media component to your page. See [Add Dynamic Media assets to pages](/help/assets/adding-dynamic-media-assets-to-pages.md).

However, if you are a stand-alone Experience Manager assets customer you can manually add the carousel banner to your website landing page as described in this section.

1. Copy the published carousel set's embed code.
   See [Embed the video or Image Viewer on a web page](/help/assets/embed-code.md).

1. Add the embed code that you copied from Experience Manager Assets to your webpage.
   The copied embed code is responsive so it must automatically fit the embedding area of the page.

## Integrate the carousel banner with an existing Quickview {#integrating-the-carousel-banner-with-an-existing-quickview}

>[!NOTE]
>
>This step applies only if you are a standalone Experience Manager Assets customer.

The last step in this process is integrating the carousel banner with an existing Quickview implementation on your website. Every Quickview implementation is unique and a specific approach is needed that involves the assistance of a front-end IT person.

The existing Quickview implementation normally represents a chain of inter-related actions that happen on the web page in the following order:

1. A user triggers an element in the user interface of your website.
1. The front-end code obtains a Quickview URL based on the user interface element that was triggered in step 1.
1. The front-end code sends an Ajax request using the URL obtained in step 2.
1. The backend logic returns the corresponding Quickview data or content back to the front-end code.
1. The front-end code loads the Quickview data or content.
1. Optionally, the front-end code converts the loaded Quickview data into an HTML representation.
1. The front-end code displays a modal dialog box or panel and renders the HTML content on the screen for the end user.

These calls do not represent independent public API calls which can be called by the web page logic from an arbitrary step. Instead, it is a chained call where every next step is hidden in the last phase (callback) of the previous step.

At the same time that the carousel banner is replacing step 1, and partially step 2, when a user taps a hotspot or image map inside the carousel banner, such interaction is handled by the viewer. The viewer returns an event to the web page that contains all the hotspot or image map data previously added.

In such an event handler, the front-end code does the following:

* Listens to an event emitted by the carousel banner.
* Constructs a Quickview URL based on the hotspot or image map data.
* Triggers the process of loading the Quickview from the backend and rendering it on the screen for display.

The embed code returned by Experience Manager Assets already has a ready-to-use event handler in place that is commented out.

So, it is only necessary to uncomment the code and replace the dummy handler body with the code that is specific to the particular web page.

The process of constructing the Quickview URL is opposite of the process used for identifying hotspot and image map variables covered earlier.

See [Identify hotspot and Image Map variables](#identifying-hotspot-and-image-map-variables).

The last step to trigger the Quickview URL and activate the Quickview panel most likely requires the assistance of a front-end IT person from your IT department. They have the knowledge to know best how to accurately trigger the Quickview implementation from the proper step, having a ready-to-use Quickview URL.

## Create custom pop-ups using Quickview {#using-quickviews-to-create-custom-pop-ups}

See [Create custom pop-ups using Quickview](/help/assets/custom-pop-ups.md).
