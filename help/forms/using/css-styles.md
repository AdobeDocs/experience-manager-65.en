---
title: Creating CSS styles for HTML5 forms
description: Learn how to change the appearance of HTML5 forms by modifying the CSS class associated with the HTML form element.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: a8d986ab-2a4c-488b-957e-4606f7391bd3
feature: HTML5 Forms
exl-id: 8cc90ff7-284e-41cd-bfda-7fa09371e270
solution: Experience Manager, Experience Manager Forms
role: "Admin, User, Developer"
---
# Creating CSS styles for HTML5 forms {#creating-css-styles-for-html-forms}

HTML5 rendition of a XFA-based form template consists of several HTML elements. These elements are arranged in an order. Every element has well-defined CSS classes. You can use these CSS class to select and change the appearance of an element.

>[!NOTE]
>
>In the CSS classes, do not change value of the width, height, border-thickness, top, left, right, bottom, padding, margin, and other position and size attributes. Any change in the position and size attributes brings changes to the layout of the form.

## CSS classes&nbsp; for elements&nbsp; {#css-classes-nbsp-for-elements-nbsp}

Every element contains well-defined CSS classes. You can modify these classes to change the appearance of an element. Every element, except the field and draw elements, has two CSS classes - Type class and Name class.

* The **Type class** represents the type of the XFA field. You can override the `type` class to modify the styles of all elements of a particular type.

* The **Name class** corresponds to the name of the XFA field. You can override the `name` class to modify and apply custom style to an element.

>[!NOTE]
>
>Some XFA elements do not have a name. To change the styles of such components, modify all the components of that particular type.

For the pages not named in the AEM Forms Designer, pages in an HTML5 form are named in the increasing order of their number. For example, for an HTML5 form with two pages the pages are named Page1, Page2.

## Field element {#field-element}

The field element contains two nested elements: widget and caption.

**Widget element**

The widget element contains the user interface element for interaction with users. It has three CSS classes:

* **Widget**: Every widget has this class.
* **name**: All the widgets shipped with AEM contain the widget name class. For custom widgets, the widget developer provides the Widget name class.
* **type**: Every widget has a user interface element. This class defines the type of the user interface element.

```xml
<!--field with caption-->
<div class="field numericfield NumericField3 ">
     <div class="caption">
        caption content
     </div>
     <div class="widget numericfieldwidget numericInput">
       widget content
     </div>
</div>

<!--field without caption-->
<div class="widget numericfieldwidget numericInput">
   widget content
</div>
```

Besides the type and name class, the field component also contains an additional CSS class named **subtype**. A subtype identifies which type of field it is, for example, NumericField, DateField, TextField. You can override the subtype class to modify the styling of all the fields of type, subtype.

## CSS classes for different components {#css-classes-for-different-components}

<table>
 <tbody>
  <tr>
   <td><strong>Component</strong></td>
   <td><strong>Type</strong></td>
   <td><strong>Name</strong></td>
  </tr>
  <tr>
   <td>Page</td>
   <td>page</td>
   <td>User-defined name<br /> or<br /> Page&lt;pageNumber&gt; (default)</td>
  </tr>
  <tr>
   <td>Content Area</td>
   <td>contentarea</td>
   <td>User-defined name</td>
  </tr>
  <tr>
   <td>Subform</td>
   <td>subform</td>
   <td>User-defined name</td>
  </tr>
  <tr>
   <td>Exclusion Group</td>
   <td>exclgroup</td>
   <td>User-defined name</td>
  </tr>
  <tr>
   <td>Draw</td>
   <td>draw</td>
   <td>User-defined name</td>
  </tr>
  <tr>
   <td>Field</td>
   <td>field</td>
   <td>User-defined name</td>
  </tr>
  <tr>
   <td>Caption</td>
   <td>caption</td>
   <td>NA</td>
  </tr>
  <tr>
   <td>Widget</td>
   <td>widget</td>
   <td>The widget developer defines it (For user-defined widgets see the table in the following section)</td>
  </tr>
 </tbody>
</table>

## CSS classes for different Fields {#css-classes-for-different-fields}

The AEM Forms Designer supports different types of fields in a form like NumericField, DecimalField, and Date Field. All of these fields in HTML contain the above mentioned CSS classes. They also contain some extra classes depending on the type of field.

Every field has an associated widget representing the UI element. The classes of each field and the widgets associated with each field are listed below.

<table>
 <tbody>
  <tr>
   <td><strong>Field Type</strong></td>
   <td><strong>Subtype</strong></td>
   <td><strong>Widget Name</strong></td>
   <td><strong>Widget Type</strong></td>
   <td><strong>HTML UI Tag</strong></td>
  </tr>
  <tr>
   <td>Button<br type="_moz" /> </td>
   <td>NA</td>
   <td>xfaButton<br type="_moz" /> </td>
   <td>buttonfieldwidget<br type="_moz" /> </td>
   <td>input type=button<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>CheckButton<br type="_moz" /> </td>
   <td>checkboxfield<br /> </td>
   <td>XfaCheckBox<br type="_moz" /> </td>
   <td>checkboxfieldwidget<br type="_moz" /> </td>
   <td>input type=checkbox<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>DateField<br type="_moz" /> </td>
   <td>datefield<br type="_moz" /> </td>
   <td>dateField<br type="_moz" /> </td>
   <td>datefieldwidget<br type="_moz" /> </td>
   <td>input type=text<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>DateTimeField<br type="_moz" /> </td>
   <td>textfield<br type="_moz" /> </td>
   <td>textField<br type="_moz" /> </td>
   <td>textfieldwidget</td>
   <td>input type=text<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>DecimalField<br type="_moz" /> </td>
   <td>numericfield<br type="_moz" /> </td>
   <td>numericInput<br type="_moz" /> </td>
   <td>numericfieldwidget<br type="_moz" /> </td>
   <td>input type=text<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>DropDown<br type="_moz" /> </td>
   <td>choicelist<br type="_moz" /> </td>
   <td>dropDownListWidget<br type="_moz" /> </td>
   <td>choicelistwidget<br type="_moz" /> </td>
   <td>select</td>
  </tr>
  <tr>
   <td>ListBox<br type="_moz" /> </td>
   <td>choicelist<br type="_moz" /> </td>
   <td>listBoxWidget<br type="_moz" /> </td>
   <td>choicelistwidget<br type="_moz" /> </td>
   <td>ol</td>
  </tr>
  <tr>
   <td>NumericField<br type="_moz" /> </td>
   <td>numericfield<br type="_moz" /> </td>
   <td>numericInput<br type="_moz" /> </td>
   <td>numericfieldwidget<br type="_moz" /> </td>
   <td>input type=text<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>PasswordField<br type="_moz" /> </td>
   <td>passwordfield<br type="_moz" /> </td>
   <td>defaultWidget<br type="_moz" /> </td>
   <td>passwordfieldwidget<br type="_moz" /> </td>
   <td>input type=password<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>RadioButton<br type="_moz" /> </td>
   <td>radiofield<br type="_moz" /> </td>
   <td>XfaCheckBox<br type="_moz" /> </td>
   <td>radiofieldwidget<br type="_moz" /> </td>
   <td>input type=radio<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>TextField<br type="_moz" /> </td>
   <td>textfield<br type="_moz" /> </td>
   <td>textField<br type="_moz" /> </td>
   <td>textfieldwidget<br type="_moz" /> </td>
   <td>input type=text<br type="_moz" /> </td>
  </tr>
  <tr>
   <td>TimeField<br type="_moz" /> </td>
   <td>textfield<br type="_moz" /> </td>
   <td>textField<br type="_moz" /> </td>
   <td>textfieldwidget<br type="_moz" /> </td>
   <td>input type=text<br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

## CSS classes for different Draw Elements {#css-classes-for-different-draw-elements}

You can insert static draw elements like text, and images, using the AEM Forms Designer. For each draw element, a separate CSS class is associated with that element. The list of CSS classes for draw elements is listed below. Every draw element has a draw class associated with it.

| **Draw Type** |**CSS class** |
|---|---|
| Text |text |
| Image |image |
| Rectangle |rectangle |
| Line |line |

## Styling other parts of the form {#styling-other-parts-of-the-form}

Besides the appearance of UI components in the HTML form, you can change the style of elements like Inline Errors, Inline Warnings, and fields with validation errors.

`Styling Inline Errors`

When the validation of a field results in an error, an inline error is displayed when the field in active. To change the style of inline errors, override the CSS ID **error-msg**.

`Styling Inline Warnings`

When the validation of a field results in a warning, an inline warning is displayed when the field is active. To change the style of these inline warnings, override the CSS ID **warning-msg**.

`Styling Fields with Validation Errors`

When validation for a field fails, the style of the widget changes. This style change is done by applying a CSS class **widgetError** on the widget component. To modify the default styling, override the **widgetError** class.
