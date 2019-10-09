---
title: Implementing Android Player
seo-title: Implementation of Android Player
description: Follow this page to learn implementation of Android Watchdog, a solution to recover the player from crashes. 
seo-description: Follow this page to learn implementation of Android Watchdog, a solution to recover the player from crashes. 
uuid: 37527a6a-dcc5-4256-abeb-e1f95ff80be4
contentOwner: Jyotika syal
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/SCREENS
topic-tags: administering
discoiquuid: e6ec1641-4323-4c79-b932-b857feb1df21
---

# Implementing Android Player {#implementing-android-player}

A ***Watchdog*** is a solution to recover the player from crashes. An application needs to register itself with the watchdog service and then periodically send messages to the service that it is alive. In case the watchdog service does not receive a keep-alive message within a stipulated time, the service attempts to reboot the device for a clean recovery (if it has the sufficient privileges) or restart the application.

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

1. Download the apk from Google Play or from [AEM Screens Player Downloads](https://download.macromedia.com/screens/) page
1. Obtain the platform keys from the manufacturer to get a *pk8* and a *pem* file

1. Locate the apksigner tool in android sdk using find ~/Library/Android/sdk/build-tools -name "apksigner"
1. &lt;pathto&gt; /apksigner sign --key platform.pk8 --cert platform.x509.pem aemscreensplayer.apk
1. Find the path to the zip align tool in android sdk
1. &lt;pathto&gt; /zipalign -fv 4 aemscreensplayer.apk aemscreensaligned.apk
1. Install ***aemscreensaligned.apk*** using adb install to the device

## Android Watchdog Implementation {#android-watchdog-implementation}

The cross-Android watchdog service is implemented as a cordova plugin using *AlarmManager*.

The following diagram shows the implementation of watchdog service:

![chlimage_1-43](assets/chlimage_1-43.png)

**1. Initialization** At the time of initialization of the cordova plugin, permissions are checked to see if we have system privileges and thus the Reboot permission. If these two criteria are met, a pending Intent for Reboot is created, otherwise a pending Intent to restart the application (based on its Launch Activity) is created.

**2. Keep Alive Timer** A keep alive timer is used to trigger an event every 15 seconds. In that event, you need to cancel the existing pending intent (to reboot or restart the app) and register a new pending intent for the same 60 seconds in the future (essentially postponing reboot).

>[!NOTE]
>
>In Android, the *AlarmManager* is used to register the *pendingIntents* that can execute even if the app has crashed and its alarm delivery is inexact from API 19 (Kitkat). Keep some spacing between the timer's interval and the *AlarmManager's* *pendingIntent's* alarm.

**3. Application Crash** In case of a crash, the pendingIntent for Reboot registered with AlarmManager is no longer reset and thus it executes a reboot or restart of app (depending on permissions available at the time of initialization of the cordova plugin).
