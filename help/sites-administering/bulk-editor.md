---
title: The Bulk Editor
description: Learn how to use the Bulk Editor for efficient editing when the visual page context is not needed.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
docset: aem65
exl-id: c63e044c-4d2a-44d3-853b-8e7337e1ee03
solution: Experience Manager, Experience Manager Sites
feature: Configuring
role: Admin
---

# The Bulk Editor{#the-bulk-editor}

The Bulk Editor allows for efficient editing when the visual page context is not needed as it lets you:

* search for (and display) content from multiple pages; this is done using GQL (Google Query Language)
* edit this content directly in the Bulk Editor
* save the changes (to the originating pages)
* export this content to a tab-separated (.tsv) spreadsheet file

>[!NOTE]
>
>You can also import content into the repository, but by default this is disabled for the Bulk Editor as available in the **Tools** console.

This section describes how to work with the Bulk Editor in the **Tools** console. Typically, administrators use the Bulk Editor to search and edit multiple items. This is done by populating the table using a GQL query and then by selecting the content items to work on. Authors generally use the Bulk Editor as part of a customized Bulk Editor application accessible through the [product listing](/help/sites-authoring/default-components.md#productlist) component.

>[!CAUTION]
>
>With the [deprecation of the Classic UI](/help/release-notes/deprecated-removed-features.md) in AEM 6.4, the Bulk Editor has also been deprecated and thus Adobe does not plan to further enhance the Bulk Editor.

## Example Use Case for the Bulk Editor {#example-use-case-for-the-bulk-editor}

For example, if you need all the names and email addresses of users who filled out a particular survey, the Bulk Editor can provide that information and you can export it into a spreadsheet.

An example to illustrate such a use case is included in the Geometrixx web site:

1. Navigate to the **Support** page and then to the **Customer Service Satisfaction** survey.
1. **Edit** the **Start of Form** paragraph. In the dialog box, click the **Advanced** tab, expand the **Action Configuration**, then click **View Data...**.

   ![Customer satisfaction survey example](assets/custsatsurvey.png)

1. The Bulk Editor is fully customizable, though in this example the Bulk Editor does not allow users to edit the content, but only lets them export the information to a spreadsheet.

   ![Bulk editor console](assets/bulkeditor.png)

## How to Use the Bulk Editor {#how-to-use-the-bulk-editor}

The Bulk Editor lets you:

* [search for content based on query parameters, to display specified properties of the results in columns, to edit this content and save the changes](#searching-and-editing-content)
* [to export this content to a tab-separated spreadsheet](#exporting-content)

* [to import content from a tab-separated spreadsheet](#importing-content)

### Searching and Editing Content {#searching-and-editing-content}

To use the Bulk Editor to edit multiple items simultaneously:

1. In the **Tools** console, click the **Importers** folder to expand it.
1. Double-click the **Bulk Editor**.
1. Enter your selection requirements:

<table>
 <tbody>
  <tr>
   <td>Field</td>
   <td>Property</td>
  </tr>
  <tr>
   <td>Root Path</td>
   <td>Indicates the root path the Bulk Editor searches.<br /> For example, <code>/content/geometrixx/en</code>. The Bulk Editor searches over all child nodes.</td>
  </tr>
  <tr>
   <td>Query Parameters</td>
   <td>Using GQL parameters, enter the search string you want the Bulk Editor to look for in the repository. For example, <code>type:Page</code> looks for all pages in the root path, <code>text:professional</code> looks for all pages that have the word "professional" in them, and <code>"jcr:title":English</code> looks for all pages that have "English" as the title. You can only search for strings.</td>
  </tr>
  <tr>
   <td>Content Mode check box</td>
   <td>Select this check box so you can read properties within the <code>jcr:content</code> subnode of the search results if exists. Use for pages only. Property names are prefixed with <code>"jcr:content/"</code></td>
  </tr>
  <tr>
   <td>Properties/Columns</td>
   <td>Select the check boxes for the properties that you want the Bulk Editor to return. The properties you select are the column heads in the results pane. By default, the node path is displayed in the results.</td>
  </tr>
  <tr>
   <td>Custom Properties/Columns</td>
   <td>Enter any other properties that are not listed in the <strong>Properties/Columns</strong> field. These custom properties appear in the results pane. You can add multiple properties by using a comma to separate properties. <i>Note:</i> If you add a custom property that does not yet exist, AEM WCM displays an empty cell. When you modify the empty cell and save it, the property is added to the node. The newly created property must respect node type constraints and property namespaces.</td>
  </tr>
 </tbody>
</table>

   For example:

   ![Bulk editor filter options](assets/searchfilter.png)

1. Click **Search**. The Bulk Editor displays the results.
   For the example above, all the pages that meet your search criteria are returned and displayed with the requested columns.

   ![Bulk editor results](assets/chlimage_1-39.png)

1. Double-click a cell so you can make any changes.

   ![Editing in bulk](assets/srchresultedit.png)

1. Click **Save** to save your changes (the **Save** button is activated after you have edited a cell).

   >[!CAUTION]
   >
   >The changes you make here are written to the repository content; for example, the page referenced in **Path**.

#### Additional GQL Query Parameters {#additional-gql-query-parameters}

* **path:** only search nodes below this path. If you specify more than one term with a path prefix, only the last one is considered.
* **type:** only return nodes of the given node type. This includes primary and mixin types. You may specify multiple comma-separated node types. GQL returns nodes that are of any of the specified types.
* **order:** order the result by the given properties. You may specify multiple comma-separated property names. To order the result in descending order simply prefix the property name with a minus. For example, order:-name. Using a plus sign returns the result in ascending order, which is also the default.
* **limit:** limits the number of results using an interval. For example, limit:10..20 The interval is zero-based, start is inclusive, and end is exclusive. You may also specify an open `interval:limit:10..` or `limit:..20` 
If the dots are omitted and only one value is specified, GQL returns at most this number of results. For example, `limit:10` (returns the first ten results).

### Exporting Content {#exporting-content}

If necessary, export content into an Excel spreadsheet to make any changes. For example, you may want to export a mailing list and change the area code of all the listed phone numbers directly in Excel, or add additional lines.

To export content:

1. Search for content as described in [Searching and Editing Content](#searching-and-editing-content).
1. Click **Export** so you can export the changes into a tab-separated Excel spreadsheet. AEM WCM asks you where you want to download the file.

   >[!NOTE]
   >
   >By default, changes are encoded in [Windows-1252](https://en.wikipedia.org/wiki/Windows-1252) (also known as CP-1252). You can check UTF-8 to export the changes in UTF-8.

   ![Exporting results](assets/srchrsesultexport.png)

1. Select the location and confirm that you want to download the file.
1. After you download the file, you can open it from your spreadsheet program, for example, Microsoft&reg; Excel. The spreadsheet program imports the file and converts it to a spreadsheet format.

   ![Exported results in a spreadsheet](assets/exportinexcel.png)

### Importing Content {#importing-content}

By default the import functionality is hidden when you open the Bulk Editor. Simply adding the parameter `hib=false` to the URL displays the **Import** button on the Bulk Editor page. You can import content from any tab-separated ( `.tsv`) file. For importing to work properly, the column headings (first row of cells) must match the column headings of the table you are importing to.

>[!NOTE]
>
>When you reimport content, you erase any previous content for those nodes. Be careful not to overwrite important information.

To import content:

1. Open the Bulk Editor.
1. Add `?hib=false` to the URL, for example:
   `https://localhost:4502/etc/importers/bulkeditor.html?hib=false`
1. Click **Import**.
1. Select the `.tsv` file. The data are imported into the repository.
