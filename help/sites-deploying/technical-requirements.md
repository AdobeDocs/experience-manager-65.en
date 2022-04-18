---
title: Technical Requirements
seo-title: Technical Requirements
description: A list of the supported client and server platforms for AEM.
seo-description: A list of the supported client and server platforms for AEM.
content-type: reference
topic-tags: platform
exl-id: 47529b9a-c4e5-434f-ac26-b01714ff863b
---
# Technical Requirements{#technical-requirements}

Adobe supports Adobe Experience Manager (AEM) on the platforms as detailed in the following information in this document.

For any issues that are specifically related to the platform, contact the platform vendor.

>[!NOTE]
>
>Depending upon the platform on which you install AEM, there could be different sets of requirements for user management.

## Prerequisites {#prerequisites}

Minimum requirements for installing Adobe Experience Manager:

* Installed Java Platform, Standard Edition JDK, or other supported [Java Virtual Machines](#java-virtual-machines)
* Experience Manager Quickstart file (Stand-alone JAR or web-application deployment WAR)

### Minimum Sizing Requirements {#minimum-sizing-requirements}

Minimum requirements for running Adobe Experience Manager:

* 5 GB free disk space in the installation directory
* 2 GB memory

>[!NOTE]
>
>* Digital asset use cases need more base memory. See [Deploying and Maintaining](/help/sites-deploying/deploy.md#default-local-install) for details.
>* [AEM Forms add-on package](/help/forms/using/installing-configuring-aem-forms-osgi.md) requires 15 GB of temporary space.
>

For further information, see the [Hardware Sizing Guidelines](/help/managing/hardware-sizing-guidelines.md).

### Support Levels {#support-levels}

This document lists the supported client and server platforms for Adobe Experience Manager. Adobe provides several levels of support, both for recommended configurations and other configurations.

### Supported Configurations {#supported-configurations}

Adobe recommends these configurations and provides full support as part of the standard software maintenance agreement.

<table>
 <tbody>
  <tr>
   <td>Support Level</td>
   <td>Description<br /> </td>
  </tr>
  <tr>
   <td><strong>A: Supported</strong></td>
   <td>Adobe provides full support and maintenance for this configuration. This configuration is covered by Adobe's quality assurance process.</td>
  </tr>
  <tr>
   <td><strong>R: Restricted Support</strong></td>
   <td>To ensure our customers project success, Adobe provides full support within a restricted support program, which requires that specific conditions are met. R-level support requires a formal customer request and confirmation by Adobe. For more information, contact Adobe Customer Care.</td>
  </tr>
 </tbody>
</table>

### Unsupported Configurations {#unsupported-configurations}

| Support Level |Description |
|---|---|
| **Z: Not supported** |The configuration is not supported. Adobe does not make any statements about whether the configuration works, and does not support it. |

## Supported Platforms {#supported-platforms}

### Java Virtual Machines {#java-virtual-machines}

The application requires a Java Virtual Machine to run, which is provided by the Java Development Kit (JDK) distribution.

Adobe Experience Manager operates with the following versions of the Java Virtual Machines:

>[!CAUTION]
>
>It is recommended to track the Security Bulletins from the Java vendor to ensure the safety and security of production environments and install the latest Java Updates.

| **Platform** | **Support Level** | **Link** |
|---|---|---|
| Oracle Java SE 11 JDK - 64bit | A: Supported `[1]` | [Download](https://experience.adobe.com/#/downloads/content/software-distribution/en/general.html?fulltext=Oracle*+JDK*+11*&orderby=%40jcr%3Acontent%2Fjcr%3AlastModified&orderby.sort=desc&layout=list&p.offset=0&p.limit=24<td>) |
| Oracle Java SE 10 JDK | Z: Not supported `[1]` |
| Oracle Java SE 9 JDK | Z: Not supported `[1]` |
| Oracle Java SE 8 JDK - 64bit | A: Supported `[1]` | [Download](https://experience.adobe.com/#/downloads/content/software-distribution/en/general.html?fulltext=Oracle*+JDK*+8*&orderby=%40jcr%3Acontent%2Fjcr%3AlastModified&orderby.sort=desc&layout=list&p.offset=0&p.limit=10) |
| IBM J9 VM - build 2.9, JRE 1.8.0 | A: Supported `[2]` |
| IBM J9 VM - build 2.8, JRE 1.8.0 | A: Supported `[2]` |
| Azul Zulu OpenJDK 11 - 64bit | A: Supported `[3]` | |
| Azul Zulu OpenJDK 8 - 64bit | A: Supported `[3]` | |

1. Oracle has moved to a "Long Term Support" (LTS) model for Oracle Java SE products. Java 9, Java 10, and Java 12 are non-LTS releases by Oracle (see [Oracle Java SE support roadmap](https://www.oracle.com/technetwork/java/eol-135779.html)). To deploy AEM in production environment, Adobe provides support only for the LTS releases of Java. Support and distribution of the Oracle Java SE JDK, including all maintenance updates of LTS releases beyond the end of the public updates, will be supported by Adobe directly for all AEM customers making use of the Oracle Java SE technology. See the [Java support policy for Adobe Experience Manager](assets/Java_Policy_for_Adobe_Experience_Manager.pdf) for more information.


1. The IBM JRE is only supported along with WebSphere Application Server.
 
1. Azul Zulu OpenJDK LTS versions are supported for on-premises AEM deployments starting with version 6.5 SP9. Support and distribution of the Azul Zulu JDK LTS versions must be licensed directly from Azul by our customers.


### Storage & Persistence {#storage-persistence}

Various options exist to deploy the repository of Adobe Experience Manager. See the following list for supported technologies and storage options.

| **Platform** |**Description** |**Support Level** |
|---|---|---|
| **File system with TAR files** `[1]` |Repository |A: Supported |
| **File system with Datastore** `[1]` |Binaries |A: Supported |
| Store binaries in TAR files on file system `[1]` |Binaries |Z: Not supported for production |
| Amazon S3 |Binaries |A: Supported |
| Microsoft Azure Blob Storage |Binaries |A: Supported |
| MongoDB Enterprise 4.2 |Repository |A: Supported `[2, 3, 4]` |
| MongoDB Enterprise 4.0 |Repository |Z: Not supported |
| MongoDB Enterprise 3.6 |Repository |Z: Not supported |
| MongoDB Enterprise 3.4 |Repository |Z: Not supported |
| IBM DB2 10.5 |Repository & Forms Database |R: Restricted Support `[5]` |
| Oracle Database 12c (12.1.x) |Repository & Forms Database |R: Restricted Support |
| Microsoft SQL Server 2016 |Forms Database |A: Supported |
| **Apache Lucene (Quickstart built-in)** |Search Service |A: Supported |
| Apache Solr |Search Service |A: Supported |

1. 'File System' includes block storage that is POSIX-compliant. This includes network storage technology. Mind that file system performance might vary and influences the overall performance. It is recommended to load test AEM in combination with the network/remote file system.
1. MongoDB Enterprise 4.2 requires AEM 6.5 SP9 as minimum.
1. MongoDB Sharding is not supported in AEM.
1. MongoDB Storage Engine WiredTiger is supported only.
1. Supported for AEM Forms upgrade customers. Not supported for new installations.

>[!NOTE]
>
>See [Deploying Communities](/help/communities/deploy-communities.md) for additional information regarding the AEM Communities capability.

>[!NOTE]
>
>MongoDB is third-party software and is not included in the AEM licensing package. For more information see the [MongoDB licensing policy](https://www.mongodb.org/about/licensing/) page.
>
>To get the most of your AEM deployment with MongoDB, Adobe recommends licensing the MongoDB Enterprise version to benefit from professional support. See [Recommended Deployments](/help/sites-deploying/recommended-deploys.md#prerequisites-and-recommendations-when-deploying-aem-with-mongomk) for more information.
>
>The license includes a standard replica set, which is composed of one primary and two secondary instances that can be used for either the author or the publish deployments.
>
>In case you want to run both author and publish on MongoDB, two separate licenses need to be purchased.
>
>Adobe Customer Care will assist qualifying issues related to the usage of MongoDB with AEM.
>
>For more information, see the [MongoDB for Adobe Experience Manager page](https://www.mongodb.com/lp/contact/mongodb-adobe-experience-manager).

>[!NOTE]
>
>Supported relational databases as listed above are third-party software and are not included in the AEM licensing package.
>
>To run AEM 6.5 with a supported relational database, a separate support contract with a database vendor is required. Adobe Customer Care will assist qualifying issues related to the usage of relational databases with AEM 6.5.
>
>**Most relational databases are currently supported within Level-R on AEM 6.5, which comes with support criteria and a support program as stated in the Level-R description above.**

### Servlet Engines / Application Servers {#servlet-engines-application-servers}

Adobe Experience Manager can run either as a stand-alone server (the quickstart JAR file) or as web application within a third-party application server (the WAR file).

Minimum Servlet API Version required is Servlet 3.1

| Platform |Support Level |
|---|---|
| **Quickstart built-in Servlet Engine (Jetty 9.4)** |A: Supported |
| Oracle WebLogic Server 12.2 (12cR2) |Z: Not supported  |
| IBM WebSphere Application Server Continuous Delivery (LibertyProfile) with Web Profile 7.0 and IBM JRE 1.8 |R: Restricted Support for new contracts `[2]` |
| IBM WebSphere Application Server 9.0 and IBM JRE 1.8 |R: Restricted Support for new contracts `[1]` `[2]` |
| Apache Tomcat 8.5.x |R: Restricted Support for new contracts `[2]` |
| JBoss EAP 7.2.x with JBoss Application Server |Z: Not supported  |
| JBoss EAP 7.1.4 with JBoss Application Server |R: Restricted Support for new contracts `[1]` `[2]` |
| JBoss EAP 7.0.x with JBoss Application Server |Z: Not supported  |

1. Recommended for deployments with AEM Forms.
1. Starting AEM 6.5 deployments on application servers moves to Restricted Support. Existing customers can upgrade to AEM 6.5 and keep using application servers. For new customers it comes with support criteria and a support program as stated in the Level-R description above.

### Server Operating Systems {#server-operating-systems}

Adobe Experience Manager works with the following server platforms for production environments:

| **Platform** |**Support Level** |
|---|---|
| **Linux, based on Red Hat distribution** |A: Supported `[1]` `[3]` |
| Linux, based on Debian distribution incl. Ubuntu |A: Supported `[2]` |
| Linux, based on SUSE distribution |A: Supported |
| Microsoft Windows Server 2019 `[4]` |R: Restricted Support for new contracts |
| Microsoft Windows Server 2016 `[4]` |R: Restricted Support for new contracts `[5]` |
| Microsoft Windows Server 2012 R2 |Z: Not supported  |
| Oracle Solaris 11 |Z: Not supported  |
| IBM AIX 7.2 |Z: Not supported  |

1. Linux Kernel 2.6, 3.x and 4.x includes derivatives from Red Hat distribution, including Red Hat Enterprise Linux, CentOS, Oracle Linux and Amazon Linux. AEM Forms add-on features are only supported on CentOS 7, Red Hat Enterprise Linux 7, and Red Hat Enterprise Linux 8.
1. AEM Forms is supported only on Ubuntu 16.04 LTS
1. Linux distribution supported by Adobe Managed Services
1. Microsoft Windows production deployments are supported for customers upgrading to 6.5 and for non-production usage. New deployments are on-request for AEM Sites and Assets.
1. AEM Forms is supported on Microsoft Window Server without the Support-Level R restrictions. 


### Virtual & Cloud Computing Environments {#virtual-cloud-computing-environments}

Adobe Experience Manager is supported running in a virtual machine on cloud computing environments, such as Microsoft Azure and Amazon Web Services (AWS), in compliance with the technical requirements listed on this page, and according to Adobe’s standard support terms.

Adobe recommends using Adobe Managed Services to deploy AEM on Azure or AWS. Adobe Managed Services provides experts with experience and skills of deploying and operating AEM in these cloud computing environments. See [additional documentation on Adobe Managed Services](https://www.adobe.com/marketing-cloud/enterprise-content-management/managed-services-cloud-platform.html?aemClk=t).

In all other cases of deploying AEM on Azure or AWS, or any other cloud computing environment, support from Adobe will be contained to the virtual compute environment in compliance with the technical specifications listed on this page. Any reported issue relative to AEM running in any of these cloud environments will need to be reproducible independently from any cloud service specific to the cloud computing environment, unless the cloud service is specifically supported as part of the technical requirements listed on this page, for example Azure Blob storage or AWS S3.

For recommendations on how to deploy AEM on Azure or AWS, outside of Adobe Managed Services, Adobe strongly recommends working directly with the cloud provider or Adobe partners supporting the deployment of AEM in the cloud environment of your choice. The selected cloud provider or partner will be responsible for the sizing specifications, design and implementation of the architecture., to meet your specific performance, load, scalability, and security requirements.

### Dispatcher Platforms (Web Servers) {#dispatcher-platforms-web-servers}

The Dispatcher is the caching and load balancing component. [Download the latest Dispatcher version](https://helpx.adobe.com/experience-manager/dispatcher/release-notes.html). Experience Manager 6.5 requires Dispatcher version 4.3.2 or higher.

The following web servers are supported for use with Dispatcher version 4.3.2:

| Platform |Support Level |
|---|---|
| **Apache httpd 2.4.x** `[1,2]` |A: Supported |
| Microsoft IIS 10 (Internet Information Server) |A: Supported |
| Microsoft IIS 8.5 (Internet Information Server) |Z: Not supported  |

1. Web servers built on the basis of Apache httpd source code will have the same level of support as the version of httpd on which it is based. If in doubt, ask Adobe for confirmation of the support level related to the respective server product. Following cases:

    1. The HTTP server was built using only official Apache source distributions, or
    1. The HTTP server was delivered as part of the operating system on which it is running. Examples: IBM HTTP Server, Oracle HTTP Server

1. Dispatcher is not available for Apache 2.4.x for Windows operating systems.

## Supported Client Platforms {#supported-client-platforms}

### Supported Browsers for Authoring User Interface {#supported-browsers-for-authoring-user-interface}

The Adobe Experience Manager user interface works with the following client platforms. All browsers are tested with the default set of plug-ins and add-ons.

The AEM user interface is optimized for larger screens (typically notebooks and desktop computers) and tablet form factor (such as Apple iPad or Microsoft Surface). The phone form factor is not supported.

>[!NOTE]
>
>**Support for browsers with rapid release cycles:**
>
>Mozilla Firefox, Google Chrome and Microsoft Edge release updates every few months. Adobe is committed to provide updates for Adobe Experience Manager to maintain the support level as stated below with upcoming versions of these browsers.

<table>
 <tbody>
  <tr>
   <td><strong>Browser</strong></td>
   <td><strong>Support for UI<br /> </strong></td>
   <td><strong>Support for Classic UI</strong></td>
  </tr>
  <tr>
   <td><strong>Google Chrome (Evergreen)</strong></td>
   <td>A: Supported</td>
   <td>A: Supported</td>
  </tr>
  <tr>
   <td>Microsoft Edge (Evergreen)</td>
   <td>A: Supported</td>
   <td>A: Supported</td>
  </tr>
  <tr>
   <td>Microsoft Internet Explorer 11</td>
   <td>Z: Not supported</td>
   <td>Z: Not supported</td>
  </tr>
  <tr>
   <td>Mozilla Firefox (Evergreen)</td>
   <td>A: Supported</td>
   <td>A: Supported</td>
  </tr>
  <tr>
   <td>Mozilla Firefox last ESR [1]</td>
   <td>A: Supported</td>
   <td>A: Supported</td>
  </tr>
  <tr>
   <td>Apple Safari on macOS (Evergreen)</td>
   <td>A: Supported</td>
   <td>A: Supported</td>
  </tr>
  <tr>
   <td>Apple Safari 11.x on macOS</td>
   <td>Z: Not supported</td>
   <td>Z: Not supported</td>
  </tr>
  <tr>
   <td>Apple Safari on iOS 12.x</td>
   <td>A: Supported [2]</td>
   <td>Z: Not supported</td>
  </tr>
  <tr>
   <td>Apple Safari on iOS 11.x</td>
   <td>Z: Not supported</td>
   <td>Z: Not supported</td>
  </tr>
 </tbody>
</table>

1. Extended Support Release of Firefox [Learn more about this on mozilla.org](https://www.mozilla.org/en-US/firefox/organizations/faq/)
1. support for Apple iPad

### Supported Browsers for Websites {#supported-browsers-for-websites}

Generally, browser support for websites rendered by AEM Sites depends on the implementation of AEM page templates, design and component output, and is therefore in control of the party implementing these parts.

### WebDAV Clients {#webdav-clients}

**Microsoft Windows 7+**

To successfully connect with Microsoft Windows 7+ to an AEM instance that is not secured with SSL, basic authentication over unsecured network must be enabled in Windows. This requires a change in the Windows Registry of the WebClient:

1. Locate the registry subkey:

    * HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient\Parameters

1. Add the BasicAuthLevel registry entry to this subkey using a value of 2 or more.

To improve responsiveness of the WebDav Client under Windows - see [Microsoft Support KB 2445570](https://support.microsoft.com/kb/2445570)

## Additional Platform Notes {#additional-platform-notes}

This section provides special notes and more detailed information about running Adobe Experience Manager and its add-ons.

### IPv4 and IPv6 {#ipv-and-ipv}

All elements of Adobe Experience Manager (Instance, Dispatcher) can be installed in both IPv4 and IPv6 networks.

Operation is seamless as no special configuration is required. You can simply specify an IP address using the format that is appropriate to your network type, if necessary.

This means that when an IP address needs to be specified you can select (as required) from:

* an IPv6 address
  for example `https://[ab12::34c5:6d7:8e90:1234]:4502`

* an IPv4 address
  for example `https://123.1.1.4:4502`

* a server name
  for example, `https://www.yourserver.com:4502`

* the default case of `localhost` will be interpreted for both IPv4 and IPv6 network installations
  for example, `https://localhost:4502`

### Requirements for AEM Dynamic Media Add-on {#requirements-for-aem-dynamic-media-add-on}

AEM Dynamic Media is disabled by default. See here to [enable Dynamic Media](/help/assets/config-dynamic.md#enabling-dynamic-media).

With Dynamic Media enabled, the following additional technical requirements apply.

>[!NOTE]
>
>These system requirements **only** apply if you use Dynamic Media - Hybrid mode; Dynamic Media - Hybrid mode has an embedded image server, which is only certified on certain operating systems.
>
>For Dynamic Media customers who run Dynamic Media - Scene7 mode (that is, **dynamicmedia_scene7** runmode), there are no additional system requirements; only the same system requirements as AEM. Dynamic Media - Scene7 mode architecture uses the cloud-based image service and not the service embedded in AEM.

#### Hardware {#hardware}

The following hardware requirements are applicable for both Linux and Windows:

* Intel Xeon or AMD Opteron CPU with at least 4 cores
* At least, 16 GB of RAM

#### Linux {#linux}

If you are using Dynamic Media on Linux, the following prerequisites need to be met:

* RedHat Enterprise 7 or CentOS 7 and later with latest fix patches
* 64-bit Operating System
* Swapping disabled (recommended)
* SELinux disabled (See note that follows)

>[!NOTE]
>
>If the locale is set such that LC_CTYPE is not equal to `en_US.UTF-8`, it prevents Dynamic Media from working. To see what its value is type "locale" at the command prompt. If it not set to that, then set the LC_CTYPE environment variable to the empty string by typing "export LC_CTYPE=" before running AEM.

>[!NOTE]
>
>**Disabling SELinux:** Image Serving does not work with SELinux turned on. This option is enabled by default. To remedy this issue, edit the **/etc/selinux/config** file and change the SELinux value from:
>
>`SELINUX=enforcing` **to** `SELINUX=disabled`

>[!NOTE]
>
>**NUMA Architecture:** Systems with processors featuring AMD64 and Intel EM64T are typically configured as non-uniform memory architecture (NUMA) platforms, which means that the kernel constructs multiple memory nodes at boot-time rather than constructing a single memory node.
>
>The multiple node construct can result in memory exhaustion on one or more of the nodes before other nodes become exhausted. When memory exhaustion happens the kernel can decide to kill processes (for example, the Image Server or Platform Server) even though there is available memory.
>
>Therefore, Adobe recommends that if you are running such a system that you turn off NUMA using the **numa=off** boot option to avoid the kernel killing these processes.

>[!NOTE]
>
>**Server host name must resolve:** Ensure that the host name of the server is resolvable to an IP address. If that is not possible, add the fully qualified host name and the IP address to **/etc/hosts**:
>
>`<ip address> <fully qualified hostname>`

#### Windows {#windows}

* Microsoft Windows Server 2016
* Swap space equal to at least twice the amount of physical memory (RAM)

To use Dynamic Media on Windows, install Microsoft Visual Studio 2010, 2013, and 2015 redistributables for x64 and x86.

For Windows x64:

* Get Microsoft Visual Studio 2010 redistributable at [https://www.microsoft.com/en-us/download/details.aspx?id=13523](https://www.microsoft.com/en-us/download/details.aspx?id=13523)
* Get Microsoft Visual Studio 2013 redistributable at [https://www.microsoft.com/en-us/download/details.aspx?id=40784](https://www.microsoft.com/en-us/download/details.aspx?id=40784)
* Get Microsoft Visual Studio 2015 redistributable at [https://www.microsoft.com/en-us/download/details.aspx?id=48145](https://www.microsoft.com/en-us/download/details.aspx?id=48145)

For Windows x86:

* Get Microsoft Visual Studio 2010 redistributable at [https://www.microsoft.com/en-in/download/details.aspx?id=5555](https://www.microsoft.com/en-in/download/details.aspx?id=5555)
* Get Microsoft Visual Studio 2013 redistributable at [https://www.microsoft.com/en-in/download/details.aspx?id=40769](https://www.microsoft.com/en-in/download/details.aspx?id=40769)
* Get Microsoft Visual Studio 2015 redistributable at [https://www.microsoft.com/en-us/download/details.aspx?id=52685](https://www.microsoft.com/en-us/download/details.aspx?id=52685)

#### MacOS {#macos}

* 10.9.x and later
* Only supported for trial and demo purposes

### Requirements for AEM Forms PDF Generator {#requirements-for-aem-forms-pdf-generator}

<table>
 <tbody>
  <tr>
   <th><p><strong>Product</strong></p> </th>
   <th><p><strong>Supported Formats for Conversion to PDF</strong></p> </th>
  </tr>
  <tr>
   <td><a href="https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html">Acrobat 2017 classic track</a> latest version</td>
   <td>XPS, image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, DWG, DXF, and DWF</td>
  </tr>
  <tr>
   <td>Microsoft® Office 2016</td>
   <td>DOC, DOCX, XLS, XLSX, PPT, PPTX, RTF, and TXT</td>
  </tr>
  <tr>
   <td>WordPerfect X7</td>
   <td>WP, WPD</td>
  </tr>
  <tr>
   <td>Microsoft® Office Visio 2016<br /> </td>
   <td>VSD, VSDX</td>
  </tr>
  <tr>
   <td>Microsoft® Publisher 2016<br /> </td>
   <td>PUB</td>
  </tr>
  <tr>
   <td>Microsoft® Project 2016<br /> </td>
   <td>MPP</td>
  </tr>
  <tr>
   <td>OpenOffice 4.1.2</td>
   <td>ODT, ODP, ODS, ODG, ODF, SXW, SXI, SXC, SXD, XLS, XLSX, DOC, DOCX, PPT, PPTX,image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, RTF, and TXT</td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>PDF Generator supports only English, French, German, and Japanese versions of the supported operating systems and applications.
>
>In addition:
>
>* PDF Generator requires 32-bit version of [Acrobat 2017 classic track version 17.011.30078 or later](https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html) to perform the conversion.
>* PDF Generator supports only the 32-bit Retail version of Microsoft Office Professional Plus and other software required for conversion.
>* PDF Generator does not support Microsoft Office 365.
>* PDF Generator conversions for OpenOffice are supported only on Windows and Linux.
>* The OCR PDF, Optimize PDF, and Export PDF features are supported only on Windows.
>* A version of Acrobat is bundled with AEM Forms to enable PDF Generator functionality. The bundled version should only be accessed programmatically only with AEM Forms, during the term of the AEM Forms license, for use with AEM Forms PDF Generator. For more information, refer to AEM Forms product description as per your deployment ([On-Premise](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-on-premise.html) or [Managed Services](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-managed-services.html))”
>
>* PDF Generator service does not support Microsoft Windows 10.
>

### Requirements for AEM Forms Designer {#requirements-for-aem-forms-designer}

* Microsoft® Windows® 2016 Server, Microsoft® Windows® 2019 Server, or Microsoft® Windows® 10
* 1 GHz or faster processor with support for PAE, NX, and SSE2.
* 1 GB of RAM for 32-bit or 2 GB of RAM for 64-bit OS
* 16 GB disk space for 32-bit or 20 GB disk space for 64-bit OS
* Graphics memory - 128 MB of GPU (256 MB recommended)
* 2.35 GB of available hard-disk space
* 1024 X 768 pixels or greater monitor resolution
* Video hardware acceleration (optional)
* Acrobat Pro DC, Acrobat Standard DC, or Adobe Acrobat Reader DC.
* Administrative privileges to install Designer.

### Requirements for AEM Assets XMP metadata write-back {#requirements-for-aem-assets-xmp-metadata-write-back}

XMP write-back is supported and enabled for the following platforms and file formats:

* **Operating Systems:**

    * Linux (32-bit and 32-bit application support on 64-bit systems). For steps to install 32-bit client libraries, see [How to enable XMP extraction and write-back on 64-bit RedHat Linux](https://helpx.adobe.com/experience-manager/kb/enable-xmp-write-back-64-bit-redhat.html).

    * Windows Server
    * Mac OS X (64-bit)

* **File Formats**: JPEG, PNG, TIFF, PDF, INDD, AI, and EPS.

### Requirements for AEM Assets to process metadata-heavy assets on Linux {#assetsonlinux}

XMPFilesProcessor process requires library GLIBC_2.14 to work. Use a Linux kernel that contains GLIBC_2.14, for example Linux kernel version 3.1.x. It improves performance for processing assets that contain a large amount of metadata, like PSD files. Using a previous version of GLIBC leads to error in logs starting with `com.day.cq.dam.core.impl.handler.xmp.NCommXMPHandler Failed to read XMP`.
