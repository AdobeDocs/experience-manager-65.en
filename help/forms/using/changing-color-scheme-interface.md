---
title: Changing the color scheme of the interface
seo-title: Changing the color scheme of the interface
description: How to modify the color scheme of AEM Forms workspace user interface portions selectively.
seo-description: How to modify the color scheme of AEM Forms workspace user interface portions selectively.
uuid: 32c32f7a-8271-4d2c-8a1f-ad5ab3c90b83
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: 18dab82a-badf-4c32-83a2-cd5cb04cae89
exl-id: e0a261a2-518b-4984-a5b5-24f0b9222e24
---
# Changing the color scheme of the interface {#changing-the-color-scheme-of-the-interface}

You can modify the color scheme of AEM Forms workspace user interface portions to suit your requirements. Following are some examples of representative color scheme customizations. In addition to the steps discussed in this article, see [Generic steps for AEM Forms workspace customization](/help/forms/using/generic-steps-html-workspace-customization.md).

## Top navigation bar {#top-navigation-bar}

### Using background image {#using-background-image}

To update the navigation bar at the top of AEM Forms workspace.

1. Create a background image to update the color. Name the file as newBackground.jpg.
1. Upload the background image file in /apps/ws/images folder using a WebDAV client.

   >[!NOTE]
   >
   >For more information about WebDAV access, see [https://dev.day.com/docs/en/crx/current/how_to/webdav_access.html](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/previous-updates/aem-previous-versions.html?lang=en).

1. Reference the new background image in /apps/ws/css/newStyle.css by adding following style.

   ```css
   #header {
       background:#292929 url(../images/newBackground.jpg) repeat-x;
   }
   ```

### Using color property in CSS {#using-color-property-in-css}

1. Add the following style in newStyle.css at /apps/ws/css

   ```css
   #header {
   background : none;
   background-color: gray;
   }
   ```

## Category component {#category-component}

Category component displays the various categories of your tasks in the left panel. To change its color, define the background color in `.category` element of the CSS file.

## Task component {#task-component}

Tasks are displayed in the middle panel called the TaskList Component. To change its color, modify the style associated with .task selector in the style sheet.
