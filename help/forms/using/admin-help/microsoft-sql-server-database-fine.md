---
title: 'Microsoft SQL Server database: Fine-tuning the configuration'
description: Learn how you can fine-tune the configuration of your Microsoft SQL Server database.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/maintaining_the_aem_forms_database
products: SG_EXPERIENCEMANAGER/6.5/FORMS, SG_AEMFORMS
exl-id: 9c570827-86e2-47d5-b8ae-66c0767bff2e
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
# Microsoft SQL Server database: Fine-tuning the configuration {#microsoft-sql-server-database-fine-tuning-the-configuration}

You should change the default configuration settings when using Microsoft SQL Server. Right-click the local server in Oracle Enterprise Manager to access the properties dialog box.

## Memory settings {#memory-settings}

Change the minimum memory allocation to as large a number as possible. If the database is running on a separate computer, use all the memory. The default settings do not aggressively allocate memory, which hinders performance on almost any database. You should be most aggressive in allocating memory on production machines.

## Processor settings {#processor-settings}

Modify the processor settings and, most importantly, select the Boost SQL Server Priority On Windows check box so that the server uses as many cycles as possible. The Use NT Fibers setting is less important, but you may want to select it too.

## Database settings {#database-settings}

Change the database settings. The most important setting is Recovery Interval, which specifies the maximum amount of time to wait for recovery after a crash. The default setting is one minute. Using a larger value, from 5 to 15 minutes, improves performance because it gives the server more time to write changes from the database log back into the database files.

>[!NOTE]
>
>This setting does not compromise the transactional behavior because it changes only the length of the log file replay that must be done on startup.

Set the Space Allocated size for both the log and the data file to be much larger than the initial database. Consider how much the database can grow over of a year. Ideally, the log and data files are allocated in a contiguous extent so that data does not end up fragmented all over the disk.
