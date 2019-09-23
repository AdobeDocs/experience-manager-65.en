---
title: Implementing Android Player
seo-title: Implementation of Android Player
description: Follow this page to learn implementation of Android Watchdog, a solution to recover the player from crashes. 
seo-description: Follow this page to learn implementation of Android Watchdog, a solution to recover the player from crashes. 
uuid: 69328266-00de-49ce-a4a9-91e4751225bf
contentOwner: Jyotika syal
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/SCREENS
topic-tags: administering
discoiquuid: 4e0f800e-830b-4a69-b45e-5ca3008e028a
index: y
internal: n
snippet: y
---

# Implementing Android Player{#implementing-android-player}

This section describes configuring Android player. It provides information of the configuration file and the options available and recommendations as to which settings to use for development and testing.

Additionally,*** ******Watchdog*** is a solution to recover the player from crashes. An application needs to register itself with the watchdog service and then periodically send messages to the service that it is alive. In case the watchdog service does not receive a keep-alive message within a stipulated time, the service attempts to reboot the device for a clean recovery (if it has the sufficient privileges) or restart the application.

## Installing Android Player {#installing-android-player}

To implement Android Player for AEM Screens, please install Android Player for AEM Screens.

Visit the [**AEM 6.4 Player Downloads**](https://download.macromedia.com/screens/) page.

### Ad-Hoc Method {#ad-hoc-method}

The Ad-Hoc method allows you to install the latest Android Player (*.exe*). Visit [**AEM 6.4 Player Downloads**](https://download.macromedia.com/screens/) page.

Once you download the application, follow the steps on the player to complete the ad-hoc installation:

1. Long-press on the top left corner to open the admin panel.
1. Navigate to **Configuration** from the left action menu and enter the location (address) of the AEM instance you wish to connect to and click **Save**.

1. Navigate to the **Device** **Registration** link from the left action menu to check the status of the the device registration process.

>[!NOTE]
>
>If the **State** is **REGISTERED**, you will notice the **Device id** field will be populated.
>
>If the **State** is **UNREGISTERED**, you can use the **Token** to register the device.

## Implementing Android Watchdog {#implementing-android-watchdog}

Due to Android's architecture, rebooting the device requires that the application has system privileges. To do this, you need to sign the apk using the manufacturer's signing keys, otherwise watchdog will restart the player application and not reboot the device.

### Signage of Android apks using Manufacturer Keys {#signage-of-android-apks-using-manufacturer-keys}

To access some of the privileged APIs of Android such as *PowerManager* or *HDMIControlServices*, you need to sign the the android apk using the manufacturer's keys.

>[!CAUTION]
>
>Pre-requisites:
>
>You should have the android SDK installed, before you perform the following steps.

Follow the steps below to sign the android apk using the manufacturer's keys:

1. Download the apk from Google Play or from [AEM Screens Player Downloads](http://download.macromedia.com/screens/) page
1. Obtain the platform keys from the manufacturer to get a *pk8* and a *pem* file

1. Locate the apksigner tool in android sdk using find ~/Library/Android/sdk/build-tools -name "apksigner"
1. &lt;pathto&gt; /apksigner sign --key platform.pk8 --cert platform.x509.pem aemscreensplayer.apk
1. Find the path to the zip align tool in android sdk
1. &lt;pathto&gt; /zipalign -fv 4 aemscreensplayer.apk aemscreensaligned.apk
1. Install ***aemscreensaligned.apk*** using adb install to the device

## Android Watchdog Implementation {#android-watchdog-implementation}

The cross-Android watchdog service is implemented as a cordova plugin using *AlarmManager*.

The following diagram shows the implementation of watchdog service:

![](assets/chlimage_1-31.png)

**1. Initialization** At the time of initialization of the cordova plugin, permissions are checked to see if we have system privileges and thus the Reboot permission. If these two criteria are met, a pending Intent for Reboot is created, otherwise a pending Intent to restart the application (based on its Launch Activity) is created.

**2. Keep Alive Timer** A keep alive timer is used to trigger an event every 15 seconds. In that event, you need to cancel the existing pending intent (to reboot or restart the app) and register a new pending intent for the same 60 seconds in the future (essentially postponing reboot).

>[!NOTE]
>
>In Android, the *AlarmManager* is used to register the *pendingIntents* that can execute even if the app has crashed and its alarm delivery is inexact from API 19 (Kitkat). Keep some spacing between the timer's interval and the *AlarmManager's* *pendingIntent's* alarm.

**3. Application Crash** In case of a crash, the pendingIntent for Reboot registered with AlarmManager is no longer reset and thus it executes a reboot or restart of app (depending on permissions available at the time of initialization of the cordova plugin).
