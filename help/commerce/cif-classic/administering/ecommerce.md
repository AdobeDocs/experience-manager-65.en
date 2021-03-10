---
title: eCommerce
seo-title: eCommerce
description: AEM eCommerce helps marketers deliver branded, personalized shopping experiences across web, mobile, and social touchpoints.
seo-description: AEM eCommerce helps marketers deliver branded, personalized shopping experiences across web, mobile, and social touchpoints.
uuid: 75818c60-1cf1-4a91-94ce-d722563b661c
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: e-commerce
content-type: reference
discoiquuid: e972ee05-f0cb-40ca-9ae2-34395791c709
docset: aem65

---

# eCommerce{#ecommerce}

* [Concepts](/help/sites-administering/concepts.md)
* [Administering (generic)](/help/sites-administering/generic.md)

Adobe provides two versions of the Commerce Integration Framework:

<table>
 <tbody>
  <tr>
   <th><p> </p> </th>
   <th><p>CIF on-prem</p> </th>
   <th><p>CIF Cloud</p> </th>
  </tr>
  <tr>
   <td><p>Supported AEM versions</p> </td>
   <td><p>AEM on-prem or AMS 6.x</p> </td>
   <td>AEM AMS 6.4 and 6.5</td>
  </tr>
  <tr>
   <td><p>Back-end</p> </td>
   <td>
    <ul>
     <li>AEM, Java</li>
     <li>Monolithic integration, pre-build mapping (template)</li>
     <li>JCR repository</li>
    </ul> </td>
   <td>
    <ul>
     <li>Magento</li>
     <li>Java &amp; Javascript</li>
     <li>No commerce data stored in JCR repository</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Front-end</p> </td>
   <td><p>AEM server-side rendered pages</p> </td>
   <td>Mixed page application (hybrid rendering)</td>
  </tr>
  <tr>
   <td><p>Product catalog</p> </td>
   <td>
    <ul>
     <li>Product importer, editor, caching in AEM</li>
     <li>Regular catalogs with AEM or proxy pages</li>
    </ul> </td>
   <td>
    <ul>
     <li>No product import</li>
     <li>Generic templates</li>
     <li>On-demand data via connector</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>Scalability</p> </td>
   <td>
    <ul>
     <li>Can support upto a few million products (depends on the use-case)</li>
     <li>Caching on Dispatcher</li>
    </ul> </td>
   <td>
    <ul>
     <li>No volume limitation</li>
     <li>Caching on Dispatcher or CDN</li>
    </ul> </td>
  </tr>
  <tr>
   <td>Standardized data model</td>
   <td>No</td>
   <td>Yes, Magento GraphQL schema</td>
  </tr>
  <tr>
   <td>Availability</td>
   <td><p>Yes. SAP Commerce Cloud (Extension updated to support AEM 6.4 and Hybris 5 (default) and maintains compatibility with Hybris 4</p> <p>Salesforce Commerce Cloud (Connector open-sourced to support AEM 6.4)</p> </td>
   <td>Yes via open source via GitHub. Magento Commerce (Supports Magento 2.3.2 (default) and compatible with Magento 2.3.1).</td>
  </tr>
  <tr>
   <td>When to use</td>
   <td>Limited use-cases: For e.g. scenarios where small, static catalogs may need to be imported</td>
   <td>Preferred solution in most use-cases</td>
  </tr>
 </tbody>
</table>

eCommerce, together with Product Information Management (PIM), handles the activities of a website focused on selling products via an online store:

* Creation, lifetime, and obsolescence of a product
* Price management
* Transaction management
* Management of entire catalogs
* Live and centralized storage records
* Web interfaces

AEM eCommerce helps marketers deliver branded, personalized shopping experiences across web, mobile, and social touchpoints. The AEM authoring environment allows you to customize pages and components based on target visitor context and merchandising strategies; for example:

* Product pages
* Shopping cart components
* Checkout components

The implementation allows real-time access to product information. This can be used to enforce:

* Product information integrity
* Pricing
* Stock-keeping inventory
* Variations in state of a shopping cart

>[!NOTE]
>
>To use the integration framework with external eCommerce providers, you first need to install the required packages. For more information, see [Deploying eCommerce](/help/sites-deploying/ecommerce.md).
>
>For information about extending eCommerce capabilities, see [Developing eCommerce](/help/sites-developing/ecommerce.md).

## Main Features {#main-features}

AEM eCommerce provides:

* A number of **out-of-the-box AEM components** to illustrate what can be achieved for your project:

    * Product display
    * Shopping cart
    * Check-out
    * Recently viewed products
    * Vouchers
    * and others

  ![](assets/chlimage_1-130.png)

  >[!NOTE]
  >
  >The integration framework provided by AEM also allows you to build additional AEM components for commerce capabilities independent of your specific eCommerce engine.

* **Search** - using either:

    * the AEM search
    * the search of the eCommerce system
    * a third party search (such as Search&Promote)
    * or a combination thereof.

  ![](assets/chlimage_1-131.png)

* Uses the AEM ability to **present your content on multiple channels**, be that full browser window or mobile device. This delivers your content in the format needed by your visitors.

  ![](assets/chlimage_1-132.png)

* The ability to **develop your own integration implementation based on the [AEM eCommerce framework](#the-framework)**.

  The two implementations currently available are both built on the same basis - on top of the general API (the framework). Implementing a new integration only involves implementing the feature(s) that your integration needs. Front end components can be used by any new implementation as they use interfaces (so are independent from the implementation).

* The possibility to develop **experience-driven commerce based on shopper data and activity**. This allows you to realize many scenarios:

    * One example might be providing reductions in shipping costs when the total order exceeds a specific amount.
    * Another might allow you to provide seasonal offers that use profile data (e.g. location). These can then be highlighted, again depending on other factors when necessary.

  In the example below one teaser is shown as the contents of the cart are less than $75:

  ![](assets/chlimage_1-133.png)

  This can be changed when the contents of the cart exceed $75:

  ![](assets/chlimage_1-134.png)

* And other features including:

    * Shopping cart contents retained across sessions
    * Full order history
    * Express catalog update

## The Framework {#the-framework}

The [Concepts](/help/sites-administering/concepts.md) section covers the framework in more detail, but the following provides a high-level, high-speed view of the framework:

### What? {#what}

* The integration framework provides the API, a range of components to illustrate functionality and several extensions to provide examples of connection methods.
* The framework provides the basic structure needed for a project implementation.
* The framework is extensible.
* The framework does not provide an out-of-the-box, ready-to-use site. A certain amount of development work is always needed to adapt the framework to your specifications.

### Why? {#why}

* To provide the basic mechanisms needed to quickly realize a customized eCommerce site.
* Tp provide the flexibility needed for developing a real-life eCommerce site.
* Illustrate best practices.