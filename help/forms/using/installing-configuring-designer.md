---
title: Installing and configuring Designer
seo-title: Installing and configuring Designer
description: Designer is available as a stand-alone installer and is also bundled with Workbench. Learn how to install stand-alone Designer.  
seo-description: Designer is available as a stand-alone installer and is also bundled with Workbench. Learn how to install stand-alone Designer.  
uuid: c5b779d1-cb6a-48f4-87d6-48464753e516
contentOwner: gtalwar
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: designer
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: f3a5b5ce-2262-4d5d-a8ae-d59a3a4229e7
docset: aem65

role: Admin
exl-id: 90503d29-e079-43f4-a5dc-ce90ed7844c6
---
# Installing and configuring Designer{#installing-and-configuring-designer}

## Pre-requisites {#pre-requisites}

* Install 32-bit version of  [Visual C++ 2019 Redistributable (x86)](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170). Ensure that the previously mentioned redistributable runtime packages are installed before starting the installation.
* A user with administrator rights to install or uninstall AEM Forms Designer.

## Install AEM Forms Designer {#install-designer}

Designer is available as a stand-alone installer and is also bundled with WorkBench. If you are using a stand-alone installer for AEM Forms Designer, perform the following steps:

1. Uninstall the previous version of AEM Forms Designer, if it is already installed.
1. Download Designer from [Adobe Licensing Website](https://licensing.adobe.com/).

   >[!NOTE]
   >
   > * Adobe Experience Manager 6.5 Forms Service Pack 15 (6.5.15.0) onwards Forms Designer version also includes the Service Pack version. For example, for Service Pack 15 the version number is 6.5.15.20221112.1.0. In this example, 6.5.15 is service pack version.

1. Launch the AEM Forms Designer installer by double-clicking setup.exe.
1. Proceed and provide your details and the serial number on the Personalization screen.
1. If you accept the license agreement, click Next to proceed.
1. (Optional) change the default installation path, if you want to install Designer at a location of your choice. Click Next.
1. Click Back to change any preferences. To install Designer, click Install.
1. Click Finish when the installation completes.

Alternatively, you can install the AEM Forms Designer through command line using passive or silent mode.

* Passive command-line install: The installer displays a progress bar that indicates that the installation is in progress but no prompts or error messages are displayed. Once launched, you cannot cancel the installation.

```shell
msiexec /i "<absolute path>\Designer.msi" /passive SERIALNUMBER=****-****-****-****-****-****
```

* Silent command-line install: The installer runs the installation without displaying a user interface. No prompts, messages, or dialog boxes are displayed. Once launched, you cannot cancel the installation.

```shell
msiexec /i "<absolute path>\Designer.msi" /quiet SERIALNUMBER=****-****-****-****-****-****
```

## Update AEM Forms Designer {#update-forms-designer}

There are two cases while updating the latest version of AEM Forms Designer 6.5.16.0:

* **Case 1**: When the user has AEM Forms Designer version earlier than 6.5.15.0.
* **Case 2**: When the user has 6.5.15.0 AEM Forms Designer version.

+++**When the user has AEM Forms Designer version earlier than 6.5.15.0.**

   If you are using a stand-alone installer for AEM Forms Designer, perform the following steps:

   1. Before installing **AEM Forms Designer 6.5.16.0**, users must uninstall any previous versions.
   1. Download and install [AEM Forms Designer 6.5.15.0](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) from the AEM Form Releases Page.
   1. After successful installation of **AEM Forms Designer 6.5.15.0**, download and install [AEM Forms Designer 6.5.16.0](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) by double-clicking on the downloaded installer file .

   +++

+++**When the user has 6.5.15.0 AEM Forms Designer version**

   If you are using a stand-alone installer for AEM Forms Designer, perform the following steps:
   1. Download latest version of AEM Forms Designer from the [Software distribution portal](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html).
   1. Install the latest version of AEM Forms Designer by double clicking on the downloaded installer file.

+++