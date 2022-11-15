---
title: Unable to restore corrupted CRX repository applicable to JEE cluster server
SEO Description: Unable to restore corrupted CRX repository 
description: Steps to restore corrupted CRX repository 
exl-id: 785b7bb4-7158-45ea-a1e5-eebf3dc3ebc3
---
# Unable to restore corrupted CRX repository {#unable-to-restore-corrupted-crx-repository}

## Issue {#issue}

For AEM Forms deployed on JEE with RDB persistence, it is necessary that AEM Forms host machines and database machine must be in "absolute" time synch. However, if for some reason clocks get out of synch, then CRX repository gets corrupt and its URL's become unaccessible. The error as `AuthenticationsupportService missing` occurs in log files. 

## Solution {#solution}

Perform the following steps to resolve the issue:
1. Go to [AEM Web Console Configuration]().

1. Locate the `oak-core` bundle and check whether that it is running. 

1. Restart `oak-core` bundle, if it is not running.

1. If the issue is still not resolved, restore from the CRX repository from the backup or rebuild the CRX repository, if backup is not available. 

## Applies To {#applies-to}

This solution applies to:

* AEM Forms on JEE Cluster Server

