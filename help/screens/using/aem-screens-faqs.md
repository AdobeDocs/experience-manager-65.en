---
title: AEM Screens FAQs
seo-title: AEM Screens FAQs
description: Follow this page to get answers to FAQs related to an AEM Screens project.
seo-description: Follow this page to get answers to FAQs related to an AEM Screens project.
uuid: 62e58f3b-0c0a-4006-b6d5-42d2090f47b5
contentOwner: jsyal
products: SG_EXPERIENCEMANAGER/6.5/SCREENS
content-type: reference
topic-tags: troubleshoot
discoiquuid: e612486e-cd3a-4053-a3f7-96bd1f76cd89
docset: aem65

---

# AEM Screens FAQs{#aem-screens-faqs}

The following section provides answers to few of the commonly asked FAQs related to an AEM Screens project.

## Channel Management {#channel-management}

### 1. What is the difference between an online and an offline channel? {#what-is-the-difference-between-an-online-and-an-offline-channel}

An ***Online Channel***, will show the updated content in the real time environment whereas an ***Offline Channel***, shows the cached content.

### 2. How do I make a channel online? {#how-do-i-make-a-channel-online}

Select the channel and navigate to channel properties from the action bar. Check **Developer mode (force channel to be online)** under **Channel** tab to make the channel online.

### 3. What is the use of the Channel Role field? {#what-is-the-use-of-the-channel-role-field}

The Channel Role, is the abstraction of the actual channel that is run so that the author can focus on the generic experience directly. You can think of it as a kind of tag that uniquely identifies the channel in its context (display or schedule).

### 4. How does actual channel resolution happen? {#how-does-actual-channel-resolution-happen}

For *static references*, the resolution just follows the path that is specified.

For *dynamic references*, the resolution occurs once the channel is assigned to the display (not the schedule). The display path becomes the context for the channel and the resolution happens as follows (highest to lowest priority):

1. The display has a child node that matches the referenced channel name
1. The display has a sibling node that matches the referenced channel name
1. The parent location of the display has a child node that matches the referenced channel name
1. The grand-parent location of the display has a child node that matches the referenced channel name

And so on, until you reach the locations folder and stop there at the moment (so you cannot reference a channel that would be in the channels folder for instance, only channels in the locations sub-tree).

### Device Registration {#device-registration}

#### 1. If I discover endpoints such as requests for device onboarding and registration, I can script a large number of devices and register these devices. Besides locking this to a branch Wi-Fi, is it possible to secure these requests? {#if-i-discover-endpoints-such-as-requests-for-device-onboarding-and-registration-i-can-script-a-large-number-of-devices-and-register-these-devices-besides-locking-this-to-a-branch-wi-fi-is-it-possible-to-secure-these-requests}

Currently Registration is only possible on the author instance. Although the registration service is unauthenticated it will only create a pending device in AEM and will not actually register the device or assign any display.

To register a device (which means creating a user for the device in AEM), you still need to authenticate to AEM and currently manually follow the registration wizard to complete registration. Theoretically, a malicious user may create several pending devices but cannot register any without an AEM login.

#### 2. Is there a way to transform HTTP GET requests into HTTP POST with some form of authentication? {#is-there-a-way-to-transform-http-get-requests-into-http-post-with-some-form-of-authentication}

The registration request is a POST request.

It is recommended to obtain the device ID from the session rather than passed as parameter. This would clean up the server logs, browser cache, and so on. It is currently not a security issue. Please note that semantically GET is used when there is no state change on the server and POST is used when there is a state change.

#### 3. Is there a way to decline a device registration request? {#is-there-a-way-to-decline-a-device-registration-request}

You cannot decline the registration requests. Instead the registration requests should expire after a timeout that is configured in [Adobe Experience Manager Web Console](http://localhost:4502/system/console/configMgr/com.adobe.cq.screens.device.registration.impl.RegistrationServiceImpl). By default, this value is set to one day and is stored in a memory cache.

### Device Monitoring and Health Reports {#device-monitoring-and-health-reports}

#### 1. How do I troubleshoot, if my AEM Screens player shows blank screen? {#how-do-i-troubleshoot-if-my-aem-screens-player-shows-blank-screen}

Please check for the following possibilities to troubleshoot the blank screen issue:

* AEM is unable to push the Offline Content  
* Channel does not have any content
* None of the assets are scheduled to show at current time

#### 2. What do I do if AEM Screens player cannot register and its state is displayed as Failure? {#what-do-i-do-if-aem-screens-player-cannot-register-and-its-state-is-displayed-as-failure}

You need to enable the Apache Sling Referrer Filter Allow Empty. This is required for optimal operation of the control protocol between AEM Screens Player and AEM Screens server.

1. Navigate to **Adobe Experience Manager Web Console Configuration**
1. Check the **allow.empty **option.
1. Click **Save**.

#### 3. How to troubleshoot if while registering an AEM Screens player, device shows FAILURE and the console logs display ENAME_NOT_FOUND error? {#how-to-troubleshoot-if-while-registering-an-aem-screens-player-device-shows-failure-and-the-console-logs-display-ename-not-found-error}

This issue may occur if the player is unable to find the AEM Screens Server DNS. You can try using the IP address to connect. To obtain the IP of server, use: *arp &lt;server_dns_name&gt;*.

#### 4. Does AMS recommend implementing an Android Watchdog on all Devices? Is the Watchdog (Cordova) plugin included as part of the APK? {#does-ams-recommend-implementing-an-android-watchdog-on-all-devices-is-the-watchdog-cordova-plugin-included-as-part-of-the-apk}

A cross platform Android watchdog using pure Android APIs is already a part of the apk. No additional software is needed but depending on the device you use, you may need to resign the apk to obtain system privileges for a full power cycle (Powermanager api). If it is not resigned using the manufacturer keys, it will quit and restart the application but not power cycle.

For more information on how to implement Android Player, please refer to [**Implementing Android Player**](../../screens/using/implementing-android-player.md).

#### 5. What third-party remote monitoring and alerting tools (software) does Adobe/AMS recommend for monitoring each device?  {#what-third-party-remote-monitoring-and-alerting-tools-software-does-adobe-ams-recommend-for-monitoring-each-device}

Depending on what you desire out of the monitoring and alerts, a new feature AEM Screens Notifications service notifies you if a device has not pinged in a while. The third-party tools will depend on your Operating System (OS), its capabilities and the customer’s specific needs.

For more information on where you can monitor device activity, please refer to [**AEM Screens Notifications Service**](/screens/using/screens-notifications-service.md).

### AEM Screens Player {#aem-screens-player}

#### 1. How to Install ChromeOS player as Chrome Browser Plugin? {#how-to-install-chromeos-player-as-chrome-browser-plugin}

ChromeOS player can be installed as Chrome Browser plugin in developer mode without requiring actual chrome player device. For installation, follow the steps below:

1. Click [here](https://download.macromedia.com/screens/)**** to download the latest Chrome Player.
1. Unzip and save it on disk.
1. Open Chrome browser and click the 3-dots menu and select **More Tools** --&gt; **Extensions** from the top right corner or directly navigate to ***chrome://extensions***.
1. Switch on the **Developer mode** from top right corner.
1. Click on **Load Unpacked **from top left corner and load unzipped Chrome Player.  
1. Check **AEM Screens Chrome Player** plugin if is available in the list of extensions.
1. Open a new tab and click the **Apps** icon from the top left corner, or directly navigate to ***chrome://apps***.
1. Click on **AEM Screens** Plugin to launch Chrome Player. By default, the player is launched in full screen mode. Press **esc** to exit full screen mode.

#### 2. How to troubleshoot if Screens player is unable to authenticate through publish instance with custom error handler? {#how-to-troubleshoot-if-screens-player-is-unable-to-authenticate-through-publish-instance-with-custom-error-handler}

When AEM Screens player starts, it makes a request to ***/content/screens/svc.ping.json***, when the player gets a 404 error. The player initiates an authentication request to authenticate against the publish instance. If there is a custom error handler in publish instance, please make sure that you return the 404 status code for anonymous user on ***/content/screens/svc.ping.json***.

#### 3. How to set the device screen stay on in an Android Player? {#how-to-set-the-device-screen-stay-on-in-an-android-player}

Follow the steps below to turn on Stay Awake in on any Android player:

1. Navigate to Android player settings --&gt; **About** 
1. Tap 7 times on the build number to enable **Developer Options** in **Settings**
1. Navigate to **Developer Options**
1. Enable **Stay Awake**

### General Troubleshooting Tips {#general-troubleshooting-tips}

#### How to Disable Livefyre to avoid A/P Screens Error? {#how-to-disable-livefyre-to-avoid-a-p-screens-error}

In order to disable Livefyre to avoid log errors :

1. ***Disable Livefyre bundle:***

    * Navigate to *http://&lt;host&gt;:&lt;port&gt;/system/console/bundles,*
    * Search for the AEM Livefyre bundle: **com.adobe.cq.social.cq-social-livefyre** 
    * Click **Stop**.

1. ***Disable Livefyre poller:***

    * In CRXDE Lite, navigate to **/etc/importers/polling/livefyre-poller/jcr:content** 
    * Add a new property *enabled* type *Boolean* 
    * Set **enabled property** to **false**.

