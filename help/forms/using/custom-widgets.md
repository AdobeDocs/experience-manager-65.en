---
title: Create custom appearances in HTML5 forms

description: You can plug in custom widgets to a Mobile Forms. You can extend existing jQuery Widgets or develop your own custom widgets.


contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms

docset: aem65

feature: HTML5 Forms,Mobile Forms
exl-id: 76bd1e2d-9e65-452c-8cef-123d28886a62
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Create custom appearances in HTML5 forms{#create-custom-appearances-in-html-forms}

You can plug in custom widgets to a Mobile Forms. You can extend existing jQuery Widgets or develop your own custom widgets using appearances framework. XFA engine uses various widgets, see [Appearance framework for adaptive and HTML5 forms](/help/forms/using/introduction-widgets.md) for detailed information.

![An example of default and custom widget](assets/custom-widgets.jpg)

An example of default and custom widget

## Integrating custom widgets with HTML5 forms {#integrating-custom-widgets-with-html-forms}

### Create a profile&nbsp; {#create-a-profile-nbsp}

You can create a profile or choose an existing profile to add a custom widget. For more information on creating profiles, see [Creating custom Profile](/help/forms/using/custom-profile.md).

### Create a widget {#create-a-widget}

HTML5 forms provide an implementation of the widget framework that can be extended to create new widgets. The implementation is a jQuery widget *abstractWidget* that can be extended to write a new widget. The new widget can be made functional only by extending/overriding the below mentioned functions.

<table>
 <tbody>
  <tr>
   <td>Function/Class</td>
   <td>Description</td>
  </tr>
  <tr>
   <td>render</td>
   <td>The render function returns the jQuery object for the default HTML element of the widget. The default HTML element should be of focusable type. For example, &lt;a&gt;, &lt;input&gt;, and &lt;li&gt;. The returned element is used as $userControl. If the $userControl specifies the above constraint, then functions of the AbstractWidget class work as expected, otherwise some of the common APIs (focus, click) require changes. </td>
  </tr>
  <tr>
   <td>getEventMap</td>
   <td>Returns a map to convert HTML events to XFA events. <br /> {<br /> blur: XFA_EXIT_EVENT,<br /> }<br /> This example shows that the blur is an HTML event and XFA_EXIT_EVENT is corresponding XFA event. </td>
  </tr>
  <tr>
   <td>getOptionsMap</td>
   <td>Returns a map which provides detail what action to perform on change of an option. The keys are the options that are provided to the widget and values are the functions that are called whenever a change in that option is detected. The widget provides handlers for all the common options (except value and displayValue)</td>
  </tr>
  <tr>
   <td>getCommitValue</td>
   <td>The Widget framework loads the function whenever the value of the widget is saved in the XFAModel (for example, on exit event of a textField). The implementation should return the value that is saved in the widget. The handler is provided with the new value for the option.</td>
  </tr>
  <tr>
   <td>showValue</td>
   <td>By default, in XFA on enter event, the rawValue of the field is displayed. This function is called to show the rawValue to the user. </td>
  </tr>
  <tr>
   <td>showDisplayValue</td>
   <td>By default, in XFA on exit event, the formattedValue of the field is displayed. This function is called to show the formattedValue to the user. </td>
  </tr>
 </tbody>
</table>

To create your own widget, in the profile created above, include references of the JavaScript file which contains overridden functions and newly added functions. For example, the *sliderNumericFieldWidget* is a widget for numeric Fields. To use the widget in your profile in the header section, include the following line:

```javascript
window.formBridge.registerConfig("widgetConfig" , widgetConfigObject);
```

### Register custom widget with XFA Scripting Engine&nbsp; {#register-custom-widget-with-xfa-scripting-engine-nbsp}

When the custom widget code is ready, register the widget with the scripting engine by using `registerConfig`API for [Form Bridge](/help/forms/using/form-bridge-apis.md). It takes widgetConfigObject as input.

```javascript

window.formBridge.registerConfig("widgetConfig",
        {
        ".<field-identifier>":"<name-of-the-widget>"
        }
    );
```

#### widgetConfigObject {#widgetconfigobject}

The widget configuration is provided as a JSON object (a collection of key value pairs) where the key identifies the fields and value represents the widget to use with those fields. A sample configuration looks like:

```
*{*

*"identifier1" : "customwidgetname",
"identifier2" : "customwidgetname2",
..
}*
```

where "identifier" is a jQuery CSS selector that represents a particular field, a set of fields of a particular type, or all fields. The following lists the value of the identifier in different cases:

| Type of identifier |Identifier  |Description |
|---|---|---|
| Particular field with name fieldname |Identifier:"div.fieldname" |All fields with the name ‘fieldname’ are rendered using the widget. |
| All fields of type ‘type’(where type is NumericField, DateField, and so on.): |Identifier: "div.type" |For Timefield and DateTimeField, the type is textfield as these fields are not supported. |
| All fields |Identifier: "div.field" |  |
