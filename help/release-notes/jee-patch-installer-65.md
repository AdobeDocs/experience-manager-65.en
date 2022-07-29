---
title: AEM Forms JEE Patch Installer
description: AEM Forms JEE Patch Installer
uuid: 76662858-afca-4ba3-883b-9b9a61874f15
content-type: reference
discoiquuid: b0283feb-c3ec-4ef0-885c-46bc83a61e26
exl-id: 6b17472b-9226-4319-b305-4dba862d21af
---
# AEM Forms JEE Patch Installer {#aem-forms-jee-patch-installer}

>[!NOTE]
>
>[Contact Support](https://www.adobe.com/account/sign-in.supportportal.html) for more information or to obtain the patch.

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

    * **Linux** 
      Navigate to the appropriate directory, and from a command prompt, type `./aem65_cfp_install.bin`.

      * (Linux) `Linux/Disk1/InstData/NoVM`

   This launches an install wizard that guides you through the installation.

1. On the Introduction panel, click **[!UICONTROL Next]**.
1. On the Choose Install Folder screen, verify that the default location displayed is correct for your existing installation, or click **[!UICONTROL Browse]** to select the alternate folder where AEM forms is installed, and click **[!UICONTROL Next]**.
1. Read the Quick Fix Patch Summary information and click **[!UICONTROL Next]**.
1. Read the Pre-Installation Summary information and click **[!UICONTROL Install]**.
1. When the installation is complete, click **[!UICONTROL Next]** to apply the quick fix updates to your installed files.  

1. Deselect the Start Configuration Manager option before you click Done. Before running configuration manager using **ConfigurationManager.exe** or **ConfigurationManager_IPv6.exe**, navigate to *&lt;AEMForms_Install_Dir&gt;\configurationManager\bin* directory and update `ConfigurationManager.lax` and `ConfigurationManager_IPv6.lax` files with the following rename operations: 

   * `axis.jar` to `axis-1.4.1.1.jar`
   * `serializer-2.7.1.jar` to `serializer-2.7.2.jar`
   * `xalan-2.7.1.jar` to `xalan-2.7.2.jar`
   * `xercesImpl-2.9.1.jar` to `xercesImpl-2.12.0.jar`
   * `xml-apis-2.7.1.jar` to `xml-apis-2.7.2.jar`

1. The Start Configuration Manager check box is selected by default. Click **[!UICONTROL Done]** to run the Configuration Manager.

1. To run Configuration Manager later, deselect the Start Configuration Manager option before you click Done. You can start Configuration Manager later using the appropriate script in the `[AEM_forms_root]/configurationManager/bin` directory.

1. Depending on your application server, choose one of the following documents and follow the instructions in the *Configuring and Deploying AEM forms* section.

    * [Installing and Deploying AEM forms for JBoss](http://www.adobe.com/go/learn_aemforms_installJBoss_65)
    * [Installing and Deploying AEM forms for WebSphere](http://www.adobe.com/go/learn_aemforms_installWebSphere_65)

1. (JBoss only) After installing the patch and configuring the server, delete  tmp  and work directories of JBoss application server.

>**Note:** Before launching **Configuration Manager**, download and replace [ConfigurationManager.lax](/help/assets/ConfigurationManager.lax) file.
>

## Post-deployment configurations {#post-deployment-configurations}

### SAML configurations {#saml-configurations}

If you had SAML authentication configured and facing issues with large IDP metadata, do the following after installing the patch:

1. Set the following system property in your application server:  
   `um.saml.enable.large.xml=true`
1. Restart the server.
1. Delete existing SAML auth providers and add them again for existing domains as described in SAML settings.

## Impacted Modules {#impacted-modules}

* Document Services  
* Document Security
* Foundation JEE

[Contact Support](https://www.adobe.com/account/sign-in.supportportal.html)
