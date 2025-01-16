---
title: Specifying XCI configuration options
description: Learn how to specify the XCI configuration options. You can specify a custom XCI file values for Adaptive Form, so that it can be used while form rendering.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 7cd10389-63e6-41f2-a132-92fd9e40a9b7
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Specifying XCI configuration options {#specifying-xci-configuration-options}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

Forms lets you specify a custom XCI file that it can use for rendering. (See [Configuring locations for Forms](/help/forms/using/admin-help/configuring-locations-forms.md#configuring-locations-for-forms).) By default, Forms override some of the options specified in the XCI file, including the following:

* `config/present/xdp/packets`
* `config/present/pdf/creator`
* `config/present/pdf/producer`
* `config/present/pdf/compression/compressObjectStream`

You can select options that cancel the override for the options listed above, in which case Forms uses the values specified in the custom XCI file.

1. In administration console, click **Services** > **Forms**.
1. Select or deselect the Use System Default XCI Options check box. When this option is selected, Forms uses its default values for the packets, creator, producer, and compressObjectStream settings. When this option is deselected, Forms uses the values specified in the custom XCI file.
1. Click **Save**.
