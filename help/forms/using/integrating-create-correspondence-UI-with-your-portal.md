---
title: Integrating Create Correspondence UI with your custom portal
seo-title: Integrating Create Correspondence UI with your custom portal
description: Learn how to integrate create correspondence UI with your custom portal
seo-description: Learn how to integrate create correspondence UI with your custom portal
uuid: 44c2ae40-79b6-4d9d-a6dd-b76165ae7a06
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: correspondence-management
discoiquuid: 54dcfe6b-3e25-42e7-af4d-fd93e36b2b9e
index: y
internal: n
snippet: y
---

# Integrating Create Correspondence UI with your custom portal{#integrating-create-correspondence-ui-with-your-custom-portal}

## Overview {#overview}

This article details how you can integrate the Create Correspondence Solution with your environment.

## URL-based invocation {#url-based-invocation}

One way to call the Create Correspondence application from a custom portal is to prepare the URL with the following request parameters:

* the identifier for the letter template (using the cmLetterId parameter).

* the URL to the XML data fetched from the desired data source (using the cmDataUrl parameter).

For example, the custom portal would prepare the URL as  
`http://[server]:[port]/[contextPath]/aem/forms/createcorrespondence.html?random=[timestamp]&cmLetterId=[letter identifier]&cmDataUrl=[data URL]`, which could be the href from a link on the portal.

>[!NOTE]
>
>Calling in such a way is not secure since the necessary parameters are passed along as a GET request, by exposing the same (clearly visible) in the URL.

>[!NOTE]
>
>Before calling the Create Correspondence application, save and upload the data to call the Create Correspondence UI at the given dataURL. This could either be done from the custom portal itself or through another back end process.

## Inline data-based invocation {#inline-data-based-invocation}

Another (and a more secure) way to call the Create Correspondence application could be to simply hit the URL at http://[server]:[port]/[contextPath]/aem/forms/createcorrespondence.html, while sending the parameters and data to call the Create Correspondence application as a POST request (hiding them from the end user). This also means that you can now pass along the XML data for the Create Correspondence application inline (as part of the same request, using the cmData parameter), which was not possible/ideal in the previous approach.

### Parameters for specifying letter {#parameters-for-specifying-letter}

| **Name** |**Type** |**Description** |
|---|---|---|
| cmLetterInstanceId |String |The identifier for the letter instance. |
| cmLetterId |String |The name of the Letter template. |

The order of parameters in the table specifies the preference of parameters used for loading the letter.

### Parameters for specifying the XML data source {#parameters-for-specifying-the-xml-data-source}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Name</strong></td> 
   <td><strong>Type</strong></td> 
   <td><strong>Description</strong></td> 
  </tr>
  <tr>
   <td>cmDataUrl<br /> </td> 
   <td>URL</td> 
   <td>XML data from a source file using basic protocols such as cq, ftp, http, or file.<br /> </td> 
  </tr>
  <tr>
   <td>cmLetterInstanceId</td> 
   <td>String</td> 
   <td>Using xml data available in Letter Instance.</td> 
  </tr>
  <tr>
   <td>cmUseTestData</td> 
   <td>Boolean</td> 
   <td>To reuse the test data attached in data dictionary.</td> 
  </tr>
 </tbody>
</table>

The order of parameters in the table specifies the preference of parameters used for loading the XML data.

### Other Parameters {#other-parameters}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Name</strong></td> 
   <td><strong>Type</strong></td> 
   <td><strong>Description</strong></td> 
  </tr>
  <tr>
   <td>cmPreview<br /> </td> 
   <td>Boolean</td> 
   <td>True to open the letter in preview mode<br /> </td> 
  </tr>
  <tr>
   <td>Random</td> 
   <td>Timestamp</td> 
   <td>To resolve the browser caching issues.</td> 
  </tr>
 </tbody>
</table>

If you using http or cq protocol for cmDataURL, URL of http/cq should be accessible anonymously.
