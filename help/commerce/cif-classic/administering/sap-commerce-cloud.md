---
title: Use AEM with SAP Commerce Cloud

description: Learn how to use AEM with SAP Commerce Cloud.

uuid: cee1a781-fcba-461e-a0a4-c561a1dbcbf3
contentOwner: Guillaume Carlino
topic-tags: e-commerce
content-type: reference
exl-id: c342f789-2ff7-4802-99c7-c3699218fe47
---
# SAP Commerce Cloud{#sap-commerce-cloud}

After installation you can configure your instance:

1. [Configure the Facetted Search for Geometrixx Outdoors](#configure-the-facetted-search-for-geometrixx-outdoors).
1. [Configure the Catalog Version](#configure-the-catalog-version).
1. [Configure the Import Structure](#configure-the-import-structure).
1. [Configure the Product Attributes to Load](#configure-the-product-attributes-to-load).
1. [Importing the Product Data](#importing-the-product-data).
1. [Configure the Catalog Importer](#configure-the-catalog-importer).
1. Use the [importer to import the catalog](#catalog-import) into a specific location in AEM.

## Configure the Facetted Search for Geometrixx Outdoors {#configure-the-facetted-search-for-geometrixx-outdoors}

>[!NOTE]
>
>This is not needed for hybris 5.3.0.1 and later.

1. In your browser, navigate to the **hybris management console** at:

   [http://localhost:9001/hmc/hybris](http://localhost:9001/hmc/hybris)

1. From the sidebar, select **System**, then **Facet search**, then **Facet Search Config**.
1. **Open Editor** for the **Sample Solr Configuration for clothescatalog**.

1. Under **Catalog versions** use **Add Catalog version** to add `outdoors-Staged` and `outdoors-Online` to the list.
1. **Save** the configuration.
1. Open **SOLR Item types** to add **SOLR Sorts** to `ClothesVariantProduct`:

    * relevance ("Relevance", score)
    * name-asc ("Name (ascending)", name)
    * name-desc ("Name (descending)", name)
    * price-asc ("Price (ascending)", priceValue)
    * price-desc ("Price (descending)", priceValue)

   >[!NOTE]
   >
   >Use the context menu (usually right-button click) to select `Create Solr sort`.
   >
   >For Hybris 5.0.0 open the `Indexed Types` tab, double-click on `ClothesVariantProduct`, then the tab `SOLR Sort`.

   ![chlimage_1-36](/help/sites-administering/assets/chlimage_1-36a.png)

1. In the **Indexed Types** tab set the **Composed Type** to:

   `Product - Product`

1. In the **Indexed Types** tab adjust the **Indexer queries** for `full`:

   ```shell
   SELECT {pk} FROM {Product} WHERE {pk} NOT IN ({{SELECT {baseProductpk} FROM {variantproduct}}})
   ```

1. In the **Indexed Types** tab adjust the **Indexer queries** for `incremental`:

   ```shell
   SELECT {pk} FROM {Product} WHERE {pk} NOT IN ({{SELECT {baseProductpk} FROM {variantproduct}}}) AND {modifiedtime} <= ?lastIndexTime
   ```

1. In the **Indexed Types** tab adjust the `category` facet. Double-click on the last entry in the category list to open the **Indexed property** tab:

   >[!NOTE]
   >
   >For hybris 5.2 make sure that the `Facet` attribute in the Properties table is selected according to the screenshot below:

   ![chlimage_1-37](/help/sites-administering/assets/chlimage_1-37a.png) ![chlimage_1-38](/help/sites-administering/assets/chlimage_1-38a.png)

1. Open the **Facet Settings** tab and adjust the field values:

   ![chlimage_1-39](/help/sites-administering/assets/chlimage_1-39a.png)

1. **Save** the changes.
1. Again from **SOLR Item types**, adjust the `price` facet according to the following screenshots. As with `category`, double-click on `price` to open the **Indexed property** tab:

   ![chlimage_1-40](/help/sites-administering/assets/chlimage_1-40a.png)

1. Open the **Facet Settings** tab and adjust the field values:

   ![chlimage_1-41](/help/sites-administering/assets/chlimage_1-41a.png)

1. **Save** the changes.
1. Open **System**, **Facet search**, then **Indexer operation wizard**. Start a cronjob:

    * **Indexer operation**: `full`
    * **Solr configuration**: `Sample Solr Config for Clothes`

## Configure the Catalog Version {#configure-the-catalog-version}

The **Catalog version** ( `hybris.catalog.version`) that is imported can be configured for the OSGi service:

**Day CQ Commerce Hybris Configuration**
( `com.adobe.cq.commerce.hybris.common.DefaultHybrisConfigurationService`)

**Catalog version** is usually set to either `Online` or `Staged` (the default).

>[!NOTE]
>
>When working with AEM there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details. Also see the console for a full list of configurable parameters and their defaults.

The log output provides feedback on the created pages and components and reports potential errors.

## Configure the Import Structure {#configure-the-import-structure}

The following listing shows a sample structure (of assets, pages and components) that is created by default:

```shell
+ /content/dam/path/to/images
  + 12345.jpg (dam:Asset)
    + ...
  + ...
+ /content/site/en
  - cq:commerceProvider = "hybris"
  - cq:hybrisBaseStore = "basestore"
  - cq:hybrisCatalogId = "catalog"
  + category1 (cq:Page)
    + jcr:content (cq:PageContent)
      - jcr:title = "Category 1"
    + category11 (cq:Page)
      + jcr:content (cq:PageContent)
        - jcr:title = "Category 1.1"
      + 12345 (cq:Page)
        + jcr:content (cq:PageContent)
          + par
            + product (nt:unstructured)
              - cq:hybrisProductId = "12345"
              - sling:resourceType = "commerce/components/product"
              + image (nt:unstructured)
                - sling:resourceType = "commerce/components/product/image"
                - fileReference = "/content/dam/path/to/images/12345.jpg"
              + 12345.1-S (nt:unstructured)
                - cq:hybrisProductId = "12345.1-S"
                - sling:resourceType = "commerce/components/product"
                + image (nt:unstructured)
                  - sling:resourceType = "commerce/components/product/image"
                  - fileReference = "/content/dam/path/to/images/12345.1-S.jpg"
              + ...
```

Such a structure is created by the OSGi service `DefaultImportHandler` that implements the `ImportHandler` interface. An import handler is called by the actual importer to create products, product variations, categories, asset, etc.

>[!NOTE]
>
>You can [customize this process by implementing your own import handler](#configure-the-import-structure).

The structure to be generated when importing can be configured for:

``**Day CQ Commerce Hybris Default Import Handler**
`(com.adobe.cq.commerce.hybris.importer.DefaultImportHandler`)

When working with AEM there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details. Also see the console for a full list of configurable parameters and their defaults.

## Configure the Product Attributes to Load {#configure-the-product-attributes-to-load}

The response parser can be configured to define the properties and attributes to be loaded for (variant) products:

1. Configure the OSGi bundle:

   **Day CQ Commerce Hybris Default Response Parser**
   (`com.adobe.cq.commerce.hybris.impl.importer.DefaultResponseParser`)

   Here you can define various options and attributes needed for loading and mapping.

   >[!NOTE]
   >
   >When working with AEM there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details. Also see the console for a full list of configurable parameters and their defaults.

## Importing the Product Data {#importing-the-product-data}

There are a variety of ways to import the product data. The product data can be imported when initially setting up the environment, or after changes have been made in the hybris data:

* [Full Import](#full-import)
* [Incremental Import](#incremental-import)
* [Express Update](#express-update)

Actual product information imported from hybris is held in the repository under:

`/etc/commerce/products`

The following properties indicate the link with hybris:

* `commerceProvider`
* `cq:hybrisCatalogId`
* `cq:hybrisProductID`

>[!NOTE]
>
>The hybris implementation (i.e. `geometrixx-outdoors/en_US`) only stores product IDs and other basic information under `/etc/commerce`.
>
>The hybris server is referenced every time information about a product is requested.

### Full Import {#full-import}

1. If required, delete all existing product data using CRXDE Lite.

    1. Navigate to the sub-tree holding the product data:

       `/etc/commerce/products`

       For example:

       [`http://localhost:4502/crx/de/index.jsp#/etc/commerce/products`](http://localhost:4502/crx/de/index.jsp#/etc/commerce/products)

    1. Delete the node that holds your product data; for example, `outdoors`.
    1. **Save All** to persist the change.

1. Open the hybris importer in AEM:

   `/etc/importers/hybris.html`

   For example:

   [http://localhost:4502/etc/importers/hybris.html](http://localhost:4502/etc/importers/hybris.html)

1. Configure the required parameters; for example:

   ![chlimage_1-42](/help/sites-administering/assets/chlimage_1-42a.png)

1. Click **Import Catalog** to start the import.

   When complete, you can verify the data imported at:

   ```
       /etc/commerce/products/outdoors
   ```

   You can open this in CRXDE Lite; for example:

   `[http://localhost:4502/crx/de/index.jsp#/etc/commerce/products](http://localhost:4502/crx/de/index.jsp#/etc/commerce/products)`

### Incremental Import {#incremental-import}

1. Check the information held in AEM for the relevant product(s), in the appropriate sub-tree under:

   `/etc/commerce/products`

   You can open this in CRXDE Lite; for example:

   [http://localhost:4502/crx/de/index.jsp#/etc/commerce/products](http://localhost:4502/crx/de/index.jsp#/etc/commerce/products)

1. In hybris, update the information held on the revelant product(s).

1. Open the hybris importer in AEM:

   `/etc/importers/hybris.html`

   For example:

   [http://localhost:4502/etc/importers/hybris.html](http://localhost:4502/etc/importers/hybris.html)

1. Select the clickbox **Incremental Import**.
1. Click **Import Catalog** to start the import.

   When complete, you can verify the data updated in AEM under:

   ```
       /etc/commerce/products
   ```


### Express Update {#express-update}

The import process can take a long time, so as an extension to the Product Synchronization you can select specific areas of the catalog for an express update that is triggered manually. This uses the export feed together with the standard attributes configuration.

1. Check the information held in AEM for the relevant product(s), in the appropriate sub-tree under:

   `/etc/commerce/products`

   You can open this in CRXDE Lite; for example:

   [http://localhost:4502/crx/de/index.jsp#/etc/commerce/products](http://localhost:4502/crx/de/index.jsp#/etc/commerce/products)

1. In hybris, update the information held on the revelant product(s).

1. In hybris, add the product(s) to the Express Queue; for example:

   ![chlimage_1-43](/help/sites-administering/assets/chlimage_1-43a.png)

1. Open the hybris importer in AEM:

   `/etc/importers/hybris.html`

   For example:

   [http://localhost:4502/etc/importers/hybris.html](http://localhost:4502/etc/importers/hybris.html)

1. Select the clickbox **Express Update**.
1. Click **Import Catalog** to start the import.

   When complete, you can verify the data updated in AEM under:

   ```
       /etc/commerce/products
   ```

## Configure the Catalog Importer {#configure-the-catalog-importer}

The hybris catalog can be imported into AEM, using the batch importer for hybris catalogs, categories and products.

The parameters used by the importer can be configured for:

**Day CQ Commerce Hybris Catalog Importer**
( `com.adobe.cq.commerce.hybris.impl.importer.DefaultHybrisImporter`)

When working with AEM there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details. Also see the console for a full list of configurable parameters and their defaults.

## Catalog Import {#catalog-import}

The hybris package comes with a catalog importer for setting up the initial page structure.

This is available from:

`http://localhost:4502/etc/importers/hybris.html`

![ecommerceimportconsole](/help/sites-administering/assets/ecommerceimportconsole.png)

The following information has to be provided:

* **Base store**
  The identifier of the base store configured in hybris.

* **Catalog**
  The identifier of the catalog to import.

* **Root path**
  The path where the catalog should be imported into.

## Removing a Product from the Catalog {#removing-a-product-from-the-catalog}

To remove one, or more, products from the catalog:

1. [Configure the for OSGi service](/help/sites-deploying/configuring-osgi.md) **Day CQ Commerce Hybris Catalog Importer**; see also [Configure the Catalog Importer](#configure-the-catalog-importer).

   Activate the following properties:

    * **Enable product removal**
    * **Enable product asset removal**

   >[!NOTE]
   >
   >When working with AEM there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details. Also see the console for a full list of configurable parameters and their defaults.

1. Initialize the importer by performing two incremental updates (see [Catalog Import](#catalog-import)):

    * The first time run result in a set of changed products - indicated in the log list.
    * For the second time no products should be updated.

   >[!NOTE]
   >
   >The first import is to initialize the product information. The second import verifies that everything worked and the is product set is ready.

1. Check the category page that contains the product you want to remove. The product details should be visible.

   For example, the following category shows details of the Cajamara product:

   [http://localhost:4502/editor.html/content/geometrixx-outdoors/en_US/equipment/biking.html](http://localhost:4502/editor.html/content/geometrixx-outdoors/en_US/equipment/biking.html)

1. Remove the product in the hybris console. Use the option **Change approval status** to set the status to `unapproved`. The product will be removed from the live-feed.

   For example:

    * Open the page [http://localhost:9001/productcockpit](http://localhost:9001/productcockpit)
    * Select the catalog `Outdoors Staged`
    * Search for `Cajamara`
    * Select this product and change the approval status to `unapproved`

1. Perform another incremental update (see [Catalog Import](#catalog-import)). The log will list the deleted product.
1. [Rollout](/help/commerce/cif-classic/administering/generic.md#rolling-out-a-catalog) the appropriate catalog. The product and product page will have been removed from within AEM.

   For example:

    * Open:

      [http://localhost:4502/aem/catalogs.html/content/catalogs/geometrixx-outdoors-hybris](http://localhost:4502/aem/catalogs.html/content/catalogs/geometrixx-outdoors-hybris)

    * Rollout the `Hybris Base` catalog
    * Open:

      [http://localhost:4502/editor.html/content/geometrixx-outdoors/en_US/equipment/biking.html](http://localhost:4502/editor.html/content/geometrixx-outdoors/en_US/equipment/biking.html)

    * The `Cajamara` product will have been removed from the `Bike` category

1. To re-instate the product:

    1. In hybris, set the approval status back to **approved**
    1. In AEM:

        1. perform an incremental update
        1. rollout the appropriate catalog again
        1. refresh the appropriate category page

## Add Order History Trait to the Client Context {#add-order-history-trait-to-the-client-context}

To add order history to the [client context](/help/sites-developing/client-context.md):

1. Open the [client context design page](/help/sites-administering/client-context.md), by either:

    * Open a page for editing, then open the client context using **Ctrl-Alt-c** (windows) or **control-option-c** (Mac). Use the pencil icon in the top left corner of the client context to **Open the ClientContext design page**.
    * Navigate directly to [http://localhost:4502/etc/clientcontext/default/content.html](http://localhost:4502/etc/clientcontext/default/content.html)

1. [Add the **Order History** component](/help/sites-administering/client-context.md#adding-a-property-component) to the **Shopping Car**t component of the client context.
1. You can confirm that the client context is showing details of your order history. For example:

    1. Open the [client context](/help/sites-administering/client-context.md).
    1. Add an item to the cart.
    1. Complete the checkout.
    1. Check the client context.
    1. Add another item to the cart.
    1. Navigate to the checkout page:

        * The client context shows a summary of the order history.
        * The message "You're a returning customer" is shown.

   >[!NOTE]
   >
   >The message is realized by:
   >
   >* Navigate to [http://localhost:4502/content/campaigns/geometrixx-outdoors/hybris-returning-customer.html](http://localhost:4502/content/campaigns/geometrixx-outdoors/hybris-returning-customer.html)
   >
   >  The campaign consists of one experience.
   >
   >* Click on the segment ([http://localhost:4502/etc/segmentation/geometrixx-outdoors/returning-customer.html](http://localhost:4502/etc/segmentation/geometrixx-outdoors/returning-customer.html))
   >
   >* The segment is built using the **Order History Property** trait.
