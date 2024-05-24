---
title: Listing forms on a web page using APIs
description: Programmatically query Forms Manager to retrieve a filtered list of forms and display on your own web pages.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: publish
exl-id: cfca6656-d2db-476d-a734-7a1d1e44894e
solution: Experience Manager, Experience Manager Forms
feature: Forms Portal
role: Admin, User, Developer
---
# Listing forms on a web page using APIs {#listing-forms-on-a-web-page-using-apis}

AEM Forms provides a REST-based search API that web developers can use to query and retrieve a set of forms that meets the search criteria. You can use APIs to search forms based on various filters. The response object contains form attributes, properties, and render end points of forms.

To search forms using the REST API, send a GET request to the server at `https://'[server]:[port]'/libs/fd/fm/content/manage.json` with query parameters described below.

## Query parameters {#query-parameters}

<table>
 <tbody>
  <tr>
   <td><strong>Attribute name<br /> </strong></td>
   <td><strong>Description<br /> </strong></td>
  </tr>
  <tr>
   <td>func<br /> </td>
   <td><p>Specifies the function to call. To search forms, set value of the <code>func </code>attribute to <code>searchForms</code>.</p> <p>For example, <code class="code">
       URLParameterBuilder entityBuilder=new URLParameterBuilder ();
       entityBuilder.add("func", "searchForms");</code></p> <p><strong>Note:</strong> <em>This parameter is mandatory.</em><br /> </p> </td>
  </tr>
  <tr>
   <td>appPath<br /> </td>
   <td><p>Specifies the application path to search for forms. By default, the appPath attribute searches all the applications available at the root node level.<br /> </p> <p>You can specify multiple application paths in a single search query. Separate multiple paths with pipe (|) character. </p> </td>
  </tr>
  <tr>
   <td>cutPoints<br /> </td>
   <td><p>Specifies the properties to fetch with the assets. You can use asterisk (*) to fetch all the properties at once. Use the pipe (|) operator to specify multiple properties. </p> <p>For example, <code>cutPoints=propertyName1|propertyName2|propertyName3</code></p> <p><strong>Note</strong>: </p>
    <ul>
     <li><em>Properties such as id, path, and name are always fetched. </em></li>
     <li><em>Every asset has a different set of properties. Properties such as formUrl, pdfUrl, and guideUrl do not depend on the cutpoints attribute. These properties depend on the asset type and are fetched accordingly. </em></li>
    </ul> </td>
  </tr>
  <tr>
   <td>relation<br /> </td>
   <td>Specifies the related assets to fetch along with the search results. You can choose one of the following options to fetch related assets:
    <ul>
     <li><strong>NO_RELATION</strong>: Do not fetch related assets.</li>
     <li><strong>IMMEDIATE</strong>: Fetches assets that are directly related to search results.</li>
     <li><strong>ALL</strong>: Fetch directly and indirectly related assets.</li>
    </ul> </td>
  </tr>
  <tr>
   <td>maxSize</td>
   <td>Specifies the maximum number of forms to fetch.</td>
  </tr>
  <tr>
   <td>offset</td>
   <td>Specifies the number of forms to skip from the start.</td>
  </tr>
  <tr>
   <td>returnCount</td>
   <td>Specifies whether to return the search results that match the given criteria or not. </td>
  </tr>
  <tr>
   <td>statements</td>
   <td><p>Specifies the list of statements. The queries are executes on the list of the statements specified in the JSON format. </p> <p>For example,</p> <p><code class="code">JSONArray statementArray=new JSONArray();
       JSONObject statement=new JSONObject();
       statement.put("name", "title");
       statement.put("value", "SimpleSurveyAF");
       statement.put("operator", "EQ"); statementArray.put(statement);</code></p> <p>In the above example, </p>
    <ul>
     <li><strong>name</strong>: specifies the name of the property to search for.</li>
     <li><strong>value</strong>: specifies the value of the property to search for.</li>
     <li><strong>operator</strong>: specifies the operator to apply while searching. The following operators are supported:
      <ul>
       <li>EQ - Equal to </li>
       <li>NEQ - Not equal to</li>
       <li>GT - Greater than</li>
       <li>LT - Less than</li>
       <li>GTEQ - Greater than or equal to</li>
       <li>LTEQ - Less than or equal to</li>
       <li>CONTAINS - A contains B if B is a part of A</li>
       <li>FULLTEXT - Full text search</li>
       <li>STARTSWITH - A starts with B if B is the beginning part of A</li>
       <li>ENDSWITH - A ends with B if B is the ending part of A</li>
       <li>LIKE - Implements the LIKE operator</li>
       <li>AND - Combine multiple statements</li>
      </ul> <p><strong>Note:</strong> <em>GT, LT, GTEQ, and LTEQ operators are applicable for properties of linear type such as LONG, DOUBLE, and DATE.</em></p> </li>
    </ul> </td>
  </tr>
  <tr>
   <td>orderings<br /> </td>
   <td><p>Specifies the order criteria for the search results. The criteria is defined in the JSON format. You can sort search results on more than one field. The results are sorted in the order as the fields appear in the query.</p> <p>For example,</p> <p>To retrieve query results ordered by title property in the ascending order, add following parameter: </p> <p><code class="code">JSONArray orderingsArray=new JSONArray();
       JSONObject orderings=new JSONObject();
       orderings.put("name", "title");
       orderings.put("criteria", "ASC");
       orderingsArray.put(orderings);
       entityBuilder.add("orderings", orderingsArray.toString());</code></p>
    <ul>
     <li><strong>name</strong>: Specifies the name of the property to use to order the search results.</li>
     <li><strong>criteria</strong>: Specifies the order of the results. The order attribute accepts following values:
      <ul>
       <li>ASC - Use ASC to arrange results in the ascending order.<br /> </li>
       <li>DES - Use DES to arrange results in the descending order.</li>
      </ul> </li>
    </ul> </td>
  </tr>
  <tr>
   <td>includeXdp</td>
   <td>Specifies whether to retrieve the binary content or not. The <code>includeXdp</code> attribute is applicable for assets of type <code>FORM</code>, <code>PDFFORM</code>, and <code>PRINTFORM</code>.</td>
  </tr>
  <tr>
   <td>assetType</td>
   <td>Specifies the asset types to retrieve from all the published assets. Use the pipe (|) operator to specify multiple asset types. Valid asset types are FORM, PDFFORM, PRINTFORM, RESOURCE, and GUIDE.</td>
  </tr>
 </tbody>
</table>

## Sample request {#sample-request}

```json
func : searchForms
appPath : /content/dam/formsanddocuments/MyApplication23
cutPoints : title|description|author|status|creationDate|lastModifiedDate|activationDate|expiryDate|tags|allowedRenderFormat|formmodel
relation : NO_RELATION
includeXdp : false
maxSize : 10
offset : 0
returnCount : true
statements: [{"name":"name","value":"*Claim.xdp","operator":"CONTAINS"},
                {"name":"","value":"Expense","operator":"FULLTEXT"},
                {"name":"description","value":"ABCD*","operator":"CONTAINS"},
                {"name":"status","value":"false","operator":"EQ"},
                {"name":"lastModifiedDate","value":"01/09/2013","operator":"GTEQ"},
                {"name":"lastModifiedDate","value":"01/18/2013","operator":"LTEQ"}]
orderings:[{"name" :"lastModifiedDate":"order":"ASC"}]
```

## Sample response {#sample-response}

```json
[
{"resultCount":2},
    {"assetType":"FORM","name":"ExpenseClaim.xdp","id":"509fa2d5-e3c9-407b-b8dc-fa0ba08eb0ce",
       "path":"/content/dam/formsanddocuments/MyApplication23/1.0/ExpenseClaim.xdp",
       "title":"Expense Report","description":"ABCDEFGIJK","author":"Frank Bowman",
       "tags":[],"formUrl":"/content/dam/formsanddocuments/MyApplication23/1.0/ExpenseClaim.xdp/jcr:content",
       "pdfUrl":"/content/dam/formsanddocuments/MyApplication23/1.0/ExpenseClaim.xdp/jcr:content?type=pdf",
       "references":[],"images":[{"assetType":"resource","name":"Image.gif","id":"5477a127-8bbf-4cec-8f81-2689e5cb4a15",
       "path":"/content/dam/formsanddocuments/MyApplication23/1.0/Image.gif","resourceSize":0}],
       "status":false,"creationDate":1358429845623,"lastModifiedDate":1358429846771},
{"assetType":"FORM","name":"ExpenseClaim.xdp","id":"4312239b-b666-4d36-95bc-641b3a39ddd4",
       "path":"/content/dam/formsanddocuments/MyApplication23/ExpenseClaim.xdp",
       "title":"Expense Report","description":"ABCDefghijklm","author":"Frank Bowman",
       "tags":[],"formUrl":"/content/dam/formsanddocuments/MyApplication23/ExpenseClaim.xdp/jcr:content",
       "pdfUrl":"/content/dam/formsanddocuments/MyApplication23/ExpenseClaim.xdp/jcr:content?type=pdf",
       "references":[],"images":[{"assetType":"resource","name":"Image.gif","id":"118a2e3f-7097-4d8c-85d1-651306de284a",
       "path":"/content/dam/formsanddocuments/MyApplication23/Image.gif","resourceSize":0}],"status":false,
       "creationDate":1358429856690,"lastModifiedDate":1358430109023}
]
```

## Related Articles

* [Enable forms portal components](/help/forms/using/enabling-forms-portal-components.md)
* [Create forms portal page](/help/forms/using/creating-form-portal-page.md)
* [List forms on a web page using APIs](/help/forms/using/listing-forms-webpage-using-apis.md)
* [Use Drafts and submissions component](/help/forms/using/draft-submission-component.md)
* [Customize storage of drafts and submitted forms](/help/forms/using/draft-submission-component.md)
* [Sample for integrating drafts & submissions component with database](/help/forms/using/integrate-draft-submission-database.md)
* [Customizing templates for forms portal components](/help/forms/using/customizing-templates-forms-portal-components.md)
* [Introduction to publishing forms on a portal](/help/forms/using/introduction-publishing-forms.md)
