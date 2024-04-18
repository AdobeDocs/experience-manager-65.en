---
title: Developing the Bulk Editor
description: Tagging allows content to be categorized and organized
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
exl-id: 8753aaab-959f-459b-bdb6-057cbe05d480
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Developing the Bulk Editor{#developing-the-bulk-editor}

This section describes how to develop the Bulk Editor tool and how to extend the Product List component, which is based on the Bulk Editor.

## Bulk Editor Query Parameters {#bulk-editor-query-parameters}

When working with the Bulk Editor, there are several query parameters that you can add to the URL to call the Bulk Editor with a specific configuration. If you want the Bulk Editor to always be used with a certain configuration, for example, as in the Product List component, then you must edit `bulkeditor.jsp` (in /libs/wcm/core/components/bulkeditor) or create a component with the specific configuration. Changes made using query parameters are not permanent.

For example, if you type the following in your browser's URL:

`https://<servername><port_number>/etc/importers/bulkeditor.html?rootPath=/content/geometrixx/en&queryParams=geometrixx&initialSearch=true&hrp=true`

The Bulk Editor displays without the **Root Path** field as hrp=true hides the field. With the parameter hrp=false, the field is displayed (the default value).

The following is a list of the Bulk Editor query parameters:

>[!NOTE]
>
>Each parameter can have a long and a short name. For example, the long name for the search root path is `rootPath`, the short one is `rp`. If the long name is not defined, the short one is read from the request.

<table>
 <tbody>
  <tr>
   <td> </td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td><p> Parameter</p> <p>(long name / short name)<br /> </p> </td>
   <td> Type <br /> </td>
   <td> Description <br /> </td>
  </tr>
  <tr>
   <td> rootPath / rp<br /> </td>
   <td> String </td>
   <td> search root path</td>
  </tr>
  <tr>
   <td> queryParams / qp<br /> </td>
   <td> String</td>
   <td> search query</td>
  </tr>
  <tr>
   <td> contentMode / cm<br /> </td>
   <td> Boolean</td>
   <td> when true, the content mode is enabled<br /> </td>
  </tr>
  <tr>
   <td> colsValue / cv<br /> </td>
   <td> String[]</td>
   <td> searched properties (checked values from colsSelection displayed as checkboxes)</td>
  </tr>
  <tr>
   <td> extraCols / ec<br /> </td>
   <td> String[]</td>
   <td> extra searched properties (displayed in a comma-separated text field)</td>
  </tr>
  <tr>
   <td> initialSearch / is<br /> </td>
   <td> Boolean</td>
   <td> when true, the query is performed on page load<br /> </td>
  </tr>
  <tr>
   <td> colsSelection / cs<br /> </td>
   <td> String[]</td>
   <td> searched properties selection (displayed as checkboxes)</td>
  </tr>
  <tr>
   <td> showGridOnly / sgo<br /> </td>
   <td> Boolean</td>
   <td> when true, shows only the grid and not the search panel <br /> </td>
  </tr>
  <tr>
   <td> searchPanelCollapsed / spc</td>
   <td> Boolean</td>
   <td> when true, search panel is collapsed on load</td>
  </tr>
  <tr>
   <td> hideRootPath / hrp</td>
   <td> Boolean</td>
   <td> when true, hides the root path field</td>
  </tr>
  <tr>
   <td> hideQueryParams / hqp</td>
   <td> Boolean</td>
   <td> when true, hides the query field</td>
  </tr>
  <tr>
   <td> hideContentMode / hcm</td>
   <td> Boolean</td>
   <td> when true, hides the content mode field</td>
  </tr>
  <tr>
   <td> hideColsSelection / hcs</td>
   <td> Boolean</td>
   <td> when true, hides the columns selection field</td>
  </tr>
  <tr>
   <td> hideExtraCols / hec</td>
   <td> Boolean</td>
   <td> when true, hides the extra columns field</td>
  </tr>
  <tr>
   <td> hideSearchButton</td>
   <td> Boolean</td>
   <td> when true, hides the search button</td>
  </tr>
  <tr>
   <td> hideSaveButton / hsavep</td>
   <td> Boolean</td>
   <td> when true, hides the save button</td>
  </tr>
  <tr>
   <td> hideExportButton / hexpb</td>
   <td> Boolean</td>
   <td> when true, hides the export button</td>
  </tr>
  <tr>
   <td> hideImportButton / hib</td>
   <td> Boolean</td>
   <td> when true, hides the import button</td>
  </tr>
  <tr>
   <td> hideResultNumber / hrn</td>
   <td> Boolean</td>
   <td> when true, hides the grid search result number text</td>
  </tr>
  <tr>
   <td> hideInsertButton / hinsertb</td>
   <td> Boolean</td>
   <td> when true, hides the grid insert button</td>
  </tr>
  <tr>
   <td> hideDeleteButton / hdelb</td>
   <td> Boolean</td>
   <td> when true, hides the grid delete button</td>
  </tr>
  <tr>
   <td> hidePathCol / hpc</td>
   <td> Boolean</td>
   <td> when true, hides the grid "path" column</td>
  </tr>
 </tbody>
</table>

### Developing a Bulk Editor based Component: the Product List Component {#developing-a-bulk-editor-based-component-the-product-list-component}

This section provides an overview of how to use the Bulk Editor and gives a description of the existing Geometrixx component based on the Bulk Editor: the Product List component.

The Product List component lets users display and edit a table of data. For example, you can use the Product List component to represent products in a catalog. The information is presented in a standard HTML table and any editing is performed in the **Edit** dialog box, which contains a BulkEditor widget. (This Bulk Editor is the same as the one accessible at /etc/importers/bulkeditor.html or through the Tools menu). The Product List component has been configured for specific, limited Bulk Editor functionality. Every part of the Bulk Editor (or components derived from the Bulk Editor) can be configured.

With the Bulk Editor, you can add, modify, delete, filter, and export the rows, save modifications, and import a set of rows. Every row is stored as a node under the Product List component instance itself. Every cell is a property of each node. This is a design choice and it can easily be changed, for example, you could store nodes somewhere else in the repository. The query servlet's role is to return the list of the nodes to display; the search path is defined as a Product List instance.

The source code of the Product List component is available in the repository at /apps/geometrixx/components/productlist and is composed of several parts like all Adobe Experience Manager (AEM) components:

* HTML rendering: the rendering is done in a JSP file (/apps/geometrixx/components/productlist/productlist.jsp). The JSP reads the subnodes of the current Product List component and displays each of them as a row of an HTML table.
* Edit dialog, which is where you define the Bulk Editor configuration. Configure the dialog to match the needs of the component: columns available and possible actions performed on the grid or on the search. See [Bulk Editor configuration properties](#bulk-editor-configuration-properties) for information on all the configuration properties.

Here is an XML representation of the dialog sub nodes:

```xml
        <editor
            jcr:primaryType="cq:Widget"
            colsSelection="[ProductId,ProductName,Color,CatalogCode,SellingSku]"
            colsValue="[ProductId,ProductName,Color,CatalogCode,SellingSku]"
            contentMode="false"
            exportURL="/etc/importers/bulkeditor/export.tsv"
            extraCols="Selection"
            hideColsSelection="false"
            hideContentMode="true"
            hideDeleteButton="false"
            hideExportButton="false"
            hideExtraCols="true"
            hideImportButton="false"
            hideInsertButton="false"
            hideMoveButtons="false"
            hidePathCol="true"
            hideRootPath="true"
            hideSaveButton="false"
            hideSearchButton="false"
            importURL="/etc/importers/bulkeditor/import"
            initialSearch="true"
            insertedResourceType="geometrixx/components/productlist/sku"
            queryParams=""
            queryURL="/etc/importers/bulkeditor/query.json"
            saveURL="/etc/importers/bulkeditor/save"
            xtype="bulkeditor">
            <saveButton
                jcr:primaryType="nt:unstructured"
                text="Save modifications"/>
            <searchButton
                jcr:primaryType="nt:unstructured"
                text="Apply filter"/>
            <queryParamsInput
                jcr:primaryType="nt:unstructured"
                fieldDescription="Enter here your filters"
                fieldLabel="Filters"/>
            <searchPanel
                jcr:primaryType="nt:unstructured"
                height="200">
                <defaults
                    jcr:primaryType="nt:unstructured"
                    labelWidth="150"/>
            </searchPanel>
            <grid
                jcr:primaryType="nt:unstructured"
                height="275"/>
            <store jcr:primaryType="nt:unstructured">
                <sortInfo
                    jcr:primaryType="nt:unstructured"
                    direction="ASC"
                    field="CatalogCode"/>
            </store>
            <colModel
                jcr:primaryType="nt:unstructured"
                width="150"/>
            <colsMetadata jcr:primaryType="nt:unstructured">
                <Selection
                    jcr:primaryType="nt:unstructured"
                    checkbox="true"
                    forcedPosition="0"
                    headerText=""/>
                <ProductId
                    jcr:primaryType="nt:unstructured"
                    cellCls="productlist-cell-productid"
                    headerText="Product Id"/>
                <ProductName
                    jcr:primaryType="nt:unstructured"
                    cellStyle="background-color: #FFCC99;"
                    headerText="Product Name"/>
                <CatalogCode
                    jcr:primaryType="nt:unstructured"
                    cellStyle="background-color: #EDEDED;"
                    headerText="Catalog Code"/>
                <Color jcr:primaryType="nt:unstructured">
                    <editor
                        jcr:primaryType="nt:unstructured"
                        store="[Blue,Red,Yellow]"
                        triggerAction="all"
                        typeAhead="true"
                        xtype="combo"/>
                </Color>
                <SellingSku
                    jcr:primaryType="nt:unstructured"
                    headerText="Sku Id"/>
            </colsMetadata>
        </editor>
```

### Bulk Editor Configuration Properties {#bulk-editor-configuration-properties}

Every part of the Bulk Editor can be configured. The following table lists all the configuration properties for the Bulk Editor.

<table>
 <tbody>
  <tr>
   <td>Property name</td>
   <td>Definition</td>
  </tr>
  <tr>
   <td>rootPath</td>
   <td>Search root path</td>
  </tr>
  <tr>
   <td>queryParams</td>
   <td>Search query</td>
  </tr>
  <tr>
   <td>contentMode</td>
   <td>True to enable content mode: properties are read on jcr:content node and not on search result node</td>
  </tr>
  <tr>
   <td>colsValue</td>
   <td>Searched properties (checked values from colsSelection displayed as checkboxes)</td>
  </tr>
  <tr>
   <td>extraCols</td>
   <td>Extra searched properties (displayed in a textfield comma-separated)</td>
  </tr>
  <tr>
   <td>initialSearch</td>
   <td>True to perform query on page load</td>
  </tr>
  <tr>
   <td>colsSelection</td>
   <td>Searched properties selection (displayed as checkboxes)</td>
  </tr>
  <tr>
   <td>showGridOnly</td>
   <td>True to show only the grid and not the search panel (do not forget to set the initialSearch to true)</td>
  </tr>
  <tr>
   <td>searchPanelCollapsed</td>
   <td>True to collapse search panel by default</td>
  </tr>
  <tr>
   <td>hideRootPath</td>
   <td>Hide root path field</td>
  </tr>
  <tr>
   <td>hideQueryParams</td>
   <td>Hide query field</td>
  </tr>
  <tr>
   <td>hideContentMode</td>
   <td>Hide content mode field</td>
  </tr>
  <tr>
   <td>hideColsSelection</td>
   <td>Hide cols selection field</td>
  </tr>
  <tr>
   <td>hideExtraCols</td>
   <td>Hide extra cols field</td>
  </tr>
  <tr>
   <td>hideSearchButton</td>
   <td>Hide search button</td>
  </tr>
  <tr>
   <td>hideSaveButton</td>
   <td>Hide save button</td>
  </tr>
  <tr>
   <td>hideExportButton</td>
   <td>Hide export button</td>
  </tr>
  <tr>
   <td>hideImportButton</td>
   <td>Hide import button</td>
  </tr>
  <tr>
   <td>hideResultNumber</td>
   <td>Hide grid search result number text</td>
  </tr>
  <tr>
   <td>hideInsertButton</td>
   <td>Hide grid insert button</td>
  </tr>
  <tr>
   <td>hideDeleteButton</td>
   <td>Hide grid delete button</td>
  </tr>
  <tr>
   <td>hidePathCol</td>
   <td>Hide grid "path" column</td>
  </tr>
  <tr>
   <td>queryURL</td>
   <td>Path to query servlet</td>
  </tr>
  <tr>
   <td>exportURL</td>
   <td>Path to export servlet</td>
  </tr>
  <tr>
   <td>importURL</td>
   <td>Path to import servlet</td>
  </tr>
  <tr>
   <td>insertedResourceType</td>
   <td>Resource type added to node when a row is inserted</td>
  </tr>
  <tr>
   <td>saveButton</td>
   <td>Save button widget config</td>
  </tr>
  <tr>
   <td>searchButton</td>
   <td>Search button widget config</td>
  </tr>
  <tr>
   <td>exportButton</td>
   <td>Export button widget config</td>
  </tr>
  <tr>
   <td>importButton</td>
   <td>Import button widget config</td>
  </tr>
  <tr>
   <td>searchPanel</td>
   <td>Search panel widget config</td>
  </tr>
  <tr>
   <td>grid</td>
   <td>Grid widget config</td>
  </tr>
  <tr>
   <td>store</td>
   <td>Store config</td>
  </tr>
  <tr>
   <td>colModel</td>
   <td>Grid column model config</td>
  </tr>
  <tr>
   <td>rootPathInput</td>
   <td>rootPath widget config</td>
  </tr>
  <tr>
   <td>queryParamsInput</td>
   <td>queryParams widget config</td>
  </tr>
  <tr>
   <td>contentModeInput</td>
   <td>contentMode widget config</td>
  </tr>
  <tr>
   <td>colsSelectionInput</td>
   <td>colsSelection widget config</td>
  </tr>
  <tr>
   <td>extraColsInput</td>
   <td>extraCols widget config</td>
  </tr>
  <tr>
   <td>colsMetadata</td>
   <td>Column metadata config. Possible properties are (applied to all cells of the column): <br />
    <ul>
     <li>cellStyle: html style </li>
     <li>cellCls: css class </li>
     <li>readOnly: true to not being able to change value </li>
     <li>checkbox: true to define all cells of the column as checkboxes (true/false values) </li>
     <li>forcedPosition: integer value to specify where column must be placed in grid (between 0&ndash;number of colums-1)<p><br /> </p> </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

### Columns Metadata Configuration {#columns-metadata-configuration}

You can configure for each column:

* display properties: html style, CSS class and read-only

* a checkbox
* a forced position

CSS and read-only columns

The Bulk Editor has three column configurations:

* Cell CSS class name (cellCls): a CSS class name that is added to each cell of the configured column.
* Cell style (cellStyle): an HTML style that is added to each cell of the configured column.
* Read only (readOnly): read only is set for each cell of the configured column.

The configuration must be defined as the following one:

```
"colsMetadata": {
"Column name": {
     "cellStyle": "html style",
     "cellCls": "CSS class",
     "readOnly": true/false
}
}
```

The following example can be found in the productlist component (/apps/geometrixx/components/productlist/dialog/items/editor/colsMetadata):

```xml
            <colsMetadata jcr:primaryType="nt:unstructured">
                <Selection
                    jcr:primaryType="nt:unstructured"
                    checkbox="true"
                    forcedPosition="0"
                    headerText=""/>
                <ProductId
                    jcr:primaryType="nt:unstructured"
                    cellCls="productlist-cell-productid"
                    headerText="Product Id"/>
                <ProductName
                    jcr:primaryType="nt:unstructured"
                    cellStyle="background-color: #FFCC99;"
                    headerText="Product Name"/>
                <CatalogCode
                    jcr:primaryType="nt:unstructured"
                    cellStyle="background-color: #EDEDED;"
                    headerText="Catalog Code"/>
                <Color jcr:primaryType="nt:unstructured">
                    <editor
                        jcr:primaryType="nt:unstructured"
                        store="[Blue,Red,Yellow]"
                        triggerAction="all"
                        typeAhead="true"
                        xtype="combo"/>
                </Color>
                <SellingSku
                    jcr:primaryType="nt:unstructured"
                    headerText="Sku Id"/>
            </colsMetadata>

```

**Checkbox**

If the checkbox configuration property is set to true, all the cells of the column are rendered as checkboxes. A checked box sends **true** to the server Save servlet, **false** otherwise. In the header menu, you can also **select all** or **select none**. These options are enabled if the selected header is the header of a checkbox column.

In the former example, the selection column contains only checkboxes as checkbox="true".

**Forced position**

The forced position metadata forcedPosition lets you specify where the column is placed within the grid: 0 is the first place and &lt;number of columns&gt;-1 is the last position. Any other value is ignored.

In the former example, the selection column is the first column as forcedPosition="0".

### Query Servlet {#query-servlet}

By default, the Query servlet can be found at `/libs/wcm/core/components/bulkeditor/json.java`. You can configure another path to retrieve the data.

The Query servlet works as follows: it receives a GQL query and the columns to return, computes the results, and sends the results back to the Bulk Editor as a JSON stream.

In the Product List component case, the two parameters sent to the Query servlet are as follows:

* query: "path:/content/geometrixx/en/customers/jcr:content/par/productlist Cube"
* cols: "Selection,ProductId,ProductName,Color,CatalogCode,SellingSku"

And the JSON stream is returned as follows:

```
{
  "hits": [{
      "jcr:path": "/content/geometrixx/en/products/jcr:content/par/productlist/1258674828905",
      "ProductId": "21",
      "ProductName": "Cube",
      "Color": "Blue",
      "CatalogCode": "43244",
      "SellingSku": "32131"
    }
  ],
  "results": 1
}
```

Each hit corresponds to one node and its properties, and is displayed as a row in the grid.

You can extend the Query servlet to return a complex inheritance model or return nodes stored at a specific logic place. The Query servlet can be used to do any kind of complex computation. The grid can then display rows that are an aggregate of several nodes in the repository. The modification and the saving of these rows must in that case be managed by the Save Servlet.

### Save Servlet {#save-servlet}

In the default configuration of the Bulk Editor each row is a node and the path of this node is stored in the row record. The Bulk Editor keeps the link between the row and the node through the jcr path. When a user edits the grid, a list of all the modifications is built. When a user clicks **Save**, a POST query is sent to each path with the updated properties values. This is the basis of the Sling concept and it works well if each cell is a property of the node. But if the Query servlet is implemented to do inheritance computation, this model cannot work as a property returned by the Query servlet can be inherited from another node.

The Save servlet concept is that the modifications are not directly posted to each node but that they are posted to one servlet that does the saving job. This gives this servlet the possibility to analyze the modifications and save the properties on the right node.

Each updated property is sent to the servlet in the following format:

* Parameter name: &lt;jcr path&gt;/&lt;property name&gt;

  Example: /content/geometrixx/en/products/jcr:content/par/productlist/1258674859000/SellingSku

* Value: &lt;value&gt;

  Example: 12123

The servlet needs to know where the catalogCode property is stored.

A default Save servlet implementation is available at /libs/wcm/bulkeditor/save/POST.jsp and is used in the Product List component. It takes all the parameters from the request (with a &lt;jcr path&gt;/&lt;property name&gt; format) and writes properties on nodes using the JCR API. It also creates node if they do not exist (grid inserted rows).

Do not use the default code as is because it reimplements what the server natively does (a POST on &lt;jcr path&gt;/&lt;property name&gt;) and is therefore only a good starting point for building a Save servlet that can manage a property inheritance model.
