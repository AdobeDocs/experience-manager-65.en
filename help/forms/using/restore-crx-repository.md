---
title: Unable to restore corrupt CRX repository applicable to JEE cluster server
description: Learn the steps on how you can restore a CRX repository that is corrupt.
exl-id: 212f61f1-360f-4abe-b874-055ec65454c7
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
# Unable to restore corrupt CRX repository {#unable-to-restore-corrupt-crx-repository}

## Issue {#issue}

For AEM Forms on JEE that uses a relational database, time on the machine hosting AEM Forms and relational database should always be in absolute sync. If the time on these machines gets out of sync, the CRX-repository of AEM Forms on JEE server can become inaccessible. It may appear corrupt and become inaccessible via URL. The `AuthenticationsupportService missing` error is logged.

## Prerequisites {#prerequisites}

Take the backup of your CRX-repository before performing the below-mentioned steps.

## Solution {#solution}

1. Go to  `https://[AEM Forms Server]:[port]/system/console/bundles`. 

1. Locate the `oak-core` bundle and check whether it is running. 

1. Restart the `oak-core` bundle if it is not running. If  ![Pause button](/help/forms/using/assets/stop.png) icon is present in front of the `oak-core` bundle, then it indicates that the bundle is in running state. 

1. If the issue is still not resolved, restore from the CRX-repository from the backup or rebuild the CRX-repository if backup is not available. 


## Applies To {#applies-to}

This solution applies to AEM Forms on JEE Cluster.
