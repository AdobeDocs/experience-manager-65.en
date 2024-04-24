---
title: Developing with SAP Commerce Cloud
description: The SAP Commerce Cloud integration framework includes an integration layer with an API.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: platform
exl-id: b3de1a4a-f334-44bd-addc-463433204c99
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# Developing with SAP Commerce Cloud {#developing-with-sap-commerce-cloud}

>[!NOTE]
>
>The eCommerce framework can be used with any eCommerce solution. Certain specifics and examples dealt with here see the [hybris](https://www.sap.com/products/crm.html) solution.

The integration framework includes an integration layer with an API. This lets you:

* plug in an eCommerce system and pull product data into Adobe Experience Manager (AEM)

* build AEM components for commerce capabilities independent of the specific eCommerce engine

![chlimage_1-11](/help/sites-developing/assets/chlimage_1-11a.png)

>[!NOTE]
>
>[API documentation](/help/commerce/cif-classic/developing/ecommerce.md#api-documentation) is also available.

Several out-of-the-box AEM components are provided to use the integration layer. Currently these are:

* a product display component
* a shopping cart
* check-out

For search, an integration hook is provided that lets you use the AEM search, the search of the eCommerce system, a third-party search, or a combination thereof.

## eCommerce Engine Selection {#ecommerce-engine-selection}

The eCommerce framework can be used with any eCommerce solution, the engine being used must be identifiable by AEM:

* eCommerce Engines are OSGi services supporting the `CommerceService` interface

  * Engines can be distinguished by a `commerceProvider` service property

* AEM supports `Resource.adaptTo()` for `CommerceService` and `Product`

  * The `adaptTo` implementation looks for a `cq:commerceProvider` property in the resource's hierarchy:

    * If found, the value is used to filter the commerce service lookup.

    * If not found, the highest-ranked commerce service is used.

  * A `cq:Commerce` mixin is used so the `cq:commerceProvider` can be added to strongly typed resources.

* The `cq:commerceProvider` property is also used to reference the appropriate commerce factory definition.

  * For example, a `cq:commerceProvider` property with the value `hybris` correlates to the OSGi configuration for **Day CQ Commerce Factory for Hybris** (com.adobe.cq.commerce.hybris.impl.HybrisServiceFactory) - where the parameter `commerceProvider` also has the value `hybris`.

  * Here further properties, such as **Catalog version** can be configured (when appropriate and available).

See the following examples below:

| `cq:commerceProvider = geometrixx` | in a standard AEM installation a specific implementation is required. For example, the Geometrixx example, which includes minimal extensions to the generic API |
|--- |--- |
| `cq:commerceProvider = hybris` | hybris implementation |

### Example {#example}

```shell
/content/store
+ cq:commerceProvider = hybris
  + mens
    + polo-shirt-1
    + polo-shirt-2
    + employee
+ cq:commerceProvider = jcr
  + adobe-logo-shirt
    + cq:commerceType = product
    + price = 12.50
  + adobe-logo-shirt_S
    + cq:commerceType = variant
    + size = S
  + adobe-logo-shirt_XL
    + cq:commerceType = variant
    + size = XL
    + price = 14.50
```

>[!NOTE]
>
>Using CRXDE Lite, you can see how this is handled in the product component for the hybris implementation:
>
>`/apps/geometrixx-outdoors/components/hybris/product/product.jsp`

### Developing for hybris 4 {#developing-for-hybris}

The hybris extension of the eCommerce Integration Framework has been updated to support Hybris 5, while maintaining backward compatibility with Hybris 4.

The default settings in the code are tuned for Hybris 5.

To develop for Hybris 4, the following is required:

* When invoking maven, add the following command-line argument to the command

  `-P hybris4`

  It downloads the pre-configured Hybris 4 distribution and embeds it in the bundle `cq-commerce-hybris-server`.

* In the OSGi configuration manager:

  * Disable Hybris 5 support for the Default Response Parser service.

  * Ensure that the Hybris Basic Authentication Handler service has a lower service ranking than the Hybris OAuth Handler service.

### Session Handling {#session-handling}

hybris uses a user session to store information such as the customer's shopping cart. The session id is returned from hybris in a `JSESSIONID` cookie that must be sent on subsequent requests to hybris. To avoid storing the session id in the repository, it is encoded in another cookie that is stored in the shopper's browser. The following steps are performed:

* On the first request, no cookie is set on the shopper's request; so a request is sent to the hybris instance to create a session.

* The session cookies are extracted from the response, encoded in a new cookie (for example, `hybris-session-rest`) and set on the response to the shopper. The encoding in a new cookie is required, because the original cookie is only valid for a certain path and would otherwise not be sent back from the browser in subsequent requests. The path information must be added to the cookie's value.

* On subsequent requests, the cookies are decoded from the `hybris-session-<*xxx*>` cookies and set on the HTTP client that is used to request data from hybris.

>[!NOTE]
>
>A new, anonymous session is created when the original session is no longer valid.

#### CommerceSession {#commercesession}

* This session "owns" the **shopping cart**

  * performs add/remove/etc
  
  * performs the various calculations on the cart;

      `commerceSession.getProductPrice(Product product)`

* Owns the *storage location* for the **order** data

  `CommerceSession.getUserContext()`

* Owns the **payment** processing connection

* Owns the **fulfillment** connection

### Product Synchronization and Publishing {#product-synchronization-and-publishing}

Product data that is maintained in hybris must be available in AEM. The following mechanism has been implemented:

* An initial load of IDs is provided by hybris as a feed. There can be updates to this feed.
* hybris supplies update information by way of a feed (which AEM polls).
* When AEM is using product data, it sends requests back to hybris for the current data (conditional get request using last modified date).
* On Hybris, it is possible to specify feed contents in a declarative way.
* Mapping the feed structure to the AEM content model happens in the feed adapter on the AEM side.

![chlimage_1-12](/help/sites-developing/assets/chlimage_1-12a.png)

* The importer (b) is used for the initial setup of the page tree structure in AEM for catalogs.
* Catalog changes in hybris are indicated to AEM via a feed, these then propagate to AEM (b)

  * Product added/deleted/changed regarding catalog version.

  * Product approved.

* The hybris extension provides a polling importer ("hybris" scheme"), which can be configured to import changes into AEM at a specified interval (for example, every 24 hours where the interval is specified in seconds):

  ```JavaScript
      http://localhost:4502/content/geometrixx-outdoors/en_US/jcr:content.json
       {
       * "jcr:mixinTypes": ["cq:PollConfig"],
       * "enabled": true,
       * "source": "hybris:outdoors",
       * "jcr:primaryType": "cq:PageContent",
       * "interval": 86400
       }
  ```

* The catalog configuration in AEM recognizes **Staged** and **Online** catalog versions.

* Syncing products between catalog versions require an activation or deactivation of the corresponding AEM page (a, c)

  * Adding a product to an **Online** catalog version requires activation of the product's page.

  * Removing a product requires deactivation.

* Activating a page in AEM (c) requires a check (b) and is only possible if

  * The product is in an **Online** catalog version for product pages.

  * The referenced products are available in an **Online** catalog version for other pages (for example, campaign pages).

* Activated product pages must access the product data's **Online** version (d).

* The AEM Publish instance requires access to hybris for the retrieval of product and personalized data (d).

### Architecture {#architecture}

#### Architecture of Product and Variants {#architecture-of-product-and-variants}

A single product can have multiple variations; for instance, it might vary by color and/or size. A product must define which properties drive variation; Adobe terms these *variant axes*.

However, not all properties are variant axes. Variations can also affect other properties; for example, the price might depend on size. These properties cannot be selected by the shopper and therefore are not considered variant axes.

Each product and/or variant is represented by a resource, and therefore maps 1:1 to a repository node. It is a corollary that a specific product and/or variant can be uniquely identified by its path.

The product/variant resource does not always hold the actual product data. It might be a representation of data held on another system (such as hybris). For example, product descriptions and pricing are not stored in AEM, but retrieved in real time from the eCommerce engine.

Any product resource can be represented by a `Product API`. Most calls in the product API are variation-specific (although variations might inherit shared values from an ancestor), but there are also calls which list the set of variations ( `getVariantAxes()`, `getVariants()`, and so on).

>[!NOTE]
>
>In effect, a variant axes is determined by whatever `Product.getVariantAxes()` returns:
>* hybris defines it for the hybris implementation
>
>While products (in general) can have many variant axes, the out-of-the-box product component only handles two:
>
>1. `size`
>
>1. plus one more
>
>This additional variant is selected via the `variationAxis` property of the product reference (usually `color` for Geometrixx Outdoors).

#### Product References and Product Data {#product-references-and-product-data}

In general, product data is located under `/etc`, and product references under `/content`.

There must be a 1:1 map between product variations and product data nodes.

Product references must also have a node for each variation presented - but there is no requirement to present all variations. For instance, if a product has S, M, L variations, the product data might be:

```shell
etc
|──commerce
|  |──products
|     |──shirt
|       |──shirt-s
|       |──shirt-m
|       |──shirt-l
```

While a "Big and Tall" catalog might have only:

```shell
content
|──big-and-tall
|  |──shirt
|     |──shirt-l
```

Finally, there is no requirement to use product data. You can place all product data under the references in the catalog; but then you cannot really have multiple catalogs without duplicating all the product data.

**API**

#### com.adobe.cq.commerce.api.Product interface {#com-adobe-cq-commerce-api-product-interface}

```java
public interface Product extends Adaptable {

    public String getPath();            // path to specific variation
    public String getPagePath();        // path to presentation page for all variations
    public String getSKU();             // unique ID of specific variation

    public String getTitle();           // shortcut to getProperty(TITLE)
    public String getDescription();     // shortcut to getProperty(DESCRIPTION)
    public String getImageUrl();        // shortcut to getProperty(IMAGE_URL)
    public String getThumbnailUrl();    // shortcut to getProperty(THUMBNAIL_URL)

    public <T> T getProperty(String name, Class<T> type);

    public Iterator<String> getVariantAxes();
    public boolean axisIsVariant(String axis);
    public Iterator<Product> getVariants(VariantFilter filter) throws CommerceException;
}
```

#### com.adobe.cq.commerce.api.VariantFilter  {#com-adobe-cq-commerce-api-variantfilter}

```java
/**
 * Interface for filtering variants and AxisFilter provided as common implementation
 *
 * The <code>VariantFilter</code> is used to filter variants,
 * for example, when using {@link Product#getVariants(VariantFilter filter)}.
 */
public interface VariantFilter {
    public boolean includes(Product product);
}

/**
 * A {@link VariantFilter} for filtering variants by the given
 * axis and value. The following example returns a list of
 * variant products that have a value of <i>blue</i> on the
 * <i>color</i> axis.
 *
 * <p>
 * <code>product.getVariants(new AxisFilter("color", "blue"));</code>
 */
public class AxisFilter implements VariantFilter {

    private String axis;
    private String value;

    public AxisFilter(String axis, String value) {
        this.axis = axis;
        this.value = value;
    }

    /**
     * {@inheritDoc}
     */
    public boolean includes(Product product) {
        ValueMap values = product.adaptTo(ValueMap.class);

        if(values != null) {
            String v = values.get(axis, String.class);

            return v != null && v == value;
        }

        return false;
    }
}
```

* **General Storage Mechanism**

  * Product nodes are `nt:unstructured`.
  
  * A product node can be either:

    * A reference, with the product data stored elsewhere:

      * Product references contain a `productData` property, which points to the product data (typically under `/etc/commerce/products`).

      * The product data is hierarchical; product attributes are inherited from a product data node's ancestors.

      * Product references can also contain local properties, which override those specified in their product data.

    * A product itself:

      * Without a `productData` property.

      * A product node which holds all properties locally (and does not contain a productData property) inherits product attributes directly from its own ancestors.

* **AEM-generic Product Structure**

  * Each variant must have its own leaf node.
  
  * The product interface represents both products and variants, but the related repository node is specific about which it is.
  
  * The product node describes the product attributes and variant axes.

#### Example {#example-1}

```shell
+ banyan_shirt
    - cq:commerceType = product
    - cq:productAttributes = [jcr:title, jcr:description, size, price, color]
    - cq:productVariantAxes = [color, size]
    - jcr:title = Banyan Shirt
    - jcr:description = Flowery, all-cotton shirt.
    - price = 14.00
    + banyan_shirt_s
        - cq:commerceType = variant
        - size = S
        + banyan_shirt_s_red
            - cq:commerceType = variant
            - color = red
        + banyan_shirt_s_blue
            - cq:commerceType = variant
            - color = blue
    + banyan_shirt_m
        - cq:commerceType = variant
        - size = M
        + banyan_shirt_m_red
            - cq:commerceType = variant
            - color = red
        + banyan_shirt_m_blue
            - cq:commerceType = variant
            - color = blue
    + banyan_shirt_l
        - cq:commerceType = variant
        - size = L
        + banyan_shirt_l_red
            - cq:commerceType = variant
            - color = red
        + banyan_shirt_l_blue
            - cq:commerceType = variant
            - color = blue
    + banyan_shirt_xl
        - cq:commerceType = variant
        - size = XL
        - price = 18.00
```

#### Architecture of the Shopping Cart {#architecture-of-the-shopping-cart}

**Components**

* The shopping cart is owned by the `CommerceSession:`

    * The `CommerceSession` performs add or remove, and so on.
    * The `CommerceSession` also performs the various calculations on the cart. ``

* While not directly cart-related, the `CommerceSession` must also provide catalog pricing information (since it owns pricing)

    * Pricing might have several modifiers:

        * Quantity discounts.
        * Different currencies.
        * VAT-liable and VAT-free.

    * The modifiers are open-ended with the following interface:

        * `int CommerceSession.getQuantityBreakpoints(Product product)`
        * `String CommerceSession.getProductPrice(Product product)`

**Storage**

* Storage

    * In the hybris case, the hybris server owns the cart.
    * In the AEM-generic case, carts of are stored in the [ClientContext](/help/sites-administering/client-context.md).

**Personalization**

* Always drive personalization through the [ClientContext](/help/sites-administering/client-context.md).
* A ClientContext `/version/` of the cart is created in all cases:

    * Products should be added by using the `CommerceSession.addCartEntry()` method.

* The following illustrates an example of cart information in the ClientContext cart:

![chlimage_1-13](/help/sites-developing/assets/chlimage_1-13a.png)

#### Architecture of Checkout {#architecture-of-checkout}

**Cart and Order Data**

The `CommerceSession` owns the three elements:

1. Cart contents
1. Pricing
1. The order details

1. **Cart contents**

   The cart contents schema is fixed by the API:

   ```java
   public void addCartEntry(Product product, int quantity);
   public void modifyCartEntry(int entryNumber, int quantity);
   public void deleteCartEntry(int entryNumber);
   ```

1. **Pricing**

   The pricing schema is also fixed by the API:

   ```java
   public String getCartPreTaxPrice();
   public String getCartTax();
   public String getCartTotalPrice();
   public String getOrderShipping();
   public String getOrderTotalTax();
   public String getOrderTotalPrice();
   ```

1. **Order Details**

   However, order details are *not* fixed by the API:

   ```java
   public void updateOrderDetails(Map<String, String> orderDetails);
   public Map<String, String> getOrderDetails();
   public void submitOrder();
   ```

**Shipping Calculations**

* Order forms must often present multiple shipping options (and prices).
* The prices might be based on items and details of the order, such as weight and/or delivery address.
* The `CommerceSession` has access to all the dependencies, so it can be treated in a similar manner as product pricing:

  * The `CommerceSession` owns shipping pricing.
  * Can retrieve/update delivery details by using `updateOrder(Map<String, Object> delta)`

>[!NOTE]
>
>You could implement a shipping selector; for example:
>
>`yourProject/commerce/components/shippingpicker`:
>
>* Essentially this could be a copy of `foundation/components/form/radio`, but with callbacks to the `CommerceSession` for:
>
>* Checking if the method is available
>* Adding pricing information
>* To enable shoppers to update the order page in AEM (including the superset of shipping methods and the text describing them), while still having the control to expose the relevant `CommerceSession` information.

**Payment Processing**

* The `CommerceSession` also owns the payment processing connection.

* Implementors should add specific calls (to their chosen payment processing service) to the `CommerceSession` implementation.

**Order Fulfillment**

* The `CommerceSession` also owns the fulfillment connection.
* Implementors must add specific calls (to their chosen payment processing service) to the `CommerceSession` implementation.

### Search Definition {#search-definition}

Following the standard service API model, the eCommerce project provides a set of search-related APIs that can be implemented by individual commerce engines.

>[!NOTE]
>
>Currently, only the hybris engine implements the search API out-of-the-box.
>
>However, the search API is generic and can be implemented by each CommerceService individually.

The eCommerce project contains a default search component in:

`/libs/commerce/components/search`

![chlimage_1-14](/help/sites-developing/assets/chlimage_1-14a.png)

This uses the search API to query the selected commerce engine (see [eCommerce Engine Selection](#ecommerce-engine-selection)):

#### Search API {#search-api}

There are several generic / helper classes provided by the core project:

1. `CommerceQuery`

   Describes a search query (contains information about the query text, current page, page size, sort, and selected facets). All eCommerce services that implement the search API receive instances of this class to perform their search. A `CommerceQuery` can be instantiated from a request object ( `HttpServletRequest`).

1. `FacetParamHelper`

   Is a utility class that provides one static method - `toParams` - that is used for generating `GET` parameter strings from a list of facets and one toggled value. This is useful on the UI side, where you must display a hyperlink for each value of each facet, such that when the user clicks the hyperlink the respective value is toggled. That is, if it was selected it is removed from the query, otherwise added. This takes care of all the logic of handling multiple/single-valued facets, overriding values, and so on.

The entry point for the search API is the `CommerceService#search` method which returns a `CommerceResult` object. See the [API Documentation](/help/commerce/cif-classic/developing/ecommerce.md#api-documentation) for more information on this topic.

### User Integration {#user-integration}

Integration is provided between AEM and various eCommerce systems. This requires a strategy for synchronizing shoppers between the various systems so that AEM-specific code only has to know about AEM and conversely:

* Authentication

  AEM is presumed to be the *only* web front end and therefore performs *all* authentication.

* Accounts in Hybris

  AEM creates a corresponding (subordinate) account in hybris for each shopper. The username of this account is the same as the AEM username. A cryptographically random password is auto-generated and stored (encrypted) in AEM.

#### Pre-existing Users {#pre-existing-users}

A AEM front end can be positioned in front of an existing hybris implementation. Also a hybris engine can be added to an existing AEM installation. To do this, the systems must be able to gracefully handle existing users in either system:

* AEM > hybris

    * When logging in to hybris, if the AEM user does not exist:

        * create a hybris user with a cryptographically random password
        * store the hybris username in the user directory of the AEM user

    * See: `com.adobe.cq.commerce.hybris.impl.HybrisSessionImpl#login()`

* hybris > AEM

    * When logging in to AEM, if the system recognizes the user:

        * attempt to log in to hybris with the supplied username/pwd
        * if successful, create the user in AEM with the same password (AEM-specific salt results in AEM-specific hash)

    * The above algorithm is implemented in a Sling `AuthenticationInfoPostProcessor`

        * See: `com.adobe.cq.commerce.hybris.impl.user.LazyUserImporter.java`

### Customizing the Import Process {#customizing-the-import-process}

To build upon existing functionality your custom import handler:

* has to implement the `ImportHandler` interface

* can extend the `DefaultImportHandler`.

```java
/**
 * Services implementing the <code>ImportHandler</code> interface are
 * called by the {@link HybrisImporter} to create actual commerce entities
 * such as products.
 */
public interface ImportHandler {

  /**
  * Not used.
  */
  public void createTaxonomie(ImporterContext ctx);

  /**
  * Creates a catalog with the given name.
  * @param ctx   The importer context
  * @param name  The catalog's name
  * @return Path of created catalog
  */
  public String createCatalog(ImporterContext ctx, String name) throws Exception;

  /**
  * Creates a product from the given values.
  * @param ctx                The importer context
  * @param values             The product's properties
  * @param parentCategoryPath The containing category's path
  * @return Path of created product
  */
  public String createProduct(ImporterContext ctx, ValueMap values, String parentCategoryPath) throws Exception;

  /**
  * Creates a variant product from the given values.
  * @param ctx             The importer context
  * @param values          The product's properties
  * @param baseProductPath The base product's path
  * @return Path of created product
  */
  public String createVariantProduct(ImporterContext ctx, ValueMap values, String baseProductPath) throws Exception;

  /**
  * Creates an asset for a product. This is usually a product
  * image.
  * @param ctx             The importer context
  * @param values          The product's properties
  * @param baseProductPath The product's path
  * @return Path of created asset
  */
  public String createAsset(ImporterContext ctx, ValueMap values, String productPath) throws Exception;

  /**
  * Creates a category from the given values.
  * @param ctx           The importer context
  * @param values        The category's properties
  * @param parentPath    Path of parent category or base path of import if there is a root category
  * @return Path of created category
  */
  public String createCategory(ImporterContext ctx, ValueMap values, String parentCategoryPath) throws Exception;
}
```

For your custom handler to be recognized by the importer, it must specify the `service.ranking`property with a value higher than 0, for example.

```java
@Component
@Service
@Property(name = "service.ranking", value = 100)
public class MyImportHandler extends DefaultImportHandler
{
...
}
```
