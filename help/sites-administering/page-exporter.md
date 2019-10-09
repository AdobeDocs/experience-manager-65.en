---
title: The Page Exporter
seo-title: The Page Exporter
description: Learn how to use the AEM Page Exporter.
seo-description: Learn how to use the AEM Page Exporter.
uuid: 2ca2b8f1-c723-4e6b-8c3d-f5886cd0d3f1
contentOwner: Chiradeep Majumdar
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: content
content-type: reference
discoiquuid: 6ab07b5b-ee37-4029-95da-be2031779107
---

# The Page Exporter{#the-page-exporter}

AEM allows you to export a page as a complete web page including images, .js and .css files.

Once the export is configured you simply request a page in your browser by replacing `html` with `export.zip` in the URL and you get a zip file download containing the rendered page in html format and the referenced assets. All the paths in the page, e.g. paths to images, are rewritten to point either to the files included in the zip file or to the resources on the server.

## Exporting a Page {#exporting-a-page}

The following steps describe how to export a page, and assume that an export configuration template exists for your site. A configuration template defines the way a page is exported and is specific to your site. To create a configuration template refer to the [Creating a Page Exporter Configuration for your Site](#creating-a-page-exporter-configuration-for-your-site) section.

To export a page:

1. In your browser, open the page. For example:  
1. `http://localhost:4502/content/geometrixx/en/products/triangle.html`
1. Open the page properties dialog, select the **Advanced** tab and expand the **Export** field set.

1. Click the magnifier icon and select a configuration template. Select the **geometrixx** template, as it is the default one for the Geometrixx site. Click **OK**.

1. Click **OK** to close the page properties dialog.
1. Request the page by replacing `html` with `export.zip` in the URL.  

1. Download the `<page-name>.export.zip` file to your file system.  

1. In your file system, unzip the file:

    * the page html file ( `<page-name>.html`) is available below `<unzip-dir>/<page-path>`
    * other resources (.js files, .css files, images, ...) are located according to the settings in the export template. In this example some resources are below `<unzip-dir>/etc`, some below `<unzip-dir>/<page-path>`.

1. Open the page html file ( `<unzip-dir>/<page-path>.html`) in your browser to check the rendering.

## Creating a Page Exporter Configuration for your Site {#creating-a-page-exporter-configuration-for-your-site}

The page exporter is based on the Content Sync framework. The configurations that are available in the page properties dialog are configuration templates. They define all the required dependencies for a page. When a page export is triggered, the configuration template is used and both the page path and the design path are dynamically applied to the configuration. The zip file is then created by using the standard Content Sync functionality.

AEM embeds a few templates, including:

* A default one at `/etc/contentsync/templates/default`. This template:

    * Is the fallback template when no configuration template is found in the repository.
    * Can serve as a base for a new configuration template.

* One that is dedicated to the **Geometrixx** site, at `/etc/contentsync/templates/geometrixx`. This template can be used as an example to create a new one.

To create a page exporter configuration template:

1. In **CRXDE Lite**, create a node below `/etc/contentsync/templates`:

    * Name: e.g. `mysite`. The name appears in the page properties dialog when choosing the page exporter template.
    * Type: `nt:unstructured`

1. Below the template node, called here `mysite`, create a node structure using the configuration nodes described below.

### Page Exporter Configuration Nodes {#page-exporter-configuration-nodes}

The configuration template consists in a node structure. Each node has a `type` property that defines a specific action in the creation process of the zip file. For more details about the type property, refer to the Overview of configuration types section in the Content Sync framework page.

The following nodes can be used to build an export configuration template:

**page node** The page node is used to copy the page html to the zip file. It has the following characteristics:

* Is a mandatory node.
* Is located below `/etc/contentsync/templates/<sitename>`.
* Its name is `page`. 
* Its node type is `nt:unstructured`

The `page` node has the following properties:

* A `type` property set with the value `pages`.

* It does not have a `path` property as the current page path is dynamically copied to the configuration.  

* The other properties are described in the Overview of configuration types section of the Content Sync framework.

**rewrite node** The rewrite node defines how the links are rewritten in the exported page. The rewritten links can either point to the files included in the zip file or to the resources on the server.

Please refer to the Content Sync page for a complete description of the `rewrite` node.

**design node** The design node is used to copy the design used for the exported page. It has the following characteristics:

* Is optional.  
* Is located below `/etc/contentsync/templates/<sitename>`.
* Its name is `design`. 
* Its node type is `nt:unstructured`.

The `design` node has the following properties:

* A `type` property set to the value `copy`.

* It does not have a `path` property as the current page path is dynamically copied to the configuration.

**generic node** A generic node is used to copy resources like clientlibs .js or .css files to the zip file. It has the following characteristics:

* Is optional.  
* Is located below `/etc/contentsync/templates/<sitename>`.
* Does not have a specific name.  
* Its node type is `nt:unstructured`.
* Has a `type` property and any `type` related properties as defined in the Overview of configuration types section of the Content Sync framework.

For example the following configuration node copies the geometrixx clientlibs .js files to the zip file:

```xml
"geometrixx.clientlibs.js": {
    "extension": "js",
    "type": "clientlib",
    "path": "/etc/designs/geometrixx/clientlibs",
    "jcr:primaryType": "nt:unstructured"
}
```

The **Geometrixx** page export configuration template shows you how a page export can be configured. To view the node structure of the template in your browser as json format, request the following URL:

`http://localhost:4502/etc/contentsync/templates/geometrixx.-1.json`

**Implementing a Custom Configuration**

As you may have noticed in the node structure, the **Geometrixx** page export configuration template has a `logo` node with a `type` property set to `image`. This is a special configuration type that has been created to copy the image logo to the zip file. To meet some specific requirements, you may need to implement a custom `type` property: to do so, refer to the Implementing a custom update handler section in the Content Sync page.

## Programmatically Exporting a Page {#programmatically-exporting-a-page}

To programmatically export a page, you can use the [PageExporter](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/javadoc/index.html?com/day/cq/wcm/contentsync/PageExporter.html) OSGI service. This service allows you to:

* Export a page and write to the HTTP servlet response.
* Export a page and save the zip file at a specific location.

The servlet that is bound to the `export` selector and the `zip` extension uses the PageExporter service.

## Troubleshooting {#troubleshooting}

If you experience a problem with the download of the zip file, you may delete the `/var/contentsync` node in the repository and send the export request again.  

