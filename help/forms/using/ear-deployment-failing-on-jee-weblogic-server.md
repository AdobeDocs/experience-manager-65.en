---
title: EAR Deployment Failing on JEE WebLogic Server
seo-title: EAR Deployment failing on JEE Weblogic Server
description: Steps to resolve EAR Deployment failing on JEE WebLogic Server
seo-description: Steps to resolve EAR Deployment failing on JEE Weblogic Server
exl-id: b87a9eee-ee56-4dca-b4a3-a42c91db0b4f
---
# EAR Deployment failing on JEE WebLogic Server {#ear-deployment-failing-on-jee-weblogic-server}

## Issue {#issue}

When a user attempts to deploy the `adobe-livecycle-weblogic.ear`, the `Null Pointer` exception is encountered .

## Applies to {#applies-to}

This solution applies to:

* AEM Forms on WebLogic JEE server version 12.2.1.x. 

## Solution {#solution}

To resolve the issue, follow these steps:

1. Go to the `<domain_home>\bin` directory of installed WebLogic JEE server.

1. Edit the `setDomainEnv.cmd` or `setDomainEnv.sh` file, as `applicable`.

1. Search for the last occurrence of `JAVA_OPTS` and add `-DANTLR_USE_DIRECT_CLASS_LOADING=true` to it. For example, the updated string appears as:

        set `JAVA_OPTIONS=%JAVA_OPTIONS% -DANTLR_USE_DIRECT_CLASS_LOADING=true`

1. Save the changes.
