---
title: Failure to backup database during upgrade to 6.5.12.0 for MySQL.
description: When a user upgrades to Experience Manager 6.5.12.0 and click "Upgrade MySQL", the configuration manager fails to back up the previous Experience Manager Forms Database.
exl-id: 1af000fa-439b-4ffd-8b5a-3ba45f0c524c
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,AEM Forms on JEE
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 94663796-0ee7-58b9-84f4-b425ebb69e83
    internal-label: AEM Forms on JEE
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
# Failure to backup database during upgrade to 6.5.12.0 for MySQL {#issue}

When a user upgrades to Experience Manager 6.5.12.0 and click "Upgrade MySQL", the configuration manager fails to back up the previous Experience Manager Forms Database, It shows the error:

  `Failed to backup the previous Adobe Experience Manager Forms Database`

  
## Applies To {#applies-to}

* Experience Manager 6.5 Forms

## Solution {#solution}

To resolve the issue, increase the max_packet_size of the database to 100 M or as required in the my.ini file located at {AEM_HOME}/mysql.
