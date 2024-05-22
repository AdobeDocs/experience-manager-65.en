---
title: Custom special characters in Correspondence Management
description: Learn how to add custom special characters in Correspondence Management.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: correspondence-management
docset: aem65
feature: Correspondence Management
exl-id: 3e978c3e-12f2-4dc6-801d-8ab4c5df6700
solution: Experience Manager, Experience Manager Forms
role: "Admin, User, Developer"
---
# Custom special characters in Correspondence Management{#custom-special-characters-in-correspondence-management}

## Overview {#overview}

Correspondence Management has built-in default support for 210 special characters that you can insert in letters with ease.

For example, you can insert the following special characters:

* Currency symbols such as &euro;,￥, and £
* Mathematical symbols such as ∑, √, ∂, and ^
* Punctuation symbols as ‟ and "

You can insert special characters in letters:

* In the [text editor](/help/forms/using/document-fragments.md#createtext)
* In an [editable, inline module in a correspondence](../../forms/using/create-correspondence.md#managecontent)

![specialcharactersinlinemodule](assets/specialcharactersinlinemodule.png)

The admin can add support for more/custom special characters by customization. This article provides the instructions on how you can add support for additional, custom special characters.

## Add or modify support for custom special characters in Correspondence Management {#creatingfolderstructure}

Use the following steps to add support for custom special characters:

1. Go to `https://'[server]:[port]'/[ContextPath]/crx/de` and login as Administrator.
1. In the apps folder, create a folder named **[!UICONTROL specialcharacters]** with path/structure similar to the specialcharacters folder (in the textEditorConfig folder under libs):

    1. Right-click the **specialcharacters** folder at the following path and select **Overlay Node**:

       `/libs/fd/cm/ma/gui/configuration/textEditorConfig/specialcharacters`

    1. Ensure that the Overlay Node dialog has the following values:

       **Path:** /libs/fd/cm/ma/gui/configuration/textEditorConfig/specialcharacters

       **Overlay Location:** /apps/

       **Match Node Types:** Checked

       >[!NOTE]
       >
       >Do not change the /libs branch. Any changes you do make may be lost, because this branch is liable to change whenever you:
       >
       >
       >
       >    * Upgrade on your instance
       >    * Apply a hot fix
       >    * Install a feature pack
       >
       >

    1. Click **OK** and then click **Save All**. The specialcharacters folder is created in the specified path.

       After creating the overlay, verify the node structure tags. Each node created in /apps using the overlay should have the same class and properties as defined in /libs for that node. If any property or tag is missing in the node structure under /apps location, sync its tags with the corresponding node in /libs.

1. Ensure that the **[!UICONTROL textEditorConfig]** node has the following properties and values:

   | Name |Type |Value |
   |---|---|---|
   | cmConfigurationType |String |cmTextEditorConfiguration |
   | cssPath |String |/libs/fd/cm/ma/gui/components/admin/createasset/textcontrol/clientlibs/textcontrol |

1. Right-click the **[!UICONTROL specialcharacters]** folder at the following path and select **Create &gt; Child Node** and then click **Save All**:

   /apps/fd/cm/ma/gui/configuration/textEditorConfig/specialcharacters/&lt;YourChildNode&gt;

1. Refresh the Text Editor\Create Correspondence UI page. The node that you have added is the last one in the list of Special characters in the UI.
1. Click **Save All**.
1. Changes in the special characters as required:

<table>
 <tbody>
  <tr>
   <td><strong>To...</strong></td>
   <td><strong>Complete the following steps</strong></td>
  </tr>
  <tr>
   <td>Add a custom special character</td>
   <td>
    <ol>
     <li>Add a child node under "/apps/fd/cm/ma/gui/configuration/textEditorConfig/specialcharacters" with mandatory properties.</li>
     <li>Click Save All</li>
     <li>Refresh the Text Editor\Create Correspondence UI so you can see the changes.</li>
    </ol> </td>
  </tr>
  <tr>
   <td>Update an existing special character's properties</td>
   <td>
    <ol>
     <li>Overlay the node to be updated as explained above and verify tags and classes.</li>
     <li>Change any values, such as caption, value, endValue, and multipleCaption. </li>
     <li>Click Save All. </li>
     <li>Refresh the Text Editor\Create Correspondence UI so you can see the changes.</li>
    </ol> </td>
  </tr>
  <tr>
   <td>Hide a special character</td>
   <td>
    <ol>
     <li>Overlay the node to be hidden under "/apps/fd/cm/ma/gui/configuration/textEditorConfig/specialcharacters"</li>
     <li>Add sling:hideResource (Boolean) property to the node (under apps) to be hidden. </li>
     <li>Click Save All. </li>
     <li>Refresh the Text Editor\Create Correspondence UI so you can see the changes.<br /> </li>
    </ol> </td>
  </tr>
  <tr>
   <td>Hide multiple special characters</td>
   <td>
    <ol>
     <li>Add the property "sling:hideChildren (String or String[])" to "/apps/fd/cm/ma/gui/configuration/textEditorConfig/specialcharacters". </li>
     <li>Add node names (special characters to be hidden) as values for the "sling:hideChildren" property. </li>
     <li>Click Save All. </li>
     <li>Refresh the Text Editor\Create Correspondence UI so you can see the changes.<br /> </li>
    </ol> </td>
  </tr>
  <tr>
   <td>Order special characters</td>
   <td>
    <ol>
     <li>Add a child node under "/apps/fd/cm/ma/gui/configuration/textEditorConfig/specialcharacters" with mandatory properties. </li>
     <li>Add the "sling:orderBefore (String)" property to the newly created child node. </li>
     <li>Add the node name as the value before which the newly added special character is to be shown. </li>
     <li>Click Save All. </li>
     <li>Refresh the Text Editor\Create Correspondence UI so you can see the changes.<br /> </li>
    </ol> </td>
  </tr>
 </tbody>
</table>
