---
title: How to Create Adaptive Forms using JSON Schema?
description: Learn how to create adaptive forms using JSON schema as form model. You can use existing JSON schemas to create adaptive forms. Dig deeper with a sample of a JSON schema, pre-configure fields in JSON schema definition, limit acceptable values for an adaptive form component, and learn non-supported constructs.
role: User, Developer
level: Beginner, Intermediate
feature: Adaptive Forms,Foundation Components
exl-id: 1b402aef-a319-4d32-8ada-cadc86f5c872
solution: Experience Manager, Experience Manager Forms
---
# Creating adaptive forms using JSON Schema {#creating-adaptive-forms-using-json-schema}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/create-an-adaptive-form-on-forms-cs/adaptive-form-json-schema-form-model.html)               |
| AEM 6.5     | This article         |


## Prerequisites {#prerequisites}

Authoring an adaptive form using a JSON Schema as its form model requires basic understanding of JSON Schema. It is recommended to read through the following content before this article.

* [Creating an adaptive form](creating-adaptive-form.md)
* [JSON Schema](https://json-schema.org/)

## Using a JSON Schema as form model  {#using-a-json-schema-as-form-model}

[!DNL Adobe Experience Manager Forms] supports creation of an adaptive form by using an existing JSON Schema as the form model. This JSON Schema represents the structure in which data is produced or consumed by the back-end system in your organization. The JSON Schema you use should be compliant with [v4 specifications](https://json-schema.org/draft-04/schema).

The key features of using a JSON Schema are:

* The structure of the JSON is displayed as a tree in the Content Finder tab in the authoring mode for an adaptive form. You can drag and add element from the JSON hierarchy to the adaptive form.
* You can pre-populate the form using JSON that is compliant with the associated schema.
* On submission, the data entered by the user is submitted as JSON that aligns with the associated schema.

A JSON Schema consists of simple and complex element types. The elements have attributes that add rules to the element. When these elements and attributes are dragged onto an adaptive form, they are automatically mapped to the corresponding adaptive form component.

This mapping of JSON elements with adaptive form components is as follows:

```json
"birthDate": {
              "type": "string",
              "format": "date",
              "pattern": "date{DD MMMM, YYYY}",
              "aem:affKeyword": [
                "DOB",
                "Date of Birth"
              ],
              "description": "Date of birth in DD MMMM, YYYY",
              "aem:afProperties": {
                "displayPictureClause": "date{DD MMMM, YYYY}",
                "displayPatternType": "date{DD MMMM, YYYY}",
                "validationPatternType": "date{DD MMMM, YYYY}",
                "validatePictureClause": "date{DD MMMM, YYYY}",
                "validatePictureClauseMessage": "Date must be in DD MMMM, YYYY format."
              }
```

<table>
 <tbody>
  <tr>
   <th><strong>JSON element, properties, or attributes</strong></th>
   <th><strong>Adaptive form component</strong></th>
  </tr>
  <tr>
   <td><p>String properties with enum and enumNames constraint.</p> <p>Syntax,</p> <p> <code>{</code></p> <p><code>"type" : "string",</code></p> <p><code>"enum" : ["M", "F"]</code></p> <p><code>"enumNames" : ["Male", "Female"]</code></p> <p><code>}</code></p> <p> </p> </td>
   <td><p>Drop down component:</p>
    <ul>
     <li>Values listed in enumNames are displayed in the drop box.</li>
     <li>Values listed in the enum are used for calculation.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p>String property with format constraint. For example, email, and date.</p> <p>Syntax,</p> <p><code>{</code></p> <p><code>"type" : "string",</code></p> <p><code>"format" : "email"</code></p> <p><code>}</code></p> <p> </p> </td>
   <td>
    <ul>
     <li>Email component is mapped when the type is string and format is email.</li>
     <li>Textbox component with validation is mapped when the type is string and format is hostname.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p><code>{</code></p> <p><code>"type" : "string",</code></p> <p><code>}</code></p> </td>
   <td><br /> <br /> Text field<br /> <br /> <br /> </td>
  </tr>
  <tr>
   <td>number property<br /> </td>
   <td>Numeric Field with sub type set to float<br /> </td>
  </tr>
  <tr>
   <td>integer property<br /> </td>
   <td>Numeric Field with sub type set to integer<br /> </td>
  </tr>
  <tr>
   <td>boolean property<br /> </td>
   <td>Switch<br /> </td>
  </tr>
  <tr>
   <td>object property<br /> </td>
   <td>Panel<br /> </td>
  </tr>
  <tr>
   <td>array property</td>
   <td>Repeatable Panel with min and max equal to minItems and maxItems respectively. Only Homogenous arrays are supported. So the items constraint must be an object and not an array.<br /> </td>
  </tr>
 </tbody>
</table>

### Common schema properties {#common-schema-properties}

Adaptive Form uses information available in JSON Schema to map each generated field. In particular:

* The `title` property serves as label for the adaptive form components.
* The `description` property is set as long description for an adaptive form component.
* The `default` property serves as initial value of an adaptive form field.
* The `maxLength` property is set as `maxlength` attribute of the text field component.
* The `minimum`, `maximum`, `exclusiveMinimum`, and `exclusiveMaximum` properties are used for Numeric box component.
* To support range for `DatePicker component` additional JSON Schema properties `minDate` and `maxDate` are provided..
* The `minItems` and `maxItems` properties are used to restrict the number of items/fields that may be added or removed from a panel component.
* The `readOnly` property sets the `readonly` attribute of an adaptive form component.
* The `required` property marks the adaptive form field as mandatory whereas in panel(where type is object), the final submitted JSON data has fields with empty value corresponding to that object.
* The `pattern` property is set as the validation pattern (regular expression) in adaptive form.
* The extension of JSON Schema file must be kept .schema.json. For example, &lt;filename&gt;.schema.json.

## Sample JSON Schema {#sample-json-schema}

Here's an example of a JSON Schema.

```json
{
 "$schema": "https://json-schema.org/draft-04/schema#",
 "definitions": {
  "employee": {
   "type": "object",
   "properties": {
    "userName": {
     "type": "string"
    },
    "dateOfBirth": {
     "type": "string",
     "format": "date"
    },
    "email": {
     "type": "string",
     "format": "email"
    },
    "language": {
     "type": "string"
    },
    "personalDetails": {
     "$ref": "#/definitions/personalDetails"
    },
    "projectDetails": {
     "$ref": "#/definitions/projectDetails"
    }
   },
   "required": [
    "userName",
    "dateOfBirth",
    "language"
   ]
  },
  "personalDetails": {
   "type": "object",
   "properties": {
    "GeneralDetails": {
     "$ref": "#/definitions/GeneralDetails"
    },
    "Family": {
     "$ref": "#/definitions/Family"
    },
    "Income": {
     "$ref": "#/definitions/Income"
    }
   }
  },
  "projectDetails": {
   "type": "array",
   "items": {
    "properties": {
     "name": {
      "type": "string"
     },
     "age": {
      "type": "number"
     },
     "projects": {
      "$ref": "#/definitions/projects"
     }
    }
   },
   "minItems": 1,
   "maxItems": 4
  },
  "projects": {
   "type": "array",
   "items": {
    "properties": {
     "name": {
      "type": "string"
     },
     "age": {
      "type": "number"
     },
     "projectsAdditional": {
      "$ref": "#/definitions/projectsAdditional"
     }
    }
   },
   "minItems": 1,
   "maxItems": 4
  },
  "projectsAdditional": {
   "type": "array",
   "items": {
    "properties": {
     "Additional_name": {
      "type": "string"
     },
     "Additional_areacode": {
      "type": "number"
     }
    }
   },
   "minItems": 1,
   "maxItems": 4
  },
  "GeneralDetails": {
   "type": "object",
   "properties": {
    "age": {
     "type": "number"
    },
    "married": {
     "type": "boolean"
    },
    "phone": {
     "type": "number",
     "aem:afProperties": {
      "sling:resourceType": "/libs/fd/af/components/guidetelephone",
      "guideNodeClass": "guideTelephone"
     }
    },
    "address": {
     "type": "string"
    }
   }
  },
  "Family": {
   "type": "object",
   "properties": {
    "spouse": {
     "$ref": "#/definitions/spouse"
    },
    "kids": {
     "$ref": "#/definitions/kids"
    }
   }
  },
  "Income": {
   "type": "object",
   "properties": {
    "monthly": {
     "type": "number"
    },
    "yearly": {
     "type": "number"
    }
   }
  },
  "spouse": {
   "type": "object",
   "properties": {
    "name": {
     "type": "string"
    },
    "Income": {
     "$ref": "#/definitions/Income"
    }
   }
  },
  "kids": {
   "type": "array",
   "items": {
    "properties": {
     "name": {
      "type": "string"
     },
     "age": {
      "type": "number"
     }
    }
   },
   "minItems": 1,
   "maxItems": 4
  }
 },
 "type": "object",
 "properties": {
  "employee": {
   "$ref": "#/definitions/employee"
  }
 }
}
```

### Reusable schema definitions {#reusable-schema-definitions}

Definition keys are used to identify reusable schemas. The reusable schema definitions are used to create fragments. It is similar to identifying complex types in XSD. A sample JSON Schema with definitions is given below:

```json
{
  "$schema": "https://json-schema.org/draft-04/schema#",

  "definitions": {
    "address": {
      "type": "object",
      "properties": {
        "street_address": { "type": "string" },
        "city":           { "type": "string" },
        "state":          { "type": "string" }
      },
      "required": ["street_address", "city", "state"]
    }
  },

  "type": "object",

  "properties": {
    "billing_address": { "$ref": "#/definitions/address" },
    "shipping_address": { "$ref": "#/definitions/address" }
  }
}

```

The above example defines a customer record, where each customer has both a shipping and a billing address. Structure of both the addresses is same—addresses have a street address, city and state— so it is a good idea to not duplicate the addresses. It also makes addition and deletion of fields easy for any future changes.

## Pre-Configuring fields in JSON Schema Definition {#pre-configuring-fields-in-json-schema-definition}

You can use the **aem:afProperties** property to preconfigure JSON Schema field to map to a custom adaptive form component. An example is listed below:

```json
{
    "properties": {
        "sizeInMB": {
            "type": "integer",
            "minimum": 16,
            "maximum": 512,
            "aem:afProperties" : {
                 "sling:resourceType" : "/apps/fd/af/components/guideTextBox",
                 "guideNodeClass" : "guideTextBox"
             }
        }
    },
    "required": [ "sizeInMB" ],
    "additionalProperties": false
}

```

## Configure scripts or expressions for form objects  {#configure-scripts-or-expressions-for-form-objects}

JavaScript is the expression language of adaptive forms. All the expressions are valid JavaScript expressions and use adaptive forms scripting model APIs. You can pre-configure form objects to [evaluate an expression](adaptive-form-expressions.md) on a form event.

Use the aem:afproperties property to preconfigure adaptive form expressions or scripts for adaptive form components. For example, when the initialize event is triggered, the below code sets value of telephone field and prints a value to the log :

```json
"telephone": {
  "type": "string",
  "pattern": "/\\d{10}/",
  "aem:affKeyword": ["phone", "telephone","mobile phone", "work phone", "home phone", "telephone number", "telephone no", "phone number"],
  "description": "Telephone Number",
  "aem:afProperties" : {
    "sling:resourceType" : "fd/af/components/guidetelephone",
    "guideNodeClass" : "guideTelephone",
    "events": {
      "Initialize" : "this.value = \"1234567890\"; console.log(\"ef:gh\") "
    }
  }
}
```

You should be a member of the [forms-power-user group](forms-groups-privileges-tasks.md) to configure scripts or expressions for form object. The below table lists all the script events supported for an adaptive form component.

<table>
 <tbody>
  <tr>
   <th><strong></strong>Component \ Event</th>
   <th>initialize <br /> </th>
   <td>Calculate</td>
   <td>Visibility</td>
   <td>Validate</td>
   <td>Enabled</td>
   <td>Value Commit</td>
   <td>Click </td>
   <td>Options</td>
  </tr>
  <tr>
   <td>Text Field</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Numeric Field</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Numeric Stepper</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Radio Button</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Telephone</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Switch</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Button</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
  </tr>
  <tr>
   <td>Check Box</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
  </tr>
  <tr>
   <td>Drop-down</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
  </tr>
  <tr>
   <td>Image Choice</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
  </tr>
  <tr>
   <td>Date Input Field</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Date Picker</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Email</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>File Attachment</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Image</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
   <td> </td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Draw</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
   <td> </td>
   <td> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Panel</td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td><img alt="Yes tick icon" src="assets/yes_tick.png" /></td>
   <td> </td>
   <td> </td>
   <td> </td>
   <td> </td>
   <td> </td>
  </tr>
 </tbody>
</table>

Some examples of using events in a JSON are hiding a field on initialize event and configure value of another field on value commit event. For detailed information about creating expressions for the script events, see [Adaptive Form Expressions](adaptive-form-expressions.md).

Here is the sample JSON code for previously mentioned examples.

### Hiding a field on initialize event {#hiding-a-field-on-initialize-event}

```json

"name": {
    "type": "string",
    "aem:afProperties": {
        "events" : {
            "Initialize" : "this.visible = false;"
        }
    }
}
```

#### Configure value of another field on value commit event {#configure-value-of-another-field-on-value-commit-event}

```json
"Income": {
    "type": "object",
    "properties": {
        "monthly": {
            "type": "number",
            "aem:afProperties": {
                "events" : {
                    "Value Commit" : "IncomeYearly.value = this.value * 12;"
                }
            }
        },
        "yearly": {
            "type": "number",
            "aem:afProperties": {
                "name": "IncomeYearly"
            }
        }
    }
}

```

## Limit acceptable values for an adaptive form component {#limit-acceptable-values-for-an-adaptive-form-component}

You can add the following restrictions to JSON Schema elements to limit the values acceptable to an adaptive form component:

<table>
 <tbody>
  <tr>
   <td><p><strong> Schema property</strong></p> </td>
   <td><p><strong>Data Type</strong></p> </td>
   <td><p><strong>Description</strong></p> </td>
   <td><p><strong>Component</strong></p> </td>
  </tr>
  <tr>
   <td><p><code>maximum</code></p> </td>
   <td><p>String</p> </td>
   <td><p>Specifies the upper bound for numeric values and dates. By default, the maximum value is included.</p> </td>
   <td>
    <ul>
     <li>Numeric box</li>
     <li>Numeric Stepper<br /> </li>
     <li>Date Picker</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p><code>minimum</code></p> </td>
   <td><p>String</p> </td>
   <td><p>Specifies the lower bound for numeric values and dates. By default, the minimum value is included.</p> </td>
   <td>
    <ul>
     <li>Numeric box</li>
     <li>Numeric Stepper</li>
     <li>Date Picker</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p><code>exclusiveMaximum</code></p> </td>
   <td><p>Boolean</p> </td>
   <td><p>If true, the numeric value or date specified in the component of the form must be less than the numeric value or date specified for the maximum property.</p> <p>If false, the numeric value or date specified in the component of the form must be less than or equal to the numeric value or date specified for the maximum property.</p> </td>
   <td>
    <ul>
     <li>Numeric box</li>
     <li>Numeric Stepper</li>
     <li>Date Picker</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p><code>exclusiveMinimum</code></p> </td>
   <td><p>Boolean</p> </td>
   <td><p>If true, the numeric value or date specified in the component of the form must be greater than the numeric value or date specified for the minimum property.</p> <p>If false, the numeric value or date specified in the component of the form must be greater than or equal to the numeric value or date specified for the minimum property.</p> </td>
   <td>
    <ul>
     <li>Numeric box</li>
     <li>Numeric Stepper</li>
     <li>Date Picker</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p><code>minLength</code></p> </td>
   <td><p>String</p> </td>
   <td><p>Specifies the minimum number of characters allowed in a component. The minimum length must be equal to or greater than zero.</p> </td>
   <td>
    <ul>
     <li>Text box</li>
    </ul> </td>
  </tr>
  <tr>
   <td><code>maxLength</code></td>
   <td>String</td>
   <td>Specifies the maximum number of characters allowed in a component. The maximum length must be equal to or greater than zero.</td>
   <td>
    <ul>
     <li>Text box</li>
    </ul> </td>
  </tr>
  <tr>
   <td><p><code>pattern</code></p> </td>
   <td><p>String</p> </td>
   <td><p>Specifies the sequence of the characters. A component accepts the characters if the characters conform to specified pattern.</p> <p>The pattern property maps to the validation pattern of the corresponding adaptive form component.</p> </td>
   <td>
    <ul>
     <li>All adaptive forms components which are mapped to an XSD schema </li>
    </ul> </td>
  </tr>
  <tr>
   <td><code>maxItems</code></td>
   <td>String</td>
   <td>Specifies the maximum number of items in an array. The maximum items must be equal to or greater than zero.</td>
   <td> </td>
  </tr>
  <tr>
   <td><code>minItems</code></td>
   <td>String</td>
   <td>Specifies the minimum number of items in an array. The minimum items must be equal to or greater than zero.</td>
   <td> </td>
  </tr>
 </tbody>
</table>



## Enable schema compliant data {#enablig-schema-compliant-data}

To enable all JSON schema-based Adaptive Forms to generate schema-compliant data upon form submission, follow these steps:

1. Go to Experience Manager web console at `https://server:host/system/console/configMgr`.
1. Locate **[!UICONTROL Adaptive Form and Interactice Communication Web Channel Configuration]**. 
1. Select to open the configuration in edit mode.
1. Select the **[!UICONTROL Generate Schema Compliant Data]** checkbox.
1. Save the settings.

  ![adaptive form and interactive communication web channel configuration](/help/forms/using/assets/af-ic-web-channel-configuration.png)

## Non-supported constructs  {#non-supported-constructs}

Adaptive forms do not support the following JSON Schema constructs:

* Null type
* Union types such as any, and
* OneOf, AnyOf, AllOf, and NOT
* Only Homogenous arrays are supported. So, the items constraint must be an object and not be an array.

## Frequently asked questions {#frequently-asked-questions}

**Why I am not able to drag individual elements of a subform (structure generated from any complex type) for repeatable subforms (minOccours or maxOccurs values are greater than 1)?**

In a repeatable subform, you must use the complete subform. If you want only selective fields, use the entire structure and delete the unwanted ones.

**I have a long complex structure in Content Finder. How can I find a specific element?**

You have two options:

* Scroll through the tree structure
* Use the Search box to find an element

**What should be the extension of the JSON schema file?**

The extension of JSON Schema file must be .schema.json. For example, &lt;filename&gt;.schema.json.
