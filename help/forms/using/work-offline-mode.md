---
title: Working in the offline mode
description: Take your mobile device offline outside your AEM Forms network range or in a completely offline mode and work on the AEM Forms app
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
exl-id: ba4ceef1-510d-41ef-94b8-4834fb7de804
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
# Working in the offline mode {#working-in-the-offline-mode}

>[!NOTE]
>
>AEM Forms app is currently deprecated. For questions or help, contact [aemformsapp-android@adobe.com](mailto:aemformsapp-android@adobe.com).

The offline mode of the AEM Forms app lets you work seamlessly even if the app goes offline. You can open, update, and submit a form without requiring any network connectivity.

You start off working on the AEM Forms app by synchronizing your app with the AEM Forms server. All the forms assigned to you are downloaded in your app. For AEM Forms on JEE, tasks are fetched in the tasks tab, and startpoints associated forms and other forms in the Forms tab. For AEM Forms on OSGi, only Forms are loaded in the Forms tab.

For details on how to synchronize the app, see [Synchronizing the app](/help/forms/using/sync-app.md).

## Making Forms available Offline {#making-forms-available-offline}

When you synchronize your app with the AEM Forms server, the forms are downloaded to your mobile device. However, by default, the attachments associated with the form are not downloaded. This implies that if you are online, you can view the attachments. However, to ensure that you can view the attachment in the offline mode, change the default settings in your app.

To ensure that the associated attachments are downloaded with each form, set Fetch attachments to ON. For details, see [Updating general settings](/help/forms/using/update-general-settings.md).

Since downloading data on the mobile device can affect the performance of the device, by default, the Fetch attachments setting is set to OFF. The attachments are fetched to the device for any task that is downloaded from the server after the setting is updated to ON. In the offline mode, a user can then work on all tasks that are downloaded to device after setting the **Fetch attachments** options to ON.

## Configuring offline service for AEM Forms app {#configuring-offline-service-for-aem-forms-app-br}

AEM Forms app offline service identifies the resources used in a form. AEM Forms app relies on this service to obtain information about form dependencies. Information about form dependencies is required to enable offline functionalities. The AEM Forms app offline service caches the paths or URLs of the resources used in a form. The cache is updated based on the changes in the form and the validity period configured for the offline service. Caching paths or URLs of the resources used in a form improves server-side performance.

To configure the server-side offline component of AEM Forms app:

1. In the author instance, navigate to **Adobe Experience Manager** &gt;**Tools** &gt; **Forms** &gt; **Configure Forms App Offline Service**.

   URL: `https://<server>:<port>/<context-path>/libs/fd/workspace-offline/gui/content/config.html`

1. Under General Settings, you can perform the following:

    * **Clear Cache**: Clears the server side cache of the form dependencies.
    * **Reset Configuration**: Resets the AEM Forms app offline configuration.
    * **Cache Validity**: Specifies the validity period for the server-side offline cache.
    * **Resource Observation Paths**: Specifies paths where the offline service monitors for resource changes. If any changes occur in the specified paths, the offline cache of all dependent forms is updated. For example, `/etc/clientlibs/fd,/content/dam/images`.

1. In the **Manual Resource Cache** tab, specify the form dependencies offline service cannot identify. You can specify resources such as images loaded from within JavaScript. AEM Forms app will download these resources as well for the offline mode.
