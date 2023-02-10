---
title: Troubleshooting your Adobe Campaign Integration
seo-title: Troubleshooting your Adobe Campaign Integration
description: Learn how to troubleshoot issues with the Adobe Campaign Integration.
seo-description: Learn how to troubleshoot issues with the Adobe Campaign Integration.
uuid: 835ac2c3-ef2f-4963-9047-aeda3647b114
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
discoiquuid: b1d45f01-78de-423c-8f6b-5cb7067c3a2f
exl-id: 317bab41-3504-4e46-9ddc-72e291a34e06
---
# Troubleshooting your Adobe Campaign Integration{#troubleshooting-your-adobe-campaign-integration}

>[!NOTE]
>
>This page applies to Campaign Classic.

The following troubleshooting tips help solve the most common problems you may encounter when you integrate AEM with Adobe Campaign:

## General Troubleshooting Tips {#general-troubleshooting-tips}

For both integrations, you can check whether HTTP-calls are sent (AEM &gt; Adobe Campaign, Adobe Campaign &gt; AEM):

* When integrations are failing, make sure that these calls arrive on the other end (to avoid firewall/SSL issues).
* For AEM functionality, you will see that json calls are requested from the AEM author interface; these should not result in an HTTP-500 error. If you see HTTP-500 errors, check the `error.log` for more information on this.
* Raising the debug level for campaign-classes in AEM also helps to troubleshoot issues.

## If the connection fails {#if-the-connection-fails}

Check that you have configured the **aemserver** operator in Adobe Campaign.

## If images do not appear in the Adobe Campaign console {#if-images-do-not-appear-in-the-adobe-campaign-console}

Check the HTML source and validate that you can open the URL from the client machine. If the URL has localhost:4503 in it, then change the configuration of Day CQ Link Externalizer on your author instance to point to a publish instance that can be reached from the Adobe Campaign console machine.

See [Configuring the Externalizer.](/help/sites-administering/campaignstandard.md#configuring-the-externalizer)

## If you cannot connect from AEM to Adobe Campaign {#if-you-cannot-connect-from-aem-to-adobe-campaign}

Look for the following error message in Adobe Campaign:

`No datasource defined in the instance 'default'.`

`Make sure the DNS alias used to access the server is correct (for example, avoid hard-coded IP addresses). (iRc=16384)`

To fix this issue, change the following in **$CAMPAIGN_HOME/conf/config-&lt;instance-name&gt;.xml**:

`<dataStore hosts="*" lang="en_GB">`

## If no data displays in the Adobe Campaign dialog {#if-no-data-displays-in-the-adobe-campaign-dialog}

In Adobe Campaign, ensure that you have no trailing slash (/) after the port number.

![chlimage_1-149](assets/chlimage_1-149.png)

## If you get a warning about your setlocale {#if-you-get-a-warning-about-your-setlocale}

If you are starting the Apache HTTPD service and see the error `"Warning: setlocale: LC_CTYPE cannot change locale"` make sure that you have your **en_CA.ISO-8859-15 locale** installed on your system.

You can check whether it is installed by using `local -a`. If it is not installed you can patch **/usr/local/neolane/nl6/env.sh** script and change the locale to an installed one.

## If you get an error while compiling script 'get_nms_amcGetSeedMetaData_jssp' {#if-you-get-an-error-while-compiling-script-get-nms-amcgetseedmetadata-jssp}

If you see the following error message in the AEM log file:

`com.day.cq.mcm.campaign.impl.CampaignConnectorImpl Internal Adobe Campaign error: response body is Error while compiling script 'get_nms_amcGetSeedMetaData_jssp' line 45: String.prototype.toJSON called on incompatible XML.`

Use the following workaround:

1. Open file **$CAMPAIGN_HOME/datakit/nms/fra/js/amcIntegration.js**
1. Modify line 467 of method "amcGetSeedMetaData"
1. Change `label : [inclView.@label](mailto:inclView.@label)` to `label : String([inclView.@label](mailto:inclView.@label))`

1. Save.
1. Relaunch the server.

## If Adobe Campaign displays an error when clicking the Synchronize button {#if-adobe-campaign-displays-an-error-when-clicking-the-synchronize-button}

If when clicking the **Synchronize** button in Adobe Campaign Classic, you see the following error:

`Error while executing the method ‘aemListContent' of service [nms:delivery](https://nmsdelivery/)`

To fix this issue, make sure the AEM connection-url configured in the External Accounts is reachable from the machine.

A switch from **localhost** to an IP-address solved this issue.

## If you get a 'Cannot parse XTK Date+Time 'undefined'' error {#if-you-get-a-cannot-parse-xtk-date-time-undefined-error}

After clicking Synchronize, you get an error that a script on the pages has occured: Cannot parse XTK Date+Time 'undefined': not a valid XTK value.

This happens if there is still outdated Adobe Campaign information on the AEM instance. Solve this issue by removing all campaign integration configurations that are on AEM and rebuilding them. Then, create a new template.

## If a connection to SSL displays an error when setting up the cloud service {#if-a-connection-to-ssl-displays-an-error-when-setting-up-the-cloud-service}

In the error.log of AEM, if you see the following:

```xml
javax.net.ssl.SSLProtocolException: handshake alert:  unrecognized_name
at sun.security.ssl.ClientHandshaker.handshakeAlert(Unknown Source)
at sun.security.ssl.SSLSocketImpl.recvAlert(Unknown Source)
at sun.security.ssl.SSLSocketImpl.readRecord(Unknown Source)
at sun.security.ssl.SSLSocketImpl.performInitialHandshake(Unknown Source)
at sun.security.ssl.SSLSocketImpl.writeRecord(Unknown Source)
at sun.security.ssl.AppOutputStream.write(Unknown Source)
```

Please raise a ticket with the Adobe Campaign support team.

## If you see http instead of an expected https links in the synchronization dialog {#if-you-see-http-instead-of-an-expected-https-links-in-the-synchronization-dialog}

With the following setup:

* Hosted Adobe Campaign using https for communication with AEM Author
* Reverse proxy terminating SSL
* On premise AEM Author instance

When trying to synchronize content in Adobe Campaign delivery, AEM returns a list of newsletters. However, the urls to the newsletters in the list are http addresses. When selecting one of the items in the list an error occurs.

To solve this issue:

* The dispatcher or reverse proxy needs to be configured to pass the original protocol as a header.
* The *Apache Felix Http Service SSL Filter* in the OSGi configuration ([https://&lt;host&gt;:&lt;port&gt;/system/console/configMgr](http://localhost:4502/system/console/configMgr)) needs to be configured to the respective header settings. See [https://felix.apache.org/documentation/subprojects/apache-felix-http-service.html#using-the-ssl-filter](https://felix.apache.org/documentation/subprojects/apache-felix-http-service.html#using-the-ssl-filter)

## If the custom template I created cannot be selected in Page Properties {#if-the-custom-template-i-created-cannot-be-selected-in-page-properties}

When creating a mail template for Adobe Campaign, you must include the property **acMapping** with the value **mapRecipient** in the **jcr:content** node of the template, or you will not be able to select the Adobe Campaign template in **Page Properties** of AEM (field is disabled).

## If you get the error "com.day.cq.mcm.campaign.servlets.util.ParameterMapper" in your logs {#if-you-get-the-error-com-day-cq-mcm-campaign-servlets-util-parametermapper-in-your-logs}

When using your custom template, you get the error "com.day.cq.mcm.campaign.servlets.util.ParameterMapper" in your logs. In this event, be sure to install Featurepack 6576 from [Package Share](/help/sites-administering/package-manager.md#package-share). This is an issue where if the acMapping property is set to a value other than recipient.firstName, a blank value is created on the Adobe Campaign Manager side.
