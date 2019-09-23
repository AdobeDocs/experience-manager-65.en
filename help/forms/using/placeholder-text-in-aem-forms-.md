---
title: Placeholder text in AEM Forms 
seo-title: Placeholder text in AEM Forms 
description: Placeholder text is intended to aid the user with data entry when the control has no value. It could be a sample value or a brief description of the expected format.
seo-description: Placeholder text is intended to aid the user with data entry when the control has no value. It could be a sample value or a brief description of the expected format.
uuid: ebe77ff7-0c21-4534-b4c4-a7ef7260bf5a
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
discoiquuid: 112efae5-8049-45fc-8bee-975db816e214
index: y
internal: n
snippet: y
---

# Placeholder text in AEM Forms {#placeholder-text-in-aem-forms}

The placeholder text represents a word or short phrase. It is intended to aid the user with data entry when the control has no value. A placeholder text could be a sample value or a brief description of the expected format. The placeholder text is shown before the user enters a value, it is removed when the user enters or selects a value.

>[!NOTE]
>
>The placeholder text, if specified, must have a value that contains no new line characters.

![Date component with and without placeholder text](assets/dat-picker-place-holder-text.png)

**A.** Date component with placeholder text **B.** Date component without placeholder text

AEM Forms support placeholder text for Password box, Date picker, Numeric box, and text box fields.  
Placeholder texts are not supported for the native HTML5 date widget. To specify a Placeholder text:

1. Right-click a component which supports Placeholder Text and click **Edit**. The Edit component dialog box appears.  

1. Open the **Title and text** tab. 
1. Specify a word or a short phrase in the **Placeholder text box**. Click **OK**.

>[!NOTE]
>
>Placeholder text is not supported on Microsoft Internet Explorer 9.

<!--
<related-links>
<a href="/forms/using/auto-save-an-adaptive-form.md">Auto-Save an adaptive form</a>
</related-links>
-->

