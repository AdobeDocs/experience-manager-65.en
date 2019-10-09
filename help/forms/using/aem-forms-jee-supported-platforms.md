---
title: Supported Platforms for AEM Forms on JEE
seo-title: Supported Platforms for AEM Forms on JEE
description: List of infrastructure components required and supported for installing AEM Forms on JEE
seo-description: List of infrastructure components required and supported for installing AEM Forms on JEE
uuid: 22f05fd4-f9fc-423e-8a86-1e75df4b2b44
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: 1b9f8d98-e7e8-4b9b-a0df-52ccba324da3
---

# Supported Platforms for AEM Forms on JEE {#supported-platforms-for-aem-forms-on-jee}

## Supported Platforms {#supported-platforms}

### Support levels {#support-levels}

AEM Forms on JEE server can be set up using any combination of supported operating systems, application servers, databases, database drivers, JDK, LDAP servers, and email servers.

This document lists the supported client and server platforms for AEM Forms on JEE. Adobe provides several levels of support, both for our recommended configurations and for other configurations. The document also lists other supported software and their version, exceptions, patch definitions, and third-party software patch support policy.

>[!NOTE]
>
>* For a complete list of exceptions to supported server platforms, see [Exceptions to supported server platforms](#exceptions-to-supported-server-platforms).
>* AEM Forms on JEE supports only English, French, German, and Japanese versions of the supported operating systems and applications.
>

### Recommended configurations {#recommendedconfigurations}

Adobe recommends these configurations and provides full or restricted support as part of the standard software maintenance agreement:

<table> 
 <tbody> 
  <tr> 
   <th>Support Level</th> 
   <th>Description</th> 
  </tr> 
  <tr> 
   <td>A: Supported<br /> </td> 
   <td>Adobe provides full support and maintenance for this configuration. This configuration is covered by Adobe's quality assurance process.</td> 
  </tr> 
  <tr> 
   <td>R: Restricted Support</td> 
   <td>Adobe provides full support for this configuration after certain prerequisites are met. Contact Adobe enterprise support to learn about the prerequisites and raise a request for the support.</td> 
  </tr> 
  <tr> 
   <td>L: Limited supoort</td> 
   <td>Adobe provides full support and maintenance for this configurations after certain prerequisites are met. Not all capabilities are available on the configuration. Contact Adobe enterprise support to learn about the prerequisites and raise a request for the support.<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Unsupported configurations {#unsupported-configurations}

| Support Level |Description |
|---|---|
| E: Expected to work |The configuration is expected to work, and there are no reports to the contrary. |
| Z: Not supported |The configuration is not supported. Adobe does not make any statements about whether the configuration works, and does not support it. |

### Java Virtual Machines (JVM) {#java-virtual-machines-jvm}

Adobe Experience Manager Forms requires a Java Virtual Machine to run, which is provided by the Java Development Kit (JDK) distribution. Adobe Experience Manager operates with the following versions of the Java Virtual Machines:

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Platform</strong></p> </th> 
   <th><p><strong>Support Level</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td><p>Oracle Java™ SE 8 (64 bit)</p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>Minor releases and updates</p> </td> 
  </tr> 
  <tr> 
   <td>IBM® J9 Virtual Machine (build 2.8, JRE 1.8.0)</td> 
   <td>A: Supported</td> 
   <td>Minor releases and updates</td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>* AEM Forms on JEE supports only 64-bit JVMs on production environments.  
>* It is recommend to track the Security Bulletins from the Java vendor to ensure the safety and security of production environments and install the latest Java Updates.
>

### Databases and CRX Persistence {#databases-and-crx-persistence}

#### AEM persistence support {#aem-persistence-support}

<table> 
 <tbody> 
  <tr> 
   <td><p><strong>Platform</strong></p> </td> 
   <td><p><strong> Description</strong></p> </td> 
   <td><p><strong>Support Level</strong></p> </td> 
  </tr> 
  <tr> 
   <td><p>File System</p> </td> 
   <td><p>Repository Microkernel (TAR MK files)</p> </td> 
   <td><p>Supported</p> </td> 
  </tr> 
  <tr> 
   <td><p>MongoDB Enterprise 3.4</p> </td> 
   <td><p>Repository Microkernel</p> </td> 
   <td><p>Supported</p> </td> 
  </tr> 
  <tr> 
   <td>IBM DB2 11.1</td> 
   <td>Repository Microkernel</td> 
   <td>Supported</td> 
  </tr> 
  <tr> 
   <td><p>Oracle Database 12c Release 1</p> </td> 
   <td><p>Repository Microkernel</p> </td> 
   <td><p>Supported</p> </td> 
  </tr> 
  <tr> 
   <td><p>Microsoft SQL Server 2016</p> </td> 
   <td><p>Repository Microkernel</p> </td> 
   <td><p>Supported</p> </td> 
  </tr> 
 </tbody> 
</table>

* MongoDB is third-party software and is not included in the AEM licensing package. For more information see the [MongoDB licensing policy](https://www.mongodb.org/about/licensing/) page.  

* In order to get the most of your AEM deployment, Adobe recommends licensing the MongoDB Enterprise version in order to benefit from professional support.
* Adobe Customer Care will assist qualifying issues related to the usage of MongoDB with AEM. For more information, see the [MongoDB for Adobe Experience Manager page](https://www.mongodb.com/lp/contact/mongodb-adobe-experience-manager).
* 'File System' includes block storage that is POSIX compliant. This includes network storage technology. Mind that file system performance might vary and influences the overall performance. It is recommended to load test AEM in combination with the network/remote file system.
* Only MongoDB Storage Engine WiredTiger is supported.
* MongoDB Sharding is not supported in AEM.
* AEM Forms on JEE does not support MySQL for RDBMK persistence.
* The Document Security module does not use Content Repository. It implies, if you are using only Document Security and do not plan to use HTML Workspace, HTML5 forms, or adaptive forms, then do not install Content Repository.
* AEM Forms on JEE supports Oracle Multitenant architecture.

#### DATABASE support {#database-support}

<table> 
 <tbody> 
  <tr> 
   <td><p><strong>Platform</strong></p> </td> 
   <td><p><strong> Description</strong></p> </td> 
   <td><p><strong>Support Level AEM 6.4</strong></p> </td> 
   <td><p><strong>Support Level AEM Forms 6.4 on JEE</strong></p> </td> 
  </tr> 
  <tr> 
   <td>IBM DB2 11.1</td> 
   <td>Repository Microkernel</td> 
   <td>Supported</td> 
   <td>Supported</td> 
  </tr> 
  <tr> 
   <td><p>Oracle Database 12c Release 1</p> </td> 
   <td><p>Repository Microkernel</p> </td> 
   <td><p>Supported</p> </td> 
   <td><p>Supported</p> </td> 
  </tr> 
  <tr> 
   <td><p>MySQL 5.7.19<br /> </p> </td> 
   <td><p>Repository Microkernel</p> </td> 
   <td><p>Expected to work</p> </td> 
   <td><p>Supported</p> </td> 
  </tr> 
  <tr> 
   <td><p>Microsoft SQL Server 2016</p> </td> 
   <td><p>Repository Microkernel</p> </td> 
   <td><p>Expected to work</p> </td> 
   <td><p>Supported</p> </td> 
  </tr> 
 </tbody> 
</table>

### Database drivers {#database-drivers}

<table> 
 <tbody> 
  <tr> 
   <th>Database </th> 
   <th><p><strong>Platform</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td>MySQL</td> 
   <td><p>MySQL Connector/J 5.7</p> <p>mysql-connector-java-5.1.30-bin.jar(version 5.1.30)</p> </td> 
   <td><p>Supplied with AEM Forms on JEE installation</p> </td> 
  </tr> 
  <tr> 
   <td>Microsoft SQL Server<br /> </td> 
   <td><p>Microsoft® SQL Server JDBC driver 6.2.1.0<br /> </p> <p>sqljdbc6.jar</p> </td> 
   <td><p>Supplied with AEM Forms on JEE installation.</p> </td> 
  </tr> 
  <tr> 
   <td>Oracle</td> 
   <td><p>Oracle Database 12.1.0.2.0 JDBC driver</p> <p>ojdbc7.jar (version 12.1.0.2.0)<br /> </p> </td> 
   <td><p>Supplied with AEM Forms on JEE installation.</p> </td> 
  </tr> 
  <tr> 
   <td>IBM DB2</td> 
   <td><p>IBM® DB2 Universal JDBC driver 4.16.53 (db2jcc4.jar)</p> </td> 
   <td><p>Download the driver from <a href="https://www-01.ibm.com/support/docview.wss?uid=swg21363866" target="_blank">IBM Website</a></p> </td> 
  </tr> 
 </tbody> 
</table>

### Application servers {#application-servers}

<table> 
 <tbody> 
  <tr> 
   <td><p><strong> Platform</strong></p> </td> 
   <td><p><strong>Support Level</strong></p> </td> 
   <td><p><strong>Supported Patch Definitions</strong></p> </td> 
  </tr> 
  <tr> 
   <td><p>Oracle WebLogic Server 12.2.1 (12c R2) <sup>[1] [2] [4] [8]</sup></p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>Service pack and critical updates</p> </td> 
  </tr> 
  <tr> 
   <td>IBM® WebSphere® Application Server 9.0 <sup>[2] [6]</sup><br /> </td> 
   <td>A: Supported</td> 
   <td>Service pack and critical updates</td> 
  </tr> 
  <tr> 
   <td><p>JBoss® Enterprise Application Platform (EAP) 7.0.6 <sup>[1] [4] [5] [7] [8][11]</sup></p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>Patches and cumulative patches for the supported EAP version<br /> </p> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>IBM® WebSphere® clusters are only supported in Network Deployment editions.

### Server operating systems {#server-operating-systems}

#### Production environments {#production-environments}

<table> 
 <tbody> 
  <tr> 
   <th><p><strong> Platform</strong></p> </th> 
   <th><p><strong>Support level</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td>Microsoft Windows Server 2016</td> 
   <td>A: Supported</td> 
   <td>Service packs and critical updates</td> 
  </tr> 
  <tr> 
   <td><p>Microsoft Windows Server 2012 R2 V6.3</p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>Service packs and critical updates</p> </td> 
  </tr> 
  <tr> 
   <td><p>Oracle Solaris™ 11 - V5.11<sup> [3] [10]</sup></p> </td> 
   <td><p>L: Limited</p> </td> 
   <td><p>Updates and patches</p> </td> 
  </tr> 
  <tr> 
   <td><p>Red Hat Enterprise Linux 7 (Kernel 3.x)</p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>Minor releases, cumulative updates, and critical updates</p> </td> 
  </tr> 
  <tr> 
   <td><p>SUSE® Linux® Enterprise Server 12</p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>Service packs, cumulative patches, and critical security updates</p> </td> 
  </tr> 
  <tr> 
   <td>Oracle Linux® 7 Update 3</td> 
   <td>A: Supported</td> 
   <td>Service packs, cumulative patches, and critical security updates</td> 
  </tr> 
  <tr> 
   <td>CentOS 7<sup> [9]</sup></td> 
   <td>A: Supported</td> 
   <td>Service packs, cumulative patches, and critical security updates</td> 
  </tr> 
  <tr> 
   <td>IBM AIX 7.2 [10]</td> 
   <td>A: Limited Support</td> 
   <td>Service packs, cumulative patches, and critical security updates</td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>AEM Forms on JEE supports only 64-bit operating systems.

#### Virtualized environment {#virtualized-environment}

You can run AEM Forms on JEE on a physical machine or a virtual environment. However, if you encounter any issue with AEM Forms on a virtual environment, try replicating the issue on a physical machine. If the issue persists on the physical machine, contact Adobe Support for a resolution. For issues that do not replicate on the physical machine, contact your virtual environment vendor.

#### Development environments {#development-environments}

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Platform (Base Version)</strong></p> </th> 
   <th>Support Level</th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td><p>Microsoft® Windows® 10</p> </td> 
   <td>E: Expected to work</td> 
   <td><p>Service pack and critical updates</p> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>* AEM Forms on JEE supports only 64-bit operating systems.
>* PDF Generator service is not supported on Windows 10.
>

### Exceptions to supported server platforms {#exceptions-to-supported-server-platforms}

Consider the following exceptions while choosing a platform to set up your AEM Forms on JEE server.

1. AEM Forms on JEE doesn’t support Oracle WebLogic and JBoss® on IBM® AIX®.  
1. AEM Forms on JEE doesn’t support Oracle WebLogic and IBM® WebSphere® with MySQL.
1. AEM Forms on JEE doesn’t support Oracle Solaris™ with Intel® architecture (only SPARC® is supported).
1. AEM Forms on JEE doesn’t support Oracle WebLogic and JBoss on SUSE Linux Enterprise Server 12. Only IBM WebSphere is supported on SUSE Linux Enterprise Server 12.
1. AEM Forms on JEE doesn’t support any JDK with JBoss® other than Oracle Java™ SE.
1. AEM Forms on JEE doesn’t support any JDK with IBM® WebSphere® other than IBM® JDK.
1. AEM Forms on JEE doesn’t support IBM® DB2 with JBoss®.
1. CRX-repository supports persistence of type TarMK, MongoDB, and relational databases (RDBMK). You cannot have two different database systems between the application server and the CRX-repository. However, on an AEM Forms on JEE environment, you can use MongoMK with CRX-repository and a supported relational database with application server.
1. AEM Forms on JEE does not support WebSphere application server on CentOS.
1. AIX and Solaris operating systems are available only for upgrade customers.
1. AEM Forms on JEE doesn’t support JBoss role based access control (RBAC).

In addition, consider the following points while choosing software for Adobe AEM Forms on JEE deployments:

* AEM Forms on JEE supports updates, patches, and fix packs on top of the specified major and minor version of supported software. However, update to the next major or minor version is not supported unless specified.
* Cluster-based installations do not support TarMK persistence. For information about supported persistence, see [Choosing a persistence type for an AEM Forms installation](/help/forms/using/choosing-persistence-type-for-aem-forms.md).
* AEM Forms on JEE supports various third-party software as per our [Third-party software support Policy](#third-party-patch-support-policy).
* AEM Forms on JEE supports platforms as per the support provided by third-party vendors. Some combinations may not be allowed by third-party vendors. For example, many vendors have not certified their application servers with IBM® DB2. As a result, AEM Forms on JEE also doesn’t support these combinations. To ensure that you choose the supported software versions, check the support matrix for the third-party vendors as well.  
* AEM Forms on JEE does not support TarMK Cold Standby.
* AEM Forms on JEE does not support vertical clustering.
* AEM Forms on JEE doesn’t support MySQL database on a clustered environment.
* RDBMK does not work with DB2, MYSQL, MS SQL, and Oracle databases when the Package JDBC modules are configured on Weblogic.

### LDAP servers (optional) {#ldap-servers-optional}

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Product (Base Version)</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td>Oracle Unified Directory (OUD) 11g Release 2</td> 
   <td>Service packs</td> 
  </tr> 
  <tr> 
   <td>Microsoft Active Directory 2016</td> 
   <td>Maintenance release and fix packs</td> 
  </tr> 
  <tr> 
   <td><p>Microsoft® Active Directory 2012</p> </td> 
   <td><p>Updates provided with operating system</p> </td> 
  </tr> 
  <tr> 
   <td><p>Microsoft Active Directory Lightweight Directory Services 2012</p> </td> 
   <td><p>Updates provided with operating system</p> </td> 
  </tr> 
  <tr> 
   <td><p>IBM® Tivoli Directory Server 6.4</p> </td> 
   <td><p>Feature packs and interim fixes</p> </td> 
  </tr> 
  <tr> 
   <td>IBM Lotus Domino 8.5.0</td> 
   <td>Maintenance release and fix packs</td> 
  </tr> 
  <tr> 
   <td>Novell eDirectory 8.8.7</td> 
   <td>Product updates</td> 
  </tr> 
 </tbody> 
</table>

### Email servers (optional) {#email-servers-optional}

* IBM Lotus Domino 9.0
* Microsoft Exchange 2013
* Microsoft Office 365

### Content managers and corresponding connectors {#content-managers-and-corresponding-connectors}

<table> 
 <tbody> 
  <tr> 
   <td><strong>Product<br /> </strong></td> 
   <td><strong>Version</strong></td> 
  </tr> 
  <tr> 
   <td>IBM Content Manager Server</td> 
   <td>8.5 Fix pack 2<br /> </td> 
  </tr> 
  <tr> 
   <td>IBM Content Manager Client</td> 
   <td><p>Version 8.5<strong> </strong>is supported</p> </td> 
  </tr> 
  <tr> 
   <td>EMC Documentum</td> 
   <td>7.0 and 7.3</td> 
  </tr> 
  <tr> 
   <td>IBM Filenet</td> 
   <td>5.2</td> 
  </tr> 
  <tr> 
   <td>Microsoft Sharepoint</td> 
   <td>2013 and 2016<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Support for Cordova {#support-for-cordova}

AEM Forms App now supports the Apache Cordova. Following are the platform-specific versions of Cordova that are supported:

* Apache Cordova 6.4.0  
* Cordova iOS 4.3.0
* Cordova Android 6.0.0
* Cordova Windows 4.4.3

### Software support for PDF Generator {#software-support-for-pdf-generator}

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Product</strong></p> </th> 
   <th><p><strong>Supported Formats for Conversion to PDF</strong></p> </th> 
  </tr> 
  <tr> 
   <td><a href="https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html">Acrobat 2017 classic track</a></td> 
   <td>XPS, image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, DWG, DXF, and DWF</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Office 2016</td> 
   <td>DOC, DOCX, XLS, XLSX, PPT, PPTX, RTF, and TXT</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Office 2013</td> 
   <td>DOC, DOCX, XLS, XLSX, PPT, PPTX, RTF, and TXT</td> 
  </tr> 
  <tr> 
   <td>WordPerfect X7</td> 
   <td>WP, WPD</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Office Visio 2013</td> 
   <td>VSD, VSDX</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Office Visio 2016</td> 
   <td>VSD, VSDX</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Publisher 2013</td> 
   <td>PUB</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Publisher 2016</td> 
   <td>PUB</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Project 2013</td> 
   <td>MPP</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Project 2016</td> 
   <td>MPP</td> 
  </tr> 
  <tr> 
   <td>OpenOffice 4.1.2</td> 
   <td>ODT, ODP, ODS, ODG, ODF, SXW, SXI, SXC, SXD, XLS, XLSX, DOC, DOCX, PPT, PPTX,image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, RTF, and TXT</td> 
  </tr> 
  <tr> 
   <td>OpenOffice 3.4</td> 
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
>* PDF Generator conversions for OpenOffice are supported only on Windows, Linux, and Solaris.
>* The HTML2PDF service is deprecated on AIX.
>* The OCR PDF, Optimize PDF, and Export PDF features are supported only on Windows. 
>* A version of Acrobat is bundled with AEM Forms to enable PDF Generator functionality. The bundled version should only be accessed programmatically only with AEM Forms, during the term of the AEM Forms license, for use with AEM Forms PDF Generator. For more information, refer to AEM Forms product description as per your deployment ([On-Premise](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-on-premise.html) or [Managed Services](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-managed-services.html))”
>

### Exceptions to accessibility support {#exceptions-to-accessibility-support}

The following subsystems of AEM Forms are not [508](https://www.section508.gov/) compliant:

* Adaptive Forms Authoring UI
* Forms Manager Authoring UI
* Correspondence Management Authoring UI  
* Admin UI (Administration Console UI)

## System Requirements for AEM Forms on JEE {#system-requirements-for-aem-forms-on-jee}

### Minimum hardware requirements {#minimum-hardware-requirements}

<table> 
 <tbody> 
  <tr> 
   <td>Platform</td> 
   <td>Minimum hardware requirement</td> 
  </tr> 
  <tr> 
   <td>Microsoft Windows Server</td> 
   <td>Intel® Xeon® E5-2680, 2.4 GHz processor or equivalent<br /> VMWare ESX 5.1 or later<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 15GB of temporary space plus 22GB<br /> for AEM Forms on JEE</td> 
  </tr> 
  <tr> 
   <td>Sun Solaris</td> 
   <td>UltraSPARC® IIIi, 1.5 GHz processor<br /> Solaris Containers (Zones) partitioning<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 6 GB of temporary space plus 22GB<br /> for AEM Forms on JEE</td> 
  </tr> 
  <tr> 
   <td>IBM AIX</td> 
   <td>P6 pSeries 520 (Model 52A) 9131-52A, 1.8 GHz processor<br /> LPAR partitioning<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 6 GB of temporary space plus 22GB<br /> for AEM Forms on JEE</td> 
  </tr> 
  <tr> 
   <td>SUSE Linux Enterprise Server</td> 
   <td>Intel Xeon E5-2670v2, 1 vCPU, 2.5 GHz processor<br /> AWS m3.medium (3 ECUs)<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 6 GB of temporary space plus 22GB<br /> for AEM Forms on JEE</td> 
  </tr> 
  <tr> 
   <td>Red Hat Enterprise Linux</td> 
   <td>Intel Xeon E5-2670v2, 1 vCPU, 2.5 GHz processor<br /> AWS m3.medium (3 ECUs)<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 6 GB of temporary space plus 22GB<br /> for AEM Forms on JEE<br /> </td> 
  </tr> 
  <tr> 
   <td>Hardware requirements for a small production environment</td> 
   <td> 
    <ul> 
     <li><strong>Intel powered environment</strong>: Intel® Xeon® E5-2680, 2.4 GHz or greater. Using a dual core processor will further enhance performance</li> 
     <li><strong>Sun SPARC powered environment:</strong> UltraSPARC V or later</li> 
     <li><strong>IBM AIX powered environment:</strong> Power6 or later<br /> </li> 
     <li><strong>Memory: </strong>4 GB <br /> </li> 
    </ul> </td> 
  </tr> 
 </tbody> 
</table>

For additional reuirements see:

* [System requirements for a single-server AEM Forms on JEE deployment](https://www.adobe.com/go/learn_aemforms_sysreq_single_64)
* [System requirements for a clustered AEM Forms on JEE deployment](https://www.adobe.com/go/learn_aemforms_sysreq_cluster_64)

## Supported Clients for AEM Forms on JEE {#supported-clients-for-aem-forms-on-jee}

### Workbench {#workbench}

>[!NOTE]
>
>Both 32-bit and 64-bit operating systems are supported.

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Platform</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td><p>Microsoft® Windows® 10</p> <p>(Enterprise, Pro, Basic)</p> </td> 
   <td>Service packs and critical updates</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Windows® 2012 Server R2</td> 
   <td>Service packs and critical updates</td> 
  </tr> 
  <tr> 
   <td>Microsoft® Windows® 2016 Server</td> 
   <td>Service packs and critical updates</td> 
  </tr> 
 </tbody> 
</table>

* Disk space for installation: 1.7 GB for Workbench only, 2.7 GB on a single drive for a full installation of Workbench, Designer, and the samples assembly 400 MB for temporary install directories - 200 MB in the user temp directory and 200 MB in the Windows temporary directory

>[!NOTE]
>
>If all of these locations reside on a single drive, there must be 1.5 GB of space availableduring installation. The files copied to the temporary directories are deleted when installation is complete.

* Memory for running Workbench: 2 GB of RAM
* Hardware requirement: Intel® Pentium® 4 or AMD equivalent, 1 GHz processor
* Minimum 1024 X 768 pixels or greater monitor resolution with 16-bit color or higher
* TCP/IPv4 or TCP/IPv6 network connection to the AEM Forms on JEE server

>[!NOTE]
>
>You must have Administrative privileges to install Workbench on Windows. If you are installing using a non-administrator account, the installer will prompt you for the credentials for an appropriate account.

### Designer {#designer}

**Note:** To install Designer on Windows, run the installer with Administrative privileges.

* Microsoft® Windows® 2012 Server R2, Microsoft® Windows® 2016 Server, Microsoft Windows 10

  * 1 GHz or faster processor with support for PAE, NX, and SSE2.
  * 1 GB of RAM for 32-bit or 2 GB of RAM for 64-bit OS 
  * 16 GB disk space for 32-bit or 20 GB disk space for 64-bit OS

* Graphics memory - 128 MB of GPU (256 MB recommended)
* 2.35 GB of available hard-disk space
* DVD-ROM drive
* Internet Explorer 10 or 11; Firefox 45.x
* 1024 X 768 pixels or greater monitor resolution
* Video hardware acceleration (optional)
* Acrobat Pro DC, Acrobat Standard DC, or Adobe Acrobat Reader DC.

### Adobe Acrobat and Adobe Reader {#adobe-acrobat-and-adobe-reader}

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Acrobat and Adobe Reader (Base)</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td>Acrobat 2017 (Classic track)</td> 
   <td>Version 17.011.30078 or later<br /> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>The Acrobat DC product family introduces two tracks for both Acrobat and Reader which are essentially different products: “Classic” and “Continuous.” For details and a comparison of the two tracks, see [https://www.adobe.com/go/acrobatdctracks.](https://www.adobe.com/go/acrobatdctracks)

### Browsers {#browsers}

#### Desktops {#desktops}

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Browser (Base)</strong></p> </th> 
   <th><p><strong>Support level</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td><p>Microsoft Edge</p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>Service packs and updates</p> </td> 
  </tr> 
  <tr> 
   <td><p>Mozilla Firefox 45.x</p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>All updates</p> </td> 
  </tr> 
  <tr> 
   <td><p>Google Chrome 46+</p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>All updates</p> </td> 
  </tr> 
  <tr> 
   <td>Apple Safari 11.x</td> 
   <td>A: Supported</td> 
   <td>All updates</td> 
  </tr> 
  <tr> 
   <td><p>Google Chrome and Firefox on MAC OS X</p> </td> 
   <td><p>A: Supported</p> </td> 
   <td><p>All updates</p> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>Some browser-related exceptions for desktops are as follows:
>
>* Most modern browsers no longer support NPAPI-based plug-ins. For information about how it impacts AEM Forms applications and workflows, see [Discontinuation of NPAPI browser plugins and its impact](https://helpx.adobe.com/aem-forms/kb/discontinuation-of-npapi-plugins-impact-on-aem-forms.html).
>* Safari is supported only on Macintosh OS X.

#### Mobile clients {#mobile-clients}

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Browser (Base)</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td><p>Chrome on Android™ 4.1.2 and above</p> </td> 
   <td><p>All updates</p> </td> 
  </tr> 
  <tr> 
   <td>Safari on iOS 11.0 and above</td> 
   <td>All updates</td> 
  </tr> 
  <tr> 
   <td>Internet Explorer on Windows 10</td> 
   <td>All updates</td> 
  </tr> 
  <tr> 
   <td>Microsoft Edge<br /> </td> 
   <td>All updates<br /> </td> 
  </tr> 
  <tr> 
   <td>Native Andriod browser on Android™ 4.4 and above</td> 
   <td>All updates</td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>* Forms Portal is supported on Safari on iPad only.  
>

### AEM Forms app {#aem-forms-workspace-app}

#### Mobile device support {#mobile-device-support}

AEM Forms app is available on the following platforms:

| **Platform** |**Supported Devices** |
|---|---|
| Apple iOS |Apple iPhone, iPad, iPad Air, and iPad mini running iOS 11 and above. |
| Google Android |Android 4.4 (Andoird Kit Kat) and above *[API Level 19 and above]*. AEM Forms app is certified on 7- and 10-inch Samsung Galaxy tablets and 7-inch Google Nexus tablet and popular smartphones. |
| Microsoft Windows |Microsoft Surface devices, tablets, laptops, and desktops running Microsoft Windows 10 operating system. |

### Adobe Flash Player {#adobe-flash-player}

<table> 
 <tbody> 
  <tr> 
   <th><p><strong>Flash Player (Base)</strong></p> </th> 
   <th><p><strong>Supported Patch Definitions</strong></p> </th> 
  </tr> 
  <tr> 
   <td><p>Flash Player latest version</p> </td> 
   <td><p>Minor versions and updates</p> </td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>Adobe will [stop updating and distributing the Flash Player at the end of 2020](https://theblog.adobe.com/adobe-flash-update/).

### Adobe Document Security Extension for Microsoft Office {#adobe-rights-management-extension-for-microsoft-office}

Click [here](https://www.adobe.com/products/livecycle/rightsmanagement/extension/downloads.html) to see the system requirements for Adobe Document Security Extension for Microsoft® Office.

### Exceptions to client support {#exceptions-to-client-support}

Microsoft® Windows® 2012 is not supported for all specified client-side software except Reader and Acrobat.

Also, AEM Forms on JEE supports updates, patches, and fix packs on top of the specified major and minor version of supported software. However, update to the next major or minor version is not supported unless specified.

## Third-party patch support policy {#third-party-patch-support-policy}

The third-party software requirements for AEM Forms on JEE are documented in the “System Requirements” section of their respective product documents. All documentation can be accessed from [https://adobe.com/go/learn_aemforms_documentation_64](https://adobe.com/go/learn_aemforms_documentation_64) .

AEM Forms on JEE’s third-party reference platforms state the specific patch level of third-party infrastructure that was current during the development and release of AEM Forms on JEE, and from the minimum patch/service pack level of the infrastructure supported by that version of AEM Forms on JEE.

Adobe supports urgent or recommended patches issued by third-party vendors upon their release assuming that third-party vendors guarantee backward compatibility with the versions that AEM Forms on JEE supports. Adobe will only support patches released after the minimum patch level stated in the AEM Forms on JEE documentation.

In some cases, Adobe does not support third-party updates that change major functionality, and thus do not support full backward compatibility. For details on the supported updates, see [Supported patch definitions](https://helpx.adobe.com/aem-forms/aem-forms-third-party-software-patch.html) for specific vendor products and the patch types Adobe supports.

Under circumstances beyond Adobe’s control, third-party patches that claim backward compatibility may have negative impact on the Adobe products or customer environments. In such cases, Adobe recommends that customers assess the impact of any urgent patch from a third party before applying them to critical systems. Adobe will work with third parties using reasonable business efforts to resolve such issues, either through normal Adobe support programs or by third parties rectifying the issue in their patch. This does not guarantee that a newly released third-party patch that will be supported by Adobe will work as documented by the vendor or with AEM Forms on JEE.

Adobe reserves the right to change the third-party reference platforms supported by a AEM Forms on JEE release and their supported patch definitions at any given point.

Additional information for third-party patches can also be found by searching the Adobe Enterprise Support site for knowledgebase articles related to your product.

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)
