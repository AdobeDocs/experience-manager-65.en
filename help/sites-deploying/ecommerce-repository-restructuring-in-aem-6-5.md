---
title: E-Commerce Repository Restructuring in AEM 6.5
description: Learn how to make the necessary changes to migrate to the new repository structure in AEM 6.5 for E-Commerce.
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: repo_restructuring
feature: Upgrading
exl-id: 78b7c497-c474-4308-bfab-8f424b5f7268
solution: Experience Manager, Experience Manager Sites
role: Admin
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: 835ee49e-9248-5578-a60a-15c097807178
    internal-label: Upgrading
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
---
# E-Commerce Repository Restructuring in AEM 6.5{#e-commerce-repository-restructuring-in-aem}

As described on the parent [Repository Restructuring in AEM 6.5](/help/sites-deploying/repository-restructuring.md) page, customers upgrading to AEM 6.5 should use this page to assess the work effort associated with repository changes impacting the AEM E-Commerce Solution. Some changes require work effort during the AEM 6.5 upgrade process, while others can be deferred until a future upgrade.

## With 6.5 Upgrade {#with-upgrade}

### Product, Order, Collections, Classifications, Shipping Methods, and Payment Methods Data {#product-order-collections-classifications-shipping-methods-and-payment-methods-data}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/commerce/products</code></p> <p><code>/etc/commerce/orders</code></p> <p><code>/etc/commerce/collections</code></p> <p><code>/etc/commerce/classifications</code></p> <p><code>/etc/commerce/shipping-methods</code></p> <p><code>/etc/commerce/payment-methods</code></p> </td>
  </tr>
  <tr>
   <td><strong>New locations</strong></td>
   <td><p><code>/var/commerce/products</code></p> <p><code>/var/commerce/orders</code></p> <p><code>/var/commerce/collections</code></p> <p><code>/var/commerce/classifications</code></p> <p><code>/var/commerce/shipping-methods</code></p> <p><code>/var/commerce/payment-methods</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>You can use a <a href="/help/sites-deploying/lazy-content-migration.md" target="_blank">Lazy Migration</a> task to migrate E-Commerce data.</p> <p>It performs the following steps:</p>
    <ul>
     <li>adjusts references to the old location to point to the new location</li>
     <li>moves content from old location to new location</li>
     <li>removes the old location to eventually activate the usage of the new location in the whole system</li>
    </ul> <p>The locations covered by the task are:</p>
    <ul>
     <li>/etc/commerce/products</li>
     <li>/etc/commerce/collections<br /> </li>
     <li>/etc/commerce/orders<br /> </li>
     <li>/etc/commerce/payment-methods<br /> </li>
     <li>/etc/commerce/shipping-methods<br /> </li>
    </ul> <p>For larger catalogs, Adobe recommends that you run the commerce migration task individually by passing the following Java&trade; system property to AEM:</p> <p><code>propertyname: com.adobe.upgrade.forcemigration</code></p> <p><code>property value: com.day.cq.compat.codeupgrade.impl.cq64.CQ64CommerceMigrationTask</code></p> <p>After migration, restart AEM.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>
