---
title: Upgrade to AEM 6.4 Forms
seo-title: Upgrade to AEM 6.4 Forms
description: You can perform a direct upgrade from AEM 6.1 Forms, AEM 6.2 Forms, and LiveCycle ES4 SP1 to AEM 6.3 Forms. 
seo-description: You can perform a direct upgrade from AEM 6.1 Forms, AEM 6.2 Forms, and LiveCycle ES4 SP1 to AEM 6.3 Forms. 
uuid: 1435246a-9215-4d88-b52c-59a5c329bb77
content-type: reference
products: SG_EXPERIENCEMANAGER/6.3/FORMS
topic-tags: installing
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: e745033f-8015-4fae-9d82-99d35802c0a6
---

# Upgrade to AEM 6.4 Forms on OSGi {#upgrade-to-aem-forms-osgi}

Use one of the following upgrade paths, as appropriate for your environment.

## AEM 6.2 Forms or AEM 6.3 Forms > AEM 6.4 Forms {#upgrade-aem-forms-62-63-to-64}

You can perform a direct upgrade from AEM 6.2 Forms or AEM 6.3 Forms to AEM 6.4 Forms. Do the following:

1. Upgrade the existing AEM instance to AEM 6.4. The steps are listed below:

    1. Install the latest service pack and patches for AEM 6.2 Forms or AEM 6.3 Forms. For details, see:

        * [AEM 6.2 release notes](https://helpx.adobe.com/experience-manager/6-2/release-notes.html)
        * [AEM 6.3 release notes](https://helpx.adobe.com/experience-manager/6-3/release-notes.html)
        * [AEM Sustenance Hub](https://helpx.adobe.com/experience-manager/aem-releases-updates.html)

    1. Prepare the source instance for the upgrade. For detailed steps, see [Upgrading to AEM 6.4](/help/sites-deploying/upgrade.md#preparing%20the%20source%20instance).
    1. Download the [AEM 6.4 QuickStart](/help/sites-deploying/deploy.md#getting%20the%20software).
    1. **(Unix/Linux-based installations only)** If you are using UNIX or Linux as the underlying operating system, open the terminal window, navigate to the folder containing crx-quickstart, and run the following command:

       `chmod -R 755 ../crx-quickstart`
    
    1. Upgrade your AEM instance to AEM 6.3. For step by step instructions, see [Upgrading to AEM 6.4](/help/sites-deploying/upgrade.md).

       Before continuing with the next steps, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file.

       >[!NOTE]
       >
       >After the server is up and running, a few AEM Forms bundles remain in install state. The number of bundles can vary for every installation. You can safely ignore the state these bundles. The bundles are listed at `https://[server]:[port]/system/console/`.

1. Install AEM Forms add-on package. The steps are listed below:

    1. Log in to the AEM server as an administrator and open the package share. The default URL of the package share is `https://[server]:[port]/crx/packageshare`.
    1. In package share, search **[!UICONTROL AEM 6.4 Forms add-on packages]**, click the package applicable to your operating system, and click **[!UICONTROL Download]**. Read and accept the license agreement and click **[!UICONTROL OK]**. The download starts. Once downloaded, the word **[!UICONTROL Downloaded]** appears next to the package.

       Alternately, you can also use the hyperlinks listed in [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) to manually download a package.
    
    1. After the download is complete, click **[!UICONTROL Downloaded]**. You are redirected to package manager. In the package manager, search the downloaded package, and click **[!UICONTROL Install]**.

       If you manually download the package using the direct link listed in [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html), then open AEM Package Manager, click **[!UICONTROL Upload Package]**, select the downloaded package, and click upload. After the package is uploaded, click package name, and click **[!UICONTROL Install]**.

       >[!NOTE]
       >
       >After the package is installed, you are prompted to restart the AEM instance. **Do not immediately stop the server.** Before stopping the AEM Forms server, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file and the log is stable. Also note, a few packages can remain in the installed state. You can safely ignore the state of these packages.

    1. Stop the AEM instance and delete the following files:

        * `[AEM_Installation_Directory]\[crx-quickstart]\launchpad\ext\bcmail-jdk15-1.35`
        * `[AEM_Installation_Directory]\[crx-quickstart]\launchpad\ext\bcprov-jdk15-1.35`

    1. Start the AEM instance.

1. Perform post-installation activities.

    * **Run Migration Utility**

      The migration utility makes the adaptive forms and correspondence management assets of earlier versions compatible with AEM 6.4 forms. You can download the utility from AEM package share. For step-by-step information to configure and use the migration utility, see [migration utility](/help/forms/using/migration-utility.md).

      If you are using [Sample for integrating drafts & submissions component](https://helpx.adobe.com/experience-manager/6-3/forms/using/integrate-draft-submission-database.html) with the database and upgrading from a previous version, then run the following SQL queries after performing the upgrade:

      ```    
      UPDATE metadata m, additionalmetadatatable am
      SET m.dataType = am.value
      WHERE m.id = am.id
      AND am.key = 'dataType'
      
      ```

      ```    
      DELETE from additionalmetadatatable
      WHERE `key` = 'dataType'
      
      ```

    * **(If upgrading from AEM 6.2 Forms or previous versions only) Reconfigure Adobe Sign**

      If you had Adobe Sign configured in the previous version of AEM Forms, then reconfigure Adobe Sign from AEM Cloud services. For more details, see [Integrate Adobe Sign with AEM Forms](/help/forms/using/adobe-sign-integration-adaptive-forms.md).
    
    * **(If upgrading from AEM 6.2 Forms or previous versions only) Reconfigure analytics and reports**

      In AEM 6.4 Forms, traffic variable for source and success event for impression are not available. So, when you upgrade from AEM 6.2 Forms or previous versions, AEM Forms stops sending data to Adobe Analytics server and analytics reports for adaptive forms are not available. Moreover, AEM 6.4 Forms introduces traffic variable for the version of form analytics and success event for the amount of time spent on a field. So, reconfigure analytics and reports for your AEM Forms environment. For detailed steps, see [Configuring analytics and reports](/help/forms/using/configure-analytics-forms-documents.md).

1. Verify that the server is upgraded successfully, all the data is also migrated successfully, and it can operate normally.

    * **Verify the status of the bundles:** Ensure that all the bundles are in active state.
    * **Verify replication and reverse replication:** Publish, fill, and submit a few migrated forms. Verify the submitted data also.
    * **Verify access to admin and developer user interfaces:** Log in to AEM instance from an admin account and verify that you have access to the following URLs:

        * `https://[server]:[port]/crx/packmgr`
        * `https://[server]:[port]/crx/de`
        * `https://[server]:[port]/aem/forms.html/content/dam/formsanddocuments`

   >[!NOTE]
   >
   >In AEM 6.4 Forms, the structure of crx-repository has changed. After you upgrade to AEM 6.4 forms, use the changed paths for customization that you create afresh. For the complete list of changed paths, see [Forms Repository Restructuring in AEM 6.4](/help/sites-deploying/forms-repository-restructuring-in-aem-6-4.md).

## AEM 6.0 Forms and AEM 6.1 Forms > AEM 6.4 Forms {#upgrade-aem-forms-60-61-to-64}

Direct upgrade path from **AEM 6.0 Forms** and **AEM 6.1 Forms** to AEM 6.4 Forms is not available. Perform an intermediate [upgrade to AEM 6.2 Forms](/help/forms/using/upgrade.md) or [upgrade to AEM 6.3 Forms](/help/forms/using/upgrade.md) and then upgrade from AEM 6.2 Forms or AEM 6.3 Forms to AEM 6.4 Forms.
