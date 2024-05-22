---
title: CRX/bundle and Start page service unavailable errors once latest 6.5.15.0 service pack is installed
description: CRX/bundle and Start page service unavailable errors once latest 6.5.15.0 service pack is installed
SEO Description: Trouble shooting steps to resolve the errors after installing latest 6.5.15.0 service pack
exl-id: dfe015a3-3a24-41c5-aede-8e086851d62b
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Installation
role: User, Developer
---
# Service unavailable error after installing AEM (6.5.15.0) service pack {#steps-to-resolve-error-after-installing-service-pack}

## Issue {#issue}

After installing the [AEM 6.5.15.0 service pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip), the error occurs as:
* ERROR [FelixDispatchQueue] org.apache.sling.scripting.console FrameworkEvent ERROR (org.osgi.framework.BundleException: Unable to resolve org.apache.sling.scripting.console

After installing AEM 6.5.15.0 service pack the CRX/bundle and the start page show service unavailable errors.

## Applies to {#applies-to}

This solution applies to:
* AEM Forms on all JEE servers except those running on JBoss EAP 7.4.0

## Solution {#solution}

>[!NOTE]
>
>Troubleshooting steps are applicable for all application servers except JBoss EAP 7.4.

After installing [AEM 6.5.15.0 service pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip), if the CRX/bundle and the start page show service unavailable errors, perform the following steps:

1. Stop the application server.
1. Navigate to `[aem-forms root]\crx-repository\launchpad\felix\bundle52`.
1. Locate the `bundle.info` file.
1. Open the `bundle.info` file in ant text editor and search for the bundle name as `org.apache.felix.http.bridge`.

   >[!NOTE] 
   >
   >In case the `bundle.info` under `bundle52` does not contains the `org.apache.felix.http.bridge` bundle, check the bundle number in square bracket next to the `org.apache.felix.http.bridge`. Then navigate to [aem-forms root]\crx-repository\launchpad\felix\bundle[x] and perform the next steps at this location.

1. Navigate to URL: `[aem-forms root]\crx-repository\launchpad\felix\bundle[x]\version0.1`.
1. Search for `bundle.jar` and rename the `bundle.jar` to `bundle.jar.bak`.
1. Copy the `Bundle for AEM 6.5 Forms on JEE Service Pack 15` at this location from the [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/bundle.jar).
1. Start the application server, wait for logs to stabilize and check the bundle state.
1. Once all bundles are in the active state, install the [Fragment for AEM 6.5 Forms on JEE Service Pack 15](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar) from the `system/console/bundles` and wait for the application server to stabilize.
1. Stop the application server.
1. Navigate to `[aem-forms root]\crx-repository\launchpad\felix\bundle52\version0.1` and delete the `bundle.jar`.
1. Rename the `bundle.jar.bak` to the `bundle.jar`. 
1. Start the application server.
