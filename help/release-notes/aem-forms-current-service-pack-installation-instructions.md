---
title: AEM Forms Patch Installation Instructions for AEM Forms
description: AEM Forms service pack Installation Instructions for OSGi and JEE environment
solution: Experience Manager
feature: Release Information
role: User,Admin,Architect,Developer
exl-id: ae4c7e9d-9af8-4288-a6f9-e3bcbe7d153d
---
# AEM 6.5 Forms Service Pack Installation Instructions {#aem-form-patch-installation-instructions}

## Release information

| Product   | Adobe Experience Manager 6.5 Forms  |
|---|---|
| Version  |  6.5.23.0|
| Type  |  Service Pack release |
| Date  |  06 June 2025 |
| Download URL | [Latest AEM Forms Releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) |

>[!NOTE]
>
>See the latest [AEM Service Pack Release Notes](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/release-notes.html) for a complete list of fixed issues.

## What is included in Experience Manager Forms 6.5

Adobe Experience Manager (AEM) Forms service pack includes new and upgraded features, such as key customer-requested enhancements, performance, stability, and security improvements. AEM Forms release service packs at a regular interval to provide latest features and improvements. Depending on your technology stack, choose one of the following paths to download and install service pack on your environment: 

* [Download and install Service Pack on an AEM Form on JEE environment](#download-and-install-for-jee-service-pack) 
* [Download and install Service Pack on an AEM Form on OSGi environment](#download-and-install-for-osgi-service-pack) 

>[!NOTE]
>
> * Adobe releases a full installer every sixth service pack. AEM 6.5 Forms Service Pack 18 (6.5.18.0) is the latest JEE full installer. The full installer supports new platforms while the regular service pack installer includes new features, bug fixed and general improvements. If you are performing a fresh installation or planning to use latest software for your AEM 6.5 Forms on JEE environment, Adobe recommends using AEM 6.5.18.0 Forms on JEE full installer released on 31 August 2023 instead of AEM 6.5 Forms installer released on 08 April 2019 or AEM 6.5.12.0 Forms Installer released on 03 March 2022. After using the full installer, install the latest service pack.
> * The AEM Forms feature, such as Adaptive Forms, available in [AEM 6.5 QuickStart](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/deploying/deploy.html), are intended for exploration and evaluation purposes only. For production use, it is essential to obtain a valid license for AEM Forms. 

<!--

## Prerequisites {#prerequisites}

From AEM Service Pack 6.5.19.0 and onwards, XMLFM (XML output) will be available in 64-bit only, therefore you require the latest [Microsoft Visual C++ Redistributable (2015-2022) 64-bit](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) to be installed on Windows Server prior to JEE or OSGi installation.

>[!NOTE]
> This prerequisite is required in addition to the already existing Microsoft Visual C++ Redistributable 32-bit.

-->

## Download and install Service Pack on an AEM Form on JEE environment {#download-and-install-for-jee-service-pack}

   <!--
![JEE Installation](/help/forms/using/assets/jeeinstallation.png) -->

+++1. Take backup of your existing environment
   
   1. Back up your [CRX Repository, Database Schema, and GDS (Global Document Storage)](https://experienceleague.adobe.com/docs/experience-manager-65/forms/administrator-help/aem-forms-backup-recovery/backing-aem-forms-data.html). 
   1. Back up  the &lt;*AEM_forms_root*&gt;/deploy folder. 

   >[!NOTE]
   >
   > Before running the AEM service pack installer, make sure you have write-access privileges on AEM installation directory.

+++

+++2. Download the required software

* [AEM Forms on JEE Service Pack](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html)

* [Fragment Servlet](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq650%2Ffeaturepack%2Forg.apache.felix.http.servlet-api-1.2.0_fragment_full.jar)

* [AEM Service Pack](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/release-notes.html)
* [Forms add-on package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html)


+++

+++3. Install Microsoft Visual C++ Redistributable packages

* Download and install the [64-bit version of Microsoft Visual C++ Redistributable packages for Visual Studio 2015, 2017, 2019, and 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2015-2017-2019-and-2022) on the computer where AEM 6.5 Forms is installed.

>[!NOTE]
>
> Ensure that you install the Redistributable, even if a previous version is installed, to guarantee the availability of the latest version.

+++

+++4. Install AEM Forms on JEE service pack:

   1. Stop your application server.
   1. Extract the **AEM Forms on JEE Service Pack installer archive** to your hard drive: 

      * **Windows** 
          Navigate to the appropriate directory on the installation media or folder on your hard disk where you copied     the installer, and double-click the `aemforms65_cfp_install.exe` file.

          * (Windows 32-bit) `Windows\Disk1\InstData\VM`
          * (Windows 64-bit) `Windows_64Bit`\ `Disk1\InstData\VM`

      * **Linux&reg;** 
          Navigate to the appropriate directory, and from a shell and type `./aem65_cfp_install.bin`.

          * (Linux&reg;) `Linux/Disk1/InstData/NoVM` 

      This launches an install wizard that guides you through the installation.

   1.  On the Introduction panel, click **[!UICONTROL Next]**.
   1.  On the **Choose Install Folder** screen, verify that the default location displayed is correct for your existing installation, or click **[!UICONTROL Browse]** to select the alternate folder where AEM forms is installed, and click **[!UICONTROL Next]**.
   1.  Read the Service Pack summary information and click **[!UICONTROL Next]**.
   1.  Read the Pre-Installation Summary information and click **[!UICONTROL Install]**.
   1.  When the installation is complete, click **[!UICONTROL Next]** to apply the quick fix updates to your installed files.
   1.  **[For Windows only]:** Perform one of the following step:
   
         * Either deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. Run **Configuration Manager** by using the **ConfigurationManager.bat** file in `[aem-forms root]\configurationManager\bin`. 

         * Or deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. Before running **Configuration Manager** using **ConfigurationManager.exe** or **ConfigurationManager_IPv6.exe**, navigate to *`<AEMForms_Install_Dir>\configurationManager\bin`* directory and replace the **ConfigurationManager.lax** and **ConfigurationManager_IPV6.lax** with the latest [ConfigurationManager.lax](/help/assets/ConfigurationManager.lax) and [ConfigurationManager_IPV6.lax](/help/assets/ConfigurationManager_IPv6.lax) files, Search, and replace **axis-1.4.1.1.jar** with **axis-1.4.1.2.jar** in these two files.

            >[!NOTE]
            >
            >* Updating or replacing the **ConfigurationManager.bat** file helps you to avoid updating the .lax files manually.

1. **[For Unix-based only]:** The **Start Configuration Manager** check box is selected by default. Click **[!UICONTROL Done]** to run the Configuration Manager instantly or to run **Configuration Manager** later, deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. You can start **Configuration Manager** later using the appropriate script in the `[AEM_forms_root]/configurationManager/bin` directory.
  
1. Depending on your application server, choose one of the following documents and follow the instructions in the *Configuring and Deploying AEM forms* section.

      * [Installing and Deploying AEM forms for JBoss&reg;](https://www.adobe.com/go/learn_aemforms_installJBoss_65)
      * [Installing and Deploying AEM forms for WebSphere&reg;](https://www.adobe.com/go/learn_aemforms_installWebSphere_65)
      * [Installing and Deploying AEM Forms for WebLogic](https://www.adobe.com/go/learn_aemforms_installWebLogic_65)
      * [Installing and Deploying AEM forms for JBoss&reg; Cluster](https://helpx.adobe.com/content/dam/help/en/experience-manager/6-5/forms/pdf/install-cluster-jboss.pdf)
      * [Installing and Deploying AEM forms for WebSphere&reg; Cluster](https://helpx.adobe.com/content/dam/help/en/experience-manager/6-5/forms/pdf/install-cluster-websphere.pdf)
      * [Installing and Deploying AEM Forms for WebLogic Cluster](https://helpx.adobe.com/content/dam/help/en/experience-manager/6-5/forms/pdf/install-cluster-weblogic.pdf)

 
>[!NOTE]
>
>* After installing AEM Forms on JEE service pack, you need to remove the Forms add-on package from `crx-repository\install` folder before restarting the appserver. Download the latest Forms add-on package from the [Software Distribution portal](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html).
>* It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.
>* For [Hotfix for Mitigating Spring Framework Vulnerabilities for AEM Forms on JEE](/help/release-notes/aem-forms-hotfix.md), When deploying in a cluster environment, it is essential to ensure that locators are started using JDK 17. 

+++

+++5. Install the servlet fragment if not installed (**Mandatory step**)

   <!-- >[!NOTE] > > * If you are upgrading from **AEM Service Pack 6.5.15.0**, the installation of the **servlet fragment** is not required. For versions **AEM Service Pack 6.5.14.0** or earlier, it is **mandatory to install** the servlet fragment. -->

 To download and install the servlet fragment: 

1. If you have not downloaded the fragment, download it from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/featurepack/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar).

2. Start the application server, wait for logs to stabilize and check the bundle state.

3. Open Web Console Bundles. The default URL is `http://[Server]:[Port]/system/console/bundles`.

4. Click Install/Update. Choose the downloaded fragment, `org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar`. Click **Install** or **Update**. Wait for the application server to stabilize

5. Stop the application server.

+++

+++6. Install AEM Service Pack

   1.  Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.
   1.  Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.
   1.  Download the service pack from [Software Distribution](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html). <!-- UPDATE FOR EACH NEW RELEASE -->
   1.  Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).
   1.  Select the package, then select **[!UICONTROL Install]**.

   **Automatic installation**
   
   There are two different methods that you can use to automatically install [!DNL ExperienceManager] service pack.<!--       UPDATE FOR EACH NEW RELEASE -->
   
* Place the package into `../crx-quickstart/install` folder when the server is available online. 
   The package is      automatically installed.
   
* Use the [HTTP API from Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html). Use  `cmd=install&recursive=true` so that the nested packages are installed.
   
   >[!NOTE]
   >
   >Experience Manager service pack does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->
   
   **Validate the installation**
   
   To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).
   
   1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (spversion)` under [!UICONTROL Installed Products].<!-- UPDATE FOR EACH NEW RELEASE -->
   1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in theOSGi Console (Use Web     Console: `/system/console/bundles`).
   1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.14 or later (Use WebConsole: `/system/console/bundles`).

+++

+++7. Install AEM Experience Manager Forms add-on package
      
   1. Ensure that you have installed the [!DNL Experience Manager] service pack.
   1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) for your operating system.
   1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html).
   1. If you use letters in Experience Manager 6.5 Forms, install the [latest AEMFD Compatibility package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html).

+++

## Download and install Service Pack on an AEM Form on OSGi environment {#download-and-install-for-osgi-service-pack}


   <!-- ![OSGi Installation Steps](/help/forms/using/assets/osgiinstallation.png)
-->

+++1. Take backup of your existing environment
   
   1. Back up your [CRX Repository and Database Schema](https://experienceleague.adobe.com/docs/experience-manager-65/forms/administrator-help/aem-forms-backup-recovery/backing-aem-forms-data.html). 

   >[!NOTE]
   >
   > If you install AEM Forms service pack for relational database, it is mandatory to take backup of DB_schema.

+++

+++2. Download the required software

* [AEM Service Pack](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/release-notes.html)
* [Forms add-on package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html)

+++

+++ 3. Install Microsoft Visual C++ Redistributable packages

* Download and install the [64-bit version of Microsoft Visual C++ Redistributable packages for Visual Studio 2015, 2017, 2019, and 2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2015-2017-2019-and-2022) on the computer where AEM 6.5 Forms is installed.

>[!NOTE]
>
>
> Ensure that you install the Redistributable, even if a previous version is installed, to guarantee the availability of the latest version.

+++

+++4. Install AEM Service Pack

   1.  Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.
   1.  Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.
   1.  Download the service pack from [Software Distribution](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html). <!-- UPDATE FOR EACH NEW RELEASE -->
   1.  Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).
   1.  Select the package, then select **[!UICONTROL Install]**.
 
   **Automatic installation**

   There are two different methods that you can use to automatically install [!DNL Experience Manager] service pack.<!--  UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is      automatically installed.
* Use the [HTTP API from Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html). Use `cmd=install&recursive=true` so that the nested packages are installed.

   >[!NOTE]
   >
   >Experience Manager service pack does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

   **Validate the installation**

   To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

   1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (spversion)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

   1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

      1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.14 or later (Use Web Console: `/system/console/bundles`).

+++

+++5. Install Adobe Experience Manager Forms (AEM) add-on package
      
   1. Ensure that you have installed the [!DNL Experience Manager] service pack.
   1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) for your operating system.
   1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html).
   1. If you use letters in Experience Manager 6.5 Forms, install the [latest AEMFD Compatibility package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html).

+++

## Troubleshooting

* If **Dialog on Package Manager UI** exits during the installation of the service pack, wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations are successful. Typically, this issue occurs in Safari browser but can intermittently occur on any browser.

* Check the monitor logs (error.log) once the installation is complete for any activity. Wait for few minutes until there is no activity in the logs. Restart the AEM instance.

* In case you get a **service-unavailable error** after installing the AEM Forms 6.5.15.0 or later service pack, [install the servlet fragment and bundle](/help/forms/using/aem-service-pack-installation-solution.md) to fix the error.
