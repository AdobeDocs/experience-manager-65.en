---
title: Enabling and disabling safe backup mode
description: On the Backup Settings page, you can operate AEM forms in safe backup mode so that you can reliably back up your database and Global Document Storage (GDS) (GDS) directory. Learn how to enable and disable safe backup mode.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: f0ab712f-ecd9-4be8-a7a5-fd1a7a8c9a0b
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
# Enabling and disabling safe backup mode {#enabling-and-disabling-safe-backup-mode}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

On the Backup Settings page, you can operate AEM forms in safe backup mode so that you can reliably back up your database and Global Document Storage (GDS) (GDS) directory.

While AEM forms is in safe backup mode, it operates normally, except that it does not actively remove files from the GDS directory.

>[!NOTE]
>
>Setting this option does not back up your system; it prepares your system for backup.

## Enable safe backup mode {#enable-safe-backup-mode}

1. In administration console, click Settings &gt; Core Systems Settings &gt; Backup Settings.
1. On the Backup Settings page, select Operate In Safe Backup Mode and click OK.

>[!NOTE]
>
>If the system is already running in safe backup mode, a new reservation will not be created when you click OK.

## Disable safe backup mode {#disable-safe-backup-mode}

1. In administration console, click Settings &gt; Core Systems Settings &gt; Backup Settings.
1. On the Backup Settings page, deselect Operate In Safe Backup Mode and click OK.
