---
title: Known Issues in AEM 6.4
seo-title: Known Issues in AEM 6.4
description: Known Issues in Adobe Experience Manager 6.4
seo-description: Known Issues in Adobe Experience Manager 6.4.
uuid: 1733f15e-9c4f-4db3-98ee-25c2ea606f0d
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4
topic-tags: release-notes
content-type: reference
discoiquuid: 266634ab-21d3-4aac-acfa-b799a7485507
---

# Known Issues {#known-issues}

This page keeps a list of known issues Adobe Experience Manager 6.4 released on April 2018. For more information about known issues, [contact support](https://helpx.adobe.com/support/experience-manager.html).

## Hybrid Devices {#hybrid-devices}

Hybrid Devices are not supported. Various issues can be encountered when using such devices. The following suggested procedures help resolve many issues:

If you are using Google Chrome as browser:
* Type `chrome://flags/` in the address bar and press Enter.
* Click on Enable touch events &gt; Disabled.
* Restart the browser (all tabs and windows).
  
If you are using Mozilla Firefox as browser:
* Type `about:config` in the address bar and press Enter.
* Filter the settings to `dom.w3c`.
* Ensure that the settings are `0` and `false`.
* Restart the browser.

If you are using Microsoft Edge as browser:

* Type `about:flags` in the address bar and press Return.
* Scroll to Experimental features then **[!UICONTROL Touch]**.
* Click **[!UICONTROL Enable touch events]**.
* Select **[!UICONTROL Always Off]**.
* Restart the browser.

## Platform {#platform}

* **Operations Dashboard:** Progress bar is not shown when backup file is missing .zip extension. (GRANITE-10713)
* **HTL:** Java Use object with trailing whitespace in the package declaration freezes the SightlyJavaCompilerService (GRANITE-20836)
* **Apache Felix/Sling:** Config file still present in the repository even after configuration.delete() (GRANITE-20618)
* **Cloud Settings:** Console gets broken after editing configuration container (GRANITE-20726)
* **Security:** IMS integration fails with custom context path (GRANITE-20639)
* **Security:** Improve default JAAS Ranking of SSO, External and Default LoginModules (GRANITE-20590
* **Tooling - CRX DE Lite:** Ridge of properties view keeps moving up (GRANITE-12040)
* **Tooling - CRX DE Lite:** Cannot save changes to "Long" Value Types unless you double-click on Property Name (GRANITE-12351)  

* **Tooling - CRX DE Lite:** ctrl+F search on open text files goes stuck on RegExp search (GRANITE-5996)  

* **Tooling - CRX DE Lite:** Node property not displayed after renaming the node (GRANITE-7160)
* **UI:** Pulldown "more..." doesn't showing all elements when opened at a popover element on IE and Firefox (GRANITE-16326)
* **UI:** Info tooltip gets hidden when using fixed columns layout with 2 side-by-side columns (GRANITE-16869)
* **UI:** Unhandled error when impersonating as a user that does not exist (GRANITE-23228). Workaround by [implementing an error handler](/help/sites-developing/customizing-errorhandler-pages.md) to customize error message.  

* **Omnisearch:** Searches with backslash cause exception (GRANITE-11769)
* **Omnisearch:** Open "View Settings" in list view cause search filter to change (GRANITE-16524)
* **Omnisearch:** Wrong list of columnn configs shown when doing Assets search from Sites (GRANITE-16527)  

* **Omnisearch:** Left rail predicates are getting along with the Omnisearch server request (GRANITE-20524)
* **Omnisearch:** Omnisearch does not support context paths (GRANITE-16044)

## Assets {#assets}

* **Search**: Search does not return any results if the search string starts with a whitespace [OAK-4786](https://issues.apache.org/jira/browse/OAK-4786)

* **Search**: In Classic UI and Tags are not visible in Search (CQ-4235239)

* **UI**: Asset UI becomes unresponsive after Copy-Paste and Select-All (CQ-4236142)

* **UI**: Unable to Move assets after lazy loading (CQ-4236134)

* **Reports**: Error in Asset Modification Report creation (CQ-4239744)

* **Reports**: Scheduled, regular Asset report generation fails inconsistently (some reports remain queued) (CQ-4239089)

* **Metadata**: On adding multi value text field to Asset schema, required field cascading rule doesn’t work (CQ-4239333)

* **BrandPortal**: Publish to BrandPortal is not working for collections (CQ-4238731)

* **Upload**: When uploading assets with special characters in the file name, the validation error message about the unallowed characters is not displayed for each assets. While it is displayed for only the first asset, the interface clearly indicates to the user that the file name of the provided asset are not allowed. (CQ-4256876)

## Communities {#communities}

* **Moderation** - Not able to delete parent post as a single delete operation from the bulk moderation UI (CQ-4236797)

* **Console** - Forgot Username or Password link is redirecting to the Login Page instead of the corresponding password retrieval form (CQ-4237682)

## Forms {#forms}

### Installation and deployment

* (AEM Forms JEE only) When boostrapping JBoss application server while running Configuration Manager returns EJB invocation and bootstrap failure errors. However, you can ignore them. (Ref# CQ-4229793)

### Interactive Communications

* The Agent UI takes a while to load Interactive Communications that include chart or image elements. (CQ-4236630)
* The data display format in print preview is dd-mm-yyyy while in the web preview is `dd-mmm-yy` (CQ-4237045)  
* The Interactive Communication Web channel supports only ordered and unordered lists. In list document fragments, compound listing and indentation are not supported for Web channel of the Interactive Communication. (CQ-4233672)
* The following issues are observed when web channel syncs with print channel:

    * Web channel take a while to sync when switching from print channel for the first time.
    * Web channel does not sync if the print channel includes an unconfigured chart component. To resolve the issue, delete the chart component and sync again.
    * Sync sometimes fails with the "An error occurred while synchronizing the Live Copy" error. To resolve the issue, refresh the page.
    * The static text in a layout fragment is replaced with table cell name when the first column in the table is a header column in the print channel template.
    * Cannot add components or assets at any location other than at the bottom of a web channel communication. To place it at another location, add a panel at the bottom of web channel and reorder using the content tree.
    * Can move content into inherited target area of web channel without removing the live copy inheritance.

(CQ-4239780)

### Data integration

* Authentication configurations for SOAP-based web services are not visible and thus cannot be configured in cloud services. To resolve the issue:

    1. In CRXDE Lite console, go to the following node.  
    /libs/fd/fdm/gui/components/admin/fdmcloudservice/createcloudconfigwizard/cloudservices/  
    wsdlauthenticationsettings/items/fixedcolumns/items/container/items/wsdl/items/  
    selectAuthentication/items/custom.  
    1. Update the value of the value property to the same as the value of the text property.  
    1. Click Save All to save the configuration.

(CQ-4238462)

### Adobe Sign integration

* Adobe Sign scheduler stops working intermittently and therefore forms pending sign do not move to submission. To resolve the issue, restart the **Apache Sling Scheduler Support** bundle from AEM web console at https://[*server*]:[*port*]/system/console/bundles.

### Adaptive Forms authoring

* The Chart component in adaptive forms takes more space than it normally does.
* An exception is returned when saving properties for adaptive forms, adaptive form fragments, or interactive communications in Forms Manager UI.
* The specified maximum number of characters for an adaptive form text box is not honored on Android 6.0 Samsung devices. (Ref# CQ-4235205)
