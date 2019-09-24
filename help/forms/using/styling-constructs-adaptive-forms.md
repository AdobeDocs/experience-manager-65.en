---
title: Styling constructs for adaptive forms
seo-title: Styling constructs for adaptive forms
description: Use LESS framework to customize appearance of adaptive forms.
seo-description: Use LESS framework to customize appearance of adaptive forms.
uuid: 1a0f194c-0875-41de-a2bb-013d5730f686
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop
discoiquuid: f968eac1-6338-49e9-9af6-2c3a938e355e
index: y
internal: n
snippet: y
---

# Styling constructs for adaptive forms{#styling-constructs-for-adaptive-forms}

## Prerequisites {#prerequisites}

Knowledge of CSS and the LESS framework.

## What can be customized {#what-can-be-customized}

The article lists publicly available css classes of adaptive forms. You can leverage these classes to style various components of an adaptive form. The styling of authoring components, such as dialogs and status bars that display warnings are beyond the scope of this article. Use these styling constructs to create styles (using CSS or Less) only when you are unable to style components using [theme editor](https://helpx.adobe.com/experience-manager/6-3/forms/using/themes.html).

## Customizing styles in adaptive forms {#customizing-styles-in-adaptive-forms}

The LESS framework simplifies the use case to customize styles in adaptive forms. The framework lets you define styles using a set of variables and functions (mixins). The LESS framework helps reduce the size of the bundled code and increases its reusability.

You can customize adaptive form styles in the following ways:

* Change the theme
* Change component's style

## Changing theme {#changing-theme}

You can change the theme of an adaptive form to ensure that its appearance is consistent with the web pages where the adaptive form is embedded.

Changes in the overall appearance of the adaptive form using CSS properties are typically part of theme changes. Major changes to the lo ``ok and feel of the adaptive form, such as changes in the layout and placement of components are not considered theme changes.

Based on the bootstrap, the following set of CSS properties define the theme of a web page:

* Background color
* Border (type, color, thickness)
* Font Color
* Padding
* Margin
* Font Size
* LineHeight

Currently, LESS variables are defined only for these properties of the various elements in an adaptive form.

## Changing component style {#changing-component-style}

You can make changes to the appearance, layout, positioning, and visibility of elements. To achieve this task, create or update your custom .css files to include the styling constructs listed in this article.

To apply a style to an adaptive form, open the adaptive form in for editing, open properties of adaptive form conatiner, specify the path of custom CSS File in the basic tab. Defaut styling constructs of the adaptive form and overridden with the constructs listed in the custom .css file.

## Components {#components}

The components discussed in this article have their predefined CSS classes. You can edit the variables to modify the styles in the CSS classes. Alternatively, you can rewrite the entire class. This section describes the classes within components and styles that you can modify using variables.

## Container styling {#container-styling}

A container is the top- `` level component. Other panels and fields lie under the container component.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">guideContainerNode</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="195"><p><strong>Variables Description</strong></p> </td> 
   <td valign="top" width="126"><p><strong>Variables Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="195"><p><span class="code">container-bgColor</span></p> </td> 
   <td valign="top" width="126"><p>Background color of the container</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="195"><p><span class="code">container-padding</span></p> </td> 
   <td valign="top" width="126"><p>Padding for the container</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="195"><p><span class="code">container-margin</span></p> </td> 
   <td valign="top" width="126"><p>Margin for the container</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="195"><p><span class="code">container-fontColor</span></p> </td> 
   <td valign="top" width="126"><p>Font color for the container</p> </td> 
  </tr> 
 </tbody> 
</table>

## Field styling {#field-styling}

Adaptive forms include various types of fields. Each field has a unique class name, which is the name of the field. The field also has a common class name `guideFieldNode`.

Fields include labels, widgets, Help description (both Long and Short description), and Field Help icons (question mark).

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">guideFieldNode</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">field-padding</span><strong></strong></p> </td> 
   <td valign="top" width="308"><p>Padding for the field</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">field-error-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color of the error message of field</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">field-error-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size of the error message of field</p> </td> 
  </tr> 
 </tbody> 
</table>

## Label styling {#label-styling}

The HTML element **label** used for the field includes the classes **left** or **top **depending on whether the label is at the top or left.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">guideFieldLabel</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">label-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for the field label</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">label-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size for the field label</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">label-line-height</span></p> </td> 
   <td valign="top" width="308">CSS line height property for the field label </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">label-font-weight</span></p> </td> 
   <td valign="top" width="308">CSS font weight property for the field label </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">label-margin</span></p> </td> 
   <td valign="top" width="308"><p>Margin for the field label</p> </td> 
  </tr> 
 </tbody> 
</table>

The CSS rules for the label are applied using the **guideFieldLabel **label. If you are an author, override this rule to make your custom changes visible.

## Widgets styling {#widgets-styling}

Depending on their type, widgets also include classes. Commonly, widgets include the `guideFieldWidget` class. The widgets that ship with HTML normally use the standard HTML element input and select. The styling is done accordingly. You cannot style a custom widget by changing the variables.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">guideFieldWidget</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables <span class="code"></span></strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-bg-color</span></p> </td> 
   <td valign="top" width="308">Background color for the widgets (Doesn't work for check box and radio button)</td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color for the widgets</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-border-thickness</span></p> </td> 
   <td valign="top" width="308"><p>Border size for the widgets</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-border-radius</span></p> </td> 
   <td valign="top" width="308"><p>Border radius for the widgets</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-border-type</span></p> </td> 
   <td valign="top" width="308"><p>Border type for the widgets</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widget-border-focus-type</span></p> </td> 
   <td valign="top" width="308"><p>Focus type for widget borders</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-border</span></p> </td> 
   <td valign="top" width="308"><p>Consolidated border style of widgets</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Color of the text inside the widget</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Size of the text inside the widget</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-line-height</span></p> </td> 
   <td valign="top" width="308">CSS lineheight property for the widget </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-padding</span></p> </td> 
   <td valign="top" width="308"><p>CSS padding property for the widget</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-focus-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color when the widget is in focus</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-mandatory-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color of the widget for the mandatory fields</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-mandatory-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color of the widget for the mandatory fields</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-disabled-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the widget when the field is disabled</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-disabled-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for the widget when the field is disabled</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-disabled-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border Color for the widget when the field is disabled</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widget-height</span></p> </td> 
   <td valign="top" width="308">Height of the widget (Doesn't work for checkbox and radio button)</td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">checkbutton-height</span></p> </td> 
   <td valign="top" width="308"><p>Height for check box and radio button.</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">listboxwidget-height</span></p> </td> 
   <td valign="top" width="308"><p>Maximum height for a multi-select dropdown</p> </td> 
  </tr> 
 </tbody> 
</table>

### Limitations in widget styling {#limitations-in-widget-styling}

The styling for focused, mandatory, and disabled fields is restricted using variables. However, you can change it by overriding the styles. Restriction using variables is provided mainly to keep the number of variables in check. The restriction can be relaxed if the appearance of a field drastically changes because it is in any of the states discussed earlier.

## Help description {#help-description}

An author can specify the Help content in the fields using Short and Long description components. Both components have a common class `.guideHelpDescription` and another class `.long`/ `.short`, depending on the type of description. The Help content is enclosed in a paragraph element to override the styling of the description. The Help description (both long and short) is modified using variables starting with widgetshelp, as mentioned in following table:

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-help-long-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color of the widgets' long Help</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-help-long-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color of the widgets' long Help</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-help-long-border-indicator-color</span></p> </td> 
   <td valign="top" width="308"><p>Left indicator border color of the widgets' long Help</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-help-short-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color of the widgets' short Help</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-help-short-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color of the widgets' short Help</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-help-short-tooltip-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color of the widgets' short tool tip Help</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">widgets-help-short-tooltip-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color of the widgets' short tool tip Help</p> </td> 
  </tr> 
 </tbody> 
</table>

## Terms and Conditions {#terms-and-conditions}

The Terms and Conditions (TnC `` ``) widget lets you specify terms and conditions. You can customize the widget using the variables described in the following table.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><span class="code">tnc-unvisited</span></td> 
   <td valign="top" width="308">Font color of unvisited tnc link.</td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><span class="code">tnc-visited</span></td> 
   <td valign="top" width="308">Font color of visited tnc link.</td> 
  </tr> 
 </tbody> 
</table>

## Button {#button}

Buttons are also widgets. However, their styling is slightly different from the widgets. In adaptive forms, any of the following constitutes a button:

* input[type = text]
* button
* element with class .button

HTML code for button:

`<button type="button" >`

`<span class="iconButtonicon"></`

`span>`

`<span class="iconButtonlabel"></`

`span>`

`</button>`

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>CSS Class</strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">iconButton-icon</span></p> </td> 
   <td valign="top" width="308"><p>Provides icons for button</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">iconButton-label</span></p> </td> 
   <td valign="top" width="308"><p>Styles button label/caption</p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables <span class="code"></span></strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-border-size</span></p> </td> 
   <td valign="top" width="308"><p>Border size for the buttons</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-border-type</span></p> </td> 
   <td valign="top" width="308"><p>Border type</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-padding</span></p> </td> 
   <td valign="top" width="308"><p>CSS padding property for the button</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size for the button</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-background-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the button</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color of the button</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color of the button</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-large-padding</span></p> </td> 
   <td valign="top" width="308"><p>Padding for the large buttons (buttons with class .buttonlarge)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-large-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size for large buttons</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-small-padding</span></p> </td> 
   <td valign="top" width="308"><p>Padding for the small buttons (buttons with class .buttonsmall)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-small-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size for small buttons</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-info-background-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for informative buttons (buttons with class .buttoninformative)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-info-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for informative buttons</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-info-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color for informative buttons</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-warning-background-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for warning styled buttons (buttons with class .buttonwarning)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-warning-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for warning styled buttons</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-warning-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color for warning styled buttons</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-alert-background-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for alert buttons (buttons with class .buttonalert)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-alert-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for alert buttons</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-alert-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color for alert buttons</p> </td> 
  </tr> 
 </tbody> 
</table>

## Question mark {#question-mark}

For the widgets, a questionMark is displayed when an author adds a long description in the Help content. The default icon provided in bootstrap is used. To use a custom icon, you can customize the bootstrap icons.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">guideHelpQuestionMark</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">questionmark-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Color of the icon</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">questionmark-hover-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Color of the icon when mouse is hovered over it</p> </td> 
  </tr> 
 </tbody> 
</table>

## Table {#table}

You can change the color theme for header and body rows in a table by using the following variables.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">table-header-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the header row. The default value is <span class="code">#333</span>.<br /> </p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">table-odd-row-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the odd body row. The default value is <span class="code">rgb(255, 255, 255)</span>.</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">table-even-row-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the even body row. The default value is <span class="code">#eee</span>.</p> </td> 
  </tr> 
 </tbody> 
</table>

## File Attachment {#file-attachment}

The File Attachment widget of adaptive forms lets you upload files. You can also customize the widget using the variables.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">fileItemPadding</span></p> </td> 
   <td valign="top" width="308"><p>Padding for the files displayed in the widget</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">fileItemBackground</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the file item</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">fileItemBorderColor</span></p> </td> 
   <td valign="top" width="308"><p>Border color for the top border</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">fileItemColor</span></p> </td> 
   <td valign="top" width="308"><p>Font color for the file item</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">filePreviewIconColor</span></p> </td> 
   <td valign="top" width="308"><p>Color for the Preview icon (Bootstrap icon) in the widget</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">fileItemCommentHeight</span></p> </td> 
   <td valign="top" width="308"><p>Height of comment for the file item</p> </td> 
  </tr> 
 </tbody> 
</table>

## Navigator Styles {#navigator-styles}

There are four types of navigator tabs. These include tabs on the left, top, in the wizard and accordion. Each navigator has a different class.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Naviagator</strong></p> </td> 
   <td valign="top" width="308"><p><strong>CSS class</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">Accordion</span></p> </td> 
   <td valign="top" width="308"><p>.accordion-navigators</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs on the left</span></p> </td> 
   <td valign="top" width="308"><p>.tab-navigators-vertical</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs on the top</span></p> </td> 
   <td valign="top" width="308"><p>.tab-navigators</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">Wizard</span></p> </td> 
   <td valign="top" width="308"><p>.wizard-navigators</p> </td> 
  </tr> 
 </tbody> 
</table>

The following is the HTML code for the tab navigator element is (similar to the bootstrap tabs):

`<li>`

`<a>tab title</a>`

`</li>`

`Accordion navigator is an exception, it has following barebone`

`structure:`

`<div class="accordion.navigators">`

`<div>`

`<div class = "guideHeader">`

`<a>`

`<span class = "guideSummary" ></span>`

`........................... repeatable buttons, if the repeatable configuration is set ................................`

`<div class = "repeatableButtons">`

`<button name="Add" class="Add"/>`

`<button name="Remove" class="Remove"/>`

`</div>`

`</a>`

`</div>`

`................................ panel content ..................................`

`</div>`

`</div>`

You can change the styling of the navigator using CSS rules that select the elements using **descendant** selectors.** **For example, to add a text decoration style to the anchor tag:

Tab navigator on top:

`.tab-navigators`

`li a {`

`text-decoration:`

`underline;`

`}`

`Tab navigator on left:`

`.tab-navigators-vertical`

`li a {`

`text-decoration:`

`underline;`

`}`

`Accordion navigator:`

`.accordion-navigators .guideHeader a .guideSummary {`

`text-decoration:`

`underline;`

`}`

`Wizard navigator:`

`.wizard-navigators`

`li a {`

`text-decoration:`

`underline;`

`}`

Additionally, there are classes to style tab navigators (both left and top) based on whether they have nested/child/sub navigators.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>CSS Class</strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">nested_true</span></p> </td> 
   <td valign="top" width="308"><p>Tab navigators (left and top) that have nested/child/sub navigators</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">nested_false</span></p> </td> 
   <td valign="top" width="308"><p>Tab navigators (left and top) that don't have nested/child/sub navigators</p> </td> 
  </tr> 
 </tbody> 
</table>

The guideNavIcon class provides a default icon to tab navigators (both left and top) and wizard navigators.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">guideNavIcon</span></p> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>You can change the icon for a particular navigator by providing a CSS class on the panel in authoring, form example &lt;CLASS_NAME&gt;. You add a **&lt;CLASS_NAME&gt;_nav **for the icon of the navigator.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><strong>Tab Navigators</strong></p> </td> 
   <td valign="top" width="308"><p> </p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">navigator-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the entire tab navigator</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the tab</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for the tab</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-hover-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the tab on hover</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-hover-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for the tab on hover</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-active-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color when the panel is in focus (active)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-active-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color when the panel is in focus</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-completed-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color when the completion expression of the panel returns true</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-completed-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color when the completion expression of the panel returns true</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-stepped-bg-color</span></p> </td> 
   <td valign="top" width="308">Background color when the panel has been in focus once but the completion expression returns false </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-stepped-font-color</span></p> </td> 
   <td valign="top" width="308">Font color when the panel has been in focus once but the completion expression returns false </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color for the tab</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size for the tab</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-padding</span></p> </td> 
   <td valign="top" width="308"><p>Padding for the tab</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-margin</span></p> </td> 
   <td valign="top" width="308"><p>Margin for the tab</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-vertical-margin</span></p> </td> 
   <td valign="top" width="308"><p>Margin for the vertical tabs</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-border-thickness</span></p> </td> 
   <td valign="top" width="308"><p>Border size for the tabs</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-min-height</span></p> </td> 
   <td valign="top" width="308"><p>Minimum height of the tabs</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">heirarichal-indent</span></p> </td> 
   <td valign="top" width="308"><p>Indentation for the nested tabs</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><strong>Wizard Navigators</strong></p> </td> 
   <td valign="top" width="308"><p> </p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-navigator-bg-color</span></p> </td> 
   <td valign="top" width="308">Background color for entire wizard navigator</td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background Color for the wizard</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for the wizard</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-active-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color when the panel is in focus (active)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-active-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color when the panel is in focus (focused)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-completed-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color when the completion expression of the panel returns true</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-completed-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color when the completion expression of the panel returns true</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-stepped-bg-color</span></p> </td> 
   <td valign="top" width="308">Background color when the panel has been in focus once but completion expression returns false</td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-stepped-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color when the panel has been focused once but completion expression returns false</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Color for the wizard</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size for the wizard</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-padding</span></p> </td> 
   <td valign="top" width="308"><p>Padding for the wizard</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-tabs-border-thickness</span></p> </td> 
   <td valign="top" width="308"><p>Border size for the wizard</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-nav-bullet-border</span></p> </td> 
   <td valign="top" width="308"><p>Border color of the wizard navigator bullet (prefixing the caption/label)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-progress-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color of the wizard navigator progress bar</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">wizard-progress-color</span></p> </td> 
   <td valign="top" width="308"><p>Fill color for the progress bar</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><strong>Accordion Navigators</strong></p> </td> 
   <td valign="top" width="308"><p> </p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">accordion-tabs-padding</span></p> </td> 
   <td valign="top" width="308"><p>Padding for accordion</p> </td> 
  </tr> 
 </tbody> 
</table>

## Panel styling {#panel-styling}

A Panel includes an optional toolbar and its content.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">guidePanelNode</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">panel-background-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the panel</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">panel-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size for the panel text</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">panel-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for the panel text<br /> </p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">panel-padding</span></p> </td> 
   <td valign="top" width="308"><p>Padding inside the panel</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">panel-description-font-size</span></p> </td> 
   <td valign="top" width="308"><p>Font size of panel's description</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">panel-description-padding</span></p> </td> 
   <td valign="top" width="308"><p>Padding of panel's description</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">panel-help-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the panel's help</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">panel-help-border-indicator-color</span></p> </td> 
   <td valign="top" width="308"><p>Indicator border color for the panel's help</p> </td> 
  </tr> 
 </tbody> 
</table>

The panel node is divided into navigators and content. There `` `` is no separate styling component for the content. The variables described are applied on navigator as well as content.

&#42;The topmost panel (RootPanel) doesn't have this class.

## Mobile styling {#mobile-styling}

## Header bar {#header-bar}

These variables influence the header bar that is visible on a mobile device or small screen devices that contain panel title and next and back navigators.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">guide-header-bar</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">headerbar-background-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for the header bar</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">headerbar-font-color</span></p> </td> 
   <td valign="top" width="308"><p>Font color for the text inside header bar</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">headerbar-padding</span></p> </td> 
   <td valign="top" width="308"><p>Padding for header bar</p> </td> 
  </tr> 
 </tbody> 
</table>

## Scroll indicator {#scroll-indicator}

These variables influence the Scroll indicator, which is an orange arrow that appears on a mobile device or small screen devices. A Scroll indicator indicates that there is content beyond the visible part of the screen. You can scroll down to see it. When you hit the end of content, the arrow disappears.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">mobileScrollIndicator</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">scrollIndicatorBottom</span></p> </td> 
   <td valign="top" width="308"><p>Fixed position of scrollindicator from bottom</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">scrollIndicatorRight</span></p> </td> 
   <td valign="top" width="308"><p>Fixed position of scrollindicator from right</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">scrollIndicatorWidth</span></p> </td> 
   <td valign="top" width="308"><p>Width of scrollindicator</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">scrollIndicatorHeight</span></p> </td> 
   <td valign="top" width="308"><p>Height of scrollindicator</p> </td> 
  </tr> 
 </tbody> 
</table>

## Mobile fixed toolbar layout-specific variables {#mobile-fixed-toolbar-layout-specific-variables}

These variables in the following table influence the mobile fixed toolbar layout.

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="121"><p><strong>CSS class </strong></p> </td> 
   <td valign="top" width="151"><p><span class="code">mobileToolbar</span></p> </td> 
  </tr> 
 </tbody> 
</table>

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">mobileToolbarBottom</span></p> </td> 
   <td valign="top" width="308"><p>Fixed position of toolbar, on mobile device, from bottom</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">mobileToolbarTop</span></p> </td> 
   <td valign="top" width="308"><p>Fixed position of toolbar, on mobile device, from top</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">mobileToolbarLeft</span></p> </td> 
   <td valign="top" width="308"><p>Fixed position of toolbar, on mobile device, from left</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">mobileToolbarRight</span></p> </td> 
   <td valign="top" width="308"><p>Fixed position of toolbar, on mobile device, from right</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">mobileButtonIconTopMargin</span></p> </td> 
   <td valign="top" width="308"><p>Fixed position of toolbar's buttons' icon, from top</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">mobileButtonIconWidth</span></p> </td> 
   <td valign="top" width="308"><p>Width of toolbar's buttons' icon on mobile device</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">mobileButtonIconHeight</span></p> </td> 
   <td valign="top" width="308"><p>Height of toolbar's buttons' icon on mobile device</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">mobilefixedtoolbarbgcolor</span></p> </td> 
   <td valign="top" width="308"><p>Background color of toolbar on mobile device</p> </td> 
  </tr> 
 </tbody> 
</table>

## Theme-specific variable {#theme-specific-variable}

The **Simple enrollment** theme at /etc/clientlibs/fd/af/guidetheme/simpleEnrollment and the category `guide.theme.simpleEnrollment` also introduce a few variables. If you want to create a theme enhancing simple enrollment, you can use the following ``extra variables:

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top" width="308"><p><strong>Variables </strong></p> </td> 
   <td valign="top" width="308"><p><strong>Description</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-focus-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for button on focus</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-hover-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for button on hover</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">button-radius</span></p> </td> 
   <td valign="top" width="308"><p>Radius of button</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">navigation-button-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for navigation buttons (back/next)</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">navigation-button-bg-hover-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for navigation buttons (back/next) on hover</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">initial-nav-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for wizard navigators and corresponding progress bar, when first rendered.</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">active-nav-color</span></p> </td> 
   <td valign="top" width="308">Background color for current / active wizard navigator and corresponding progress bar </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">visited-nav-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for wizard navigators and corresponding progress bar, which have been visited.</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-bifercating-border-color</span></p> </td> 
   <td valign="top" width="308"><p>Border color bifurcating container into navigators and panel</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-navigator-separator-color</span></p> </td> 
   <td valign="top" width="308"><p>Bottom border color separating tabs for tabs on left (tab navigators).</p> </td> 
  </tr> 
  <tr> 
   <td valign="top" width="308"><p><span class="code">tabs-child-nav-bg-color</span></p> </td> 
   <td valign="top" width="308"><p>Background color for navigator' nested/child/sub navigators</p> </td> 
  </tr> 
 </tbody> 
</table>

