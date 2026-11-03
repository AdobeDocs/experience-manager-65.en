---
title: Considerations when running Administration Console
description: This document lists a few points to consider when running Administration Console.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/maintaining_the_application_server
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: e15dae6f-d30d-4770-a5ca-34f522a01d31
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
# Considerations when running Administration Console {#considerations-when-running-administrationconsole}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

These are some things to consider when running Administration Console:

* If you access administration console using the URL `https://[hostname]:'port'/adminui`, the specified host name cannot contain underscore characters. Otherwise, links to some areas of the administration console may not work properly.
* If you run an administration console in Windows Explorer on a Japanese OS, you may encounter these problems:

    * Clicking a link returns you to the login page instead of to the expected link.
    * Clicking a link displays a permission error.

  The best practice is to run the administration console from another browser, such as Mozilla Firefox, to ensure that no links fail.

* Do not use backslash characters () when performing searches in the administration console.
