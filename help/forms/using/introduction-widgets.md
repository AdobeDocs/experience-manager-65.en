---
title: Appearance framework for adaptive and HTML5 forms

description: Mobile Forms render Form Templates as HTML5 forms. These forms use jQuery, Backbone.js and Underscore.js files for the appearance and to enable scripting.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization

exl-id: 3458471a-9815-463e-8044-68631073863c
solution: Experience Manager, Experience Manager Forms
feature: HTML5 Forms
role: User, Developer
---
# Appearance framework for adaptive and HTML5 forms {#appearance-framework-for-adaptive-and-html-forms}

Forms (adaptive forms and HTML5 forms) use [jQuery](https://jquery.com/), [Backbone.js](https://backbonejs.org/) and [Underscore.js](https://underscorejs.org/) libraries for appearance and scripting. The forms also use the [jQuery UI](https://jqueryui.com/) **Widgets** architecture for all interactive elements (such as fields and buttons) in the form. This architecture enables Form developer to use a rich set of available jQuery widgets and plug-ins in Forms. You can also implement form-specific logic while capturing data from users like leadDigits/trailDigits restrictions or implementing picture clauses. Form developers can create and use custom apperances to improve the data capture experience and make it more user-friendly.

This article is for developers with sufficient knowledge of jQuery and jQuery widgets. It provides insight into the appearance framework and enables developers to create an alternate appearance for a form field.

The appearance framework relies on various options, events (triggers), and functions to capture user interactions with the form, and responds to model changes to inform the end-user. In addition:

* The framework provides a set of options for the appearance of a field. These options are key-value pairs and divided into two categories: common options and field type specific options.
* The appearance, as a part of the contract, triggers a set of events such as enter and exit.
* The appearance is required to implement a set of functions. Some of the functions are common while others are specific to field type functions.

## Common options {#common-options}

The following are the set global options. These options are available for every field.

<table>
 <tbody>
  <tr>
   <th>Property </th>
   <th>Description</th>
  </tr>
  <tr>
   <td>name</td>
   <td>An identifier used to specify this object or event in script expressions. For example, this property specifies the name of the host application.</td>
  </tr>
  <tr>
   <td>value</td>
   <td>Actual value of the field. </td>
  </tr>
  <tr>
   <td>displayValue</td>
   <td>This value of the field is displayed. </td>
  </tr>
  <tr>
   <td>screenReaderText</td>
   <td>Screen Readers use this value to narrate information about the field. The form provides the value and you can override the value.<br /> </td>
  </tr>
  <tr>
   <td>tabIndex</td>
   <td>The position of the field in the tab sequence of the form. Override the tabIndex only if you want to change the default tab order of the form.</td>
  </tr>
  <tr>
   <td>role</td>
   <td>Role of the element, for example, Heading or Table.</td>
  </tr>
  <tr>
   <td>height</td>
   <td>The height of the widget. It is specified in pixels. </td>
  </tr>
  <tr>
   <td>width</td>
   <td>The width of the widget. It is specified in pixels.</td>
  </tr>
  <tr>
   <td>access</td>
   <td>Controls used to access the contents of a container object, such as a subform.</td>
  </tr>
  <tr>
   <td>paraStyles</td>
   <td>The para property of an XFA element to the widget.</td>
  </tr>
  <tr>
   <td>dir</td>
   <td>The direction of the text. The possible values are ltr (left-to-right) and rtl (right-to-left).</td>
  </tr>
 </tbody>
</table>

Apart from these options, the framework provides some other options which vary depending on the type of field. The details for the fields-specific options are listed below.

### Interaction with forms framework {#interaction-with-forms-framework}

To interact with forms framework, a widget triggers some events to enable the form script to work. If the widget does not throw these events, some of the scripts written in the form for that field do not work.

#### Events triggered by widget {#events-triggered-by-widget}

<table>
 <tbody>
  <tr>
   <th>Event </th>
   <th>Description</th>
  </tr>
  <tr>
   <td>XFA_ENTER_EVENT</td>
   <td>This event is triggered whenever the field is in focus. It allows the "enter" script to run on the field. The syntax for triggering the event is<br /> (widget)._trigger(xfalib.ut.XfaUtil.prototype.XFA_ENTER_EVENT)<br /> </td>
  </tr>
  <tr>
   <td>XFA_EXIT_EVENT</td>
   <td>This event is triggered whenever the user leaves the field. It allows the engine to set the value of the field and run its "exit" script. The syntax for triggering the event is<br /> (widget)._trigger(xfalib.ut.XfaUtil.prototype.XFA_EXIT_EVENT)<br /> </td>
  </tr>
  <tr>
   <td>XFA_CHANGE_EVENT</td>
   <td>This event is triggered to allow the engine to run the "change" script written on the field. The syntax for triggering the event is<br /> (widget)._trigger(xfalib.ut.XfaUtil.prototype.XFA_CHANGE_EVENT)<br /> </td>
  </tr>
  <tr>
   <td>XFA_CLICK_EVENT</td>
   <td>This event is triggered whenever the field is clicked. it allows the engine to run the "click" script written on the field. The syntax for triggering the event is<br /> (widget)._trigger(xfalib.ut.XfaUtil.prototype.XFA_CLICK_EVENT)<br /> </td>
  </tr>
 </tbody>
</table>

#### APIs implemented by widget {#apis-implemented-by-widget}

The appearance framework calls some functions of the widget which are implemented in the custom widgets. The widget must implement the following functions:

<table>
 <tbody>
  <tr>
   <th>Function</th>
   <th>Description</th>
  </tr>
  <tr>
   <td>focus: function()</td>
   <td>Puts focus on the field.</td>
  </tr>
  <tr>
   <td>click: function()</td>
   <td>Puts focus on the field and calls XFA_CLICK_EVENT.</td>
  </tr>
  <tr>
   <td><p>markError:function(errorMessage, errorType)<br /> <br /> <em>erorrMessage: string </em>representing the error<br /> <em>errorType: string ("warning"/"error")</em></p> <p><strong>Note</strong>: Applicable only for HTML5 forms.</p> </td>
   <td>Sends error message and error type to the widget. The widget displays the error.</td>
  </tr>
  <tr>
   <td><p>clearError: function()</p> <p><strong>Note</strong>: Applicable only for HTML5 forms.</p> </td>
   <td>Called if the errors in the field are fixed. The widget hides the error.</td>
  </tr>
 </tbody>
</table>

## Options specific to type of field {#options-specific-to-type-of-field}

All custom widgets should conform to the above specifications. To use the features of different fields, the widget has to conform to the guidelines for that particular field.

### TextEdit: Text Field {#textedit-text-field}

<table>
 <tbody>
  <tr>
   <th>Option</th>
   <th>Description</th>
  </tr>
  <tr>
   <td>multiline</td>
   <td>True if the field supports entering a newline character, else false.</td>
  </tr>
  <tr>
   <td>maxChars</td>
   <td>Maximum number of characters that can be entered in the field.</td>
  </tr>
  <tr>
   <td><p>limitLengthToVisibleArea</p> <p><strong>Note</strong>: Applicable only for HTML5 forms</p> </td>
   <td>Specifies behavior of text field when the width of text exceeds the width of the widget.</td>
  </tr>
 </tbody>
</table>

### ChoiceList: DropDownList, ListBox {#choicelist-dropdownlist-listbox}

<table>
 <tbody>
  <tr>
   <th>Option</th>
   <th>Description</th>
  </tr>
  <tr>
   <td>value<br /> </td>
   <td>Array of selected values.<br /> </td>
  </tr>
  <tr>
   <td>items<br /> </td>
   <td>Array of objects to be displayed as options. Each object contains two properties -<br /> save: value to save, display: value to display.<br /> <br /> </td>
  </tr>
  <tr>
   <td><p>editable</p> <p><strong>Note</strong>: Applicable only for HTML5 forms.<br /> </p> </td>
   <td>If value is true, custom text entry is enabled in the widget.<br /> </td>
  </tr>
  <tr>
   <td>displayValue<br /> </td>
   <td>Array of values to display.<br /> </td>
  </tr>
  <tr>
   <td>multiselect<br /> </td>
   <td>True if multiple selections are allowed, else false.<br /> </td>
  </tr>
 </tbody>
</table>

#### API {#api}

<table>
 <tbody>
  <tr>
   <th>Function</th>
   <th>Description</th>
  </tr>
  <tr>
   <td><p>addItem:<em> function(itemValues)<br /> itemValues: object containing the display and save value <br /> {sDisplayVal: &lt;displayValue&gt;, sSaveVal: &lt;save Value&gt;}</em></p> </td>
   <td>Adds a item to the list.</td>
  </tr>
  <tr>
   <td>deleteItem<em>: function(nIndex)<br /> nIndex: index of the item to remove from the list<br /> </em><br /> <br /> </td>
   <td>Deletes an option from the list.</td>
  </tr>
  <tr>
   <td>clearItems:<code> function()</code></td>
   <td>Clears all the options from the list.</td>
  </tr>
 </tbody>
</table>

### NumericEdit: NumericField, DecimalField {#numericedit-numericfield-decimalfield}

| Options |Description |
|---|---|
| dataType |String representing the data type of the field (integer/decimal). |
| leadDigits |Maximum leading digits allowed in the decimal number. |
| fracDigits |Maximum fraction digits allowed in the decimal number. |
| zero |String representation of zero in locale of the field. |
| decimal |String representation of decimal in locale of the field. |

### CheckButton: RadioButton, CheckBox {#checkbutton-radiobutton-checkbox}

<table>
 <tbody>
  <tr>
   <th>Options</th>
   <th>Description</th>
  </tr>
  <tr>
   <td>values</td>
   <td><p>Array of values(on/off/neutral).</p> <p>It is array of values for the different states of the checkButton. values[0] is the value when the state is ON, values[1] is the value when the state is OFF,<br /> values[2] is the value when the state is NEUTRAL. Length of the values array is equal to the value of state option.<br /> </p> </td>
  </tr>
  <tr>
   <td>states</td>
   <td><p>Number of states allowed. </p> <p>Two for adaptive forms (On, Off) and three for HTML5 forms (On, Off, Neutral).</p> </td>
  </tr>
  <tr>
   <td>state</td>
   <td><p>Current state of the element.</p> <p>Two for adaptive forms (On, Off) and three for HTML5 forms (On, Off, Neutral).</p> </td>
  </tr>
 </tbody>
</table>

### DateTimeEdit: (DateField) {#datetimeedit-datefield}

| Option |Description |
|---|---|
| days  |Localized name of days for that field.  |
| months  |Localized month names for that field.  |
| zero  |The localized text for the number 0.  |
| clearText  |The localized text for clear button.  |
