---
title: DO NOT PUBLISH, BUT DO NOT DELETE Customizing Data Types for Content Fragment Models
seo-title: Customizing Data Types for Content Fragment Models
description: Data types used in Content Fragment Models can be customized.
seo-description: Data types used in Content Fragment Models can be customized.
page-status-flag: de-activated
uuid: d8215dbf-2dbe-43cb-a5c1-dc1cb412a204
contentOwner: aheimoz
discoiquuid: a8b8155c-852c-4d16-b59b-7e19527c2bd4
noindex: true
---

# DO NOT PUBLISH, BUT DO NOT DELETE Customizing Data Types for Content Fragment Models{#do-not-publish-but-do-not-delete-customizing-data-types-for-content-fragment-models}

[Content fragments](/help/assets/content-fragments.md) are based on [content fragment models](/help/assets/content-fragments-models.md). These models are built up from [elements](/help/assets/content-fragments.md#constituent-parts-of-a-content-fragment) of different data types.

Various data types are available out-of-the-box, including single-line text, multi-line rich text, numerical fields, boolean selectors, dropdown menu options, date and time, and others. AEM users can select data types based on the editorial intent of the corresponding fragment(s). This allows you to cater for simple text models through to complex models with various different kinds of content, and the associated fragment authoring experience.

Data types are defined by a [combination of node properties](#properties) held in [specific locations in the repository](#locations-in-the-repository). You can also create your own [data types](#creating-your-data-type) and [fieldProperties](#creating-your-own-fieldproperties-property).

<!-- Please uncomment when files are used>
>[!NOTE]
>
>See also [Customizing Content Fragment Models](/help/sites-developing/customizing-content-fragment-models.md).
-->

## Locations in the Repository {#locations-in-the-repository}

All the out-of-the-box datatypes are declared under:

`/libs/settings`

You can add new data types by overlaying the node structure as follows under `/apps`:

`/apps/settings/dam/cfm/models/formbuilderconfig/datatypes/items`

>[!CAUTION]
>
>You must not change anything in the `/libs` path.
>
>Anything there is liable to change at the next upgrade, or installation of a service or fix pack.

## Properties {#properties}

Node properties are used to define the data types:

* [Data Types Properties](#data-type-properties)
* and within those [fieldProperties](#fieldproperties)

### Data Type Properties {#data-type-properties}

All data types are represented in a node structure as under:

`/libs/settings/dam/cfm/models/formbuilderconfig/datatypes/items`

Each node under `/items` has properties that define how that data type should be represented inside the model editor.

All of the following properties must be present for the data type to be present in the model editor:

* `fieldIcon`

  [CoralUI icon](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/coral-ui/coralui3/Coral.Icon.html#availableicons) to represent the data type in the model editor UI. 

* ` [fieldProperties](#fieldproperties)`

  An array that represents the configuration properties for each data type.  

* `fieldResourceType`

  The Sling resource type used to render the data type in a content fragment. For data types that can be rendered in different ways (for example, as simple text input and/or multiline text input), this property must be created as an array, containing all resource types. The `renderasfield` property will be added automatically to `fieldProperties` to let the user choose the resource type they need to add to the model,  

* `fieldPropResourceType`

  The Sling resource type used to render the default property for the data type.

  For example, for the data type:

    * Single line text, the `fieldPropResourceType` would be a `textfield` component
    * Boolean, the `fieldPropResourceType` would be a `checkbox` component

* `fieldViewResourceType`

  The Sling resource type used to render the data type in the preview, when constructing the model. When the user drags the data type to the left side of the model editor, the `fieldViewResourceType` property represents the component that is rendered there. This is used for cases where you do not want to render the full component, but only want to render a substitute that minimizes the overhead to the model editor.

* `fieldTitle` 

  Property that defines the title of this data type. For example, **Single line text** for a `textfield` component, **Multi line text** for a multifield component.

* `valueType` 

  This is the type of value that the data type returns when it is stored internally. See [Mappings](#mappings).  

* `renderType` 

  This is an internal representation of the data type. It connects the `valueType` to a UI component. See [Mappings](#mappings).  

* `listOrder` 

  Each data type needs a value that represents its order in the list. This is used to assure the correct ordering of the various fields (added/moved by drag and drop) when saving the model editor. This value must be an integer and it is recommended to assign the number in an ascending, ordered manner. When creating a new data type it is best to assign the value based on the last data type in the list (the highest value of `listOrder` value present in the data types).

#### Mappings {#mappings}

<table> 
 <tbody> 
  <tr> 
   <td>Data Type<br /> </td> 
   <td>Value Type<br /> </td> 
   <td>Render Type</td> 
  </tr> 
  <tr> 
   <td>Single line text</td> 
   <td>string</td> 
   <td>text-single</td> 
  </tr> 
  <tr> 
   <td>Multi line text</td> 
   <td>string, with content type<br /> </td> 
   <td>text-multi</td> 
  </tr> 
  <tr> 
   <td>Number (integer/long)<br /> </td> 
   <td>long</td> 
   <td>number</td> 
  </tr> 
  <tr> 
   <td>Number (double/float)</td> 
   <td>double</td> 
   <td>number</td> 
  </tr> 
  <tr> 
   <td>Boolean</td> 
   <td>boolean</td> 
   <td>boolean</td> 
  </tr> 
  <tr> 
   <td>Date and time</td> 
   <td>calendar</td> 
   <td>time</td> 
  </tr> 
  <tr> 
   <td>Enumeration</td> 
   <td>string/long</td> 
   <td>enumeration</td> 
  </tr> 
  <tr> 
   <td>Tags</td> 
   <td>string</td> 
   <td>tags</td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>Some types (for example, `string`, `long`, amongst others) may be multi-valued. In this case, the component used for rendering and editing is typically wrapped by a multifield component ( `granite/ui/components/coral/foundation/form/multifield`). The exception is tags, where the editing component is responsible for rendering it correctly.

### fieldProperties {#fieldproperties}

The configuration properties for each data type. Values for `fieldProperties`:

* `base` 

  This is the basis for all `fieldProperties` components. The definition is situated under `/libs/dam/cfm/models/editor/components/datatypeproperties/base`. 

  It contains the variable `fieldRoot`, which subsequent `fieldProperties` can use when creating inputs to retrieve the correct path. 

  Example: to get the correct path for a **Field Label** you will the need the key to identify the component this belongs to, the input for this field should be `fieldRoot` + `<*fieldLabel*>`

* `checkboxfields` 

  This component adds the default checkbox for the `Boolean` data type, as well as the Sling parameters `checked@Delete` and `checked@TypeHint`.

* `datepickerfields` 

  Component that adds the hidden inputs needed for the date picker component to function. Includes creating the properties `defaultDateField`, `displayedFormat`, `emptyText`, `valueFormat`, `minDate` and `maxDate`.

* `datetimepickerfields` 

  This adds a select field for `Date&Time` data type to distinguish between `Date` and `Date&Time` options.

* `datevaluefield` 

  This adds a datepicker to the properties, so that a user can select a default for the `Date&Time` data type.

* `descriptionfield` 

  This component adds a multline text field that represents the description of the currently selected component in the multi-line editor. It is automatically added by the Model Editor renderer at the end of each data type properties.

* `labelfield` 

  Component that adds a `textfield` input that adds the field label for a data type that can have field labels.

* `maptopropertyfield` 

  This component adds the `Name` field in the properties, giving an identifier to the selected component of a data type. It should be present in all data types.

* `maxlengthfield` 

  It is used to add the `maxLength` property for use with data types that accept this property. For example, with **Single Line Text**, **Number**, etc.

* `multieditorfield` 

  This adds all the hidden field necesarry for the multi-line editor to work, which is represented by the **Multi Line Text** data type.

* `mvfields` 

  Component that adds all the hidden fields needed for a multifield component to work. For example, for the second option of a **Single Line Text** data type. This should be added for any component that is rendered as a multifield.

* `numbertypefield` 

  Select option for the **Number** data type that selects between **Integer** or **Fraction** for the **Number** data type.

* `numbervaluefield` 

  A `numberfield` default value selector for the **Number** `type.options` This adds the options input for the **Enumeration** data type, which is used to determine the values for the select box component.

* `placeholderfield` 

  This is a textfield that acts as the input for the `emptyText` property of a component. This should be used by all data types that accept a placeholder (that is not very complicated; e.g. **Single Line Text**, **Number**, etc).

* `renderasfield` 

  This is the component that is rendered automatically when several `fieldResourceTypes` are present in the property of the data type node.

* `requiredfield` 

  This is a checkbox that represents the `required` property for a component. Because most components accept the `required` field, this field can be used for most data types.

* `tagsfields` 

  Components that adds the inputs necessary for a `tagfield` component to be rendered, used by the **Tags** data type.

* `tagsroot` 

  A path picker used by the **Tags** data type to set the root path for `tagsfield` component.

* `textfield` 

  Used by the `Boolean` data type to set the field label of the checkbox defined by this data type.

* `textvaluefield` 

  The default value property for **Single Line Text** data type.

## Creating your Data Type {#creating-your-data-type}

To create your own data type you need to:

* [Create the Node Structure](#creating-the-node-structure)
* [Define the Properties for your Data Type](#defining-the-properties-for-your-data-type)

You can then [use your data type](#using-your-data-type).

You can also [create your own `fieldProperties`](#creating-your-own-fieldproperties-property).

### Creating the Node Structure {#creating-the-node-structure}

The node structure must be created under `/apps` in order to overlay the data types. If it does not exist already you must create:

1. If it does not exist already you must create:

   ```
   + apps 
     + settings
       + dam 
         + cfm (cq:Page) 
           + models (nt:folder)
             + formbuilderconfig (sling:folder)
               + datatypes (nt:unstructured)
                 + items (nt:unstructured)
   
   ```

   >[!NOTE]
   >
   >`/apps/settings/dam` should already exist.
   >
   >`/cfm/models/formbuilderconfig/datatypes/items` may need to be created with the nodetypes specified.

1. Under `/items` you can add new node(s) to represent your new data type(s):

    * Node Type: `nt:unstructured`
    * ``Properties: see [Defining the Properties for your Data Type](#defining-the-properties-for-your-data-type)

### Defining the Properties for your Data Type {#defining-the-properties-for-your-data-type}

1. Determine values for the following [data type properties](#data-type-properties) that are required for your data type:

    * `fieldResourceType`
    * `fieldPropResourceType`
    * `fieldViewResourceType`

   These define how the components for your data type will be rendered. They can be any component; including your own custom components (need a matching set of ` [fieldProperties](#fieldproperties)`).

   Define these properties, with the approriate values, on the node for your data type.

1. Determine the ` [fieldProperties](#fieldproperties)` to be used. This is dependent on the attributes or properties that your `fieldResourceType` needs.

   For example, a `granite/ui/components/coral/foundation/form/textfield`should have a **Label Name**, a **Maximum Length**, a **Placeholder Text** and a **Default Value** property.

   You can choose from the out-of-the-box [fieldProperties](#fieldproperties), or [create your own properties](#creating-your-own-fieldproperties-property).

   Define these properties, with the approriate values, on the node for your data type.

1. Determine values for the following [data type properties](#data-type-properties):

    * `fieldIcon`
    * `fieldTitle`
    * `renderType`
    * `valueType`
    * `listOrder`

   Define these properties, with the approriate values, on the node for your data type.

### Using your Data Type {#using-your-data-type}

After you save this node structure, with all properties applied, you can open any model with the model editor and see, and use, your new data type.

## Creating your own fieldProperties Property {#creating-your-own-fieldproperties-property}

You can choose from the out-of-the-box [fieldProperties](#fieldproperties), or create your own:

1. Create a component under:

   `/apps/dam/cfm/models/editor/components/datatypeproperties/`

   If the path does not exist, you can create it using `nt:folder` nodes.

    1. To have access to the variables, this component should extend:

       `/libs/dam/cfm/models/editor/components/datatypeproperties/base`* * 
  
    1. The component should be able to be included through:

       `sling:include`
  
    1. This component should either render a field (if a user needs to introduce data) or a hidden input with the properties needed by your data type. For example, a multifield component requires a child node with the type of field it should duplicate, therefore there should be an input that can create (through sling POST mechanics) a child node of a specific type.

1. The base name of this component should be added to `fieldProperties`.
1. Repeat for all the properties you need.

