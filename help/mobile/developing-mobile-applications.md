---
title: Developing Mobile Applications in AEM
seo-title: Developing Mobile Applications in AEM
description: Follow this page to start developing mobile application in AEM using Adobe PhoneGap Enterprise.
seo-description: Follow this page to start developing mobile application in AEM using Adobe PhoneGap Enterprise.
uuid: d8442447-ee04-4bb2-a0d7-17dcc8979dba
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
topic-tags: developing-adobe-phonegap-enterprise
discoiquuid: fd7bcf17-af7e-4bd6-8137-48401d9743c5
exl-id: cf8ba05c-6dcd-4880-b8bf-72382118cd80
---
# Developing Mobile Applications in AEM {#developing-mobile-applications-in-aem}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (e.g. React). [Learn more](/help/sites-developing/spa-overview.md).

AEM leverages Adobe PhoneGap and Adobe Publishing Solutions, allowing you to create and manage both content-rich and utility-based cross-platform mobile applications:

* Manage all your companies mobile apps in one place.
* Review apps in development and staging environments without the complexities of provisioning profiles and the extra effort to build and upload your app for sharing.
* Use the AEM authoring environment to create and manage rich content for your apps.
* Use the HTML5 with Adobe PhoneGap to create rich experiences with device-native capabilities.
* Introduce HTML5 Webviews to new or pre-existing **native** applications through Cordova WebViews.
* Create, curate and share rich multimedia content across all delivery channels including, web, mobile-web, mobile-app and print.

AEM integrates with the Adobe PhoneGap Build service (`https://build.phonegap.com/`) to simplify the application build and deploy process.

**Adobe ContentSync** enables users to easily download page and content updates Over-the-Air (OTA) to their devices without having to re-install the application or download from the appStore, Google Play, or other app sources.

**Adobe Analytics** is fully integrated into AEM apps and allows detailed tracking of distribution, geolocation, operating systems, devices, click-streams, iBeacon tracking and more.

## Creating Apps {#creating-apps}

Developers can use the [AEM PhoneGap Starter Kit](https://github.com/Adobe-Marketing-Cloud/aem-phonegap-starter-kit) along with additional resources found in [https://github.com/adobe-marketing-cloud-apps](https://github.com/adobe-marketing-cloud-apps) to bootstrap AEM apps with PhoneGap, including a reference native app running Cordova Webviews.

The readme for the Starter Kit Git repository includes a tutorial for using the starter kit:

* Customize the branding
* Maven sample build and deployment targets
* Source control repository configuration
* Install and deploy into local or remote AEM instances
* Uninstall from AEM

>[!NOTE]
>
>Additional reference implementation source, including labs, can be found on GitHub [here](https://github.com/adobe-marketing-cloud-apps) and, the "kitchen-sink" source [here](https://github.com/blefebvre/aem-phonegap-kitchen-sink).

## Developing for IOS 9 and HTTP hosts {#developing-for-ios-and-http-hosts}

IOS developers should be aware of an open issue with Cordova apps running on iOS 9. This issue prevents requests from being made to insecure hosts (such as *http://localhost:4502*). This issue will be resolved with an upcoming release of cordova-ios (consumed by the Cordova CLI), but in the meantime there are two workarounds available:

1. As an immediate workaround, you can still use any of the iOS 8 simulators without issue.
1. If you must use iOS 9, your apps -Info.plist (found after running `cordova platform add ios` in "&lt;app root&gt;/platforms/ios/&lt;app name&gt;/&lt;app name&gt;-Info.plist") file can be manually edited to include the following property:

```
<key>NSAppTransportSecurity</key>

<dict>

<key>NSAllowsArbitraryLoads</key> <true/>

</dict>
```

>[!NOTE]
>
>For more detail on "App Transport Security", see the following section of [Apple's iOS9 prerelease docs](https://developer.apple.com/library/prerelease/ios/releasenotes/General/WhatsNewIniOS/Articles/iOS9.html#//apple_ref/doc/uid/TP40016198-SW14) and this [Stack Overflow discussion](https://stackoverflow.com/questions/30751053/ios9-ats-what-about-html5-based-apps/).

## Developing Mobile Applications in AEM {#developing-mobile-applications-in-aem-1}

* [Starting AEM PhoneGap](/help/mobile/starting-aem-phonegap-app.md)
* [Building Mobile Applications](/help/mobile/building-app-mobile-phonegap.md)
* [Structure an App](/help/mobile/phonegap-structure-an-app.md)
* [Creating and Editing Apps Using the Apps Console](/help/mobile/phonegap-apps-console.md)
* [Single Page Applications](/help/mobile/phonegap-single-page-applications.md)
* [Developing Apps with PhoneGap CLI](/help/mobile/phonegap-apps-pg-cli.md)
* [Access Device Features](/help/mobile/phonegap-access-device-features.md)
* [Track App Performance with Adobe Mobile Analytics](/help/mobile/phonegap-intro-to-app-analytics.md)
* [Add Adobe Analytics to your Mobile Application](/help/mobile/phonegap-add-analytics-to-apps.md)
* [Push Notifications](/help/mobile/phonegap-push-notifications.md)
* [AEM Mobile content personalization](/help/mobile/phonegap-aem-mobile-content-personalization.md)
* [The Anatomy of an App](/help/mobile/phonegap-apps-arch.md)
* [Is your hybrid app ready for AEM Mobile?](/help/mobile/phonegap-adding-content-to-imported-app.md)

### Additional Resources {#additional-resources}

To learn about the roles and responsibilities of an Administrator and Developer, see the resources below:

* [Authoring for Adobe PhoneGap Enterprise with AEM](/help/mobile/phonegap.md)
* [Administering Content for Adobe PhoneGap Enterprise with AEM](/help/mobile/administer-phonegap.md)
