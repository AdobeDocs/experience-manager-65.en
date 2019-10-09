---
title: Prepare and send Interactive Communication using the Agent UI
seo-title: Prepare and send Interactive Communication using the Agent UI
description: The Agent UI allows the agents to prepare and send Interactive Communication to the post process. The Agent makes the required modifications as allowed, and submits the Interactive Communication to a post process, such as email or print. 
seo-description: Prepare and send Interactive Communication using the Agent UI
uuid: d1a19b83-f630-4648-9ad2-a22374e31aa9
topic-tags: interactive-communications
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 110c86ea-9bd8-4018-bfcc-ca33e6b3f3ba
---

# Prepare and send Interactive Communication using the Agent UI {#prepare-and-send-interactive-communication-using-the-agent-ui}

The Agent UI allows the agents to prepare and send Interactive Communication to the post process. The Agent makes the required modifications as allowed, and submits the Interactive Communication to a post process, such as email or print.

## Overview {#overview}

After an Interactive Communication is created, the Agent can open the Interactive Communication in the Agent UI and prepare a recipient-specific copy by entering data and managing content and attachments. Finally, the Agent can submit the Interactive Communication to a post process.

While preparing the Interactive Communication using the Agent UI, the agent manages the following aspects of the Interactive Communication in the Agent UI before submitting it to a post process:

* **Data**: The Data tab of the Agent UI displays any agent-editable variables and unlocked form data model properties in the Interactive Communication. These variables/properties are created while editing or creating document fragments included in the Interactive Communication. The Data tab also includes any fields that are built in the XDP/print channel template. The Data tab appears only when there are any variables, form data model properties, or fields in the Interactive Communication that are editable by the agent. 
* **Content**: In the Content tab, the Agent manages the content such as document fragments and content variables in the Interactive Communication. The Agent can make the changes in the document fragment as allowed while creating the Interactive Communication in the properties of those document fragments. The Agent can also reorder, add/remove a document fragment, and add page breaks, if allowed. 
* **Attachments**: The Attachments tab appears in the Agent UI only if the Interactive Communication has any attachments or the Agent has library access. The agent may or may not be allowed to change or edit the attachments.

## Prepare Interactive Communication using the Agent UI {#prepare-interactive-communication-using-the-agent-ui}

1. Select **[!UICONTROL Forms]** > **[!UICONTROL Forms & Documents]**. 
1. Select the appropriate Interactive Communication and tap **[!UICONTROL Open Agent UI]**.

   >[!NOTE]
   >
   >Agent UI works only if the selected Interactive Communication has a print channel.

   ![openagentiui](assets/openagentiui.png)

   Based on the Interactive Communication's content and properties, the agent UI appears with the following three tabs: Data, Content, and Attachment. 

   ![agentuitabs](assets/agentuitabs.png)

   Proceed to entering data, managing the content, and managing the attachments.

### Enter Data {#enter-data}

1. In the Data tab, enter the data for variables, form data model properties, and print template (XDP) fields, as required. Fill up all the mandatory fields marked with an asterisk (&ast;) to enable the **Submit** button.

   Tap a data field value in the Interactive Communication preview to highlight the corresponding data field in the Data tab or vice versa.

### Manage Content {#manage-content}

In the Content tab, manage the content such as document fragments and content variables in the Interactive Communication.

1. Select **[!UICONTROL Content]**. The content tab of the Interactive Communication appears.

   ![agentuicontenttab](assets/agentuicontenttab.png)

1. Edit the document fragments, as required, in the Content tab. To bring focus to the relevant fragment in the content hierarchy, you can either tap the relevant line or paragraph in the Interactive Communication preview or tap the fragment directly in the Content hierarchy.

   For example, the document fragment with the line "Make a payment online now ... " is selected in the preview in the below graphic and the same document fragment has got selected in the Content tab. 

   ![contentmodulefocus](assets/contentmodulefocus.png)

   In the Content or Data tab, by tapping Highlight Selected Modules In Content ( ![highlightselectedmodulesincontentccr](assets/highlightselectedmodulesincontentccr.png)) on upper left of the preview, you can disable or enable functionality to go to the document fragment when the relevant text, paragraph, or data field is tapped/selected in the preview.

   The fragments that are allowed to be edited by the agent while creating the Interactive Communication have the Edit Selected Content ( ![iconeditselectedcontent](assets/iconeditselectedcontent.png)) icon. Tap the Edit Selected Content icon to launch the fragment in edit mode and make changes in it. Use the following options for formatting and managing text:

    * [Formatting options](#formattingtext)

        * [Copy paste formatted text from other applications](#pasteformattedtext)
        * [Highlight parts of text](#highlightemphasize)

    * [Special characters](#specialcharacters)
    * [Keyboard shortcuts](/help/forms/using/keyboard-shortcuts.md)

   For more information on the actions available for various document fragments in the Agent user interface, see [Actions and info available in the Agent user interface](#actionsagentui).

1. To add a page break to the print output of the Interactive Communication, place the cursor where you want to insert a page break and select Page Break Before or Page Break After ( ![pagebreakbeforeafter](assets/pagebreakbeforeafter.png)).

   An explicit page break placeholder gets inserted in the Interactive Communication. To view how an explicit page break affects the Interactive Communication, see the print preview. 

   ![explicitpagebreak](assets/explicitpagebreak.png)

   Proceed to managing the attachments of the Interactive Communication.

### Manage Attachments {#manage-attachments}

1. Select **[!UICONTROL Attachment]**. The Agent UI displays the available attachments as set up while creating the Interactive Communication.

   You can choose not to submit an attachment along with the Interactive Communication by tapping the view icon and you can tap the cross in the attachment to delete it (if the agent is allowed to delete or hide the attachment) from the Interactive Communication. For the attachments specified as mandatory while creating the Interactive Communication, the View and Delete icons are disabled. 

   ![attachmentsagentui](assets/attachmentsagentui.png)

1. Tap the Library Access ( ![libraryaccess](assets/libraryaccess.png)) icon to access Content Library to insert DAM assets as attachments.

   >[!NOTE]
   >
   >Library Access icon is available only if library access was enabled while creating the Interactive Communication (in the Document Container properties of the Print channel).

1. If the order of the attachments was not locked while creating the Interactive Communication, you can reorder the attachments by selecting an attachment and tapping the down and up arrows. 
1. Use Web Preview and Print Preview to see if the two outputs are as per your requirement.

   If you find the previews to be satisfactory, tap **[!UICONTROL Submit]** to submit/send the Interactive Communication to a post process. Or to make changes, exit the preview to go back to the making changes.

## Formatting text {#formattingtext}

While editing a text fragment in the agent UI, the toolbar changes depending on the type of edits you choose to make: Font, Paragraph, or List:

![typeofformattingtoolbar](assets/typeofformattingtoolbar.png) ![Font toolbar](do-not-localize/fonttoolbar.png)

Font toolbar

![Paragraph toolbar](do-not-localize/paragraphtoolbar.png)

Paragraph toolbar

![List toolbar](do-not-localize/listtoolbar.png)

List toolbar

### Highlight/Emphasize parts of text {#highlightemphasize}

To highlight\emphasize parts of text in an editable fragment, select the text and tap Highlight Color.

![highlighttextagentui](assets/highlighttextagentui.png) 

### Paste formatted text {#pasteformattedtext}

![pastedtext](assets/pastedtext.png) 

### Insert special characters in text {#specialcharacters}

The Agent UI has built in support for 210 special characters. The admin can [add support for more/custom special characters by customization](/help/forms/using/custom-special-characters.md).

#### Attachment delivery {#attachmentdelivery}

* When the Interactive Communication is rendered using Server-side APIs as an interactive or non-interactive PDF, the rendered PDF contains attachments as PDF attachments.
* When a post process associated with an Interactive Communication is loaded as part of the Submit using Agent UI, attachments are passed as the List&lt;com.adobe.idp.Document&gt; inAttachmentDocs parameter.
* Delivery mechanism workflows, such as email and print, also deliver attachments along with the PDF version of the Interactive Communication.

## Actions and info available in the Agent user interface {#actionsagentui}

### Document fragments {#document-fragments}

![](do-not-localize/contentoptionsdocfragments.png)

* **Up/Down arrows**: Arrows to move document fragments up or down in the Interactive Communication.
* **Delete**: If allowed, delete the document fragment from the Interactive Communication. 
* **Page Break Before** (applicable for child fragments of target area): Inserts page break before the document fragment.
* **Indent**: Increase or decrease indent of a document fragment. 
* **Page Break After **(applicable for child fragments of target area): Inserts page break after the document fragment.

![docfragoptions](assets/docfragoptions.png)

* Edit (text fragments only): Open rich text editor for editing the text document fragment. For more information, see [Formatting text](#formattingtext).  

* Selection (eye icon): Includes\excludes document fragment from the Interactive Communication.
* Unfilled Values (info): Indicates the number of unfilled variables in the document fragment.

### List document fragments {#list-document-fragments}

![listoptions](assets/listoptions.png)

* Insert Blank Line: Inserts new blank line.
* Selection (eye icon): Includes\excludes document fragment from the Interactive Communication.  
* Skip Bullets/Numberings: Enable to skip bullets/numbering in the list document fragment.
* Unfilled Values (info): Indicates the number of unfilled variables in the document fragment.

