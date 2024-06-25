---
title: Feature differentiation between HTML5 forms and PDF forms
description: Learn about the feature differences between HTML5 forms and PDF forms.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
docset: aem65
feature: HTML5 Forms,Mobile Forms
exl-id: 3150f95f-7150-4eee-b5a9-121422dec2a1
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Feature differentiation between HTML5 forms and PDF forms {#feature-differentiation-between-html-forms-and-pdf-forms}

The following table specifies the feature support provided for HTML5 forms and PDF forms:

<table>
 <tbody>
  <tr>
   <th>Feature</th>
   <th>HTML5 Forms</th>
   <th>PDF</th>
  </tr>
  <tr>
   <td>Barcodes<br /> </td>
   <td>Not available at the user interface level. </td>
   <td>Supported</td>
  </tr>
  <tr>
   <td>Signature field<br /> </td>
   <td><strong>Digital Signatures</strong> are not supported but a new <strong>Scribble Signature</strong> field is added for paper like signatures. One can scribble their signature on the form using the <strong>Scribble Signature</strong> field. The signature is saved on the form as an image. You can save geolocation information in the <strong>Scribble Signature</strong> field.</td>
   <td>Signature field available for <strong>Digital Signatures</strong>.</td>
  </tr>
  <tr>
   <td>Data Merge</td>
   <td>Supported</td>
   <td>Supported</td>
  </tr>
  <tr>
   <td>Images</td>
   <td>The Data URI scheme is used to display images. All the modern versions of browsers support this scheme but there are differences in the range of image formats that each browser supports.<br /> </td>
   <td>The .gif, .png, .jpeg, .bmp, and .tiff formats are supported.</td>
  </tr>
  <tr>
   <td>Pagination<br /> </td>
   <td><p>An HTML5 form is divided into panels and boxes to give it an appearance similar to PDF forms. The size of the page is calculated dynamically. If all the contents of a page in an HTML5 form are deleted or marked hidden, then the blank page is hidden. An empty space (blank space) is not displayed between pages above and beneath the blank page.</p> <p>If data-merge or scripts add content to a page, then the length of the page expands to accommodate the newly added content. No new pages are added to the form to accommodate the newly added content. </p> <p><strong>Note:</strong> When the all the contents of a page in an HTML5 form are deleted or marked hidden, the blank page (blank space) remains visible between first and second page but not between any other pages.</p> </td>
   <td>Pagination in PDF depends on data content merged or user content and page count is increased/reduced based on it.</td>
  </tr>
  <tr>
   <td>Headers/Footers </td>
   <td>Supported. <br /> <br /> As HTML5 mobile forms do not support page breaks, headers and footers appear only once. You can, however, set them up in the layout to appear at multiple places in the mobile forms preview.<br /> </td>
   <td>Supported.</td>
  </tr>
  <tr>
   <td>Custom Widgets</td>
   <td>One can customize widgets to enhance the user experience on mobile devices.<br /> </td>
   <td>All widgets are locked down and no custom widget can be plugged.<br /> </td>
  </tr>
  <tr>
   <td>XFA Script API</td>
   <td>Supports the most commonly used XFA script constructs. For a detailed listing of supported constructs, see <a href="/help/forms/using/scripting-support.md">scripting support</a>.</td>
   <td>Supports all XFA script constructs.</td>
  </tr>
  <tr>
   <td>Acrobat Script APIs </td>
   <td>HTML5 forms support most commonly used APIs. For details, see <a href="/help/forms/using/scripting-support.md">scripting support</a>.</td>
   <td>If the PDF file is opened inside Acrobat or Reader, it also supports all the script APIs that Acrobat provides.</td>
  </tr>
  <tr>
   <td>Support for right-to-left languages </td>
   <td>Supported</td>
   <td>Supported</td>
  </tr>
 </tbody>
</table>

<!--Follow the best practices to enable a form template for HTML5 renditions and ensure that the behavior and appearance of HTML5 forms and XFA-based PDF is consistent. For detailed list of best practices, see [Best practices to design an HTML5 form.](/help/forms/using/best-practices-design-html5-forms.md)-->
