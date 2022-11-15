---
title: Unable to restore corrupt CRX repository applicable to JEE cluster server
SEO Description: Unable to restore corrupted CRX repository 
description: Steps to restore corrupted CRX repository 
---
# Unable to restore corrupt CRX repository {#unable-to-restore-corrupt-crx-repository}

## Issue {#issue}

For AEM Forms deployed on JEE with RDB persistence, it is necessary that AEM Forms host machines and database machines must be in absolute time synch. However, if for some reason clocks get out of synch, then CRX repository gets corrupt, and its URLs become inaccessible. The error as `AuthenticationsupportService missing` occurs in log files. 

## Solution {#solution}

Perform the following steps to resolve the issue:
1. Go to [!UICONTROL AEM Web Console Configuration] page at [https://localhost:4502/system/console/configMgr](https://localhost:4502/system/console/configMgr). 

1. Locate the `oak-core` bundle and check whether that it is running. 

1. Restart `oak-core` bundle if it is not running.

1. If the issue is still not resolved, restore from the CRX repository from the backup or rebuild the CRX repository if backup is not available. 

## Applies To {#applies-to}

This solution applies to:

* AEM Forms on JEE Cluster Server


