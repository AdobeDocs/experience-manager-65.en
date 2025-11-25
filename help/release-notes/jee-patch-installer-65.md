---
title: AEM Forms JEE Patch Installer
description: Learn how to use AEM Forms JEE Patch Installer to fix issues in AEM 6.5 Forms components.

content-type: reference

exl-id: 6b17472b-9226-4319-b305-4dba862d21af
hide: yes
hidefromtoc: yes
solution: Experience Manager
feature: Release Information
role: User,Admin,Developer
---
# AEM Forms JEE Patch Installer {#aem-forms-jee-patch-installer}

>[!NOTE]
>
>[Contact Support](https://experienceleague.adobe.com/?support-solution=General&support-tab=home#support) for more information or to obtain the patch.

## About the patch installer {#about-the-patch-installer}

The AEM 6.5 Forms JEE patch installer includes all fixed issues for all components of AEM 6.5 Forms JEE available until the release of this patch. See the latest  [Service Pack Release Notes](release-notes.md) for a complete list of fixed issues.

## Prerequisites to installing the patch {#prerequisites-to-installing-the-patch}

* AEM 6.5 Forms

## Installing and configuring the patch {#installing-and-configuring-the-patch}

1. Take a backup of the &lt;*AEM_forms_root*&gt;/deploy folder. It is required if you decide to uninstall the quick fix.
1. Stop your application server.
1. Extract the patch installer archive file to your hard drive.
1. In the directory named according to the operating system that you are using:

    * **Windows** 
      Navigate to the appropriate directory on the installation media or folder on your hard disk where you copied the installer, and double-click the aemforms65_cfp_install.exe file.

      * (Windows 32-bit) `Windows\Disk1\InstData\VM`
      * (Windows 64-bit) `Windows_64Bit`\ `Disk1\InstData\VM`

    * **Linux&reg;** 
      Navigate to the appropriate directory, and from a command prompt, type `./aem65_cfp_install.bin`.

      * (Linux&reg;) `Linux/Disk1/InstData/NoVM`

   This launches an install wizard that guides you through the installation.

1. On the Introduction panel, click **[!UICONTROL Next]**.
1. On the **Choose Install Folder** screen, verify that the default location displayed is correct for your existing installation, or click **[!UICONTROL Browse]** to select the alternate folder where AEM forms is installed, and click **[!UICONTROL Next]**.
1. Read the Quick Fix Patch Summary information and click **[!UICONTROL Next]**.
1. Read the Pre-Installation Summary information and click **[!UICONTROL Install]**.
1. When the installation is complete, click **[!UICONTROL Next]** to apply the quick fix updates to your installed files.  

1. **[For Windows only]:** Do the following:
   * Either deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. Run **Configuration Manager** by using the **ConfigurationManager.bat** file in `[aem-forms root]\configurationManager\bin`. 

   * Or deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. Before running **Configuration Manager** using **ConfigurationManager.exe** or **ConfigurationManager_IPv6.exe**, navigate to *`<AEMForms_Install_Dir>\configurationManager\bin`* directory and replace the **ConfigurationManager.lax** and **ConfigurationManager_IPV6.lax** with the latest [ConfigurationManager.lax](/help/assets/ConfigurationManager.lax) and [ConfigurationManager_IPV6.lax](/help/assets/ConfigurationManager_IPv6.lax) files, Search, and replace **axis-1.4.1.1.jar** with **axis-1.4.1.2.jar** in these two files.

   >[!NOTE]
   >
   >Using **ConfigurationManager.bat** file helps you to avoid updating name of .lax files manually.
   >

1. **[For Unix-based only]:** 
    
   * The **Start Configuration Manager** check box is selected by default. Click **[!UICONTROL Done]** to run the Configuration Manager instantly or to run **Configuration Manager** later, deselect the **Start Configuration Manager** option before you click **[!UICONTROL Done]**. You can start **Configuration Manager** later using the appropriate script in the `[AEM_forms_root]/configurationManager/bin` directory.
  
1. Depending on your application server, choose one of the following documents and follow the instructions in the *Configuring and Deploying AEM forms* section.

    * [Installing and Deploying AEM forms for JBoss&reg;](https://www.adobe.com/go/learn_aemforms_installJBoss_65)
    * [Installing and Deploying AEM forms for WebSphere&reg;](https://www.adobe.com/go/learn_aemforms_installWebSphere_65)

1. (JBoss&reg; only) After installing the patch and configuring the server, delete  tmp  and work directories of JBoss&reg; application server.

## Post-deployment configurations {#post-deployment-configurations}

### SAML configurations {#saml-configurations}

If you have SAML authentication configured and facing issues with large IDP metadata, do the following after installing the patch:

1. Set the following system property in your application server:  
   `um.saml.enable.large.xml=true`
1. Restart the server.
1. Delete existing SAML auth providers and add them again for existing domains as described in SAML settings.

>[!NOTE]
>
> It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

## Impacted Modules {#impacted-modules}

* Document Services  
* Document Security
* Foundation JEE

[Contact Support](https://experienceleague.adobe.com/?support-solution=General&support-tab=home#support)
