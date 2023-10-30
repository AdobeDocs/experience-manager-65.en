---
title: PDF Generator backup limitations
description: Learn about PDF Generator backup limitations. This document explains that the temporary directory that PDF Generator uses to convert files cannot be backed up as it clears the contents of the temporary directory at set intervals.
uuid: 9537ffde-4396-46d1-81ea-edcd25923ffb
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/aem_forms_backup_and_recovery
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: 23386353-b2bf-49f1-947a-dd7587bba175
noindex: true
exl-id: a23db58d-1236-4689-93fc-dea508f8eb81
---
# PDF Generator backup limitations {#pdf-generator-backup-limitations}

The temporary directory that PDF Generator uses to convert files cannot be backed up. Even though the service are restored properly, data can get lost because PDF Generator reviews and clears the contents of the temporary directory at set intervals.
