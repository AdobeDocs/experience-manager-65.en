---
title: Building a secure AEM Forms app for iOS
description: Learn how to build a secure AEM Forms app for iOS by archiving the Xcode project. This creates installer (an .ipa file) and property list (a .plist file) file. 

content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app

exl-id: 12cc2027-ae94-40c3-a7d1-553469426114
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Building a secure AEM Forms app for iOS {#building-a-secure-aem-forms-app-for-ios}

You need to archive the Xcode project for AEM Forms app to build the installer (an .ipa file) and a property list (a .plist file) file. The property list file contains configuration information of the hosted in-house app, such as the name and the hosting location of the app. For more information about property list file, see [About Information Property List Files](https://developer.apple.com/library/ios/#documentation/general/Reference/InfoPlistKeyReference/Articles/AboutInformationPropertyListFiles.html).

1. Log in to the following website:

   [https://developer.apple.com/account/ios/identifier/bundle](https://developer.apple.com/account/ios/identifier/bundle)

1. Create an App ID. For detailed steps to create an App ID, see [Creating and Configuring App IDs](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html).
1. To configure the bundle identifier for the iOS application for your app, click **[!UICONTROL Configure App ID]**.
1. At the bottom of the web page, select **[!UICONTROL Enable for Data Protection]**. Specify the data protection options.

   Click **[!UICONTROL Done]**.

1. Navigate to Provisioning>Distribution and create a New Profile using the App ID configured in step 3.
1. Download and add the provisioning profile to the Xcode and the iPad.
1. Log in to your Mac machine that has Xcode, and iOS SDK installed and configured.
1. Open the `AEM Forms.xcodeproj` project in Xcode.
1. Click **[!UICONTROL AEM Forms]**, under **[!UICONTROL TARGETS]**, select **[!UICONTROL AEM Forms]**. Select the **[!UICONTROL Build Settings]** tab, locate the **[!UICONTROL Code Signing Entitlement]** section and in the Entitlements dropdown, select the **[!UICONTROL LC Enterprise]** option.
1. Locate and open the `LC Enterprise.entitlements` file in the Xcode for editing. Under the **XCode entitlements**, add the same key-value pair as present in your provisioning profile.
1. In the **[!UICONTROL Build Settings]** tab, click **[!UICONTROL All]** and then click **[!UICONTROL Combined]**.
1. From the **[!UICONTROL Settings]** list, expand **[!UICONTROL Code Signing]**.
1. For **[!UICONTROL Code Signing Identity]**, select the appropriate signature. Ensure that the same signature is selected for **[!UICONTROL Debug]**, **[!UICONTROL Release]**, and **[!UICONTROL Any iOS SDK]**.
1. Under **[!UICONTROL PROJECT]**, select **[!UICONTROL AEM Forms]** and ensure that the appropriate signature is selected for **[!UICONTROL Code Signing Identity]**, **[!UICONTROL Debug]**, **[!UICONTROL Release]** and **[!UICONTROL Any iOS SDK]**.
1. Build and Distribute AEM Forms app. For detailed instructions to build and distribute AEM Forms app, see [Build the installer for AEM Forms app](setup-xcode-project-build-installer.md#build-the-installer-for-the-mobile-workspace-app).
