---
title: XFA support in XDP-based adaptive forms

description: Lists supported XFA events, properties, scripts, and validation in adaptive forms.


products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop

docset: aem65
feature: Adaptive Forms, Foundation Components
exl-id: 255be73f-3169-457c-aaa7-a2fb59f1f2cd
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# XFA support in XDP-based adaptive forms{#xfa-support-in-xdp-based-adaptive-forms}

## Introduction {#introduction}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

Adaptive forms supports various XFA events, properties, scripts, and validations defined in an XDP file, including:

* Execution of scripts defined on events in the XDP file.
* Capturing default values and behavioral properties for fields in the XDP file.
* Execution of validation scripts defined in the XDP file.

When an adaptive form is created based on an XDP file, the properties, events, and validations are auto-populated in the form authoring UI. However, form authors can override some of these elements to create an alternate experience.

This article lists supported XFA events, properties, and validations honored in adaptive forms and explains how to override them in adaptive forms.

## Supported XFA elements and their mapping in adaptive forms {#supported-xfa-elements-and-their-mapping-in-adaptive-forms-br}

### Fields {#fields}

When an adaptive form is created using an XDP file, you can drag-drop an XFA field onto the adaptive form. The following table lists how XFA fields are mapped to adaptive form fields.

<table>
 <tbody>
  <tr>
   <td><p><strong>XFA field or container</strong></p> </td>
   <td><p><strong>Corresponding adaptive form component</strong></p> </td>
  </tr>
  <tr>
   <td><p>Button </p> </td>
   <td><p>Button</p> </td>
  </tr>
  <tr>
   <td><p>Check Box </p> </td>
   <td><p>Check Box</p> </td>
  </tr>
  <tr>
   <td><p>List Box </p> </td>
   <td><p>Drop-down List</p> </td>
  </tr>
  <tr>
   <td><p>Date/Time Field </p> </td>
   <td><p>Date Picker</p> </td>
  </tr>
  <tr>
   <td><p>Signature Scribble</p> </td>
   <td><p>Scribble Signature</p> </td>
  </tr>
  <tr>
   <td><p>Numeric Field </p> </td>
   <td><p>Numeric Box</p> </td>
  </tr>
  <tr>
   <td><p>Decimal Field</p> </td>
   <td><p>Numeric Box</p> </td>
  </tr>
  <tr>
   <td><p>Text Field </p> </td>
   <td><p>Text Box</p> </td>
  </tr>
  <tr>
   <td><p>Password Field </p> </td>
   <td><p>Password Box</p> </td>
  </tr>
  <tr>
   <td><p>Image</p> </td>
   <td><p>Image</p> </td>
  </tr>
  <tr>
   <td><p>Text</p> </td>
   <td><p>Text</p> </td>
  </tr>
  <tr>
   <td><p>Subform </p> </td>
   <td><p>Panel</p> </td>
  </tr>
  <tr>
   <td><p>Area (Group)</p> </td>
   <td><p>Panel</p> </td>
  </tr>
  <tr>
   <td><p>Subform Set </p> </td>
   <td><p>Panel</p> </td>
  </tr>
 </tbody>
</table>

### Properties {#properties}

The following table captures how various XFA scripts defined in the XDP files behave in adaptive forms.

<table>
 <tbody>
  <tr>
   <td><p><strong>XFA component properties</strong></p> </td>
   <td><p><strong>Corresponding behavior in adaptive forms</strong></p> </td>
  </tr>
  <tr>
   <td><p>somExpression </p> </td>
   <td><p>Mapped to the Bind reference (bindRef) property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>presence </p> </td>
   <td><p>Mapped to the visible property in adaptive form. You can override it using the Visibility expression.</p> </td>
  </tr>
  <tr>
   <td><p>access </p> </td>
   <td><p>Mapped to the enabled property in adaptive form. You can override it using the Access expression.</p> </td>
  </tr>
  <tr>
   <td><p>Accessibility: role </p> </td>
   <td><p>Mapped to the role property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>Accessibility: speakPriority </p> </td>
   <td><p>Mapped to the speakPriority property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>Accessibility: speakText</p> </td>
   <td><p>Mapped to the custom Accessibility text in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>Accessibility: toolTip </p> </td>
   <td><p>Mapped to the short description property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>caption<em> (all Field types)</em></p> </td>
   <td><p>Mapped to the Title property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>displayFormat<em> (all Field types)</em></p> </td>
   <td><p>Mapped to the Display Pattern in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>rawValue<em> (all Field types)</em></p> </td>
   <td><p>Mapped to value property in adaptive Form.</p> </td>
  </tr>
  <tr>
   <td><p>items<em> (List Box, Check Box)</em></p> </td>
   <td><p>Mapped to options property in adaptive form. You can override it using the Options expression.</p> </td>
  </tr>
  <tr>
   <td><p>maxChar<em> (Text Field)</em></p> </td>
   <td><p>Mapped to the Maximum characters allowed property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>multiline<em> (Text Field)</em></p> </td>
   <td><p>Mapped to the Allow multiple lines property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>fracDigit<em> (Numeric Field, Decimal Field)</em></p> </td>
   <td><p>Mapped to the Frac digits property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>leadDigit<em> (Numeric Field, Decimal Field)</em></p> </td>
   <td><p>Mapped to the Lead digits property in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>multiSelect<em> (List Box)</em></p> </td>
   <td><p>Mapped to the Allows multiple selection property in adaptive form.</p> </td>
  </tr>
 </tbody>
</table>

### Scripts {#scripts}

The following table captures how various XFA scripts defined in the XDP file behave in adaptive forms.

<table>
 <tbody>
  <tr>
   <td><p><strong>XFA script events</strong></p> </td>
   <td><p><strong>Corresponding behavior in adaptive forms</strong></p> </td>
  </tr>
  <tr>
   <td><p>initialize </p> </td>
   <td><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>calculate</p> </td>
   <td><p>Mapped to the Calculate expression in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>validate </p> </td>
   <td><p>Mapped to the Validation expression in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>validationState </p> </td>
   <td><p>This script is executed at runtime and cannot be overridden in adaptive form.<br /> </p> </td>
  </tr>
  <tr>
   <td><p>exit </p> </td>
   <td><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>click (button fields)</p> </td>
   <td><p>Mapped to the Click expression of the button.</p> </td>
  </tr>
  <tr>
   <td><p>Support for server-side script</p> </td>
   <td><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>Support for web services</p> </td>
   <td><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td>
  </tr>
  <tr>
   <td><p>Change (scribble field, radio button, check box)</p> </td>
   <td><p>This script is executed at runtime and cannot be overridden in adaptive form.</p> </td>
  </tr>
 </tbody>
</table>

### Validations {#validations}

The following table captures how XFA validations map to validations in adaptive forms.

<table>
 <tbody>
  <tr>
   <td><p><strong>XFA validation</strong></p> </td>
   <td><p><strong>Corresponding validation in adaptive form</strong></p> </td>
  </tr>
  <tr>
   <td><p>Validation Pattern (formatTest)</p> </td>
   <td><p>validatePictureClause</p> </td>
  </tr>
  <tr>
   <td><p>Validation Pattern Message (formatTestMessage)</p> </td>
   <td><p>validatePictureMessage</p> </td>
  </tr>
  <tr>
   <td><p>Required (nullTest )</p> </td>
   <td><p>mandatory </p> </td>
  </tr>
  <tr>
   <td><p>Empty Message (nullTestMessage) </p> </td>
   <td><p>mandatoryMessage</p> </td>
  </tr>
  <tr>
   <td><p>Validate script (scriptTest)</p> </td>
   <td><p>validateExp</p> </td>
  </tr>
  <tr>
   <td><p>Validation script Message (scriptTestMessage)</p> </td>
   <td><p>validateMessage</p> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>You cannot override mandatory property for adaptive form radio button and check box group that are bound to XFA check buttons.
