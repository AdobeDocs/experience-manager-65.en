---
title: DO NOT PUBLISH Conditions
seo-title: Conditions
description: Document Fragments, such as Text, lists, conditions, and layout fragments, in Correspondence Management let you form the static, dynamic, and repeatable components of customer correspondence.
seo-description: Document Fragments, such as Text, lists, conditions, and layout fragments, in Correspondence Management let you form the static, dynamic, and repeatable components of customer correspondence.
page-status-flag: never-activated
uuid: 2b55e70f-04f0-4b08-810b-6a13e31a9b15
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: b5c2f6bf-d8a3-4fbd-bcf6-04ab4994379a
---

# DO NOT PUBLISH Conditions {#do-not-publish-conditions}

## Conditions {#conditions}

Conditions enable you to define what content gets included at correspondence/ letter creation time, based on the supplied data. The condition is described in terms of control variables. When you add a condition, you can choose to include an asset based on the value that the control variable has.

Based on the options you choose, either only the first expression that is found to be true, based on current condition variable is evaluated or all the condition. When filling the letter in Create Correspondence (CCR), conditions behave as "white boxes". If a condition results in a list, all the list's mandatory and pre-selected items are output. If any of those items are conditions or lists themselves, their resulting content is output as well, in top-down, depth-first order as a flat list of text and image content. Condition results can be of any type (text, list, condition, or image).

### Implementing conditions {#implementing-conditions}

The Condition Editor comes with an [Expression Builder](/help/forms/using/expression-builder.md) user interface that supports creating expressions using both multiple placeholders and Data Dictionary elements. You can use common operands and local / global functions in such expressions. Each expression can be associated with some content and optionally there could be a default section if none of the expressions evaluates to true. All expressions are evaluated in the sequence in which they are defined and the first expressions returning true is selected and its associated content is returned by that conditional module.

For example, if the terms and conditions text in a letter differs depending which state the customer is in, and the data dictionary contains an element called “state”, then you could add the condition as follows:  
• state = NY, select T&C_NY text paragraph  
• state = NC, select T&C_NC text paragraph

The Condition editor enables you to specify a default condition. If the value of the control variables does not match any of the conditions, then the content associated with the default condition is used. Following the previous example, you could add this condition row:  
• Default, select T&C_Rest

### Create a condition {#create-a-condition}

1. Select **Forms** &gt; **Document Fragments**.
1. Select **Create &gt; Condition**.
1. Specify the following information for the list:

    * **Title (Optional):** Enter the title for the condition. Title needs not be unique and can have special characters and non-english characters. Conditions are referred by their titles (when available) such as in thumbnails and asset properties. 
    * **Name:** The unique name for the condition. No two assets (text, condition, or list) in any state can exist with the same name. In the Name field, you can enter only English language characters, numbers, and hyphens. The Name field is automatically populated based on the Title field. The special characters, spaces, numbers, and non-English characters entered in the Title field are replaced with hyphens in the Name field. Although the value in the Title field is automatically copied to the Name, you can edit the value.
    * **Description (Optional)** Type a description of the condition.
    * **Data Dictionary (Optional)**: Optionally, select the data dictionary to which to connect. Only assets that use the same data dictionary as the condition, or assets that have no data dictionary assigned, can be added to the list. Assigning a data dictionary to a list makes it easier for the person creating a letter template to find the appropriate condition.
    * **Tags (Optional)**: Optionally, select the tags to apply. You can also type in a new tag’s name and create it. (The new tag is created when you tap **Save**.)

1. Tap **Next**.
1. Tap **Add Asset**.
1. To add an asset to the Condition, select it in the Select Assets page and tap **Done**. The assets are added to the Expression pane.
1. You can select the following options to specify how the condition behaves at runtime:

    * **Disable Multiple Results Evaluation\Enable Multiple Results Evaluation**: When this option is enabled (appears as “Enable Multiple…”), all the conditions are evaluated and the result is the sum of all the true conditions. If this option is disabled (appears as "Disable Multiple...") then only the first condition that is found to be true is evaluated and becomes the output of the condition.
    * **Page Break**: Select this option ( ![break](assets/break.png)) to add a page break between the modules of the conditions. When this option is not selected ( ![nobreak](assets/nobreak.png)), if a condition is overflowing to the next page, the whole condition is shifted to the next page instead of breaking in the page between the condition.

1. To change the order of the assets within the condition, tap and hold the arrows icon ( ![dragndrop](assets/dragndrop.png) ) and drag-and-drop. When the user opens a letter template in the Create Correspondence user interface, the content is assembled in the order you defined here.
1. Tap **Delete** to delete the row. If you tap Delete for the default row, only clears the asset information.
1. Tap **Copy** to duplicate a row.
1. Tap **Edit** to change the asset or edit the expression.

   Further:

    * To update the asset, tap the folder icon under Asset column.
    * To open the Expression Builder to insert an expression, tap the folder icon under the Expression column. For more information on Expression Builder, see [Expression Builder](/help/forms/using/expression-builder.md).

### Best practices/tips and tricks {#best-practices-tips-and-tricks}

* Use a consistent naming convention for easy search and to avoid duplication. 
* Conditions behave like case statements, so order of condition is important. The first match is returned.
* Use appropriate data dictionary binding
* The following rules apply when using the Condition Editor to edit a condition:

    * **Addition of variable:** Allowed
    * **Removal of variable:** Allowed
    * **Update of properties:** Allowed
    * **Change of data dictionary:** Allowed until data dictionary element is not used.

