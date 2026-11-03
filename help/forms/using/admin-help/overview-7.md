---
title: Basics of configuring forms
description: Learn about the various forms services that help you create interactive data capture applications.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 169f3d94-ac00-41c7-853e-ecf0dbee559f
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
# Basics of configuring forms {#basics-of-configuring-forms}

The Forms service enables you to create interactive data capture client applications that validate, process, transform, and deliver forms typically created in Designer. Form authors develop a single form design that the Forms service renders in various formats:

* as PDF in Adobe Reader or in a browser
* as HTML in various browser environments including a compliant XHTML 1.0 rendering
* as form Guides in various browser environments that support Adobe Flash Player.

For additional information about the Forms service, see [Services Reference](https://www.adobe.com/go/learn_aemforms_services_63).

Using the Forms page in administration console, you can configure the behavior of the Forms service. These settings apply to all invocations of the service. Any parameters sent through the AEM forms SDK override the settings set in administration console; however, they affect only that particular invocation.

After you change the Forms settings in administration console, click Save. You do not need to restart the server for the changes to take effect. However, you may need to stop and restart the Forms service when configuring cache mode settings. (See [Starting and stopping services](/help/forms/using/admin-help/starting-stopping-services.md#starting-and-stopping-services).)
