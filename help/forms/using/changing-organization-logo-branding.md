---
title: Changing the organization logo for branding
seo-title: Changing the organization logo for branding
description: To brand AEM Forms workspace provide the logo of your organization by customizing the default logo.
seo-description: To brand AEM Forms workspace provide the logo of your organization by customizing the default logo.
uuid: f0c340ee-2e54-4bb0-9c30-383cc1bbadb8
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: 2c651302-f4ef-4211-b897-f5942ed0ffb1
exl-id: 49572f2a-f3ec-4ee6-98b8-2563de1cf96c
---
# Changing the organization logo for branding {#changing-the-organization-logo-for-branding}

The organization logo is displayed at the upper-left corner of AEM Forms workspace. To update the logo, follow the [Generic steps of AEM Forms workspace customization](/help/forms/using/generic-steps-html-workspace-customization.md#generic-steps-for-html-workspace-customization) and then the following steps.

1. Create a logo and name the file as `NewWorkspace.png`. Place the image file in /apps/ws/images folder using a WebDAV client.

   >[!NOTE]
   >
   >The recommended size of the logo image is 218 px × 20 px.

   >[!NOTE]
   >
   >For more information about WebDAV access, see [https://dev.day.com/docs/en/crx/current/how_to/webdav_access.html](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/previous-updates/aem-previous-versions.html?lang=en).

1. Reference the new logo image in style sheet at /apps/ws/css/newStyle.css by adding following style.

   ```css
   #logo {

          background: url(../images/NewWorkspace.png) no-repeat 14px 11px;

   }
   ```
