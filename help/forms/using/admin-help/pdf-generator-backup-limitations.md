---
title: PDF Generator backup limitations
description: Learn about PDF Generator backup limitations. The temporary directory that PDF Generator uses cannot be backed up as it clears the contents at set intervals.

contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS

noindex: true
exl-id: a23db58d-1236-4689-93fc-dea508f8eb81
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# PDF Generator backup limitations {#pdf-generator-backup-limitations}

The temporary directory that PDF Generator uses to convert files cannot be backed up. Even though the service are restored properly, data can get lost because PDF Generator reviews and clears the contents of the temporary directory at set intervals.
