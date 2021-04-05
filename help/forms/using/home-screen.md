---
title: Home screen
seo-title: Home screen
description: Description of the components of the AEM Forms app Home screen
seo-description: Description of the components of the AEM Forms app Home screen
uuid: abc95e58-a685-42a9-82ab-4990155945d3
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
discoiquuid: ba79479b-4159-4a39-95eb-2285e7ece9d4
docset: aem65
exl-id: 6c6fb516-1b11-4da4-b638-4388a070e397
---
# Home screen{#home-screen}

When you log in to the AEM Forms app, you are redirected to the Home screen.

## Default Home screen {#default-home-screen}

By default, the Home screen displays all forms including startpoints and tasks (if the connected server is AEM Forms Workflow enabled), along with the associated thumbnails. You can specify the thumbnails in the AEM Forms server.

The following figure is annotated with call-outs to the essential components on the default Home screen.

![Forms app home screen](assets/home-screen-1.png)

<!--Click to enlarge

![home-screen-1-1](assets/home-screen-1-1.png)-->

1. **Menu button**: Tap the **Menu** button to navigate to Tasks, Forms, Outbox, and Settings. If your AEM Forms app is connected to an AEM Forms JEE server, you can see the Tasks option. The Tasks option also stores the drafts created from tasks in a process. For AEM Forms OSGi servers, Tasks option is hidden. Outbox stores the saved forms and drafts before it syncs with the server. All saved forms and drafts in the Outbox are uploaded to the AEM Forms server when the app is [synchronized with the server](../../forms/using/sync-app.md). For information on Settings, see [Update General Settings](../../forms/using/update-general-settings.md).
1. **Task or Form**: Tap the listed task or form that you want to work with.
1. **Horizontal Ellipsis**: Denotes that actions are available for the form. Tapping the ellipsis displays the actions and description author has provided. The **Delete Draft** and **Complete** option is visible when you tap the ellipsis.
1. **Refresh icon**: Tap the refresh icon to synchronize your app with the AEM Forms server.

### Customizing the Home screen {#customizing-the-home-screen}

![General Settings](assets/gen-settings.png)

You can change the default Home screen of the app either from the **[General Settings](../../forms/using/update-general-settings.md)** of the app, or from the **Preference** tab on HTML Workspace.

The change made to Home screen setting on the app effects the Home screen for the current logged or the user on the current mobile device.

However, the change made in HTML Workspace effects all AEM Forms app users logged on to the AEM Forms server.
