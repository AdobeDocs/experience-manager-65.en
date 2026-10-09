---
title: Specify security settings
description: Learn how to specify security settings to protect XML data files. The security setting feature controls the external entities in XML inputs.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_output
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 1f544485-5a01-4a4a-ab0f-dcee67e1a38b
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Security
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 50158d81-1c06-57f7-8bd7-e8ff76a93f85
    internal-label: Document Security
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
# Specify security settings {#specify-security-settings}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

Output enables you to control whether external entities in XML inputs are resolved. By default, they are resolved, but you can change this behavior to increase the security of your AEM forms system.

**Prevent the processing of XML data files that contain references to external entities**

1. In administration console, click Services &gt; output.
1. Clear the Resolve External Entities check box.
1. Click Save.
