---
title: Specifying XCI configuration options
seo-title: Specifying XCI configuration options
description: Learn how to specify XCI configuration options.
seo-description: Learn how to specify XCI configuration options.
uuid: 5d3c10c1-4a93-4336-b311-20faaf835b9f
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 162c9fda-f4d4-4ad5-a9ab-7554828e821c
---

# Specifying XCI configuration options {#specifying-xci-configuration-options}

Forms enables you to specify a custom XCI file that it will use for rendering. (See [Configuring locations for Forms](/help/forms/using/admin-help/configuring-locations-forms.md#configuring-locations-for-forms).) By default, Forms overrides some of the options specified in the XCI file, including the following:

* `config/present/xdp/packets`
* `config/present/pdf/creator`
* `config/present/pdf/producer`
* `config/present/pdf/compression/compressObjectStream`

You can select options that cancel the override for the options listed above, in which case Forms will use the values specified in the custom XCI file.

1. In administration console, click Services &gt; Forms.
1. Select or deselect the Use System Default XCI Options check box. When this option is selected, Forms uses its default values for the packets, creator, producer, and compressObjectStream settings. When this option is deselected, Forms uses the values specified in the custom XCI file.
1. Click Save.

