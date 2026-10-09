---
title: Specifying fonts to embed
description: Learn how to specify fonts to embed in an Adaptive Form. You can specify which fonts are embedded or never embedded with forms that Forms service generates.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: b2cbf5f3-ee13-47bf-bf7f-f6a1884cee66
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Specifying fonts to embed {#specifying-fonts-to-embed}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

You can specify which fonts are always embedded or never embedded with the forms that the Forms service generates. Embedding fonts increases the file size of the forms. Embed unusual fonts that users rarely have on their systems. Do not embed common fonts that they typically have installed.

>[!NOTE]
>
>If you have specified a custom XCI file for Forms, the embed font option in the XCI file overrides these settings. (See [Configuring locations for Forms](/help/forms/using/admin-help/configuring-locations-forms.md#configuring-locations-for-forms).)

1. In administration console, click **[!UICONTROL Services > Forms]**.
1. Under **[!UICONTROL Font Embedding Settings]**, in the **[!UICONTROL Always Embed Fonts]** box, type the names of the fonts to embed with the forms, separated by commas. The fonts that you specify are only embedded in the generated form if they are used in the form. This setting is ignored if the embed font option has been turned on in the XCI file passed to the service because in that case, all fonts used in the PDF are always embedded.
1. In the **[!UICONTROL Never Embed Fonts]** box, type the names of the fonts not to embed with the forms, separated by commas. The fonts that you specify are not embedded in the PDF, even if they are used in the generated PDF. This setting is ignored if the embed font option has been turned off in the XCI file passed to the service because in that case, none of the fonts used in the PDF are embedded.
1. Click **[!UICONTROL Save]**.
