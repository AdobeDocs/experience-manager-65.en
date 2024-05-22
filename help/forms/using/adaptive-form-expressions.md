---
title: Adaptive Form Expressions
description: Use adaptive forms expressions to add automatic validation, calculation, and turn visibility of a section on or off.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop
docset: aem65
feature: Adaptive Forms, Foundation Components
exl-id: 048bd9e8-ef34-40fb-9f46-73743d7b47c8
solution: Experience Manager, Experience Manager Forms
role: "User, Developer"
---
# Adaptive Form Expressions{#adaptive-form-expressions}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

Adaptive forms provide optimized and simplified form filling experience for end users with dynamic scripting capabilities. It lets you write expressions to add various behaviors such as dynamic show/hide fields and panels. It also lets you add calculated fields, make fields read-only, add validation logic, and many more. The dynamic behavior is based on the user input or prefilled data.

JavaScript is the expression language of adaptive forms. All the expressions are valid JavaScript expressions and use adaptive forms scripting model APIs. These expressions return values of certain types. For the complete list of adaptive forms classes, events, objects, and public APIs, see [JavaScript Library API reference for adaptive forms.](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/javascript-api/index.html)

## Best practices for writing expressions {#best-practices-for-writing-expressions}

* While writing expressions, to access fields and panels, you can use name of field or panel. To access value of a field, use the value property. For example, `field1.value`
* Use unique names for fields and panels across the form. It helps avoid any possible conflicts with field names used while writing expressions.
* While writing multi-line expressions, use a semi-colon to terminate a statement.

## Best practices for expressions involving repeating panel {#best-practices-for-expressions-involving-repeating-panel}

Repeating panels are instances of a panel that are added or removed dynamically, using scripting API or pre-populated data. For detailed information about using repeating panel, see [creating forms with repeatable sections](/help/forms/using/creating-forms-repeatable-sections.md).

* To create a repeating panel, in the panel dialog, open settings, and set value of the max count field to more than 1.
* The min count value of panel repeat settings can be one or more but cannot be more than max count value.
* When an expression refers to a field of repeating panel, the field names in the expression are resolved to the closest repeating element.
* Adaptive forms provide a few special functions to simplify computation for repeatable panels such as sum, count, min, max, filter, and many more. For the complete list of functions, see [JavaScript Library API reference for adaptive forms](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/javascript-api/index.html)
* APIs for manipulating instances of repeating panel are:

    * To add a panel instance: `panel1.instanceManager.addInstance()`
    * To get a panel repeat index: `panel1.instanceIndex`
    * To get the instanceManager of a panel: `_panel1 or panel1.instanceManager`
    * To remove an instance of a panel: `_panel1.removeInstance(panel1.instanceIndex)`

## Expression Types {#expression-types}

In adaptive forms, you can write expressions to add behaviors such as dynamic show/hide fields and panels. You can also write expressions to add calculated fields, make fields read-only, validation logic, and many more. Adaptive forms support following expressions:

* **[Access expressions](#access-expression-enablement-expression)**: to enable/disable a field.
* **[Calculate expressions](#calculate-expression)**: to auto-compute value of a field.
* **[Click expression](#click-expression)**: to handle actions on click event of a button.
* **[Initialization Script](#initialization-script):** perform an action on initialization of a field.
* **[Options expression](#options-expression)**: to dynamically fill a drop-down list.
* **[Summary expression](#summary)**: to dynamically compute the title of an accordion.
* **[Validate expressions](#validate-expression)**: to validate a field.
* **[Value Commit Script](#value-commit-script):** to change the components of a form after the value of a field is changed.
* **[Visibility expression](#visibility-expression)**: to control visibility of a field and panel.
* **[Step completion expression](#step-completion-expression)**: to prevent a user from going to next step of a wizard.

### Access Expression (Enablement Expression) {#access-expression-enablement-expression}

You can use the access expression to enable or disable a field. If the expression uses value of a field, whenever the value of the field changes the expression is retriggered.

**Applies to**: fields

**Return Type**: The expression returns a Boolean value, representing whether the field is enabled or disabled. **true** represents that the field is enabled and **false** represents the field is disabled.

**Example**: To enable a field only when the value of **field1** is set to **X**, the access expression is: `field1.value == "X"`

### Calculate Expression {#calculate-expression}

The calculate expression is used to auto-compute the value of a field using an expression. Typically, such expression use value property of another fields. For example, `field2.value + field3.value`. Whenever value of the `field2`or `field3`changes, the expression is retriggered and the value is recomputed.

**Applies to**: fields

**Return Type**: The expression returns a value that is compatible to the field where the expression result is displayed (for example, decimal).

**Example**: The calculate expression to show sum of two fields in **field1** is:
`field2.value + field3.value`

### Click Expression {#click-expression}

The click expression handles the actions performed on the click event of a button. Out of the box, GuideBridge provides APIs to perform various functions such as submit, validate that are used along with the click expression. For complete list of the APIs, see [GuideBridge APIs.](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/javascript-api/GuideBridge.html)

**Applies to**: Button fields

**Return Type**: The click expression does not return any value. If any expression returns a value, the value is ignored.

**Example**: To populate a text box **textbox1** on the click action of a button with value **AEM Forms**, the click expression of the button is `textbox1.value="AEM Forms"`

### Initialization Script {#initialization-script}

The initialization script is triggered when an adaptive form is initialized. Depending on scenarios, the initialization script behaves in the following manner:

* When an adaptive form is rendered without a data prefill, the initialization script runs after the form is initialized.
* When an adaptive form is rendered with a data prefill, the script is run after the pre-fill operation completes.
* When server sided revalidation of an adaptive form is triggered, the initialization script is executed.

**Applies to:** fields and panel

**Return Type:** The Initialization script expression does not return any value. If any expression returns a value, the value is ignored.

**Example:** In a data pre-fill scenario, to populate fields with default value `'Adaptive Forms'` when their value is saved as null, the initialization script expression is:
`if(this.value==null) this.value='Adaptive Forms';`

### Options Expression {#options-expression}

The options expression is used to dynamically fill options of a drop-down list field.

**Applies to**: drop-down list fields

**Return Type**: The options expression returns an array of string values. Each value can be a simple string, such as **Male**, or in a key=value pair format, such as **1=Male**

**Example**: To populate value of a field, based on the value of another field, provide a simple options expression. For example, to populate a field, **Number of Kids**, based on the **Marital Status** expressed in another field, the expression is:

**`marital_status.value == "married" ? ["1=One", "2=two"] : ["0=Zero"]`.**

Whenever the value of **marital_status** field changes, the expression is retriggered. You can also populate the dropdown from a REST service. For detailed information, see [Dynamically populating dropdowns](../../forms/using/dynamically-populate-dropdowns.md).

### Summary Expression {#summary}

The Summary expression dynamically computes the title of a child panel of an accordion layout panel. You can specify the Summary expression in a rule, which uses a form field or a custom logic to evaluate the title. The expression executes when the form initializes. If you are prefilling a form, the expression executes after the data is prefilled or when the value of dependent fields used in the expression change.

The Summary expression is typically used for repeating children of an accordion layout panel to provide meaningful title to each child panel.

**Applies to:** Panels that are direct children of a panel whose layout is configured as Accordion.

**Return Type:** The expression returns a String that becomes the title of the accordion.

**Example:** "Account number : " + textbox1.value

### Validate Expression {#validate-expression}

The validate expression is used to validate the fields using the given expression. Typically, such expressions use regular expressions along with the field value to validate a field. The expression is retriggered and validation status of the field is recomputed on any change in the value of a field.

**Applies to**: fields

**Return Type**: The expression returns a Boolean value, representing the validation status of the field. The value **false** represents that the field is invalid and **true** represents that the field is valid.
**Example**: For a field representing postcode of UK, the validation expression is:

(**this.value** && `this.value.match(/^(GIR 0AA|[A-Z]{1,2}\d[A-Z0-9]? ?[0-9][A-Z]{2}\s*)$/i) == null) ? false : true`

In the above example, if the non-empty value does not match the pattern, the expression returns **false** to indicate that the field is not valid.

>[!NOTE]
>
>If you write a validation expression for a non- mandatory or mandatory field, the expression is evaluated irrespective of the visibility status of the field. To stop validation for the hidden fields, set the validationsDisabled property in the Initialization or Value Commit Script to true. For example, `this.validationsDisabled=true`

### Value Commit Script {#value-commit-script}

The Value Commit script is triggered when:

* A user changes value of a field from UI.
* Value of a field changes programmatically due to change in another field.

**Applies to:** fields

**Return Type:** The value commit script expression does not return any value. If any expression returns a value, the value is ignored.

**Example:** To convert the case of alphabets entered in the field to uppercase on commit, the value commit expression is:
`this.value=this.value.toUpperCase()`

>[!NOTE]
>
>You can disable the execution of the Value Commit Script when the value of a field is changed programmatically. To do so, go to https://'[server]:[port]'/system/console/configMgr and change **Adaptive Forms Version for Compatibility** to **AEM Forms 6.1**. Thereafter, Value Commit Script is executed only when the user changes the value of the field from the UI.

### Visibility Expression {#visibility-expression}

The Visibility expression is used to control the visibility of field/panel. Typically, visibility expression uses value property of a field and is retriggered whenever that value changes.

**Applies to**: fields and panel

**Return Type**: Expression returns a Boolean value, representing the field/panel is visible or not. **false** represents that the field or panel is not visible and true represents that the field or panel is visible.

**Example**: For a panel that becomes visible only if value of **field1** is set to **Male**, the visibility expression is: `field1.value == "Male"`

### Step Completion Expression {#step-completion-expression}

The step completion expression is used to prevent a user from going to the next step of a wizard layout. These expressions are used when panels have a wizard layout (a multi-step forms showing one step at a time). The user can move to the next step, panel, or subsection only if all the required values in the current section are filled and valid.

**Applies to**: Panels with layout of item set to wizard.

**Return Type**: Expression returns a Boolean value, representing the current panel is valid or not. **True** represents that the current panel is valid and the user can navigate to next panel.

**Example**: In a form organized in various panels, before navigating to the next panel the current panel is validated. In such cases, the step completion expressions are used. Generally, these expressions use the GuideBridge validate API. An example of step completion expression is:
`window.guideBridge.validate([],this.panel.navigationContext.currentItem.somExpression)`

## Validations in Adaptive Form {#validations-in-adaptive-form}

There are multiple methods to add field validation to an adaptive form. If a validation check is added on a field, **True** represents that the value entered in the field is valid. **False** represents that the value is invalid. If you tab in and out of a field, the error message is not generated.

The methods to add validations on a field are:

### Required {#required}

To make a component mandatory, in the **Edit** dialog of the component, you can select option **Title and Text &gt; Required**. You can also add the appropriate **required message** (optional) as well.

### Validation Patterns {#validation-patterns}

There are multiple out of the box validation patterns available for a field. To select a validation pattern, in the **Edit** dialog of the component, locate the **Patterns** section and select **patterns**. You can create your own custom validation pattern in a **Pattern** text box. The validation status is returned **True** only if the data filled is compliant to the validation pattern, else **False** is returned. To write your own custom validation pattern, see [Picture clause support for HTML5 forms](/help/forms/using/picture-clause-support.md).

### Validation Expressions {#validation-expressions}

The validation of a field can also be computed using expressions on different fields. These expressions are written inside **Validation Script** field of the **Script** tab of **Edit** dialog of the component. The validation status of a field depends upon the value that the expression returns. For information on how to write such expressions, see [Validate Expression](../../forms/using/adaptive-form-expressions.md#p-validate-expression-p).

## Additional Information {#additional-information}

### Using Field Display Format {#using-field-display-format}

Display Format can be used to display the data in different formats. For example, you can use the display format to display a telephone number with hyphens, format ZIP code, or date picker. These display patterns can be selected from the **Patterns** section of the Edit dialog of a component. You can write custom display patterns similar to the validation patterns mentioned above.

### GuideBridge - APIs and Events {#guidebridge-apis-and-events}

GuideBridge is collection of APIs' that can be used to interact with adaptive forms in memory model in a browser. For detailed introduction to Guide Bridge API, class methods, events exposed, see [JavaScript Library API reference for adaptive forms.](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/javascript-api/index.html)

>[!NOTE]
>
>It is recommended not to use the GuideBridge event listeners in expressions.

#### GuideBridge usage in various expressions {#guidebridge-usage-in-various-expressions}

* To reset form fields, you can trigger `guideBridge.reset()` API on the click expression of a button. Similarly there is a submit API which can be called as a click expression `guideBridge.submit()`**.**

* You can use the `setFocus()` API to set focus across various fields or panels (for panel focus is set to the first field automatically). `setFocus()`provides a wide range of options to navigate such as navigation across panels, previous/next traversal, setting focus to a particular field, and many more. For example, to move to the next panel, you can use: `guideBridge.setFocus(this.panel.somExpression, 'nextItem').`

* To validate an adaptive form or its specific panels, use `guideBridge.validate(errorList, somExpression).`

#### Using GuideBridge outside Expressions&nbsp; {#using-guidebridge-outside-expressions-nbsp}

You can also use the GuideBridge APIs outside the expressions. For example, you can use the GuideBridge API to set communication between page HTML hosting the adaptive form and the Form Model. In addition, you can set the value that is coming from parent of Iframe hosting the form.

To use GuideBridge API for above mentioned example, capture an instance of GuideBridge. To capture the instance, listen to `bridgeInitializeStart`event of a `window`object:

```javascript
window.addEventListener("bridgeInitializeStart", function(evnt) {

     // get hold of the guideBridge object

     var gb = evnt.detail.guideBridge;

     //wait for the completion of AF

     gb.connect(function (){

        //this function will be called after Adaptive Form is initialized

     })

})
```

>[!NOTE]
>
>In AEM, it is a good practice to write code in a clientLib and include it in your page (header.jsp or footer.jsp of the page)

To use GuideBridge after the form is initialized (the `bridgeInitializeComplete` event is dispatched), get the GuideBridge instance using `window.guideBridge`. You can check GuideBridge initialization status using the `guideBride.isConnected` API.

#### GuideBridge Events {#guidebridge-events}

GuideBridge also provides certain events for external scripts on the hosting page. External scripts can listen to these events and perform various operations. For example, whenever the user name in a form change, the name shown in the header of the page also changes. For more details about such events, see [JavaScript Library API reference for adaptive forms.](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/javascript-api/GuideBridge.html)

Use the following code to register handlers:

```javascript
guideBridge.on("elementValueChanged", function (event, data)  {

      // execute some logic when value of a field is changed

});
```

### Creating custom patterns for a field {#creating-custom-patterns-for-a-field}

As mentioned above, adaptive forms allows author to provide patterns for validation or display formats. In addition to using out of the box patterns, you can define reusable custom pattern for an adaptive form component. For example, you can define a text field or a numeric field. Once defined, you can use these patterns in all the forms for specified type of component. For example, you can create a custom pattern for a text field and use it in the text fields in their adaptive forms. You can select the custom pattern by accessing the pattern section in the edit dialog of a component. For details about Pattern definition or format, see [Picture clause support for HTML5 forms](/help/forms/using/picture-clause-support.md).

Perform the following steps to create a custom pattern for a specific field type and reuse it for other fields of the same type:

1. Navigate to CRXDE Lite on your authoring instance.
1. Create a folder to maintain your custom patterns. Under the /apps directory, create a node of type sling:folder. For example, create a node with the name `customPatterns`. Under this node, create another node of type `nt:unstructed` and name it `textboxpatterns`. This node contains the various custom patterns that you want to add.
1. Open the Properties tab of the node created. For example, open the Properties tab of `textboxpatterns`. Add the `guideComponentType` property to this node and set its value to *fd/af/components/formatter/guideTextBox*.

1. The value of this property varies depending on the field for which you want to define the patterns. For numeric field, the value of the `guideComponentType` property is *fd/af/components/formatter/guideNumericBox*. The value for the Datepicker field is *fd/af/components/formatter/guideDatepicker*.
   ``
1. You can add a custom pattern by assigning a property to the `textboxpatterns` node. Add a property with a name (for example, `pattern1`), and set its value to the pattern you want to add. For example, add a property `pattern1` with value Fax=text{99-999-9999999}. The pattern is available for all the Text Boxes that you use in Adaptive Forms.

   ![Creating custom patterns for fields in CrxDe](assets/creating-custom-patterns.png)

   Creating custom patterns
