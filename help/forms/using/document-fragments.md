---
title: Document Fragments

description: Document Fragments, such as Text, lists, conditions, and layout fragments, in Correspondence Management let you form the static, dynamic, and repeatable components of customer correspondence.


products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: correspondence-management

feature: Correspondence Management
exl-id: ff3a4cba-a1a6-4fc9-8466-da7f28a74fb5
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Document Fragments {#document-fragments}

Document fragments are reusable parts/components of a correspondence using which you can compose Interactive Communications/letters. The document fragments are of the following types:

* **Text**: A text asset is a piece of content that consists of one or more paragraphs of text. A paragraph can be static or dynamic.

    * [Texts in Interactive Communications](/help/forms/using/texts-interactive-communications.md)

* **Condition**: Conditions enable you to define what content gets included at correspondence creation time, based on the supplied data. The condition is described in terms of control variables. A control variable can be either a data dictionary element or a placeholder.

    * [Conditions in Interactive Communications](/help/forms/using/conditions-interactive-communications.md)

* **List:** List is a group of document fragments, including text, lists, conditions, and images. The order of the list elements can be fixed or editable. While creating a letter, you can use some or all the list elements to replicate a reusable pattern of elements.
* **Layout fragment**: A layout fragment is a layout that can be used within one or more letters. A layout fragment is used to create repeatable patterns, especially dynamic tables. The layout can contain typical form fields such as "Address" and "Reference Number." It also contains empty sub forms that denote target areas. The layouts (XDPs) are created in Designer and then are uploaded to AEM Forms.
