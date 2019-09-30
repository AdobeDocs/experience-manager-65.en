---
title: XFA support in XDP-based adaptive forms
seo-title: XFA support in XDP-based adaptive forms
description: Lists supported XFA events, properties, scripts, and validation in adaptive forms.
seo-description: Lists supported XFA events, properties, scripts, and validation in adaptive forms.
uuid: 75d3c292-cfed-438f-afdb-4071d95a08b7
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop
discoiquuid: 05303b29-9058-4723-b134-4ba605fe40c7
docset: aem65

---

# XFA support in XDP-based adaptive forms{#xfa-support-in-xdp-based-adaptive-forms}

## Introduction {#introduction}

Adaptive forms provides support for various XFA events, properties, scripts, and validations defined in an XDP file, including:

* Execution of scripts defined on events in the XDP file.
* Capturing default values and behavioral properties for fields in the XDP file.
* Execution of validation scripts defined in the XDP file.

When an adaptive form is created based on an XDP file, the properties, events, and validations are auto-populated in the form authoring UI. However, form authors can override some of these elements to create an alternate experience.

This article lists supported XFA events, properties, and validations honored in adaptive forms and explains how to override them in adaptive forms.

## Supported XFA elements and their mapping in adaptive forms <br> {#supported-xfa-elements-and-their-mapping-in-adaptive-forms-br}

### Fields {#fields}

When an adaptive form is created using an XDP file, you can drag-drop an XFA field onto the adaptive form. The following table lists how XFA fields are mapped to adaptive form fields.

<table>
 <tbody>
  <tr>
   <td valign="top" width="200"><p><strong>XFA field or container</strong></p> </td> 
   <td valign="top" width="250"><p><strong>Corresponding adaptive form component</strong></p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Button </p> </td> 
   <td valign="top"><p>Button</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Check Box </p> </td> 
   <td valign="top"><p>Check Box</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>List Box </p> </td> 
   <td valign="top"><p>Drop-down List</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Date/Time Field </p> </td> 
   <td valign="top"><p>Date Picker</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Signature Scribble</p> </td> 
   <td valign="top"><p>(Deprecated) Scribble Signature</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Numeric Field </p> </td> 
   <td valign="top"><p>Numeric Box</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Decimal Field</p> </td> 
   <td valign="top"><p>Numeric Box</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Text Field </p> </td> 
   <td valign="top"><p>Text Box</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Password Field </p> </td> 
   <td valign="top"><p>Password Box</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Image</p> </td> 
   <td valign="top"><p>Image</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Text</p> </td> 
   <td valign="top"><p>Text</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Subform </p> </td> 
   <td valign="top"><p>Panel</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Area (Group)</p> </td> 
   <td valign="top"><p>Panel</p> </td> 
  </tr>
  <tr>
   <td valign="top"><p>Subform Set </p> </td> 
   <td valign="top"><p>Panel</p> </td> 
  </tr>
 </tbody>
</table>

### Properties {#properties}

The following table captures how various XFA scripts defined in the XDP files behave in adaptive forms.

<table>
 <tbody>
  <tr>
   <td valign="top" width="234"><p><strong>XFA component properties</strong></p> </td> 
   <td valign="top" width="390"><p><strong>Corresponding behavior in adaptive forms</strong></p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>somExpression </p> </td> 
   <td valign="top" width="390"><p>Mapped to the Bind reference (bindRef) property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>presence </p> </td> 
   <td valign="top" width="390"><p>Mapped to the visible property in adaptive form. You can override it using the Visibility expression.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>access </p> </td> 
   <td valign="top" width="390"><p>Mapped to the enabled property in adaptive form. You can override it using the Access expression.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>Accessibility: role </p> </td> 
   <td valign="top" width="390"><p>Mapped to the role property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>Accessibility: speakPriority </p> </td> 
   <td valign="top" width="390"><p>Mapped to the speakPriority property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>Accessibility: speakText</p> </td> 
   <td valign="top" width="390"><p>Mapped to the custom Accessibility text in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>Accessibility: toolTip </p> </td> 
   <td valign="top" width="390"><p>Mapped to the short description property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>caption<em> (all Field types)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to the Title property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>displayFormat<em> (all Field types)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to the Display Pattern in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>rawValue<em> (all Field types)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to value property in adaptive Form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>items<em> (List Box, Check Box)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to options property in adaptive form. You can override it using the Options expression.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>maxChar<em> (Text Field)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to the Maximum characters allowed property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>multiline<em> (Text Field)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to the Allow multiple lines property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>fracDigit<em> (Numeric Field, Decimal Field)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to the Frac digits property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>leadDigit<em> (Numeric Field, Decimal Field)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to the Lead digits property in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="234"><p>multiSelect<em> (List Box)</em></p> </td> 
   <td valign="top" width="390"><p>Mapped to the Allows multiple selection property in adaptive form.</p> </td> 
  </tr>
 </tbody>
</table>

### Scripts {#scripts}

The following table captures how various XFA scripts defined in the XDP file behave in adaptive forms.

<table>
 <tbody>
  <tr>
   <td valign="top" width="234"><p><strong>XFA script events</strong></p> </td> 
   <td valign="top" width="390"><p><strong>Corresponding behavior in adaptive forms</strong></p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>initialize </p> </td> 
   <td valign="top" width="414"><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>calculate</p> </td> 
   <td valign="top" width="414"><p>Mapped to the Calculate expression in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>validate </p> </td> 
   <td valign="top" width="414"><p>Mapped to the Validation expression in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>validationState </p> </td> 
   <td valign="top" width="414"><p>This script is executed at runtime and cannot be overridden in adaptive form.<br /> </p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>exit </p> </td> 
   <td valign="top" width="414"><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>click (button fields)</p> </td> 
   <td valign="top" width="414"><p>Mapped to the Click expression of the button.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>Support for server-side script</p> </td> 
   <td valign="top" width="414"><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>Support for web services</p> </td> 
   <td valign="top" width="414"><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="210"><p>Change (scribble field, radio button, check box)</p> </td> 
   <td valign="top" width="414"><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td> 
  </tr>
 </tbody>
</table>

### Validations {#validations}

The following table captures how XFA validations map to validations in adaptive forms.

<table>
 <tbody>
  <tr>
   <td valign="top" width="360"><p><strong>XFA validation</strong></p> </td> 
   <td valign="top" width="264"><p><strong>Corresponding validation in adaptive form</strong></p> </td> 
  </tr>
  <tr>
   <td valign="top" width="360"><p>Validation Pattern (formatTest)</p> </td> 
   <td valign="top" width="264"><p>validatePictureClause</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="360"><p>Validation Pattern Message (formatTestMessage)</p> </td> 
   <td valign="top" width="264"><p>validatePictureMessage</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="360"><p>Required (nullTest )</p> </td> 
   <td valign="top" width="264"><p>mandatory </p> </td> 
  </tr>
  <tr>
   <td valign="top" width="360"><p>Empty Message (nullTestMessage) </p> </td> 
   <td valign="top" width="264"><p>mandatoryMessage</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="360"><p>Validate script (scriptTest)</p> </td> 
   <td valign="top" width="264"><p>validateExp</p> </td> 
  </tr>
  <tr>
   <td valign="top" width="360"><p>Validation script Message (scriptTestMessage)</p> </td> 
   <td valign="top" width="264"><p>validateMessage</p> </td> 
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>You cannot override mandatory property for adaptive form radio button and check box group that are bound to XFA check buttons.

