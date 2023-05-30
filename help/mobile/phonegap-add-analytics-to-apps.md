---
title: Add Adobe Analytics to your Mobile Application
seo-title: Add Adobe Analytics to your Mobile Application
description: Follow this page to learn about how you can use Mobile App Analytics in your AEM Apps by integrating with Adobe Mobile Services.
seo-description: Follow this page to learn about how you can use Mobile App Analytics in your AEM Apps by integrating with Adobe Mobile Services.
uuid: d3ff6f9b-0467-4abe-9a59-b3495a6af0f8
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: developing-adobe-phonegap-enterprise
discoiquuid: cd9d2bea-48d8-4a17-8544-ea25dcad69f3
exl-id: 8d965e94-c368-481d-b000-6e22456c34db
---
# Add Adobe Analytics to your Mobile Application{#add-adobe-analytics-to-your-mobile-application}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (e.g. React). [Learn more](/help/sites-developing/spa-overview.md).

Want to build engaging and relevent experiences for your mobile application users? If you're not using the Adobe Mobile Services SDK to monitor and measure application lifecycle and usage, then on what are you basing your decisions? Where are your most loyal customers? How can you gurantee you're staying relevent and and optimizing conversions?

Are your users accessing all the content? Are they abandoning the app, and if so, where? How often do they stay in the app and how often to they come back to use the app? What changes can you introduce and then measure that increase retention? What about crash rates, is your app crashing for your users?

Take advantage of [Mobile App Analytics](https://www.adobe.com/ca/solutions/digital-analytics/mobile-web-apps-analytics.html) in your AEM Apps by integrating with [Adobe Mobile Services](https://www.adobe.com/marketing-cloud/mobile-marketing.html).

Instrument your AEM Apps to track, report and understand how you users engage with your mobile app and content and to measure key lifecycle metrics such as launches, time in app, and crash rate.

This section describes how AEM *Developers* can:

* Integrate Mobile Analytics into your mobile application
* Test your analytics tracking with Bloodhound

## Prerequisties {#prerequisties}

AEM Mobile requires an Adobe Analytics account to collect and report tracking data in your app. As part oftheconfiguration the AEM *Administrator* will first need to :

* Setup an Adobe Analytics account and create a report suite for your application in Mobile Services.
* Configure an AMS Cloud Service in Adobe Experience Manager (AEM).

## For Developers - Integrate Mobile Analytics into your app {#for-developers-integrate-mobile-analytics-into-your-app}

### Configure ContentSync to pull in configuration file {#configure-contentsync-to-pull-in-configuration-file}

After the Analytics account is setup you will need to create a Content Sync configuration to pull in the content into your Mobile Application.

For additional details refer to Configuring the Content Sync Content. The configuration will need to instruct Content Sync to put the ADBMobileConfig into the /www directory. For example in the Geometrixx Outdoors App the Content Sync configuration is located at: */content/phonegap/geometrixx-outdoors/shell/jcr:content/pge-app/app-config/ams-ADBMobileConfig*. There is a configuration for development as well; however, it is identical to the non-development configuration in the case of Geometrixx Outdoors.

For further details on how to download the ADBMobileConfig from your Mobile Application AEM Apps dashboard, refer to Analytics - Mobile Services - Adobe Mobile Services SDK Config File.

```xml
<jcr:root xmlns:jcr="https://www.jcp.org/jcr/1.0" xmlns:nt="https://www.jcp.org/jcr/nt/1.0"
    jcr:primaryType="nt:unstructured"
    extension="json"
    path="../../../.."
    selector="ADBMobileConfig"
    targetRootDirectory="www"
    type="mobileADBMobileConfigJSON"/>
```

Each platform requires the ADBMobileConfig to be copied to a specific location.

If building with the PhoneGap CLI this can be done with an cordova build hook scripts. This can be seen intheGeometrixx Outdoors App at:*content/phonegap/geometrixx-outdoors/shell/_jcr_content/pge-app/app-content/phonegap/scripts/restore_plugins.js.*

For iOS the file will need to be copied to the XCode project's **Resources** directory (eg. "platforms/ios/Geometrixx/Resources/ADBMobileConfig.json"). If the App is targeted for Android then the path to copy to is "platforms/android/assets/ADBMobileConfig.json". For further details on using hooks during the PhoneGap CLI build refer to [Three hooks your Cordova/PhoneGap project needs](https://gist.github.com/jlcarvalho/22402d013bc72f795d45a01836ce735c).

```xml
///////////////////////////
//          iOS
///////////////////////////
    ios : [
        {
            "www/ADBMobileConfig.json": "platforms/ios/<YOUR_APP_NAME>/Resources/ADBMobileConfig.json"
        }
    ],
///////////////////////////
//          ANDROID
///////////////////////////
    android: [
        {
            "www/ADBMobileConfig.json": "platforms/android/assets/ADBMobileConfig.json"
        }
    ]
```

### Add the AMS plugin in the App {#add-the-ams-plugin-in-the-app}

For the App to collect the data the Adobe Mobile Services (AMS) plugin needs to be included as part of the app. By including the plugin as a feature in the app's config.xml another Cordova hook can be used to automatically add the plugin during the PhoneGap build process.

```xml
<feature name="ADBMobile">
    <param name="id" value="https://github.com/Adobe-Marketing-Cloud/mobile-services#0482f9cedf90c98a8d4b07219ece1933b2e46a60"/>
</feature>
```

The Geometrixx Outdoors App config.xml is located at */content/phonegap/geometrixx-outdoors/shell/jcr:content/pge-app/app-content/phonegap/www/config.xml*. The example above requests a specific version of the plugin to be used by adding a '#' and then a tag value after the plugin URL. This is a good practice to follow to ensure unanticipated issues do not appear due to untested plugins being added during a build.

After performing these steps your app will be enabled to report all the lifecycle metrics provide by Adobe Analytics. This includes data such as launches, crashes and installs. If that's the only data which you care about then you are done. If you want to collect custom data then you will need to instrument you code.

### Instrument your code for full App tracking {#instrument-your-code-for-full-app-tracking}

There are several tracking APIs provided in the [AMS Phonegap Plugin API.](https://experienceleague.adobe.com/docs/mobile-services/ios/phonegap-ios/phonegap-methods.html)

These will allow you to track states and actions such as where pages your users are navigating to in your app, which controls are being used the most. The easiest way to instrument you app for tracking is to make use of the Analytics APIs provided by the AMS plugin.

* ADB.trackState()
* ADB.trackAction()

For reference you can take a look at the code in the Geometrixx Outdoors app. In the Geometrixx Outdoors app all of the page navigations are tracked using the ADB.trackState() method. For further details take a look at the source code for /libs/mobileapps/components/angular/ng-page/clientlibs/app-navigation.js

By instrumenting your source code with these method calls you are able to collect full metrics against your application.

#### Properties for Connecting to AMS {#properties-for-connecting-to-ams}

*com.adobe.cq.mobile.mobileservices.impl.service.MobileServicesHttpClientImp*l exposes the following properties for connecting to AMS:

| **Label** |**Description** |**Default** |
|---|---|---|
| API Endpoint |The base URL of the Adobe Mobile Services HTTP APIs |https://api.omniture.com |
| Config Endpoint |The URL used to retrieve the ADB Mobile Config for the given report suite id |/ams/1.0/app/config/ |
| Mobile Service Apps |Get a list of apps within the users company |/ams/1.0/apps |
