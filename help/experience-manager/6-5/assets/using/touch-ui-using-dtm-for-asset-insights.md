---
title: Enable Asset Insights through DTM
seo-title: Enable Asset Insights through DTM
description: Learn how to use Adobe Dynamic Tag Management (DTM) to enable Asset Insights.
seo-description: Learn how to use Adobe Dynamic Tag Management (DTM) to enable Asset Insights.
uuid: 7ed750c5-b51b-43d7-89a5-d95670ccf54b
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: managing-assets
content-type: reference
discoiquuid: de8838a9-ce39-4450-a076-b36518e72220
index: y
internal: n
snippet: y
---

# Enable Asset Insights through DTM{#enable-asset-insights-through-dtm}

Adobe Dynamic Tag Management is a tool that activates your digital marketing tools. It is provided for free to Adobe Analytics customers.

Although you can customize your tracking code to enable third-party CMS solutions to use Asset Insights, Adobe recommends that you use DTM to insert Asset Insights tags.

>[!NOTE]
>
>Insights are only supported and provided for images.

Perform these steps to enable Asset Insights through DTM.

1. Tap/click the AEM logo, and go to **Tools** &gt; **Assets** &gt; **Insights Configuration**.
1. [Configure AEM instance with DTM Cloud Service](/6-5/sites/administering/using/dtm.md)

   The API token should be available once you log on to [https://dtm.adobe.com](https://dtm.adobe.com/) and visit *Account Settings* from the Profile Icon. This step is not required from the Asset Insights standpoint, because the integration of AEM Sites with Asset Insights is still in the works.

1. Log on to [https://dtm.adobe.com](https://dtm.adobe.com/), and select a Company, as appropriate.
1. Create/Open an the existing Web Property

    * Select the **Web Properties** tab, and then tap/click **Add Property**.
    
    * Update the fields as appropriate, and tap/click **Create Property*** *(see [documentation](/using/dtm.md)).

   <!--
   Comment Type: remark
   Last Modified By: Ashish Gupta . (asgupta)
   Last Modified Date: 2019-02-08T09:32:14.014-0500
   <p>asgupta; 2/8/19: The documentation link points to /content/help/en/experience-manager/using/dtm.html which applies to AEM 6.1. May need to take a call about linking to it.<br /> </p>
   -->

   ![](assets/chlimage_1-42.png)

1. In the **Rules** tab, select **Page Load Rules** from the navigation pane and tap/click **Create New Rule***.*

   ![](assets/chlimage_1-43.png)

1. Expand **Javascript /Third Party Tags**. Then tap/click **Add New Script** in the **Sequential HTML** tab to open the Script dialog.

   ![](assets/chlimage_1-44.png)

1. Tap/click the AEM logo, and go to **Tools** &gt; **Assets**.
1. Tap/click **Insights Page Tracker**, copy the tracker code, and then paste it in the Script dialog you opened in step 6. Save the changes.

   >[!NOTE]
   >
   >
   >    
   >    
   >    * AppMeasurement.js has been removed. It is expected to be available through DTM's Adobe Analytics tool.
   >    * The call to `assetAnalytics.dispatcher.init`() is removed. The function is expected to be called once DTM's Adobe Analytics tool finishes loading.
   >    * Depending on where Asset Insights Page Tracker is hosted (for example AEM, CDN and so on), the origin of the script source may require changes.
   >    * For AEM-hosted Page Tracker, the source should point to a publish instance using the host name of the dispatcher instance.
   >    
   >

1. Open https://dtm.adobe.com. Click **Overview** in the web property and click **Add Tool** or open an existing Adobe Analytics Tool. While creating the tool, you can set **Configuration Method** to **Automatic***.*

   ![](assets/chlimage_1-45.png)

   Select Staging/Production report suites, as appropriate.

1. Expand **Library Management**, and ensure that **Load Library at** is set to **Page Top**.

   ![](assets/chlimage_1-46.png)

1. Expand **Customize Page Code**, and click or tap **Open Editor***.*

   ![](assets/chlimage_1-47.png)

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
    * The code calls `assetAnalytics.dispatcher.init`() after making sure that `_satellite.getToolsByType('sc')[0].getS`() is initialized and `assetAnalytics,dispatcher.init` is available. Therefore, you can skip adding it in step 11.
    
    * As indicated in comments within the Insights Page Tracker code (**Tools** > **Assets** > **Insights Page Tracker**), when Page Tracker does not create an `AppMeasurement` object, the first three arguments (RSID, Tracking Server, and Visitor Namespace) are irrelevant. Empty strings are passed instead to highlight this.  
      The remaining arguments correspond to what is configured in the Insights Configuration page (**Tools** &gt; **Assets **&gt; **Insights Configuration**).
    
    * The AppMeasurement object is retrieved by querying `satelliteLib` for all available SiteCatalyst engines. If multiple tags are configured, change the index of the array selector appropriately. Entries in the array are ordered as per SiteCatalyst tools available in the DTM interface.

1. Save and close the Code Editor window, and then save the changes in the Tool configuration.
1. In the **Approvals **tab, approve both the pending approvals. The DTM tag is ready for insertion in your web page. For details on how to insert DTM tags in web pages, see [Integrating DTM in custom page templates](http://blogs.adobe.com/experiencedelivers/experience-management/integrating-dtm-custom-aem6-page-template/).

