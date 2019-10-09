---
title: Integrating Create Correspondence UI with your custom portal
seo-title: Integrating Create Correspondence UI with your custom portal
description: Learn how to integrate create correspondence UI with your custom portal
seo-description: Learn how to integrate create correspondence UI with your custom portal
uuid: 4ae9c5fb-bb9d-46d8-be84-455f386ab443
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: correspondence-management
discoiquuid: cb232931-60b7-4956-bc77-10636c19325e
---

# Integrating Create Correspondence UI with your custom portal {#integrating-create-correspondence-ui-with-your-custom-portal}

## Overview {#overview}

This article details how you can integrate the Create Correspondence Solution with your environment.

## URL-based invocation {#url-based-invocation}

One way to call the Create Correspondence application from a custom portal is to prepare the URL with the following request parameters:

* the identifier for the letter template (using the cmLetterId parameter), or the name of the Letter template (using the cmLetterName parameter)

* the URL to the XML data fetched from the desired data source (using the cmDataUrl parameter).

For example, the custom portal would prepare the URL as   
`https://[server]:[port]/[contextPath]/aem/forms/createcorrespondence.html?random=[timestamp]&cmLetterId=[letter identifier]&cmDataUrl=[data URL]`, which could be the href from a link on the portal.   
If the portal has the Letter template name at hand, then the URL could be   
`https://[server]:[port]/content/cm/createcorrespondence.html?cmLetterName=[letter name]&cmDataUrl=[data URL]`.

>[!NOTE]
>
>Calling in such a way is not secure since the necessary parameters are passed along as a GET request, by exposing the same (clearly visible) in the URL.

>[!NOTE]
>
>Before calling the Create Correspondence application, save and upload the data to call the Create Correspondence UI at the given dataURL. This could either be done from the custom portal itself or through another back end process.

## Inline data-based invocation {#inline-data-based-invocation}

Another (and a more secure) way to call the Create Correspondence application could be to simply hit the URL at `https://[server]:[port]/[contextPath]/aem/forms/createcorrespondence.html`, while sending the parameters and data to call the Create Correspondence application as a POST request (hiding them from the end user). This also means that you can now pass along the XML data for the Create Correspondence application inline (as part of the same request, using the cmData parameter), which was not possible/ideal in the previous approach.

### Parameters for specifying letter {#parameters-for-specifying-letter}

<table> 
 <tbody>
  <tr>
   <td><strong>Name</strong></td> 
   <td><strong>Type</strong></td> 
   <td><strong>Description</strong></td> 
  </tr>
  <tr>
   <td>cmLetterInstanceId</td> 
   <td>String</td> 
   <td>The identifier for the letter instance.</td> 
  </tr>
  <tr>
   <td>cmLetterName</td> 
   <td>String</td> 
   <td><p>The identifier for the letter template. </p> <p>If multiple CM letters exist with same name on a server, using the cmLetterName parameter in URL throws an error "Multiple letters exist with name." In such a case, use cmLetterId parameter in the URL instead of cmLetterName.</p> </td> 
  </tr>
  <tr>
   <td>cmLetterId</td> 
   <td>String</td> 
   <td>The name of the Letter template.</td> 
  </tr>
 </tbody>
</table>

The order of parameters in the table specifies the preference of parameters used for loading the letter.

### Parameters for specifying the XML data source {#parameters-for-specifying-the-xml-data-source}

<table> 
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

<table> 
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
