---
title: The Page Exporter
description: Learn how to use the Adobe Experience Manager (AEM) Page Exporter.
exl-id: 15d08758-cf75-43c0-9818-98a579d64183
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Admin
---
# The Page Exporter{#the-page-exporter}

Adobe Experience Manager (AEM) lets you export a page as a complete web page including images, `.js`, and `.css` files.

When configured, you request a page export from your browser by replacing `html` with `export.zip` in the URL. This generates an archive (zip) file, containing the rendered page in html format, together with the referenced assets. All the paths in the page (for example, paths to images) are rewritten to point to either the files included in the archive, or to the resources on the server. The archive (zip) file can then be downloaded from your browser.

>[!NOTE]
>
>Depending on your browser, and the settings, the download is either:
>
>* an archive file (`<page-name>.export.zip`) 
>* a folder (`<page-name>`); effectively the archive file already expanded

## Exporting a Page {#exporting-a-page}

The following steps describe how to export a page, and assume that an export template exists for your site. An export template defines the way that a page is exported and is specific to your site. To create an export template, see [Creating a Page Exporter Configuration for your Site](#creating-a-page-exporter-configuration-for-your-site).

To export a page:

1. Navigate to the required page in the **Sites** console.

1. Select the page, then open the **Properties** dialog.

1. Select the **Advanced** tab.

1. Expand the **Export** field to select an export template. 
   Select the required template for your site, then confirm with **OK**.

1. Select **Save & Close** to close the page properties dialog.

1. Request the page for export, replacing the suffix `html` with `export.zip` in the URL.

   For example:
   * localhost:4502/content/we-retail/language-masters/en.html

   Accessed by way of:
   * localhost:4502/content/we-retail/language-masters/en.export.zip

1. Download the archive file to your file system.

1. In your file system, unzip the file if necessary. When expanded, there is a folder with the same name as the selected page. This folder contains:

   * the subfolder `content`, which is the root of a series of subfolders that reflect the path to the page in the repository

     * within this structure there is the html file for the selected page (`<page-name>.html`)

   * other resources (`.js` files, `.css` files, images, and so on) are located according to the settings in the export template

1. Open the page html file (`<unzip-dir>/<path>/<to>/<page>/<page-path>.html`) in your browser so you can check the rendering.

## Creating a Page Exporter Configuration for your Site {#creating-a-page-exporter-configuration-for-your-site}

The page exporter is based on the [Content Sync framework](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/contentsync/package-summary.html). The configurations that are available in the **Page Properties** dialog are export templates that define the required dependencies for a page. 

When a page export is triggered, the export template is referenced. Both the page path and the design path are dynamically applied. The zip file is then created by using the standard Content Sync functionality.

An out-of-the-box AEM installation includes a default template under `/etc/contentsync/templates/default`. 

* This template is the fallback template when no export template is found in the repository.

* The `default` template shows you how a page export can be configured, so can serve as a base for a new export template.

* To view the node structure of the template in your browser as JSON format, request the following URL:
  `http://localhost:4502/etc/contentsync/templates/default.json`

The easiest method to create a page exporter template is to:

* copy the `default` template, 

* assign a new name, appropriate to your site, 

* then make the required updates. 
  
To create a completely new template:

1. In **CRXDE Lite**, create a node below `/etc/contentsync/templates`:

   * `Name`: a name appropriate to your site; for example, `<mysite>`. The name appears in the page properties dialog when choosing the page exporter template.

   * `Type`: `nt:unstructured`

2. Below the template node, called here `mysite`, create a node structure using the configuration nodes described below.

## Activating a Page Exporter Template for your Pages {#activating-a-page-exporter-configuration-for-your-pages}

When your template is configured, make it available:

1. In CRXDE navigate to the required page in the `/content` branch. This can be an individual page, or the root page of a subtree.

1. On the `jcr:content` node of the page, create the property:
   * `Name`: `cq:exportTemplate`
   * `Type`: `String`
   * `Value`: path to the template; for example: `/etc/contentsync/templates/mysite`

### Page Exporter Configuration Nodes {#page-exporter-configuration-nodes}

The template consists of a node structure, as it uses the [Content Sync framework](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/contentsync/package-summary.html). Each node has a `type` property that defines a specific action in the creation process of the zip file. 

<!-- For more details about the type property, see the Overview of configuration types section in the Content Sync framework page.
-->

The following nodes can be used to build an export template:

* `page` 
  The page node is used to copy the page html to the zip file. It has the following characteristics:

  * A mandatory node.
  * Located below `/etc/contentsync/templates/<mysite>`.
  * Defined with the property `Name`set to `page`.
  * Node type is `nt:unstructured`

  The `page` node has the following properties:

  * A `type` property set with the value `pages`.

  * It does not have a `path` property as the current page path is dynamically copied to the configuration.
  <!--
  * The other properties are described in the Overview of configuration types section of the Content Sync framework.
  -->

* `rewrite` 
  The rewrite node defines how the links are rewritten in the exported page. The rewritten links can either point to the files included in the zip file or to the resources on the server.
  <!-- See the Content Sync page for a complete description of the `rewrite` node. -->

* `design` 
  The design node is used to copy the design used for the exported page. It has the following characteristics:

  * Optional.
  * Located below `/etc/contentsync/templates/<mysite>`.
  * Defined with the property `Name` set to `design`.
  * Node type is `nt:unstructured`.

  The `design` node has the following properties:

  * A `type` property set to the value `copy`.

  * It does not have a `path` property, as the current page path is dynamically copied to the configuration.

* `generic`
  A generic node is used to copy resources like clientlibs `.js` or `.css` files to the zip file. It has the following characteristics:

  * Optional.
  * Located below `/etc/contentsync/templates/<mysite>`.
  * No specific name.
  * Node type is `nt:unstructured`.
  * Has a `type` property and `type` related properties. <!--Has a `type` property and any `type` related properties as defined in the Overview of configuration types section of the Content Sync framework.-->

  For example, the following configuration node copies the `mysite.clientlibs.js` files to the zip file:

  ```xml
  "mysite.clientlibs.js": {
      "extension": "js",
      "type": "clientlib",
      "path": "/etc/designs/mysite/clientlibs",
      "jcr:primaryType": "nt:unstructured"
  }
  ```

**Implementing a Custom Configuration**

Custom configurations are also possible. 

<!--
As you may have noticed in the node structure, the **Geometrixx** page export template has a `logo` node with a `type` property set to `image`. This is a special configuration type that has been created to copy the image logo to the zip file. 
-->

To meet some specific requirements, implement a [custom update handler](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/contentsync/handler/package-summary.html).

<!-- To meet some specific requirements, you may need to implement a custom `type` property. To do so, see the Implementing a custom update handler section in the Content Sync page.
-->

## Programmatically Exporting a Page {#programmatically-exporting-a-page}

To programmatically export a page, you can use the [PageExporter](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/index.html?com/day/cq/wcm/contentsync/PageExporter.html) OSGI service. This service lets you:

* Export a page and write to the HTTP servlet response.
* Export a page and save the zip file at a specific location.

The servlet that is bound to the `export` selector and the `zip` extension uses the PageExporter service.

## Troubleshooting {#troubleshooting}

If you experience a problem with the download of the zip file, you may delete the `/var/contentsync` node in the repository and send the export request again.
