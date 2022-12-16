---
title: AEM Forms Current Service Pack Installation Instructions
description: AEM Forms Current Service Pack Installation Instructions
---
# AEM Forms Service Upgrade Installation Instructions for AEM Forms{#aem-form-service-upgrade-installation-instructions}

## Overview {#overview}

Adobe Experience Manager releases Service Pack to include new upgrade features, such as key customer-requested enhancements, and performance, stability, and security improvements. AEM releases the full installer or patch installers of service pack periodically to upgrade AEM features.   

## Prerequisites {#prerequisites}

### Prerequisites for JEE installation {#prerequisites-for-jee-installation}

* Click on the link and follow instructions specific to  Application Server for setting up prerequisites for installing AEM Forms JEE: https://helpx.adobe.com/content/dam/help/en/experience-manager/6-5/forms/pdf/prepare-install-single-server.pdf.

### Prerequisites for OSGi installation {#prerequisites-for-osgi}

* You must take the back-up of the crx_repository and DB_schema. 

## Instructions for Installing AEM Forms JEE Service Pack {#instructions-for-jee-service-pack-installer}

For installing the JEE service pack installer, the steps are:
1. [Run AEM Forms JEE installer](#run-aem-forms-jee-installer-run-aem-forms-jee-installer)
1. [Install the AEM Service Pack](#install-the-aem-service-pack-install-aem-service-pack)
1. [Install the Forms Add-on Package](#install-aem-experience-manager-forms-add-on-package-install-aem-forms-add-on-package)

Let us now discuss each step-in detail.

### Run AEM Forms JEE installer {#run-aem-forms-jee-installer}

AEM 6.5 Forms JEE installer includes all fixed issues for all components of AEM 6.5 Forms JEE available until the release of this patch. See the latest  [Service Pack Release Notes](release-notes.md) for a complete list of fixed issues.

1. Take a backup of the &lt;*AEM_forms_root*&gt;/deploy folder. It is required if you decide to uninstall the quick fix.
1. Stop your application server.
1. Extract the patch installer archive file to your hard drive.
1. In the directory named according to the operating system that you are using:

    * **Windows** 
      Navigate to the appropriate directory on the installation media or folder on your hard disk where you copied the installer, and double-click the aemforms65_cfp_install.exe file.

      * (Windows 32-bit) `Windows\Disk1\InstData\VM`
      * (Windows 64-bit) `Windows_64Bit`\ `Disk1\InstData\VM`

    * **Linux** 
      Navigate to the appropriate directory, and from a command prompt, type `./aem65_cfp_install.bin`.

      * (Linux) `Linux/Disk1/InstData/NoVM`

   This launches an install wizard that guides you through the installation.

1. On the Introduction panel, click **[!UICONTROL Next]**.
1. On the **Choose Install Folder** screen, verify that the default location displayed is correct for your existing installation, or click **[!UICONTROL Browse]** to select the alternate folder where AEM forms is installed, and click **[!UICONTROL Next]**.
1. Read the Quick Fix Patch Summary information and click **[!UICONTROL Next]**.
1. Read the Pre-Installation Summary information and click **[!UICONTROL Install]**.
1. When the installation is complete, click **[!UICONTROL Next]** to apply the quick fix updates to your installed files.  

1. **[For Windows only]:** Perform one of the following step:
   * Either deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. Run **Configuration Manager** by using the **ConfigurationManager.bat** file located in `[aem-forms root]\configurationManager\bin`. 

   * Or deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. Before running **Configuration Manager** using **ConfigurationManager.exe** or **ConfigurationManager_IPv6.exe**, navigate to *`<AEMForms_Install_Dir>\configurationManager\bin`* directory and replace [ConfigurationManager.lax](/help/assets/ConfigurationManager.lax) and [ConfigurationManager_IPV6.lax](/help/assets/ConfigurationManager_IPv6.lax) files.

   >
   >[!NOTE]
   >
   >Using **ConfigurationManager.bat** file helps you to avoid updating name of .lax files manually.
   >

1. **[For Unix-based only]:** 
    
   * The **Start Configuration Manager** check box is selected by default. Click **[!UICONTROL Done]** to run the Configuration Manager instantly or to run **Configuration Manager** later, deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. You can start **Configuration Manager** later using the appropriate script in the `[AEM_forms_root]/configurationManager/bin` directory.
  
1. Depending on your application server, choose one of the following documents and follow the instructions in the *Configuring and Deploying AEM forms* section.

    * [Installing and Deploying AEM forms for JBoss](https://www.adobe.com/go/learn_aemforms_installJBoss_65)
    * [Installing and Deploying AEM forms for WebSphere](https://www.adobe.com/go/learn_aemforms_installWebSphere_65)

1. (JBoss only) After installing the patch and configuring the server, delete  tmp  and work directories of JBoss application server.

>[!NOTE]
>
>Perform the following steps before installing AEM 6.5.15.0 service pack:
>1.  Install  the [org.apache.felix.http.servlet-api-1.2.0_fragment-full.jar](https://jira.corp.adobe.com/secure/attachment/9396977/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar) servlet fragment.
>1. Wait for application server to stabilize.
>1. Install [AEM 6.5.15.0 service pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip). 

### Install the AEM Service Pack {#install-aem-service-pack}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this issue occurs in [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.15.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.15.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.15.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.13 or later (Use Web Console: `/system/console/bundles`).

### Troubleshooting Steps after Installing AEM 6.5.15.0 Service Pack {#troubleshooting-sp}

After applying [AEM 6.5.15.0 service pack](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip), if the CRX/bundle and the start page show service unavailable error, perform the following steps:

>[!NOTE]
>
>These troubleshooting steps are applicable for all Application Server except JBoss EAP 7.4.

1. Stop the Application Server.
1. Navigate to `[aem-forms root]\crx-repository\launchpad\felix\bundle52`.
1. Locate the `bundle.info` file.
1. Open the `bundle.info` file in ant text editor and search for the bundle name as `org.apache.felix.http.bridge`.

>[!NOTE] 
>
>In case the `bundle.info` under `bundle52` doesn't contains the `org.apache.felix.http.bridge` bundle, check the bundle number in square bracket next to the `org.apache.felix.http.bridge`. Then navigate to [aem-forms root]\crx-repository\launchpad\felix\bundle[x] and perform the next steps at this location.

6. Navigate to URL: `[aem-forms root]\crx-repository\launchpad\felix\bundle[x]\version0.1`.
1. Search for `bundle.jar` and rename the `bundle.jar` to `bundle.jar.bak`.
1. Copy `bundle.jar` at this location
Copy `bundle.jar` from the [Software Distribution.](https://jira.corp.adobe.com/secure/attachment/9402702/bundle.jar).
1. Start the Application Server, wait for logs to stabilize and check the bundle state.
8. Once all bundles are in the activated state, install the `org.apache.felix.http.servlet-api-1.2.0_fragment-full.jar` servlet fragment from the `system/console/bundles` downloaded from [Software Distribution.](https://jira.corp.adobe.com/secure/attachment/9396977/org.apache.felix.http.servlet-api-1.2.0_fragment_full.jar).
9. Again, wait for  Application Server to stabilize.
10. Stop the Application Server.
11. Navigate to `[aem-forms root]\crx-repository\launchpad\felix\bundle52\version0.1` and delete the `bundle.jar`.
1. Rename the `bundle.jar.bak` to the `bundle.jar`. 
1. Start the Application Server. 

### Install AEM Experience Manager Forms add-on package {#install-aem-forms-add-on-package}

>[!NOTE]
>
>Skip if you are not using [!DNL Experience Manager] Forms.

1. Ensure that you have installed the [!DNL Experience Manager] Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).
1. If you use letters in Experience Manager 6.5 Forms, install the [latest AEMFD Compatibility package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates).

### Install AEM Experience Manager Forms on JEE {#install-aem-forms-jee-installer}

>[!NOTE]
>
>Skip if you are not using AEM Forms on JEE. Fixes in [!DNL Experience Manager] Forms on JEE are delivered through a separate installer.

For information about installing the cumulative installer for [!DNL Experience Manager] Forms on JEE and post-deployment configuration, see the [release notes](jee-patch-installer-65.md).

>[!NOTE]
>
>After installing the cumulative installer for [!DNL Experience Manager] Forms on JEE, install the latest Forms add-on package, delete the Forms add-on package from the `[aem-forms root]crx-repository\install` folder, and restart the server.

## Instructions for Installing AEM Forms OSGi Service Pack {#instructions-for-osgi-service-pack-installer}

For installing the OSGi service pack installer, the steps are:
1. [Install the AEM Service Pack](#install-the-aem-service-pack-install-aem-service-pack-osgi)
1. [Install the Forms Add-on Package](#install-aem-experience-manager-forms-add-on-package-install-aem-forms-add-on-package-osgi)

Let us now discuss each step-in detail.

### Install the AEM Service Pack {#install-aem-service-pack-osgi}

1. Restart the instance before installation if the instance is in update mode (when the instance was updated from an earlier version). Adobe recommends a restart if the current uptime for an instance is high.

1. Before installing, take a snapshot or a fresh backup of your [!DNL Experience Manager] instance.

1. Download the service pack from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/servicepack/aem-service-pkg-6.5.15.0.zip). <!-- UPDATE FOR EACH NEW RELEASE -->

1. Open Package Manager, then select **[!UICONTROL Upload Package]** to upload the package. To know more, see [Package Manager](/help/sites-administering/package-manager.md).

1. Select the package, then select **[!UICONTROL Install]**.

1. To update the S3 connector, stop the instance after installation of the Service Pack, replace the existing connector with a new binary file provided in the install folder, and restart the instance. See [Amazon S3 Data Store](/help/sites-deploying/data-store-config.md#upgrading-to-a-new-version-of-the-s-connector).

>[!NOTE]
>
>Dialog on Package Manager UI sometimes exits during the installation of the service pack. Adobe recommends that you wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations is successful. Typically, this issue occurs in [!DNL Safari] browser but can intermittently occur on any browser.

**Automatic installation**

There are two different methods that you can use to automatically install [!DNL Experience Manager] 6.5.15.0.<!-- UPDATE FOR EACH NEW RELEASE -->

* Place the package into `../crx-quickstart/install` folder when the server is available online. The package is automatically installed.
* Use the [HTTP API from Package Manager](/help/sites-administering/package-manager.md#package-share). Use `cmd=install&recursive=true` so that the nested packages are installed.

>[!NOTE]
>
>Experience Manager 6.5.15.0 does not support Bootstrap installation. <!-- UPDATE FOR EACH NEW RELEASE -->

**Validate the installation**

To know the platforms that are certified to work with this release, see the [technical requirements](/help/sites-deploying/technical-requirements.md).

1. The product information page (`/system/console/productinfo`) displays the updated version string `Adobe Experience Manager (6.5.15.0)` under [!UICONTROL Installed Products]. <!-- UPDATE FOR EACH NEW RELEASE -->

1. All OSGi bundles are either **[!UICONTROL ACTIVE]** or **[!UICONTROL FRAGMENT]** in the OSGi Console (Use Web Console: `/system/console/bundles`).

1. The OSGi bundle `org.apache.jackrabbit.oak-core` is version 1.22.13 or later (Use Web Console: `/system/console/bundles`).

### Install AEM Experience Manager Forms add-on package {#install-aem-forms-add-on-package-osgi}

>[!NOTE]
>
>Skip if you are not using [!DNL Experience Manager] Forms.

1. Ensure that you have installed the [!DNL Experience Manager] Service Pack.
1. Download the corresponding Forms add-on package listed at [AEM Forms releases](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates) for your operating system.
1. Install the Forms add-on package as described in [Installing AEM Forms add-on packages](/help/forms/using/installing-configuring-aem-forms-osgi.md#install-aem-forms-add-on-package).
1. If you use letters in Experience Manager 6.5 Forms, install the [latest AEMFD Compatibility package](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html#forms-updates).

## Troubleshooting
* Dialog on Package Manager UI sometimes exits during the installation of the service pack.
You should wait for error logs to stabilize before accessing the deployment. Wait for the specific logs related to the uninstall of the updater bundle before being assured that the installations are successful. Typically, this issue occurs in Safari browser but can intermittently occur on any browser.

* After installation is complete, check the monitor logs (error.log) for any activity. Wait a few minutes until there is no activity in the logs and then restart the AEM instance.