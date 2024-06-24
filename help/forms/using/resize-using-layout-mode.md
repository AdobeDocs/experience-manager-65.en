---
title: Use Layout mode to resize components for adaptive forms
description: Define the position of components using the responsive grid available in Layout mode 
feature: "Adaptive Forms,Foundation Components"
exl-id: 5cf76cb1-c92c-4aed-9945-37494fef2d29
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Use Layout mode to resize components {#use-layout-mode-to-resize-components}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/adaptive-forms-authoring/authoring-adaptive-forms-foundation-components/configure-layout-of-an-adaptive-form/resize-using-layout-mode.html?)                  |
| AEM 6.5     | This article         |


The adaptive form authoring interface enables you to resize components using the Layout mode. Drag-and-drop blue dots within columns to define the start and end points to position components. The blue dots display after tapping the component within the responsive grid. The responsive grid consists of 12 equal columns. The white and blue color shading in alternate columns differentiates one column from the other.

You can use the Layout mode to resize components for all device types such as desktop, tablet, phone, and other smaller devices. The tablet automatically derives the layout configuration from the desktop version and the smaller devices derive layout configuration from phone. However, you can override the automatically derived configurations to define a different configuration for each device type.

## Access Layout mode {#access-layout-mode}

Select **Layout** from the drop-down list that appears at the top of the adaptive form authoring interface next to the **Preview** option. The form displays in the Layout mode.

1. Log in to the AEM author instance and navigate to **Adobe Experience Manager** &gt; **Forms** &gt; **Forms & Documents**.
1. Create an [adaptive form](../../forms/using/creating-adaptive-form.md) or open an existing one.
1. Select **Layout** from the drop-down list that appears at the top next to the **Preview** option. The form displays in the Layout mode.

   ![Layout mode](assets/layout_mode_ic_new.png)

## Resize components {#resize-components}

1. In Layout mode, select the component to resize. The blue dots display at the start and end of the responsive grid.
1. Drag-and drop the blue dots to define the position of the component in the responsive grid.

   ![Resizing using Layout mode](assets/layout_mode_resize_new_updated1.png)

   The toolbar that displays after tapping components consists of the following options:

    * **[!UICONTROL Parent]**: Select the parent of a component.
    * **[!UICONTROL Revert breakpoint layout]**: Undo all resizing changes and apply default layout to the component.
    * **[!UICONTROL Float to new line]**: Shift the component to the next line if there are multiple components within the same line.

   You can also use the **[!UICONTROL Revert breakpoint layout]** ( ![Revert Breakpoint](assets/reverttopreviouslypublishedversion.png)) option at the panel-level to undo all resizing changes.

   >[!NOTE]
   >
   >You cannot resize table column, toolbar, toolbar button, and target area components using the Layout mode. Use Style mode to resize these components.

### Example {#example}

**Objective:** You want to insert a table component and an Image component and position them parallel to each other in an adaptive form.

1. Insert the table and image components using Edit mode in the adaptive form. The image component display after the table component.
1. Switch to Layout mode and select the Table component. The blue dots to resize the component display at column 1 and 12.
1. Drag-and-drop the blue dot at column 12 to column 6 of the responsive grid.

   ![Define the end point of the table](assets/layout_mode_end_point_table_new.png)

1. Similarly, select the Image component and drag-and-drop the blue dot at column 1 to column 7 of the responsive grid. The table and image components display parallel to each other.

   ![Table and the image in parallel in Layout mode](assets/table_image_parallel_new.png)

   You can select the Image component and select the **Float to new line** option available in the toolbar to shift the Image component to the next line.

## Resize panels {#resize-panels-layout-mode}

Execute the following steps if you want to resize the entire panel instead of individual components:

1. Select any of the components in the panel that you want to resize, select ![Select Parent](assets/select_parent_icon.svg), and select the first option in the drop-down list, if the panel is the immediate parent of the component.

   The blue dots display at the start and end of the responsive grid. 

1. Drag-and drop the blue dots to define the position of the panel in the responsive grid.
   You can repeat steps 1 and 2 and select ![Select Parent](assets/float_to_new_line_icon.svg) to shift the resized panel to the next line.

## Define multi-column layout for a panel

Execute the following steps to define the number of columns for a panel:

1. In **[!UICONTROL Edit]** mode, select the panel, select ![Configure](assets/configure_icon.png), and select **[!UICONTROL Responsive - everything on the page without navigation]** option from the **[!UICONTROL Panel Layout]** drop-down list.

1. Select ![Save](assets/save_icon.svg) to save the properties.

1. In the **[!UICONTROL Layout]** mode, select any of the components in the panel, select ![Select Parent](assets/select_parent_icon.svg), and select the panel.

1. Select ![multi-column](assets/multi-column.svg) and select the number of columns from the drop-down list. The number of columns can range from 1 to 12. The panel gets divided into a multi-column layout.

![multi column in layout mode](assets/multi-column-layout.png)

## Enable the new responsive grid for old responsive layouts {#enableresponsivegrid}

Enable the new responsive grid for forms that you create using AEM Forms 6.4 or lower version to resize components.

>[!NOTE]
>
>Switching to the new responsive grid discards the layout properties already defined for components used in the form.

Perform the following steps to enable the new responsive grid:

1. Select **Layout** from the drop-down list that appears at the top next to the **Preview** option. A confirmation to enable the Layout mode displays. 
1. Select **Yes** to enable the **Layout** mode for the form.

### Embed an old fragment in an adaptive form with new responsive layout {#embed-an-old-fragment-in-an-adaptive-form-with-new-responsive-layout}

The new responsive layout for adaptive form lets you add an adaptive form fragment with the old responsive layout to the form. However, the new layout discards the layout properties already defined for components used in the fragment. You can switch to the Layout mode to define the layout properties for components used in the fragment.

### Embed a fragment with new responsive layout in an old adaptive form {#embed-a-fragment-with-new-responsive-layout-in-an-old-adaptive-form}

If you embed a fragment with the new responsive layout in an adaptive form with an old responsive layout, the system prompts you to enable the Layout mode for the form and re-embed the fragment.

To enable the Layout mode, select **Layout** from the drop-down list that appears at the top next to the **Preview** option and select **Yes** to confirm. Select **Edit** mode to re-embed the fragment.

## Disable Layout mode for forms with old responsive layout {#disable-layout-mode-for-forms-with-old-responsive-layout}

You can disable the Layout mode for forms with old responsive layout by editing properties for the template used in the form.

Perform the following steps to disable the Layout mode:

1. Select **[!UICONTROL Tools]** > **[!UICONTROL General]** > **[!UICONTROL Templates]** and open the template used in the form in **[!UICONTROL Edit]** mode.
1. Select the Document Container in the left pane and select **[!UICONTROL Policy.]**

   ![Disable Layout mode](assets/policy_disable_layout_mode.png)

1. Select the **[!UICONTROL Layout Settings]** tab and select **[!UICONTROL Disable Layout Mode]**. 
1. Select ![Save changes](assets/save_icon.png) to save the template properties.
