---
title: Enabling Asset Insights through DTM
seo-title: Enabling Asset Insights through DTM
description: Learn how to use Adobe Dynamic Tag Management (DTM )to enable Asset Insights.
seo-description: Learn how to use Adobe Dynamic Tag Management (DTM )to enable Asset Insights.
uuid: fd548ee7-559a-4d72-8d80-af4514151ca6
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: fa65084a-b69a-4ce2-8798-21ef23392964
---

# Enabling Asset Insights through DTM {#enabling-asset-insights-through-dtm}

Adobe Dynamic Tag Management is a tool that activates your digital marketing tools. It is provided for free to Adobe Analytics customers.

Although you can customize your tracking code to enable third-party CMS solutions to use Asset Insights, Adobe recommends that you use DTM to insert Asset Insights tags.

Perform these steps to enable Asset Insights through DTM:

1. Tap/click the AEM logo, and go to **[!UICONTROL Tools > Assets > Insights Configuration]**.
1. [Configure AEM instance with DTM Cloud Service](../sites-administering/dtm.md)

   The API token should be available once you log on to [https://dtm.adobe.com](https://dtm.adobe.com/) and visit **[!UICONTROL Account Settings]** from the Profile icon. This step is not required from the Asset Insights standpoint, because the integration of AEM Sites with Asset Insights is still in the works.

1. Log on to [https://dtm.adobe.com](https://dtm.adobe.com/), and select a Company, as appropriate.
1. Create/Open an the existing Web Property

    * Select the **[!UICONTROL Web Properties]** tab, and then tap/click **[!UICONTROL Add Property]**.
    * Update the fields as appropriate, and tap/click **[!UICONTROL Create Property]** (see [documentation](https://helpx.adobe.com/experience-manager/using/dtm.html)).

   ![chlimage_1-193](assets/chlimage_1-193.png)

1. In the **[!UICONTROL Rules]** tab, select **[!UICONTROL Page Load Rules]** from the navigation pane and tap/click **[!UICONTROL Create New Rule]**.

   ![chlimage_1-194](assets/chlimage_1-194.png)

1. Expand **[!UICONTROL Javascript /Third Party Tags]**. Then tap/click **[!UICONTROL Add New Script]** in the **[!UICONTROL Sequential HTML]** tab to open the Script dialog.

   ![chlimage_1-195](assets/chlimage_1-195.png)

1. Tap/click the AEM logo, and go to **[!UICONTROL Tools > Assets]**.
1. Tap/click **[!UICONTROL Insights Page Tracker]**, copy the tracker code, and then paste it in the Script dialog you opened in step 6. Save the changes.

   >[!NOTE]
   >
   >* `AppMeasurement.js` has been removed. It is expected to be available through DTM's Adobe Analytics tool.
   >* The call to `assetAnalytics.dispatcher.init()` is removed. The function is expected to be called once DTM's Adobe Analytics tool finishes loading.
   >* Depending on where Asset Insights Page Tracker is hosted (for example AEM, CDN and so on), the origin of the script source may require changes.
   >* For AEM-hosted Page Tracker, the source should point to a publish instance using the host name of the dispatcher instance.


1. Open [https://dtm.adobe.com](https://dtm.adobe.com). Click Overview in the web property and click Add Tool or open an existing Adobe Analytics Tool. While creating the tool, you can set Configuration Method to Automatic.

   ![chlimage_1-196](assets/chlimage_1-196.png)

   Select Staging/Production report suites, as appropriate.

1. Expand **[!UICONTROL Library Management]**, and ensure that **[!UICONTROL Load Library at]** is set to **[!UICONTROL Page Top]**.

   ![chlimage_1-197](assets/chlimage_1-197.png)

1. Expand **[!UICONTROL Customize Page Code]**, and click or tap **[!UICONTROL Open Editor]**.

   ![chlimage_1-198](assets/chlimage_1-198.png)

1. Paste the following code in the window:

   ```
   var sObj;
  
   if (arguments.length > 0) {
     sObj = arguments[0];
   } else {
     sObj = _satellite.getToolsByType('sc')[0].getS();
   }
   _satellite.notify('in assetAnalytics customInit');
   (function initializeAssetAnalytics() {
     if ((!!window.assetAnalytics) && (!!assetAnalytics.dispatcher)) {
       _satellite.notify('assetAnalytics ready');
       /** NOTE:
           Copy over the call to 'assetAnalytics.dispatcher.init()' from Assets Pagetracker
           Be mindful about changing the AppMeasurement object as retrieved above.
       */
       assetAnalytics.dispatcher.init(
             "",  /** RSID to send tracking-call to */
             "",  /** Tracking Server to send tracking-call to */
             "",  /** Visitor Namespace to send tracking-call to */
             "",  /** listVar to put comma-separated-list of Asset IDs for Asset Impression Events in tracking-call, e.g. 'listVar1' */
             "",  /** eVar to put Asset ID for Asset Click Events in, e.g. 'eVar3' */
             "",  /** event to include in tracking-calls for Asset Impression Events, e.g. 'event8' */
             "",  /** event to include in tracking-calls for Asset Click Events, e.g. 'event7' */
             sObj  /** [OPTIONAL] if the webpage already has an AppMeasurement object, please include the object here. If unspecified, Pagetracker Core shall create its own AppMeasurement object */
             );
       sObj.usePlugins = true;
       sObj.doPlugins = assetAnalytics.core.updateContextData;
       assetAnalytics.core.optimizedAssetInsights();
     }
     else {
       _satellite.notify('assetAnalytics not available. Consider updating the Custom Page Code', 4);
     }
   })();
   ```

    * The page load rule in DTM only includes the pagetracker.js code. Any `assetAnalytics` fields are considered as overrides for default values. They are not required by default.
    * The code calls `assetAnalytics.dispatcher.init()` after making sure that `_satellite.getToolsByType('sc')[0].getS()` is initialized and `assetAnalytics,dispatcher.init` is available. Therefore, you can skip adding it in step 11.
    * As indicated in comments within the Insights Page Tracker code (**[!UICONTROL Tools > Assets > Insights Page Tracker]**), when Page Tracker does not create an `AppMeasurement` object, the first three arguments (RSID, Tracking Server, and Visitor Namespace) are irrelevant. Empty strings are passed instead to highlight this.

      The remaining arguments correspond to what is configured in the Insights Configuration page (**[!UICONTROL Tools > Assets > Insights Configuration]**).
  
    * The AppMeasurement object is retrieved by querying `satelliteLib` for all available SiteCatalyst engines. If multiple tags are configured, change the index of the array selector appropriately. Entries in the array are ordered as per SiteCatalyst tools available in the DTM interface.

1. Save and close the Code Editor window, and then save the changes in the Tool configuration.
1. In the **[!UICONTROL Approvals]** tab, approve both the pending approvals. The DTM tag is ready for insertion in your web page. For details on how to insert DTM tags in web pages, see [Integrating DTM in custom page templates](https://blogs.adobe.com/experiencedelivers/experience-management/integrating-dtm-custom-aem6-page-template/).
