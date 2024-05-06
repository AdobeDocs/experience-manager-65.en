---
title: Configuring fallback fonts
description: Learn how to configure fallback fonts for AEM Forms. You can use the FontManagerResources.properties file to map the default fonts to fallback fonts manually. 

contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: PDF Generator
exl-id: 76dd2b0c-9f16-47bf-a565-99277be750fb
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Configuring fallback fonts {#configuring-fallback-fonts}

You can manually configure the FontManagerResources.properties file to map the default AEM forms fonts to fallback (or substitute) if the default fonts are not available on the server. This property file is in the adobe-fontmanager.jar file.

>[!NOTE]
>
>Fallback font configuration also applies to the assembler service.

1. Navigate to the adobe-livecycle-*`[appserver]`*.ear file in the *`[aem-forms root]`*/configurationManager/export directory, make a backup copy, and unpackage the original.
1. Locate the adobe-fontmanager.jar file and unpackage it.
1. Locate the FontManagerResources.properties file and open it in a text editor.
1. Modify the Generic and Fallback font locations and names as required and save the file.

   The font entries in the FontManagerResources.properties file are relative to the *`[aem-forms root]`*/fonts directory. If you specify fonts that are not default AEM forms fonts, you must install those fonts within this directory structure (either within an existing directory or in a newly created one).

   >[!NOTE]
   >
   >If the specified font or default font does not contain a specific unicode character or if it is unavailable, the character is taken from a fallback font according to the following priority:

    * Locale-specific font
    * ROOT font if locale not set
    * Generic font, searched by order set in the fallback table

1. Repackage the adobe-fontmanager.jar file.
1. Repackage the adobe-livecycle-*`[appserver]`*.ear file and then redeploy it either manually or by running Configuration Manager.

>[!NOTE]
>
>Do not use Configuration Manager to repackage the adobe-livecycle-`[appserver]`.ear file because it will overwrite your modifications with the AEM forms default values.
