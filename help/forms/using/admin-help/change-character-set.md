---
title: Change the character set

description: You can specify the character set used to encode the output stream. Learn how you can change the character set.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_output
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 9ff75d98-54ad-425d-912f-d5a7501bf564
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Change the character set {#change-the-character-set}

You can specify the character set used to encode the output stream.

1. In administration console, click **[!UICONTROL Services > output]**.
1. Under Internationalization, in the Character Set list, select a character set. This setting is dependent on the `TransformationFormat` and `PrintFormat` specified through the API. To specify a character set other than those listed, select Custom and specify an encoding value in the box that is displayed.

   If `TransformationFormat` is PDF and PDF/A or `PrintFormat` is PCL, PostScript, Zebra label, IPL, DPL, TPCL, GenericColorPCL, or GenericPSLevel3, only specific character sets are supported.

   The character set must be a valid canonical name. The default value is ISO-8859-1.

1. Click **[!UICONTROL Save]**.
