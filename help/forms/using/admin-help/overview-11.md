---
title: Overview of Health Monitor

description: This document provides the overview of the Health monitor, and details about how you can access it.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/health_monitor
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 05f8b430-141e-4921-98b1-a0d8f636e478
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Overview of Health Monitor {#overview-of-health-monitor}

Health Monitor provides critical information about the AEM forms system, such as server information, memory usage, and processor usage. Also available are Work Manager statistics, such as the number of work items or jobs in the queue and their statuses. You can perform the following tasks using Health Monitor:

* Verify that your system is running properly
* View information to help diagnose system problems as they occur
* Perform operations on work items or jobs displaying problems
* Purge obsolete records from the Job Manager database

The Health Monitor page in administration console has three tabs:

* The System tab displays resource monitoring charts and information about the Forms Server (or node in a clustered environment). (See [View system information](/help/forms/using/admin-help/view-system-information.md#view-system-information).)
* The Work Manager tab displays data that is related to Work Manager, such as the number of work items in the Work Manager queue. You can filter the information by using various criteria or manage individual work items by using the operation tools. (See [View statistics related to Work Manager](/help/forms/using/admin-help/view-statistics-related-manager.md#view-statistics-related-to-work-manager).)
* The Job Purge Scheduler tab enables you to purge obsolete records from the Job Manager database. (See [Purge records from the Job Manager database](/help/forms/using/admin-help/purge-records-job-manager-database.md#purge-records-from-the-job-manager-database).)

The Health Monitor web page is populated with statistics gathered through a Gemfire API. This API automatically discovers all nodes in a cluster. It also resolves security issues that occur when gathering statistics from behind proxy servers or load balancers. Java options are available to fine-tune the Health Monitor, decreasing the impact to the performance of your AEM forms environment. (See [Fine-tuning Health Monitor performance](/help/forms/using/admin-help/fine-tuning-health-monitor-performance.md#fine-tuning-health-monitor-performance).)

**Access Health Monitor**

1. In administration console, click Health Monitor in the upper-right corner of the page.
