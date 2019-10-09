---
title: DO NOT PUBLISH Upgrade or migrate to AEM 6.3 Forms
seo-title: DO NOT PUBLISH Upgrade or migrate to AEM 6.3 Forms
description: You can perform a direct upgrade from AEM 6.1 Forms and AEM 6.2 Forms to AEM 6.3 Forms. You can also perform a multi-hop upgrade from a LiveCycle version to AEM 6.3 Forms. 
seo-description: You can perform a direct upgrade from AEM 6.1 Forms and AEM 6.2 Forms to AEM 6.3 Forms. You can also perform a multi-hop upgrade from a LiveCycle version to AEM 6.3 Forms. 
page-status-flag: never-activated
uuid: 5c42e438-12d2-4951-bb96-de0d659aa627
content-type: reference
products: SG_EXPERIENCEMANAGER/6.3/FORMS
topic-tags: installing
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: df0d4356-6a32-463d-aca2-105f624c6350
---

# DO NOT PUBLISH Upgrade or migrate to AEM 6.3 Forms {#do-not-publish-upgrade-or-migrate-to-aem-forms}

AEM 6.3 Forms includes several new features and enhancements that streamline the creation, management, and user experiences with forms, documents, and correspondences. It also brings enhancements to Adobe Sign and Forms Workflow and many new features such as Data Integration. To learn about all the new capabilities and enhancements of AEM 6.3 Forms, see [New features summary document](/help/forms/using/whats-new.md.

You can upgrade or migrate from existing LiveCycle or AEM Forms to AEM 6.3 Forms. You can perform a direct upgrade from AEM 6.1 Forms and AEM 6.2 Forms to AEM 6.3 Forms. You can also perform a multi-hop upgrade from various releases of LiveCycle and AEM 6.1 Forms.

You can upgrade your existing AEM Forms server to obtain new capabilities and enhancements offered in AEM 6.3 Forms while retaining existing data, processes, and assets intact. On upgrade, metadata and state of the processes is also preserved. You can choose an upgrade path to get started with upgrade:

## Choose between upgrade and migration {#choose-between-upgrade-and-migration}

**Upgrade** refers to the process by which an existing AEM Forms server is moved from one version to a newer version. Upgrades are always fully supported and are tested in many configurations before being released. In an upgrade, data on the server is transformed at the database level, and all data, metadata, and state of the processes is preserved. Upgrading to an AEM Forms server involves downtime.

**Migration** refers to the process of replaying actions from one system into another fresh installation of AEM Forms. One of the key differences as compared to an upgrade is that a migration involves moving only assets (PDF, XDP, images, adaptive forms, adaptive documents, correspondence management assets) from one server to another - processes (LCA), settings, configurations, and a few other pieces of metadata are not migrated. Migration can be performed with the minimum amount of downtime. Depending on the modules, processes, and assets used, migration can also require a lot of rework.

### Migrate when {#migratewhen}

* You do not require existing workflows and processes. Migration does not move existing processes (LCAs) to AEM 6.3 Forms.  
* You are using AEM Forms on JEE only for document services (PDF Generator, Output, and more) or forms (adaptive forms, HTML5 forms, PDF Forms), then [Migrate to AEM 6.3 Forms on OSGi](#main-pars-accordion-container-1460251140).
* You are using AEM Forms on JEE Process Management and the [Forms-centric AEM Workflows on OSGi](/help/forms/using/aem-forms-workflow.md) capability suits your requirement.  

* You are running short lived processes on AEM Forms on JEE. You have the following choices in the order of recommendation

    * Set up a fresh AEM 6.3 Forms on JEE environment and [migrate existing processes (LCAs) or other assets to the fresh environment](#main-pars-accordion-container-1460251140).  
    
    * Install a fresh instance of AEM 6.3 Forms on OSGi, [move XDP, and other compatible assets to the new instance, and build services](#main-pars-accordion-container-1460251140), if necessary.  
    
    * Set up a fresh AEM 6.3 Forms on JEE environment and [migrate existing processes (LCA) or other assets to fresh environment](#main-pars-accordion-container-1460251140). Migrate to AEM Forms on OSGi at a later stage.

### Upgrade when {#upgrade-when}

* You are looking to use latest features of AEM 6.3 Forms while keeping everything (processes and assets) available on the previous version intact.  
* You are running long lived processes on AEM Forms on JEE.
* You are using AEM Form Document Security, [upgrade to AEM 6.3 Forms on JEE](/help/forms/using/wip/upgrade-migrate.md#main-pars-accordion-container-270280220).
* You are using [advanced feature](/help/forms/using/aem-forms-workflow.md) of AEM Forms on JEE Process Management.

You can perform a direct upgrade from AEM 6.1 Forms on JEE and AEM 6.2 Forms on JEE to AEM 6.3 Forms on JEE. You can also perform a multi-hop upgrade from LiveCycle ES2, LiveCycle ES3, LiveCycle ES4, and AEM 6.1 Forms on JEE to AEM 6.3 Forms on JEE. The following diagram displays all the possible upgrade paths:

![upgrade-path-2nd](assets/upgrade-path-2nd.png)

If you are performing an intermediate upgrade to one or more versions of LiveCycle or AEM Forms, visit the following documentation pages for corresponding upgrade instructions:

* [Upgrade to LiveCycle ES4 SP1](https://helpx.adobe.com/livecycle/topics/installing-upgrading-clustering.html)
* [Upgrade to AEM 6.1 Forms](https://helpx.adobe.com/aem-forms/6-1/upgrade.html)
* [Upgrade to AEM 6.2 Forms](https://helpx.adobe.com/aem-forms/6-2/upgrade.html)

You can perform a direct upgrade from AEM 6.1 Forms on OSGi and AEM 6.2 Forms on OSGi to AEM 6.3 Forms on OSGi. You can also perform a multi-hop upgrade from AEM 6.1 Forms on OSGi to AEM 6.3 Forms on OSGi. The following diagram displays all the possible upgrade paths:

![upgrade-path-osgi](assets/upgrade-path-osgi.png)

If you are performing an intermediate upgrade to AEM 6.2 Forms on OSGi, visit the following documentation page for corresponding upgrade instructions:

* [Upgrade to AEM 6.2 Forms](https://helpx.adobe.com/aem-forms/6-2/upgrade.html)

Direct upgrade from AEM 6.0 Forms to AEM 6.3 Forms is not available. Perform an intermediate [upgrade to AEM 6.2 Forms](https://helpx.adobe.com/aem-forms/6-2/upgrade.html) and then upgrade from AEM 6.2 Forms to AEM 6.3 Forms.

You can perform a direct upgrade from AEM 6.1 Forms and AEM 6.2 Forms to AEM 6.3 Forms. Perform the following steps to upgrade from AEM 6.1 Forms or AEM 6.2 Forms to AEM 6.3 Forms:

1. Upgrade the existing AEM instance to AEM 6.3. The steps are listed below:

    1. Install the latest service pack and patches for AEM 6.1 Forms. For details, see AEM 6.1 [release notes](https://docs.adobe.com/docs/en/aem/6-3/release-notes.html).
    1. Prepare the source instance for the upgrade. For detailed steps, see the [Upgrading to AEM 6.3](https://docs.adobe.com/docs/en/aem/6-3/deploy/upgrade.html#Preparing%20the%20source%20instance) article.
    1. Download the [AEM 6.3 QuickStart](https://docs.adobe.com/docs/en/aem/6-3/deploy.html#Getting%20the%20software).
    1. **(Unix/Linux-based installations only)** If you are using UNIX or Linux as the underlying operating system, open the terminal window, navigate to the folder containing crx-quickstart, and run the following command:

       `chmod -R 755 ../crx-quickstart`
    
    1. Upgrade your AEM 6.1 instance to AEM 6.3. For step by step instructions, see [Upgrading to AEM 6.3](https://docs.adobe.com/docs/en/aem/6-3/deploy/upgrade.html).

       Before continuing with the next steps, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file.

       >[!NOTE]
       >
       >After the server is up and running, a few AEM Forms bundles remain in install state. The number of bundles can vary for every installation. You can safely ignore the state these bundles. The bundles are listed at `https://[server]:[port]/system/console/`.

1. Prepare the upgraded AEM instance for AEM 6.3 Forms.

    1. Copy the `[AEM_installation_directory]\crx-repository\archived-versions\[time-stamp]\fonts\fonts directory to [AEM_installation_directory]\crx-repository.` 
    1. Open CRXDE Lite, navigate to /libs/fd/signatures/install, delete the **[!UICONTROL aemfd-signatures-bootdelegated-libs-pkg]** package, and click **[!UICONTROL Save All]**.
    1. Shut down the AEM server.
    1. Download AEM Forms add-on package from AEM Package Share.

       A separate AEM Forms add-on package is available for every supported operating system. For the complete list of the available packages and download links, see the [AEM Forms Releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article.
    
    1. Extract the downloaded AEM Forms add-on package.

       Copy the core-common-pkg-&lt;version&gt;.zip file from `[extracted-aem-forms-add-on-package]\jcr_root\etc\packages\day\cq60\fd\[adobe-aemds-common-pkg-version.zip]\jcr_root\etc\packages\day\cq60\fd` to `[AEM-Installation-Directory]\crx-quickstart\install directory`
    
    1. AEM Forms requires RSA and BouncyCastle libraries to be installed with AEM Forms add-on package. Perform the following steps to boot delegate these libraries:

        1. Open the sling.properties at [AEM installation]\crx-quickstart\conf\ for editing. If you use [AEM_installation_directory]\crx-quickstart\bin\start.bat to start AEM, then edit the sling.properties at [AEM_installation_directory]\crx-quickstart\
        1. Add the following properties to the sling.properties file:

           ```        
           sling.bootdelegation.class.com.rsa.jsafe.provider.JsafeJCE=com.rsa.*
           sling.bootdelegation.class.org.bouncycastle.jce.provider.BouncyCastleProvider=org.bouncycastle.*
           ```        
        
           Save and close the file.

    1. Start the AEM Server.

       Before continuing with the next steps, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file.

1. Install AEM Forms add-on package. The steps are listed below:

    1. Log in to the AEM server as an administrator and open the package share. The default URL of the package share is `https://[server]:[port]/crx/packageshare`.
    1. In package share, search **AEM 6.3 Forms add-on packages**, click the package applicable to your operating system, and click **Download**. Read and accept the license agreement and click **OK**. The download starts. Once downloaded, the word **Downloaded **appears next to the package.

       Alternately, you can also use the hyperlinks listed in the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article to manually download a package.
    
    1. After the download is complete, click **Downloaded**. You are redirected to package manager. In the package manager, search the downloaded package, and click **Install**.

       If you manually download the package using the direct link listed in the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article, then open AEM Package Manager, click **Upload Package**, select the downloaded package, and click upload. After the package is uploaded, click package name, and click **Install.**

       >[!NOTE]
       >
       >After the package is installed, you are prompted to restart the AEM instance. **Do not immediately stop the server.** Before stopping the AEM Forms server, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file and the log is stable. Also note, the following three packages can remain in the installed state. You can safely ignore the state of these packages:
       >
       >* Adobe Correspondence Management Migration
       >* Adobe LiveCycle FormsManager Core
       >* Forms Common Service

    1. Stop the AEM instance and delete the following files:

        * `[AEM_Installation_Directory]\[crx-quickstart]\launchpad\ext\bcmail-jdk15-1.35`
        * `[AEM_Installation_Directory]\[crx-quickstart]\launchpad\ext\bcprov-jdk15-1.35`

    1. Start the AEM instance.

1. Perform post-installation activities.

    * **Run Migration Utility**

      The migration utility makes the adaptive forms and correspondence management assets of earlier versions compatible with AEM 6.3 forms. You can download the utility from AEM package share. For step-by-step information to configure and use the migration utility, see [migration utility](/help/forms/using/migration-utility.md) documentation.
    
    * **Reconfigure Adobe Sign**

      If you had Adobe Sign configured in the previous version of AEM Forms, then reconfigure Adobe Sign from AEM Cloud services. For more details, see [Integrate Adobe Sign with AEM Forms](/help/forms/using/adobe-sign-integration-adaptive-forms.md).

      Moreover, AEM 6.3 Forms release has introduced many new Adobe Sign features. For step-by-step information to use Adobe Sign, see [Using Adobe Sign in an adaptive form](/help/forms/using/working-with-adobe-sign.md).
    
    * **Reconfigure analytics and reports**

      In AEM 6.3 Forms, traffic variable for source and success event for impression are not available. So, when you upgrade to AEM 6.3 Forms, AEM Forms stops sending data to Adobe Analytics server and analytics reports for adaptive forms and adaptive document are not available. Moreover, AEM 6.3 Forms introduces traffic variable for the version of form analytics and success event for the amount of time spent on a field. So, reconfigure analytics and reports for your AEM Forms environment. For detailed steps, see [Configuring analytics and reports](/help/forms/using/configure-analytics-forms-documents.md).

      Methods to calculate average fill time for forms and average read time for adaptive documents have changed. So, when you upgrade to AEM 6.3 forms, older data (data from previous AEM Forms release) for these metrics is available only in Adobe Analytics. It is not visible in AEM Forms analytics reports. For these metrics, AEM Forms analytics reports display data which is captured after performing the upgrade.

1. Verify that the server is upgraded successfully, all the data is also migrated successfully, and it can operate normally.

    * **Verify the status of the bundles:** Ensure that all the bundles are in active state.  
    
    * **Verify replication and reverse replication:** Publish, fill, and submit a few migrated forms. Verify the submitted data also.
    * **Verify access to admin and developer user interfaces:** Log in to AEM instance from an admin account and verify that you have access to the following URLs:

        * `https://[server]:[port]/crx/packmgr`
        * `https://[server]:[port]/crx/de`
        * `https://[server]:[port]/aem/forms.html/content/dam/formsanddocuments`

Direct upgrade from LiveCycle ES2, ES3, ES4, and AEM 6.0 Forms to AEM 6.3 Forms is not available. You can perform an intermediate upgrade to one or more versions of LiveCycle or AEM Forms and then upgrade from AEM 6.3 Forms. For the list of intermediate versions and corresponding upgrade instructions, see [Choose an upgrade path](/help/forms/using/wip/upgrade-migrate.md#choose-an-upgrade-path).

Perform the following procedure to upgrade an existing version of LiveCycle or AEM Forms on OSGi to AEM 6.3 Forms:

1. Download the AEM 6.3 Forms on JEE installer from the [Adobe Licensing Website (LWS)](https://licensing.adobe.com/). You require a valid Maintenance & Support contract to download the installer.
1. Read the [Upgrade checklist and planning](https://www.adobe.com/go/learn_aemfroms_upgrade_checklist_63) document to learn about the checks to perform to ensure a successful upgrade.
1. Use the [Prepare to upgrade to AEM Forms](https://www.adobe.com/go/learn_aemforms_prepareupgrade_63) to learn and perform the tasks that ensure the upgrade runs correctly with minimal server downtime.
1. Depending on your application server, choose one of the following documents and follow the instructions:

    * [Upgrade to AEM Forms for JBoss](https://www.adobe.com/go/learn_aemforms_upgradeJBoss_63)
    * [Upgrade to AEM Forms for WebLogic](https://www.adobe.com/go/learn_aemforms_upgradeWebLogic_63)
    * [Upgrade to AEM Forms for WebSphere](https://www.adobe.com/go/learn_aemforms_upgradeWebSphere_63)
    * [Upgrade to AEM Forms using JBoss Turnkey](https://www.adobe.com/go/learn_aemforms_upgradeTurnkey_63)

Download the [AEM 6.3 QuickStart](https://docs.adobe.com/docs/en/aem/6-3/deploy.html#Getting%20the%20software).

Upgrade your AEM 6.2 instance to AEM 6.3. For step by step instructions, see [https://docs-author.corp.adobe.com/content/docs/en/aem/6-3/deploy/upgrade.html](https://docs.adobe.com/docs/en/aem/6-3/release-notes.html)

**(Unix/Linux-based installations only)** If you are using UNIX or Linux as the underlying operating system, open the terminal window, navigate to the folder containing crx-quickstart, and run the following command:

`chmod -R 755 ../crx-quickstart`

[Work in Progress]

Migration involves moving only assets (PDF, XDP, images, adaptive forms, adaptive documents, correspondence management assets) from one server to another - processes (LCA), settings, configurations, and a few other pieces of metadata are not migrated. Perform the following steps to migrate to AEM 6.3 Forms:

1. Set up a fresh environment of [AEM 6.3 Forms](https://adobe.com/go/learn_aemforms_documentation_63). 
1. Move XDP or other compatible assets to the freshly set instance. For detailed instructions, see [Importing and exporting assets to AEM Forms](/help/forms/using/import-export-forms-templates.md). [  
   ](/help/forms/using/import-export-forms-templates.md) 
1. Build the required services, if any.

   For example, if you are using AEM Forms on JEE Document Services, changes are required in the code to use document services available in AEM Forms on OSGi.

1. Perform post-installation activities:

    * **Run Migration Utility**

      The migration utility makes the adaptive forms and correspondence management assets of earlier versions compatible with AEM 6.3 forms. You can download the utility from AEM package share. For step-by-step information to configure and use the migration utility, see [migration utility](/help/forms/using/migration-utility.md) documentation.
    
    * **Reconfigure Adobe Sign**

      If you had Adobe Sign configured in the previous version of AEM Forms, then reconfigure Adobe Sign from AEM Cloud services. For more details, see [Integrate Adobe Sign with AEM Forms](/help/forms/using/adobe-sign-integration-adaptive-forms.md).

      Moreover, AEM 6.3 Forms release has introduced many new Adobe Sign features. For step-by-step information to use Adobe Sign, see [Using Adobe Sign in an adaptive form](/help/forms/using/working-with-adobe-sign.md).
    
    * **Reconfigure analytics and reports**

      In AEM 6.3 Forms, traffic variable for source and success event for impression are not available. So, when you upgrade to AEM 6.3 Forms, AEM Forms stops sending data to Adobe Analytics server and analytics reports for adaptive forms and adaptive document are not available. Moreover, AEM 6.3 Forms introduces traffic variable for the version of form analytics and success event for the amount of time spent on a field. So, reconfigure analytics and reports for your AEM Forms environment. For detailed steps, see [Configuring analytics and reports](/help/forms/using/configure-analytics-forms-documents.md).

      Methods to calculate average fill time for forms and average read time for adaptive documents have changed. So, when you upgrade to AEM 6.3 forms, older data (data from previous AEM Forms release) for these metrics is available only in Adobe Analytics. It is not visible in AEM Forms analytics reports. For these metrics, AEM Forms analytics reports display data which is captured after performing the upgrade.

[TBD]
