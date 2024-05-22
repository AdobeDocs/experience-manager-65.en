---
title: Purge records from the Job Manager database

description: Large process data can result in lower AEM forms performance. It is good practice to purge process data when records are no longer necessary.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/health_monitor
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 5279f6c3-5954-472c-9ea0-18e8a7ec860e
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Purge records from the Job Manager database {#purge-records-from-the-job-manager-database}

Process data that is generated when a long-lived process is invoked can become too large, resulting in lower AEM forms performance and the use of unnecessary disk space. It is good practice to purge process data when records are no longer necessary.

You can use administration console to perform a one-time purge of obsolete records, or to schedule regular automatic purges. Other methods for purging obsolete records are discussed in [Purging process data](/help/forms/using/admin-help/purging-process-data.md#purging-process-data).

**Access the Job Purge Scheduler page**

1. In Administration Console, click Health Monitor in the upper-right corner of the page.
1. Click the Job Purge Scheduler tab.

Information about any currently scheduled purges is displayed in the Job Purge Scheduler Information box.

>[!NOTE]
>
>Clicking Stop Scheduler stops any purges scheduled in the future, but does not stop a purge job that is already underway.

**Schedule a one-time purge**

1. Select One Time Only.
1. In the Purge Completed Records Filter area, specify the number of days or weeks after which a record is deemed obsolete and ready for purging.

   >[!NOTE]
   >
   >Records related to processes that have not been completed are not purged, even if they are older than the specified age.

1. Specify when the purge will occur. Select the Use Current Date & Time checkbox, or clear the checkbox and click the calendar and clock icons to specify the date and time when the purge will be performed.

   >[!NOTE]
   >
   >If you specify a start date and time that is in the past, the purge occurs immediately when you click Start Scheduler.

1. Click Start Scheduler. Any previously scheduled scheduler settings are replaced with the new settings.

**Configure an automatic purge schedule**

1. Select Recur Every and specify the number of days or weeks between purges.
1. In the Purge Completed Records Filter area, specify the number of days or weeks after which a record is deemed obsolete and ready for purging. You cannot set the value to `0`.

   >[!NOTE]
   >
   >Records related to processes that have not been completed are not purged, even if they are older than the specified age.

1. Specify when the purges will begin. Select the Use Current Date & Time checkbox, or clear the checkbox and click the calendar and clock icons to specify the date and time when the purge will be performed.

   >[!NOTE]
   >
   >If you specify a start date and time that is in the past, AEM forms calculates the logical next start date based on the date you specified. For example, if you schedule the job purges to occur weekly beginning April 7, and it is now April 9, the first purge occurs April 14.

1. Click Start Scheduler. Any previously scheduled scheduler settings are replaced with the new settings.
