---
title: E-Commerce Repository Restructuring in AEM 6.4
seo-title: E-Commerce Repository Restructuring in AEM 6.4
description: Learn how to make the necessary changes in order to migrate to the new repository structure in AEM 6.4 for E-Commerce.
seo-description: Learn how to make the necessary changes in order to migrate to the new repository structure in AEM 6.4 for E-Commerce.
uuid: 1fff1a4b-c8d0-4016-92fb-e2ea26e3a302
products: SG_EXPERIENCEMANAGER/6.4/SITES
content-type: reference
topic-tags: repo_restructuring
discoiquuid: 28c92e7d-2106-4333-afa6-c5528a00d7b4
---

# E-Commerce Repository Restructuring in AEM 6.4{#e-commerce-repository-restructuring-in-aem}

As described on the parent [Repository Restructuring in AEM 6.4](/help/sites-deploying/repository-restructuring.md) page, customers upgrading to AEM 6.4 should use this page to assess the work effort associated with repository changes impacting the AEM E-Commerce Solution. Some changes require work effort during the AEM 6.4 upgrade process, while others can be deferred until a 6.5 upgrade.

## With 6.4 Upgrade {#with-upgrade}

### Product, Order, Collections, Classifications, Shipping Methods and Payment Methods Data {#product-order-collections-classifications-shipping-methods-and-payment-methods-data}

<table> 
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td> 
   <td><p><code>/etc/commerce/products</code></p> <p><code>/etc/commerce/orders</code></p> <p><code>/etc/commerce/collections</code></p> <p><code>/etc/commerce/classifications</code></p> <p><code>/etc/commerce/shipping-methods</code></p> <p><code>/etc/commerce/payment-methods</code></p> </td> 
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td> 
   <td><p><code>/var/commerce/products</code></p> <p><code>/var/commerce/orders</code></p> <p><code>/var/commerce/collections</code></p> <p><code>/var/commerce/classifications</code></p> <p><code>/var/commerce/shipping-methods</code></p> <p><code>/var/commerce/payment-methods</code></p> </td> 
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td> 
   <td><p>You can use a <a href="/help/sites-deploying/lazy-content-migration.md" target="_blank">Lazy Migration</a> task to migrate E-Commerce data.</p> <p>It performs the following steps:</p> 
    <ul> 
     <li>adjusts references to old location to point to new location</li> 
     <li>moves content from old location to new location</li> 
     <li>removes old location to eventually activate the usage of new location in the whole system</li> 
    </ul> <p>The locations covered by the task are:</p> 
    <ul> 
     <li>/etc/commerce/products</li> 
     <li>/etc/commerce/collections<br /> </li> 
     <li>/etc/commerce/orders<br /> </li> 
     <li>/etc/commerce/payment-methods<br /> </li> 
     <li>/etc/commerce/shipping-methods<br /> </li> 
    </ul> <p>For larger catalogs it is recommanded to run the commerce migration task individually by passing the following Java system property to AEM:</p> <p><code>propertyname: com.adobe.upgrade.forcemigration</code></p> <p><code>property value: com.day.cq.compat.codeupgrade.impl.cq64.CQ64CommerceMigrationTask</code></p> <p>After migration AEM needs a restart.</p> </td> 
  </tr>
  <tr>
   <td><strong>Notes</strong></td> 
   <td>N/A<br /> </td> 
  </tr>
 </tbody>
</table>

