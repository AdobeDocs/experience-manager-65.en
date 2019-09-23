---
title: Introduction to Interactive Communication authoring UI
seo-title: An introduction to the various user interface elements you can use to author Interactive Communication
description: An introduction to the various user interface elements you can use to author Interactive Communication
seo-description: An introduction to the various user interface elements you can use to author Interactive Communication
uuid: bbae97af-e92a-4438-9371-289442481c2e
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: interactive-communications
discoiquuid: c9219a80-1fb9-4885-b126-ca7453b60ed9
index: y
internal: n
snippet: y
---

# Introduction to Interactive Communication authoring UI{#introduction-to-interactive-communication-authoring-ui}

The user interface for authoring [Interactive Communication](/forms/using/interactive-communications-overview.md) is intuitive and provides the following for authoring print and web channel of the Interactive Communication:

* WYSIWYG drag-and-drop document editor
* Integrated repository for assets - the assets uploaded to and created on the server are available in the Asset browser of Interactive Communication authoring interface

When you [create a new or edit an existing Interactive Communication](../../forms/using/create-interactive-communication.md), you use the following user interface elements:

* [Sidebar](#sidebar)
* [Page toolbar](#page-toolbar)  

* [Component toolbar](#component-toolbar)
* Content Area

![interactive communication authoring user interface](assets/form-editor.png)

**A.** Sidebar **B.** Page toolbar **C.** Content area

## Sidebar {##sidebar}

[ ![Sidebar](assets/sidebar-comps-2.png)

Click to enlarge

](assets/sidebar-comps-3.png) **A.** Channel browser **B.** Content browser **C.** Properties browser **D.** Asset browser **E.** Components browser **F.** Data Sources browser - Data Model **G.** Data Sources browser - Master Content

The sidebar includes the following:

* **Channel browser  
  **

The Channel browser helps you switch between the print and web channels of the Interactive Communication. Based on the channel you have selected in the channel browser, the browsers, such as Content and Components display the options.

* **Content** **browser** 
  In the content browser, you can see object hierarchy of the document for the selected channel. Author can navigate to specific component by tapping that element in Document Object Tree. Author can search objects in the web channel and rearrange them from this tree.

* **Properties browser  
  **Lets you edit the properties of a component. Properties change according to the component. For example, to see properties of the document container:  
  Select a component, then tap ![](assets/field-level.png) &gt; **Document Container**, and then tap ![](assets/cmppr.png).

* **Assets** **browser** 
  Segregates different types of content such as layout fragments, images, documents, pages, videos. Author can drag-and-drop assets into the Interactive Communication. 

* **Components browser** 
  Includes components that you can use to build the print and web channels of a document. You can drag components to the Interactive Communication to add elements, and configure added element as per the requirements. The following table describes the components listed in Components browser for print and web channels**:**

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2018-01-22T06:28:30.091-0500
add layout fragments in "Assets browser"
-->

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2018-02-14T11:39:02.181-0500
Check the details of the content browser - add information about how it can be used to add attachments verify the present info
-->

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2018-03-22T07:23:21.492-0400
three available components > three components available in the components browser DONE seven possible components > seven components in the components browser
-->

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-03-12T06:04:27.585-0400
Shows object hierarchy of the document for the selected channel Could not find Form Objects and Data Model Objects in content rowser UI
-->

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-03-12T06:08:04.744-0400
To see properties of the interactive document container: Select a component, then tap > Interactive Communication Container, and then tap ....... Is incorrect ... Kindly revisit
-->

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-03-12T06:41:45.768-0400
Does it contains assets available only in DAM?
-->

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2018-03-17T16:23:02.647-0400
Data Model Objects Lets you see the form data model hierarchy. It allows you to drag-and-drop elements in the Web channel. The added elements automatically get converted into document components while retaining their original properties.
-->

| **Component** |**Print Channel** |**Web Channel** |**Functionality** |
|---|---|---|---|
| Chart |✓ |✓ |Adds a chart that you can use in an Interactive Communication for visual representation of two-dimensional data retrieved from an form data model collection item. |
| Document Fragment |✓ |✓ |Allows you to add a reusable component, text, list, or condition, to an Interactive Communication. The reusable component you add to an Interactive Communication could be either form data model-based or without a form data model. |
| Image |✓ |✓ |Allows you to insert an image. |
| Panel |-  |✓ |The Panel component is a placeholder for grouping other components together and controls how a group of components are laid out in an Interactive Communication. A panel component also allows you to make a group of components repeatable for the end user, such as in multiple entries required for filling in educational credentials. It is also a good practice to use a panel each for a tab of an Interactive Communication with multiple tabs. |
| Table  |&#42; |✓ |Adds a table that lets you organize data in rows and columns.  |
| Target Area |&#42;&#42; |✓ |Inserts a target area in a web channel to organize the web-channel-specific components. |
| Text  |- |✓ |Adds text to the web channel of an Interactive Communication. Text can make use of form data model objects to make the content dynamic. |

&#42; Use Layout Fragments in the Print channel to add tables.

&#42;&#42; In the Print channel, target areas are predefined in the XDP/print template. You cannot add new target areas using the Interactive Communication authoring UI.

* **Data Sources Browser** 
  Data Sources Browser displays the available data sources in the form data model you selected while creating the Interactive Communication.

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-03-12T06:49:37.630-0400
Use entities and properties
-->

#### Key points for working with components {#key-points-for-working-with-components}

Key points when working with interactive communication components are as follows:

* Each component has associated properties that control its appearance and functionality. To configure the properties of a component, tap the component and tap ![](assets/cmppr.png) to open the component properties in the Properties browser.
* A component is identified with its element name. When you tap ![](assets/cmppr.png), you can change the name of the component by changing the Element Name field value in the properties browser. The Element Name field accepts letters, numbers, hyphens (-), and underscores (_) only. Other special characters are not allowed, and element name should begin with a letter. 
* You can modify the Title property of an Interactive Communication component inline in the editor without opening the Properties browser as long as the title is visible on the Interactive Communication. To do so:

    1. Tap to select a component that has a Title property and whose Hide title property is disabled.  
    1. Tap ![](assets/aem_6_3_edit.png) to make the title editable.  
    
    1. Modify the title and tap the Return key or tap anywhere outside the component to save the changes. Tap the Esc key to discard the changes.

## Component toolbar {#component-toolbar}

![Component toolbar labels](do-not-localize/component_toolbar_labels_new.png)

When you select a component, you see a toolbar that lets you work with it. You get options to cut, paste, move, and specify properties of the components. Your options are:

A.** Configure**: When you tap **Configure**, component properties are visible in the sidebar.

B.** Edit Rules**: When you tap Edit Rules, Rule Editor appears in which you can edit and create rules for the selected component. In Rule Editor, you can also select other form objects (components) and edit/create rules for those form objects.

C.** Copy**: You can use the copy option to copy a component and paste it in other places in the Interactive Communication.

D.** Cut**: You can use the cut option to move a component from one place to another in the Interactive Communication.

E. **Delete**: Lets you delete the component from the Interactive Communication.

F. **Insert Component**: Lets you insert a component above the selected component.

G. **Paste**: Lets you paste the component you cut or copied using the options described above.

H. **Group**: Lets you select multiple components if you want to cut, copy, or paste more than one component together.

I. **Parent**: Lets you select the parent of a component.

J. **View SOM Expression: **Lets you view the [SOM expression](../../forms/using/using-som-expressions-adaptive-forms.md) for the component.

K: **Group objects in Panel: **Lets you group the components in a panel to be able to perform operations on those components simultaneously. For details, see [Group objects in Panel](../../forms/using/create-interactive-communication.md#main-pars-header-1815149576).

L. **Add Child Panel **(for panels only)**: **Lets you add a child panel to the panel.

M: **Add Panel Toolbar **(for panels only)**: **Lets you add the Toolbar for Panel component. You can then perform further actions on the toolbar.

In addition, the **Replace** option on the toolbar lets you replace the existing component with an alternate component. The option is not available for the Panel component.

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-03-12T07:34:06.600-0400
What are panels and fragements?
-->

## Page toolbar {#page-toolbar}

The Page toolbar on the top provides options that let you preview the Interactive Communication and change its properties. You can preview the Interactive Communication when you author it, and make changes accordingly. In the page toolbar, you see:

* Toggle Side Panel ![](assets/toggle-side-panel.png): Lets you show or hide Sidebar.
* Page information ![](assets/pageinformationad.png): Lets you view page properties.
* Emulator ![](assets/ruler.png): Lets you emulate the look of your Interactive Communication for different display sizes such as tablets and phones.
* Edit: Lets you select other modes such as: Edit, Style, Developer, and Design.

    * Edit: Lets you edit the properties of the Interactive Communication and its components. For example, adding a component, dropping an image, and specifying mandatory fields. 
    * Style: Lets you style the appearance of components of your Interactive Communication. For example, in style mode, you can select a panel and specify its background color.
    * Developer: Lets a developer to:

        * Discover what Interactive Communication is composed of.
        * Debug what is happening where and when, which in turn helps to resolve issues.

    * Target: Lets you enable or disable custom components, or out-of-the-box components that are not listed in the Sidebar.

* Preview: Lets you preview how the Interactive Communication looks when you publish it.

<!--
Comment Type: draft

<draft-comment>
<related-links>
<a href="../../forms/using/creating-adaptive-form.md" target="_blank">Creating an adaptive form</a>
<a href="/forms/using/creating-forms-repeatable-sections.md" target="_blank">Creating forms with repeatable sections</a>
<a href="../../forms/using/authoring-in-field-help.md" target="_blank">Authoring in-context help for form fields</a>
<a href="../../forms/using/synchronizing-adaptive-forms-xfa.md" target="_blank">Synchronizing adaptive forms with XFA form templates</a>
<a href="../../forms/using/introduction-form-sequence.md" target="_blank">Introduction to multi-step form sequence</a>
<a href="../../forms/using/creating-accessible-adaptive-forms.md" target="_blank">Creating accessible adaptive forms</a>
<a href="/forms/using/localizing-adaptive-forms.md" target="_blank">Localizing adaptive forms</a>
<a href="../../forms/using/configuring-redirect-page.md" target="_blank">Configuring redirect page</a>
<a href="../../forms/using/configuring-submit-actions.md" target="_blank">Configuring the submit action</a>
<a href="/forms/using/enabling-eSign-your-adaptive-forms.md" target="_blank">Enabling eSign signatures in adaptive forms</a>
<a href="../../forms/using/layout-capabilities-adaptive-forms.md" target="_blank">Layout capabilities of adaptive forms</a>
<a href="../../forms/using/custom-adaptive-forms-templates.md" target="_blank">Creating a custom adaptive form template</a>
</related-links>
</draft-comment>
-->

