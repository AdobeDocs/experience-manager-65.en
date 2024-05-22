---
title: Form Bridge APIs for HTML5 forms
description: External applications use the FormBridge API to connect to the XFA Mobile Form. The API dispatches a FormBridgeInitialized event on the parent window.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: developer-reference
exl-id: b598ef47-49ff-4806-8cc7-4394aa068eaa
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Form Bridge APIs for HTML5 forms {#form-bridge-apis-for-html-forms}

You can use the Form Bridge APIs to open a communication channel between an XFA-based HTML5 forms and your applications. The Form Bridge APIs provides a **connect** API to create the connection.

The **connect** API accepts a handler as an argument. After a successful connection is created between XFA-based HTML5 form and Form Bridge, the handle is invoked.

You can use the following sample code to create the connection.

```javascript
// Example showing how to connect to FormBridge
window.addEventListener("FormBridgeInitialized",
                                function(event) {
                                    var fb = event.detail.formBridge;
                                    fb.connect(function() {
                                           //use form bridge functions
                         })
                            })

```

>[!NOTE]
>
>Ensure that you create a connection before including the formRuntime.jsp file.

## Available Form Bridge API&nbsp; {#available-form-bridge-api-nbsp}

**getBridgeVersion()**

Returns the version number of the Scripting library

* **Input**: None
* **Output**: Version number of the Scripting library
* **Errors**: None

**isConnected()** Checks if Form State has been initialized

* **Input**: None
* **Output**: **True** if the XFA Form State has been initialized

* **Errors**: None

**connect(handler, context)** Makes a connection to FormBridge and executes the function after the connection is made and Form State has been initialized

* **Input**:

    * **handler**: Function to execute after Form Bridge is connected
    * **context**: The object to which the context (this) of the *handler* function are set.

* **Output**: None
* **Error**: None

**getDataXML(options)** Returns the current form data in XML Format

* **Input:**

    * **options:** JavaScript Object containing following properties:

        * **Error**: Error Handler Function
        * **success**: Success handler function. This function is passed an object containing XML in *data* property.
        * **context**: The object to which the context (this) of the *success* function is set
        * **validationChecker**: Function to call to check validation errors received from the server. Validation function is passed an array of error strings.
        * **formState**: The JSON state of the XFA Form for which data XML has to be returned. If not specified, it returns the data XML for the currently rendered form.

* **Output:** None
* **Error:** None

**registerConfig(configName, config)** Registers user / portal specific configurations with FormBridge. These configurations override the default configurations. The supported configurations are specified in the config section.

* **Input:**

    * **configName:** Name of the configuration to override

        * **widgetConfig:** Allows the user to override the default widgets in the form with custom widgets. The configuration is overridden as follows:

          *formBridge.registerConfig("widgetConfig":{/&ast;configuration&ast;/})*

        * **pagingConfig:** Allows the user to override the default behavior of rendering only the first page. The configuration is overridden as follows:

          *window.formBridge.registerConfig("pagingConfig":{pagingDisabled: <true | false>, shrinkPageDisabled: <true | false> }).*

        * **LoggingConfig:** Allows the user to override the level of logging, disable logging for a category, or whether to display the logs console or send to server. The configuration can be overridden as follows:

        ```javascript
        formBridge.registerConfig{
          "LoggerConfig" : {
        {
        "on":`<true *| *false>`,
        "category":`<array of categories>`,
        "level":`<level of categories>`, "
        type":`<"console"/"server"/"both">`
        }
          }
        ```

        * **SubmitServiceProxyConfig:** Allow the users to register submission and logger proxy services.

          ```javascript
          window.formBridge.registerConfig("submitServiceProxyConfig",
          {
          "submitServiceProxy" : "`<submitServiceProxy>`",
          "logServiceProxy": "`<logServiceProxy>`",
          "submitUrl" : "`<submitUrl>`"
          });
          ```

    * **config:** Value of the configuration

* **Output:** Object containing original value of the configuration in *data* property.

* **Error:** None

**hideFields(fieldArray)** Hides the fields whose Som expressions are provided in the fieldArray. Sets the presence property of the specified fields to invisible

* **Input:**

    * **fieldArray:** Array of Som expressions for the fields to hide

* **Output:** None
* **Error:** None

**showFields(fieldArray)** Shows the fields whose Som expressions are provided in the fieldArray. Sets the presence property of the provided fields to visible

* **Input:**

    * **fieldArray:** Array of Som expressions for the fields to show

* **Output:** None
* **Error:** None

**hideSubmitButtons()** Hides all the submit buttons in the form

* **Input**: None
* **Output**: None
* **Error**: Throws exception if Form State is not initialized

**getFormState()** Returns the JSON representing the Form State

* **Input:** None
* **Output:** Object containing JSON representing the current Form State in *data* property.

* **Error:** None

**restoreFormState(options)** Restores the Form State from the provided JSON state in the options object. The state is applied and success or error handlers are called after the operation is complete

* **Input:**

    * **Options:** JavaScript Object containing following properties:

        * **Error**: Error Handler Function
        * **success**: Success handler function
        * **context**: The object to which the context (this) of the *success* function are set
        * **formState**: JSON state of the form. The form is restored to the JSON state..

* **Output:** None
* **Error:** None

**setFocus (som)** Sets focus on the field specified in the Som expression

* **Input:** Som expression of the field on which to set focus
* **Output:** None
* **Error:** Throws an exception if there is an incorrect Som expression

**setFieldValue (som, value)** Sets the value of the fields for the given Som expressions

* **Input:**

    * **som:** Array containing Som expressions of the field. The som expression to set value of the fields.
    * **value:** Array containing values corresponding to Som expressions provided in a **som**array. If the data type of the value is not the same as the fieldType, the value is not modified.

* **Output:** None
* **Error:** Throws an Exception if there is an incorrect Som expression

**getFieldValue (som)** Returns the value of the fields for the given Som expressions

* **Input:** Array containing Som expressions of the fields whose value has to be retrieved
* **Output:** Object containing the result as Array in **data** property.

* **Error:** None

### Example of&nbsp;getFieldValue() API {#example-of-nbsp-getfieldvalue-api}

```JavaScript
var a =  formBridge.getFieldValue("xfa.form.form1.Subform1.TextField");
if(a.errors) {
    var err;
     while((err = a.getNextMessage()) != null)
               alert(a.message)
} else {
   alert(a.data[0])
}

```

**getFieldProperties(som, property)** Retrieve the list of values for the given property of the fields specified in Som expressions

* **Input:**

    * **som:** Array containing Som expressions for the fields
    * **property**: Name of the property whose value is required

* **Output:** Object containing the result as Array in *data* property

* **Error:** None

**setFieldProperties(som, property, values)** Sets the value of the given property for all fields specified in the Som expressions

* **Input:**

    * **som:** Array containing Som expressions of the fields whose value has to be set
    * **property**: Property whose value has to be set
    * **value:** Array containing values of the given property for fields specified in Som expressions

* **Output:** None
* **Error:** None

## Sample Usage of Form Bridge API {#sample-usage-of-form-bridge-api}

```JavaScript
// Example 1: FormBridge.restoreFormState
  function loadFormState() {
    var suc = function(obj) {
             //success
            }
    var err = function(obj) {
           while(var t = obj.getNextMessage()) {
         $("#errorDiv").append("<div>"+t.message+"</div>");
           }
           }
        var _formState = // load form state from storage
    formBridge.restoreFormState({success:suc,error:err,formState:_formState}); // not passing a context means that this will be formBridge itself. Validation errors will be checked.
  }

//--------------------------------------------------------------------------------------------------

//Example 2: FormBridge.submitForm
  function SubmitForm() {
    var suc = function(obj) {
             var data = obj.data;
         // submit the data to a url;
            }
    var err = function(obj) {
           while(var t = obj.getNextMessage()) {
         $("#errorDiv").append("<div>"+t.message+"</div>");
           }
           }
    formBridge.submitForm({success:suc,error:err}); // not passing a context means that this will be formBridge itself. Validation errors will be checked.
  }
```
