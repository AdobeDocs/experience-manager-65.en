---
title: Configuring the synchronization scheduler
description: Learn how to migrate and sync assets, configure sync scheduler, and use folders to arrange assets.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Configuration
docset: aem65
role: Admin,User
exl-id: 34db1f76-ee40-4612-85da-22041e7560fb
solution: Experience Manager, Experience Manager Forms
feature: Workbench,Adaptive Forms
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 36ac8e9c-5c7a-56d8-af5e-39399fd7b101
    internal-label: Workbench
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
---
# Configuring the synchronization scheduler {#configuring-the-synchronization-scheduler}

By default, the synchronization scheduler runs after every 3 minutes to synchronize all the assets modified and updated in the repository via LiveCycle Workbench 11. Applications containing forms and resources are visible in the AEM Forms user interface once the synchronization process is complete.

## Change interval of the synchronization scheduler {#change-interval-of-the-synchronization-scheduler}

Perform the following steps to change the interval of the synchronization scheduler:

1. Log in to AEM Configuration Manager. The URL of Configuration Manager is `https://'[server]:[port]'/lc/system/console/configMgr`  

1. Locate and open the **FormsManagerConfiguration** bundle.

1. Specify a new value for the **Synchronization Scheduler Frequency** option.

   The unit of the frequency is minutes. For example, to configure the scheduler to run after every 60 minutes, specify 60.

## Synchronizing assets {#synchronizing-assets}

You can use the **Synchronize Assets from Repository** option to manually synchronize the assets. Perform the following steps to manually synchronize the assets:

1. Log in to AEM Forms. The default URL is `https://'[server]:[port]'/lc/aem/forms/`.

   ![AEM Forms user interface](assets/aem_forms_ui.png)

   **Figure:** *AEM Forms user interface*

1. Click the ![aem6forms_sync](assets/aem6forms_sync.png) icon in the toolbar. If you do not have any assets at last configured path then the dialog box as shown below. Click **Start** to initiate the synchronization.

   ![Synchronization dialog box](assets/migrate-and-syncronize.png)

   **Figure:** *Synchronization dialog box*

## Troubleshooting synchronization error {#troubleshooting-synchronization-error}

You can create new applications in the workflow designer (LiveCycle Workbench).

If the newly created application and a folder at /content/dam/formsanddocuments has identical name, an error "*An asset with the same name as this application already exists at root level.*" is logged.

To resolve the conflict, rename the application, and manually synchronize the assets.

![Conflicts in asset synchronization dialog box](assets/sync-conflict.png)

**Figure:** *Conflicts in asset synchronization dialog box*
