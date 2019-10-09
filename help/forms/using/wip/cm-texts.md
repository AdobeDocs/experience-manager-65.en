---
title: DO NOT PUBLISH Text
seo-title: Text
description: Document Fragments, such as Text, lists, conditions, and layout fragments, in Correspondence Management let you form the static, dynamic, and repeatable components of customer correspondence.
seo-description: Document Fragments, such as Text, lists, conditions, and layout fragments, in Correspondence Management let you form the static, dynamic, and repeatable components of customer correspondence.
page-status-flag: never-activated
uuid: 5bc45fa6-5428-4e0f-8a58-e1fa125ab581
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 372cf182-9fcd-4963-84e1-9a6f95583bd1
---

# DO NOT PUBLISH Text {#do-not-publish-text}

A text asset is a piece of content that consists of one or more paragraphs of text. A paragraph can be static or dynamic. A dynamic paragraph contains references to data elements, whose values are supplied at runtime. For example, the customer name in a letter salutation could be a dynamic data element, with its value made available at runtime. By changing these values, the same letter template can be used to generate letters for different customers.

The Correspondence Management Solution supports two kinds to dynamic data items (variable data):

* **Data dictionary elements**: These elements are bound to the data dictionary and get their values from the supplied data source. A data dictionary variable can be protected or unprotected. During correspondence creation, the user can modify the default value of unprotected data dictionary variables, but cannot modify protected ones.
* **Placeholders**: These are variables that are not bound to a back end data source. They require the user to fill in a value during correspondence creation. The placeholders are unprotected by default.

>[!NOTE]
>
>The Correspondence Management templates do not force you to create unique names when creating placeholders. If you create two placeholders with the same name, such as a text and a condition, and use them both in a letter template, the values of the placeholder last inserted is used for both placeholders. If two placeholders have the same name, their types are compared. If the types are different, then their type becomes String. Within a module, however, you cannot create multiple placeholders with the same name.

## Create text {#create-text}

1. Select **Forms** &gt;  **Document Fragments**.  

1. Tap **Create** &gt; **Text**. Or select a text asset and tap **Edit**.
1. Specify the following information for the text:

    * **Title: (Optional)** Enter the title for the text asset. Titles need not be unique and can have special characters and non-english characters. Texts are referred by their titles (when available) such as in thumbnails and asset properties. 
    * **Name:** The unique name for the text asset. No two assets (text, condition, or list) in any state can exist with the same name. In the Name field, you can enter only English language characters, numbers, and hyphens. The Name field is automatically populated based on the Title field. The special characters, spaces, numbers, and non-English characters entered in the Title field are replaced with hyphens in the Name field. Although the value in the Title field is automatically copied to the Name, you can edit the value.  
    
    * **Description**: Type a description of the asset.
    * **Data Dictionary**: Optionally, select the data dictionary in which to map. This attribute enables you to add references to data dictionary elements in the text asset.
    * **Tags**: Optionally, to create custom tag enter value in text field and press Enter. You can see your tag below text field of tags. When you save this text, the newly added tags also get created.

1. Tap **Next**. Correspondence Management displays the Editor page where you can add text paragraphs and data elements to the text.

   The default spellchecker in your browser checks spelling in the Text editor. To manage the spelling and grammar checking, you can edit your browser's spellchecker settings or install browser plugins/addons to check spelling and grammar.

   You can also use the various keyboard shortcuts in the text editor to manage, edit, and format text. For more information on [Text Editor](/help/forms/using/keyboard-shortcuts.md#p-formatting-p) keyboard shortcuts in Correspondence Management Keyboard Shortcuts. 

1. A text editor opens, enter the text. Use the toolbar at the top of the page to format the text, insert conditions, link, and page breaks.  

    [ ![Toolbar](assets/advancedediting.png)

   (Click to open full-sized image)

   ](assets/advancedediting-1.png)

    * **Link**: Insert hypertext link in the text.
    * **Repeat**: Repeat prints collection element in Data Dictionary using a delimiter. 
    * **Condition**: Tap to insert a condition. Insert text based on condition. If condition is true, then text is visible in letter, otherwise not.
    * **Add Description**: Add annotation to a piece of text. This is metadata visible to the Author but not a part of the letter that is created.
    * **Page Break**: If you set the page break attribute of a text module to false, the text module does not break across pages.

   A text editor opens. Enter the text. The toolbar changes depending on the type of edits you choose to make: Paragraph, Alignment, or Listing:

   ![Select type of toolbar](assets/toolbarselection.png)

   Select type of toolbar: Paragraph, Alignment, or Listing

   ![Paragraph toolbar](assets/fonteditingtoolbar.png)

   Paragraph toolbar
  ![Alignment toolbar](assets/paragrapheditingtoolbar.png)Alignment toolbar

   ![Listing toolbar](assets/bulleteditingtoolbar.png)

   Listing toolbar (Click to open full-sized image)

1. To reuse one of more paragraphs of text that exist in another application, such as from MS Word or HTML pages, copy and paste the text into the text editor. The formatting of the copied text is retained in the text editor.

   You can copy and paste one or more paragraphs of text in an editable text module. For example, you may have an MS Word document with a bulleted list of acceptable proofs of residence such a following:

   ![pastetextmsword](assets/pastetextmsword.png)

   You can directly copy and paste the text from the MS Word document to an editable text module. The formatting such as bulleted list, font, and text color is retained in the text module.

   ![pastetexttextmodule](assets/pastetexttextmodule.png)

   >[!NOTE]
   >
   >The formatting of pasted text, however, has some [limitations](https://helpx.adobe.com/aem-forms/kb/cm-copy-paste-text-limitations.html).

1. If required, insert special characters in the document fragment. For example, you can use the Special Characters palette to insert:

    * Currency symbols such as €,￥, and £
    * Mathematical symbols such as ∑, √, ∂, and ^
    * Punctuation symbols such as ‟ and ”

   ![specialcharacters](assets/specialcharacters.png)

   Correspondence Management has built in support for 210 special characters. The admin can [add support for more/custom special characters by customization](/help/forms/using/custom-special-characters.md). 

1. To highlight\emphasize parts of text in an editable inline module, select the text and tap Highlight Color.

   ![textbackgroundcolorapplied](assets/textbackgroundcolorapplied.png)

   You can either directly tap a basic color **[A]** present in the Basic Colors palette or tap **Select** after using the slider **[B]** to choose the appropriate shade of the color.

   Optionally, you can also go to the Advanced tab to select the appropriate Hue, Lightness, and Saturation **[C]** to create the precise color and then tap Select **[D]** to apply the color to highlight the text. 

   ![textbackgroundcolor](assets/textbackgroundcolor.png)

1. From the data panel, drag-and-drop data dictionary elements and placeholder elements to the text.

   To:

    * Add a data dictionary element in the text, select a data element from the list, and tap Insert ( ![insert](assets/insert.png)). If you select Protected, the data dictionary element is read-only and appears in the letter editor, but not in Create Correspondence user interface or Correspondence Creator.  
    
    * Add a place holder element in the text, in the Data Elements panel tap Create New, enter the details for the new Data Element, and tap Create to add the new element to the list. The new place holder can be inserted into the text in the same way as data dictionary element. To edit a placeholder, select a placeholder and tap Edit.

   ![Placeholder elements](assets/placeholder_elements_in_xmldata.png)

   Placeholder elements as specified in sample data file of a Data Dictionary

   ![Placeholder elements in letter](assets/placeholder_elements_in_text.png)

   Placeholder element values in the CCR view populated from the Data Dictionary variables as specified in the sample data file

1. You can use inline conditions and repeat to make your letter highly contextual and well structured. For more information on inline condition and repeat, see [Inline conditions and repeat in letters](/help/forms/using/cm-inline-condition.md).
1. Tap **Save**.

### Searching and replacing text {#searchingandreplacingtext}

When working with text elements containing a large body of text, you need to search for a specific text string. You may also need to replace a specific string of text with an alternative string.

The Find and Replace feature allows you to search for (and replace) any string of text in a text element. The feature also includes a powerful regular expression search.

### To search text in a text document fragment {#to-search-text-in-a-text-document-fragment}

1. Open the text document fragment in the text editor.  

1. Tap Find & Replace.
1. Enter the text to search in the Find text box and press Find. The search text is highlighted in the text module.  

1. To search for the next instance of the text, press Find again.

   If you continue to press the Find button, the search continues down the page. After the last instance of the text is found, the message **Reached end of module** indicates that no more search results were found.

   However, if no instance of the search text is found in the text module, the message displayed is: **Match Not Found**.

1. If you press Find again, the search continues at the top of the page.

### Search Options {#search-options}

**Match Case:** The search returns results with the same case only.

**Whole word:** Search returns only whole words.

**Note:** If you enter any special characters in the Find text box, the Whole Word option is disabled.

**Reg ex:** Search using regular expressions. For example, the following regular expression searches for email addresses in a text document fragment:

`[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}`

#### To search and replace text in a text document fragment {#to-search-and-replace-text-in-a-text-document-fragment}

1. Open the text module in the text document fragment.  

1. Tap Find & Replace.
1. Enter the text to search in the Find text box and the text to replace the find text with and press Replace.
1. If the search text is found, the text is replaced by the Replace text.

    * If another instance of the search text is found, that instance is highlighted in the text document fragment. If you press Replace again, the highlighted instance is replaced and the cursor moves forward, if a third instance is found.
    * If another instance is not found, the cursor stops at the last replaced instance.

1. If you press Find again, the search continues at the top of the page.

   Use the Replace All option to replace all the instances of a text in the text document fragment. When you do us ``, the number of replacements is displayed as a message in the Find and Replace dialog.

### Best practices/ tips and tricks for text document fragments {#best-practices-tips-and-tricks-for-text-document-fragments}

* Use a consistent naming convention to avoid duplication.
* Use appropriate data dictionary binding in text modules.
* The following rules apply when using the Text Editor when changing a text asset:

    * **Addition of variable:** Allowed
    * **Removal of variable:** Allowed
    * **Update of properties:** Allowed
    * **Change of data dictionary:** Allowed until data dictionary element is not used. You cannot change the data dictionary on update.

