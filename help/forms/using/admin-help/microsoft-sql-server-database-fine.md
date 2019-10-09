---
title: "Microsoft SQL Server database: Fine-tuning the configuration"
seo-title: "Microsoft SQL Server database: Fine-tuning the configuration"
description: Learn how you can fine tune the configuration of your Microsoft SQL Server database.
seo-description: Learn how you can fine tune the configuration of your Microsoft SQL Server database.
uuid: 2d618aab-3c67-4edb-a28f-a20904689e6f
contentOwner: admin
content-type: reference
products: SG_AEMFORMS
geptopics: SG_AEMFORMS/categories/maintaining_the_aem_forms_database
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 70559a94-42ea-411a-a32f-5f38bc17ff96
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
