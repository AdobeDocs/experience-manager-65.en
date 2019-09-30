---
title: Asset Reports
seo-title: Asset Reports
description: This article describes various reports around assets in AEM Assets and how to generate reports.
seo-description: Know about the various types of asset reports you can generate in AEM Assets. Learn how to generate and customize each report.
uuid: 8984171b-799a-4587-9862-f4c7ce3f1a76
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
content-type: reference
topic-tags: authoring
discoiquuid: 4f4438b8-e5c4-4a15-8def-a909cb2e1382
docset: aem65

---

# Asset Reports{#asset-reports}

Asset reporting is a key tool to assess the utility of your Adobe Experience Manager (AEM) Assets deployment. With AEM Assets, you can generate a variety of reports around your digital assets. The reports provide useful information about your system’s usage, how users interact with assets, and which assets are downloaded and shared.

Use the information in the reports to derive key success metrics to measure the adoption of AEM Assets within your enterprise and by customers.

The AEM Assets reporting framework leverages Sling jobs to asynchronously process report requests in an ordered manner. It is scalable for large repositories. Asynchronous report processing increases the efficiency and speed with which reports are generated.

The report management interface is intuitive and includes fine-grained options and controls to access archived reports and view report run statuses (success, failed, and queued).

When a report is generated, you are notified through an email (optional) and an inbox notification. You can view, download, or delete a report from the report listing page, where all previously generated reports are displayed.

## Generate reports {#generate-reports}

AEM Assets generates the following standard reports for you:

* Upload
* Download
* Expiration
* Modification
* Publish
* Brand Portal publish
* Disk Usage
* Files
* Link Share

AEM administrators can easily generate and customize these reports for your implementation. An administrator can follow these steps to generate a report:

1. Tap/click the AEM logo, and go to **Tools** &gt; **Assets** &gt; **Reports**.

   ![](assets/navigation.png)

1. In the Asset Reports page, tap/click **Create** from the toolbar.
1. From the **Create Report** page, choose the report you want to create and tap/click **Next**.

   ![](assets/choose_report.png)

   >[!NOTE]
   >
   >Before you can generate an **[!UICONTROL Asset Downloaded]** report, ensure that the Asset Download service is enabled. From the web console ( `http://[*server name*]:[*port name*]/system/console/configMgr`), open the **[!UICONTROL Day CQ DAM Event Recorder]** configuration, and select the **[!UICONTROL Asset Downloaded (DOWNLOADED)]** option in Event Types if not already selected.

   >[!NOTE]
   >
   >By default, the Content Fragments and link shares are included in the Asset Downloaded report. Select the appropriate option to create a report of link shares or to exclude Content Fragments from the download report.

1. Configure report details such as title, description, thumbnail, and folder path in the CRX repository where the report is stored. By default, the folder path is */content/dam*. You can specify a different path.

   ![](assets/report_configuration.png)

   Choose the date range for your report.

   You can choose to generate the report now or at a future date and time.

   >[!NOTE]
   >
   >If you choose to schedule the report at a later date, ensure that you specify the date and time in the Date and Time field. If you do not specify any value, the report engine treats it as a report that is to be generated instantly.

   Configuration fields may differ based on the type of report you create.

   For example, the **Disk Usage** report provides options to include asset renditions when calculating the disk space used by assets. You can choose to include or exclude assets in subfolders for disk usage calculation.

   >[!NOTE]
   >
   >The **Disk Usage** report does not include date range fields because it indicates current disk space usage only.

   ![](assets/disk_usage_configuration.png)

   When you create the **Files** report, you can include/exclude subfolders. However, you cannot include asset renditions for this report.

   ![](assets/files_report.png)

   The **Link Share** report displays URLs to assets that are shared with external users from within AEM Assets. It includes email ids of the user who shared the assets, emails ids of users with which the assets are shared, share date, and expiration date for the link. The columns are not customizable.

   The **Link Share** report, does not include options for subfolders and renditions because it merely publishes the shared URLs that appear under */var/dam/share*.

   ![](assets/link_share.png)

1. Tap/click **Next** from the toolbar.  

1. In the **Configure Columns** page, some columns are selected to appear in the report by default. You can select additional columns. Deselect a selected column to exclude it in the report.

   ![](assets/configure_columns.png)

   To display a custom column name or property path, configure the properties for the asset binary under the jcr:content node in CRX. Alternatively, add it through property path picker.

   ![](assets/custom_columns.png)

1. Tap/click **Create** from the toolbar. A message notifies that report generation has been initiated.
1. In the Asset Reports page, the report generation status is based on the current state of the report job, for example Success, Failed, Queued, or Scheduled. The same status appears in the notifications inbox.

   To view the report page, tap/click the report link. Alternatively, select the report, and tap/click the View icon from the toolbar.

   ![](assets/report_page.png)

   Tap/click Download icon from the toolbar to download the report in CSV format.

## Add custom columns {#add-custom-columns}

You can add custom columns to the following reports to display more data for your custom requirements:

* Upload
* Download
* Expiration
* Modification
* Publish
* Brand Portal publish
* Files

1. Tap/click the AEM logo, and go to **Tools** &gt; **Assets** &gt; **Reports**.
1. In the Asset Reports page, tap/click **Create** from the toolbar.  

1. From the **Create Report** page, choose the report you want to create and tap/click **Next**.
1. Configure report details such as title, description, thumbnail, folder path, date range, and so on as applicable.  

1. To display a custom column, specify the name of the column in under **Custom Columns**.

   ![](assets/custom_columns-1.png)

1. Add the property path under the `jcr:content` node in CRXDE using the property path picker.

   ![](assets/property_picker.png)

   Alternatively, type the path in the property path field.

   ![](assets/property_path.png)

   To add more custom columns, tap/click **Add** and repeat steps 5 and 6.

1. Tap/click **Create** from the toolbar. A message notifies that report generation has been initiated.

## Configure purging service {#configure-purging-service}

To remove reports that you no longer require, configure the DAM Report Purge service from the web console to purge existing reports based on their quantity and age.

1. Access the web console (configuration manager) from *http://&lt;Server&gt;.&lt;Port&gt;:/system/console/configMgr*.  

1. Open the **DAM Report Purge Service** configuration.  

1. Specify the frequency (time interval) for the purging service in the `scheduler.expression.name` field. You can also configure the age and the quantity threshold for reports.  

1. Save the changes.

