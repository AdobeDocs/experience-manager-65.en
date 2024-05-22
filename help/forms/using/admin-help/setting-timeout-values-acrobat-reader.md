---
title: Setting timeout values for use with Acrobat Reader DC Extensions
description: Learn how to set timeout values for use with Acrobat Reader DC Extensions.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_acrobat_reader_dc_extensions
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 0a55aab3-14a3-41ad-8533-dc2cd116a848
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Setting timeout values for use with Acrobat Reader DC Extensions  {#setting-timeout-values-for-use-with-acrobat-reader-dc-extensions}

When working on many PDF files in Acrobat Reader DC Extensions, ensure that the following time-out values are set appropriately to prevent jobs from timing out and failing:

**Document Disposal Timeout**

This value can be set in the administration console. Click Settings > Core System Settings > Configurations and specify a value for Default Document Disposal Timeout.

**User Manager AEM forms Timeout:** This value can be set by editing the config.xml file. In the administration console, click Settings > User Management > Configuration > Import and export configuration files, and then click Export. Open the exported config.xml file and edit the following lines:

&lt;entry key="assertionValidityInMinutes" value="600"/&gt;

&lt;entry key="SessionTimeout" value="600"/&gt;

Save and then import the config.xml file back into the administration console.

**Application Server Session Timeout:** This value can be set on the application server. For more information, see the documentation provided with your application server.
