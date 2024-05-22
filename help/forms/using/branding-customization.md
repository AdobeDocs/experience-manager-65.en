---
title: Branding Customization

description: Customize the application icon, application name, launch images, and login page to provide a distinct organization-specific look and feel to AEM Forms app.


contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app

exl-id: 9333705b-9944-4a74-a30f-7d9ec85fd824
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Branding Customization {#branding-customization}

You can customize the application icon, application name, launch images, and login page to provide a distinct organization-specific appearance to AEM Forms app. For example, you can change the images to use logos from your organization. The AEM Forms app supports the following customizations:

* Customizing application icon and launch images
* Customizing app name
* Customizing images on the login page
* Customizing the logo in the app menu

## Customizing icon and launch images {#customizing-icon-and-launch-images}

Perform the following steps to customize the default app icon and the launch image of the AEM Forms app:

>[!NOTE]
>
>For all the icons and images, use non-interlaced PNG format.

### To customize icon and launch images {#to-customize-icon-and-launch-images}

#### For iOS {#for-ios}

1. Open the `Capture.xcodeproj` project in Xcode.
1. (***For customizing icon***) In the navigator view of Capture, navigate to **[!UICONTROL Capture > Capture > Supporting Files > Capture-info.plist]**. Click the drop-down next to the Icon files. Specify the name of the icon file (.png) and upload the file at **[!UICONTROL Capture > Capture > Resources > icons]**. Currently supported dimesions are: 29x29, 50x50, 58x58, 72x72, 100x100, and 144x144.
1. (***For customizing launch images***) Ensure that the filenames of your images are:

    * For portrait: `Default-Portrait~ipad.png` and `Default-Portrait@2x~ipad.png`
    * For landscape: `Default-Landscape~ipad.png` and `Default-Landscape@2x~ipad.png`

   Upload them to the Capture project to replace existing files in the project.

   >[!NOTE]
   >
   >Ensure that the name and resolution of your image matches the image you replace in the project.

1. Build and run AEM Forms app on iOS device or iOS simulator.

#### For Android {#for-android}

1. Name the application icon files as:

   `ic_launcher.png`

1. Place the corresponding icon files in the following directories:

    * `[User_Home]/Projects/[your-project]/src/android/res/drawable-hdpi`
    * `[User_Home]/Projects/[your-project]/src/android/res/drawable-mdpi`
    * `[User_Home]/Projects/[your-project]/src/android/res/drawable-xhdpi`
    * `[User_Home]/Projects/[your-project]/src/android/res/drawable-xxhdpi`
    * `[User_Home]/Projects/[your-project]/src/android/res/drawable-xxxhdpi`

   >[!NOTE]
   >
   >Ensure that the name and resolution of your image matches the image you replace in the project.

1. Rebuild the AEM Forms app.

### For Windows {#for-windows}

1. Replace the icons in the path:

   `%HOMEPATH%\adobe-lc-mobileworkspace-src-<version>\src\windows\MWSWindows\res\icons\windows`

1. Replace the launcher image in the path:

   `%HOMEPATH%\adobe-lc-mobileworkspace-src-<version>\src\windows\MWSWindows\res\screens\windows`

   >[!NOTE]
   >
   >Ensure that the name and resolution of your image matches the image you replace in the project.

1. Rebuild the AEM Forms app.

## Customize the app name {#customize-the-app-name}

### For iOS {#for-ios-1}

1. Open the `Capture.xcodeproj` project in Xcode.
1. In the navigator view of Capture, navigate to **[!UICONTROL Capture > Capture > Supporting Files > InfoPlist.strings]**.

   Update the value for the `CFBundleDisplayName` attribute to a name you want to display for the app.

1. Build and run AEM Forms app on iOS device or iOS simulator.

   For details on building the app for iOS, see [Set up the Xcode project and build the iOS app](/help/forms/using/setup-xcode-project-build-installer.md).

### For Android {#for-android-1}

1. Open the following Xml in any text or Xml editor:

   `[User_Home]/Projects/[your-project]/src/android/res/values/strings.xml and android/res/values-en/strings.xml`

1. Update the value for the key `app_name`.
1. Rebuild the AEM Forms app.

   For details on building the app for Android, see [Set up the Eclipse project and build the Android app](/help/forms/using/setup-eclipse-project-build-installer.md).

### For Windows {#for-windows-1}

1. Open the following Xml in any text editor:

   `%HOMEPATH%\adobe-lc-mobileworkspace-src-<version>\src\windows\MWSWindows\config.xml`

1. Update the value in the `<name>...</name>` tag.
1. Rebuild the AEM Forms app.

   For details on building the app for Windows, see [Set up the Visual Studio project and build the Windows app](/help/forms/using/setup-visual-studio-project-build-installer.md).

## Customizing images on the login page {#customizing-images-on-the-login-page}

The login page of the AEM Forms app has logo and background images. The logo is located above the login dialog box and background image is located below the login dialog box. Perform the following steps to customize the default image on the login page:

**Before you start**

Ensure that you have following images:

<table>
 <tbody>
  <tr>
   <th><p>Description</p> </th>
   <th><p>Size</p> </th>
   <th><p>Filename</p> </th>
  </tr>
  <tr>
   <td><p>Logo</p> </td>
   <td><p>72 x 72 pixel</p> </td>
   <td><p>LC-logo.png</p> </td>
  </tr>
  <tr>
   <td><p>Background image (Portrait)</p> </td>
   <td><p>1280 x 989 pixel</p> </td>
   <td><p>Landing_bg.jpeg</p> </td>
  </tr>
 </tbody>
</table>

**To customize images on the login page using Xcode**

1. Open the `Capture.xcodeproj` project in Xcode.

1. Navigate to the `www/wsmobile/images`folder.
1. To change logo, replace the default `LC-logo.png` file with the custom `LC-logo.png` file.
1. To change background, replace the default `Landing_bg.jpeg` file with the custom `Landing_bg.jpeg`file.
1. Build and run AEM Forms app on iOS device or iOS simulator.

### To customize images on the login pages using Eclipse {#to-customize-images-on-the-login-pages-using-eclipse}

1. Open the Android project in Eclipse.

1. Navigate to the `assets/www/wsmobile/images`folder.
1. To change logo, replace the default `LC-logo.png` file with the custom `LC-logo.png` file.
1. To change background, replace the default `Landing_bg.jpeg` file with the custom `Landing_bg.jpeg`file.
1. Build and run AEM Forms app on Android device.

### To customize images on the login pages using Visual Studio {#to-customize-images-on-the-login-pages-using-visual-studio}

1. Open the `MWSWindows.sln` project in Visual Studio.

1. Navigate to the `MWSWindows\www\wsmobile\images`folder.
1. To change logo, replace the default `LC-logo.png` file with the custom `LC-logo.png` file.
1. To change background, replace the default `Landing_bg.jpeg` file with the custom `Landing_bg.jpeg`file.
1. Build and run AEM Forms app on Windows device.

## Customizing the logo in the app menu {#customizing_images_on_the_login_page-1}

After you login to the AEM Forms app and select the menu button, you can see the logo above the menu. Perform the following steps to customize the default logo:

**Before you start**

Ensure that you have following image:

<table>
 <tbody>
  <tr>
   <th><p>Description</p> </th>
   <th><p>Size</p> </th>
   <th><p>Filename</p> </th>
  </tr>
  <tr>
   <td><p>Logo</p> </td>
   <td><p>72 x 72 pixel</p> </td>
   <td><p>aem_icon.png</p> </td>
  </tr>
 </tbody>
</table>

**To customize images on the login page using Xcode**

1. Open the `Capture.xcodeproj` project in Xcode.

1. Navigate to the `www/wsmobile/images`folder.
1. To change the logo, replace the default `aem_icon.png` file with the custom `aem_icon.png` file.
1. Build and run AEM Forms app on iOS device or iOS simulator.

### To customize images on the login pages using Eclipse {#to-customize-images-on-the-login-pages-using-eclipse-1}

1. Open the Android project in Eclipse.

1. Navigate to the `assets/www/wsmobile/images`folder.
1. To change the logo, replace the default `aem_icon.png` file with the custom `aem_icon.png` file.
1. Build and run AEM Forms app on Android device.

### To customize images on the login pages using Visual Studio {#to-customize-images-on-the-login-pages-using-visual-studio-1}

1. Open the `MWSWindows.sln` project in Visual Studio.

1. Navigate to the `MWSWindows\www\wsmobile\images`folder.
1. To change the logo, replace the default `aem_icon.png` file with the custom `aem_icon.png` file.
1. Build and run AEM Forms app on Windows device.
