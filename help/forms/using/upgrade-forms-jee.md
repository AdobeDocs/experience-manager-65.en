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

# Upgrade to AEM 6.4 Forms on JEE {#upgrade-to-aem-forms-jee}

Use one of the following upgrade paths, as appropriate for your environment.

## AEM 6.2 Forms on JEE, or AEM 6.3 Forms on JEE > AEM 6.4 Forms on JEE {#aem-forms-jee-62-63-to-64}

Perform the following procedure to upgrade existing AEM 6.2 Forms on JEE or AEM 6.3 Forms on JEE to AEM 6.4 Forms on JEE:

1. Download the AEM 6.4 Forms on JEE installer from the [Adobe Licensing Website (LWS)](https://licensing.adobe.com/). You require a valid Maintenance & Support contract to download the installer.
1. See [Upgrade checklist and planning](https://www.adobe.com/go/learn_aemfroms_upgrade_checklist_63) to learn about the checks to perform to ensure a successful upgrade.
1. See [Prepare to upgrade to AEM Forms](https://www.adobe.com/go/learn_aemforms_prepareupgrade_63) to learn and perform the tasks that ensure the upgrade runs correctly with minimal server downtime.
1. Depending on your existing environment and application server, choose one of the following documents and follow the instructions.

    * [Upgrade from AEM 6.2 or AEM 6.3 Forms to AEM 6.4 Forms for JBoss](assets/upgrade-jboss.pdf)
    * [Upgrade from AEM 6.2 or AEM 6.3 Forms to AEM 6.4 Forms for WebLogic](assets/upgrade-weblogic.pdf)
    * [Upgrade from AEM 6.2 or AEM 6.3 Forms to AEM 6.4 Forms for WebSphere](assets/upgrade-websphere.pdf)
    * [Upgrade from AEM 6.2 or AEM 6.3 Forms to AEM 6.4 Forms for JBoss Turnkey](assets/upgrade-turnkey.pdf)

## AEM 6.0 Forms on JEE > AEM 6.3 Forms on JEE {#aem-forms-jee-60-to-63}

Direct upgrade from LiveCycle ES2, LiveCycle ES3, AEM 6.0 Forms, AEM 6.1 Forms to AEM 6.4 Forms is not available. You can perform an intermediate upgrade to one or more versions of LiveCycle or AEM Forms and then upgrade from AEM 6.4 Forms. For the list of intermediate versions and corresponding upgrade instructions, see [Choose an upgrade path](/help/forms/using/upgrade.md#main-pars-header).

## LiveCycle ES4 SP1 > AEM 6.4 Forms on JEE {#livecycle-es4sp1-forms-jee}

Upgrading LiveCycle ES4 SP1 to AEM 6.4 Forms on JEE is an out-of-place upgrade, as it involves migrating assets and data from previous versions to the fresh instances (new versions) of supported application servers, operating systems, and databases.

Following is an overview of the procedure to upgrade an existing LiveCycle ES4 SP1 server to AEM 6.4 Forms. For detailed instructions, see the documents listed at the end of the procedure.

1. Before you upgrade:

    1. Download the AEM 6.4 Forms on JEE installer from the [Adobe Licensing Website (LWS)](https://licensing.adobe.com/). You require a valid Maintenance & Support contract to download the installer.
    1. Decide the Content Repository (CRX Repository) type to use. Only a few AEM Forms on JEE capabilities use Content Repository persistence to store content and assets. Install and configure Content Repository only if you plan to use such AEM Forms on JEE capabilities:

        * In LiveCycle ES4 SP1, the Correspondence Management, Forms Portal, HTML Workspace, and Process Reporting capabilities use Content Repository. If you did not use these capabilities in LiveCycle ES4 and plan not to use these capabilities in AEM Forms, then Content Repository is not required.
        * In AEM Forms, Adaptive Forms, Correspondence Management, HTML5 Forms (Known as Mobile Forms in LiveCycle ES4 SP1), Forms Portal, HTML Workspace, Process Reporting, Forms centric workflows on OSGi, capabilities use Content Repository. If you plan to use AEM Forms for these capabilities, then Content Repository is required.
        * You do not require Content Repository for AEM Forms Document Security.

       Moreover, repository type of LiveCycle and AEM Forms are different. For available repository types and related information, see [Choosing a persistence type for an AEM Forms installation](/help/forms/using/choosing-persistence-type-for-aem-forms.md). 
    
    1. Create a backup of LiveCycle ES4 SP1 content and data:

       Create a backup of LiveCycle ES4 SP1 database, Global Data Storage (GDS), and crx-repository (not required for document security). If you're upgrading to MongoMK or RDBMK persistence, export LiveCycle ES4 SP1 correspondence management assets in a .cmp file and forms assets as an AEM package.
    
    1. Ensure your existing platform (that is, application server, database, operating system, Adobe Acrobat, third-party applications, and hardware) is supported for AEM 6.4 Forms on JEE. For information about supported hardware and software, refer to the [Supported Platform Combinations](/help/forms/using/aem-forms-jee-supported-platforms.md) document.

       If you create a fresh instance of the database, import the data backed up in step 3 to the database. For information about how to import data to a database, see documentation of corresponding database vendor.

       >[!NOTE]
       >
       >If you are using RDBMK persistence format, use a single database for both repository persistence and document services running on AEM Forms on JEE.

1. Perform the upgrade:

    1. Install AEM 6.4 Forms on JEE on a new server by running the installation program. The installer places all of the required files onto your computer, within one installation directory structure.  
    1. After installation is complete, run the **Configuration Manager** to configure various AEM Forms modules and set appropriate configurations. Along with configuring settings, it allows to specify the path of Global Data Storage (GDS) and crx-repository.

       >[!NOTE]
       >
       >On the Upgrade Task Selection screen, select the **[!UICONTROL Upgrade from Adobe Experience Manager Forms 6.2.0]** option. The **[!UICONTROL Upgrade from Adobe Experience Manager Forms 6.2.0]** option allows the configuration manager to upgrade from LiveCycle ES4 SP1 to AEM 6.4 Forms.

    1. (Not required for AEM Forms document security module) Import content to the Content Repository (CRX-Repository) to AEM 6.4 Forms server.

       >[!NOTE]
       >
       >* After the crx-repository is upgraded and the content is migrated, change the password of the admin account. For detailed instructions, see [Changing the Password for an Existing User](/help/sites-administering/granite-user-group-admin.md).

1. Perform the post-deployment tasks to verify login credentials, configure document services, correspondence management, document security, and more depending on your use case.
1. Verify that the server is upgraded successfully:

   Perform a few routine operations on upgraded AEM Forms server to ensure that the server is upgraded successfully. You can fill and submit a few migrated forms or protect documents to ensure a successful upgrade.

   >[!NOTE]
   >
   >In AEM 6.4 Forms, the structure of crx-repository has changed. After you upgrade to AEM 6.4 forms, use the changed paths for customization that you create afresh. For the complete list of changed paths, see [Forms Repository Restructuring in AEM 6.4](/help/sites-deploying/forms-repository-restructuring-in-aem-6-4.md).

**Depending on your existing environment and application server, choose one of the following documents and follow the detailed instructions:**

* [Upgrade from LiveCycle ES4 SP1 to AEM 6.4 Forms for JBoss](assets/upgrade-jboss-livecycle.pdf)
* [Upgrade from LiveCycle ES4 SP1 to AEM 6.4 Forms for WebLogic](assets/upgrade-weblogic-livecycle.pdf)
* [Upgrade from LiveCycle ES4 SP1 to AEM 6.4 Forms for WebSphere](assets/upgrade-websphere-livecycle.pdf)
* [Upgrade from LiveCycle ES4 SP1 to AEM 6.4 Forms using JBoss Turnkey](assets/upgrade-turnkey-livecycle.pdf)

<!--Theses sections used to be an accordion until converted to straight Markdown. When accordions are enabled, revert-->

## LiveCycle ES3 > AEM 6.4 Forms on JEE {#livecycle-es3-forms-jee}

Upgrading LiveCycle ES3 to AEM 6.4 Forms on JEE is an out-of-place upgrade, as it involves migrating assets and data from previous versions to the fresh instances (new versions) of supported application servers, operating systems, and databases.

Following is an overview of the procedure to upgrade an existing LiveCycle ES3 server to AEM 6.4 Forms. For detailed instructions, see the documents listed at the end of the procedure.

1.  Before you upgrade:  
    
    1.  Download the AEM 6.4 Forms on JEE installer from the [Adobe Licensing Website (LWS)](https://licensing.adobe.com/). You require a valid Maintenance & Support contract to download the installer.
    1.  Decide the Content Repository (CRX Repository) type to use. Only a few AEM Forms on JEE capabilities use Content Repository persistence to store content and assets. Install and configure Content Repository only if you plan to use such AEM Forms on JEE capabilities:
        
        *   In AEM Forms, Adaptive Forms, Correspondence Management, HTML5 Forms, Forms Portal, HTML Workspace, Process Reporting, and Forms centric workflows on OSGi capabilities use Content Repository. If you plan to use AEM Forms for these capabilities, then Content Repository is required.
        *   You do not require Content Repository for AEM Forms Document Security.
        
        Moreover, repository type of LiveCycle and AEM Forms are different. For available repository types and related information, see [Choosing a persistence type for an AEM Forms installation](/help/forms/using/choosing-persistence-type-for-aem-forms.md).

    1.  Create a backup of LiveCycle ES3 database, Global Data Storage (GDS), and Content Repository (not required for document security). If you're upgrading to MongoMK or RDBMK persistence, export LiveCycle ES3 correspondence management assets as an archive.
    1.  Ensure your existing platform (that is, application server, database, operating system, Adobe Acrobat, third-party applications, and hardware) is supported for AEM 6.4 Forms on JEE. For information about supported hardware and software, refer to the [Supported Platform Combinations](/help/forms/using/aem-forms-jee-supported-platforms.md) document.
        
        If you create a fresh instance of the database, import the data backed up in step 3 to the database. For information about how to import data to a database, see documentation of corresponding database vendor.  
        
        >[!NOTE] If you are using RDBMK persistence format, use single database for both repository persistence and document services running on AEM Forms on JEE.
        
1.  Perform the upgrade:
    
    1.  Install AEM 6.4 Forms on JEE on a new server by running the installation program. The installer places all of the required files onto your computer, within one installation directory structure.
    1.  After installation is complete, run the **Configuration Manager** to configure various AEM Forms modules and set appropriate configurations. Along with configuring settings, it allows to specify the path of Global Data Storage (GDS) and crx-repository.
        
        >[!NOTE] On the Upgrade Task Selection screen, select the **[!UICONTROL Upgrade from Adobe Experience Manager Forms 6.2.0]** option. The **[!UICONTROL Upgrade from Adobe Experience Manager Forms 6.2.0]** option allows the configuration manager to upgrade from LiveCycle ES3 to AEM 6.4 Forms.  
        
    1.  (Not required for AEM Forms document security module) Upgrade and import the CRX repository to AEM 6.4 Forms server.
        
        >[!NOTE] After the crx-repository is upgraded and the content is migrated, change the password of the admin account. For detailed instructions, see [Changing the Password for an Existing User](/help/sites-administering/granite-user-group-admin.md).
1.  Perform the post-deployment tasks to verify login credentials, configure document services, correspondence management, document security, and more depending on your use case.
1.  Verify that the server is upgraded successfully:  
    
    Perform a few routine operations on upgraded AEM Forms server to ensure that the server is upgraded successfully. You can fill and submit a few migrated forms or protect documents to ensure a successful upgrade.  
    
    >[!NOTE] In AEM 6.4 Forms, the structure of crx-repository has changed. After you upgrade to AEM 6.4 forms, use the changed paths for customization that you create afresh. For the complete list of changed paths, see [Forms Repository Restructuring in AEM 6.4](/help/sites-deploying/forms-repository-restructuring-in-aem-6-4.md).

**Depending on your existing environment and application server, choose one of the following documents and follow the detailed instructions:**

*   [Upgrade from LiveCycle ES3 to AEM 6.4 Forms for JBoss](assets/upgrade-jboss-livecycle-es3.pdf)
*   [Upgrade from LiveCycle ES3 to AEM 6.4 Forms for WebLogic](assets/upgrade-weblogic-livecycle-es3.pdf)
*   [Upgrade from LiveCycle ES3 to AEM 6.4 Forms for WebSphere](assets/upgrade-websphere-livecycle-es3.pdf)
*   [Upgrade from LiveCycle ES3 to AEM 6.4 Forms using JBoss Turnkey](assets/upgrade-turnkey-livecycle-es3.pdf)
