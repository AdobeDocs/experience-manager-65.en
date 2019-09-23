---
title: Pre-defined reports in Process Reporting
seo-title: Pre-defined reports in Process Reporting
description: Query for AEM Forms on JEE process data to create reports on long running processes, Process duration, and Workflow volume
seo-description: Query for AEM Forms on JEE process data to create reports on long running processes, Process duration, and Workflow volume
uuid: 92694eb5-4092-4634-99cc-672ab62f88c9
content-type: reference
topic-tags: process-reporting
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: fd117ec9-41f1-4698-b5cd-424916cf44b1
index: y
internal: n
snippet: y
---

# Pre-defined reports in Process Reporting{#pre-defined-reports-in-process-reporting}

## Pre-defined Reports in Process Reporting {#pre-defined-reports-in-process-reporting}

AEM Forms Process Reporting ships with the following *out-of-the-box* reports:

* ** [Long Running Processes](../../../forms/using/process-reporting/pre-defined-reports-in-process-reporting.md#p-long-running-processes-p)**: A report of all AEM Forms processes that took more than a specified time to complete  

* ** [Process Duration Chart](../../../forms/using/process-reporting/pre-defined-reports-in-process-reporting.md#p-process-duration-report-br-p)**: A report of a specified AEM Forms process by duration  

* ** [Workflow Volume](../../../forms/using/process-reporting/pre-defined-reports-in-process-reporting.md#p-workflow-volume-report-p)**: A report of the running and completed instances of specified process by date

<!--
Comment Type: draft

<p>These pre-defined reports allow you to query for specific data. However, the reports provide you the option to specify certain input parameters to filter the result set of the report.</p>
-->

## Long Running Processes {#long-running-processes}

The Long Running Processes report displays the AEM Forms processes that have taken more than a specified time to complete.

### To execute a Long Running Process report <br> {#to-execute-a-long-running-process-report-br}

1. To view the list of pre-defined reports in Process Reporting, on the **Process Reporting** tree view, click the **Reports **node.
1. Click the **Long Running Processes** report node.

   ![](assets/long_running_node.png)

   When you select a report, the **Report Parameters** panel is displayed to the right of the tree view.

   ![long running processes report parameters panel](assets/report_parameters_panel.png)

   Parameters:

    * **Duration **(*mandatory*): Specify a duration and unit of time. Display all AEM Forms processes that have run for more than the specified duration.
    
    * **Started After** (*optional*): Select a date. Filter the report to display process instances that started after the specified date.
    
    * **Started Before** (*optional*): Select a date. Filter the report to display process instances that started before the specified date.

1. Click **Go **to execute the report.

   The report displays in the **Report **panel on the right of the **Process Reporting** window.

   ![](assets/long_running_processes.png)

   Use the options in the upper right corner of the **Report **panel to perform the following operations on the report.

    * **Refresh**: Refreshes the report with latest data lying in the storage
    * **Change legend color**: Select and change the color of the report legend
    * **Export to CSV**: Export and download the data from the report to a comma-separated file

## Process Duration report <br> {#process-duration-report-br}

The Process Duration report displays the number of instances of a Forms process by number of days that each instance has run.

### To execute a Process Duration report <br> {#to-execute-a-process-duration-report-br}

1. To view the pre-defined reports in Process Reporting, on the **Process Reporting** tree view, click the **Reports **node.
1. Click the **Processes Duration** report node.

   ![](assets/process_duration_node.png)

   When you select a report, the **Report Parameters** panel is displayed to the right of the tree view.

   ![long running processes report parameters panel](assets/process_duration_params.png)

   Parameters:

    * **Select Process **(*mandatory*): Select an AEM Forms process.

1. Click **Go **to execute the report.

   The report displays in the **Report **panel on the right of the Process Reporting window.

   ![](assets/process_duration_report.png)

   Use the options in the upper right corner of the **Report **panel to perform the following operations on the report.

    * **Refresh**: Refreshes the report with latest data lying in the storage
    * **Change legend color**: Select and change the color of the report legend
    * **Export to CSV**: Export and download the data from the report to a comma-separated file

## Workflow Volume report {#workflow-volume-report}

The Workflow Volume report displays the number of currently running and completed instances of an AEM Forms process by calendar day.

### To execute a Workflow Volume report <br> {#to-execute-a-workflow-volume-report-br}

1. To view the pre-defined reports in Process Reporting, on the **Process Reporting **tree view, click the **Reports **node.
1. Click the **Workflow Volume** report node.

   ![](assets/workflow_volume_node.png)

   When you select a report, the **Report Parameters** panel is displayed to the right of the tree view.

   ![long running processes report parameters panel](assets/workflow_volume_params.png)

   Parameters:

    * **Select Process **(*mandatory*): Select an AEM Forms process.
    
    * **Started After** (*optional*): Select a date. Filters the report to display process instances that started after the specified date.
    
    * **Started Before** (*optional*): Select a date. Filters the report to display process instances that started before the specified date.

1. Click **Go **to execute the report.

   The report displays in the **Report **panel on the right of the **Process Reporting** window.

   ![](assets/workflow_volume_report.png)

   Use the options in the upper right corner of the **Report **panel to perform the following operations on the report.

    * **Refresh**: Refreshes the report with latest data lying in the storage
    * **Change legend color**: Select and change the color of the report legend
    * **Export to CSV**: Export and download the data from the report to a comma-separated file

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)
