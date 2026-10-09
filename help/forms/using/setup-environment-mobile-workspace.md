---
title: Set up environment for AEM Forms app
description: Hardware, software, and licenses to build and deploy the AEM Forms app.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
docset: aem65
exl-id: 1d1f9db2-83cf-4612-ac8c-d2638c3bbaea
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Set up environment for AEM Forms app{#set-up-environment-for-aem-forms-app}

>[!NOTE]
>
>AEM Forms app is currently deprecated. For questions or help, contact [aemformsapp-android@adobe.com](mailto:aemformsapp-android@adobe.com).

You need the following hardware, software, and licenses to build and deploy the AEM Forms app:

## For Windows devices {#for-windows-devices}

* Microsoft&reg; Windows 10
* Microsoft&reg; Visual Studio 2015
* Microsoft&reg; Visual Studio Tools for Apache Cordova

## For iOS devices {#for-ios-devices}

* Intel-based Apple Mac running macOS X 10.9.5 or above
* iOS SDK 8.4 or above
* Xcode version: Xcode 6.4 for OS X or above
* Membership of the iOS Developer Enterprise program
* Enterprise certificate for distributing in-house iOS apps
* Apple iPad with iOS 8.4 or later

## For Android&trade; devices {#for-android-devices}

* Android&trade; Development Toolkit (ADT bundle) that can be downloaded from [https://developer.android.com/studio](https://developer.android.com/studio)
* If the environment is set up on a Mac system, the ADT should be installed in the Applications folder.
* If the ADT is installed in any other location on Mac, or if the environment is set up on a Windows system, the ADT SDK path must be updated in `local.properties` file. This file is available in the `src\android` folder in the extracted the source archive `mobileworkspace-src.zip`. In this file, point the `sdk.dir` variable to ADT SDK location on your desktop.

>[!NOTE]
>
>The adobe-lc-mobileworkspace-src.zip contains PhoneGap SDK 5.0. Ensure that PhoneGap SDK is not pre-installed.
