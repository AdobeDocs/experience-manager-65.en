---
title: Set up the Xcode project and build the iOS app

description: Explains how to build standard AEM Forms app for iOS.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app

docset: aem65
exl-id: 78ce6107-8821-47d6-86ab-7ab968945e7c
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Set up the Xcode project and build the iOS app{#set-up-the-xcode-project-and-build-the-ios-app}

AEM Forms provides the complete source code of the AEM Forms app. The source contains all components to build custom AEM Forms app. The source code archive, `adobe-lc-mobileworkspace-src-<version>.zip` is a part of the `adobe-aemfd-forms-app-src-pkg-<version>.zip` package on Software Distribution.

To get the AEM Forms app source, perform the following steps:

1. Open [Software Distribution](https://experience.adobe.com/downloads). You require an Adobe ID to log in to the Software Distribution.
1. Select **[!UICONTROL Adobe Experience Manager]** available in the header menu.
1. In the **[!UICONTROL Filters]** section:
   1. Select **[!UICONTROL Forms]** from the **[!UICONTROL Solution]** drop-down list.
   2. Select the version and type for the package. You can also use the **[!UICONTROL Search Downloads]** option to filter the results.
1. Select the package name applicable to your operating system, select **[!UICONTROL Accept EULA Terms]**, and select **[!UICONTROL Download]**.
1. Open [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html)  and click **[!UICONTROL Upload Package]** to upload the package.
1. Select the package and click **[!UICONTROL Install]**.

1. To download the source code archive, open `https://<server>:<port>/crx/de/content/forms/mobileapps/src/adobe-lc-mobileworkspace-src-<version>.zip` in your browser.
   The source package is downloaded on your device.

The following image displays the extracted contents of the `adobe-lc-mobileworkspace-src-<version>.zip`.

![mws-content](assets/mws-content.png)

The following table details contents of the `adobe-lc-mobileworkspace-src-[version]/ios` folder.

<table>
 <tbody>
  <tr>
   <th><p>Directory</p> </th>
   <th><p>Content</p> </th>
  </tr>
  <tr>
   <td><p><code>CordovaLib</code></p> </td>
   <td><p>PhoneGap SDK 6.4.0</p> </td>
  </tr>
  <tr>
   <td><p><code>AEM Forms</code></p> </td>
   <td><p>Resources, PhoneGap plug-ins, and application's main module</p> </td>
  </tr>
  <tr>
   <td><p><code>AEM Forms.xcodeproj</code></p> </td>
   <td><p>Xcode project for AEM Forms app</p> </td>
  </tr>
  <tr>
   <td><p><code>www</code></p> </td>
   <td><p>HTML, CSS, images, and JavaScript files for the AEM Forms app project</p> </td>
  </tr>
 </tbody>
</table>

For detailed information about Code Signing and adding devices to the iOS Provisioning Portal, see [iOS Code Signing Setup, Process, and Troubleshooting](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingCertificates/MaintainingCertificates.html).

## Build standard AEM Forms app {#set-up-the-xcode-project}

1. Perform the following steps to set up a project in Xcode and provide a signing identity:

   Log in to your Mac machine that has Xcode and iOS SDK installed and configured.

1. Copy the `adobe-lc-mobileworkspace-src-<version>.zip` archive from the downloads folder to `[User_Home]/Projects/`.
1. Extract the archive in the `[User_Home]/Projects/[your-project]`directory.
1. Navigate to the ` [User_Home]/Projects/ `[your-project]`/adobe-lc-mobileworkspace-src-[version]/ios` directory.
1. Open the `AEM Forms.xcodeproj` project in Xcode.
1. Click **AEM Forms**, under **TARGETS**, select **AEM Forms**. Select the **Build Settings** tab, locate the **Code Signing Entitlement** section, and in Debug and Release fields do one of the following:

    * Leave the fields unspecified to build a standard Mobile Workspace app
    * Specify the fields to as explained in [Building a Secure AEM Forms app for iOS](/help/forms/using/building-secure-mobile-workspace-app.md) to build a secure AEM Forms app.

1. In the **Build Settings** tab, click **All** and then click **Combined**.
1. From the **Settings** list, expand **Code Signing**.
1. For **Code Signing Identity**, select the appropriate signature. For detailed information about, creating new signatures, see [Creating and Downloading Development Provisioning Profiles](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/CreatingYourTeamProvisioningProfile/CreatingYourTeamProvisioningProfile.html).
1. Ensure that the same signature is selected for **Debug**, **Release**, and **Any iOS SDK**.
1. Replace the following code in the `AEM Forms-info.plist` file:

   ```xml
   <key>NSAppTransportSecurity</key>
   <dict>
   <key>NSAllowsArbitraryLoads</key>
   <true/>
   </dict>
   ```

   with the following while replacing `yourserver.com` with an appropriate host name for your server.

   ```xml
   <key>NSAppTransportSecurity</key>
   <dict>
   <key>NSExceptionDomains</key>
   <dict>
   <key>yourserver.com</key>
   <dict>
   <!-Include to allow subdomains->
   <key>NSIncludesSubdomains</key>
   <true/>
   <!-Include to allow HTTP requests->
   <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
   <true/>
   <!-Include to support forward secrecy->
   <key>NSExceptionRequiresForwardSecrecy</key>
   <false/>
   <!-Include to specify minimum TLS version->
   <key>NSTemporaryExceptionMinimumTLSVersion</key>
   <string>TLSv1.1</string>
   </dict>
   </dict>
   </dict>
   ```

   >[!NOTE]
   >
   >This step is required only if AEM Forms app needs to connect to a server that does not follow App Transport Security requirements.

1. Under **PROJECT**, select **AEM Forms** and ensure that the appropriate signature is selected for **Code Signing Identity**, **Debug**, **Release** and **Any iOS SDK**.
1. Connect a provisioned iPad to a Mac machine.
1. Select the provisioned device for the **AEM Forms** project.

   ![ipad](assets/ipad.png)

   A provisioned device, iPad Air 2, is selected.

1. Select **Product** &gt; **Clean**.
1. Select **Product** &gt; **Build**.

## Build the installer for the AEM Forms app {#build-the-installer-for-the-mobile-workspace-app}

You need to archive the Xcode project to build the installer (an .ipa file) and a property list (a .plist file) file. The property list file contains configuration information of the hosted in-house app, such as the name and the hosting location of the app. For more information about property list file, see [About Information Property List Files](https://developer.apple.com/library/ios/#documentation/general/Reference/InfoPlistKeyReference/Articles/AboutInformationPropertyListFiles.html).

1. Connect a provisioned iPad to a Mac machine. For detailed information about provisioning an iPad, see [Creating and Downloading Development Provisioning Profiles](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/CreatingYourTeamProvisioningProfile/CreatingYourTeamProvisioningProfile.html)
1. Select the provisioned device for the **AEM Forms** project.

   ![ipad-1](assets/ipad-1.png)

   A provisioned device, iPad Air 2, is selected.

1. Select **Product** &gt; **Clean**.
1. Select **Product** &gt; **Build**.
1. Select **Product** &gt; **Archive**.
1. In Organizer - Archives, select the latest archive of your project and click **Distribute**.
1. Select **Save for Enterprise or Ad-Hoc Deployment** as the method of distribution and click **Next**.
1. Select the appropriate **Code Signing Identity** and click **Next**. Click **Allow** to apply the signature.
1. Provide name of the app and select **Save for Enterprise Distribution**.
1. Provide the **Application URL** for the app. For example, to host the app on a CRX server, provide URL `https://[LC_host]:'port'/lc/content/distribution/mobileworkspace/APP_NAME.ipa`.
1. In the **Title** field, specify AEM Forms.
1. Click **Save** and close Xcode.

   An installer file, `AEM Forms.ipa`, and property list file, `AEM Forms-info.plist`, are created at the specified location.

1. Open the `AEM Forms-info.plist` file in an editor.
1. Replace all the spaces in the URL of your .ipa file with %20.
1. Save and close the `AEM Forms-info.plist` file.
