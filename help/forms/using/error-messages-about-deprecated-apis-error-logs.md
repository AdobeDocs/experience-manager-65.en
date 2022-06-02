---
title: Error messages about deprecated APIs in error logs
description: Error messages about deprecated APIs in error logs
---

# Error messages about deprecated APIs in error logs {#error-messages-about-deprecated-apis-in-error-logs}

The issue applies to the following versions:

* Experience Manager 6.5 Forms

## Issue {#issue}

* The following error messages appear in error.log file: 
  ` *WARN* [default task-36] org.apache.jackrabbit.oak.spi.security.principal.AclGroupDeprecation use of deprecated java.acl.Group-related API - this method is going to be removed in future Oak releases - see OAK-7358 for details` (NPR-38282)

## Resolution {#workaround}

1. Install [Experience Manager Forms Service Pack 13 or later (6.5.13.0 or later)](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/release-notes.html) 
1. Use the following link to download package (.jar file with resolution) from Software Distribution:

    https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?pack[…]pack/com.adobe.livecycle.dsc.externalloginmodule-4.0.8.jar

1. Open Experience Manager Configuration Manager and install the downloaded com.adobe.livecycle.dsc.externalloginmodule-4.0.8.jar file.

The issue is resolved. 