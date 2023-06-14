---
title: Set up environment for AEM Forms app
description: Hardware, software, and licenses to build and deploy the AEM Forms app.
uuid: 4123a6b7-5766-476c-9afb-f57029b148ad
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
discoiquuid: e6b01ade-7ea3-42a7-872d-cc35a3d2782a
docset: aem65
exl-id: 1d1f9db2-83cf-4612-ac8c-d2638c3bbaea
---
# Set up environment for AEM Forms app{#set-up-environment-for-aem-forms-app}

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
