---
title: Upgrade to AEM 6.5 Forms on OSGi

description: You can perform a direct upgrade from AEM 6.1 Forms, AEM 6.2 Forms, and LiveCycle ES4 SP1 to AEM 6.3 Forms.

uuid: 1435246a-9215-4d88-b52c-59a5c329bb77
content-type: reference
products: SG_EXPERIENCEMANAGER/6.3/FORMS
topic-tags: installing
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: e745033f-8015-4fae-9d82-99d35802c0a6
role: Admin
exl-id: 1e39455e-f588-42a2-91f5-daefcfed82a0
---
# Upgrade to AEM 6.5 Forms on OSGi {#upgrade-to-aem-forms-osgi}

You can perform a direct upgrade from AEM 6.3 Forms or AEM 6.4 Forms to AEM 6.5 Forms.

Direct upgrade path from **AEM 6.0 Forms, AEM 6.1 Forms**, and **AEM 6.2 Forms** to AEM 6.5 Forms is not available. Perform an intermediate [upgrade to AEM 6.2 Forms](https://helpx.adobe.com/experience-manager/6-2/forms/using/upgrade.html), [upgrade to AEM 6.3 Forms](https://helpx.adobe.com/experience-manager/6-3/forms/using/upgrade.html), or [upgrade to AEM 6.4 Forms](/help/forms/using/upgrade.md) and then upgrade from AEM 6.3 Forms, or AEM 6.4 Forms to AEM 6.5 Forms.

Do the following to upgrade from AEM 6.3 Forms or AEM 6.4 Forms to AEM 6.5 Forms:

1. Upgrade the existing AEM instance to AEM 6.5. The steps are listed below:

    1. Install the latest service pack and patches for AEM 6.3 Forms or AEM 6.4 Forms. For details, see [AEM Sustenance Hub](https://helpx.adobe.com/experience-manager/aem-releases-updates.html).
    1. Prepare the source instance for the upgrade. For detailed steps, see [Upgrading to AEM 6.5](/help/sites-deploying/upgrade.md).
    1. Download the [AEM 6.5 QuickStart](/help/sites-deploying/deploy.md#getting%20the%20software).
    1. **(Unix/Linux-based installations only)** If you are using UNIX or Linux as the underlying operating system, open the terminal window, navigate to the folder containing crx-quickstart, and run the following command:

       `chmod -R 755 ../crx-quickstart`

    1. Upgrade your AEM instance to AEM 6.3. For step by step instructions, see [Upgrading to AEM 6.5](/help/sites-deploying/upgrade.md).

       Before continuing with the next steps, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file.

       >[!NOTE]
       >
       >After the server is up and running, a few AEM Forms bundles remain in install state. The number of bundles can vary for every installation. You can safely ignore the state these bundles. The bundles are listed at https://'[server]:[port]'/system/console/.

1. Install AEM Forms add-on package. The steps are listed below:

    1. Open [Software Distribution](https://experience.adobe.com/downloads). You require an Adobe ID to log in to the Software Distribution.
    1. Tap **[!UICONTROL Adobe Experience Manager]** available in the header menu.
    1. In the **[!UICONTROL Filters]** section:
       1. Select **[!UICONTROL Forms]** from the **[!UICONTROL Solution]** drop-down list.
       1. Select the version and type for the package. You can also use the **[!UICONTROL Search Downloads]** option to filter the results.
    1. Tap the package name applicable to your operating system, select **[!UICONTROL Accept EULA Terms]**, and tap **[!UICONTROL Download]**.
    1. Open [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html)  and click **[!UICONTROL Upload Package]** to upload the package.
    1. Select the package and click **[!UICONTROL Install]**.

       You can also download the package using the direct link listed in [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article.

       >[!NOTE]
       >
       >After the package is installed, you are prompted to restart the AEM instance. **Do not immediately stop the server.** Before stopping the AEM Forms server, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file and the log is stable. Also note, a few packages can remain in the installed state. You can safely ignore the state of these packages.

  1. Restart the AEM instance.

1. Perform post-installation activities.

    * **Run Migration Utility**

      The migration utility makes the adaptive forms and correspondence management assets of earlier versions compatible with AEM 6.5 forms. You can download the utility from AEM Software Distribution. For step-by-step information to configure and use the migration utility, see [migration utility](../../forms/using/migration-utility.md).

      If you are using [Sample for integrating drafts & submissions component](https://helpx.adobe.com/experience-manager/6-3/forms/using/integrate-draft-submission-database.html) with the database and upgrading from a previous version, then run the following SQL queries after performing the upgrade:

      ```sql
      UPDATE metadata m, additionalmetadatatable am
      SET m.dataType = am.value
      WHERE m.id = am.id
      AND am.key = 'dataType'

      ```

      ```sql
      DELETE from additionalmetadatatable
      WHERE `key` = 'dataType'

      ```

    * **(If upgrading from AEM 6.2 Forms or previous versions only) Reconfigure Adobe Sign**

      If you had Adobe Sign configured in the previous version of AEM Forms, then reconfigure Adobe Sign from AEM Cloud services. For more details, see [Integrate Adobe Sign with AEM Forms](../../forms/using/adobe-sign-integration-adaptive-forms.md).

    * **Support for jQuery**

      In AEM 6.5 Forms, version of jQuery is updated to 3.2.1 and jQuery UI version is updated to 1.12.1. AEM Form uses JQuery in **noConflict** mode. So, if you are using any other jQuery version, no issues are displayed while performing an upgrade. However, when you upgrade to AEM 6.5 Forms:

        * Ensure that your custom components, if any, are compatible with supported jQuery versions.
        * Remove unsupported APIs from the custom components. See [upgrade guide](https://jquery.com/upgrade-guide/3.0/) for the list of removed APIs. For example, support for the load(), .unload(), and .error() APIs is removed. Use the .on() method in place of aforementioned APIs. For example, change $("img").load(fn) to $("img").on("load", fn).

    * **(If upgrading from AEM 6.2 Forms or previous versions only) Reconfigure analytics and reports**

      In AEM 6.4 Forms, traffic variable for source and success event for impression are not available. So, when you upgrade from AEM 6.2 Forms or previous versions, AEM Forms stops sending data to Adobe Analytics server and analytics reports for adaptive forms are not available. Moreover, AEM 6.4 Forms introduces traffic variable for the version of form analytics and success event for the amount of time spent on a field. So, reconfigure analytics and reports for your AEM Forms environment. For detailed steps, see [Configuring analytics and reports](../../forms/using/configure-analytics-forms-documents.md).

1. Verify that the server is upgraded successfully, all the data is also migrated successfully, and it can operate normally.

    * **Verify the status of the bundles:** Ensure that all the bundles are in active state.
    * **Verify replication and reverse replication:** Publish, fill, and submit a few migrated forms. Verify the submitted data also.
    * **Verify access to admin and developer user interfaces:** Log in to AEM instance from an admin account and verify that you have access to the following URLs:

      * `https://'[server]:[port]'/crx/packmgr`
      * `https://'[server]:[port]'/crx/de`
      * `https://'[server]:[port]'/aem/forms.html/content/dam/formsanddocuments`

   >[!NOTE]
   >
   >In AEM 6.4 Forms, the structure of crx-repository has changed. If upgrade from 6.3 Forms to AEM 6.5 Forms, use the changed paths for customization that you create afresh. For the complete list of changed paths, see [Forms Repository Restructuring in AEM](/help/sites-deploying/forms-repository-restructuring-in-aem-6-5.md).
