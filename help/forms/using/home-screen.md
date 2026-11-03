---
title: Home screen
description: Description of the components of the AEM Forms app Home screen
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
docset: aem65
exl-id: 6c6fb516-1b11-4da4-b638-4388a070e397
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
# Home screen{#home-screen}

>[!NOTE]
>
>AEM Forms app is currently deprecated. For questions or help, contact [aemformsapp-android@adobe.com](mailto:aemformsapp-android@adobe.com).

When you log in to the AEM Forms app, you are redirected to the Home screen.

## Default Home screen {#default-home-screen}

By default, the Home screen displays all forms including startpoints and tasks (if the connected server is AEM Forms Workflow enabled), along with the associated thumbnails. You can specify the thumbnails in the AEM Forms Server.

The following figure is annotated with call-outs to the essential components on the default Home screen.

![Forms app home screen](assets/home-screen-1.png)

<!--
Click to enlarge

![home-screen-1-1](assets/home-screen-1-1.png)
-->

1. **Menu button**: Select the **Menu** button to navigate to Tasks, Forms, Outbox, and Settings. If your AEM Forms app is connected to an AEM Forms JEE server, you can see the Tasks option. The Tasks option also stores the drafts created from tasks in a process. For AEM Forms OSGi servers, the Tasks option is hidden. Outbox stores the saved forms and drafts before it syncs with the server. All saved forms and drafts in the Outbox are uploaded to the AEM Forms Server when the app is [synchronized with the server](../../forms/using/sync-app.md). For information on Settings, see [Update General Settings](../../forms/using/update-general-settings.md).
1. **Task or Form**: Select the listed task or form that you want to work with.
1. **Horizontal Ellipsis**: Denotes that actions are available for the form. Tapping the ellipsis displays the actions and description that the author has provided. The **Delete Draft** and **Complete** option is visible when you select the ellipsis.
1. **Refresh icon**: Select the refresh icon so you can synchronize your app with the AEM Forms Server.

### Customizing the Home screen {#customizing-the-home-screen}

![General Settings](assets/gen-settings.png)

You can change the default Home screen of the app either from the **[General Settings](../../forms/using/update-general-settings.md)** of the app, or from the **Preference** tab on HTML Workspace.

The change made to the Home screen setting on the app affects the Home screen for the currently logged in user or the user on the current mobile device.

However, the change made in HTML Workspace effects all AEM Forms app users logged in to the AEM Forms Server.
