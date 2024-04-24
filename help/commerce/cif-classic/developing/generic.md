---
title: Developing (generic)
description: The integration framework includes an integration layer with an API, allowing you to build AEM components for eCommerce capabilities.
contentOwner: Guillaume Carlino
exl-id: 1138a548-d112-4446-b0e1-b7a9ea7c7604
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# Developing (generic){#developing-generic}

>[!NOTE]
>
>[API documentation](/help/commerce/cif-classic/developing/ecommerce.md#api-documentation) is also available.

The integration framework includes an integration layer with an API. This lets you build AEM components for eCommerce capabilities (independent of your specific eCommerce engine). It also lets you use the internal CRX database or to plug in an eCommerce system and pull product data into AEM.

Several out-of-the-box AEM components are provided to use the integration layer. Currently these are:

* A product display component
* A shopping cart
* Promotions and vouchers
* Catalog and section blueprints
* Check-out
* Search

For search, an integration hook is provided that lets you use the Adobe Experience Manager (AEM) search, a third-party search, or a combination thereof.

## eCommerce Engine Selection {#ecommerce-engine-selection}

The eCommerce framework can be used with any eCommerce solution, the engine being used must be identified by AEM - even when using the AEM generic engine:

* eCommerce Engines are OSGi services supporting the `CommerceService` interface

    * Engines can be distinguished by a `commerceProvider` service property

* AEM supports `Resource.adaptTo()` for `CommerceService` and `Product`

    * The `adaptTo` implementation looks for a `cq:commerceProvider` property in the resource's hierarchy:

        * If found, the value is used to filter the commerce service lookup.
        * If not found, the highest-ranked commerce service is used.

    * A `cq:Commerce` mixin is used so the `cq:commerceProvider` can be added to strongly typed resources.

* The `cq:commerceProvider` property is also used to reference the appropriate commerce factory definition.

    * For example, a `cq:commerceProvider` property with the value Geometrixx correlates to the OSGi configuration for **Day CQ Commerce Factory for Geometrixx-Outdoors** (`com.adobe.cq.commerce.hybris.impl.GeoCommerceServiceFactory`) - where the parameter `commerceProvider` also has the value `geometrixx`.
    * Here further properties can be configured (when appropriate and available).

In a standard AEM installation a specific implementation is required, for example:

|||
|---|---|
|`cq:commerceProvider = geometrixx`|geometrixx example; this includes minimal extensions to the generic API|

### Example {#example}

```shell
/etc/commerce/products/geometrixx-outdoors
+ cq:commerceProvider = geometrixx
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
>Using CRXDE Lite you can see how this is handled in the product component for the AEM generic implementation:
>
>`/apps/geometrixx-outdoors/components/product`

### Session Handling {#session-handling}

A session to store information related to the customer's shopping cart.

The **CommerceSession**:

* Owns the **shopping cart**

    * performs add/remove/etc
    * performs the various calculations on the cart;

      `commerceSession.getProductPriceInfo(Product product, Predicate filter)`

* Owns persistence of the **order** data:

  `CommerceSession.getUserContext()`

* Can retrieve/update delivery details by using `updateOrder(Map<String, Object> delta)`
* Owns the **payment** processing connection
* Owns the **fulfillment** connection

### Architecture {#architecture}

#### Architecture of Product and Variants {#architecture-of-product-and-variants}

A single product can have multiple variations; for instance, it might vary by color and/or size. A product must define which properties drive variation; Adobe terms these *variant axes*.

However, not all properties are variant axes. Variations can also affect other properties; for example, the price might depend on size. These properties cannot be selected by the shopper and therefore are not considered variant axes.

Each product and/or variant is represented by a resource, and therefore maps 1:1 to a repository node. It is a corollary that a specific product and/or variant can be uniquely identified by its path.

Any product resource can be represented by a `Product API`. Most calls in the product API are variation-specific (although variations might inherit shared values from an ancestor), but there are also calls which list the set of variations ( `getVariantAxes()`, `getVariants()`, and so on).

>[!NOTE]
>
>In effect, a variant axes is determined by whatever `Product.getVariantAxes()` returns:
>
>* for the generic implementation, AEM reads it from a property in the product data ( `cq:productVariantAxes`)
>
>While products (in general) can have many variant axes, the out-of-the-box product component only handles two:
>
>1. `size`
>1. plus one more
>
>   This additional variant is selected via the `variationAxis` property of the product reference (usually `color` for Geometrixx Outdoors).

#### Product References and PIM Data {#product-references-and-pim-data}

In general:

* PIM data is located under `/etc`

* Product references under `/content`.

There must be a 1:1 map between product variations and product data nodes.

Product references must also have a node for each variation presented - but there is no requirement to present all variations. For instance, if a product has S, M, L variations, the product data might be:

```shell
etc
  commerce
    products
      shirt
        shirt-s
        shirt-m
        shirt-l
```

While a "Big and Tall" catalog might have only:

```shell
content
  big-and-tall
    shirt
      shirt-l
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

    * Product nodes are nt:unstructured.
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

    * The `CommerceSession` performs add, remove, and so on.
    * The `CommerceSession` also performs the various calculations on the cart.
    * The `CommerceSession` also applies vouchers and promotions that have fired to the cart.

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

    * In the AEM-generic case, carts are stored in the [ClientContext](/help/sites-administering/client-context.md)

**Personalization**

* Always drive personalization through the [ClientContext](/help/sites-administering/client-context.md).
* A ClientContext `/version/` of the cart is created in all cases:

    * Products should be added by using the `CommerceSession.addCartEntry()` method.

* The following illustrates an example of cart information in the ClientContext cart:

![chlimage_1-33](/help/sites-developing/assets/chlimage_1-33a.png)

#### Architecture of Checkout {#architecture-of-checkout}

**Cart and Order Data**

The `CommerceSession` owns the three elements:

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
    * Use `updateOrder(Map<String, Object> delta)` to retrieve/update delivery details.

### Search Definition {#search-definition}

Following the standard service API model, the eCommerce project provides a set of search-related APIs that can be implemented by individual commerce engines.

>[!NOTE]
>
>Currently, only the hybris engine implements the search API out-of-the-box.
>
>However, the search API is generic and can be implemented by each CommerceService individually.
>
>So although the generic implementation provided out-of-the-box does not implement this API, you can extend it and add the search functionality.

The eCommerce project contains a default search component in:

`/libs/commerce/components/search`

![chlimage_1-34](/help/sites-developing/assets/chlimage_1-34a.png)

This use the search API to query the selected commerce engine (see [eCommerce Engine Selection](#ecommerce-engine-selection)):

#### Search API {#search-api}

There are several generic / helper classes provided by the core project:

1. `CommerceQuery`

   Used to describe a search query (contains information about the query text, current page, page size, sort, and selected facets). All eCommerce services that implement the search API receive instances of this class to perform their search. A `CommerceQuery` can be instantiated from a request object ( `HttpServletRequest`).

1. `FacetParamHelper`

   Is a utility class that provides one static method - `toParams` - that is used for generating `GET` parameter strings from a list of facets and one toggled value. This is useful on the UI side, where you need to display a hyperlink for each value of each facet, such that when the user clicks the hyperlink, the respective value is toggled. That is, if it was selected, it is removed from the query, otherwise it is added. This takes care of all the logic of handling multiple/single-valued facets, overriding values, and so on.

The entry point for the search API is the `CommerceService#search` method which returns a `CommerceResult` object. See the API Documentation for more information on this topic.

### Developing Promotions and Vouchers {#developing-promotions-and-vouchers}

* Vouchers:

    * A Voucher is a page-based component that is created / edited with the Websites console and stored under:

      `/content/campaigns`

    * Vouchers supply:

        * A voucher code (to be typed into the cart by the shopper).
        * A voucher label (to be displayed after the shopper has entered it into the cart).
        * A promotion path (which defines the action the voucher applies).

    * Vouchers do not have their own on and off date/times, but use those of their parent campaigns.
    * External commerce engines can also supply vouchers; these require a minimum of:

        * A voucher code
        * An `isValid()` method

    * The **Voucher** component ( `/libs/commerce/components/voucher`) provides:

        * A renderer for voucher administration; this shows any vouchers currently in the cart.
        * The edit dialog boxes (form) for administrating (adding/removing) the vouchers.
        * The actions required for adding/removing vouchers to/from the cart.

* Promotions:

    * A Promotion is a page-based component that is created / edited with the Websites console and stored under:

      `/content/campaigns`

    * Promotions supply:

        * A priority
        * A promotion handler path

    * You can connect promotions to a campaign to define their on/off date/times.
    * You can connect promotions to an experience to define their segments.
    * Promotions not connected to an experience do not fire on its own, but can still be fired by a Voucher.
    * The Promotion component ( `/libs/commerce/components/promotion`) contains:

        * renderers and dialogs for promotion administration
        * sub-components for rendering and editing configuration parameters specific to the promotion handlers

    * Two promotion handlers are supplied out of the box:

        * `DiscountPromotionHandler`, which applies a cart-wide absolute or percentage discount
        * `PerfectPartnerPromotionHandler`, which applies a product absolute or percentage discount if the partner product is also in the cart

    * The ClientContext `SegmentMgr` resolves segments and the ClientContext `CartMgr` resolves promotions. Each promotion that is subject to at least one resolved segment is fired.

        * Fired Promotions are sent back to the server by way of an AJAX call to recalculate the cart.
        * Fired Promotions (and added Vouchers) are also shown in the ClientContext panel.

Adding/Removing a voucher from a cart is accomplished via the `CommerceSession` API:

```java
/**
 * Apply a voucher to this session's cart.
 *
 * @param code the voucher's code
 * @throws CommerceException
 */
public void addVoucher(String code) throws CommerceException;

/**
 * Remove a voucher that was previously added with {@link #addVoucher(String)}.
 *
 * @param code the voucher's code
 * @throws CommerceException
 */
public void removeVoucher(String code) throws CommerceException;

/**
 * Get a list of vouchers that were added to this cart via {@link #addVoucher(String)}.
 *
 * @throws CommerceException
 */
public List<Voucher> getVouchers() throws CommerceException;
```

This way, the `CommerceSession` is responsible for checking whether a voucher exists and if it can be applied or not. This might be for vouchers that can only be applied if a certain condition is met. For example, when the total cart price is greater than $100. If a voucher cannot be applied for any reason, the `addVoucher` method throws an exception. Also, the `CommerceSession` is responsible for updating the cart's prices after a voucher is added / removed.

The `Voucher` is a bean-like class that contains fields for:

* Voucher code
* A short description
* Referencing the related promotion that indicates the discount type and value

The `AbstractJcrCommerceSession` provided can apply vouchers. The vouchers returned by the class `getVouchers()` are instances of `cq:Page` containing a jcr:content node with the following properties (among others):

* `sling:resourceType` (String) - this needs to be `commerce/components/voucher`

* `jcr:title` (String) - for the voucher's description
* `code` (String) - the code the user has to enter to apply this voucher
* `promotion` (String) - the promotion to be applied; for example, `/content/campaigns/geometrixx-outdoors/article/10-bucks-off`

Promotion handlers are OSGi services that modify the shopping cart. The cart supports several hooks that are defined in the `PromotionHandler` interface.

```java
/**
 * Apply promotion to a cart line item. The method returns a discount
 * <code>PriceInfo</code> instance or <code>null</code> if no discount
 * was applied.
 * @param commerceSession The commerce session
 * @param promotion The configured promotion
 * @param cartEntry The cart line item
 * @return A discounted <code>PriceInfo</code> or <code>null</code>
 */
public PriceInfo applyCartEntryPromotion(CommerceSession commerceSession,
                                         Promotion promotion, CartEntry cartEntry)
    throws CommerceException;

/**
 * Apply promotion to an order. The method returns a discount
 * <code>PriceInfo</code> instance or <code>null</code> if no discount
 * was applied.
 * @param commerceSession The commerce session
 * @param promotion The configured promotion
 * @return A discounted <code>PriceInfo</code> or <code>null</code>
 */
public PriceInfo applyOrderPromotion(CommerceSession commerceSession, Promotion promotion)
    throws CommerceException;

public PriceInfo applyShippingPromotion(CommerceSession commerceSession, Promotion promotion)
    throws CommerceException;

/**
 * Allows a promotion handler to define a custom, author-oriented message for a promotion.
 * The {@link com.adobe.cq.commerce.common.promotion.PerfectPartnerPromotionHandler}, for instance,
 * uses this to list the qualifying pairs of products in the current cart.
 * @param commerceSession
 * @param promotion
 * @return A message to display
 * @throws CommerceException
 */
public String getMessage(SlingHttpServletRequest request, CommerceSession commerceSession, Promotion promotion) throws CommerceException;

/**
 * Informs the promotion handler that something under the promotions root has been edited, and the handler
 * should invalidate any caches it might be keeping.
 */
public void invalidateCaches();
```

Three promotion handlers are provided out of the box:

* `DiscountPromotionHandler` applies a cart-wide absolute or percentage discount
* `PerfectPartnerPromotionHandler` applies a product absolute or percentage discount if the product partner is also in the cart
* `FreeShippingPromotionHandler` applies free shipping
