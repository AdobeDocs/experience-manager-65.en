---
title: Styling constructs for adaptive forms
description: Use LESS framework to customize appearance of adaptive forms.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop

docset: aem65
feature: "Adaptive Forms,Foundation Components"
exl-id: 691608a6-be82-4d81-b876-427de997e5be
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Styling constructs for adaptive forms{#styling-constructs-for-adaptive-forms}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

## Prerequisites {#prerequisites}

Knowledge of CSS and the LESS framework.

## What can be customized {#what-can-be-customized}

The article lists publicly available css classes of adaptive forms. You can use these classes to style various components of an adaptive form. The styling of authoring components, such as dialogs and status bars that display warnings are beyond the scope of this article. Use these styling constructs to create styles (using CSS or Less) only when you are unable to style components using [theme editor](https://helpx.adobe.com/experience-manager/6-3/forms/using/themes.html).

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

You can change the appearance, layout, positioning, and visibility of elements. To achieve this task, create or update your custom .css files to include the styling constructs listed in this article.

To apply a style to an adaptive form, open the adaptive form in for editing, open properties of adaptive form conatiner, specify the path of custom CSS File in the basic tab. Defaut styling constructs of the adaptive form and overridden with the constructs listed in the custom .css file.

## Components {#components}

The components discussed in this article have their predefined CSS classes. You can edit the variables to modify the styles in the CSS classes. Alternatively, you can rewrite the entire class. This section describes the classes within components and styles that you can modify using variables.

## Container styling {#container-styling}

A container is the top-level component. Other panels and fields lie under the container component.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>guideContainerNode</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables Description</strong></p> </td>
   <td><p><strong>Variables Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>container-bgColor</code></p> </td>
   <td><p>Background color of the container</p> </td>
  </tr>
  <tr>
   <td><p><code>container-padding</code></p> </td>
   <td><p>Padding for the container</p> </td>
  </tr>
  <tr>
   <td><p><code>container-margin</code></p> </td>
   <td><p>Margin for the container</p> </td>
  </tr>
  <tr>
   <td><p><code>container-fontColor</code></p> </td>
   <td><p>Font color for the container</p> </td>
  </tr>
 </tbody>
</table>

## Field styling {#field-styling}

Adaptive forms include various types of fields. Each field has a unique class name, which is the name of the field. The field also has a common class name `guideFieldNode`.

Fields include labels, widgets, Help description (both Long and Short description), and Field Help icons (question mark).

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>guideFieldNode</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>field-padding</code><strong></strong></p> </td>
   <td><p>Padding for the field</p> </td>
  </tr>
  <tr>
   <td><p><code>field-error-font-color</code></p> </td>
   <td><p>Font color of the error message of field</p> </td>
  </tr>
  <tr>
   <td><p><code>field-error-font-size</code></p> </td>
   <td><p>Font size of the error message of field</p> </td>
  </tr>
 </tbody>
</table>

## Label styling {#label-styling}

The HTML element **label** used for the field includes the classes **left** or **top** depending on whether the label is at the top or left.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>guideFieldLabel</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>label-font-color</code></p> </td>
   <td><p>Font color for the field label</p> </td>
  </tr>
  <tr>
   <td><p><code>label-font-size</code></p> </td>
   <td><p>Font size for the field label</p> </td>
  </tr>
  <tr>
   <td><p><code>label-line-height</code></p> </td>
   <td>CSS line height property for the field label </td>
  </tr>
  <tr>
   <td><p><code>label-font-weight</code></p> </td>
   <td>CSS font weight property for the field label </td>
  </tr>
  <tr>
   <td><p><code>label-margin</code></p> </td>
   <td><p>Margin for the field label</p> </td>
  </tr>
 </tbody>
</table>

The CSS rules for the label are applied using the **guideFieldLabel** label. If you are an author, override this rule to make your custom changes visible.

## Widgets styling {#widgets-styling}

Depending on their type, widgets also include classes. Commonly, widgets include the `guideFieldWidget` class. The widgets that ship with HTML normally use the standard HTML element input and select. The styling is done accordingly. You cannot style a custom widget by changing the variables.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>guideFieldWidget</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables <code></code></strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-bg-color</code></p> </td>
   <td>Background color for the widgets (Does not work for check box and radio button)</td>
  </tr>
  <tr>
   <td><p><code>widgets-border-color</code></p> </td>
   <td><p>Border color for the widgets</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-border-thickness</code></p> </td>
   <td><p>Border size for the widgets</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-border-radius</code></p> </td>
   <td><p>Border radius for the widgets</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-border-type</code></p> </td>
   <td><p>Border type for the widgets</p> </td>
  </tr>
  <tr>
   <td><p><code>widget-border-focus-type</code></p> </td>
   <td><p>Focus type for widget borders</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-border</code></p> </td>
   <td><p>Consolidated border style of widgets</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-font-color</code></p> </td>
   <td><p>Color of the text inside the widget</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-font-size</code></p> </td>
   <td><p>Size of the text inside the widget</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-line-height</code></p> </td>
   <td>CSS lineheight property for the widget </td>
  </tr>
  <tr>
   <td><p><code>widgets-padding</code></p> </td>
   <td><p>CSS padding property for the widget</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-focus-border-color</code></p> </td>
   <td><p>Border color when the widget is in focus</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-mandatory-border-color</code></p> </td>
   <td><p>Border color of the widget for the mandatory fields</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-mandatory-bg-color</code></p> </td>
   <td><p>Background color of the widget for the mandatory fields</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-disabled-bg-color</code></p> </td>
   <td><p>Background color for the widget when the field is disabled</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-disabled-font-color</code></p> </td>
   <td><p>Font color for the widget when the field is disabled</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-disabled-border-color</code></p> </td>
   <td><p>Border Color for the widget when the field is disabled</p> </td>
  </tr>
  <tr>
   <td><p><code>widget-height</code></p> </td>
   <td>Height of the widget (Does not work for checkbox and radio button)</td>
  </tr>
  <tr>
   <td><p><code>checkbutton-height</code></p> </td>
   <td><p>Height for check box and radio button.</p> </td>
  </tr>
  <tr>
   <td><p><code>listboxwidget-height</code></p> </td>
   <td><p>Maximum height for a multi-select dropdown</p> </td>
  </tr>
 </tbody>
</table>

### Limitations in widget styling {#limitations-in-widget-styling}

The styling for focused, mandatory, and disabled fields is restricted using variables. However, you can change it by overriding the styles. Restriction using variables is provided mainly to keep the number of variables in check. The restriction can be relaxed if the appearance of a field drastically changes because it is in any of the states discussed earlier.

## Help description {#help-description}

An author can specify the Help content in the fields using Short and Long description components. Both components have a common class `.guideHelpDescription` and another class `.long`/ `.short`, depending on the type of description. The Help content is enclosed in a paragraph element to override the styling of the description. The Help description (both long and short) is modified using variables starting with widgetshelp, as mentioned in following table:

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-help-long-bg-color</code></p> </td>
   <td><p>Background color of the widgets' long Help</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-help-long-border-color</code></p> </td>
   <td><p>Border color of the widgets' long Help</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-help-long-border-indicator-color</code></p> </td>
   <td><p>Left indicator border color of the widgets' long Help</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-help-short-bg-color</code></p> </td>
   <td><p>Background color of the widgets' short Help</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-help-short-color</code></p> </td>
   <td><p>Font color of the widgets' short Help</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-help-short-tooltip-bg-color</code></p> </td>
   <td><p>Background color of the widgets' short tool tip Help</p> </td>
  </tr>
  <tr>
   <td><p><code>widgets-help-short-tooltip-color</code></p> </td>
   <td><p>Font color of the widgets' short tool tip Help</p> </td>
  </tr>
 </tbody>
</table>

## Terms and Conditions {#terms-and-conditions}

The Terms and Conditions (TnC `` ``) widget lets you specify terms and conditions. You can customize the widget using the variables described in the following table.

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><code>tnc-unvisited</code></td>
   <td>Font color of unvisited tnc link.</td>
  </tr>
  <tr>
   <td><code>tnc-visited</code></td>
   <td>Font color of visited tnc link.</td>
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

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS Class</strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>iconButton-icon</code></p> </td>
   <td><p>Provides icons for button</p> </td>
  </tr>
  <tr>
   <td><p><code>iconButton-label</code></p> </td>
   <td><p>Styles button label/caption</p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables <code></code></strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>button-border-size</code></p> </td>
   <td><p>Border size for the buttons</p> </td>
  </tr>
  <tr>
   <td><p><code>button-border-type</code></p> </td>
   <td><p>Border type</p> </td>
  </tr>
  <tr>
   <td><p><code>button-padding</code></p> </td>
   <td><p>CSS padding property for the button</p> </td>
  </tr>
  <tr>
   <td><p><code>button-font-size</code></p> </td>
   <td><p>Font size for the button</p> </td>
  </tr>
  <tr>
   <td><p><code>button-background-color</code></p> </td>
   <td><p>Background color for the button</p> </td>
  </tr>
  <tr>
   <td><p><code>button-font-color</code></p> </td>
   <td><p>Font color of the button</p> </td>
  </tr>
  <tr>
   <td><p><code>button-border-color</code></p> </td>
   <td><p>Border color of the button</p> </td>
  </tr>
  <tr>
   <td><p><code>button-large-padding</code></p> </td>
   <td><p>Padding for the large buttons (buttons with class .buttonlarge)</p> </td>
  </tr>
  <tr>
   <td><p><code>button-large-font-size</code></p> </td>
   <td><p>Font size for large buttons</p> </td>
  </tr>
  <tr>
   <td><p><code>button-small-padding</code></p> </td>
   <td><p>Padding for the small buttons (buttons with class .buttonsmall)</p> </td>
  </tr>
  <tr>
   <td><p><code>button-small-font-size</code></p> </td>
   <td><p>Font size for small buttons</p> </td>
  </tr>
  <tr>
   <td><p><code>button-info-background-color</code></p> </td>
   <td><p>Background color for informative buttons (buttons with class .buttoninformative)</p> </td>
  </tr>
  <tr>
   <td><p><code>button-info-font-color</code></p> </td>
   <td><p>Font color for informative buttons</p> </td>
  </tr>
  <tr>
   <td><p><code>button-info-border-color</code></p> </td>
   <td><p>Border color for informative buttons</p> </td>
  </tr>
  <tr>
   <td><p><code>button-warning-background-color</code></p> </td>
   <td><p>Background color for warning styled buttons (buttons with class .buttonwarning)</p> </td>
  </tr>
  <tr>
   <td><p><code>button-warning-font-color</code></p> </td>
   <td><p>Font color for warning styled buttons</p> </td>
  </tr>
  <tr>
   <td><p><code>button-warning-border-color</code></p> </td>
   <td><p>Border color for warning styled buttons</p> </td>
  </tr>
  <tr>
   <td><p><code>button-alert-background-color</code></p> </td>
   <td><p>Background color for alert buttons (buttons with class .buttonalert)</p> </td>
  </tr>
  <tr>
   <td><p><code>button-alert-font-color</code></p> </td>
   <td><p>Font color for alert buttons</p> </td>
  </tr>
  <tr>
   <td><p><code>button-alert-border-color</code></p> </td>
   <td><p>Border color for alert buttons</p> </td>
  </tr>
 </tbody>
</table>

## Question mark {#question-mark}

For the widgets, a questionMark is displayed when an author adds a long description in the Help content. The default icon provided in bootstrap is used. To use a custom icon, you can customize the bootstrap icons.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>guideHelpQuestionMark</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>questionmark-font-color</code></p> </td>
   <td><p>Color of the icon</p> </td>
  </tr>
  <tr>
   <td><p><code>questionmark-hover-font-color</code></p> </td>
   <td><p>Color of the icon when mouse is hovered over it</p> </td>
  </tr>
 </tbody>
</table>

## Table {#table}

You can change the color theme for header and body rows in a table by using the following variables.

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>table-header-bg-color</code></p> </td>
   <td><p>Background color for the header row. The default value is <code>#333</code>.<br /> </p> </td>
  </tr>
  <tr>
   <td><p><code>table-odd-row-bg-color</code></p> </td>
   <td><p>Background color for the odd body row. The default value is <code>rgb(255, 255, 255)</code>.</p> </td>
  </tr>
  <tr>
   <td><p><code>table-even-row-bg-color</code></p> </td>
   <td><p>Background color for the even body row. The default value is <code>#eee</code>.</p> </td>
  </tr>
 </tbody>
</table>

## File Attachment {#file-attachment}

The File Attachment widget of adaptive forms lets you upload files. You can also customize the widget using the variables.

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>fileItemPadding</code></p> </td>
   <td><p>Padding for the files displayed in the widget</p> </td>
  </tr>
  <tr>
   <td><p><code>fileItemBackground</code></p> </td>
   <td><p>Background color for the file item</p> </td>
  </tr>
  <tr>
   <td><p><code>fileItemBorderColor</code></p> </td>
   <td><p>Border color for the top border</p> </td>
  </tr>
  <tr>
   <td><p><code>fileItemColor</code></p> </td>
   <td><p>Font color for the file item</p> </td>
  </tr>
  <tr>
   <td><p><code>filePreviewIconColor</code></p> </td>
   <td><p>Color for the Preview icon (Bootstrap icon) in the widget</p> </td>
  </tr>
  <tr>
   <td><p><code>fileItemCommentHeight</code></p> </td>
   <td><p>Height of comment for the file item</p> </td>
  </tr>
 </tbody>
</table>

## Navigator Styles {#navigator-styles}

There are four types of navigator tabs. These include tabs on the left, top, in the wizard and accordion. Each navigator has a different class.

<table>
 <tbody>
  <tr>
   <td><p><strong>Naviagator</strong></p> </td>
   <td><p><strong>CSS class</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>Accordion</code></p> </td>
   <td><p>.accordion-navigators</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs on the left</code></p> </td>
   <td><p>.tab-navigators-vertical</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs on the top</code></p> </td>
   <td><p>.tab-navigators</p> </td>
  </tr>
  <tr>
   <td><p><code>Wizard</code></p> </td>
   <td><p>.wizard-navigators</p> </td>
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

`<span class = "guideSummary" ></code>`

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

You can change the styling of the navigator using CSS rules that select the elements using **descendant** selectors. For example, to add a text decoration style to the anchor tag:

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

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS Class</strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>nested_true</code></p> </td>
   <td><p>Tab navigators (left and top) that have nested/child/sub navigators</p> </td>
  </tr>
  <tr>
   <td><p><code>nested_false</code></p> </td>
   <td><p>Tab navigators (left and top) that do not have nested/child/sub navigators</p> </td>
  </tr>
 </tbody>
</table>

The guideNavIcon class provides a default icon to tab navigators (both left and top) and wizard navigators.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>guideNavIcon</code></p> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>You can change the icon for a particular navigator by providing a CSS class on the panel in authoring, form example &lt;CLASS_NAME&gt;. You add a **&lt;CLASS_NAME&gt;_nav** for the icon of the navigator.

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><strong>Tab Navigators</strong></p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p><code>navigator-bg-color</code></p> </td>
   <td><p>Background color for the entire tab navigator</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-bg-color</code></p> </td>
   <td><p>Background color for the tab</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-font-color</code></p> </td>
   <td><p>Font color for the tab</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-hover-bg-color</code></p> </td>
   <td><p>Background color for the tab on hover</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-hover-font-color</code></p> </td>
   <td><p>Font color for the tab on hover</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-active-bg-color</code></p> </td>
   <td><p>Background color when the panel is in focus (active)</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-active-font-color</code></p> </td>
   <td><p>Font color when the panel is in focus</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-completed-bg-color</code></p> </td>
   <td><p>Background color when the completion expression of the panel returns true</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-completed-font-color</code></p> </td>
   <td><p>Font color when the completion expression of the panel returns true</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-stepped-bg-color</code></p> </td>
   <td>Background color when the panel has been in focus once but the completion expression returns false </td>
  </tr>
  <tr>
   <td><p><code>tabs-stepped-font-color</code></p> </td>
   <td>Font color when the panel has been in focus once but the completion expression returns false </td>
  </tr>
  <tr>
   <td><p><code>tabs-border-color</code></p> </td>
   <td><p>Border color for the tab</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-font-size</code></p> </td>
   <td><p>Font size for the tab</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-padding</code></p> </td>
   <td><p>Padding for the tab</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-margin</code></p> </td>
   <td><p>Margin for the tab</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-vertical-margin</code></p> </td>
   <td><p>Margin for the vertical tabs</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-border-thickness</code></p> </td>
   <td><p>Border size for the tabs</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-min-height</code></p> </td>
   <td><p>Minimum height of the tabs</p> </td>
  </tr>
  <tr>
   <td><p><code>heirarichal-indent</code></p> </td>
   <td><p>Indentation for the nested tabs</p> </td>
  </tr>
  <tr>
   <td><p><strong>Wizard Navigators</strong></p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-navigator-bg-color</code></p> </td>
   <td>Background color for entire wizard navigator</td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-bg-color</code></p> </td>
   <td><p>Background Color for the wizard</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-font-color</code></p> </td>
   <td><p>Font color for the wizard</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-active-bg-color</code></p> </td>
   <td><p>Background color when the panel is in focus (active)</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-active-font-color</code></p> </td>
   <td><p>Font color when the panel is in focus (focused)</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-completed-bg-color</code></p> </td>
   <td><p>Background color when the completion expression of the panel returns true</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-completed-font-color</code></p> </td>
   <td><p>Font color when the completion expression of the panel returns true</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-stepped-bg-color</code></p> </td>
   <td>Background color when the panel has been in focus once but completion expression returns false</td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-stepped-font-color</code></p> </td>
   <td><p>Font color when the panel has been focused once but completion expression returns false</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-border-color</code></p> </td>
   <td><p>Color for the wizard</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-font-size</code></p> </td>
   <td><p>Font size for the wizard</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-padding</code></p> </td>
   <td><p>Padding for the wizard</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-tabs-border-thickness</code></p> </td>
   <td><p>Border size for the wizard</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-nav-bullet-border</code></p> </td>
   <td><p>Border color of the wizard navigator bullet (prefixing the caption/label)</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-progress-bg-color</code></p> </td>
   <td><p>Background color of the wizard navigator progress bar</p> </td>
  </tr>
  <tr>
   <td><p><code>wizard-progress-color</code></p> </td>
   <td><p>Fill color for the progress bar</p> </td>
  </tr>
  <tr>
   <td><p><strong>Accordion Navigators</strong></p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td><p><code>accordion-tabs-padding</code></p> </td>
   <td><p>Padding for accordion</p> </td>
  </tr>
 </tbody>
</table>

## Panel styling {#panel-styling}

A Panel includes an optional toolbar and its content.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>guidePanelNode</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>panel-background-color</code></p> </td>
   <td><p>Background color for the panel</p> </td>
  </tr>
  <tr>
   <td><p><code>panel-font-size</code></p> </td>
   <td><p>Font size for the panel text</p> </td>
  </tr>
  <tr>
   <td><p><code>panel-font-color</code></p> </td>
   <td><p>Font color for the panel text<br /> </p> </td>
  </tr>
  <tr>
   <td><p><code>panel-padding</code></p> </td>
   <td><p>Padding inside the panel</p> </td>
  </tr>
  <tr>
   <td><p><code>panel-description-font-size</code></p> </td>
   <td><p>Font size of panel's description</p> </td>
  </tr>
  <tr>
   <td><p><code>panel-description-padding</code></p> </td>
   <td><p>Padding of panel's description</p> </td>
  </tr>
  <tr>
   <td><p><code>panel-help-bg-color</code></p> </td>
   <td><p>Background color for the panel's help</p> </td>
  </tr>
  <tr>
   <td><p><code>panel-help-border-indicator-color</code></p> </td>
   <td><p>Indicator border color for the panel's help</p> </td>
  </tr>
 </tbody>
</table>

The panel node is divided into navigators and content. There `` `` is no separate styling component for the content. The variables described are applied on navigator and content.

The topmost panel (RootPanel) does not have this class.

## Mobile styling {#mobile-styling}

## Header bar {#header-bar}

These variables influence the header bar that is visible on a mobile device or small screen devices that contain panel title and next and back navigators.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>guide-header-bar</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>headerbar-background-color</code></p> </td>
   <td><p>Background color for the header bar</p> </td>
  </tr>
  <tr>
   <td><p><code>headerbar-font-color</code></p> </td>
   <td><p>Font color for the text inside header bar</p> </td>
  </tr>
  <tr>
   <td><p><code>headerbar-padding</code></p> </td>
   <td><p>Padding for header bar</p> </td>
  </tr>
 </tbody>
</table>

## Scroll indicator {#scroll-indicator}

These variables influence the Scroll indicator, which is an orange arrow that appears on a mobile device or small screen devices. A Scroll indicator indicates that there is content beyond the visible part of the screen. You can scroll down to see it. When you hit the end of content, the arrow disappears.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>mobileScrollIndicator</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>scrollIndicatorBottom</code></p> </td>
   <td><p>Fixed position of scrollindicator from bottom</p> </td>
  </tr>
  <tr>
   <td><p><code>scrollIndicatorRight</code></p> </td>
   <td><p>Fixed position of scrollindicator from right</p> </td>
  </tr>
  <tr>
   <td><p><code>scrollIndicatorWidth</code></p> </td>
   <td><p>Width of scrollindicator</p> </td>
  </tr>
  <tr>
   <td><p><code>scrollIndicatorHeight</code></p> </td>
   <td><p>Height of scrollindicator</p> </td>
  </tr>
 </tbody>
</table>

## Mobile fixed toolbar layout-specific variables {#mobile-fixed-toolbar-layout-specific-variables}

These variables in the following table influence the mobile fixed toolbar layout.

<table>
 <tbody>
  <tr>
   <td><p><strong>CSS class </strong></p> </td>
   <td><p><code>mobileToolbar</code></p> </td>
  </tr>
 </tbody>
</table>

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>mobileToolbarBottom</code></p> </td>
   <td><p>Fixed position of toolbar, on mobile device, from bottom</p> </td>
  </tr>
  <tr>
   <td><p><code>mobileToolbarTop</code></p> </td>
   <td><p>Fixed position of toolbar, on mobile device, from top</p> </td>
  </tr>
  <tr>
   <td><p><code>mobileToolbarLeft</code></p> </td>
   <td><p>Fixed position of toolbar, on mobile device, from left</p> </td>
  </tr>
  <tr>
   <td><p><code>mobileToolbarRight</code></p> </td>
   <td><p>Fixed position of toolbar, on mobile device, from right</p> </td>
  </tr>
  <tr>
   <td><p><code>mobileButtonIconTopMargin</code></p> </td>
   <td><p>Fixed position of toolbar's buttons' icon, from top</p> </td>
  </tr>
  <tr>
   <td><p><code>mobileButtonIconWidth</code></p> </td>
   <td><p>Width of toolbar's buttons' icon on mobile device</p> </td>
  </tr>
  <tr>
   <td><p><code>mobileButtonIconHeight</code></p> </td>
   <td><p>Height of toolbar's buttons' icon on mobile device</p> </td>
  </tr>
  <tr>
   <td><p><code>mobilefixedtoolbarbgcolor</code></p> </td>
   <td><p>Background color of toolbar on mobile device</p> </td>
  </tr>
 </tbody>
</table>

## Theme-specific variable {#theme-specific-variable}

The **Simple enrollment** theme at /etc/clientlibs/fd/af/guidetheme/simpleEnrollment and the category `guide.theme.simpleEnrollment` also introduce a few variables. If you want to create a theme enhancing simple enrollment, you can use the following ``extra variables:

<table>
 <tbody>
  <tr>
   <td><p><strong>Variables </strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>button-focus-bg-color</code></p> </td>
   <td><p>Background color for button on focus</p> </td>
  </tr>
  <tr>
   <td><p><code>button-hover-bg-color</code></p> </td>
   <td><p>Background color for button on hover</p> </td>
  </tr>
  <tr>
   <td><p><code>button-radius</code></p> </td>
   <td><p>Radius of button</p> </td>
  </tr>
  <tr>
   <td><p><code>navigation-button-bg-color</code></p> </td>
   <td><p>Background color for navigation buttons (back/next)</p> </td>
  </tr>
  <tr>
   <td><p><code>navigation-button-bg-hover-color</code></p> </td>
   <td><p>Background color for navigation buttons (back/next) on hover</p> </td>
  </tr>
  <tr>
   <td><p><code>initial-nav-color</code></p> </td>
   <td><p>Background color for wizard navigators and corresponding progress bar, when first rendered.</p> </td>
  </tr>
  <tr>
   <td><p><code>active-nav-color</code></p> </td>
   <td>Background color for current / active wizard navigator and corresponding progress bar </td>
  </tr>
  <tr>
   <td><p><code>visited-nav-color</code></p> </td>
   <td><p>Background color for wizard navigators and corresponding progress bar, which have been visited.</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-bifercating-border-color</code></p> </td>
   <td><p>Border color bifurcating container into navigators and panel</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-navigator-separator-color</code></p> </td>
   <td><p>Bottom border color separating tabs for tabs on left (tab navigators).</p> </td>
  </tr>
  <tr>
   <td><p><code>tabs-child-nav-bg-color</code></p> </td>
   <td><p>Background color for navigator' nested/child/sub navigators</p> </td>
  </tr>
 </tbody>
</table>
