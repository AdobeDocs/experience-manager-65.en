---
title: "DB2 database: Running a process weekly"

description: See how you can improve the performance of your AEM forms DB2 database.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/maintaining_the_aem_forms_database
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: ca2cfe35-b602-4ef8-b4e3-af846105d4de
---
# DB2 database: Running a process weekly{#db-database-running-a-process-weekly}

If your AEM forms DB2 database begins to run slowly, running the following process on a weekly basis can improve its performance:

1. Start DB2 Control Center:

   (Windows) Select Start &gt; Programs &gt; IBM DB2 &gt; General Administratison Tools &gt; Control Center.

   (Linux and UNIX) From a command prompt, type the `db2jcc` command.

1. In the DB2 Control Center object tree, click All Databases.
1. Click the database you created for AEM forms and click the Tables folder.
1. Select all the database tables in the contents pane, right-click them and select Run Statistics.
1. Go to Statistics &gt; Index Statistics.
1. Select Collect Statistics For All Indexes, select Collect Statistics For Indexes With Extended Detailed Statistics, and then click OK.

A message appears when the process is completed. Close the message.
