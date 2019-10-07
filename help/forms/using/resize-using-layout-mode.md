---
title: Use Layout mode to resize components
seo-title: Use Layout mode to resize components
description: Define the position of components using the responsive grid available in Layout mode 
seo-description: Define the position of components using the responsive grid available in Layout mode 
uuid: 6b077ebe-caea-4ae3-b17a-be2dca94eeb3
contentOwner: anujkapo
topic-tags: interactive-communications
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
discoiquuid: 9e9aaf36-bb86-4954-83cc-fa6b3e80ae4b
docset: aem65

---

# Use Layout mode to resize components{#use-layout-mode-to-resize-components}

The adaptive form and Interactive Communication Web channel authoring interface enables you to resize components using the Layout mode. Drag-and-drop blue dots within columns to define the start and end points to position components. The blue dots display after tapping the component within the responsive grid. The responsive grid consists of 12 equal columns. The white and blue color shading in alternate columns differentiates one column from the other.

You can use the Layout mode to resize components for all device types such as desktop, tablet, phone, and other smaller devices. The tablet automatically derives the layout configuration from the desktop version and the smaller devices derive layout configuration from phone. However, you can override the automatically derived configurations to define a different configuration for each device type.

If you are creating the Web channel using [Print channel as master](../../forms/using/create-interactive-communication.md) for an Interactive Communication, the components available for resizing also include the sub-forms and fields that are auto-generated in Web channel using Print channel. The Web channel retains the layout for the Print channel elements in Layout mode.

## Access Layout mode {#access-layout-mode}

Select **Layout** from the drop-down list that appears at the top of the adaptive form and Interactive Communication authoring interface next to the **Preview** option. The form displays in the Layout mode.

1. Log in to the AEM author instance and navigate to **Adobe Experience Manager** &gt; **Forms** &gt; **Forms & Documents**.
1. [Create a new](../../forms/using/create-interactive-communication.md) or open an existing adaptive form or an Interactive Communication.
1. Select **Layout** from the drop-down list that appears at the top next to the **Preview** option. The form displays in the Layout mode.

   ![Layout mode for Interactive Communications](assets/layout_mode_ic_new.png)

## Resize components {#resize-components}

1. In Layout mode, tap the component to resize. The blue dots display at the start and end of the responsive grid.
1. Drag-and drop the blue dots to define the position of the component in the responsive grid.

   ![Resizing using Layout mode](assets/layout_mode_resize_new_updated.png)

   The toolbar that displays after tapping components consists of the following options:

    * **Parent:** Select the parent of a component.
    * **Float to new line:** Shift the component to the next line if there are multiple components within the same line.

   You can undo all resizing changes and apply default layout to the panel containing resized components using the **[!UICONTROL Revert breakpoint layout]** ( ![screen_shot_2018-03-23at091013](https://helpx.adobe.com/content/dam/help/en/experience-manager/6-4/sites/authoring/using/responsive-layout/_jcr_content/main-pars/procedure_1/proc_par/step_3/step_par/image_d278/screen_shot_2018-03-23at091013.png)) option. Tap the parent of the resized component to view the option.

   >[!NOTE]
   >
   >You cannot resize table column, toolbar, toolbar button, and target area components using the Layout mode. Use Style mode to resize these components.

### Example {#example}

**Objective: **You want to insert a table component and an Image component and position them parallel to each other in an Interactive Communication.

1. Insert the table and image components using Edit mode in the web channel. The image component display after the table component.
1. Switch to Layout mode and tap the Table component. The blue dots to resize the component display at column 1 and 12.
1. Drag-and-drop the blue dot at column 12 to column 6 of the responsive grid.

   ![Define the end point of the table](assets/layout_mode_end_point_table_new.png)

1. Similarly, select the Image component and drag-and-drop the blue dot at column 1 to column 7 of the responsive grid. The table and image components display parallel to each other.

   ![Table and the image in parallel in Layout mode](assets/table_image_parallel_new.png)

   You can select the Image component and tap the **Float to new line** option available in the toolbar to shift the Image component to the next line.

## Enable the new responsive grid for old responsive layouts {#enableresponsivegrid}

Enable the new responsive grid for forms that you create using AEM Forms 6.4 or lower version to resize components.

>[!NOTE]
>
>Switching to the new responsive grid discards the layout properties already defined for components used in the form.

Perform the following steps to enable the new responsive grid:

1. Select **Layout** from the drop-down list that appears at the top next to the **Preview** option. A confirmation to enable the Layout mode displays. 
1. Tap **Yes **to enable the **Layout** mode for the form.

### Embed an old fragment in an adaptive form with new responsive layout {#embed-an-old-fragment-in-an-adaptive-form-with-new-responsive-layout}

The new responsive layout for adaptive form allows you to add an adaptive form fragment with the old responsive layout to the form. However, the new layout discards the layout properties already defined for components used in the fragment. You can switch to the Layout mode to define the layout properties for components used in the fragment.

### Embed a fragment with new responsive layout in an old adaptive form {#embed-a-fragment-with-new-responsive-layout-in-an-old-adaptive-form}

If you embed a fragment with the new responsive layout in an adaptive form with an old responsive layout, the system prompts you to enable the Layout mode for the form and re-embed the fragment.

To enable the Layout mode, select **Layout** from the drop-down list that appears at the top next to the **Preview** option and tap **Yes** to confirm. Select **Edit** mode to re-embed the fragment.

## Disable Layout mode for forms with old responsive layout {#disable-layout-mode-for-forms-with-old-responsive-layout}

You can disable the Layout mode for forms with old responsive layout by editing properties for the template used in the form.

Perform the following steps to disable the Layout mode:

1. Select **[!UICONTROL Tools]** > **[!UICONTROL General]**> **[!UICONTROL Templates]**and open the template used in the form in **[!UICONTROL **Edit**]**mode.
1. Select the Document Container in the left pane and tap **[!UICONTROL Policy.]**

   ![Disable Layout mode](assets/policy_disable_layout_mode.png)

1. Tap the **[!UICONTROL Layout Settings]** tab and select **[!UICONTROL Disable Layout Mode]**. 
1. Tap ![](https://chl-author-preview.corp.adobe.com/content/dam/help/en/experience-manager/6-4/forms/using/chart-component/Done_Icon.png) to save the template properties.

