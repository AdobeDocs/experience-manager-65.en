---
title: Specifying fonts to embed
description: Learn how to specify fonts to embed in an AEM Adaptive Form. You can specify which fonts are always embedded or never embedded with the forms that the Forms service generates.
uuid: 97de6f98-ed3b-4a93-854a-193a967b4672
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: 4c83694c-b00f-40be-9ac4-f5785cd60741
exl-id: b2cbf5f3-ee13-47bf-bf7f-f6a1884cee66
---
# Specifying fonts to embed {#specifying-fonts-to-embed}

You can specify which fonts are always embedded or never embedded with the forms that the Forms service generates. Embedding fonts increases the file size of the forms. Embed unusual fonts that users rarely have on their systems. Do not embed common fonts that they typically have installed.

>[!NOTE]
>
>If you have specified a custom XCI file for Forms, the embed font option in the XCI file overrides these settings. (See [Configuring locations for Forms](/help/forms/using/admin-help/configuring-locations-forms.md#configuring-locations-for-forms).)

1. In administration console, click **[!UICONTROL Services > Forms]**.
1. Under **[!UICONTROL Font Embedding Settings]**, in the **[!UICONTROL Always Embed Fonts]** box, type the names of the fonts to embed with the forms, separated by commas. The fonts that you specify are only embedded in the generated form if they are used in the form. This setting is ignored if the embed font option has been turned on in the XCI file passed to the service because in that case, all fonts used in the PDF are always embedded.
1. In the **[!UICONTROL Never Embed Fonts]** box, type the names of the fonts not to embed with the forms, separated by commas. The fonts that you specify are not embedded in the PDF, even if they are used in the generated PDF. This setting is ignored if the embed font option has been turned off in the XCI file passed to the service because in that case, none of the fonts used in the PDF are embedded.
1. Click **[!UICONTROL Save]**.
