---
title: Searching for forms and assets

description: You can search forms and assets in your AEM instance using AEM search. Basic and advanced search lets you quickly locate your assets.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-manager

docset: aem65

role: "Admin,User"
exl-id: 1f4f49b7-5f32-47dd-9dc7-a6974faf2bdf
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Searching for forms and assets{#searching-for-forms-and-assets}

You can search for your forms or form assets, using a text string or text string along with wildcards. You can also narrow your search using the criteria available in various categories in the Search panel.

When you select one or more criteria and also specify a text string, the intersection of the text and criteria are returned as search results. The search results are as good as the form and asset metadata provided.

Click ![aem6forms_search](assets/aem6forms_search.png), to show or hide the search panel.

## Basic search {#basic-search}

A basic search is the default search, run without specifying any filters. A full text search on metadata properties is conducted by AEM Forms.

To run a basic search, enter the search query in the text field and hit return. You can also enter the wildcard character (&#42;) to match any number of characters.

Adobe Experience Manager searches for the entered text in metadata properties and returns the corresponding results. If you type more than one word, the search operation matches the complete text for searching.

Note the following points about the basic search:

* Search is conducted using the form and asset metadata properties.
* If you type more than one word, the search operation matches the complete text for searching.
* Search is not case sensitive. For example, when you type `geometrixx`, assets with titles `Geometrixx`, `GEOMETRIXX`, and `GeoMetRixx` are displayed in the search results.

* Partial matches of a word are not supported. To search by using partial strings, use &#42; wildcard. However, if the search query matches a complete word, the corresponding form or asset is displayed.
* Extra spaces are respected and are not trimmed during search. For example, `My form` is not the same search query as `My form`.

* If the data and display values of the fields in metadata properties are different, you cannot use display values as search parameters. For example, you cannot search based on a status, such as Modified or Published, since these properties are stored in a different format.

## Advanced search {#advanced-search}

In the search criteria, besides the query you can specify some search parameters to make the basic search more efficient and focused.

![Search field and parameters or filters for AEM form and asset search](assets/search_forms_assets.png)

Search field and parameters or filters for AEM form and asset search

### Asset Path {#asset-path}

By using asset path filter, you can limit the search results to the current directory. If the Search In Current Directory option is not selected, the search results contain assets from the base directory. If the current page is not a directory and the ‘search in current directory’ option is selected, then the search returns the assets present in the parent directory.

### Asset Modification {#asset-modification}

Select one of the following options, to search across all the assets modified within a specific time period.

| **Option** |**Description** |
|---|---|
| Two hours ago |Search across all the assets that were modified within the last two hours. |
| A week ago |Search across all the assets that were modified within the last one week. |
| A month ago |Search across all assets that were modified within the last one month. |
| A year ago |Search across all assets that are modified within the last one year. |

### Asset Status {#asset-status}

You can search for assets using one of the following statuses:

* **Published**: Search all assets that are published and not modified after the publishing.  

* **Unpublished**: Search all assets that are never published.  

* **Modified**: Search all assets that are modified or unpublished after the publishing.

### Asset Type {#asset-type}

You can select any number of asset types. The search returns the union of all the selected asset types.

<table>
 <tbody>
  <tr>
   <th>Option</th> 
   <th>Description</th> 
  </tr>
  <tr>
   <td>Form Template<br /> </td> 
   <td>Search across all the form templates.<br /> </td> 
  </tr>
  <tr>
   <td>PDF Form</td> 
   <td>Search across all the PDF documents.</td> 
  </tr>
  <tr>
   <td>Document</td> 
   <td>Search across all the documents.</td> 
  </tr>
  <tr>
   <td>Adaptive Form<br /> </td> 
   <td>Search across all the adaptive forms.</td> 
  </tr>
  <tr>
   <td>Resource</td> 
   <td>Search across all the resources.<br /> </td> 
  </tr>
 </tbody>
</table>

### Tags {#tags}

Tags are labels attached to assets for identification. When searching, select any number of tags from the drop-down or add custom tags, if necessary. A search result contains the intersection of the selected tags.
