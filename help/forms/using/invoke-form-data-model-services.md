---
title: API to invoke form data model service from adaptive forms
seo-title: API to invoke form data model service from adaptive forms
description: Explains the invokeWebServices API that you can use to invoke web services written in WSDL from within an adaptive form field. 
seo-description: Explains the invokeWebServices API that you can use to invoke web services written in WSDL from within an adaptive form field. 
uuid: 40561086-e69d-4e6a-9543-1eb2f54cd836
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: develop
discoiquuid: aa3e50f1-8f5a-489d-a42e-a928e437ab79
---

# API to invoke form data model service from adaptive forms {#api-to-invoke-form-data-model-service-from-adaptive-forms}

## Overview {#overview}

AEM Forms enables form authors to further simplify and enhance the form filling experience by invoking services configured in a form data model from within an adaptive form field. To invoke a data model service, you can either create a rule in the visual editor or specify a JavaScript using the `guidelib.dataIntegrationUtils.executeOperation` API in the code editor of the [rule editor](/help/forms/using/rule-editor.md).

This document focuses on writing a JavaScript using the `guidelib.dataIntegrationUtils.executeOperation` API to invoke a service.

## Using the API {#using-the-api}

The `guidelib.dataIntegrationUtils.executeOperation` API invokes a service from within an adaptive form field. The API syntax is as follows:

```
guidelib.dataIntegrationUtils.executeOperation(operationInfo, inputs, outputs)
```

The API requires the following parameters.

| Parameter |Description |
|---|---|
| `operationInfo` |Structure to specify form data model identifier, operation title, and operation name |
| `inputs` |Structure to specify form objects whose values are input to the service operation |
| `outputs` |Structure to specify form objects that will be populated with the values returned by the service operation |

The structure of the `guidelib.dataIntegrationUtils.executeOperation` API specifies details about the service operation. The syntax of the structure is as follows.

```
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
   <td><code>forDataModelId</code></td> 
   <td>Specify the repository path to the form data model including its name</td> 
  </tr> 
  <tr> 
   <td><code>operationName</code></td> 
   <td>Specify the name of the service operation to execute</td> 
  </tr> 
  <tr> 
   <td><code>input</code></td> 
   <td>Map one or more form objects to the input arguments for the service operation</td> 
  </tr> 
  <tr> 
   <td>Output</td> 
   <td>Map one or more form objects to output values from the service operation to populate form fields<br /> </td> 
  </tr> 
 </tbody> 
</table>

## Sample script to invoke a service {#sample-script-to-invoke-a-service}

The following sample script uses the `guidelib.dataIntegrationUtils.executeOperation` API to invoke the `getAccountById` service operation configured in the `employeeAccount` form data model.

The `getAccountById` operation takes the value in the `employeeID` form field as input for the `empId` argument and returns employee name, account number, and account balance for the corresponding employee. The output values are populated in the specified form fields. For example, the value in `name` argument is populated in the `fullName` form element and value for `accountNumber` argument in `account` form element.

```
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

