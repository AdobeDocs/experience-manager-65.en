---
title: eCommerce Overview
seo-title: eCommerce Overview
description: AEM generic eCommerce is available as part of the standard installation and provides you with the full functionality of the eCommerce framework.
seo-description: AEM generic eCommerce is available as part of the standard installation and provides you with the full functionality of the eCommerce framework.
uuid: 0e3c42ec-c027-496b-835c-6d660188abc0
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: e-commerce
content-type: reference
discoiquuid: f64e1b1d-86c5-4bb2-9a7e-eebbb3686978
docset: aem65

---

# eCommerce Overview{#ecommerce-overview}

AEM generic eCommerce is available as part of a standard installation and provides you with the full functionality of the eCommerce framework.

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

## Deploying Other Implementations {#deploying-other-implementations}

For AEM and Magento, please see [AEM and Magento integration](https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/integrations.html#!AdobeDocs/commerce-cif-documentation/master/integrations/02-AEM-Magento.md) using the [Commerce Integration Framework](https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/integrations.html).

For other implementations, see:

* [SAP Commerce Cloud](/help/sites-deploying/hybris.md)
* [Salesforce Commerce Cloud](/help/sites-deploying/demandware.md)

>[!NOTE]
>
>For information about concepts and administering eCommerce implementations, see [Administering eCommerce](/help/sites-administering//ecommerce.md).
>
>For information about extending eCommerce capabilities, see [Developing eCommerce](/help/sites-developing/ecommerce.md).

