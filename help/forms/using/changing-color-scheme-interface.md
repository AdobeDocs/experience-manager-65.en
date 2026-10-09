---
title: Changing the color scheme of the interface
description: How to modify the color scheme of AEM Forms workspace user interface portions selectively.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: e0a261a2-518b-4984-a5b5-24f0b9222e24
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
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
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
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
   >For more information, see [WebDAV Access](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/webdav-access.html?lang=en).

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
