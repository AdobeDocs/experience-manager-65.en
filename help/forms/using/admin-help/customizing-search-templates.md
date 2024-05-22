---
title: Customizing search templates

description: You can create search templates to be used in Workspace to search for instances of processes from the To Do and Tracking pages. You can also edit or delete existing search templates.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_workspace
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: bf69de86-2ca6-4d21-936c-07c1debacfa0
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Customizing search templates {#customizing-search-templates}

You can create search templates to be used in Workspace to search for instances of processes from the To Do and Tracking pages. You can also edit or delete existing search templates.

When creating or editing a search template, you can specify the layout and sort order of the search results. However, users can modify these settings in Workspace after the search results appear.

You can create as many search templates as required.

>[!NOTE]
>
>When saving a search template, you must give it a unique name. Otherwise, an existing template can be overwritten without a warning message.

## Create a simple search template {#create-a-simple-search-template}

1. In administration console, click Services &gt; Workspace &gt; Search Templates.
1. On the Identification tab, in the Search Template Description box, provide the purpose of the template.
1. (Optional) Click the Criteria tab and specify the search criteria for the template.
1. Click the Save tab, enter a unique name for the template, and then click Save.

## Create or edit a search template {#create-or-edit-a-search-template}

1. In administration console, click Services &gt; Workspace &gt; Search Templates.
1. (Optional) If you are editing an existing template or using an existing template as the basis for a new template, select the template from the Search Template Name list.
1. In the Search Template Description box, provide the purpose of the template.
1. (Optional) In the User Instructions box, provide any instructions that can help in using the template. These instructions are displayed in Workspace when a user selects the search template.
1. Click the Criteria tab. This is where you define one or more search criteria. To add a search criteria:

    * At the top of the Criteria tab, select a Process Element or Task Element.

      **Tip**: *If you previously selected the Process Name element and specified a process, any Process Variables defined in that process are also available for selection.*

      **Tip**: *If you select the Task Visible element, users will be able to remove completed tasks from the search results.*

      The search criteria fields for the selected element appear at the bottom of the Criteria tab.

    * For each Process Element, Task Element, and Process Variable that you select, fill in the corresponding search fields at the bottom of the Criteria tab:

        * Select a relational operator (such as "be equal to") from the list provided and specify the value of the operand in the box beside it.
        * (Optional) To enable users to change the operand value in Workspace, select Allow The User To Change The Operand.
        * (Optional) To enable users to change the relational operator, select Allow The User To Select Another Relational Operator. In the list that appears, select the operators that will be available to the user.

      **Tip**: *If you selected Process Name as the element, you can click the icon beside the operand field to display a list where you can select a process that is running on the Forms Server. After selecting a process, any process variables defined in that process are available for selection under Process Variables in the top section of the Criteria tab.*

      **Tip**: *You can delete an element from the search template by clicking the Delete icon beside the element’s search criteria.*

1. (Optional) For each column heading to display in the search results, click the Layout tab and perform the following steps:

    * Select a process or task element and click the right arrow to move it to the Columns To Report list.
    * In the Columns To Report list, select the process or task element and click the Up Arrow or Down Arrow to move it to its place in the column order. The column headings in the search results will appear in the order that they are listed here.
    * (Optional) To change the name of the element for the column heading, select the element from the Columns To Report list and provide the new name.

    >[!NOTE]
    >
    >The layout specified in the search template overrides the user’s preferences specified for column headings in Workspace.  

1. (Optional) For each column to sort in the search results, click the Sort tab and perform the following steps:

    * Select a process or task element and click the right arrow to move it to the Sort Order list.
    * In the Sort Order list, select the process or task element and click the Up Arrow or Down Arrow to move it to its place in the sort order. The columns in the search results will be sorted based on the order that they are listed here.
    * (Optional) To sort a column in descending order, select the check box next to the element name. If the check box is not selected, the column is sorted in ascending order.

1. Click the Save tab.
1. (Optional) If creating a search template, give it a unique name. If you do not specify a unique name, you could overwrite an existing template.
1. Click the Save button.

## Delete a search template {#delete-a-search-template}

1. On the Identification tab, select a name from the Search Template Name list.
1. Click Delete This Template and click OK.
