---
title: Administering generic eCommerce
description: The AEM generic solution provides methods of managing the commerce information held within the repository.
contentOwner: Guillaume Carlino
topic-tags: e-commerce
content-type: reference
docset: aem65
exl-id: c29f6213-1df6-45af-91c8-14b255276d82
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# Administering generic eCommerce {#administering-generic-ecommerce}

The Adobe Experience Manager (AEM) generic solution provides methods of managing the commerce information held within the repository (as opposed to using an external ecommerce engine). This includes:

* [Products](/help/commerce/cif-classic/administering/concepts.md#products)
* [Product Variants](/help/commerce/cif-classic/administering/concepts.md#product-variants)
* [Catalogs](/help/commerce/cif-classic/administering/concepts.md#catalogs)
* [Promotions](/help/commerce/cif-classic/administering/concepts.md#promotions)
* [Vouchers](/help/commerce/cif-classic/administering/concepts.md#vouchers)
* [Orders](/help/commerce/cif-classic/administering/concepts.md#shopping-cart-and-orders)
* [Proxy Pages](/help/commerce/cif-classic/administering/concepts.md#proxy-pages)

>[!NOTE]
>
>The standard AEM installation includes the generic AEM (JCR) eCommerce implementation.
>
>This is intended for demonstration purposes, or as the basic foundation for a custom implementation according to your requirements.

## Products and Product Variations {#products-and-product-variations}

>[!NOTE]
>
>The following procedures apply to both Products and Product Variations.

Before creating products, define a [scaffold](/help/sites-authoring/scaffolding.md). This specifies the fields that you must define, the products, and how they are edited.

A scaffold is needed for each distinct product type. The appropriate scaffold is associated with the products by either:

* path
* the product can reference the scaffold

>[!NOTE]
>
>The Geometrixx-Outdoors store has a single product type (and therefore a single scaffold):
>
>`/etc/scaffolding/geometrixx-outdoors`
>
>The Geometrixx-Outdoors product type is active on:
>
>`/etc/commerce/products/geometrixx-outdoors`
>
>You can create a product definition anywhere under that without any additional setup.

### Importing Products {#importing-products}

#### Importing Products - Touch-optimized UI {#importing-products-touch-optimized-ui}

1. Navigate to the **Products** console, via **Commerce**.
1. Using the **Products** console navigate to the required location.
1. Use the **Import Products** icon to open the wizard.

   ![Import Products icon](/help/sites-administering/do-not-localize/chlimage_1-13.png)

1. Specify:

    * **Importer**

      The importer for the specific [commerce provider](/help/commerce/cif-classic/administering/concepts.md#commerce-providers), by default `Geometrixx`.

    * **Source**

      The file that you want to import; you can use the browser to select a file.

    * **Incremental Import**

      Indicate whether this is an incremental import (as opposed to full).

   >[!NOTE]
   >
   >The incremental import (of the sample geometrixx-outdoor importer) operates at the product level.
   >
   >A customized importer can be defined to operate as required.

1. Select **Next** to import the products, a log of the actions taken is shown.

   >[!NOTE]
   >
   >The products are imported to, or relative to, the current location.

   >[!NOTE]
   >
   >Repeatedly using **Next** and **Back** repeatedly imports the product definitions. However, as they have the same SKUs, the information existing in the repository is overwritten.

1. Select **Done** to close the wizard.

#### Importing Products - Classic UI {#importing-products-classic-ui}

1. Using the **Tools** console open the **Commerce** folder.
1. Double-click to open the **Product Importer**:

   ![Product Importer Console](/help/sites-administering/assets/chlimage_1-22.jpeg)

1. Specify:

    * **Store Name**

      Products are imported to:

      `/etc/commerce/products/<*store name*>/`

    * **Commerce Provider**

      The importer for your [commerce provider](/help/commerce/cif-classic/administering/concepts.md#commerce-providers); by default Geometrixx.

    * **Source File**

      The location in the repository of the file you want imported.

    * **Incremental Import**

      Indicate whether this is an incremental import (as opposed to full).

1. Click **Import Products**.

### Creating Product Information {#creating-product-information}

>[!NOTE]
>
>The standard product management is basic, because the Geometrixx-Outdoors product set has been kept basic. The complexity is based on the product [scaffolding](/help/sites-authoring/scaffolding.md), so with your own product scaffolding it is possible to achieve more sophisticated editing.

#### Creating Product Information - Touch-optimized UI {#creating-product-information-touch-optimized-ui}

1. Using the **Products** console (via **Commerce**) navigate to the required location.
1. Use the **Create** icon to select either (depending on the structure and location):

    * **Create Product**
    * **Create Product Variation**

   ![Plus-shaped create icon](/help/sites-administering/do-not-localize/chlimage_1-14.png)

1. The wizard opens. Use the **Basic** and **Product Tabs** to enter the [product attributes](/help/commerce/cif-classic/administering/concepts.md#product-attributes) for the new product or product variant.

   >[!NOTE]
   >
   >**Title** and **SKU** are the minimum required to create a product or variant.

1. Select **Create** to save the information.

>[!NOTE]
>
>Many products are offered in a range of colors and/or sizes. Information about the basic product and the related product variants can both be managed from the **Products** console.
>
>Products and their variants are stored as a tree structure, the product information is at the top, with the variants underneath (this structure is enforced by the UI).

### Editing Product Information {#editing-product-information}

>[!NOTE]
>
>Product images in geometrixx-outdoors are served from:
>
>`/etc/commerce/products/...`
>
>This means that, by default, they are blocked by the [Dispatcher](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/configuring/dispatcher-configuration.html), so configure as required.

#### Editing Product Information - Touch-optimized UI {#editing-product-information-touch-optimized-ui}

1. Using the **Products** console (via **Commerce**) navigate to your product information.
1. Using either:

    * [quick actions](/help/sites-authoring/basic-handling.md#quick-actions)
    * [selection mode](/help/sites-authoring/basic-handling.md#navigating-and-selection-mode)

   Select the **View Product Data** icon:

   ![view product data icon - information icon](/help/sites-administering/do-not-localize/chlimage_1-15.png)

1. The [product attributes](/help/commerce/cif-classic/administering/concepts.md#product-attributes) are shown. Use **Edit** and **Done** to make any changes.

### Showing Product References {#showing-product-references}

#### Showing Product References - Touch-optimized UI {#showing-product-references-touch-optimized-ui}

1. Using the **Products** console (via **Commerce**) navigate to your product information.
1. Open the secondary rail for References with the icon:

   ![double arrow icon](/help/sites-administering/do-not-localize/chlimage_1-16.png)

1. Select your required product - the secondary rail updates, showing you the reference types available:

   ![products console with references open](/help/sites-administering/assets/chlimage_1-88.png)

1. Click on the reference type (for example, Product Pages) to expand the list.
1. Select a specific reference so you can show the options:

    * Navigate to Product Page
    * Edit Product Page

   ![Products Console reference panel](/help/sites-administering/assets/chlimage_1-89.png)

### Search for Products {#search-for-products}

1. Navigate to the **Products** console, via **Commerce**.
1. Open the secondary rail for Search with the icon:

   ![magnifying glass icon](/help/sites-administering/do-not-localize/chlimage_1-17.png)

1. Several facets are available for you to search for products. You can use only one or several facets for a search. The products found appear:

   ![Product data in products console](/help/sites-administering/assets/chlimage_1-90.png)

1. Clicking/tapping a product opens it. You can also publish it or view the product data.

#### Extending Search {#extending-search}

You can modify an existing facet or add new ones, using CRXDE Lite:

1. Navigate to:

   `http://localhost:4502/crx/de/index.jsp#/libs/commerce/gui/content/products/aside/items/search/items/searchpanel/facets`

1. You can edit, for example, the sizes that appear on the product search page. Click the `sizegroup` node.
1. Click `items` node, then click `propertypredicate` node.
1. You can edit the `propertyValues`. For example, you could add XS, or XXL, or remove a size.
1. Click **Save All** and navigate to the products search page. Your changes should appear.

### Multiple Assets {#multiple-assets}

You can add multiple assets in the product component, then specify the asset that you want to have appear on the product page.

>[!NOTE]
>
>Everything related to multiple assets is done with the Touch-optimized UI.

#### Adding Multiple Assets {#adding-multiple-assets}

1. Navigate to the **Products** console, via **Commerce**.
1. Using the **Products** console, navigate to the required product.

   >[!NOTE]
   >
   >You have to be at the product level, not at the variant level.

1. Select the **View Product Data** icon with selection mode or quick actions.
1. Select the Edit icon.
1. Scroll to **Add**.

   ![Adding product data screenshot](/help/sites-administering/assets/chlimage_1-91.png)

1. Select **Add**. A new asset placeholder appears.
1. Selecting **Change** opens a dialog box that lets you choose an asset.
1. Select the asset that you want to add.

   >[!NOTE]
   >
   >The assets you can select are from [Assets](/help/assets/assets.md).

1. Select the Done icon.

Two assets are now stored in your product component. You can configure which one appears on the product page. This works with a category system. First you must add a category to the individual assets:

1. Select **View Product Data**.
1. Type an **Asset Category** under the assets, for example, `cat1` and `cat2`.

   >[!NOTE]
   >
   >You can also use tags for categories.

1. Select the Done icon. You now have to [rollout](#rolling-out-a-catalog) your changes.

Now your assets in the product component have a category. You can configure which category is displayed at three different levels:

* [Product Page](#product-page)
* [Catalog](#catalog)
* [Products Console](#products-console)

>[!NOTE]
>
>If you do not set categories, the first asset is displayed on the product page.

The mechanism to select the image to be displayed is as follows:

1. Verify if a category is set for the Product Page.
1. If not, verify if a category is set for the Catalog.
1. If not, verify if a category is set for the Products Console.

>[!NOTE]
>
>For both the Catalog level and the Products Console level, you have to rollout your changes to apply the modifications and to see the difference on the product page.

#### Product Page {#product-page}

1. Navigate to your product page.
1. **Edit** the product component.
1. Type the **Image Category** that you chose ( `cat1` for example).
1. Select **Done**. The page refreshes and the correct asset should be displayed.

#### Catalog  {#catalog}

1. Navigate to your catalog.
1. Select **View Properties**.
1. Select **Edit**.
1. Select the **Assets** tab.
1. Type the required **Product Asset Category**.
1. Select **Done**.
1. [Rollout](#rolling-out-a-catalog) your changes.

#### Products Console {#products-console}

1. Using the **Products** console, navigate to the required Product.
1. Select **View Product Data**.
1. Select **Edit**.
1. Type a **Default Asset Category**.
1. Select **Done**.
1. [Rollout](#rolling-out-a-catalog) your changes.

### Publishing/Unpublishing Product Information {#publishing-unpublishing-product-information}

#### Publishing/Unpublishing Product Information - Touch-optimized UI {#publishing-unpublishing-product-information-touch-optimized-ui}

>[!NOTE]
>
>Often the product information is published through the pages that reference it. For instance, when publishing page X which references product Y, AEM asks if you also want to publish product Y.
>
>For special cases, AEM also supports publishing direct from the product data.

1. Using the **Products** console (via **Commerce**) navigate to your product information.
1. Using either:

    * [quick actions](/help/sites-authoring/basic-handling.md#quick-actions)
    * [selection mode](/help/sites-authoring/basic-handling.md#navigating-and-selection-mode)

   Select the **Publish** or **Unpublish** icon as required:

   ![world icon](/help/sites-administering/do-not-localize/chlimage_1-18.png) ![world icon with a cross - no sign](/help/sites-administering/do-not-localize/chlimage_1-19.png)

   The product information is published or unpublished, as appropriate.

<!-- Search&Promote is end of life as of September 1, 2022 ### Product Feed {#product-feed} -->

<!-- Search&Promote is end of life as of September 1, 2022 The Search&Promote integration lets you: -->

<!-- Search&Promote is end of life as of September 1, 2022 * use the eCommerce API, independently of the underlying repository structure and commerce platform. -->
<!-- Search&Promote is end of life as of September 1, 2022 * use the Index Connector feature of Search&Promote to provide a product feed in XML format. -->
<!-- Search&Promote is end of life as of September 1, 2022 * use the Remote Control feature of Search&Promote to perform on-demand or scheduled requests of the product feed -->
<!-- Search&Promote is end of life as of September 1, 2022 * feed generation for different Search&Promote accounts, configured as cloud services configurations. -->

<!-- Search&Promote is end of life as of September 1, 2022 For more information, read [Product Feed](/help/sites-administering/product-feed.md). -->

### Event Handler for Product Updates {#event-handler-for-product-updates}

There is an Event Handler which logs an event when a product is added, edited, or deleted and when a product page is added, edited, or deleted. There are the following OSGi events:

* `com/adobe/cq/commerce/pim/PRODUCT_ADDED`
* `com/adobe/cq/commerce/pim/PRODUCT_MODIFIED`
* `com/adobe/cq/commerce/pim/PRODUCT_DELETED`
* `com/adobe/cq/commerce/pim/PRODUCT_PAGE_ADDED`
* `com/adobe/cq/commerce/pim/PRODUCT_PAGE_MODIFIED`
* `com/adobe/cq/commerce/pim/PRODUCT_PAGE_DELETED`

For the `PRODUCT_*` events, the path points to the base product in `/etc/commerce/products`. For the `PRODUCT_PAGE_*` events, the path points to the `cq:Page` node.

You can look at them in the Web Console in OSGI events ( `/system/console/events`), for example:

![OSGI events examples](/help/sites-administering/do-not-localize/chlimage_1-20.png)

>[!NOTE]
>
>Read also [Event handling in AEM](https://blogs.adobe.com/experiencedelivers/experience-management/event_handling_incq/). 

### Image with Add to Cart Links {#image-with-add-to-cart-links}

The Image with Add to Cart Links component lets you quickly add a product to the cart by creating a hotspot linked with a product on an image.

Clicking the hotspot opens a dialog which let you choose the size and quantity of the product.

1. Navigate to the page where you want to add the component.
1. Drag and drop the component in the page.
1. Drag and drop an image in the component from the [assets browser](/help/sites-authoring/author-environment-tools.md#assets-browser).
1. You can either:

    * click the component and then click the Edit icon
    * make a slow double-click

1. Click the fullscreen icon.

   ![fullscreen icon](/help/sites-administering/assets/chlimage_1-92.png)

1. Click the Launch Map icon.

   ![launch map icon](/help/sites-administering/assets/chlimage_1-93.png)

1. Click one of the shape icons.

   ![shape icons](/help/sites-administering/do-not-localize/chlimage_1-21.png)

1. Modify and move the shape as required.
1. Click the shape.
1. Clicking the browse icon opens the [Asset Picker](/help/assets/search-assets.md#assetpicker).

   >[!NOTE]
   >
   >Alternatively, you can type directly the product path which has to be at the product level, not the variant level.

   ![type path](/help/sites-administering/assets/chlimage_1-94.png)

1. Click the confirm icon twice then click exit fullscreen.
1. Click somewhere on the page next to the component. The page should refresh and you should see the following symbol on your image:

   ![plus symbol](/help/sites-administering/do-not-localize/chlimage_1-22.png)

1. Switch to [preview](/help/sites-authoring/editing-content.md#previewingpagestouchoptimizedui) mode.
1. Click the + hotspot. A dialog opens where you can choose the size and quantity of the product you entered in **Path**.

   ![product example: poncho](/help/sites-administering/assets/chlimage_1-95.png)

1. Enter a size and a quantity.
1. Click the Add to cart button. The dialog closes.
1. Navigate to your cart. The product should be here.

#### Configuration Options {#configuration-options}

You can configure how the dialog looks like when you click the hotspot:

1. Click the component and click the configure icon.

   ![configure icon](/help/sites-administering/assets/chlimage_1-96.png)

1. Scroll down. There is an **ADD TO CART** tab.

   ![add to cart tab](/help/sites-administering/assets/chlimage_1-97.png)

1. Click **ADD TO CART**. There are three configuration options that you can use.

   ![configuration options](/help/sites-administering/assets/chlimage_1-98.png)

1. Click the Done icon.

## Catalogs {#catalogs}

### Generating a Catalog {#generating-a-catalog}

#### Generating a Catalog - Touch-optimized UI {#generating-a-catalog-touch-optimized-ui}

>[!NOTE]
>
>The catalog references your Product Data.

To generate a Catalog:

1. Open the Sites console (for example, [http://localhost:4502/sites.html/content](http://localhost:4502/sites.html/content)).
1. Navigate to the location where you want to create the page.
1. To open the option list, use the **Create** icon:

   ![create-icon](/help/sites-administering/do-not-localize/chlimage_1-23.png)

1. From the list, select **Create Catalog**. The Create Catalog wizard opens.

   ![create catalog wizard](/help/sites-administering/assets/chlimage_1-99.png)

1. Navigate to the required Catalog Blueprint.
1. Select the **Select** button and click the required Catalog Blueprint.
1. Select **Next**.

   ![catalog properties wizard](/help/sites-administering/assets/chlimage_1-100.png)

1. Type a **Title** and a **Name**.
1. Select the **Create** button. The catalog is created and a dialog opens.

   ![catalog created dialog](/help/sites-administering/assets/chlimage_1-101.png)

1. Selecting the **Done** button brings you back to the Sites console where you can see your catalog.

   Tapping/clicking **Open Catalog** button opens your catalog (for example, `http://localhost:4502/editor.html/content/test-catalog.html`).

#### Generating a Catalog - Classic UI {#generating-a-catalog-classic-ui}

>[!NOTE]
>
>The catalog references your [Product Data](#products-and-product-variants).

1. Using the **Websites** console, navigate to your **Catalog Blueprint**, then the Base Catalog.

   For example:

   `http://localhost:4502/siteadmin#/content/catalogs/geometrixx-outdoors/base-catalog`

1. Create a page using the **Section Blueprint** template.

   For example, `Swimwear`.

1. Open the new `Swimwear` page, then click **Edit Blueprint**. The **Properties** dialog box opens so you can set up the **Products** selection.

   For example, open the **Tags/Keywords** field to select Activity, then Swimming from the Geometrixx-Outdoors section.

1. Click **OK** so that your properties are saved; example products are shown under the **Product Selection Criteria** on the blueprint page.
1. Click **Rollout Changes...**, select **Rollout page and all sub pages**, then click **Next** then **Rollout**. Once the rollout is completed successfully, the **Status** indicator shows as green.
1. You can now click **Close** and check the new catalog section; for example, on and under:

   `http://localhost:4502/cf#/content/geometrixx-outdoors/en/swimwear.html`

1. Again from the blueprints page click **Edit Blueprint** and in the **Properties** dialog open the **Generated Page** tab. In the Banner list field, select the image that you want to show; for example, `summer.jpg`
1. Click **OK** so your properties are saved; banner information is shown under the **Product Selection Criteria** on the blueprint page.
1. Rollout these new changes.

### Rolling Out a Catalog {#rolling-out-a-catalog}

#### Rolling out a Catalog - Touch-optimized UI {#rolling-out-a-catalog-touch-optimized-ui}

To rollout a catalog:

1. Navigate to the **Catalogs** console, via **Commerce**.
1. Navigate to the catalog that you want to rollout.
1. Using either:

    * [quick actions](/help/sites-authoring/basic-handling.md#quick-actions)
    * [selection mode](/help/sites-authoring/basic-handling.md#navigating-and-selection-mode)

   Select the **Rollout Changes** icon:

   ![rollout](/help/sites-administering/do-not-localize/chlimage_1-24.png)

1. In the wizard, set the rollout as needed and then click **Rollout Changes**.
1. A dialog box opens. Select **Done** when the process is finished.

#### Rolling out a Catalog - Classic UI {#rolling-out-a-catalog-classic-ui}

To rollout a catalog:

1. Navigate to the Catalog that you want to rollout. For example:

   `http://localhost:4502/cf#/content/catalogs/geometrixx-outdoors/base-catalog.html`

1. Click **Rollout Changes...**
1. Set the rollout as needed.
1. Click **Rollout**.

### Blueprint Importer {#blueprint-importer}

#### Blueprint Importer - Touch-optimized UI {#blueprint-importer-touch-optimized-ui}

1. Navigate to the **Catalogs** console, via **Commerce**.
1. Navigate to the location where you want to import the catalog blueprint.
1. Select the **Import Blueprints** icon.

   ![Import blueprints icon](/help/sites-administering/do-not-localize/chlimage_1-13.png)

1. In the wizard, select the Source as required and click **Next**.

   ![blueprint wizard](/help/sites-administering/assets/chlimage_1-102.png)

1. Select **Done** when the import is finished.

#### Blueprint Importer - Classic UI {#blueprint-importer-classic-ui}

1. Using the **Tools** console, navigate to **Commerce**.

   For example:

   `http://localhost:4502/miscadmin#/etc/commerce`

1. Open the **Catalog Bluprint Importer**.
1. Set the import as needed.
1. Click **Import Catalog Blueprints**.

## Promotions {#promotions}

### Creating a Promotion {#creating-a-promotion}

#### Creating a Promotion - Classic UI {#creating-a-promotion-classic-ui}

>[!NOTE]
>
>The following example deals with a promotion held directly in a [campaign](/help/sites-classic-ui-authoring/classic-personalization-campaigns.md), this is used for vouchers.
>
>A promotion can also be in an [experience](/help/sites-authoring/personalization.md) within a campaign.
>
>For more information, see [Promotions and Vouchers](#promotions-and-vouchers).

1. Open the **Websites** console of your author instance.
1. In the left-hand pane, select your required **Campaign**.
1. Click **New**, select the **Promotion** template, then specify a **Title** (and **Name** if necessary) for your new voucher.
1. Click **Create**. The new promotion page is shown in the right-hand pane.

1. Edit the **Properties** by either:

    * opening the page, then clicking the Edit button to open the Properties dialog
    * selecting the page in the Websites console, then using the context menu (usually the right mouse button) to select **Properties...** and open the properties dialog

   Specify the **Promotion Type**, **Discount Type**, **Discount Value** and any other fields as required.

1. Click **OK** to save.

1. You can now activate your promotion, so that shoppers see it on the publish instance.

## Vouchers {#vouchers}

### Creating a Voucher {#creating-a-voucher}

#### Creating a Voucher - Classic UI {#creating-a-voucher-classic-ui}

1. Open the **Websites** console of your author instance.
1. In the left-hand pane, select your required **Campaign**.
1. Click **New**, select the **Voucher** template, then specify a **Title** (and **Name** if necessary) for your new voucher.
1. Click **Create**. The new voucher page is shown in the right-hand pane.

1. Open your new voucher page with a double-click, then click **Edit** and configure the information as required.
1. Click **OK** to save.

1. You can now activate your voucher, so that shoppers can use it in their carts on the publish instance.

### Removing Vouchers {#removing-vouchers}

#### Removing Vouchers - Classic UI {#removing-vouchers-classic-ui}

To make a voucher unavailable to customers, you can either:

* Deactivate the voucher - it remains available on the author environment so you can reactivate it later.
* Delete it completely.

Both actions can be done from the **Websites** console.

### Modifying Vouchers {#modifying-vouchers}

#### Modifying Vouchers - Classic UI {#modifying-vouchers-classic-ui}

To change the properties of a voucher or promotion, you can double-click it on the **Websites** console and click **Edit**. After saving it, you should activate it so that the changes get pushed to the publish instances.

### Adding Vouchers to a Cart {#adding-vouchers-to-a-cart}

To allow users to add vouchers to their carts, you can use the built-in **Vouchers** component (Commerce category). Add this to the same page as where the cart is displayed (but this is not mandatory). The vouchers component is merely a form in which the user can enter a voucher code, it is the shopping cart component that actually shows the list of applied vouchers and their discount.

In the demo site (Geometrixx Outdoors - English) you can see the voucher form on the cart page, under the actual shopping cart.

## Orders {#orders}

>[!NOTE]
>
>It should be remembered that out-of-the-box AEM does not have actions required for standard functionality related to orders, such as returning merchandise, updating order status, doing fulfillment, generating packing slips. It is primarily intended as a technology preview.
>
>The generic Order Management in AEM has been kept basic; the fields available in the wizard depend on the scaffold:
>`/etc/scaffolding/geometrixx-outdoors/order/jcr:content/cq:dialog`
>
>If you create a customized scaffold, you can store more order information.

>[!NOTE]
>
>The orders console exposes the vendor order information, which is never published.
>
>The customer order information is held in their home directories and is exposed by the Order History for their Account. This information is published along with the rest of their home directory.

### Creating Order Information {#creating-order-information}

#### Creating Order Information - Touch-optimized UI {#creating-order-information-touch-optimized-ui}

1. Using the **Orders** console navigate to the required location.
1. Use the **Create** icon to select **Create Order**.

   ![Plus-shaped create icon](/help/sites-administering/do-not-localize/chlimage_1-14.png)

1. The wizard opens. Use the **Basic**, **Content**, **Payment**, and **Fulfillment** tabs to enter the [information about the new order](/help/commerce/cif-classic/administering/concepts.md#order-information).

1. Select **Create** to save the information.

### Editing Order Information {#editing-order-information}

#### Editing Order Information - Touch-optimized UI {#editing-order-information-touch-optimized-ui}

1. Using the **Orders** console navigate to the order.
1. Using either:

    * [quick actions](/help/sites-authoring/basic-handling.md#quick-actions)
    * [selection mode](/help/sites-authoring/basic-handling.md#navigating-and-selection-mode)

   Select the **View Order Data** icon:

   ![information icon](/help/sites-administering/do-not-localize/chlimage_1-15.png)

1. The [order information](/help/commerce/cif-classic/administering/concepts.md#order-information) is shown. Use **Edit** and **Done** to make any changes.

