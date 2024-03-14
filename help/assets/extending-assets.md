---
title: Customize and extend [!DNL Assets]
description: Learn ways by which you can customize and extend Asset Share and Asset Editor, which presents users with a specifically tailored interface and set of functionality.
contentOwner: AG
role: Developer
feature: Developer Tools
exl-id: 0271c528-23b0-4a3a-b5e8-5baf6cdeecc7
solution: Experience Manager, Experience Manager Assets
---
# Customize and extend [!DNL Assets] {#customizing-and-extending-assets}

The Asset Editor is the primary point of access that users of an Adobe Enterprise Manager website use to find, view, and manipulate the digital assets in your repository.

As an [!DNL Experience Manager] developer, you can customize and extend the Asset Editor in several ways, presenting users with a specifically tailored interface and set of functionality.

The following aspects of the functionality can be customized or enhanced:

* [Extend Asset Editor](asseteditorx.md)
* [Extend Assets Search](searchx.md)
* [Process Assets Using Media Handlers and Workflows](media-handlers.md)
* [Integrate Assets with activity stream](extending-activity-stream.md)
* [Assets proxy development](proxy.md)
* [Best practices to configure ImageMagick](best-practices-for-imagemagick.md)

## Customize the appearance {#customizing-the-look-and-feel}

The following aspects of the look and feel of the Asset Editor are customizable:

* Logo: You can add your own organization's logo to the interface.
* Colors and Fonts: You can change the colors and fonts used in the interface.
* HTML Code: For more thorough customization you can change the underlying HTML code that defines the interfaces.

## Customize renditions {#customizing-renditions}

In [!DNL Experience Manager Assets] terminology a rendition is the form in which an asset is presented. In general, a particular asset may have multiple renditions. For example, full-color image may have one rendition in its original size, another at a scaled-down size and another that is both scaled down and converted to grayscale.

The renditions that a particular asset is available in can be customized and new renditions created.
