---
title: Introduction to Process Reporting
description: Introduction and key capabilities of AEM Forms on JEE Process Reporting
content-type: reference
topic-tags: process-reporting
products: SG_EXPERIENCEMANAGER/6.5/FORMS
docset: aem65
exl-id: 674d28dc-7353-49de-9e12-b1998e1509c7
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
# Introduction to Process Reporting{#introduction-to-process-reporting}

 ![process-reporting](assets/process-reporting.png)

Process Reporting is a browser-based tool that you use to create and view reports on AEM Forms processes and tasks.

Process Reporting provides a set of out-of-the-box reports that let you filter, view information on long running processes, process duration, and workflow volume.

Additionally Process Reporting provides an interface to run adhoc queries and to integrate custom report views into the Process Reporting user interface.

For the list of supported browsers, see [AEM Forms Supported Platforms](/help/forms/using/aem-forms-jee-supported-platforms.md).

Process Reporting is built on modules that:

* Read process data from AEM Forms Database
* Publish process data to an embedded Process Reporting repository
* Provides a browser-based user interface to view reports

## Key Capabilities {#key-capabilities}

### Always-on Reporting {#always-on-reporting}

![site-management](assets/site-management.png)

View the list of long running processes, process duration charts, and run custom queries using filters.

Process Reporting also provides the option to export the report and query data in CSV format.

### Adhoc Reports {#adhoc-reports}

![print-&-colour](assets/print-and-colour.png)

Use filters to get a specific view of your data.

You can search processes or tasks by ID, duration, start and end dates, process initiator, and so on.

You can combine multiple filters to create specific reports.

You can then save the report filters to be run at a later date or time.

### Process/Task History {#process-task-history}

![file-management](assets/file-management.png)

AEM Forms servers run numerous processes in parallel. These processes keep on transitioning from one state to another. By publishing Forms data to the Process Reporting repository at regular intervals, Process Reporting retains the transitioning information about the processes running in AEM Forms.

### Access Control {#access-control-br}

![untitled](assets/untitled.png)

Process Reporing provides permission-based access to the user interface.

This means only users with reporting permissions have access to the Process Reporting user interface.
