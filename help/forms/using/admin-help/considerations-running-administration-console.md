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
role: "User, Developer"
---
# Considerations when running Administration Console {#considerations-when-running-administrationconsole}

These are some things to consider when running Administration Console:

* If you access administration console using the URL `https://[hostname]:'port'/adminui`, the specified host name cannot contain underscore characters. Otherwise, links to some areas of the administration console may not work properly.
* If you run an administration console in Windows Explorer on a Japanese OS, you may encounter these problems:

    * Clicking a link returns you to the login page instead of to the expected link.
    * Clicking a link displays a permission error.

  The best practice is to run the administration console from another browser, such as Mozilla Firefox, to ensure that no links fail.

* Do not use backslash characters () when performing searches in the administration console.
