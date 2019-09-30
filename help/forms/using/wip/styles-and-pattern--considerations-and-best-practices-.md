---
title: Best practices and considerations 
seo-title: Best practices and considerations 
description: null
seo-description: null
page-status-flag: de-activated
uuid: 11e4db20-b316-40d9-a88c-1a07cf4d6610
contentOwner: khsingh
discoiquuid: 3364a848-91a6-497f-a3c2-ff86f147944f
docset: aem65

---

# Best practices and considerations {#best-practices-and-considerations}

AEM Forms Automated Conversion service converts a PDF form to an adaptive form. The service uses artificial intelligence and machine learning algorithms to understand the layout and fields of the source form. Every machine learning service continuously learns from source data and produces an improved output with every churn. These services learn from the experience like humans.

Automated Forms Conversion service is trained on a large set of forms. It easily identifies fields in a source form and produces adaptive forms. However, there are some fields and styles in PDF forms which are easily visible to the human eye but difficult to understand for the service. The service can assign different than applicable field types or panels to some fields or styles. All such field and style patterns are listed below.

The service would start identifying and assigning correct fields or panels to these patterns as it keeps learning from the source data. For the time being, you can use [Review and Correct](https://helpx.adobe.com/experience-manager/Automated-Forms-Conversion-Service/review-correct-ui-edited.html) editor to fix such issues. Before start fixing the issues or reading further, familiarize yourself with [adaptive form components](../../../forms/using/introduction-forms-authoring.md).

## General {#general}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td width="30%">Known patterns and resolution</td> 
   <td width="70%">Example</td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service does not convert colored PDF forms to adaptive form.</p> <p> </p> <p><strong>Resolution</strong></p> <p>Use black and white or grayscale PDF forms. </p> </td> 
   <td style="text-align: left;"> <img src="assets/coloured-form.png" /></td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service does not convert filled PDF forms to adaptive form.</p> <p> </p> <p><strong>Resolution</strong></p> <p>Use empty adaptive forms.</p> </td> 
   <td style="text-align: left;"><img src="assets/pre-filled-form.png" /></td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service can fail to recognize text and fields in a dense form.</p> <p> </p> <p><strong>Resolution</strong></p> <p>Increase the width between text and fields of a dense form before starting the conversion.</p> </td> 
   <td style="text-align: left;"><img src="assets/dense%20form.png" /></td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service does not support scanned forms.</p> <p> </p> <p><strong>Resolution</strong></p> <p>Do not use scanned forms. </p> </td> 
   <td><img src="assets/scanned-form.jpg" /></td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service does not extract images and text within images. </p> <p> </p> <p><strong>Resolution</strong></p> <p>Manually add images or text to converted forms.</p> </td> 
   <td><img src="assets/image-in-adaptive-form.png" /></td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Tables with dotted or non-clear boundaries and borders are do not convert.</p> <p><strong>Resolution</strong></p> <p>Use tables with clear explicit boundaries and borders. supported.</p> </td> 
   <td><img src="assets/border-less-tables.png" /> </td> 
  </tr>
 </tbody>
</table>

## Choice Group  {#choice-group}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td width="30%">Pattern</td> 
   <td width="70%">Example</td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Choice group options with shapes other than box or circle are not converted to corresponding adaptive form components. </p> <p> </p> <p><strong>Resolution</strong></p> <p>Change choice options shapes to box or circle or use Review and Correct editor to identify the shapes.</p> </td> 
   <td><img src="assets/shaded-box-patterns.png" /> </td> 
  </tr>
 </tbody>
</table>

## Form fields {#form-fields}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td width="30%">Pattern</td> 
   <td width="70%">Example</td> 
  </tr>
  <tr>
   <td width="25%"><p><strong>Pattern</strong></p> <p>Service does not identify fields without clear borders.</p> <p> </p> <p><strong>Resolution</strong></p> <p>Use Review and Correct editor to identify such fields.</p> <p> </p> <p> </p> </td> 
   <td width="50%"><br /> <img src="assets/fields-without-clear-borders.png" /></td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service leaves some form fields with captions at the bottom or right unidentified.</p> <p> </p> <p><strong>Resolution</strong></p> <p>Use Review and Correct editor to identify such fields</p> </td> 
   <td><br /> <img src="assets/forms-with-clear-borders-scale.png" /><br /> </td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service merges or assigns a wrong type to some form fields which are placed very near to each other or do not have clear borders. </p> <p> </p> <p><strong>Resolution</strong></p> <p>Use Review and Correct editor to identify such fields.</p> </td> 
   <td><img src="assets/forms-with-fields-placed-nearby.png" /></td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service can fail to recognize fields with far away captions or a dotted line between the caption and input field.</p> <p> </p> <p><strong>Resolution</strong></p> <p>Use forms fields with clear boundaries or use Review and Correct editor to fix such issues.</p> </td> 
   <td><img src="assets/form-fields-with-far-away-captions.png" /></td> 
  </tr>
 </tbody>
</table>

## Lists {#lists}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td width="30%">Pattern</td> 
   <td width="70%">Example</td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Lists containing form fields are merged or not converted to corresponding adaptive form components</p> <p><strong>Resolution</strong></p> <p>Use forms fields with clear boundaries or use Review and Correct editor to fix such issues.</p> </td> 
   <td><img src="assets/lists-with-fields.png" /></td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service can leave a few nested lists unidentified</p> <p> </p> <p><strong>Resolution</strong></p> <p>Use Review and Correct editor to fix such issues.</p> </td> 
   <td><img src="assets/nested-lists.png" /> </td> 
  </tr>
  <tr>
   <td><p><strong>Pattern</strong></p> <p>Service merges some lists containing choice groups with each other</p> <p><strong>Resolution</strong></p> <p>Use Review and Correct editor to fix such issues.</p> </td> 
   <td><img src="assets/lists-containing-choice-groups.png" /> </td> 
  </tr>
 </tbody>
</table>

