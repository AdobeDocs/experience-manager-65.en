---
title: Creating adaptive forms using JSON Schema
seo-title: Creating adaptive forms using JSON Schema
description: Adaptive forms can use JSON schema as form model, allowing you to leverage existing JSON schemas to create adaptive forms. 
seo-description: Adaptive forms can use JSON schema as form model, allowing you to leverage existing JSON schemas to create adaptive forms. 
uuid: e73b4b4c-6ad7-4400-b776-5892549970c3
topic-tags: develop
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: bcda96ff-6c7d-46c4-a9e8-7e0fb245cde9
---

# Creating adaptive forms using JSON Schema {#creating-adaptive-forms-using-json-schema}

## Prerequisites {#prerequisites}

Authoring an adaptive form using an JSON Schema as its form model requires basic understanding of JSON Schema. It is recommended to read through the following content before this article.

* [Creating an adaptive form](/help/forms/using/creating-adaptive-form.md)
* [JSON Schema](https://json-schema.org/)

## Using a JSON Schema as form model  {#using-a-json-schema-as-form-model}

AEM Forms supports creation of an adaptive form by using an existing JSON Schema as the form model. This JSON Schema represents the structure in which data is produced or consumed by the back-end system in your organization. The JSON Schema you use should be compliant with [v4 specifications](https://json-schema.org/draft-04/schema).

The key features of using an JSON Schema are:

* The structure of the JSON is displayed as a tree in the Content Finder tab in the authoring mode for an adaptive form. You can drag and add element from the JSON hierarchy to the adaptive form.
* You can pre-populate the form using JSON that is compliant with the associated schema.
* On submission, the data entered by the user is submitted as JSON that aligns with the associated schema.

An JSON Schema consists of simple and complex element types. The elements have attributes that add rules to the element. When these elements and attributes are dragged onto an adaptive form, they are automatically mapped to the corresponding adaptive form component.

This mapping of JSON elements with adaptive form components is as follows:

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
   <td><p>{</p> <p>"type" : "string",</p> <p>}</p> </td> 
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

* The title property serves as label for the adaptive form components.
* The description property is set as long description for an adaptive form component.
* The default property serves as initial value of an adaptive form field.
* The maxLength property is set as maxlength attribute of the text field component.
* The minimum, maximum, exclusiveMinimum, and exclusiveMaximum properties are used for Numeric box component.
* To support range for DatePicker component additional JSON Schema properties minDate and maxDate are provided..
* The minItems and maxItems properties are used to restrict the number of items/fields that may be added or removed from a panel component.
* The readOnly property sets the readonly attribute of an adaptive form component.
* The required property marks the adaptive form field as mandatory whereas in case of panel(where type is object), the final submitted JSON data has fields with empty value corresponding to that object.
* The pattern property is set as the validation pattern (regular expression) in adaptive form.
* The extension of JSON Schema file must be kept .schema.json. For example, &lt;filename&gt;.schema.json.

## Sample JSON Schema {#sample-json-schema}

Here's an example of an JSON Schema.

```
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

```
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

```
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
   <td>maxItems</td> 
   <td>String</td> 
   <td>Specifies the maximum number of item in an array. The maximum items must be equal to or greater than zero.</td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td>minItems</td> 
   <td>String</td> 
   <td>Specifies the minimum number of item in an array. The minimum items must be equal to or greater than zero.</td> 
   <td> </td> 
  </tr> 
 </tbody> 
</table>

## Non-supported constructs  {#non-supported-constructs}

Adaptive forms does not support the following JSON Schema constructs:

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

