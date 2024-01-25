---
title: Failed to back up the previous Database on AEM Forms 6.5.12.0.
description: When a user upgrades to Experience Manager 6.5.12.0 and click "Upgrade MySQL", the configuration manager fails to back up the previous Experience Manager Forms Database.
---
# Issue (#issue)

When a user upgrades to Experience Manager 6.5.12.0 and click "Upgrade MySQL", the configuration manager fails to back up the previous Experience Manager Forms Database, It shows the error:

  `Failed to backup the previous Adobe Experience Manager Forms Database`

  
## Applies To {#applies-to}

* Experience Manager 6.5 Forms

## Solution {#solution}

To resolve the issue, increase the max_packet_size of the database to 100 M or as required in the my.ini file located at {AEM_HOME}/mysql.
