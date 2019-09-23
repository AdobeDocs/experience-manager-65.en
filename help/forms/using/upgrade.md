---
title: Upgrade to AEM 6.5 Forms
seo-title: Upgrade to AEM 6.5 Forms
description: You can perform a direct upgrade from AEM 6.3 Forms and AEM 6.4 Forms to AEM 6.5 Forms. 
seo-description: You can perform a direct upgrade from AEM 6.3 Forms and AEM 6.4 Forms to AEM 6.5 Forms. 
uuid: b2259f21-678e-4a5d-98c4-7017d3e58b8f
content-type: reference
topic-tags: installing
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: 3ef2fe0d-3b2d-4757-8f57-a789d24f997c
index: y
internal: n
snippet: y
---

# Upgrade to AEM 6.5 Forms{#upgrade-to-aem-forms}

AEM 6.5 Forms includes several new features and enhancements that streamline the creation, management, and user experiences with forms and correspondences. To learn about all the new capabilities and enhancements of AEM 6.5 Forms, see [New features summary document](../../forms/using/whats-new.md).

You can upgrade your existing LiveCycle or AEM Forms installation to obtain new capabilities and enhancements offered in AEM 6.5 Forms while retaining existing data, processes, and assets intact. On upgrade, metadata and state of the processes are also preserved. You can choose an upgrade path to get started with upgrade.

<!--
Comment Type: draft

<h2>Choose between upgrade and migration</h2>
-->

<!--
Comment Type: draft

<p><strong>Upgrade</strong> refers to the process by which an existing AEM Forms server is moved from one version to a newer version. Upgrades are always fully supported and are tested in many configurations before being released. In an upgrade, data on the server is transformed at the database level, and all data, metadata, and state of the processes is preserved. Upgrading to an AEM Forms server involves downtime.</p>
-->

<!--
Comment Type: draft

<p><strong>Migration</strong> refers to the process of replaying actions from one system into another fresh installation of AEM Forms. One of the key differences as compared to an upgrade is that a migration involves moving only assets (PDF, XDP, images, adaptive forms, correspondence management assets) from one server to another - processes (LCA), settings, configurations, and a few other pieces of metadata are not migrated. Migration can be performed with the minimum amount of downtime. Depending on the modules, processes, and assets used, migration can also require a lot of rework.</p>
-->

The following diagram displays the available upgrade paths for AEM Forms on OSGi:

![](do-not-localize/osgi-upgrade-path.png)

You can perform a direct upgrade from:

* AEM 6.3 Forms on OSGi  
* AEM 6.4 Forms on OSGi

You can also perform a multi-hop upgrade from

* AEM 6.0 Forms on OSGi
* AEM 6.1 Forms on OSGi
* AEM 6.2 Forms on OSGi

The following diagram displays the available upgrade paths for AEM Forms on JEE:

![](do-not-localize/jee-upgrade-6-5.png)

You can perform a direct upgrade from:

* AEM 6.3 Forms on JEE  
* AEM 6.4 Forms on JEE

You can also perform a multi-hop upgrade from

* LiveCycle ES2
* LiveCycle ES3
* LiveCycle ES4 SP1  
* AEM 6.0 Forms on JEE   
* AEM 6.1 Forms on JEE   
* AEM 6.2 Forms on JEE

You can perform a direct upgrade from AEM 6.3 Forms or AEM 6.4 Forms to AEM 6.5 Forms. Do the following:

1. Upgrade the existing AEM instance to AEM 6.5. The steps are listed below:

    1. Install the latest service pack and patches for AEM 6.3 Forms or AEM 6.4 Forms. For details, see [AEM Sustenance Hub](https://helpx.adobe.com/experience-manager/aem-releases-updates.html).
    1. Prepare the source instance for the upgrade. For detailed steps, see [Upgrading to AEM 6.5](../../sites/deploying/using/upgrade.md).
    1. Download the [AEM 6.5 QuickStart](../../sites/deploying/using/deploy.md#getting%20the%20software).
    1. **(Unix/Linux-based installations only)** If you are using UNIX or Linux as the underlying operating system, open the terminal window, navigate to the folder containing crx-quickstart, and run the following command:

       `chmod -R 755 ../crx-quickstart`
    
    1. Upgrade your AEM instance to AEM 6.3. For step by step instructions, see [Upgrading to AEM 6.5](../../sites/deploying/using/upgrade.md).

       Before continuing with the next steps, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file.

       >[!NOTE]
       >
       >After the server is up and running, a few AEM Forms bundles remain in install state. The number of bundles can vary for every installation. You can safely ignore the state these bundles. The bundles are listed at http://[server]:[port]/system/console/.

1. Install AEM Forms add-on package. The steps are listed below:

    1. Log in to the AEM server as an administrator and open the package share. The default URL of the package share is http://[server]:[port]/crx/packageshare.
    1. In package share, search **AEM 6.5 Forms add-on packages**, click the package applicable to your operating system, and click **Download**. Read and accept the license agreement and click **OK**. The download starts. Once downloaded, the word **Downloaded **appears next to the package.

       Alternately, you can also use the hyperlinks listed in [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) to manually download a package.
    
    1. After the download is complete, click **Downloaded**. You are redirected to package manager. In the package manager, search the downloaded package, and click **Install**.

       If you manually download the package using the direct link listed in [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html), then open AEM Package Manager, click **Upload Package**, select the downloaded package, and click upload. After the package is uploaded, click package name, and click **Install.**

       >[!NOTE]
       >
       >After the package is installed, you are prompted to restart the AEM instance. **Do not immediately stop the server.** Before stopping the AEM Forms server, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the &lt;crx-repository&gt;/error.log file and the log is stable. Also note, a few packages can remain in the installed state. You can safely ignore the state of these packages.

    1. Restart the AEM instance.

1. Perform post-installation activities.

    * **Run Migration Utility**

      The migration utility makes the adaptive forms and correspondence management assets of earlier versions compatible with AEM 6.5 forms. You can download the utility from AEM package share. For step-by-step information to configure and use the migration utility, see [migration utility](../../forms/using/migration-utility.md).

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

      If you had Adobe Sign configured in the previous version of AEM Forms, then reconfigure Adobe Sign from AEM Cloud services. For more details, see [Integrate Adobe Sign with AEM Forms](../../forms/using/adobe-sign-integration-adaptive-forms.md).
    
    * **Support for jQuery**

      In AEM 6.5 Forms, version of jQuery is updated to 3.2.1 and jQuery UI version is updated to 1.12.1. AEM Form uses JQuery in **noConflict** mode. So, if you are using any other jQuery version, no issues are displayed while performing an upgrade. However, when you upgrade to AEM 6.5 Forms:

        * Ensure that your custom components, if any, are compatible with supported jQuery versions.
        * Remove unsupported APIs from the custom components. See [upgrade guide](https://jquery.com/upgrade-guide/3.0/) for the list of removed APIs. For example, support for the load(), .unload(), and .error() APIs is removed. Use the .on() method in place of aforementioned APIs. For example, change $("img").load(fn) to $("img").on("load", fn).

    * **(If upgrading from AEM 6.2 Forms or previous versions only) Reconfigure analytics and reports  
      **

      In AEM 6.4 Forms, traffic variable for source and success event for impression are not available. So, when you upgrade from AEM 6.2 Forms or previous versions, AEM Forms stops sending data to Adobe Analytics server and analytics reports for adaptive forms are not available. Moreover, AEM 6.4 Forms introduces traffic variable for the version of form analytics and success event for the amount of time spent on a field. So, reconfigure analytics and reports for your AEM Forms environment. For detailed steps, see [Configuring analytics and reports](../../forms/using/configure-analytics-forms-documents.md).

1. Verify that the server is upgraded successfully, all the data is also migrated successfully, and it can operate normally.

    * **Verify the status of the bundles: **Ensure that all the bundles are in active state.  
    
    * **Verify replication and reverse replication:** Publish, fill, and submit a few migrated forms. Verify the submitted data also.
    * **Verify access to admin and developer user interfaces:** Log in to AEM instance from an admin account and verify that you have access to the following URLs:

        * http://[server]:[port]/crx/packmgr
        * http://[server]:[port]/crx/de
        * http://[server]:[port]/aem/forms.html/content/dam/formsanddocuments

   >[!NOTE]
   >
   >In AEM 6.4 Forms, the structure of crx-repository has changed. If upgrade from 6.3 Forms to AEM 6.5 Forms, use the changed paths for customization that you create afresh. For the complete list of changed paths, see [Forms Repository Restructuring in AEM](/sites/deploying/using/forms-repository-restructuring-in-aem-6-4.md).

Direct upgrade path from **AEM 6.0 Forms, AEM 6.1 Forms**, and **AEM 6.2 Forms** to AEM 6.5 Forms is not available. Perform an intermediate [upgrade to AEM 6.2 Forms](https://helpx.adobe.com/experience-manager/6-2/forms/using/upgrade.html), [upgrade to AEM 6.3 Forms](https://helpx.adobe.com/experience-manager/6-3/forms/using/upgrade.html), or [upgrade to AEM 6.4 Forms](/help/forms/using/upgrade.md) and then upgrade from AEM 6.3 Forms, or AEM 6.4 Forms to AEM 6.5 Forms.

Perform the following procedure to upgrade existing AEM 6.3 Forms on JEE or AEM 6.4 Forms on JEE to AEM 6.5 Forms on JEE:

1. Download the AEM 6.5 Forms on JEE installer from the [Adobe Licensing Website (LWS)](http://licensing.adobe.com/). You require a valid Maintenance & Support contract to download the installer.
1. See [Upgrade checklist and planning](http://www.adobe.com/go/learn_aemfroms_upgrade_checklist_65) to learn about the checks to perform to ensure a successful upgrade.
1. See [Prepare to upgrade to AEM Forms](http://www.adobe.com/go/learn_aemforms_prepareupgrade_65) to learn and perform the tasks that ensure the upgrade runs correctly with minimal server downtime.
1. Depending on your existing environment and application server, choose one of the following documents and follow the instructions.

    * [Upgrade from AEM 6.3 or AEM 6.4 Forms to AEM 6.5 Forms for JBoss](assets/upgrade-jboss.pdf)
    * [Upgrade from AEM 6.3 or AEM 6.4 Forms to AEM 6.5 Forms for WebSphere](assets/upgrade-websphere.pdf)
    * [Upgrade from AEM 6.3 or AEM 6.4 Forms to AEM 6.5 Forms for JBoss Turnkey](assets/upgrade-turnkey.pdf)

Direct upgrade from LiveCycle ES2, LiveCycle ES3, AEM 6.0 Forms, AEM 6.1 Forms, AEM 6.2 Forms to AEM 6.5 Forms is not available. You can perform an intermediate upgrade to one or more versions of LiveCycle or AEM Forms and then upgrade from AEM 6.5 Forms. For the list of intermediate versions and corresponding upgrade instructions, see [Choose an upgrade path](../../forms/using/upgrade.md#main-pars-header).

Download the [AEM 6.3 QuickStart](https://docs.adobe.com/docs/en/aem/6-3/deploy.html#Getting%20the%20software).

Upgrade your AEM 6.2 instance to AEM 6.3. For step by step instructions, see [https://docs-author.corp.adobe.com/content/docs/en/aem/6-3/deploy/upgrade.html](https://docs.adobe.com/docs/en/aem/6-3/release-notes.html)

**(Unix/Linux-based installations only)** If you are using UNIX or Linux as the underlying operating system, open the terminal window, navigate to the folder containing crx-quickstart, and run the following command:

`chmod -R 755 ../crx-quickstart`

[Work in Progress]

Migration involves moving only assets (PDF, XDP, images, adaptive forms, correspondence management assets) from one server to another - processes (LCA), settings, configurations, and a few other pieces of metadata are not migrated. Perform the following steps to migrate to AEM 6.3 Forms:

1. Set up a fresh environment of [AEM 6.3 Forms](http://adobe.com/go/learn_aemforms_documentation_63). 
1. Move XDP or other compatible assets to the freshly set instance. For detailed instructions, see [Importing and exporting assets to AEM Forms](../../forms/using/import-export-forms-templates.md). [  
   ](../../forms/using/import-export-forms-templates.md) 
1. Build the required services, if any.

   For example, if you are using AEM Forms on JEE Document Services, changes are required in the code to use document services available in AEM Forms on OSGi.

1. Perform post-installation activities:

    * **Run Migration Utility**

      The migration utility makes the adaptive forms and correspondence management assets of earlier versions compatible with AEM 6.3 forms. You can download the utility from AEM package share. For step-by-step information to configure and use the migration utility, see [migration utility](../../forms/using/migration-utility.md) documentation.
    
    * **Reconfigure Adobe Sign**

      If you had Adobe Sign configured in the previous version of AEM Forms, then reconfigure Adobe Sign from AEM Cloud services. For more details, see [Integrate Adobe Sign with AEM Forms](../../forms/using/adobe-sign-integration-adaptive-forms.md).

      Moreover, AEM 6.3 Forms release has introduced many new Adobe Sign features. For step-by-step information to use Adobe Sign, see [Using Adobe Sign in an adaptive form](../../forms/using/working-with-adobe-sign.md).
    
    * **Reconfigure analytics and reports  
      **

      In AEM 6.3 Forms, traffic variable for source and success event for impression are not available. So, when you upgrade to AEM 6.3 Forms, AEM Forms stops sending data to Adobe Analytics server and analytics reports for adaptive forms are not available. Moreover, AEM 6.3 Forms introduces traffic variable for the version of form analytics and success event for the amount of time spent on a field. So, reconfigure analytics and reports for your AEM Forms environment. For detailed steps, see [Configuring analytics and reports](../../forms/using/configure-analytics-forms-documents.md).

      Methods to calculate average fill time for forms and average read time for have changed. So, when you upgrade to AEM 6.3 forms, older data (data from previous AEM Forms release) for these metrics is available only in Adobe Analytics. It is not visible in AEM Forms analytics reports. For these metrics, AEM Forms analytics reports display data which is captured after performing the upgrade.

[TBD]

<!--
Comment Type: draft

<h4 id="MigrateWhen">Migrate when</h4>
-->

<!--
Comment Type: draft

<ul>
<li>You do not require existing workflows and processes. Migration does not move existing processes (LCAs) to AEM 6.3 Forms.<br /> </li>
<li>You are using AEM Forms on JEE only for document services (PDF Generator, Output, and more) or forms (adaptive forms, HTML5 forms, PDF Forms), then <a href="#main-pars-accordion-container-1460251140">Migrate to AEM 6.3 Forms on OSGi</a>.</li>
<li>You are using AEM Forms on JEE Process Management and the <a href="../../forms/using/aem-forms-workflow.md" target="_blank">Forms-centric AEM Workflows on OSGi</a> capability suits your requirement.<br /> </li>
<li>You are running short lived processes on AEM Forms on JEE. You have the following choices in the order of recommendation
<ul>
<li>Set up a fresh AEM 6.3 Forms on JEE environment and <a href="#main-pars-accordion-container-1460251140">migrate existing processes (LCAs) or other assets to the fresh environment</a>.<br /> </li>
<li>Install a fresh instance of AEM 6.3 Forms on OSGi, <a href="#main-pars-accordion-container-1460251140">move XDP, and other compatible assets to the new instance, and build services</a>, if necessary.<br /> </li>
<li>Set up a fresh AEM 6.3 Forms on JEE environment and <a href="#main-pars-accordion-container-1460251140" style="outline: 1px dotted; outline-offset: 0px;">migrate existing processes (LCA) or other assets to fresh environment</a>. Migrate to AEM Forms on OSGi at a later stage.<br /> </li>
</ul> </li>
</ul>
-->

<!--
Comment Type: draft

<h4>Upgrade when</h4>
-->

<!--
Comment Type: draft

<ul>
<li>You are looking to use latest features of AEM 6.3 Forms while keeping everything (processes and assets) available on the previous version intact.<br /> </li>
<li>You are running long lived processes on AEM Forms on JEE.</li>
<li>You are using AEM Form Document Security, <a href="../../forms/using/upgrade.md#main-pars-accordion-container-270280220">upgrade to AEM 6.3 Forms on JEE</a>.</li>
<li>You are using <a href="../../forms/using/aem-forms-workflow.md" target="_blank">advanced feature</a> of AEM Forms on JEE Process Management.</li>
</ul>
-->

