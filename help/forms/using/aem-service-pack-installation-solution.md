---
title: CRX and Start page service unavailable error once latets 6.5.15.0 service pack is installed
description: CRX and Start page service unavailable error once latets 6.5.15.0 service pack is installed
SEO Description: Trouble shooting steps to resolve the errors after installing latest 6.5.15.0 service pack
---

# Service unavailable error after installing AEM (6.5.15.0) service pack {#steps-to-resolve-error-after-installing-service-pack}

## Issue {#issue}

After installing the [AEM 6.5.15.0 service pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip), the CRX/bundle and the start page show service unavailable errors.

## Solution {#solution}

In case, you have not installed the [AEM 6.5.15.0 service pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip), perform the following steps:  
1.  Install  the [org.apache.felix.http.servlet-api-1.2.0_fragment-full.jar](https://jira.corp.adobe.com/secure/attachment/9396977/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar) servlet fragment.
1. Wait for Application Server to stabilize.
1. Install [AEM 6.5.15.0 service pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip). 


After installing [AEM 6.5.15.0 service pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip), if the CRX/bundle and the start page show service unavailable errors, perform the following steps:

>[!NOTE]
>
>The troubleshooting steps are applicable for all Application Servers except JBoss EAP 7.4.

1. Stop the Application Server.
1. Navigate to `[aem-forms root]\crx-repository\launchpad\felix\bundle52`.
1. Locate the `bundle.info` file.
1. Open the `bundle.info` file in ant text editor and search for the bundle name as `org.apache.felix.http.bridge`.

>[!NOTE] 
>
>In case the `bundle.info` under `bundle52` doesn't contains the `org.apache.felix.http.bridge` bundle, check the bundle number in square bracket next to the `org.apache.felix.http.bridge`. Then navigate to [aem-forms root]\crx-repository\launchpad\felix\bundle[x] and perform the next steps at this location.

6. Navigate to URL: `[aem-forms root]\crx-repository\launchpad\felix\bundle[x]\version0.1`.
1. Search for `bundle.jar` and rename the `bundle.jar` to `bundle.jar.bak`.
1. Copy `bundle.jar` at this location
Copy `bundle.jar` from the [Software Distribution.](https://jira.corp.adobe.com/secure/attachment/9402702/bundle.jar).
1. Start the Application Server, wait for logs to stabilize and check the bundle state.
8. Once all bundles are in the activated state, install the `org.apache.felix.http.servlet-api-1.2.0_fragment-full.jar` servlet fragment from the `system/console/bundles` downloaded from [Software Distribution.](https://jira.corp.adobe.com/secure/attachment/9396977/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar)
9. Again, wait for  Application Server to stabilize.
10. Stop the Application Server.
11. Navigate to `[aem-forms root]\crx-repository\launchpad\felix\bundle52\version0.1` and delete the `bundle.jar`.
1. Rename the `bundle.jar.bak` to the `bundle.jar`. 
1. Start the Application Server. 

## Applies to {#applicable-to}

This solution applies to:
* AEM Forms on JEE
