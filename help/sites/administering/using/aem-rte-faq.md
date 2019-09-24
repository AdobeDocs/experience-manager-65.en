---
title: Troubleshoot issues with AEM Rich Text Editor
seo-title: FAQ to troubleshoot AEM RTE
description: Know how to troubleshoot the top-issues and errors related to AEM Rich Text Editor. 
seo-description: Know how to troubleshoot the top-issues and errors related to AEM Rich Text Editor. 
uuid: d0a082a8-b6ea-451a-b93d-d29d34fc05a1
contentOwner: asgupta
topic-tags: troubleshoot
products: SG_EXPERIENCEMANAGER
discoiquuid: 46e1d4ed-cfcb-44b4-8404-bb87ffd8b32f
index: y
internal: n
snippet: y
---

# Troubleshoot issues with AEM Rich Text Editor{#troubleshoot-issues-with-aem-rich-text-editor}

#### How to select multiple table cells? {#how-to-select-multiple-table-cells}

To select multiple cells in a table, press Ctrl or Cmd key and then click the table cells one-by-one.

Now perform operation on the selection, say set the properties of the selected cells.

#### Hyperlinks are lost when editing a component using Configure button {#hyperlinks-are-lost-when-editing-a-component-using-configure-button}

Add a hyperlink in a text component by editing it using the Configure button. You may lose the hyperlink when editing it again and validating the hyperlink for the second time.

A workaround is to click in the text component when the edit dialog is displayed the second time and then run the link validation.

This issue is resolved in AEM 6.3 and later.

#### HTML content added in source-edit mode is lost {#html-content-added-in-source-edit-mode-is-lost}

Do not add a XSS-prone HTML. AEM, and not RTE, may remove some HTML content to adhere to the XSS antisamy rules.

To verify that the pasted HTML is saved, check the saved content in CRXDE (in the content node).

If not saved, the HTML must have been removed by RTE as it did not adhere to the RTE’s rules.

If saved in CRXDE but not rendered on the Page (to check rendering, see page's [preview](../../../sites/authoring/using/editing-content.md#preview-mode)), it is removed by AEM XSS rules.

#### Multifield component is not working as expected {#multifield-component-is-not-working-as-expected}

To create multifield component, use CoralUI 3 exclusively. Do not use CoralUI 2 component dialogs.

Also, verify that your multifield implementation code and node structure are correct.

#### Configuration available to administrators are not available to authors {#configuration-available-to-administrators-are-not-available-to-authors}

If the interface configurations updates are reflected for administrators but not for author accounts, ensure that the configuration node is not named `config`. Use the [ `configPath` property](/sites/developing/using/components-basics.md#cq-inplaceediting).
