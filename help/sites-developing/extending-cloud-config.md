---
title: Cloud Service Configurations
description: You can extend the existing instances to create your own configurations
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
exl-id: 20a19ee5-7113-4aca-934a-a42c415a8d93
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Cloud Service Configurations{#cloud-service-configurations}

Configurations are designed to provide the logic and structure for storing service configurations.

You can extend the existing instances to create your own configurations.

## Concepts {#concepts}

The principles used in developing the configurations have been based on the following concepts:

* Services/Adapters are used to retrieve the configurations.
* Configurations (for example, properties/paragraphs) are inherited from the parents.
* Referenced from analytics nodes by path.
* Easily extensible.
* Has the flexibility to cater for more complex configurations, such as [Adobe Analytics](/help/sites-administering/marketing-cloud.md#integrating-with-adobe-analytics).
* Support for dependencies (for example, [Adobe Analytics](/help/sites-administering/marketing-cloud.md#integrating-with-adobe-analytics) plugins need an [Adobe Analytics](/help/sites-administering/marketing-cloud.md#integrating-with-adobe-analytics) configuration).

## Structure {#structure}

The base path of the configurations is:

`/etc/cloudservices`.

For each type of configuration, a template and a component is provided. This makes it possible to have configuration templates that can fulfill most needs after being customized.

To provide a configuration for new services, do the following:

* Create a servicepage in

  `/etc/cloudservices`

* Under this:

  * a configuration template
  * a configuration component

The template and component must inherit the `sling:resourceSuperType` from the base template:

`cq/cloudserviceconfigs/templates/configpage`

Or base component respectively

`cq/cloudserviceconfigs/components/configpage`

The service provider should also provide the service page:

`/etc/cloudservices/<service-name>`

### Template {#template}

Your template extends the base template:

`cq/cloudserviceconfigs/templates/configpage`

And define a `resourceType` that points to the custom component.

```xml
/libs/cq/analytics/templates/sitecatalyst
sling:resourceSuperType = cq/cloudserviceconfigs/templates/configpage
allowedChildren = /libs/cq/analytics/templates/sitecatalyst
allowedPaths = /etc/cloudservices/analytics/*, /etc/cloudservices/analytics/.*
componentReference = cq/analytics/components/sitecatalyst
jcr:content/
cq:designPath = /etc/designs/cloudservices
sling:resourceType = cq/analytics/components/sitecatalystpage

/libs/cq/analytics/templates/generictracker
sling:resourceSuperType = cq/cloudservices/templates/configpage
allowedChildren = /libs/cq/analytics/templates/generictracker
allowedPaths = /etc/cloudservices/analytics/*, /etc/cloudservices/analytics/.*
jcr:content/
cq:designPath = /etc/designs/cloudservices
sling:resourceType = cq/analytics/components/generictrackerpage

```

### Components {#components}

Your component should extend the base component:

`cq/cloudserviceconfigs/templates/configpage`

```xml
/libs/cq/analytics/components/sitecatalystpage

/libs/cq/analytics/components/generictrackerpage

```

After setting up your template and component, you can add your configuration by adding subpages under:

`/etc/cloudservices/<service-name>`

### Content Model {#content-model}

The content model is stored as `cq:Page` under:

`/etc/cloudservices/<service-name>(/*)`

```xml
/etc/cloudservices
/etc/cloudservices/service-name
/etc/cloudservices/service-name/config
/etc/cloudservices/service-name/config/inherited-config
```

The configurations are stored under the subnode `jcr:content`.

* Fixed properties, defined in a dialog should be stored on the `jcr:node` directly.
* Dynamic elements (using `parsys` or `iparsys`) use a subnode to store the component data.

```xml
/etc/cloudservices/service/config/jcr:content as nt:unstructured
propertyname
*
par/component/ as cq:Component
propertyname
*
```

### API {#api}

For reference documentation on the API, see [com.day.cq.wcm.webservicesupport](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/wcm/webservicesupport/package-summary.html).

### AEM Integration {#aem-integration}

Available services are listed in the **Cloud Services** tab of the **Page Properties** dialog (of any page that inherits from `foundation/components/page` or `wcm/mobile/components/page`).

The tab also provides:

* a link to the location where you can enable the service
* choose a configuration (subnode of the service) from a path field

#### Password Encryption {#password-encryption}

When storing user credentials for the service, all passwords should be encrypted.

You can achieve this by adding a hidden form field. This field should have the annotation `@Encrypted` in the property name; that is, for the `password` field the name would be written as:

`password@Encrypted`

The property will then be automatically encrypted (using the `CryptoSupport` service) by the `EncryptionPostProcessor`.

>[!NOTE]
>
>This is similar to the standard ` [SlingPostServlet](https://sling.apache.org/site/manipulating-content-the-slingpostservlet-servletspost.html)` annotations.

>[!NOTE]
>
>By default the `EcryptionPostProcessor` only encrypts `POST` requests made to `/etc/cloudservices`.

#### Additional Properties for Service Page jcr:content Nodes {#additional-properties-for-service-page-jcr-content-nodes}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
  </tr>
  <tr>
   <td>componentReference</td>
   <td>Reference path to a component to be automatically included in the page.<br /> This is used for additional functionality and JS inclusions.<br /> This includes the component on the page where<br /> <code> cq/cloudserviceconfigs/components/servicecomponents</code><br /> is included (normally before the <code>body</code> tag).<br /> In case the of Adobe Analytics and Adobe Target, we use this to include additional functionality, such as JavaScript calls to track visitor behavior.</td>
  </tr>
  <tr>
   <td>description</td>
   <td>Short description of the service.<br /> </td>
  </tr>
  <tr>
   <td>descriptionExtended</td>
   <td>Extended description of the service.</td>
  </tr>
  <tr>
   <td>ranking</td>
   <td>Service ranking for use in listings.</td>
  </tr>
  <tr>
   <td>selectableChildren</td>
   <td>Filter for displaying configurations in page properties dialog.</td>
  </tr>
  <tr>
   <td>serviceUrl</td>
   <td>URL to service website.</td>
  </tr>
  <tr>
   <td>serviceUrlLabel</td>
   <td>Label for service URL.</td>
  </tr>
  <tr>
   <td>thumbnailPath</td>
   <td>Path to thumbnail for service.</td>
  </tr>
  <tr>
   <td>visible</td>
   <td>Visibility in page properties dialog; visible by default (optional)</td>
  </tr>
 </tbody>
</table>

### Use Cases {#use-cases}

These services are provided by default:

* [Tracker Snippets](/help/sites-administering/external-providers.md) (Google, WebTrends, and so on)
* [Adobe Analytics](/help/sites-administering/marketing-cloud.md#integrating-with-adobe-analytics)
* [Test&Target](/help/sites-administering/marketing-cloud.md#integrating-with-adobe-target)
<!-- Search&Promote is end of life as of September 1, 2022 * [Search&Promote](/help/sites-administering/marketing-cloud.md#integrating-with-search-promote) -->
* [Dynamic Media](/help/sites-administering/marketing-cloud.md#integrating-with-scene)

>[!NOTE]
>
>See also [Creating a Custom Cloud Service](/help/sites-developing/extending-cloud-config-custom-cloud.md).
