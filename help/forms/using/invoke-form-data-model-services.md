---
title: API to invoke form data model service from adaptive forms
description: Explains the invokeWebServices API that you can use to invoke web services written in WSDL from within an adaptive form field.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop
discoiquuid: aa3e50f1-8f5a-489d-a42e-a928e437ab79
feature: Adaptive Forms, Foundation Components
exl-id: cf037174-3153-486f-85b1-c974cd5a1ace
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# API to invoke form data model service from adaptive forms {#api-to-invoke-form-data-model-service-from-adaptive-forms}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

## Overview {#overview}

AEM Forms enables form authors to further simplify and enhance the form filling experience by invoking services configured in a form data model from within an adaptive form field. To invoke a data model service, you can either create a rule in the visual editor or specify a JavaScript using the `guidelib.dataIntegrationUtils.executeOperation` API in the code editor of the [rule editor](/help/forms/using/rule-editor.md).

This document focuses on writing a JavaScript using the `guidelib.dataIntegrationUtils.executeOperation` API to invoke a service.

## Using the API {#using-the-api}

The `guidelib.dataIntegrationUtils.executeOperation` API invokes a service from within an adaptive form field. The API syntax is as follows:

```javascript
guidelib.dataIntegrationUtils.executeOperation(operationInfo, inputs, outputs)
```

The structure of the `guidelib.dataIntegrationUtils.executeOperation` API specifies details about the service operation. The syntax of the structure is as follows.

```javascript
var operationInfo = {
formDataModelId,
operationTitle,
operationName
};
var inputs = {
inputField1,
inputFieldN
};
var outputs = {
outputField1,
outputFieldN
}

```

The API structure specifies the following details about the service operation.

<table>
 <tbody>
  <tr>
   <th>Parameter</th>
   <th>Description</th>
  </tr>
  <tr>
   <td><code>operationInfo</code></td>
   <td>Structure to specify form data model identifier, operation title, and operation name</td>
  </tr>
  <tr>
   <td><code>formDataModelId</code></td>
   <td>Specifies the repository path to the form data model including its name</td>
  </tr>
  <tr>
   <td><code>operationName</code></td>
   <td>Specifies the name of the service operation to execute</td>
  </tr>
  <tr>
   <td><code>inputs</code></td>
   <td>Maps one or more form objects to the input arguments for the service operation</td>
  </tr>
  <tr>
   <td><code>Outputs</code></td>
   <td>Maps one or more form objects to output values from the service operation to populate form fields<br /> </td>
  </tr>
  <tr>
   <td><code>success</code></td>
   <td>Returns values based on the input arguments for the service operation. It is an optional parameter used as a callback function.<br /> </td>
  </tr>
  <tr>
   <td><code>failure</code></td>
   <td>Displays an error message if the success callback function fails to display the output values based on the input arguments. It is an optional parameter used as a callback function.<br /> </td>
  </tr>
 </tbody>
</table>

## Sample script to invoke a service {#sample-script-to-invoke-a-service}

The following sample script uses the `guidelib.dataIntegrationUtils.executeOperation` API to invoke the `getAccountById` service operation configured in the `employeeAccount` form data model.

The `getAccountById` operation takes the value in the `employeeID` form field as input for the `empId` argument and returns employee name, account number, and account balance for the corresponding employee. The output values are populated in the specified form fields. For example, the value in `name` argument is populated in the `fullName` form element and value for `accountNumber` argument in `account` form element.

```javascript
var operationInfo = {
"formDataModelId": "/content/dam/formsanddocuments-fdm/employeeAccount",
"operationName": "getAccountDetails"
};
var inputs = {
"empid" : employeeID
};
var outputs = {
"name" : fullName,
"accountNumber" : account,
"balance" : balance
};
guidelib.dataIntegrationUtils.executeOperation(operationInfo, inputs, outputs);

```

## Using the API with callback function {#using-the-api-callback}

You can also invoke the form data model service using the `guidelib.dataIntegrationUtils.executeOperation` API with a callback function. The API syntax is as follows:

```javascript
guidelib.dataIntegrationUtils.executeOperation(operationInfo, inputs, outputs, callbackFunction)
```

The call back function can have `success` and `failure` callback functions.

### Sample script with success and failure callback functions {#callback-function-success-failure}

The following sample script uses the `guidelib.dataIntegrationUtils.executeOperation` API to invoke the `GETOrder` service operation configured in the `employeeOrder` form data model.

The `GETOrder` operation takes the value in the `Order ID` form field as input for the `orderId` argument and returns order quantity value in the `success` callback function.  If the `success` callback function does not return the order quantity, the `failure` callback function displays the `Error occured` message.

>[!NOTE]
>
>If you use the `success` callback function, the output values do not populate in the specified form fields.

```javascript
var operationInfo = {
    "formDataModelId": "/content/dam/formsanddocuments-fdm/employeeOrder",
    "operationTitle": "GETOrder",
    "operationName": "GETOrder"
};
var inputs = {
    "orderId" : Order ID
};
var outputs = {};
var success = function (wsdlOutput, textStatus, jqXHR) {
order_quantity.value = JSON.parse(wsdlOutput).quantity;
 };
var failure = function(){
alert('Error occured');
};
guidelib.dataIntegrationUtils.executeOperation(operationInfo, inputs, outputs, success, failure);
```
