---
title: Troubleshooting Integration Issues

description: Learn how to troubleshoot issues when integrating with Adobe Experience Manager.


contentOwner: raiman
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference

exl-id: 11b0023e-34bd-4dfe-8173-5466db9fbe34
solution: Experience Manager, Experience Manager Sites
feature: Integration
role: Admin
---
# Troubleshooting Integration Issues{#troubleshooting-integration-issues}

## General Troubleshooting Tips {#general-troubleshooting-tips}

### Ensure there are no JavaScript errors {#ensure-there-are-no-javascript-errors}

Check if the browser's JavaScript console displays any errors. Unhandled errors could prevent the subsequent code from being executed properly. In case there are errors, check what script is causing the error and in what area. The path to the script might give an indication to what functionality the script belongs to.

### Logging on component level {#logging-on-component-level}

In some cases, it might be helpful to add additional statements on component level. Since the component is rendered, you can add a temporary markup to show variable values which might help you indentify potential problems. For example:

```
<%
log.info("myVariable={}", myVariable);
%>

<!--
<%= myJspVariable %>
-->

<!--
${ myHtlVariable }
-->
```

For additional details about logging, see the [Logging](/help/sites-deploying/configure-logging.md) and [Working with Audit Records and Log Files](/help/sites-deploying/monitoring-and-maintaining.md#working-with-audit-records-and-log-files) pages.

## Analytics Integration Issues {#analytics-integration-issues}

### The Report Importer causes high CPU/Memory usage {#the-report-importer-causes-high-cpu-memory-usage}

The Report Importer causes high CPU/Memory usage or causes `OutOfMemoryError` exceptions.

#### Solution {#solution}

To fix this issue you can try the following:

* Ensure there is not a vast amount of PollingImporters registered (see the "Shutdown takes a long time due to PollingImporter" section below).
* Run Report Importers at a certain time of the day by using CRON expressions for the `ManagedPollingImporter` configurations in the [OSGi console](/help/sites-deploying/configuring-osgi.md).

For additional details about creating custom data importer services in AEM, read the following article [https://helpx.adobe.com/experience-manager/using/polling.html](https://helpx.adobe.com/experience-manager/using/polling.html).

### Shutdown takes a long time due to the PollingImporter {#shutdown-takes-a-long-time-due-to-the-pollingimporter}

Analytics has been designed with an inheritance mechanism in mind. Usually, you enable Analytics for a site by adding a reference to an Analytics configuration within the page properties [Cloud Services](/help/sites-developing/extending-cloud-config.md) tab. The configuration is then inherited to all sub-pages automatically without the need to reference it again unless a page requires a different configuration. Adding a reference to a site also automatically creates several nodes (12 for AEM 6.3 and earlier or 6 for AEM 6.4   and later) of the type `cq;PollConfig` which instantiates PollingImporters used to import Analytics data into AEM. As a result:

* Having lots of pages referencing Analytics leads to a high amount of PollingImporters.
* Additionally, copying and pasting pages with a reference to an Analytics configuration leads to a duplication of its PollingImporters.

#### Solution {#solution-1}

Firstly, analyzing the [error.log](/help/sites-deploying/configure-logging.md) might give you some insight about the amount of active or registered PollingImporters. For example:

```
# Count PollingImporter entries
$ sed -n "s/.*(aem-analytics-integration-.*).*target=\(.*\),interval.*/\1/p" error.log | wc -l
86415
# Count PollingImporter entries for last30days
$ sed -n "s/.*(aem-analytics-integration-last30Days).*target=\(.*\),interval.*/\1/p" error.log | wc -l
14531
# Count unique paths of PollingImporter registrations
sed -n "s/.*(aem-analytics-integration-.*).*target=\(.*\)\/jcr:content.*/\1/p" error.log | sort | uniq -c
28115
```

Secondly, make sure that only top pages (high up in the hierarchy) have an Analytics configuration referenced.

For additional details about creating custom data importer services in AEM, read the following article [https://helpx.adobe.com/experience-manager/using/polling.html](https://helpx.adobe.com/experience-manager/using/polling.html).

## DTM(Legacy) Issues {#dtm-legacy-issues}

### The DTM script tag is not rendered in the page source {#the-dtm-script-tag-is-not-rendered-in-the-page-source}

The [DTM](/help/sites-administering/dtm.md) script tag is not properly included in the page even though the configuration has been referenced in the page properties [Cloud Services](/help/sites-developing/extending-cloud-config.md) tab.

#### Solution {#solution-2}

To fix the issue, you can try the following:

* Make sure encrypted properties can be decrypted (note that encryption might use a different automatically generated key on each AEM instance). For additional details, also read [Encryption Support for Configuration Properties](/help/sites-administering/encryption-support-for-configuration-properties.md).
* Republish the configurations found in `/etc/cloudservices/dynamictagmanagement`
* Check ACLs on `/etc/cloudservices`. The ACLs should be:

    * allow; jcr:read; webservice-support-servicelibfinder
    * allow; jcr:read; everyone; `rep:glob:`&ast;`/defaults/`&ast;
    * allow; jcr:read; everyone; `rep:glob:`&ast;`/defaults`
    * allow; jcr:read; everyone; `rep:glob:`&ast;`/public/`&ast;
    * allow; jcr:read; everyone; `rep:glob:`&ast;`/public`

For more information about managing ACLs, read the [User Administration and Security](/help/sites-administering/security.md#permissions-in-aem) page.

## Target Integration Issues {#target-integration-issues}

### Targeted content not visible in Preview mode when using custom page components {#targeted-content-not-visible-in-preview-mode-when-using-custom-page-components}

This issue happens because custom page components do not include the correct JSP or client libraries that handle the Target DTM integrations.

#### Solution {#solution-3}

You can try the following solutions:

* Make sure the custom `headlibs.jsp` (if any `/apps/<CUSTOM-COMPONENTS-PATH>/headlibs.jsp`) includes the following:

```
<%@include file="/libs/cq/cloudserviceconfigs/components/servicelibs/servicelibs.jsp" %>
<sly data-sly-resource="${'contexthub' @ resourceType='granite/contexthub/components/contexthub'}"/>
```

* Make sure the custom `head.html` (if any `/apps/<CUSTOM-COMPONENTS-PATH>/head.html`) **does not** selectively include specific integration headlibs like the example below:

```
<!-- DO NOT MANUALLY INCLUDE SPECIFIC CLOUD SERVICE HEADLIBS LIKE THIS -->
<meta data-sly-include="/libs/cq/dtm/components/dynamictagmanagement/headlibs.jsp" data-sly-unwrap/>
```

The `servicelibs.jsp` adds the required analytics JavaScript objects and loads the cloud service libraries associated with the web site. For Target service, the libraries are loaded via the `/libs/cq/analytics/components/testandtarget/headlibs.jsp`

The set of libraries that are loaded depend on the type of target client library ( `mbox.js` or `at.js`) used on the Target configuration.

When using DTM to deliver `mbox.js` or `at.js` make sure the libraries are loaded before the content is rendered. Using Tag Management Systems that load these libraries asynchronously could cause issues in executing the target specific JavaScript code.

For additional information, read the [Developing for Targeted Content](/help/sites-developing/target.md#understanding-the-target-component) page.

### The error "Missing Report Suite ID in AppMeasurement initialization" is displayed in the browser console {#the-error-missing-report-suite-id-in-appmeasurement-initialization-is-displayed-in-the-browser-console}

This issue may appear when Adobe Analytics is implemented on the website by using DTM and uses Custom Code. The cause is using the `s = new AppMeasurement()` to instantiate the `s` object.

#### Solution {#solution-4}

Use `s_gi` instead of the `new AppMeasurement` instantiation method. For example:

```
var s_account="INSERT-RSID-HERE"
var s=s_gi(s_account)
```

### A default offer is randomly displayed instead of the correct offer {#a-default-offer-is-randomly-displayed-instead-of-the-correct-offer}

This issue can have multiple causes:

* Loading Target client libraries ( `mbox.js` or `at.js`) asynchronously using 3rd-party Tag Management Systems may randomly break targeting. The Target libraries are supposed to be loaded synchronously in the page head. This is always true when the libraries are delivered from AEM.

* Loading two Target client libraries ( `at.js`) simultaneously, for example, one using DTM and one using the Target configuration in AEM. This can cause clashes for the `adobe.target` definition if the `at.js` versions differ.

#### Solution {#solution-5}

You can try the following solutions:

* Make sure the customer code loading the DTM-like libraries (which in turn load the Target libraries) is executed synchronously in the [page head](/help/sites-developing/target.md#enabling-targeting-with-adobe-target-on-your-pages).
* if the site is configured to use DTM to deliver Target libraries ensure that the **Clientlib delivered by DTM** option is checked in the [Target configuration](https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/target-configuring.html) for the site.

### A default offer is always displayed instead of correct offer when using AT.js 1.3+ {#a-default-offer-is-always-displayed-instead-of-correct-offer-when-using-at-js}

Out of the box AEM 6.2 and 6.3 is not compatible with AT.js version 1.3.0+. With AT.js version 1.3.0 introducing parameter validation for its APIs, `adobe.target.applyOffer()` requires an "mbox" parameter which is not provided by the `atjs-itegration.js` code.

#### Solution {#solution-6}

To solve this issue edit `atjs-itegration.js` and add the `"mbox": mboxName` field in the parameter object for `adobe.target.applyOffer()` as follows:

```
adobe.target.getOffer({
    "mbox": mboxName,
    "params": params,
    "success": function (response) {
        adobe.target.applyOffer({
            "mbox": mboxName, //<--- ADDED PARAM
            "selector": "#" + mboxName,
            "offer": response
        })
    },
```

### The Goals & Settings page does not show the Reporting Sources section {#the-goals-settings-page-does-not-show-the-reporting-sources-section}

This issue is most likely an [A4T Analytics Cloud Configuration](/help/sites-administering/target-configuring.md) provisioning issue.

#### Solution {#solution-7}

You need to verify that A4T is properly enabled for your Target account by issuing the following verification request to AEM:

```
http://localhost:4502/etc/cloudservices/testandtarget/<YOUR-CONFIG>/jcr:content.a4t.json

{
    "a4tEnabled": true,
    "sharedsecret": "SECRET",
    "proxyUrl": "/libs/cq/contentinsight/content/proxy.reportingservices.json",
    "active": "true",
    "pageName": "",
    "url": "https://api5.omniture.com/rs/0.5/",
    "username": "USER@DOMAIN"
}
```

If the response contains the line `a4tEnabled:false`, contanct [Adobe Customer Care](https://helpx.adobe.com/contact.html) to get your account provisioned correctly.

### Helpful Target APIs {#helpful-target-apis}

Presented below are two Target APIs that might be useful when troubleshooting Target issues:

* Retrieve the Target endpoint for a given clientcode

```
https://admin.testandtarget.omniture.com/rest/v1/endpoint/<CLIENTCODE>.json

{"api":"https://admin<N>.testandtarget.omniture.com/admin/rest/v1"}

```

* Retrieve a client's profile

```
https://admin<N>.testandtarget.omniture.com/admin/rest/v1/clients/<CLIENT>?email=<EMAIL>&password=<PASSWORD>

Response for N=4, CLIENT-dayintegrationintern
{
    "clientCode": "dayintegrationintern",
    "companyName": "Day Integration - Internal",
    "omnitureCompanyId": "Day Integration Internal",
    "softTraxId": -1,
    "address1": "XYZ",
    "city": "San Francisco",
    "state": "ca",
    "zip": "94107",
    "country": "UNITED STATES",
    "locale": "de_DE",
    "timeZone": "Europe/Berlin",
    "phone": "XX-XX-XXXX",
    "serviceLevel": "Up to 100,000",
    "privileges": [
        "a4t",
        "hosts",
        "TnT-SC-integration",
        "mvt",
        "steps",
        "testing-campaigns",
        "view-snapshot",
        "on-site-editor",
        "optimizing-campaign",
        "third-party-id-support",
        "landing-page-campaigns",
        "segment",
        "rest-create-user",
        "advanced-targeting",
        "mobile-device-targeting",
        "beta",
        "geolocation"
    ]
}
```
