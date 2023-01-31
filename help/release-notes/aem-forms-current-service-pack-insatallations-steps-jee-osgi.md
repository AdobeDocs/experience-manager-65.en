---
title: AEM Forms Patch Installation Instructions for AEM Forms
description: AEM Forms service pack installtions instructions for OSGi and JEE environment
SEO Description: AEM Forms installation instructions for OSGi and JEE environment 
---

# AEM 6.5 Forms Service Pack installation instructions {#aem-form-patch-installation-instructions}

## Release information

| Product   | Adobe Experience Manager 6.5 Forms  |
|---|---|
| Version  |  6.5.15.0 |
| Type  |  Service Pack release |
| Date  |  December 01, 2022 |
| Download URL | [Latest AEM Forms Releases](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/release-notes.html) |

## What is included in Experience Manager Forms 6.5

Adobe Experience Manager (AEM) Forms service pack includes new and upgraded features, such as key customer-requested enhancements, performance, stability, and security improvements. AEM Forms releases service packs at a regular interval to provide latest features and improvements. Depending on your stack, choose one of the following paths to download and install service pack on your environment: 

* [Download and install Service Pack on an AEM Forms on JEE envrionment](#download-and-install-for-jee-service-pack) 
* [Download and install Service Pack on an AEM Forms on OSGi envrionment](#download-and-install-for-osgi-service-pack) 

>[!NOTE]
>
> Adobe releases a full installer after every 6th service pack. AEM 6.5 Forms Service Pack 12 (6.5.12.0) on JEE is the last full installer. The full installer provides support for new platforms while the regular service pack installer includes only bug fixes and general improvements. If you are performing a fresh installation or planning to use latest software for your AEM 6.5 Forms on JEE environment, Adobe recommends using AEM 6.5.12.0 Forms on JEE full installer released on 03 March 2022 instead of AEM 6.5 Forms installer released on 08 April 2019. After using the full installer, install the latest service pack.  

## Download and install Service Pack on an AEM Forms on JEE envrionment {#download-and-install-for-jee-service-pack}

![JEE Installation](/help/forms/using/assets/jeeinstallation.png)

+++1. Take backup of your existing envronment:
   
   1. Backup your [CRX Repository, Database Schema, and GDS (Global Document Storage)](https://experienceleague.adobe.com/docs/experience-manager-65/forms/administrator-help/aem-forms-backup-recovery/backing-aem-forms-data.html). 
   1. Backup  the &lt;*AEM_forms_root*&gt;/deploy folder. It is required if you decide to uninstall the service pack.

   >[!NOTE]
   >
   > Before running the AEM installer, make sure you have write-access rights.

+++

+++2.Download the required software:

* [AEM Forms on JEE 6.5.15.0 Service Pack](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/release-notes.html?lang=en)
* [AEM 6.5.15.0 Service Pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip)
* [Forms add-on package](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package)
* [Fragment](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar)
* [Bundle](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/bundle.jar)



+++

+++3. Install AEM Forms on JEE service pack:

   1. Stop your application server.
   1. Extract the **AEM Forms on JEE 6.5.15.0 Service Pack installer archive** to your hard drive: 

      * **Windows** 
          Navigate to the appropriate directory on the installation media or folder on your hard disk where you copied     the installer, and double-click the `aemforms65_cfp_install.exe` file.

          * (Windows 32-bit) `Windows\Disk1\InstData\VM`
          * (Windows 64-bit) `Windows_64Bit`\ `Disk1\InstData\VM`

      * **Linux** 
          Navigate to the appropriate directory, and from a shell and type `./aem65_cfp_install.bin`.

          * (Linux) `Linux/Disk1/InstData/NoVM` 

      This launches an install wizard that guides you through the installation.

   1.  On the Introduction panel, click **[!UICONTROL Next]**.
   1.  On the **Choose Install Folder** screen, verify that the default location displayed is correct for your existing installation, or click **[!UICONTROL Browse]** to select the alternate folder where AEM forms is installed, and click **[!UICONTROL Next]**.
   1.  Read the Sevice Pack summary information and click **[!UICONTROL Next]**.
   1.  Read the Pre-Installation Summary information and click **[!UICONTROL Install]**.
   1.  When the installation is complete, click **[!UICONTROL Next]** to apply the quick fix updates to your installed files.
   1.  **[For Windows only]:** Perform one of the following step:
   
         * Either deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. Run **Configuration Manager** by using the **ConfigurationManager.bat** file located in `[aem-forms root]\configurationManager\bin`. 

         * Or deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. Before running **Configuration Manager** using **ConfigurationManager.exe** or **ConfigurationManager_IPv6.exe**, navigate to *`<AEMForms_Install_Dir>\configurationManager\bin`* directory and replace [ConfigurationManager.lax](/help/assets/ConfigurationManager.lax) and [ConfigurationManager_IPV6.lax](/help/assets/ConfigurationManager_IPv6.lax) files.

            >[!NOTE]
            >
            > Using the **ConfigurationManager.bat** file helps you to avoid updating name of .lax files manually.
            >

   1. **[For Unix-based only]:** The **Start Configuration Manager** check box is selected by default. Click **[!UICONTROL Done]** to run the Configuration Manager instantly or to run **Configuration Manager** later, deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. You can start **Configuration Manager** later using the appropriate script in the `[AEM_forms_root]/configurationManager/bin` directory.
  
   1. Depending on your application server, choose one of the following documents and follow the instructions in the *Configuring and Deploying AEM forms* section.

      * [Installing and Deploying AEM forms for JBoss](https://www.adobe.com/go/learn_aemforms_installJBoss_65)
      * [Installing and Deploying AEM forms for WebSphere](https://www.adobe.com/go/learn_aemforms_installWebSphere_65)
      * [Installing and Deploying AEM Forms for WebLogic](https://www.adobe.com/go/learn_aemforms_installWebLogic_65)

+++

+++4. Install the servlet fragment

It is mandatory to install **servlet fragment** for all application servers except those    running on JBoss EAP 7.4.0. To download and install the servlet fragment: 

1. If you have not downloaded the fragment, download it from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar).

1. Start the application server, wait for logs to stabilize and check the bundle state.

1. Open Web Console Bundles. The default URL is `http://[Server]:[Port]/system/console/bundles`.

1. Click Install/Update. Choose the downloaded fragment, org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar. Click Install or Update. Wait for the application server to stabilize

1. Stop the application server.

+++

+++5. Install AEM Service Pack

   1.  Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.
   1.  Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.
   1.  Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->
   1.  Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).
   1.  Select the package, then select **[!UICONTROL Install]**.
   1.  To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

   **Automatic installation**
   
   There are two different methods that you can use to automatically install [!DNL ExperienceManager] 6.5.15.0.<!--       UPDATE FOR EACH NEW RELEASE -->
   
   * Place the package into `../crx-quickstart/install` folder when the server is availableonline. 
   The package is      automatically installed.
   
   * Use the [HTTP API from Package Manager](/help/sites-administering/package-managermd#package-share). Use     `cmd=install&recursive=true` so that the nested packages areinstalled.
   
      >[!NOTE]
      >
      >Experience Manager 6.5.15.0 does not support Bootstrap installation. <!-- UPDATE FOR EACHNEW RELEASE -->
   
   **Validate the installation**
   
   To know the platforms that are certified to work with this release, see the [technicalrequirements](/help/    sites-deploying/technical-requirements.md).
   
   1. The product information page (`/system/console/productinfo`) displays the updated versionstring `Adobe Experience      Manager (6.5.15.0)` under [!UICONTROL Installed Products].<!-- UPDATE FOR EACH NEW RELEASE -->
   1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in theOSGi Console (Use Web     Console: `/system/console/bundles`).
   1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.13 or later (Use WebConsole: `/system/console/     bundles`).

+++

+++6. Install AEM Experience Manager Forms add-on package
      
   1. Ensure that you have installed the [!DNL Experience Manager] service pack.
   1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https:/experienceleague.adobe.com/      docs/experience-manager-release-informationaem-release-updates/forms-updates/aem-forms-releases.html#forms-updates)       for youroperating system.
   1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](help/forms/using/     installing-configuring-aem-forms-osgimd#install-aem-forms-add-on-package).
   1. If you use letters in Experience Manager 6.5 Forms, install the [latest AEMFDCompatibility package](https://     experienceleague.adobe.com/docsexperience-manager-release-information/aem-release-updates/forms-updates/  aem-forms-releases.html#forms-updates).

+++


<!-- 1. (JBoss only) After installing the patch and configuring the server, delete  tmp  and work directories of JBoss application server.

>[!IMPORTANT]
>
>Before installing [AEM 6.5.15.0 service pack](#install-the-aem-service-pack-install-aem-service-pack), for all the AEM Forms on JEE environments using any application servers other than JBoss EAP 7.4.0: 
> * Install  the [org.apache.felix.http.servlet-api-1.2.0_fragment-full.jar](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar) servlet fragment and wait for the application server to stabilize.
>* If you install the latest [AEM service pack (6.5.15.0)](#install-the-aem-service-pack-install-aem-service-pack), prior to the fragment servlet `org.apache.felix.http.servlet-api-1.2.0_fragment-full.jar` on JEE environment, the CRX/bundle and the start page show service unavailable errors, [click here](/help/forms/using/aem-service-pack-installation-solution.md) to know the troubleshooting steps. 

### !-->


## Download and install Service Pack on an AEM Forms on OSGi envrionment {#download-and-install-for-osgi-service-pack}

![OSGi Installation Steps](/help/forms/using/assets/osgiinstallation.png)


+++1. Take backup of your existing environment:
   
   1. Backup your [CRX Repository and Database Schema](https://experienceleague.adobe.com/docs/experience-manager-65/forms/administrator-help/aem-forms-backup-recovery/backing-aem-forms-data.html). 

   >[!NOTE]
   >
   > If you install AEM Forms service pack for relational database, it is mandatory to take backup of DB_schema.

+++

+++2.Download the required software:

* [AEM 6.5.15.0 Service Pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip)
* [Forms add-on package](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package)

+++

+++3. Install AEM Service Pack

   1.  Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.
   1.  Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.
   1.  Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->
   1.  Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).
   1.  Select the package, then select **[!UICONTROL Install]**.
   1.  To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

   **Automatic installation**

   There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.15.0.<!--       UPDATE FOR EACH NEW RELEASE -->

   * Place the package into `../crx-quickstart/install` folder when the server is available online. The package is      automatically installed.
   * Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use     `cmd=install&recursive=true` so that the nested packages are installed.

      >[!NOTE]
      >
      >Experience Manager 6.5.15.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

   **Validate the installation**

   To know the platforms that are certified to work with this release, see the [technical requirements](/help/    sites-deploying/technical-requirements.md).

   1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience      Manager (6.5.15.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

   1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

      1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.13 or later (Use Web Console: `/system/console/bundles`).

+++

+++4. Install AEM Experience Manager Forms add-on package
      
   1. Ensure that you have installed the [!DNL Experience Manager] service pack.
   1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates) for your operating system.
   1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package-install-aem-forms-add-on-package).
   1. If you use letters in Experience Manager 6.5 Forms, install the [latest AEMFD Compatibility package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates).

+++

## Troubleshooting

* AEM Forms service packs can be installed again if an error occurs during installation. If the problem persists, contact the product team.

* If **Dialog on Package Manager UI** exits during the installation of the service pack, wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations are successful. Typically, this issue occurs in Safari browser but can intermittently occur on any browser.

* Check the monitor logs (error.log) once the installation is complete for any activity. Wait for few minutes until there is no activity in the logs. Restart the AEM instance.

* If you encounter **service unavailable error** after installing the latest AEM Forms 6.5.15.0 service pack, [click here](/help/forms/using/aem-service-pack-installation-solution.md) to see the troubleshooting steps.
