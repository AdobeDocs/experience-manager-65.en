---
title: Concepts
description: Learn the general Concepts of eCommerce with Adobe Experience Manager.
contentOwner: Guillaume Carlino
exl-id: 290b2af6-257f-42f2-b809-1248227a4795
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# Concepts{#concepts}

The integration framework provides the mechanisms and components for:

* connection to an eCommerce engine
* pulling data into Adobe Experience Manager (AEM)
* displaying that data and collecting the shopper's responses
* returning transaction details
* search over the data from both systems

This means that:

* Shoppers can register and shop without waiting.
* Price changes are seen by shoppers without delay.
* Products can be added as required.

>[!NOTE]
>
>The eCommerce framework can be used with:
>
>* [Adobe Commerce](/help/commerce/cif/integrating/magento.md)
>* [SAP Commerce Cloud](/help/commerce/cif-classic/administering/sap-commerce-cloud.md)
>* [Salesforce Commerce Cloud](https://github.com/adobe/commerce-salesforce)
>

>[!CAUTION]
>
>The [eCommerce integration framework](https://business.adobe.com/products/experience-manager/sites/ecommerce-integrations.html) is an AEM Add-On.
>
>Your Sales representative is able to give full details, according to the appropriate engine.

>[!CAUTION]
>
>The framework provides the basis requirements for your own project.
>
>A certain amount of development work is always needed to adapt the framework to your specifications.

>[!CAUTION]
>
>The standard AEM installation includes the generic AEM (JCR) eCommerce implementation.
>
>This is intended for demonstration purposes, or as the basic foundation for a custom implementation according to your requirements.

To optimize operation, both AEM and the eCommerce engine concentrate on their own area of expertise. Information is transferred between the two in real time; for example:

* AEM can:

    * Request:

        * Product Information from the eCommerce engine.

    * Provide:

        * User views for product information, shopping cart, and checkout.
        * Shopping cart and checkout information to the eCommerce engine.
        * Search Engine Optimization (SEO).
        * Community functionality.
        * Unstructured marketing interactions.

* eCommerce engine can:

    * Provide:

        * Product information from the database.
        * Product variant management.
        * Order Management.
        * ERP (Enterprise Resource Planning).
        * Search within the product information.

    * Process:

        * The shopping cart.
        * The checkout.
        * Order fulfillment.

>[!NOTE]
>
>The exact details depend on the eCommerce engine and the project implementation.

Several out-of-the-box AEM components are provided to use the integration layer. Currently, these include:

* Product information
* Shopping cart
* Check-out
* My Account

Various search options are also available.

## Architecture {#architecture}

The integration framework provides the API, a range of components to illustrate functionality and several extensions to provide examples of connection methods:

![chlimage_1-4](/help/sites-administering/assets/chlimage_1-4.png)

The framework gives you access to functionality such as:

![chlimage_1-5](/help/sites-administering/assets/chlimage_1-5.png)

### Implementations {#implementations}

AEM eCommerce is implemented with an eCommerce engine:

* The eCommerce integration framework has been built to let you easily integrate an eCommerce engine with AEM. The purpose built eCommerce engine controls product data, shopping carts, checkout and order fulfillment, while AEM controls the data display and marketing campaigns.


>[!NOTE]
>
>The standard AEM installation includes the generic AEM (JCR) eCommerce implementation.
>
>This is intended for demonstration purposes, or as the basic foundation for a custom implementation according to your requirements.
>
>AEM eCommerce implemented within AEM using generic development based on JCR is:
>
>* A standalone, AEM-native eCommerce example to illustrate use of the API. This can be used to control product data, shopping carts and checkout with the existing data display and marketing campaigns. In this case, the product database is stored in the repository native to AEM (Adobe's implementation of [JCR](https://developer.adobe.com/experience-manager/reference-materials/spec/jcr/2.0/index.html)).
>
>  The standard AEM installation contains the basics of the [generic eCommerce implementation](/help/commerce/cif-classic/administering/generic.md).

### Commerce Providers {#commerce-providers}

When importing data from a commerce engine into your AEM eCommerce site, a commerce provider is used to supply the importers with data. One commerce provider can support multiple importers.

A commerce provider is AEM code customized to either:

* interface to a back-end commerce engine
* implement a commerce system on top of the JCR repository

Two example commerce providers are currently available for AEM:

* one for geometrixx-hybris
* another for geometrixx-generic (JCR)

Though usually a project needs to develop their own, customized, commerce provider specific to their PIM and product data schema.

>[!NOTE]
>
>The Geometrixx importers use CSV files; there is a description of the schema accepted (with custom properties allowed) in the comments above their implementation.

The [ProductServicesManager](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/commerce/pim/api/ProductServicesManager.html) maintains (through [OSGi](/help/sites-deploying/configuring.md#osgi-configuration-settings)) a list of implementations of the [ProductImporter](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/commerce/pim/api/ProductImporter.html) and [CatalogBlueprintImporter](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/commerce/pim/api/CatalogBlueprintImporter.html) interfaces. These are listed in the **Importer/Commerce Provider** dropdown field of the importer wizard (using the `commerceProvider` property as a name).

When a specific importer/commerce provider is available from the dropdown, any supplemental data it needs must be defined (depending on the importer type) in either:

* `/apps/commerce/gui/content/catalogs/importblueprintswizard/importers`
* `/apps/commerce/gui/content/products/importproductswizard/importers`

The folder under the appropriate `importers` folder must match the importer name; for example:

* `.../importproductswizard/importers/geometrixx/.content.xml`

The format of the source import file is defined by the importer. Or the importer may establish a connection (for example, WebDAV or http) to the commerce engine.

## Roles {#roles}

The integrated system caters for the following roles to maintain the data:

* Product Information Management (PIM) User who maintains:

    * Product information.
    * Taxonomy, categorization, approval.
    * Interacts with digital asset management.
    * Pricing - often this comes from an ERP system and is not explicitly maintained in the commerce system.

* Author / Marketing Manager who maintains:

    * Marketing content for all channels.
    * Promotions.
    * Vouchers.
    * Campaigns.

* Surfer / Shopper who:

    * Views your product information.
    * Places items into the shopping cart.
    * Checks out their orders.
    * Expect order fulfillment.

Though the actual location can depend on your implementation; for example, generic or with an eCommerce engine:

![chlimage_1-6](/help/sites-administering/assets/chlimage_1-6.png)

## Products {#products}

### Product Data versus Marketing Data {#product-data-versus-marketing-data}

#### Structural versus Marketing Categories {#structural-versus-marketing-categories}

If the following two categories can be differentiated, then this lets you make clear URLs with a meaningful structure (trees of `cq:Page` nodes) and therefore, very close to classical AEM content management):

* *Structural *categories

  The category tree defining *what is a product*; for example:

  `/products/mens/shoes/sneakers`

* *Marketing* categories

  All other categories that a *product can belong to*; for example:

  `/special-offers/christmas/shoes`)

### Product Data {#product-data}

To portray and manage your product, you will want to hold a range of information about them.

Product data can be:

* maintained directly in AEM (generic).
* maintained in the eCommerce engine and made available in AEM.

  Depending on the data type it is [synchronized](#catalog-maintenance-data-synchronization) as necessary, or accessed directly; for example, highly volatile and critical data such as product prices are retrieved from the ecommerce engine on every page request to ensure they are always up-to-date.

In either case, when the product data has been entered/imported into AEM it can be seen from the **Products** console. Here the card and list views of a product show information such as:

* the image
* the SKU code
* when last modified

![chlimage_1-7](/help/sites-administering/assets/chlimage_1-7.png)

### Product Variants {#product-variants}

For appropriate products, information about variants can also be held. For example, for items of clothing the different colors available are held as variants:

![ecommerceproductvariants](/help/sites-administering/assets/ecommerceproductvariants.png)

### Product Attributes {#product-attributes}

The individual attributes held about each product may depend on the eCommerce engine being used and your AEM implementation. These are available (as appropriate) when viewing product pages and/or editing product information and can include:

* **Image**

  An image of the product.

* **Title**

  The product name.

* **Description**

  A textual description of the product.

* **Tags**

  Tags used to group related products.

* **Default Asset Category**

  A default category for assets.

* **ERP Data**

  Enterprise resource planning (ERP) information.

    * **SKU**

      Stock-keeping unit (SKU) information.

    * **Color**
    * **Size**
    * **Price**

      The unit price of the product.

* **Summary**

  A summary of the product features.

* **Features**

  Fuller details of the product features.

### Product Assets {#product-assets}

A selection of assets can be held for individual products. Commonly these include images and videos.

## Catalogs {#catalogs}

A catalog groups product data together for both ease of management and representation to the shopper. Often a catalog is structured according to attributes such as language, geographical area, brand, season, hobby, sport, among many others.

### Catalog Structure {#catalog-structure}

#### Catalogs in Multiple Languages {#catalogs-in-multiple-languages}

AEM supports product content in multiple languages. When requesting data, the integration framework retrieves the language from the current tree (for example, `en_US` for pages under `/content/geometrixx-outdoors/en_US`).

For a multi-lingual store, you can import your catalog for each language tree individually (or copy it with [MSM](/help/sites-administering/msm.md)).

#### Catalogs for Multiple Brands {#catalogs-for-multiple-brands}

As with languages, large multi-national companies must cater for multiple brands.

#### Catalogs by Tags {#catalogs-by-tags}

Tags can also be used to group products together into a catalog. These can be used for more dynamic catalogs such as seasonal offers.

### Catalog Setup (Initial Import) {#catalog-setup-initial-import}

Depending on your implementation, you can import the product data required for your base catalog into AEM from:

* a CSV file (for the generic implementation)
* the eCommerce engine

### Catalog Maintenance (Data Synchronization) {#catalog-maintenance-data-synchronization}

Further changes to the product data are inevitable:

* for the generic implementation, these can be managed with the [product editor](/help/commerce/cif-classic/administering/generic.md#editing-product-information)
* when using an [eCommerce engine the changes must be synchronized](#data-synchronization-with-an-ecommerce-engine-ongoing)

#### Data Synchronization with an eCommerce Engine (Ongoing) {#data-synchronization-with-an-ecommerce-engine-ongoing}

After the initial import, changes to your product data are inevitable.

When using an eCommerce engine, the product data is maintained there and must be available in AEM. This product data must be synchronized when updates are made.

This can depend on the type of data:

* A [periodic synchronization is used together with a data feed of changes](/help/commerce/cif-classic/developing/sap-commerce-cloud.md#product-synchronization-and-publishing).

  In addition to this, you can select specific updates for an express update.

* Highly volatile data, such as price information, is retrieved from the commerce engine for each page request, to ensure that it is always up to date.

### Catalogs - Performance and Scaling {#catalogs-performance-and-scaling}

Importing a large catalog with a high number of products (more than 100,000) from an eCommerce engine (PIM) can impact the system due to the large number of nodes. It can also slow down the authoring instance if the products have associated assets (for example, product images). This is because the post-processing of these assets is CPU and memory intensive.

There are various strategies that you can choose to work around these issues:

* [Bucketing](#bucketing) - to cater for the large number of nodes
* [Offload asset post processing to a dedicated instance](#offload-asset-post-processing-to-a-dedicated-instance)
* [Only import product data](#only-import-product-data)
* [Import Throttling and Batch Saves](#import-throttling-and-batch-saves)
* [Performance Testing](#performance-testing)
* [Performance - Miscellaneous](#performance-miscellaneous)

#### Bucketing {#bucketing}

If a JCR node has many direct child nodes (for example, 1000 and more), buckets (phantom folders) are required to ensure that performance is not affected. These are generated according to an algorithm when importing.

These buckets take the form of phantom folders that are introduced to your catalog structure, but can be configured so they are not apparent in public URLs.

#### Offload asset post processing to a dedicated instance {#offload-asset-post-processing-to-a-dedicated-instance}

This scenario involves setting up two author instances:

1. Master author instance

   Imports product data from PIM, on which post-processing for the asset paths is disabled.

1. Dedicated DAM author instance

   Imports and post-processes product assets from the PIM, then replicates these back to the master author instance for use.

![Architecture diagram](/help/sites-administering/assets/chlimage_1-8.png)

#### Only import product data {#only-import-product-data}

For cases when products do not contain assets (images) to be imported, you can import the product data without being affected by asset post-processing.

![Architecture diagram](/help/sites-administering/assets/chlimage_1-9.png)

#### Performance Testing {#performance-testing}

Performance testing must be considered on AEM eCommerce implementations:

* Author environment:

  Background (for example, import) activity can occur at the same time as normal user activity (for example, page editing) and even if front-end performance is (in general) given a higher priority, bad performance seen by online authors can lead to frustration capable of blocking a go-live decision.

* Publication environment:

  Replication is a critical process to ensure that the content is published quickly and reliably. This can be impacted by how the author groups the content to be published.

* Front-end:

  The mixture of front-end and cache invalidations can potentially lead to performance surprises. Testing helps avoid these.

Note that this performance testing requires knowledge and analysis of your target:

* Content volumes

    * Assets
    * Localized, I18ned products and SKUs

* User activity:

    * Bulk edition
    * Bulk publication
    * Intense search requests

* Background processes

    * Imports
    * Synchronization updates (for example, pricing)

* Maintenance requirements (backup, Tar PM optimization, datastore garbage collection, and so on)

#### Performance - Miscellaneous {#performance-miscellaneous}

For all implementations, the following points can be kept in mind:

* As product, stock-keeping units and categories can be numerous, try to use the least number of nodes possible to model the content.

  The more nodes that you have, the more flexible your content is (for example, parsys). However, everything is a trade-off and do you need individual flexibility (by default) when manipulating (for example) 30K products?

* Avoid duplication as much as you can (see localization), or when you do, think about how many nodes your duplication leads to.
* Try to tag your content as much as you can to prepare the query optimization.

  For example:

   `/content/products/france/fr/shoe/reebok/pump/46 SKU`

  should have one tag per content level (that is, country, language, category, brand, product). Searching for

   `//element(*,my:Sku)[@country='france' and @language='fr'`

  and

  `@category='shoe' and @brand='reebok' and @product='pump']`

  will be drastically quicker than searching for

  `/jcr:root/content/france/fr/shoe/reebok/pump/element(*,my:Sku)`

* In your technical stack, plan factorized content access model and services. This is a general best practice, but is even more crucial here, as you can, in optimization phases, add application caches for data that is read often (and that you do not want to fill the bundle cache with).

  For example, attributes management is frequently a good candidate for caching as it concerns data that is updated through products import.
* Consider use of [proxy pages](#proxy-pages).

### Catalog Section Pages {#catalog-section-pages}

Catalog sections provide you with, for example:

* an introduction (image and/or text) to the category; this can also be used for banners and teasers to promote special offers
* links to the individual products in that category
* links to the other categories

![ecommerce_categoryrunning](/help/sites-administering/assets/ecommerce_categoryrunning.png)

### Product Pages {#product-pages}

Product pages provide comprehensive information about individual products. Dynamic updates from are also reflected; for example, price changes that are registered on the eCommerce engine.

Product pages are AEM pages that use the **Product** component; for example, within the **Commerce Product** template:

![ecommerce_nairobirunnersgreen](/help/sites-administering/assets/ecommerce_nairobirunnersgreen.png)

The Product component provides:

* General product information; including text and images.
* Pricing; this is retrieved from the eCommerce engine every time the page is shown/refreshed.
* Product variant information; for example, color and size.

This information allows the shopper to select the following when adding an item to their basket:

* Color and size variants
* Quantity

#### Product Landing Pages {#product-landing-pages}

These are AEM pages that provide primarily static information; for example, an introduction and overview with links to the underlying product pages.

### Product Component {#product-component}

The **Product** component can be added to any page with a parent page that delivers the required metadata (that is, the paths to `cartPage` and `cartObject`). In the demonstration site, Geometrixx Outdoors, this is supplied by `UserInfo.jsp`.

The **Product** component can also be customized according to your individual requirements.

### Proxy Pages {#proxy-pages}

Proxy pages are used to simplify the structure of the repository and optimize storage for large catalogs.

Creating a catalog uses ten nodes per product as it provides individual components for each product that you can update and customize within AEM. This large number of nodes can become an issue if your catalog contains hundreds or even thousands of products. To avert any issues, you can create your catalog using proxy pages.

Proxy pages use a two-node structure ( `cq:Page` and `jcr:content`) that does not contain any of the actual product content. The content is generated, at request time, by referencing the product data and the template page.

However, there is a trade-off. You will not be able to customize your product information within AEM, a standard template (defined for your site) is used.

>[!NOTE]
>
>You will not experience any problems if you import a large catalog without proxy pages.
>
>You can convert from one methodology to the other at any time. You can also convert a subsection of your catalog.

## Promotions and Vouchers {#promotions-and-vouchers}

### Vouchers {#vouchers}

Vouchers are a tried and tested method of offering discounts to either attract shoppers into making a purchase and/or rewarding customer's loyalty.

* Vouchers supply:

    * A voucher code (to be typed into the cart by the shopper).
    * A voucher label (to be displayed after the shopper has entered it into the cart).
    * A promotion path (which defines the action that the voucher applies).

* External commerce engines can also supply vouchers.

In AEM:

* A voucher is a page-based component that is created / edited with the Websites console.
* The **Voucher** component provides:

    * A renderer for voucher administration; this shows any vouchers currently in the cart.
    * The edit dialogs (form) for administrating (adding/removing) the vouchers.
    * The actions required for adding/removing vouchers to/from the cart.

* Vouchers do not have their own on and off date/times, but use those of their parent campaigns.

>[!NOTE]
>
>AEM uses the term **Voucher**, this is synonymous with the term **Coupon**.

### Promotions {#promotions}

Promotions, together with vouchers, let you realize scenarios such as:

* A company provides custom prices for employees, which is a handcrafted list of users.
* Long-term customers receive discounts on all orders.
* A sale price offered over a well-defined time period.
* A customer receives a voucher when their previous order exceeded a specific amount.
* A customer who buys *product-X* is offered a discount on *product-Y* (pair products).

Promotions are not maintained by product information managers, but by marketing managers:

* A Promotion is a page-based component that is created / edited with the Websites console. ``
* Promotions supply:

    * A priority
    * A promotion handler path

* You can connect promotions to a campaign to define their on/off date/times.
* You can connect promotions to an experience to define their segments.
* Promotions not connected to an experience will not fire on its own, but can still be fired by a Voucher.
* The Promotion component contains:

    * renderers and dialogs for promotion administration
    * subcomponents for rendering and editing configuration parameters specific to the promotion handlers

In AEM the promotions are also integrated into the [Campaign Management](/help/sites-authoring/personalization.md):

* a [campaign](/help/sites-authoring/personalization.md) specifies the on/off times
* [experiences](/help/sites-authoring/personalization.md) *within* the campaign are used to group assets (teaser pages, promotions, and so on) according to the audience segment they correspond to

A promotion can be held either in an experience or directly in the campaign:

* If a promotion is held in an experience, then it can be automatically applied to an audience segment.

  For example, in the geometrixx-outdoors sample site, the promotion:

  `/content/campaigns/geometrixx-outdoors/big-spender/ordervalueover100/free-shipping`

  is in an experience, and so fires automatically whenever the segment ( `ordervalueover100`) resolves.

* If a promotion does not appear within an experience (only in the campaign), then it cannot be automatically applied to an audience. However, it can still be fired if the shopper enters a voucher into their cart and that voucher references the promotion.

  For example, the promotion:

  `/content/campaigns/geometrixx-outdoors/article/10-bucks-off`

  is outside an experience and so never fires automatically (that is: based on segmentation). It is, however, referenced by the vouchers which can be found in several of the experiences within the article campaign. Entering those voucher codes into the cart result in the promotion firing.

>[!NOTE]
>
>[hybris promotions](https://www.hybris.com/modules/promotion) and [hybris vouchers](https://www.hybris.com/en/modules/voucher) cover everything that influences the shopping cart and is related to pricing. Promotion-specific marketing content (such as banners, and so on.) is not part of the hybris promotion.

## Personalization {#personalization}

### Customer Registration and Accounts {#customer-registration-and-accounts}

When a shopper registers, the account details must be synchronized between AEM and the eCommerce engine. Sensitive data is held independently, but profiles are shared:

![chlimage_1-10](/help/sites-administering/assets/chlimage_1-10.png)

The exact mechanism can depend on the scenario:

1. The user accounts exist in both systems:

    1. No action required.

1. The user account exists only in AEM:

    1. User is created in the eCommerce engine with same account ID and a random password which will be stored in AEM.
    1. The random password is necessary, as AEM tries to log into the eCommerce engine on the first call (for example, when a product page is requested and the eCommerce engine is referenced for the price). Because this happens after the AEM login, the password is not available.

1. The user account only exists in the eCommerce engine:

    1. The account is created in AEM with same account ID and password.

When using an eCommerce engine, AEM only stores the account ID and password (optionally a user group). All other information is stored in the eCommerce engine.

>[!NOTE]
>
>When using an eCommerce engine, you must ensure that accounts created for users who log into an AEM instance are replicated (for example, by way of workflows) to any other AEM instances that communicate with that engine.
>
>Otherwise, these other AEM instances will also try to create accounts for the same users in the engine. These actions fail with a `DuplicateUidException` coming from the engine.

### Customer Sign-Up {#customer-sign-up}

Often sign-up is required for the shopper to have access to the shopping cart. This requires registration (Create Account) so that a customer-specific account can be created.

![chlimage_1-11](/help/sites-administering/assets/chlimage_1-11.png)

>[!NOTE]
>
>An anonymous shopping cart and checkout is also supported.

### Customer Sign-In {#customer-sign-in}

After sign-up the shopper can log in with their account so that their actions can be tracked and their orders fulfilled.

![chlimage_1-12](/help/sites-administering/assets/chlimage_1-12.png)

### Single Sign-on {#single-sign-on}

Single Sign-on (SSO) is provided, so that authors are known in both AEM and the eCommerce system without having to log in twice.

### myAccount {#myaccount}

Transaction data from the eCommerce engine is combined with personal information about the shopper. AEM uses some of this data as profile data. A form's action in AEM writes information back to the eCommerce engine.

There is a page which lets you easily manage your account information. You can access it by clicking **My Account** at the top of a Geometrixx page, or by navigating to `/content/geometrixx-outdoors/en/user/account.html`.

![chlimage_1-13](/help/sites-administering/assets/chlimage_1-13.png)

### Address Book {#address-book}

Your site needs to store a selection of addresses; including delivery, billing, and alternative addresses. This can be implemented using forms based on your default address format or you can use the Address Book component provided by AEM.

This Address Book component lets you:

* edit addresses in the book
* select an address from the book for shipping address
* select an address from the book for billing address

You can choose which address you want as default.

The address book component is reachable from the **My Account** page by clicking **Address Book** or by navigating to `/content/geometrixx-outdoors/en/user/account/address-book.html`.

![chlimage_1-14](/help/sites-administering/assets/chlimage_1-14.png)

You can click **Add new address...** to add an address in your address book. It opens a form that you can fill out and then click **Add address**.

>[!NOTE]
>
>You can enter several addresses in your Address Book.

The Address Book is used when you "checkout" your cart:

![chlimage_1-15](/help/sites-administering/assets/chlimage_1-15.png)

Addresses are persisted below `user_home/profile/addresses`.
For example, for Alison Parker, it would be under /home/users/geometrixx/aparker@geometrixx.info/profile/addresses

You can choose which address you want as default, this information is persisted in the shopper's profile rather than with the address. The profile property `address.default` is set with the path of the selected address for value.

### Customer-specific Pricing {#customer-specific-pricing}

The eCommerce engine uses the context (essentially the shopper information) to determine the price it is holding, then provide the correct information back to AEM.

## Shopping Cart and Orders {#shopping-cart-and-orders}

When shopping, the shopper browses the product pages and select items to place them in their shopping cart. When they proceed to checkout, an order can be placed.

### Anonymous Shoppers {#anonymous-shoppers}

An anonymous customer can:

* View products
* Add products to their cart
* Perform checkout to place their order

>[!NOTE]
>
>Depending on the configuration of your instance address information, or customer registration, might be required prior to checkout.

### Registered Shoppers {#registered-shoppers}

A registered customer can:

* Log in to their account
* View products
* Add products to their cart
* Perform checkout to place their order
* View and track previous orders

### Shopping Cart Content Overview {#shopping-cart-content-overview}

The shopping cart provides:

* an overview of items selected
* links to the product pages for the selected items
* the capability to:

    * update the number/quantity of the individual items
    * remove individual items

![ecommerce_shoppingcart](/help/sites-administering/assets/ecommerce_shoppingcart.png)

The shopping cart is saved according to the engine being used:

* AEM generic stores the cart in a cookie.
* Certain eCommerce engines can store the cart in a session.

In either case, items stay in the cart (and can be restored) across log-in/log-out (but only on the same machine/browser). For example:

* browse as `anonymous` and add products to the cart
* sign in as `Allison Parker` - Allison's cart is empty
* add products to Allison's cart
* sign out - the cart shows the products for `anonymous`

* sign in again as `Allison Parker` - Allison's products are restored

>[!NOTE]
>
>An anonymous cart can only be restored on the same machine/browser.

>[!NOTE]
>
>It is not recommended to test restoring the cart contents with the `admin` account, as this can conflict with the `admin` account of the eCommerce engine (for example, hybris).

>[!NOTE]
>
>hybris can be configured to remove pending carts after a defined time period.

Before checkout, price changes are reflected (in both systems) as they occur.

### Order Information {#order-information}

Depending on your implementation information about an order is held either in the eCommerce engine or AEM, this information is rendered by AEM.

Various information is stored, which can include:

* **Order ID**

  The reference number for the order.

* **Placed**

  The date the order was placed.

* **Status**

  The status of the order; for example, Shipped.

* **Currency**

  The currency of the order.

* **Content Items**

  A list of items ordered.

* **Subtotal**

  The total cost of the items ordered.

* **Tax**

  The amount of any taxes due on the order.

* **Shipping**

  Shipping costs.

* **Total**

  The total value of the order; items ordered, taxes, and shipping.

* **Billing Address**

  The address to be which the invoice should be sent.

* **Payment Token**

  The payment method.

* **Payment Status**

  The status of the payment.

* **Shipping Address**

  The address to which the goods should be shipped.

* **Shipping Method**

  The method of shipping; for example, land, sea or air.

* **Tracking Number**

  Any tracking number used by the shipping company.

* **Tracking Link**

  The link used for tracking the order while being shipped.

>[!NOTE]
>
>The fields used in the create order wizard depend on there being a touch-optimized scaffolding defined for the location. In the generic example, this can be found at:
>`/etc/scaffolding/geometrixx-outdoors/order/jcr:content/cq:dialog`

When the order is held within AEM the Order console shows the following for each order:

* the number of items in the cart
* the total value of the order
* when the order was placed
* the status

![chlimage_1-16](/help/sites-administering/assets/chlimage_1-16.png)

### Order Tracking {#order-tracking}

After placing an order, shoppers will often return to:

* Check the status of their order
* Remove products from the order
* Add products to the order

After receiving the order delivery, shoppers may also want to view the history of orders made over a time period.

Order fulfillment and tracking are managed by the eCommerce engine. Information can be displayed by AEM using the Order History component, which shows all relevant details, including the vouchers and promotions applied. For example:

![chlimage_1-17](/help/sites-administering/assets/chlimage_1-17.png)

## Checkout {#checkout}

Checkout is implemented with standard AEM forms. This allows the marketing manager to customize the experience with marketing content.

The eCommerce then manages the checkout process with input from the AEM forms.

### Payment Security {#payment-security}

Payment details, including credit card information, are often managed by the eCommerce engine. AEM forwards such transactional information to the engine (from where it is then forwarded to a payment processing service).

Payment Card Industry (PCI) compliance can be achieved.

### Confirmation of Order {#confirmation-of-order}

The order is confirmed on screen and can be tracked with the [order tracking](#order-tracking).

## Search {#search-features}

![chlimage_1-18](/help/sites-administering/assets/chlimage_1-18.png)

Since AEM uses standard pages for products, you can use the standard search component to create a search page.

If you require a more thorough implementation, you can either:

* Extend the default search component with the functionality that you need.
* Implement the search method in your `CommerceService` and then use the eCommerce search component on your search page.

When using an eCommerce engine, the eCommerce search API can be fully implemented in the eCommerce engine solution, so you can use the eCommerce search component that is provided out-of-the-box. The faceted search lets you search either JCR and/or the engine:
