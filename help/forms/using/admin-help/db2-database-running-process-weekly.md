---
title: 'DB2&reg; database: Running a process weekly'
description: Learn how you can improve the performance of your AEM Forms DB2&reg; database.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/maintaining_the_aem_forms_database
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: ca2cfe35-b602-4ef8-b4e3-af846105d4de
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
# DB2&reg; database: Running a process weekly{#db-database-running-a-process-weekly}

If your AEM Forms DB2&reg; database begins to run slowly, running the following process on a weekly basis can improve its performance:

1. Start DB2&reg; Control Center:

   (Windows) Select Start &gt; Programs &gt; IBM&reg; DB2&reg; &gt; General Administration Tools &gt; Control Center.

   (Linux&reg; and UNIX&reg;) From a command prompt, type the `db2jcc` command.

1. In the DB2&reg; Control Center object tree, click All Databases.
1. Click the database that you created for AEM Forms and click the Tables folder.
1. Select all the database tables in the contents pane, right-click them, then select Run Statistics.
1. Go to Statistics &gt; Index Statistics.
1. Select Collect Statistics For All Indexes, select Collect Statistics For Indexes With Extended Detailed Statistics, and then click OK.

A message appears when the process is completed. Close the message.
