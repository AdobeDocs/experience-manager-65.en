---
title: Unable to restore corrupt CRX repository applicable to JEE cluster server
description: Learn the steps on how you can restore a CRX repository that is corrupt.
exl-id: 212f61f1-360f-4abe-b874-055ec65454c7
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms, Troubleshooting"
role: "User, Developer"
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
