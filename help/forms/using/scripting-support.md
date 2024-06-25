---
title: Scripting support for HTML5 forms
description: JavaScript, FormCalc properties, and other methods that are supported in HTML5 Forms.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
feature: HTML5 Forms,Mobile Forms
exl-id: bcb5afc5-2190-4269-aba2-63842db9df3f
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Scripting support for HTML5 forms {#scripting-support-for-html-forms}

JavaScript, FormCalc properties, and methods supported in HTML5 forms are as listed below:

## $event {#event}

<table>
 <tbody>
  <tr>
   <th>Property </th>
   <th>Description<br /> </th>
   <th>Exception</th>
  </tr>
  <tr>
   <td><code>prevText</code></td>
   <td>Specifies the content of the field before it changes in response to the actions of a user. This value can be recalled, similar to an undo feature.</td>
   <td><p>Does not work for drop-downs and list boxes. <code>PrevText </code>does not work correctly for the following cases:</p>
    <ul>
     <li>On typing some special character keys (for example, $ or , or &amp; or @ and more) in Numeric fields on the iPad, and </li>
     <li>For the Date field (when date is entered through calendar).<br /> </li>
    </ul> <p>Setting value through script is not supported.</p> </td>
  </tr>
  <tr>
   <td><code>target</code></td>
   <td>Specifies the object upon which the event is acting.</td>
   <td>Setting value through script is not supported.<br /> </td>
  </tr>
  <tr>
   <td><code>newtext</code></td>
   <td>Specifies the content of the field after it changes in response to user actions.</td>
   <td><p>The <code>newText</code> property does not work properly for following cases :</p>
    <ul>
     <li>On selecting-replacing texts</li>
     <li>On deleting, copying, and pasting texts.</li>
     <li>On typing some special character keys (for example, $ or , or &amp; or @ and more) in Numeric fields<br /> </li>
     <li>On using shift+alphanumeric combination. </li>
     <li>On using date/time fields.</li>
    </ul>
    <div>
      Setting value through script is not supported.
    </div> </td>
  </tr>
  <tr>
   <td>change</td>
   <td>Specifies the value that a user types or pastes into a field immediately after they perform the action. </td>
   <td><p>The change property does not work properly for following cases:</p>
    <ul>
     <li>On selecting-replacing texts</li>
     <li>On deleting, copying, and pasting texts.</li>
     <li>On typing some special character keys (for example, $ or , or &amp; or @ and more) in Numeric fields<br /> </li>
     <li>On using shift+alphanumeric combination. </li>
     <li>On using date/time fields.</li>
    </ul> <p>Setting value through script is not supported.</p> </td>
  </tr>
  <tr>
   <td>keydown</td>
   <td>Determines whether a user is pressing an arrow key to make a selection. This property is available only for list boxes and drop-down lists.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>modifier</td>
   <td>Determines whether the modifier key (for example, Ctrl on Microsoft&reg; Windows&reg;) is held down when a particular event executes.</td>
   <td>None</td>
  </tr>
 </tbody>
</table>

### $host {#host}

<table>
 <tbody>
  <tr>
   <th>Property</th>
   <th>Description</th>
   <th>Exception</th>
  </tr>
  <tr>
   <td><code>apptype</code></td>
   <td>Returns the application type of the host. Available only for client applications.</td>
   <td>Returns <code>HTML 5</code>.</td>
  </tr>
  <tr>
   <td><code>name</code></td>
   <td>Returns the name of the current application.</td>
   <td>Returns the browser name and its version. For example, in Chrome browser, the value returned is <code>Chrome &lt;version&gt;.</code></td>
  </tr>
  <tr>
   <td><code>numPages</code></td>
   <td>Returns the number of pages in the document.</td>
   <td>Pagination policy of HTML5 forms is not identical to PDF forms pagination policy. So the numPages API can return a different values in both the cases.</td>
  </tr>
  <tr>
   <td><code>platform</code></td>
   <td>Returns a string representing the platform of the computer running the script.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>title</code></td>
   <td>Specifies the title of the document. It is available only for client applications.</td>
   <td>It returns title of HTML document in form, rather than the form metadata title as if there are PDF Forms.</td>
  </tr>
  <tr>
   <td><code>version</code></td>
   <td>Returns a string representing the version number of the current application.</td>
   <td>It returns the version of the form.</td>
  </tr>
  <tr>
   <td><code>calculationsEnabled</code></td>
   <td>Specifies whether calculate scripts will execute.<br /> </td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>validationsEnabled</code></td>
   <td>Specifies whether validation scripts will execute.<br /> </td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>pageUp</code></td>
   <td>Goes to the previous page.</td>
   <td>HTML5 forms do not follow the same pagination policy as PDF Form, so the previous page of an HTML5 form is different from previous page of a PDF Form.</td>
  </tr>
  <tr>
   <td><code>pageDown</code></td>
   <td>Moves to the next page of a form. Use the pageDown method at runtime.</td>
   <td> </td>
  </tr>
  <tr>
   <td><code>setFocus</code></td>
   <td>Sets the keyboard focus to the field specified. The field is specified as an object, or by the SOM expression of the field. It is available only for client applications.</td>
   <td> </td>
  </tr>
  <tr>
   <td><code>resetdata</code></td>
   <td>Resets the fields to their default values within a document.</td>
   <td>Clears all data in a form with merged data, rather than restoring it to default values.</td>
  </tr>
  <tr>
   <td><code>messageBox</code></td>
   <td>Displays a dialog box on the screen. It is available only for client applications</td>
   <td>Message box of type Yes/No is converted to OK/Cancel. Message box with three buttons is not supported.</td>
  </tr>
  <tr>
   <td>currentPage</td>
   <td><p>Sets the currently active page of a document at runtime.</p> <p>Page values are 0-based, so the first page of a document returns a value of 0.</p> <p>The currentPage property is available when layout:ready executes on a client. However, it is not available when layout:ready executes on the server because the property will not execute until the form layout executes.</p> </td>
   <td>None</td>
  </tr>
 </tbody>
</table>

### field {#field}

<table>
 <tbody>
  <tr>
   <th><strong><span>Property</span></strong></th>
   <th><strong><span>Description<br /> </span></strong></th>
   <th><strong><span>Exception</span></strong></th>
  </tr>
  <tr>
   <td><code>presence</code></td>
   <td>Controls the participation of the associated object in different phases of processing. If the object is a container, the contents of the container inherit whatever restrictions this control applies.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>access</code></td>
   <td>Controls user access to the contents.</td>
   <td>Does not work for the exclusion group. Moreover, HTML5 forms gives same treatment to non-interactive and protected objects.<br /> </td>
  </tr>
  <tr>
   <td><code>name</code></td>
   <td>An identifier that is used to identify this element in script expressions.</td>
   <td>HTML5 forms do not allow setting name property for objects. It is read-only property for HTML5 forms.</td>
  </tr>
  <tr>
   <td><code>value</code></td>
   <td>A content element that encloses a single unit of data content.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>rawValue</code></td>
   <td>Specifies the unformatted value for this field.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>formattedValue</code></td>
   <td>Specifies the formatted value for this field.</td>
   <td>Setting <code>formattedValue</code> through script is not supported.</td>
  </tr>
  <tr>
   <td><code>editValue</code></td>
   <td>Specifies the edit value for this field.</td>
   <td>Setting <code>editValue </code>through script is not supported.</td>
  </tr>
  <tr>
   <td><code>formatMessage</code></td>
   <td>Specifies the format validation message string for this field.</td>
   <td>Setting <code>formatMessage </code>through script is not supported.</td>
  </tr>
  <tr>
   <td><code>fillcolor</code></td>
   <td>Specifies the background color value for this field. You need to set the border.fill.presence property to visible separately.</td>
   <td>It does not correctly return default color of the field.</td>
  </tr>
  <tr>
   <td><code>border</code></td>
   <td>The border object describes the border surrounding an object.</td>
   <td> </td>
  </tr>
  <tr>
   <td><code>ui</code></td>
   <td>The ui object encloses the user interface description of a form object.</td>
   <td> </td>
  </tr>
  <tr>
   <td><code>mandatory</code></td>
   <td>Specifies the nullTest value for the field.</td>
   <td> </td>
  </tr>
  <tr>
   <td><code>borderColor</code></td>
   <td>Specifies the border color value for this field. You need to set the border.edge.presence property to visible separately.</td>
   <td>It does not correctly return default border color of the field.</td>
  </tr>
  <tr>
   <td><code>length</code></td>
   <td>The number of items in the list.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>addItem</code></td>
   <td>Adds new items to the current field.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>clearItem</code></td>
   <td>Removes all the items from the field.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>boundItem</code></td>
   <td>Gets the bound value of a specific display item of a drop-down list or list box.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>execCalculate</code></td>
   <td>Executes the calculate script of the field.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>execValidate</code></td>
   <td>Executes the validate script of the field.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>execEvent</code></td>
   <td>Executes the event script of the object.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>getItemState</code></td>
   <td>Returns the selection state of the specified item</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>setItemState</code></td>
   <td>Sets the selection state of the specified item.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>getDisplayItem</code></td>
   <td>Retrieves the item display text for the specified item index.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>getSaveItem</code></td>
   <td>Retrieves the data value for the specified item index.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>deleteItem</code></td>
   <td>Deletes the item at the specified index.</td>
   <td>None</td>
  </tr>
  <tr>
   <td><code>setItems</code></td>
   <td>Sets the specified items in the current field. It replaces pre-existing items.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>h</td>
   <td>A measurement of the height for the layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>w</td>
   <td>A measurement specifying the width for the layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>x</td>
   <td>Specifies the x coordinate of the container's anchor point relative to the upper-left corner of the parent container when placed with positioned layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>y</td>
   <td>Specifies the y coordinate of a container's anchor point relative to the upper-left corner of the parent container when placed with positioned layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>caption</td>
   <td>The caption object describes a descriptive label associated with a form design object.<br /> </td>
   <td>None</td>
  </tr>
  <tr>
   <td>validate</td>
   <td>The validate object controls validation of user-supplied data on a form. The validate object can be activated multiple times during the life of a form.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>parentSubform</td>
   <td>Specifies the parent subform (page) of this field.</td>
   <td>Always returns parent subform instead of returning first non-scoping parent subform.<br /> </td>
  </tr>
  <tr>
   <td>selectedIndex</td>
   <td>The index of the first selected item.</td>
   <td>None</td>
  </tr>
 </tbody>
</table>

## Form {#form}

| **Property** |**Description** |**Exception** |
|---|---|---|
| formNodes |Returns a list of all form model objects that are bound to a specified data object. |  |

## InstanceManager {#instancemanager}

| Property  |Description |
|---|---|
| `name` |An identifier that is used to identify this element in script expressions. |
| `occur` |Describes the constraints over the number of allowable instances for its enclosing container. |
| `min` |Specifies the minimum number of instances that can be instantiated. |
| `max` |Specifies the maximum number of instances that can be instantiated. |
| `count` |Specifies the current number of instances instantiated. |
| `setInstances` |Adds or removes the specified subforms or subform sets from this node. |
| `addInstance` |Adds a new instance of a subform or subform set to this node. |
| `removeInstance` |Removes a subform or subform set from this node. |
| `moveInstance` |Moves a child object of a form model object to another specified location within the form model. The corresponding data model information for the object is also relocated within the data model. |
| `insertInstance` |Inserts a new instance of a subform or subform set to this node. |

## list {#list}

| Property |Description |
|---|---|
| `length` |The number of elements in the list. |
| `item` |A zero-based index into the collection. |
| `append` |Appends a node to the end of the node list. |
| `remove` |Removes a node from the node list. |
| `insert` |Inserts a node before a specific node in the node list. |

## node {#node}

| Property |Description |Exception |
|---|---|---|
| createNode |Creates new node based on a valid class name. |None |
| `isContainer` |Specifies whether this object is a container object. |None |
| `isNull` |Indicates whether the current data value is a null value. |None |
| `resolveNode` |Evaluates the specified SOM expression, beginning with the current XML form object model object, and returns the value of the object specified in the SOM expression. |None |
| `resolveNodes` |Evaluates the specified SOM expression, beginning with the current XML form object model object, and returns the value of the object specified in the SOM expression. |None |
| oneOfChild |Creates new node based on a valid class name. |None |
| getElement |Returns a specified child object. |None |
| getAttribute |Gets a specified property value. |None |
| setAttribute |Sets the value of a specified property. |None |

## model {#model}

| Property |Description |Exception |
|---|---|---|
| NA | NA | NA |

## Subform {#subform}

<table>
 <tbody>
  <tr>
   <th>Property</th>
   <th>Description</th>
   <th>Exception</th>
  </tr>
  <tr>
   <td>instanceIndex</td>
   <td>Specifies the index of the object, relative to the other instantiated instances.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>execEvent</td>
   <td>Executes the event script of the object.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>getInvalidObjects</td>
   <td>Returns a list of nodes contained within the subform (inclusive), that have failed the validation test.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>border</td>
   <td>The border object describes the border surrounding an object.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>borderColor</td>
   <td>Specifies the border color value for this field. You need to set the border.edge.presence property to visible separately.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>h</td>
   <td>A measurement of the height for the layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>w</td>
   <td>A measurement specifying the width for the layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>x</td>
   <td>Specifies the x coordinate of the container's anchor point relative to the upper-left corner of the parent container when placed with positioned layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>y</td>
   <td>Specifies the y coordinate of a container's anchor point relative to the upper-left corner of the parent container when placed with positioned layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>validate</td>
   <td>The validate object controls validation of user-supplied data on a form. The validate object can be activated multiple times during the life of a form.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>name</td>
   <td>An identifier that is used to identify this element in script expressions.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>presence</td>
   <td>Specifies an object's visibility.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>access</td>
   <td>Controls user access to the contents of a container object, such as a subform.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>execValidate</td>
   <td>Calculates the index of a subform or subform set based on where it is located relative to other instances of the same form object.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>instanceManager</td>
   <td>The instanceManager object manages the instance creation, removal, and movement of form model objects.<br /> </td>
   <td>None</td>
  </tr>
 </tbody>
</table>

### submit {#submit}

| Property |Description |
|---|---|
| target |The URL to which the data is submitted. Omission of this attribute implies the XFA processing application obtains the URI using a product-specific technique, such as accessing product-specific information in the config object. |

## tree {#tree}

<table>
 <tbody>
  <tr>
   <th>Property</th>
   <th>Description</th>
   <th>Exception</th>
  </tr>
  <tr>
   <td>nodes</td>
   <td>Returns a list of all child objects of the current object.</td>
   <td>
    <ul>
     <li>Not supported for xfa.nodes, desc</li>
     <li>Number of nodes reported for PDF and HTML are different. </li>
    </ul> </td>
  </tr>
  <tr>
   <td>name</td>
   <td>Specifies the name of this node.</td>
   <td>Setting the name using scripts is not allowed in HTML.</td>
  </tr>
  <tr>
   <td>parent</td>
   <td>Gets the parent for this node.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>index</td>
   <td>Returns the position of this node in its collection of like-named, in-scope, like-child relationship nodes.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>somExpression</td>
   <td>Gets the SOM expression for this node.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>resolveNode</td>
   <td>Evaluates the specified SOM expression, beginning with the current XML form object model object, and returns the value of the object specified in the SOM expression.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>resolveNodes</td>
   <td>Evaluates the specified SOM expression, beginning with the current XML form object model object, and returns the value of the object specified in the SOM expression.</td>
   <td>None</td>
  </tr>
 </tbody>
</table>

## subformset {#subformset}

| Property |Description |Exception |
|---|---|---|
| instanceManager |The instanceManager object manages the instance creation, removal, and movement of form model objects.  |None |

## content {#content}

| **Property** |**Description** |**Exception** |
|---|---|---|
| isNull |Indicates whether the current data value is the null value. |  |

## dataValue {#datavalue}

| **Property** |**Description** |**Exception** |
|---|---|---|
| isNull |Indicates whether the current data value is the null value. |  |

## edge {#edge}

<table>
 <tbody>
  <tr>
   <td><strong>Property </strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>color</td>
   <td>The color property describes a unique color for the pattern object.</td>
   <td>
    <ul>
     <li>The default value cannot be retrieved. </li>
     <li>The changes are reflected in Model and are available for scripting but are not synced to HTML elements. Hence, the changes are not reflected in the UI.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## fill {#fill}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>color</td>
   <td>The color properties define a unique color of fill.</td>
   <td>
    <ul>
     <li>The default value cannot be retrieved. </li>
     <li>The changes are reflected in Model and are available for scripting but are not synced to HTML elements. Hence, the changes are not reflected in the UI.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## linear {#linear}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>color</td>
   <td>The color property describes a unique color for a linear gradient fill on a form.</td>
   <td>
    <ul>
     <li>The default value cannot be retrieved. </li>
     <li>The changes are reflected in Model and are available for scripting but are not synced to HTML elements. Hence, the changes are not reflected in the UI.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## line {#line}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>edge</td>
   <td>The edge object describes an arc, line, or one side of a border or rectangle.<br /> </td>
   <td>Attributes such as color, cap, and more are not supported.<br /> </td>
  </tr>
 </tbody>
</table>

## pattern {#pattern}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>color</td>
   <td>The color property describes a unique color for the pattern object. </td>
   <td>
    <ul>
     <li>The default value cannot be retrieved. </li>
     <li>The changes are reflected in Model and are available for scripting but are not synced to HTML elements. Hence, the changes are not reflected in the UI.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## radial {#radial}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>color</td>
   <td>The color property describes a unique color for the radial object</td>
   <td>
    <ul>
     <li>The default value cannot be retrieved. </li>
     <li>The changes are reflected in Model and are available for scripting but are not synced to HTML elements. Hence, the changes are not reflected in the UI.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## stipple {#stipple}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>color</td>
   <td>The color property describes a unique color for the stipple object.</td>
   <td>
    <ul>
     <li>The default value cannot be retrieved. </li>
     <li>The changes are reflected in model and are available for scripting but are not synced to HTML elements. Hence, the changes are not reflected in the UI.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## draw {#draw}

<table>
 <tbody>
  <tr>
   <td>Property</td>
   <td>Description</td>
   <td>Exception</td>
  </tr>
  <tr>
   <td>ui</td>
   <td>The ui object encloses the user interface description of a form object.<br /> </td>
   <td> </td>
  </tr>
  <tr>
   <td>caption</td>
   <td>The caption object describes a descriptive label associated with a form design object.</td>
   <td> </td>
  </tr>
  <tr>
   <td>presence</td>
   <td>Specifies an object's visibility.</td>
   <td> </td>
  </tr>
  <tr>
   <td>name</td>
   <td>Specifies an identifier that may be used to specify this object or event in script expressions.</td>
   <td>Setting the value at the runtime is not supported</td>
  </tr>
  <tr>
   <td>value</td>
   <td>The value object encloses a single unit of data content.<br /> </td>
   <td> </td>
  </tr>
 </tbody>
</table>

## corner {#corner}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>color</td>
   <td>The color property describes a unique color for the corner object.</td>
   <td>
    <ul>
     <li>The default value cannot be retrieved. </li>
     <li>The changes are reflected in model and are available for scripting but are not synced to HTML elements. Hence, the changes are not reflected in the UI.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## checkButton {#checkbutton}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>border</td>
   <td>The border object describes the border surrounding checkButton object. </td>
   <td>The changes are reflected in model and are available for scripting but are not synced to HTML elements. Hence, the changes are not reflected in the UI.<br /> </td>
  </tr>
 </tbody>
</table>

## choiceList {#choicelist}

<table>
 <tbody>
  <tr>
   <td><strong>Property<br /> </strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>border</td>
   <td>The border object describes the border surrounding choiceList object.</td>
   <td> </td>
  </tr>
 </tbody>
</table>

## dateTimeEdit {#datetimeedit}

| **Property** |**Description** |**Exception** |
|---|---|---|
| border |The border object describes the border surrounding dateTimeEdit object. |  |

## Image {#image}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>contentType</td>
   <td>Specifies the type of content in the referenced document, expressed as a MIME type.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>name<br /> </td>
   <td>An identifier that is used to identify this element in script expressions.</td>
   <td>None</td>
  </tr>
 </tbody>
</table>

## imageEdit {#imageedit}

| **Property** |**Description** |**Exception** |
|---|---|---|
| border |The border object describes the border surrounding imageEdit object. |  |

## numericEdit {#numericedit}

| **Property** |**Description** |**Exception** |
|---|---|---|
| border |The border object describes the border surrounding an object. |none |

## object {#object}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>className</td>
   <td>Determines the name of the class of this object.<br /> </td>
   <td>none</td>
  </tr>
 </tbody>
</table>

## rectangle {#rectangle}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>edge</td>
   <td>The edge object describes an arc, line, or one side of a border or rectangle.<br /> </td>
   <td>Attributes such as color, cap, and more are not supported.</td>
  </tr>
 </tbody>
</table>

## textEdit {#textedit}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>border</td>
   <td>The border object describes the border surrounding an object.<br /> </td>
   <td>None</td>
  </tr>
 </tbody>
</table>

## exclGroup {#exclgroup}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>layout</td>
   <td>Specifies the layout strategy to be used by this object.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>border</td>
   <td>Specifies the border surrounding this field.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>mandatory</td>
   <td>Specifies the nullTest value for the field.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>borderColor</td>
   <td>Specifies the border color value for this field.A border must be defined before you can change the color by scripting.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>borderWidth</td>
   <td>Specifies the border width for this field.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>h</td>
   <td>A measurement of the height for the layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>transient</td>
   <td>Specifies whether the processing application must save the value of the exclusion group as part of a form submission or save operation.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>w</td>
   <td>A measurement specifying the width for the layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>x</td>
   <td>Specifies the x coordinate of the container's anchor point relative to the upper-left corner of the parent container when placed with positioned layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>y</td>
   <td>Specifies the y coordinate of a container's anchor point relative to the upper-left corner of the parent container when placed with positioned layout.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>caption</td>
   <td>The caption object describes a descriptive label associated with a form design object.<br /> </td>
   <td>None</td>
  </tr>
  <tr>
   <td>validate</td>
   <td>The validate object controls validation of user-supplied data on a form. The validate object can be activated multiple times during the life of a form.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>dataNode</td>
   <td>Gets the data node to which a form node is bound after merge.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>presence</td>
   <td>Specifies an object's visibility.</td>
   <td> </td>
  </tr>
  <tr>
   <td>access</td>
   <td>Controls user access to the contents of a container object, such as a subform.</td>
   <td>For individual items in the exclgrp, it always returns open. </td>
  </tr>
  <tr>
   <td>name</td>
   <td>Specifies an identifier that may be used to specify this object or event in script expressions.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>members</td>
   <td>Specify the members of exclusion group. </td>
   <td>None</td>
  </tr>
  <tr>
   <td>selectedMember</td>
   <td>Returns the selected member of an exclusion group.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>execCalculate</td>
   <td>Executes any scripts on the calculate event of the specified object, and any child objects.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>calculate</td>
   <td>The calculate object controls the calculation of a field's value.<br /> </td>
   <td>None</td>
  </tr>
 </tbody>
</table>

## arc {#arc}

<table>
 <tbody>
  <tr>
   <td><strong>Property<strong></strong></strong></td>
   <td><strong>Description<strong></strong></strong></td>
   <td><strong>Exception<strong></strong></strong></td>
  </tr>
  <tr>
   <td>edge</td>
   <td>The edge object describes an arc, line, or one side of a border or rectangle.<br /> </td>
   <td>Attributes such as color, cap, and more are not supported. </td>
  </tr>
 </tbody>
</table>

## border {#border}

<table>
 <tbody>
  <tr>
   <td><strong>Property<strong></strong></strong></td>
   <td><strong>Description<strong></strong></strong></td>
   <td><strong>Exception<strong></strong></strong></td>
  </tr>
  <tr>
   <td>edge</td>
   <td>The edge object describes an arc, line, or one side of a border or rectangle.<br /> </td>
   <td>Attributes such as color, cap, and more are not supported. </td>
  </tr>
 </tbody>
</table>

## $layout {#layout}

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Exception</strong></td>
  </tr>
  <tr>
   <td>h</td>
   <td>Determines the height of a given form design object.<br /> </td>
   <td>
    <ul>
     <li>Height (h) property is not supported for page area and content area. </li>
     <li>Parameter 'Offset from first content area the XFA-Form object occurs on' is not supported.</li>
    </ul> </td>
  </tr>
  <tr>
   <td>w</td>
   <td>Determines the width of a given form design object.</td>
   <td>
    <ul>
     <li>Width (w) property is not supported for page area and content area. </li>
     <li>Parameter 'Offset from first content area the XFA-Form object occurs on' is not supported.</li>
    </ul> </td>
  </tr>
  <tr>
   <td>x</td>
   <td>Determines the x coordinate of a given form design object relative to its parent object.</td>
   <td>
    <ul>
     <li>x coordinate (x) property is not supported for page area and content area. </li>
     <li>Parameter 'Offset from first content area the XFA-Form object occurs on' is not supported.</li>
    </ul> </td>
  </tr>
  <tr>
   <td>y</td>
   <td>Determines the y coordinate of a given form design object relative to its parent object.</td>
   <td>
    <ul>
     <li>y coordinate (y) property is not supported for page area and content area. </li>
     <li>Parameter 'Offset from first content area the XFA-Form object occurs on' is not supported.</li>
    </ul> </td>
  </tr>
  <tr>
   <td>pagecount</td>
   <td>Determines the number of pages of the current form.</td>
   <td>
    <ul>
     <li>layout.pageCount() method returns different values for PDF and HTML forms.</li>
     <li>On decreasing page count by hiding an object, abspagecount method returns incorrect value.<br /> </li>
    </ul> </td>
  </tr>
  <tr>
   <td>pagecontent</td>
   <td>Retrieves types of form design objects from a specified page of a form.</td>
   <td>None</td>
  </tr>
  <tr>
   <td>absPageCount</td>
   <td>Determines the page count of the current form.</td>
   <td>
    <ul>
     <li>layout.pageCount() method returns different values for PDF and HTML forms.</li>
     <li>On decreasing page count by hiding an object, abspagecount method returns incorrect value.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

## items {#items}

| **Property** |**Description** |**Exception** |
|---|---|---|
| presence |Specifies an object's visibility. |None |

## FormCalc {#formcalc}

FormCalc is an XFA-specific language for creating e-form centric logic and calculations roots. FormCalculation provides a powerful set of build functions.

### FormCalc Supported Functions {#formcalc-supported-functions}

### FormCalc Expression Support {#formcalc-expression-support}

<table>
 <tbody>
  <tr>
   <td><strong>Category </strong></td>
   <td><strong>Description </strong></td>
   <td><strong>Sample </strong></td>
  </tr>
  <tr>
   <td>Simple Expression</td>
   <td>Add, subtract, multiply, divide, and parentheses</td>
   <td>(a+b)*3</td>
  </tr>
  <tr>
   <td>Variable declaration</td>
   <td>Define a variable</td>
   <td>var a<br /> var a=3<br /> a=3</td>
  </tr>
  <tr>
   <td>Logical expression</td>
   <td>
    <ul>
     <li>Logic (and/or)</li>
     <li>Comparison (greater/less/ equal)</li>
    </ul> </td>
   <td>A or 1<br /> 1 &lt;&gt; 2<br /> A NE B<br /> A or 1<br /> 1 &lt;&gt; 2<br /> A NE B</td>
  </tr>
  <tr>
   <td>If expression</td>
   <td><br type="_moz" /> </td>
   <td>if (a&gt;b) then 2 endif</td>
  </tr>
  <tr>
   <td>while</td>
   <td><br type="_moz" /> </td>
   <td>while (i lt 5) do i = i + 1 endwhile</td>
  </tr>
  <tr>
   <td>for</td>
   <td><br type="_moz" /> </td>
   <td>for i = 100 downto 1 <br /> do s = s + i endfor</td>
  </tr>
  <tr>
   <td>for each</td>
   <td><br type="_moz" /> </td>
   <td>for each i in (1, 2, 3) <br /> do s = s + i endfor</td>
  </tr>
  <tr>
   <td>function declaration</td>
   <td>Define a custom function in FormCalc</td>
   <td>func foo(n) do var f = n endfunc</td>
  </tr>
 </tbody>
</table>

### Acrobat API Support {#acrobat-api-support}

1. **Arithmetic Functions**

    1. Abs()
    1. Avg()
    1. Ceil()
    1. Count()
    1. Floor()
    1. Max()
    1. Min()
    1. Mod()
    1. Round()
    1. Sum()

1. **Scientific Functions**

    1. Acos()
    1. Asin()
    1. Atan()
    1. Atan2()
    1. Cos()
    1. Sin()
    1. Tan()
    1. Exp()
    1. Log()
    1. Pow()
    1. Sqrt()
    1. Deg2Rad()
    1. Rad2Deg()
    1. Pi()

1. **Financial Functions**

    1. Apr()
    1. Cterm()
    1. Fv()
    1. Ipmt()
    1. Npv()
    1. Pmt()
    1. Ppmt()
    1. Pv()
    1. Rate()
    1. Term()

1. **Logical Functions**

    1. Choose()
    1. If()
    1. Oneof()
    1. Within()

1. **String Functions**

    1. At()
    1. Concat()
    1. Left()
    1. Len()
    1. Lower()
    1. Ltrim()
    1. Replace()
    1. Right()
    1. Rtrim()
    1. Space()
    1. Stuff()
    1. Substr()
    1. Upper()
    1. WordNum()

1. **Date and Time**

    1. Date()
    1. num2date()
    1. DateFmt()

<table>
 <tbody>
  <tr>
   <td><strong>API</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Aberration</strong></td>
  </tr>
  <tr>
   <td>console.println()</td>
   <td>This acrobat API dumps the output toJavaScript console.</td>
   <td> </td>
  </tr>
  <tr>
   <td>app.alert()</td>
   <td>This acrobat API sends out an alert message throughJavaScript popup.</td>
   <td> </td>
  </tr>
  <tr>
   <td>app.beep()</td>
   <td>Causes the system to play a sound.</td>
   <td>No action is performed.</td>
  </tr>
  <tr>
   <td>app.execDialog()</td>
   <td>Presents a modal dialog box to the user. Modal dialog boxes must be closed by the user before the host application can be directly used again.</td>
   <td>No action is performed.<br /> </td>
  </tr>
  <tr>
   <td>app.launchURL()</td>
   <td>Launches a URL in a browser window.</td>
   <td> </td>
  </tr>
  <tr>
   <td>app.setInterval()</td>
   <td>Specifies a JavaScript script and a time period. The script is executed every time the period elapses. The return value of this method must be held in a JavaScript variable. Otherwise, the interval object is subject to garbage-collection, which would cause the clock to stop. To terminate the periodic execution, pass the returned interval object to clearInterval.</td>
   <td> </td>
  </tr>
  <tr>
   <td>app.setTimeOut()</td>
   <td>Specifies a JavaScript script and a time period. The script is executed one time only, after the period elapses.The return value of this method must be held in a JavaScript variable. Otherwise, the timeout object is subject to garbage-collection, which would cause the clock to stop. To cancel the timeout event, pass the returned timeout object to clearTimeOut.</td>
   <td> </td>
  </tr>
  <tr>
   <td>app.clearInterval()</td>
   <td>Cancels a previously registered interval initially set by the setInterval method.</td>
   <td>In HTML5 forms, the API does not function correctly.</td>
  </tr>
  <tr>
   <td>app.clearTimeOut()</td>
   <td>Cancels a previously registered time-out interval. Such an interval is initially set by setTimeOut.</td>
   <td>In HTML5 forms, the API does not function correctly.<br /> </td>
  </tr>
  <tr>
   <td>app.eval()</td>
   <td>Runs a given script.</td>
   <td> </td>
  </tr>
  <tr>
   <td>app.activeDocs</td>
   <td>An array containing the Doc object for each active document. If no documents are active, activeDocs returns nothing; that is, it has the same behavior as d = new Array(0) in core JavaScript.</td>
   <td>Returns an empty array for HTMl5 forms.</td>
  </tr>
  <tr>
   <td>app.calculate</td>
   <td>If true (the default value), calculations can be performed. If false, calculations are not permitted.</td>
   <td>Always true for HTMl5 Forms.</td>
  </tr>
  <tr>
   <td>app.constants</td>
   <td>A wrapper object for holding various constant values. Currently, this property returns an object with a single property, align.</td>
   <td>HTML5 forms return an empty align object.</td>
  </tr>
  <tr>
   <td>app.focusRect</td>
   <td>Turns the focus rectangle on and off. The focus rectangle is the faint dotted line around buttons, check boxes, radio buttons, and signatures to indicate that the form field has the keyboard focus. A value of true turns on the focus rectangle.</td>
   <td>Always true for HTML5 forms.</td>
  </tr>
  <tr>
   <td>app.formsVersion</td>
   <td>The version number of the viewer forms software. Check this property to determine whether objects, properties, or methods in newer versions of the software are available if you want to maintain backward compatibility in your scripts.</td>
   <td>11.001 always.</td>
  </tr>
  <tr>
   <td>app.language</td>
   <td>The language of the running Acrobat viewer.</td>
   <td>Always "ENU" for HTMl5 forms.</td>
  </tr>
 </tbody>
</table>

## Supported XFA events {#supported-xfa-events}

The following client sided XFA events are supported:

* Initialize
* Validate
* Calculate
* Click
* Enter
* Exit
* Change
* ValidationState

>[!NOTE]
>
>HTML5 forms are rendered on the client-side (browser). Use client side **validate** and **calculate** scripts instead of server-sided scripts.
