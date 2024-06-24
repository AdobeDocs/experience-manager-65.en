---
title: Create and add custom functions in an Adaptive Form
description: AEM Forms support custom functions which allow users to create and use their own functions within the rule editor.
keywords: Add a custom function, use a custom function, create a custom function, use custom function in rule editor.
contentOwner: Ruchita Srivastav
content-type: reference
feature: Adaptive Forms,Core Components
exl-id: a328b4a8-e8dd-42a0-b73b-94e76c7692a8
role: Admin, User, Developer
---

# Custom functions in Adaptive Forms (Core Components)

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-core-components/create-an-adaptive-form-on-forms-cs/create-and-use-custom-functions)                  |
| AEM 6.5     | This article         |

## Introduction

AEM Forms 6.5 introduced the ability to define JavaScript functions that can be used in defining complex business rules using the rule editor. AEM Forms provides a number of such custom functions out of the box, but you will have the need to define your own custom functions and use them across multiple forms.

The custom functions extend the capabilities of forms by facilitating manipulation and processing of entered data to meet specified requirements. They also enable dynamic alteration of form behavior based on predefined criteria. 
In Adaptive Forms, you can use custom functions within the [rule editor of an Adaptive Form](/help/forms/using/rule-editor.md) to create specific validation rules for form fields.
Let us understand use of custom function where users enter the email address, and you want to ensure that the entered email address follows a specific format (it contains an "@" symbol and a domain name). Create a custom function as "ValidateEmail" which takes the email address as input and returns true if it is valid and false otherwise.

```javascript
function ValidateEmail(inputText)
{
    var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(inputText.value.match(email))
        {
            alert("Valid email address!");
            return true;
        }
    else
    {
        alert("Invalid email address!");
        return false;
    }
}

```

In the above example, when the user tries to submit the form, the custom function "ValidateEmail" is invoked to check if the email address entered is valid. 

## Uses of custom functions {#uses-of-custom-function}

Advantages of using custom functions in Adaptive Forms are:

* **Manipulation of data**: Custom functions manipulate and process data entered into the forms fields.
* **Validation of data**: Custom functions enable you to perform custom checks on form inputs and provide specified error messages.
* **Dynamic behavior**: Custom functions allow you to control the dynamic behavior of your forms based on specific conditions. For example, you can show/hide fields, modify field values, or adjust form logic dynamically.
* **Integration**: You can use custom functions to integrate with external APIs or services. It helps in fetching data from external sources, sending data to external Rest endpoints, or performing custom actions based on external events.

## Supported JS annotations

Ensure that the custom function you write is accompanied by the `jsdoc` above it, in case, you require custom configuration and description. There are multiple ways to declare a function in `JavaScript,` and comments let you keep a track of the functions. For more information, see [usejsdoc.org](https://jsdoc.app/).

Supported `jsdoc` tags:

* **Private**
  Syntax: `@private`
  A private function is not included as a custom function.

* **Name**
  Syntax: `@name funcName <Function Name>`
  Alternatively `,` you can use: `@function funcName <Function Name>` **or** `@func` `funcName <Function Name>`.
  `funcName` is the name of the function (no spaces allowed).
  `<Function Name>` is the display name of the function.

* **Member**
  Syntax: `@memberof namespace`
  Attaches a namespace to the function.

* **Parameter**
  Syntax: `@param {type} name <Parameter Description>`
  Alternatively, you can use: `@argument` `{type} name <Parameter Description>` **or** `@arg` `{type}` `name <Parameter Description>`.
  Shows parameters used by the function. A function can have multiple parameter tags, one tag for each parameter in the order of occurrence.
  `{type}` represents parameter type. Allowed parameter types are:

    1. string
    2. number
    3. boolean
    4. scope

   Scope is used for referring fields of an Adaptive Form. When a form uses lazy loading, you can use `scope` to access its fields. You can access fields either when the fields are loaded or if the fields are marked global.

  All other parameter types are categorized under one of the above. None is not supported. Ensure that you select one of the types above. Types are not case sensitive. Spaces are not allowed in the parameter `name`. `<Parameter Descrption>` `<parameter>  can have multiple words. </parameter>`

* **Return Type**
  Syntax: `@return {type}`
  Alternatively, you can use `@returns {type}`.
  Adds information about the function, such as its objective.
  {type} represents the return type of the function. Allowed return types are:

    1. string
    1. number
    1. boolean

  All other return types are categorized under one of the above. None is not supported. Ensure that you select one of the types above. Return types are not case sensitive.

* **This**
   Syntax: `@this currentComponent`

   Use @this to refer to the Adaptive Form component on which the rule is written. 
  
   The following example is based on the field value. In the following example, the rule hides a field in the form. The `this` portion of `this.value` refers to underlying Adaptive Form component, on which the rule is written.

   ```
      /**
      * @function myTestFunction
      * @this currentComponent
      * @param {scope} scope in which code inside function will be executed.
      */
      myTestFunction = function (scope) {
         if(this.value == "O"){
               scope.age.visible = true;
         } else {
            scope.age.visible = false;
         }
      }

   ```

    >[!NOTE]
    >
    >Comments before custom function are used for summary. Summary can extend to multiple lines until a tag is encountered. Limit the size to a single for a concise description in the rule builder.

## Function declaration supported types {#function-declaration-supported-types}

**Function Statement**

```javascript
function area(len) {
    return len*len;
}
```

This function is included without `jsdoc` comments.

**Function Expression**

```javascript
var area;
//Some codes later
/** */
area = function(len) {
    return len*len;
};
```

**Function Expression and Statement**

```javascript
var b={};
/** */
b.area = function(len) {
    return len*len;
}
```

**Function Declaration as Variable**

```javascript
/** */
var x1,
    area = function(len) {
        return len*len;
    },
    x2 =5, x3 =true;
```

Limitation: custom function picks only the first function declaration from the variable list, if together. You can use function expression for every function declared.

**Function Declaration as Object**

```javascript
var c = {
    b : {
        /** */
        area : function(len) {
            return len*len;
        }
    }
};
```

## Create custom function {#create-custom-function}

To create a custom function, perform the following steps:

1. Log into `http://server:port/crx/de/index.jsp#`. 
1. Create a folder under the `/apps` folder. For example, create a folder named as `experience-league`.
1. Save your changes.
1. Navigate to the created folder and create a node of type `cq:ClientLibraryFolder` as `clientlibs`.
1. Navigate to the newly created `clientlibs` folder and add the `allowProxy` and `categories` properties:
    
    ![Custom Library node properties](/help/forms/using/assets/customlibrary-catproperties.png)

    >[!NOTE]
    >
    > You can provide any name in place of `customfunctionsdemo`. 

1. Save your changes.

1. Create a folder called `js` under the `clientlibs` folder.
1. Create a JavaScript file called `functions.js` under the `js` folder
1. Create a file called `js.txt` under the `clientlibs` folder. 
1. Save your changes.
The created folder structure looks like:

    ![Created Client Library Folder Structure](/help/forms/using/assets/clientlibrary_folderstructure.png)
1. Double-click the `functions.js` file to open the editor. The file comprises the code for custom function.
    Let's add the following code to the JavaScript file to calculate age based on the Date of Birth(YYYY-MM-DD).

    ```javascript

        /**
             * Calculates Age
             * @name calculateAge 
             * @return {string} 
        */

        function calculateAge(dateOfBirthString) {
        var dob = new Date(dateOfBirthString);
        var now = new Date();
    
        var age = now.getFullYear() - dob.getFullYear();
        var monthDiff = now.getMonth() - dob.getMonth();
    
        if (monthDiff < 0 || (monthDiff === 0 && now.getDate() < dob.getDate())) {
        age--;
        }
    
        return age;
        }

    ```
        
1. Save `function.js`.
1. Navigate to `js.txt` and add the following code:
  
    ```javascript
        #base=js
        functions.js
    ```

1. Save the `js.txt` file.     

You can refer to the following [custom function](/help/forms/using/assets/customfunction.zip) folder. Download and install this folder in your AEM instance.

Now, you can use the custom function in your Adaptive Form by adding the client library.

## Add client library in an Adaptive Form{#use-custom-function}

Once you have deployed your client library to your Forms CS environment, use its capabilities in your Adaptive Form. To add the client library in your Adaptive Form

1. Open your form in edit mode. To open a form in edit mode, select a form and select **[!UICONTROL Edit]**.
1. Open the Content browser, and select the **[!UICONTROL Guide Container]** component of your Adaptive Form. 
1. Click the Guide Container properties icon. The Adaptive Form Container dialog box opens.  
1. Open the **[!UICONTROL Basic]** tab and select the name of the **[!UICONTROL client library category]** from the drop-down list (in this case, select `customfunctionscategory`).

   ![Adding the custom function client library](/help/forms/using//assets/custom-function-category-name-core-component.png)

1. Click **[!UICONTROL Done]** .

Now, you can create a rule to use custom functions in the rule editor:

![Adding the custom function client library](/help/forms/using//assets/calculateage-customfunction.png)

Now, let's understand how to configure and use a custom function using the [Rule Editor's Invoke service in AEM Forms](/help//forms/using/rule-editor.md).
