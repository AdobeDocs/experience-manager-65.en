---
title: DO NOT PUBLISH - AEM Forms Components
seo-title: DO NOT PUBLISH - AEM Forms Components
description: Learn how to use AEM Forms Components and Component properties to create fields to let your customers effectively provide data. 
seo-description: Learn how to use AEM Forms Components and Component properties to create fields to let your customers effectively provide data. 
page-status-flag: never-activated
uuid: 03a0b014-e92f-4fa9-86d3-66fc7426d5fd
contentOwner: sashanka
products: SG_EXPERIENCEMANAGER/6.5/FORMS
content-type: reference
discoiquuid: a1200918-afd0-4745-830b-ad98bf72af54
index: y
internal: n
snippet: y
---

# DO NOT PUBLISH - AEM Forms Components{#do-not-publish-aem-forms-components}

The adaptive form components let you create fields in which your customers enter information. Properties of a component let you customize the usability of a component. For example, you add a text box component in your form, and it adds a text field. You can use the properties such as title, required field message, and default value to customize how a user interacts with the field and provides details.

All the AEM Forms components that are available out-of-the-box are described below. Click a component to see how to use it.

## Adaptive Form Footer {#adaptive-form-footer}

Drops a page footer in the adaptive form layout. Includes a rich text out-of-the-box that you can edit in the form. Typically, a footer includes the copyright information of a company. When you tap the text component of the footer, you see the component toolbar. Tap ![](assets/cmppr.png) to customize the properties of the text. Properties are listed below:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <th>Property</th> 
   <th>Description</th> 
  </tr>
  <tr>
   <td>Element Name</td> 
   <td>The name of the field. You can use Element Name for identifying the field and use value in it. For example, you have field with the name age. You can use <span class="code">age.value</span> to fetch value stored in the field.<br /> </td> 
  </tr>
  <tr>
   <td>Bind Reference</td> 
   <td>For XSD based adaptive forms, bind reference property lets you bind values entered in a field to a node in a data model. For example, a value "21" is stored in the field agebox of a form called <span class="code">application</span>. You want to bind the field <span class="code">agebox</span> to the node <span class="code">age</span> in the data model. To bind agebox field to age node, specify the bind reference: <span class="code">/application/age</span></td> 
  </tr>
  <tr>
   <td>Default Value</td> 
   <td>The default text that appears in the footer section. </td> 
  </tr>
  <tr>
   <td>CSS Class</td> 
   <td> </td> 
  </tr>
  <tr>
   <td>Exclude from Document of Record</td> 
   <td>Enable this property to exclude the footer from appearing in the Document of Record. </td> 
  </tr>
 </tbody>
</table>

## Adaptive Form Header {#adaptive-form-header}

Adaptive form header component lets you add a page header that you can use to provide the company logo and name. When you drop a header, you can select the logo image and text sub-components, and use properties to customize the header.

When you select the logo image component and tap ![](assets/cmppr.png), you can use the following properties to customize the logo image:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <th>Property</th> 
   <th>Description</th> 
  </tr>
  <tr>
   <td>Element Name</td> 
   <td>The name of the field. You can use Element Name for identifying the field and use value in it. For example, you have field with the name <span class="code">age</span>. You can use <span class="code">age.value</span> to fetch value stored in the field.</td> 
  </tr>
  <tr>
   <td>Title</td> 
   <td> </td> 
  </tr>
  <tr>
   <td>Description</td> 
   <td> </td> 
  </tr>
  <tr>
   <td>Image</td> 
   <td>Lets you select the logo image that you want to show in the header. </td> 
  </tr>
  <tr>
   <td>Alternate Text<br /> </td> 
   <td>Text that users see when they hover over the logo image.<br /> </td> 
  </tr>
  <tr>
   <td>CSS Class</td> 
   <td> </td> 
  </tr>
  <tr>
   <td>Exclude from Document of Record</td> 
   <td>Enable this property to exclude the component from appearing in the document of record. </td> 
  </tr>
 </tbody>
</table>

When you select the text sub-component and tap ![](assets/cmppr.png), you can see the following properties to customize the header text:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <th>Property</th> 
   <th>Description</th> 
  </tr>
  <tr>
   <td>Element Name</td> 
   <td>The name of the field. You can use Element Name for identifying the field and use value in it. For example, you have field with the name age. You can use <span class="code">age.value</span> to fetch value stored in the field.<br /> </td> 
  </tr>
  <tr>
   <td>Bind Reference</td> 
   <td>For XSD based adaptive forms, bind reference property lets you bind values entered in a field to a node in a data model. For example, a value "21" is stored in the field agebox of a form called <span class="code">application</span>. You want to bind the field <span class="code">agebox</span> to the node <span class="code">age</span> in the data model. To bind agebox field to age node, specify the bind reference: <span class="code">/application/age</span></td> 
  </tr>
  <tr>
   <td>Default Value</td> 
   <td>The default text that appears in the footer section. </td> 
  </tr>
  <tr>
   <td>CSS Class</td> 
   <td> </td> 
  </tr>
  <tr>
   <td>Exclude from Document of Record</td> 
   <td>Enable this property to exclude the component from appearing in the Document of Record. </td> 
  </tr>
 </tbody>
</table>

## Adaptive Form Title {#adaptive-form-title}

Lets you provide a title for your adaptive form, that your customers use to identify and differentiate from other adaptive forms. You can use the following properties to customize the form title: 

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <th>Property</th> 
   <th>Description</th> 
  </tr>
  <tr>
   <td>Element Name</td> 
   <td>The name of the field. You can use Element Name for identifying the field and use value in it. For example, you have field with the name age. You can use <span class="code">age.value</span> to fetch value stored in the field.<br /> </td> 
  </tr>
  <tr>
   <td>Bind Reference</td> 
   <td>For XSD based adaptive forms, bind reference property lets you bind values entered in a field to a node in a data model. For example, a value "21" is stored in the field agebox of a form called <span class="code">application</span>. You want to bind the field <span class="code">agebox</span> to the node <span class="code">age</span> in the data model. To bind agebox field to age node, specify the bind reference: <span class="code">/application/age</span></td> 
  </tr>
  <tr>
   <td>Default Value</td> 
   <td>The default text that appears in the footer section. </td> 
  </tr>
  <tr>
   <td>CSS Class</td> 
   <td> </td> 
  </tr>
  <tr>
   <td>Exclude from Document of Record</td> 
   <td>Enable this property to exclude the component from appearing in the Document of Record. </td> 
  </tr>
 </tbody>
</table>

## Chart {#chart}

## Date Input Field {#date-input-field}

## Document Fragment {#document-fragment}

