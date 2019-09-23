---
title: Installing and configuring document services
seo-title: Installing and configuring document services
description: Install AEM Forms document services to create, assemble, distribute, archive PDF documents, add digital signatures to limit access to documents, and decode barcoded forms.
seo-description: Install AEM Forms document services to create, assemble, distribute, archive PDF documents, add digital signatures to limit access to documents, and decode barcoded forms.
uuid: a174a21e-f770-4d1c-9a13-81004c1f8996
topic-tags: installing
discoiquuid: 5f233b0e-db76-47ac-94e9-09a6d73310d8
index: y
internal: n
snippet: y
---

# Installing and configuring document services{#installing-and-configuring-document-services}

## Introduction {#introduction}

AEM Forms provides a set of OSGi services to accomplish different document level operations, for example, services to create, assemble, distribute, and archive PDF documents, add digital signatures to limit access to documents, and decode barcoded forms. These services are included in AEM Forms add-on package. Collectively, these services are known as document services. The list of available document services and their major capabilities is as below:

Enables you to combine, rearrange, and augment PDF and XDP documents and obtain information about PDF documents. It also helps convert and validate PDF documents to PDF/A standard, transforms PDF forms, XML forms, and PDF forms to PDF/A-1b, PDF/A-2b, and PDFA/A-3b. For more information, see [Assembler Service](../../forms/using/assembler-service.md).

Enables you to convert PDF documents to PostScript or image files (JPEG, JPEG 2000, PNG, and TIFF). For more information, see [ConvertPDF Service](/forms/using/using-convertpdf-service.md).

Enables you to extract data from electronic images of barcodes. The service accepts TIFF and PDF files that include one or more barcodes as input and extracts the barcode data. For more information, see [Barcoded Forms Service](../../forms/using/using-barcoded-forms-service.md).

Enables you to encrypt and decrypt documents, extend the functionality of Adobe Reader with additional usage rights, and add digital signatures to your documents. The Doc Assurance service contains three services: signature, encryption, and reader extension. For more information, see [DocAssurance Service](../../forms/using/overview-aem-document-services.md).

Enables you to encrypt and decrypt documents. When a document is encrypted, its contents become unreadable. An authorized user can decrypt the document to obtain access to its contents. For more information, see [Encryption Service](../../forms/using/overview-aem-document-services.md#p-encryption-service-p).

Lets you create interactive data capture client applications that validate, process, transform, and deliver forms that are typically created in Forms Designer. The Forms service renders any form design that you develop to PDF documents. For more information, see [Forms Service](/forms/using/forms-service.md).

Enables you to create documents in different formats, including PDF, laser printer formats, and label printer formats. Laser printer formats are PostScript and Printer Control Language (PCL). For more information, see [Output Service](../../forms/using/output-service.md).

The PDF Generator service provides APIs to converts native file formats to PDF. It also converts PDF to other file formats and optimizes the size of PDF documents. For more information, see [PDF Generator Service](/forms/using/aem-document-services-programmatically.md#main-pars_header_27).

Enables your organization to easily share interactive PDF documents by extending the functionality of Adobe Reader with additional usage rights. The service activates features that are not available when a PDF document is opened using Adobe Reader, such as adding comments to a document, filling forms, and saving the document. For more information, see [Reader Extension Service](../../forms/using/overview-aem-document-services.md#p-reader-extension-service-p).

Lets you work with digital signatures and documents on the AEM server. For example, the Signature service is typically used in the following situations:

* The AEM server certifies a form before it is sent to a user to open by using Acrobat or Adobe Reader.
* The AEM server validates a signature that was added to a form by using Acrobat or Adobe Reader.
* The AEM server signs a form on behalf of a public notary.

The signature service accesses certificates and credentials that are stored in the trust store. For more information, see [Signature Service](/forms/using/aem-document-services-programmatically.md).

AEM Forms is a powerful enterprise-class platform and the document services is only one of the capability of AEM Forms. For the complete list of capabilities, see [Introduction to AEM Forms](../../forms/using/introduction-aem-forms.md).

## Deployment Topology {#deployment-topology}

AEM Forms add-on package is an application deployed onto AEM. Generally, you require only one AEM instance (author or publish) to run AEM Forms document services. The following topology is recommended to run AEM Forms document services. For detailed information about topologies, see [Architecture and deployment topologies for AEM Forms](/forms/using/aem-forms-architecture-deployment.md).

![](do-not-localize/document-services.png)

>[!NOTE]
>
>Although AEM Forms allows you to set up and run all the functionalities from a single server, you should do capacity planning, load balancing, and set up dedicated servers for specific capabilities in a production environment. For example, for an environment using the PDF Generator service to convert thousands of pages a day and multiple adaptive forms to capture data, set up separate AEM Forms servers for the PDF Generator service and adaptive forms capabilities. It helps provide optimum performance and scale the servers independent of each other.

## System Requirements {#system-requirements}

Before you begin to install and configure AEM Forms document services, ensure that:

* Hardware and software infrastructure is in place. For a detailed list of supported hardware and software, see [technical requirements](../../sites/deploying/using/technical-requirements.md).  

* Installation path of the AEM instance does not contain white-spaces.
* An AEM instance is up and running. In AEM terminology, an "instance" is a copy of AEM running on a server in the author or publish mode. Generally, you require only one AEM instance (author or publish) to run AEM Forms document services:

    * **Author**: An AEM instance used to create, upload, and edit content and to administer the website. Once content is ready to go live, it is replicated to the publish instance.
    * **Publish**: An AEM instance that serves the published content to the public over the internet or an internal network.

* Memory requirements are met. AEM Forms add-on package requires:

    * 15 GB of temporary space for Microsoft Windows-based installations.
    * 6 GB of temporary space for UNIX-based installations.

* Client software required for PDF generator to perform conversion on Microsoft Windows and Linux are installed:

    * **Microsoft Windows**: Install [Microsoft Office](../../forms/using/AEM-forms-JEE-supported-platforms.md#p-software-support-for-pdf-generator-p)or [Apache OpenOffice   
      ](../../forms/using/AEM-forms-JEE-supported-platforms.md#p-software-support-for-pdf-generator-p)
    
    * **Linux**: Install [Apache OpenOffice](../../forms/using/AEM-forms-JEE-supported-platforms.md#p-software-support-for-pdf-generator-p)

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-02-22T01:25:39.181-0500
I think we can externalize the common parts which'll show up all articles. -- System Reqs -- Install the Add-on I will take it up with the second article.
-->

>[!NOTE]
>
>* On Microsoft Windows, PDF Generator supports WebKit, Acrobat WebCapture, and WebToPDF conversion routes to convert HTML files to PDF documents.  
>* On UNIX-based operating systems, PDF Generator supports WebKit and WebToPDF conversion routes to convert HTML files to PDF documents.
>

If you are using the UNIX-based operating system, install the following packages from the installation media of the respective operating system:

<table border="0" cellpadding="0" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td width="25%"> 
    <ul> 
     <li>expat</li> 
    </ul> </td> 
   <td width="25%"> 
    <ul> 
     <li>libxcb</li> 
    </ul> </td> 
   <td width="25%"> 
    <ul> 
     <li>freetype</li> 
    </ul> </td> 
   <td width="25%"> 
    <ul> 
     <li>libXau</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td> 
    <ul> 
     <li>libSM</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>zlib</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>libICE</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>libuuid</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td> 
    <ul> 
     <li>glibc</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>libXext</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>nss-softokn-freebl</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>fontconfig</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td> 
    <ul> 
     <li>libX11</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>libXrender</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>libXrandr</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>libXinerama</li> 
    </ul> </td> 
  </tr> 
 </tbody> 
</table>

* **(PDF Generator only**) Install the 32-bit version of libcurl, libcrypto, and libssl libraries and create the below symlinks. The symlinks point to the latest version of the respective libraries:

    * /usr/lib/libcurl.so 
    * /usr/lib/libcrypto.so
    * /usr/lib/libssl.so

* **(PDF Generator only) **PDF Generator service supports WebKit and WebToPDF routes to convert HTML files to PDF documents. To enable conversion for WebToPDF route, install the below listed 64-bit libraries. Generally, these libraries are already installed. If any library is missing, install it manually:

    * linux-gate.so.1
    * libz.so.1
    * libfontconfig.so.1
    * libfreetype.so.6
    * libdl.so.2
    * librt.so.1
    * libpthread.so.0
    * libstdc++.so.6
    * libm.so.6
    * libgcc_s.so.1
    * libc.so.6
    * ld-linux.so.2
    * libexpat.so.1

### Install Adobe Acrobat and third-party applications {#install-adobe-acrobat-and-third-party-applications}

If you are going use the PDF Generator service to convert native file formats such as Microsoft Word, Microsoft Excel, Microsoft PowerPoint, OpenOffice, WordPerfect X7, and Adobe Acrobat to PDF Documents, ensure that these applications are installed on the AEM Forms server.

>[!NOTE]
>
>* Adobe Acrobat, Microsoft Word, Excel, and Powerpoint are available only for Microsoft Windows. If you are using the UNIX-based operating system, install OpenOffice to convert rich text files and supported Microsoft Office files to PDF documents.
>* Dismiss all the dialog boxes that are displayed after installing Adobe Acrobat and third-party software for all the users configured to use the PDF Generator service.
>* Start all the installed software at least once. Dismiss all the dialog boxes for all the users configured to use the PDF Generator service. 
>

After installing Acrobat, open Microsoft Word. On the **Acrobat **tab, click** Create PDF** and convert a .doc or .docx file available on your machine to a PDF Document. If the conversion is successful, AEM Forms is ready to use Acrobat with PDF Generator service.

### Setup environment variables {#setup-environment-variables}

Set environment variables for 64-bit Java Development Kit, third-party applications, and Adobe Acrobat. The environment variables should contain the absolute path of the executable used to start the corresponding application, for example, the table below lists environment variables for a few applications:

<table border="1" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td valign="top"><p><strong>Application</strong></p> </td> 
   <td valign="top"><p><strong>Environment variable</strong></p> </td> 
   <td valign="top"><p><strong>Example</strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top"><p><strong>JDK (64-bit)</strong></p> </td> 
   <td valign="top"><p>JAVA_HOME</p> </td> 
   <td valign="top"><p>C:\Program Files\Java\jdk1.8.0_74</p> </td> 
  </tr> 
  <tr> 
   <td valign="top"><p><strong>Adobe Acrobat</strong></p> </td> 
   <td valign="top"><p>Acrobat_PATH</p> </td> 
   <td valign="top"><p>C:\Program Files (x86)\Adobe\Acrobat 2015\Acrobat\Acrobat.exe</p> </td> 
  </tr> 
  <tr> 
   <td valign="top"><p><strong>Notepad</strong></p> </td> 
   <td valign="top"><p>Notepad_PATH</p> </td> 
   <td valign="top"><p>C:\WINDOWS\notepad.exe<br /> <strong></strong></p> </td> 
  </tr> 
  <tr> 
   <td valign="top"><p><strong>OpenOffice</strong></p> </td> 
   <td valign="top"><p>OpenOffice_PATH</p> </td> 
   <td valign="top"><p>C:\Program Files (x86)\OpenOffice.org4</p> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>* All environment variables and respective paths are case-sensitive.
>* JAVA_HOME and Acrobat_PATH (Windows only) are mandatory environment variables.  
>* The environment variable OpenOffice_PATH is set to the installation folder instead of the path to the executable.
>* Do not set up environment variables for Microsoft Office applications such as Word, PowerPoint, Excel, and Project, or for AutoCAD. If these applications are installed on the server, the Generate PDF service automatically starts these applications.
>* On UNIX-based platforms, install OpenOffice as /root. If OpenOffice is not installed as root, the PDF Generator service fails to convert OpenOffice documents to PDF documents. If you are required to install and run OpenOffice as a non-root user, then provide sudo rights to the non-root user.  
>* If you are using OpenOffice on a UNIX-based platform, run the following command to set the path variable:  
>  `export OpenOffice_PATH=/opt/openoffice.org4`
>

### (Only for IBM WebSphere) Configure IBM SSL socket provider {#only-for-ibm-websphere-configure-ibm-ssl-socket-provider}

* Perform the following steps to configure IBM SSL socket provider:

1. Create a copy of the java.security file. The default location of the file is [WebSphere_installation_directory]\Appserver\java_[version]\jre\lib\security.
1. Open the copied java.security file for editing.
1. Change the default SSL socket factories to use the JSSE2 factories instead of default IBM WebSphere factories:

   **Default content:**

   ```shell
   #ssl.SocketFactory.provider=com.ibm.jsse2.SSLSocketFactoryImpl
   #ssl.ServerSocketFactory.provider=com.ibm.jsse2.SSLServerSocketFactoryImpl
   #WebSphere socket factories (in cryptosf.jar)
   ssl.SocketFactory.provider=com.ibm.websphere.ssl.protocol.SSLSocketFactory
   ssl.ServerSocketFactory.provider=com.ibm.websphere.ssl.protocol.SSLServerSocketFactory
   ```

   **Modified content:**

   ```shell
   ssl.SocketFactory.provider=com.ibm.jsse2.SSLSocketFactoryImpl
   ssl.ServerSocketFactory.provider=com.ibm.jsse2.SSLServerSocketFactoryImpl
   
   #WebSphere socket factories (in cryptosf.jar)
   #ssl.SocketFactory.provider=com.ibm.websphere.ssl.protocol.SSLSocketFactory
   #ssl.ServerSocketFactory.provider=com.ibm.websphere.ssl.protocol.SSLServerSocketFactory
   ```

1. To enable AEM Forms server to use the updated java.security file, while starting the AEM Forms server, add the following java argument:

   `-Djava.security.properties= [path of newly created Java.security file].`

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

### Configure Install Ink and Handwriting service {#configure-install-ink-and-handwriting-service}

If you are running Microsoft Windows Server, configure the Ink and Handwriting service. The service is required to open Microsoft PowerPoint files which use inking capabilities of Microsoft Office:

1. Open the Server Manager. Click the **Server Manager** icon on the Quick Launch tray.
1. Click **Add Features** in the **Features** menu. Select the **Ink and Handwriting Services** check box. 
1. **Select Features** dialog box with **Ink and Handwriting Services** selected. Click **Install **and the service is installed.

### Configure the file block settings for Microsoft Office {#configure-the-file-block-settings-for-microsoft-office}

Change the Microsoft Office trust center settings to enable the PDF Generator service to convert files created with older versions of Microsoft Office.

1. Open a Microsoft Office application. For example, Microsoft Word. Navigate to **[!UICONTROL File]**> **[!UICONTROL Options]**. The options dialog box appears.  

1. Click **Trust Center**, and click **Trust Center Settings**.
1. In the **Trust Center settings**, click **File Block Settings**.
1. In the** File Type** list, deselect **Open **for the file type that the PDF Generator service should be allowed to convert to PDF documents.

### Grant the Replace a process level token privilege {#grant-the-replace-a-process-level-token-privilege}

The user account used to start the application server requires the **Replace a process level token** privilege. The local system account has the **Replace a process level token** privilege by default. For the servers running with a user of the Local Administrators group, the privilege must be granted explicitly. Perform the following steps to grant the privilege:

1. Open the Group Policy Editor for Microsoft Windows. To open the Group Policy Editor, click **Start**, type **gpedit.msc** in the Start Search box, and click **Group Policy Editor**.
1. Navigate to **Local Computer Policy** &gt; **Computer Configuration** &gt; **Windows Settings** &gt; **Security Settings** &gt; **Local Policies** &gt; **User Rights Assignment** and edit the **Replace a process level token** policy and include the Administrators group.
1. Add the user to the Replace a Process Level Token entry.

#### Enable the PDF Generator service for non-administrators {#enable-the-pdf-generator-service-for-non-administrators}

You can enable a non-administrator user to use the PDF Generator service. Normally, only users with administrative privileges can use the service:

1. Create an environment variable, PDFG_NON_ADMIN_ENABLED.   

1. Set value of the environment variable to TRUE.
1. Restart the AEM Forms instance.

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

### Disable User Account Control (UAC) {#disable-user-account-control-uac}

1. To access the System Configuration Utility, go to **Start &gt; Run **and then enter **MSCONFIG.** 
1. Click the **Tools **tab and scroll down and select **Change UAC Settings**. Click **Launch **to run the command in a new window.
1. Adjust the slider to the Never notify level. When finished, close the command window and close the System Configuration window.
1. Verify that registry setting for UAC is set to 0 (zero). Perform the following steps to verify:

    1. Microsoft recommends backing up the registry before you modify it. For detailed steps, see [How to back up and restore the registry in Windows](https://support.microsoft.com/en-us/help/322756).
    1. Open Microsoft Windows Registry editor. To open registry editor, go to Start &gt; Run, type regedit, and click OK.
    1. Navigate to HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system\. Ensure value of EnableLUA is set to 0 (zero).
    1. Ensure value of **EnableLUA **is set to 0 (zero). If the value is not 0, change the value to 0. Close the registry editor.

1. Restart your computer.

### Disable Error Reporting service {#disable-error-reporting-service}

While converting a document to PDF using the PDF Generator service on Windows Server, occasionally, Windows Server reports that the executable has encountered a problem and needs to close. However, it does not impact the PDF conversion as it continues in the background.

To avoid receiving the error, you can disable the Windows error reporting. For more information on disabling error reporting, see [http://technet.microsoft.com/en-us/library/cc754364.aspx](http://technet.microsoft.com/en-us/library/cc754364.aspx).

### Configure HTML to PDF conversion {#configure-html-to-pdf-conversion}

The PDF Generator service provides WebKit, WebCapture, and WebToPDF routes or methods to convert HTML files to PDF documents. On Windows, to enable conversion for WebKit and Acrobat WebCapture routes, copy the Unicode font to %windir%\fonts directory.

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-02-22T01:11:05.772-0500
This assumes that the Add-on is already installed. [KS]: Done
-->

### Extra configurations for HTML to PDF conversion  {#extra-configurations-for-html-to-pdf-conversion}

On UNIX-based platforms, the PDF Generator service supports WebKit and WebToPDF routes to convert HTML files to PDF documents. To enable HTML to PDF conversion, perform the following configurations, applicable to your preferred conversion route:

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-02-22T01:25:06.690-0500
Why are we repeating this content? If we have some common content, let's see if we can pull it out into a common section. [KS]: All the content is specific to OS except the header section. Only a couple of starting lines are common with Linux.
-->

#### Enable support for Unicode fonts (WebKit only) {#enable-support-for-unicode-fonts-webkit-only}

Copy the Unicode font to any of the following directories as appropriate for your system:

* /usr/lib/X11/fonts/TrueType
* /usr/share/fonts/default/TrueType
* /usr/X11R6/lib/X11/fonts/ttf
* /usr/X11R6/lib/X11/fonts/truetype
* /usr/X11R6/lib/X11/fonts/TrueType
* /usr/X11R6/lib/X11/fonts/TTF
* /usr/openwin/lib/X11/fonts/TrueType (Solaris)

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-02-22T01:16:09.312-0500
Either remove Windows or pull this section out into the common area. [KS]: Removed the Windows related content.
-->

>[!NOTE]
>
>* On RedHat Enterprise Linux 6.x and later, the courier fonts are not available. To install the courier fonts, download the font-ibm-type1-1.0.3.zip archive. Extract the archive at /usr/share/fonts. Create a symbolic link from /usr/share/X11/fonts to /usr/share/fonts.  
>* Delete all the .lst font cache files from the Html2PdfSvc/bin and /usr/share/fonts directories.
>* Ensure that the directories /usr/lib/X11/fonts and /usr/share/fonts exist. If the directories do not exist, then use the ln command to create* a symbolic link from /usr/share/X11/fonts to /usr/lib/X11/fonts and another symbolic link from /usr/share/fonts to /usr/share/X11/fonts. *Also ensure that the courier fonts are available at /usr/lib/X11/fonts.
>* Ensure that all the fonts (Unicode and non-unicode) are available in the /usr/share/fonts or /usr/share/X11/fonts directory.  
>* When you run PDF Generator service as a non-root user, provide the non-root user read and write access to all the font directories.
>

## Install AEM Forms add-on package {#install-aem-forms-add-on-package}

<!--
Comment Type: annotation
Last Modified By: virai
Last Modified Date: 2018-02-21T09:06:29.041-0500
Let's externalize and modularize the install the Add-on instructions in a separate article.
-->

AEM Forms add-on package is an application deployed onto AEM. The package contains AEM Forms Document Services and other AEM Forms capabilities. Perform the following steps to install the package:

1. Log in to the [AEM server](http://localhost:4502) as an administrator and open [package share](http://localhost:4502/crx/packageshare). You require an Adobe ID to log in to the package share.  

1. In [AEM package share](http://localhost:4502/crx/packageshare/login.html), search **AEM 6.5 Forms add-on packages**, click the package applicable to your operating system, and click **Download**. Read and accept the license agreement and click **OK**. The download starts. Once downloaded, the word **Downloaded **appears next to the package.

   You can also use the version number to search an add-on package. For version number of the latest package, see the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article.

1. After the download completes, click **Downloaded**. You are redirected to package manager. In the package manager, search the downloaded package, and click **Install**.

   If you manually download the package via the direct link listed in the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article, log in to the package manager, click **Upload Package**, select the downloaded package, and click upload. After the package is uploaded, click package name, and click **Install.**

1. After the package is installed, you are prompted to restart the AEM instance. **Do not immediately stop the server.** Before stopping the AEM Forms server, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the [AEM-Installation-Directory]/crx-quickstart/logs/error.log file and the log is stable.

## Post-installation configurations {#post-installation-configurations}

#### Configure Boot Delegation for RSA/BouncyCastle libraries  {#configure-boot-delegation-for-rsa-bouncycastle-libraries}

1. Stop the AEM instance. Navigate to the [AEM installation directory]\crx-quickstart\conf\ folder. Open the sling.properties file for editing.

   If you use [AEM installation directory]\crx-quickstart\bin\start.bat to start an AEM instance, edit the sling.properties located at [AEM_root]\crx-quickstart\. 

1. Add the following properties to the sling.properties file:

   ```
   sling.bootdelegation.class.com.rsa.jsafe.provider.JsafeJCE=com.rsa.*
   sling.bootdelegation.class.org.bouncycastle.jce.provider.BouncyCastleProvider=org.bouncycastle.*
   ```

1. Save and close the file.

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

#### Configuring the font manager service  {#configuring-the-font-manager-service}

1. Log in to [AEM Configuration Manager](http://localhost:4502/system/console/configMgr) as an administrator. 
1. Locate and open the **CQ-DAM-Handler-Gibson Font Managers** service. Specify the path of the System Fonts, Adobe Server Fonts, and Customer Fonts directories. Click **Save**.

   >[!NOTE]
   >
   >Your right to use fonts provided by parties other than Adobe is governed by the license agreements provided to you by such parties with those fonts, and is not covered under your license to use Adobe software. Adobe recommends that you review and ensure that you are in compliance with all applicable non-Adobe license agreements before using non-Adobe fonts with Adobe software, particularly with respect to use of fonts in a server environment.

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

#### Configure a local user account to run the PDF Generator service  {#configure-a-local-user-account-to-run-the-pdf-generator-service}

A local user account is required to run the PDF Generator service. For steps to create a local user, see [Create a user account in Windows](https://support.microsoft.com/en-us/help/13951/windows-create-user-account) or [create a user account in UNIX-based platforms](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/Step_by_Step_Guide/s1-starting-create-account.html).

1. Open the [AEM Forms PDF Generator Configuration](http://localhost:4502/libs/fd/pdfg/config/ui.html) page.

1. In the **User Accounts** tab, provide credentials of a local user account, and click **Submit**. If Microsoft Windows prompts, allow access to the user. When added successfully, the configured user is displayed under the **Your user accounts** section in the **User Accounts** tab.

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

#### Configure the time-out settings {#configure-the-time-out-settings}

1. In [AEM configuration manager](http://localhost:4502/system/console/configMgr), locate and open the **Jacorb ORB Provider** service.

   Add the following to the **[!UICONTROL Custom Properties.name]**field and click **Save**. It sets the pending reply timeout (also known as, CORBA client timeout) to 600 seconds.

   `jacorb.connection.client.pending_reply_timeout=600000`

1. Log in to the AEM author instance and navigate to **Adobe Experience Manager** &gt; **Tools**&gt;** Forms &gt; Configure PDF Generator**. The default URL is http://localhost:4502/libs/fd/pdfg/config/ui.html.

   Open the **General Configuration** tab and modify the value of the following fields for your environment:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td>Field</td> 
   <td>Description</td> 
   <td>Default Value</td> 
  </tr> 
  <tr> 
   <td>Server Conversion Timeout</td> 
   <td>A PDFG conversion stays active for the number of seconds defined in the Server Conversion timeout</td> 
   <td>270 seconds<br /> </td> 
  </tr> 
  <tr> 
   <td>PDFG Cleanup Scan Seconds</td> 
   <td>The number of seconds required to perform post-conversion operations.<br /> </td> 
   <td>3600 seconds</td> 
  </tr> 
  <tr> 
   <td>Job Expiration Seconds</td> 
   <td>Duration for which PDF Generator service is allowed to run a conversion. Ensure that the value of the Job Expiration Seconds is greater than the PDFG Cleanup Scan Seconds value.</td> 
   <td>7200 seconds</td> 
  </tr> 
 </tbody> 
</table>

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

#### Configure Acrobat for the PDF Generator service {#configure-acrobat-for-the-pdf-generator-service}

On Microsoft Windows, the PDF Generator service uses Adobe Acrobat to convert supported file formats to a PDF document. Perform the following steps to configure Adobe Acrobat for the PDF Generator service:

1. Open Acrobat and select **[!UICONTROL Edit]**> **[!UICONTROL Preferences]**> **[!UICONTROL Updater]**. In Check for updates, deselect **Automatically install updates**, and click **OK**. Close Acrobat.
1. Double-click a PDF document on your system. When Acrobat starts for the first time, the dialog boxes for Sign-in, Welcome screen, and EULA appear. Dismiss these dialog boxes for all the users configured to use PDF Generator. 
1. Run the PDF Generator utility batch file to configure Acrobat for the PDF Generator service:

    1. Open [AEM Package Manager](http://localhost:4502/crx/packmgr/index.jsp) and download the adobe-aemfd-pdfg-common-pkg-[version].zip file from the package manager. 
    1. Unzip the downloaded .zip file. Open the command prompt with administrative privileges.
    1. Navigate to the [extracted-zip-file]\jcr_root\etc\fd\pdfg\tools\adobe-aemfd-pdfg-utilities-[version]-win.zip\scripts directory. Run the following batch file:

       `Acrobat_for_PDFG_Configuration.bat`

       Acrobat is configured to run with the PDF Generator service.

       <!--    
       Comment Type: draft    
    
       <li>Step text</li>    
       -->

       <!--    
       Comment Type: draft    
    
       <li>Step text</li>    
       -->

1. Run System Readiness Tool (SRT) to validate Acrobat installation. The tool checks if the machine is configured properly to run PDF Generator conversions and generates a report at the specified path:

    1. Open command prompt. Navigate to the [extracted-adobe-aemfd-pdfg-common-pkg]\jcr_root\etc\fd\ pdfg\tools\adobe-aemfd-pdfg-utilities-[version]-win.zip\srt folder. Run the following command from the command prompt:

       `cscript SystemReadinessTool.vbs [Path_of_reports_folder] en`

       >[!NOTE]
       >
       >If the System Readiness Tool reports that the pdfgen.api file is not available in the acrobat plug-ins folder then copy the pdfgen.api file from the [extracted-adobe-aemfd-pdfg-common-pkg]\plugins\x86_win32 directory to the [Acrobat_root]\Acrobat\plug_ins directory.

    1. Navigate to [Path_of_reports_folder]. Open the SystemReadinessTool.html file. Verify the report and fix the mentioned issues.

       <!--    
       Comment Type: draft    
    
       <li></li>    
       -->

       <!--    
       Comment Type: draft    
    
       <li>Step text</li>    
       -->

       <!--    
       Comment Type: draft    
    
       <li>Step text</li>    
       -->

   <!--
   Comment Type: draft

   <li>Step text</li>
   -->

<!--
Comment Type: draft

<h4 id="Multi-threaded file conversions">Configure multi-threaded file conversions</h4>
-->

<!--
Comment Type: annotation
Last Modified By: khsingh
Last Modified Date: 2018-02-16T08:45:14.788-0500
The following article has information about Enabling multi-threaded file conversions. Most of the sections mentioned in article are already covered in previous configuration. What special configurations are remaining. Moreover, the article is for JEE. What need to move required information to OSGi article. https://helpx.adobe.com/experience-manager/6-3/forms/using/admin-help/enabling-multi-threaded-file-conversions.html
-->

#### Configure primary route for HTML to PDF conversion (Windows only) {#configure-primary-route-for-html-to-pdf-conversion-windows-only}

The PDF Generator service provides multiple routes to convert HTML files to PDF documents: Webkit, Acrobat WebCapture (Windows only), and WebToPDF. Adobe recommends using WebToPDF route because it has the capability to handle dynamic content and has no dependencies on 32-bit libraries or requires no extra fonts. Also, WebToPDF route does not require sudo or root access to run the conversion.

The default primary route for HTML to PDF conversion is Webkit. To change the conversion route:

1. On AEM author instance, navigate to **[!UICONTROL Tools]**> **[!UICONTROL Forms]**> **[!UICONTROL Configure PDF Generator]**.

1. In the **[!UICONTROL General Configuration]** tab, select the preferred conversion route from the **[!UICONTROL Primary Route for HTML to PDF conversions]** drop-down.

<!--
Comment Type: annotation
Last Modified By: virai
Last Modified Date: 2018-02-21T09:03:15.827-0500
Why are we repeating this content? If we have some common content, let's see if we can pull it out into a common section.
-->

#### Set up certificates for Reader extension and encryption service {#setupreaderextensions}

The DocAssurance service can apply usage rights to PDF documents. To apply usage rights to PDF documents, configure the certificates.

Before setting up the certificates, ensure that you have a:

* Certificate file (.pfx).
* Private Key password provided with the certificate.
* Private Key Alias. You can execute the Java keytool command to view the Private Key Alias:  
  keytool -list -v -keystore [keystore-file] -storetype pkcs12
* Keystore file password. If you are using Adobe's Reader Extensions certificate, the Keystore file password is always the same as Private Key password.

Perform the following steps to configure the certificates:

1. Log in to AEM Author instance as an administrator. Go to **Tools** &gt; **Security** &gt; **Users**.
1. Click the **name** field of the user account. The **Edit User Settings** page opens. On the AEM Author instance, certificates reside in a KeyStore. If you have not created a KeyStore earlier, select the **Keystore** tab and click **Create KeyStore** and set a new password for the KeyStore. If the server already contains a KeyStore, skip this step. If you are using Adobe's Reader Extensions certificate, the Keystore file password is always the same as Private Key password.
1. On the **Edit User Settings** page, select the** KeyStore **tab. Expand the **Add Private Key from Key Store file** option and provide an alias. The alias is used to perform the Reader Extensions operation.
1. To upload the certificate file, click **Select Key Store File** and upload a &lt;filename&gt;.pfx file.

   Add the **Key Store Password**,** Private Key Password**, and **Private Key Alias **that is associated with the certificate to the respective fields. Click **Submit**.

   >[!NOTE]
   >
   >In the production environment, replace your evaluation credentials with production credentials. Ensure that you delete your old Reader Extensions credentials, before updating an expired or evaluations credential.

1. Click **Save & Close** on the **Edit User Settings** page.

#### Enable AES-256 {#enable-aes}

To use AES 256 encryption for PDF files, obtain and install the Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy files. Replace the local_policy.jar and US_export_policy.jar files in the jre/lib/security folder. For example, if you are using Sun JDK, copy the downloaded files to the [JAVA_HOME]/jre/lib/security folder.

The Assembler service depends on the Reader Extensions service, Signature service, Forms service, and Output service. Perform the following steps to verify that the required services are up and running:

1. Log in to URL http://[server]:[port]&gt;/system/console/bundles as an administrator.
1. Search the following service and ensure that the services are up and running:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <th>Service Name</th> 
   <th>Bundle Name</th> 
  </tr> 
  <tr> 
   <td>Signatures Service</td> 
   <td>adobe-aemfd-signatures</td> 
  </tr> 
  <tr> 
   <td>Reader Extensions Service</td> 
   <td>com.adobe.aemfd.adobe-aemfd-readerextensions<br /> </td> 
  </tr> 
  <tr> 
   <td>Forms Service</td> 
   <td>com.adobe.livecycle.adobe-lc-forms-bedrock-connector<br /> </td> 
  </tr> 
  <tr> 
   <td>Output Service</td> 
   <td>com.adobe.livecycle.adobe-lc-forms-bedrock-connector</td> 
  </tr> 
 </tbody> 
</table>

## Known issues and troubleshooting {#known-issues-and-troubleshooting}

* The HTML to PDF conversion fails if a zipped input file contains HTML files with double-byte characters in filenames. To avoid this problem, do not use double-byte characters when naming HTML files.

* On UNIX-based operating systems, do the following to find any missing libraries:

1. Navigate to [crx-repository]/bedrock/svcnative/HtmlToPdfSvc/bin/.  

1. Run the following command to list all libraries that WebToPDF requires for HTML to PDF conversion.

   `ldd phantomjs`

   Run the following command to list missing libraries.

   `ldd phantomjs | grep not`

1. Manually install the missing libraries.

## Next steps {#next-steps}

You have a working AEM Forms document services environment. You can use document services through:

* [Form centric workflows on OSGi](../../forms/using/aem-forms-workflow.md)
* [Watched Folders](../../forms/using/watched-folder-in-aem-forms.md)
* [Document services APIs](/forms/using/aem-document-services-programmatically.md)

<!--
Comment Type: draft

<li></li>
-->

<!--
Comment Type: draft

<li></li>
-->

<!--
Comment Type: draft

<li></li>
-->

