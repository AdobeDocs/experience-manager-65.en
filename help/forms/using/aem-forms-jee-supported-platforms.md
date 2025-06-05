---
title: Supported Platforms for AEM Forms on JEE
description: List of infrastructure components required and supported for installing AEM Forms on JEE
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
geptopics: SG_AEMFORMS/categories/jee
docset: aem65
role: Admin
exl-id: 74d22cf4-56b2-48f5-92d9-928eaa134866
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,AEM Forms on JEE,Platform Matrix
---


# Supported Platforms for AEM Forms on JEE {#supported-platforms-for-aem-forms-on-jee}


## Supported Platforms {#supported-platforms}


<div class="preview">


Adobe has released a [full installer](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) with AEM 6.5.23.0 Forms Service Pack 23 (6.5.23.0) on JEE along with the patch installers. The full installer supports new platforms while the patch installer includes only bug fixes.

If you are performing a fresh installation or planning to use latest software for your AEM 6.5.23.0 Forms on JEE environment, Adobe recommends using [AEM 6.5.23.0 Forms on JEE full installer](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html) released on 06 June 2025 instead of AEM 6.5.18 Forms installer released on 31 August 2023 or AEM 6.5.12 Forms Installer released on 08 April 2019.


</div>


### Support levels {#support-levels}


AEM Forms on JEE server can be set up using any combination of supported operating systems, application servers, databases, database drivers, JDK, LDAP servers, and email servers.


This document lists the supported client and server platforms for AEM Forms on JEE. Adobe provides several levels of support, both for Adobe recommended configurations and for other configurations. The document also lists other supported software and their version, exceptions, patch definitions, and third-party software patch support policy.


>[!NOTE]
>
>- For a complete list of exceptions to supported server platforms, see [Exceptions to supported server platforms](../../forms/using/aem-forms-jee-supported-platforms.md#p-exceptions-to-supported-server-platforms-p).
>- AEM Forms on JEE support only English, French, German, and Japanese versions of the supported operating systems and applications.


### Upgrade and Support policy
#### Full Installer


- **Upgrade Support for full installers**: A full installer is released with every sixth AEM Service Pack Release. For example, there was a full installer released with 6.5.12.0 and 6.5.18.0 SP releases. AEM Forms allows direct upgrades exclusively from the last two full installers. For example, AEM Forms facilitates direct upgrades to version 6.5.23.0 only from the last two full installers, namely 6.5.18.0 and 6.5.12.0. If you need to upgrade from an earlier upgrade, you can use a multi-hop upgrade to first go to a supported full installer release and then to the latest release.


- **Deprecation and Removal**: The platform support is updated with each full installer release. Any software marked as deprecated in the platform matrix during a full installer release is entitled to be removed from the supported platform matrix in a subsequent full installer release, indicating the end of support for the software.

#### Service Packs


- **Service Pack Coverage**: Adobe provides technical support for AEM Forms environments using any of the latest six service packs. If your current version predates the last six service packs, Adobe strongly recommends upgrading to the latest version for optimal performance, security, and continuous support.

- **Patch Installer Guidelines**: While using the patch installers to update, it's crucial to verify that the underlying full installer version is not more than two releases old. For instance, during the installation of service pack 6.5.23.0, ensure the underlying full installer version is either 6.5.18.0 or 6.5.12.0.

- **Patch Upgrade Support**: You can keep upgrading to the latest service pack, until you are upgrading to the most recent supported platforms also. For example, upgrading from service pack 6.5.18.0 to 6.5.23.0 is possible, provided that you transition to a platform combination supported for 6.5.23.0.


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
  <td>L: Limited support</td>
  <td>Adobe provides full support and maintenance for this configuration after certain prerequisites are met. Not all capabilities are available on the configuration. Contact Adobe enterprise support to learn about the prerequisites and raise a request for the support.<br /> </td>
 </tr>
</tbody>
</table>


### Unsupported configurations {#unsupported-configurations}


| Support Level       | Description                                                                                                                            |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| E: Expected to work | The configuration is expected to work, and there are no reports to the contrary.                                                       |
| Z: Not supported    | The configuration is not supported. Adobe does not make any statements about whether the configuration works, and does not support it. |


>[!NOTE]
>
>To help AEM Forms customers reduce the cost of ownership, simplify the deployment architecture, and modernize the development stack, Adobe Experience Manager enterprise platform is moving away from application server-based deployments in favor of standalone OSGi-based deployments. Adobe continues to support the AEM Forms JEE stack with a reduced matrix of infrastructure components.
>
>With the release of 6.5, infrastructure components that have the lowest usage among Adobe customers are no longer supported, as follows:
>
>- IBM&reg; DB2&reg; database
>- IBM&reg; AIX&reg; and Sun Solaris&trade; operating systems
>
>For new installations, where feasible it is recommended to deploy AEM Forms on the modern OSGi stack to use the latest innovations around responsive Adaptive Forms for mobile, multi-channel Interactive Communications, and backend data integrations using Form Data Model.
>
>Adobe recognizes that existing users must continue to deploy AEM Forms on JEE stack. In such scenarios, Adobe requires the deployment of AEM Forms JEE on supported infrastructure as described in this documentation. If you are upgrading to AEM 6.5 Forms and using a non-supported platform on the previous AEM Forms release, you can contact Adobe Support for help on upgrading to a supported platform.


### Java&trade; Virtual Machines (JVM) {#java-virtual-machines-jvm}


Adobe Experience Manager Forms requires a Java&trade; Virtual Machine to run, which is provided by the Java&trade; Development Kit (JDK) distribution. Adobe Experience Manager operates with the following versions of the Java&trade; Virtual Machines:


<table>
<tbody>
 <tr>
  <th><p><strong>Platform</strong></p> </th>
  <th><p><strong>Support Level</strong></p> </th>
  <th><p><strong>Supported Patch Definitions</strong></p> </th>
 </tr>
 <tr>
  <td><p>Oracle Java&trade; SE 11 (64 bit) <sup> [8] </sup> </p>  </td>
  <td><p>A: Supported</p> </td>
  <td><p>Minor releases and updates </p> </td>
 </tr>
 <tr>
  <td>Azul Zulu OpenJDK 11 - 64 bit</td>
  <td>Z: Not supported</td>
  <td><p> </p> </td>
 </tr>
 <tr>
  <td>Azul Zulu OpenJDK 8 - 64 bit</td>
  <td>Z: Not supported</td>
  <td><p> </p> </td>
 </tr>
 <tr>
  <td>Oracle Java&trade; SE 8 (64 bit)</td>
  <td>A: Supported</td>
  <td>Minor releases and updates</td>
 </tr>
 <tr>
  <td>IBM&reg; J9 Virtual Machine (build 2.9, JRE 1.8.0) IBM&reg; JDK SR6-FP26<br /> </td>
  <td>A: Supported</td>
  <td>Minor releases and updates</td>
 </tr>
 <tr>
  <td>IBM&reg; JAVA1.8.0_291(build 8.0.6.30)<br /> </td>
  <td>A: Supported</td>
  <td>Minor releases and updates</td>
 </tr>
</tbody>
</table>


>[!NOTE]
>
>- Track the Security Bulletins from the Java&trade; vendor to ensure the safety and security of production environments and install the latest Java&trade; Updates.
>- AEM Forms on JEE support only 64-bit JVMs on production environments.


### Databases and CRX Persistence {#databases-and-crx-persistence}


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
  <td><p> MongoDB Enterprise 6.0 (Deprecated) </p> </td>
  <td><p>Repository Microkernel</p> </td>
  <td><p>Supported</p> </td>
 </tr>
 <tr>
  <td><p> MongoDB Enterprise 7.0 </p> </td>
  <td><p>Repository Microkernel</p> </td>
  <td><p>Supported</p> </td>
 </tr>
  <tr>
  <td>Oracle Database 19c (Standard, Real Application Clusters (RAC) and Enterprise editions) </td>
  <td>Repository Microkernal </td>
  <td>Supported</td>
 </tr>
  <tr>
  <td>Oracle Database 19c (Standard, Real Application Clusters (RAC) and Enterprise editions) </td>
  <td>Repository Microkernal </td>
  <td>Supported</td>
 </tr>
 <tr>
  <td><p>Repository Microkernel</p> </td>
  <td><p>Supported</p> </td>
  <td></td>
 </tr>
 <tr>
  <td><p>Microsoft&reg; SQL Server 2019 (Deprecated) </p> </td>
  <td><p>Repository Microkernel</p> </td>
  <td><p>Supported</p> </td>
 </tr>
 <tr>
  <td><p>Microsoft&reg; SQL Server 2022 </p> </td>
  <td><p>Repository Microkernel</p> </td>
  <td><p>Supported</p> </td>
 </tr>
 <tr>
  <td>IBM&reg; DB2&reg; 11.1 (Deprecated)</td>
  <td>Repository Microkernel</td>
  <td>R: Restricted Support</td>
 </tr>
 <tr>
 <tr>
  <td>MySQL 8.0.27 (Deprecated) </td>
  <td>-</td>
  <td>R: Restricted Support</td>
 </tr>
 <tr>
 <tr>
  <td>MySQL 8.4</td>
  <td>-</td>
  <td>R: Restricted Support</td>
 </tr>
</tbody>
</table>


- IBM&reg; DB2&reg; is not supported for fresh installations. It is supported only for existing customers upgrading to AEM 6.5 Forms.
- MongoDB is third-party software and is not included in the AEM licensing package. For more information, see [MongoDB licensing policy](https://www.mongodb.org/about/licensing/).
- To get the most of your AEM deployment, Adobe recommends licensing the MongoDB Enterprise version to benefit from professional support.
- Adobe Customer Care assists qualifying issues related to the usage of MongoDB with AEM. For more information, see the [MongoDB for Adobe Experience Manager page](https://www.mongodb.com/lp/contact/mongodb-adobe-experience-manager).
- 'File System' includes block storage that is POSIX-compliant. This includes network storage technology. Mind that file system performance might vary and influences the overall performance. It is recommended to load test AEM with the network/remote file system.
- Only MongoDB Storage Engine WiredTiger is supported.
- MongoDB Sharding is not supported in AEM.
- AEM Forms on JEE do not support MySQL for RDBMK persistence.
- The Document Security module does not use Content Repository. It implies, if you are using only Document Security and do not plan to use HTML Workspace, HTML5 forms, or adaptive forms, then do not install Content Repository.
- AEM Forms on JEE do not support using MySQL for persisting AEM Repository (CRX-Repository).


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
  <td><p>MySQL Connector/J 5.7</p> <p>mysql-connector-java-5.1.44-bin.jar(version 5.1.44)</p> </td>
  <td><p>Supplied with AEM Forms on JEE installation</p> </td>
 </tr>
 <tr>
  <td>Microsoft&reg; SQL Server<br /> </td>
  <td><p>Microsoft&reg; SQL Server JDBC driver 8.2.2 <br /> </p> <p>sqljdbc8.jar (Deprecated) </p> </td>
  <td><p>Download from Microsoft&reg; Website.</p> </td>
 </tr>
 <tr>
  <td>Microsoft&reg; SQL Server<br /> </td>
  <td><p>Microsoft&reg; SQL Server JDBC driver 12.8 <br /> </p> <p>sqljdbc8.jar</p> </td>
  <td><p>Download from Microsoft&reg; Website.</p> </td>
 </tr>
 <tr>
  <td>Oracle</td>
  <td><p>Oracle Database 19.3.0.0.0 JDBC driver</p> <p>ojdbc8.jar (version 19.3.0.0.0)<br /> </p> </td>
  <td><p>Download from <a href="https://www.oracle.com/database/technologies/appdev/jdbc-ucp-19c-downloads.html">Oracle Website</a>.</p> </td>
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
  <td>Oracle WebLogic Server 12.2.1 (12c R2) (Deprecated) <sup>[9]</sup></td>
  <td>A: Supported</td>
  <td>Service pack and critical updates</td>
 </tr>
 <tr>
  <td>Oracle WebLogic Server 14c <sup>[9]</sup></td>
  <td>A: Supported</td>
  <td>Service pack and critical updates</td>
 </tr>
 <tr>
  <td>IBM&reg; WebSphere&reg; Application Server 9.0.0.10 <sup>[1] [4]</sup><br /> </td>
  <td>A: Supported</td>
  <td>Service pack and critical updates</td>
 </tr>
 <tr>
  <td><p>JBoss&reg; Enterprise Application Platform (EAP) 7.4 <sup>[2] [3] [7]</sup> </p> </td>
  <td><p>A: Supported</p> </td>
  <td><p>Patches and cumulative patches for the supported EAP version</p> </td>
 </tr>
</tbody>
</table>


>[!NOTE]
>
>IBM&reg; WebSphere&reg; clusters are only supported in Network Deployment editions.


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
  <td>Microsoft&reg; Windows Server 2019 (64-bit)(Deprecated)</td>
  <td>A: Supported</td>
  <td>Service packs and critical updates</td>
 </tr>
    <tr>
  <td>Microsoft&reg; Windows Server 2022 (64-bit)</td>
  <td>A: Supported</td>
  <td>Service packs and critical updates</td>
 </tr>
 <tr>
  <td>Ubuntu 20.04</td>
  <td>A: Supported</td>
  <td>Service packs and critical updates</td>
 </tr>
 <tr>
  <td><p>Red Hat&reg; Enterprise Linux&reg; 8 (Kernel 4.x) (64-bit) (Deprecated)</p> </td>
  <td><p>A: Supported</p> </td>
  <td><p>Minor releases, cumulative updates, and critical updates</p> </td>
 </tr>
 <tr>
  <td><p>Red Hat&reg; Enterprise Linux&reg; 7 (Kernel 3.x) (64-bit) (Deprecated)</td>
  <td><p>A: Supported</p> </td>
  <td><p>Minor releases, cumulative updates, and critical updates</p> </td>
 </tr>
 <tr>
  <td><p>Red Hat&reg; Enterprise Linux&reg; 9 (Kernel 4.x) (64-bit)</p> </td>
  <td><p>A: Supported</p> </td>
  <td><p>Minor releases, cumulative updates, and critical updates</p> </td>
 </tr>
 <tr>
  <td><p>SUSE&reg; Linux&reg; Enterprise Server 15 SP6 (64-bit) </p> </td>
  <td><p>A: Supported</p> </td>
  <td><p>Service packs, cumulative patches, and critical security updates</p> </td>
 </tr>
 <tr>
  <td>Oracle Linux&reg; 7 Update 3 (64-bit)</td>
  <td>A: Supported</td>
  <td>Service packs, cumulative patches, and critical security updates</td>
 </tr>
 <tr>
  <td>CentOS 7 (64-bit)<sup> [6]</sup></td>
  <td>A: Supported</td>
  <td>Service packs, cumulative patches, and critical security updates</td>
 </tr>
</tbody>
</table>


>[!NOTE]
>
> For Linux&reg; based server, the required runtime dependencies are:
> - glibc.x86_64 (2.17-196)
> - libX11.x86_64 (1.6.7-4)
> - zlib.x86-64 (1.2.7-17)
> - libxcb.x86_64 (1.13-1.el7)
> - libXau.x86_64 (1.0.8-2.1.el7)
> - glibc-locale.x86_64 ( 2.17 or greater)
> - OpenSSL 3 (required at default location on OS). 
    
    For OpenSSL 3 Installation: The libraries libcrypto.so.3 and libssl.so.3 must be available in the default library path represented by the LD_LIBRARY_PATH environment variable. If they are installed in a non-standard location, ensure that this path is added to LD_LIBRARY_PATH before starting the server.

#### Virtualized environment {#virtualized-environment}


You can run AEM Forms on JEE on a physical machine or a virtual environment. However, if you encounter any issue with AEM Forms on a virtual environment, try replicating the issue on a physical machine. If the issue persists on the physical machine, contact Adobe Support for a resolution. For the issues that you are not able to replicate on a physical machine, contact your virtual environment vendor.


#### Development environments {#development-environments}


<table>
<tbody>
 <tr>
  <th><p><strong>Platform (Base Version)</strong></p> </th>
  <th>Support Level</th>
  <th><p><strong>Supported Patch Definitions</strong></p> </th>
 </tr>
 <tr>
  <td><p>Microsoft&reg; Windows&reg; 10 64-bit</p> </td>
  <td>E: Expected to work</td>
  <td><p>Service pack and critical updates</p> </td>
 </tr>
</tbody>
</table>


### Exceptions to supported server platforms {#exceptions-to-supported-server-platforms}


Consider the following exceptions while choosing a platform to set up your AEM Forms on JEE server.


1. AEM Forms on JEE do not support IBM&reg; WebSphere&reg; with MySQL.
1. AEM Forms on JEE do not support JBoss&reg; on SUSE&reg; Linux&reg; Enterprise Server 12. Only IBM&reg; WebSphere&reg; is supported on SUSE&reg; Linux&reg; Enterprise Server 12.
1. AEM Forms on JEE do not support any JDK with JBoss&reg; other than Oracle Java&trade; SE.
1. AEM Forms on JEE do not support any JDK with IBM&reg; WebSphere&reg; other than IBM&reg; JDK.
1. CRX-repository supports persistence of type TarMK, MongoDB, and relational databases (RDBMK). You cannot have two different database systems between the application server and the CRX-repository. However, on an AEM Forms on JEE environment, you can use MongoMK with CRX-repository and a supported relational database with application server.
1. AEM Forms on JEE do not support WebSphere&reg; application server on CentOS.
1. AEM Forms on JEE do not support JBoss&reg; role-based access control (RBAC).
1. AEM Forms on JEE support Oracle Java&trade; SE 11 (64 bit) SDK for application server JBoss&reg; EAP 7.4 only.
1. JDK versions higher than 1.8.0_281 are not supported for WebLogic server. (FORMS-8498)
1. JDK 11.0.20 is not supported to install AEM Forms on JEE Installer. Only JDK 11.0.19 or earlier versions are supported to install AEM Forms on JEE Installer.


<!--
1. [!DNL Microsoft&reg; Windows Server 2019] does not support [!DNL MySQL 5.7] and [!DNL JBoss&reg; EAP 7.1], [!DNL Microsoft&reg; Windows Server 2019] does not support turnkey installations for [!DNL Experience Manager Forms Service Pack 6.5.10.0 and later]. (CQDOC-18312)
-->


In addition, consider the following points while choosing software for Adobe AEM Forms on JEE deployments:


- AEM Forms on JEE support updates, patches, and fix packs on top of the specified major and minor version of supported software. However, update to the next major or minor version is not supported unless specified.
- Cluster-based installations do not support TarMK persistence. For information about supported persistence, see [Choosing a persistence type for an AEM Forms installation](/help/forms/using/choosing-persistence-type-for-aem-forms.md).
- AEM Forms on JEE support various third-party software as per Adobe's [Third-party software support Policy](../../forms/using/aem-forms-jee-supported-platforms.md#p-third-party-patch-support-policy-p).
- AEM Forms on JEE support platforms as per the support provided by third-party vendors. Some combinations may not be allowed by third-party vendors. For example, many vendors have not certified their application servers with Oracle. As a result, AEM Forms on JEE also do not support these combinations. To ensure that you choose the supported software versions, check the support matrix for the third-party vendors as well.
- AEM Forms on JEE do not support TarMK Cold Standby.
- AEM Forms on JEE do not support vertical clustering.
- AEM Forms on JEE do not support MySQL database on a clustered environment.
- For the list of removed or updated platforms, see [AEM 6.5 Forms New Feature Summary](../../forms/using/whats-new.md) document.


### LDAP servers (optional) {#ldap-servers-optional}


<table>
<tbody>
 <tr>
  <th><p><strong>Product (Base Version)</strong></p> </th>
  <th><p><strong>Supported Patch Definitions</strong></p> </th>
 </tr>
 <tr>
  <td>Microsoft&reg; Active Directory 2016 (Deprecated)</td>
  <td>Maintenance release and fix packs</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Active Directory 2022</td>
  <td>Maintenance release and fix packs</td>
 </tr>
 <tr>
  <td><p>IBM&reg; Tivoli Directory Server 6.4</p> </td>
  <td><p>Feature packs and interim fixes</p> </td>
 </tr>
</tbody>
</table>


### Email servers (optional) {#email-servers-optional}


| Product                 |
| ----------------------- |
| Microsoft&reg; Exchange 2013 |
| Microsoft&reg; Office 365    |


### Content managers and corresponding connectors {#content-managers-and-corresponding-connectors}


<table>
<tbody>
 <tr>
  <td><strong>Product<br /> </strong></td>
  <td><strong>Version</strong></td>
 </tr>
 <tr>
  <td>EMC Documentum&reg;</td>
  <td>7.3</td>
 </tr>
 <tr>
  <td>IBM&reg; FileNet</td>
  <td>5.5.2</td>
 </tr>
 <tr>
  <td>IBM&reg; Content Manager Server (Deprecated) </td>
  <td>8.5 Fix pack 2</td>
 </tr>
  <tr>
  <td> IBM&reg; Content Manager Client (Deprecated)</td>
  <td>8.5 </td>
 </tr>
  <td>Microsoft&reg; Sharepoint </td>
  <td>2019<br /> </td>
 </tr>
</tbody>
</table>


### Support for Cordova {#support-for-cordova}


AEM Forms App now supports the Apache Cordova. Following are the platform-specific versions of Cordova that are supported:


- Apache Cordova 6.4.0
- Cordova iOS 4.3.0
- Cordova Android&trade; 6.0.0
- Cordova Windows 4.4.3




### Requirements for PDF Generator
  
### Software support for PDF Generator {#software-support-for-pdf-generator}


<table>
<tbody>
 <tr>
  <th><p><strong>Product</strong></p> </th>
  <th><p><strong>Supported Formats for Conversion to PDF</strong></p> </th>
 </tr>
 <tr>
  <td><a href="https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html">Acrobat 2020 classic track</a> latest version</td>
  <td>XPS, image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, DWG, DXF, and DWF</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Office 2019  (Deprecated) </td>
  <td>DOC, DOCX, XLS, XLSX, PPT, PPTX, RTF, and TXT</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Office 2021</td>
  <td>DOC, DOCX, XLS, XLSX, PPT, PPTX, RTF, and TXT</td>
 </tr>
 <tr>
  <td>WordPerfect 2020<br /> </td>
  <td>WP, WPD</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Publisher 2019<br /> </td>
  <td>PUB</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Publisher 2021<br /> </td>
  <td>PUB</td>
 </tr>
 <tr>
  <td>OpenOffice 4.1.10</td>
  <td>ODT, ODP, ODS, ODG, ODF, SXW, SXI, SXC, SXD, XLS, XLSX, DOC, DOCX, PPT, PPTX, image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, RTF, and TXT</td>
 </tr>
</tbody>
</table>


>[!NOTE]
>
>PDF Generator supports only English, French, German, and Japanese versions of the supported operating systems and applications.
>
>In addition,:
>
>- PDF Generator requires a 32-bit version of [Acrobat 2020 classic track version 20.004.30006](https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html) to perform the conversion.
>- PDF Generator supports only the 32-bit version of Microsoft&reg; Office Professional Plus and other software required for conversion.
>- The Microsoft&reg; Office Professional Plus installation may use Retail or MAK/KMS/AD based volume licensing.
>- If a Microsoft&reg; Office installation becomes deactivated or unlicensed due to any reason, such as a volume licensed installation unable to locate a KMS host within a specified period, conversions may fail until the installation is relicensed and reactivated.
>- PDF Generator does not support Microsoft&reg; Office 365.
>- PDF Generator supports the 32-bit version of OpenOffice on the Linux&reg; operating system.
>- PDF Generator conversions for OpenOffice are supported only on Windows and Linux&reg;.
>- The OCR PDF, Optimize PDF, and Export PDF features are supported only on Windows.
>- A version of Acrobat is bundled with AEM Forms to enable PDF Generator functionality. The bundled version should only be accessed programmatically only with AEM Forms, during the term of the AEM Forms license, for use with AEM Forms PDF Generator. For more information, see AEM Forms product description as per your deployment ([On-Premise](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-on-premise.html) or [Managed Services](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-managed-services.html))"
>- PDF Generator service does not support Microsoft&reg; Windows 10.
>- PDF Generator fails to convert files using Microsoft&reg; Visio 2019.
>- PDF Generator fails to convert files using Microsoft&reg; Project 2019.


PDF Generator supports only the 32-bit version of Microsoft&reg; Office Professional Plus and other software required for conversion.


The Microsoft&reg; Office Professional Plus installation may use Retail or MAK/KMS/AD based volume licensing.


If a Microsoft&reg; Office installation becomes deactivated or unlicensed due to any reason, such as a volume licensed installation unable to locate a KMS host within a specified period, conversions may fail until the installation is relicensed and reactivated.


<!-- Removed lines: >- PDF Generator fails to convert files using Microsoft&reg; Visio 2019. You can continue to use Microsoft&reg; Visio 2016 to convert .VSD and .VSDX files.
>- PDF Generator fails to convert files using Microsoft&reg; Project 2019. You can continue to use Microsoft&reg; Project 2016 to convert .MPP files.-->


### Exceptions to accessibility support {#exceptions-to-accessibility-support}


The following subsystems of AEM Forms are not [508](https://www.section508.gov/) compliant:


- Adaptive Forms Authoring UI
- Forms Manager Authoring UI
- Correspondence Management Authoring UI
- Admin UI (Administration Console UI)


## System Requirements for AEM Forms on JEE {#system-requirements-for-aem-forms-on-jee}


### Minimum hardware requirements {#minimum-hardware-requirements}


<table>
<tbody>
 <tr>
  <td>Platform</td>
  <td>Minimum hardware requirement</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Windows Server</td>
  <td>Intel Xeon&reg; E5-2680, 2.4-GHz processor or equivalent<br /> VMWare ESX 5.1 or later<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 15 GB of temporary space plus 22 GB<br /> for AEM Forms on JEE</td>
 </tr>
 <tr>
  <td>SUSE&reg; Linux&reg; Enterprise Server</td>
  <td>Intel Xeon&reg; E5-2670v2, 1 vCPU, 2.5-GHz processor<br /> AWS m3.medium (3 ECUs)<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 6 GB of temporary space plus 22 GB<br /> for AEM Forms on JEE</td>
 </tr>
 <tr>
  <td>Red Hat&reg; Enterprise Linux&reg;</td>
  <td>Intel Xeon&reg; E5-2670v2, 1 vCPU, 2.5-GHz processor<br /> AWS m3.medium (3 ECUs)<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 6 GB of temporary space plus 22 GB<br /> for AEM Forms on JEE<br /> </td>
 </tr>
 <tr>
  <td>Hardware requirements for a small production environment</td>
  <td>
   <ul>
    <li><strong>Intel&reg; powered environment</strong>: Intel Xeon&reg; E5-2680, 2.4 GHz or greater. Using a dual core processor will further enhance performance</li>
    <li><strong>Memory: </strong>4 GB <br /> </li>
   </ul> </td>
 </tr>
</tbody>
</table>


For additional requirements see:


- [System requirements for a single-server AEM Forms on JEE deployment](https://www.adobe.com/go/learn_aemforms_sysreq_single_65)
- [System requirements for a clustered AEM Forms on JEE deployment](https://www.adobe.com/go/learn_aemforms_sysreq_cluster_65)


### Adobe Acrobat and Adobe Reader {#adobe-acrobat-and-adobe-reader}


<table>
<tbody>
 <tr>
  <th><p><strong>Acrobat and Adobe Reader (Base)</strong></p> </th>
  <th><p><strong>Supported Patch Definitions</strong></p> </th>
 </tr>
 <tr>
  <td>Acrobat 2020 (Classic track)</td>
  <td>Version 20.004.30006 or later<br /> </td>
 </tr>
 </tbody>
</table>


>[!NOTE]
>
>The Acrobat DC product family introduces two tracks for both Acrobat and Reader which are different products: "Classic" and "Continuous." For details and a comparison of the two tracks, see [https://www.adobe.com/devnet-docs/acrobatetk/tools/AdminGuide/whatsnewdc.html](https://www.adobe.com/devnet-docs/acrobatetk/tools/AdminGuide/whatsnewdc.html).


## Supported Clients for AEM Forms on JEE {#supported-clients-for-aem-forms-on-jee}


### Workbench {#workbench}


<table>
<tbody>
 <tr>
  <th><p><strong>Platform</strong></p> </th>
  <th><p><strong>Supported Patch Definitions</strong></p> </th>
 </tr>
 <tr>
  <td><p>Microsoft&reg; Windows&reg; 10 (Enterprise, Pro, Basic)</p> <p>32-bit or 64-bit version</p> <p> </p> </td>
  <td>Service packs and critical updates</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Windows&reg; 2019 Server (Deprecated)</td>
  <td>Service packs and critical updates</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Windows&reg; 2022 Server</td>
  <td>Service packs and critical updates</td>
 </tr>
</tbody>
</table>


- Disk space for installation: 1.7 GB for Workbench only, 2.7 GB on a single drive for a full installation of Workbench, Designer, and the samples assembly 400 MB for temporary install directories - 200 MB in the user temp directory and 200 MB in the Windows temporary directory. If all of these locations reside on a single drive, there must be 1.5 GB of space available during installation. The files copied to the temporary directories are deleted when installation is complete.


- Memory for running Workbench: 2 GB of RAM
- Hardware requirement: Intel&reg; Pentium&reg; 4 or AMD&reg; equivalent, 1-GHz processor
- Minimum 1024 X 768 pixels or greater monitor resolution with 16-bit color or higher
- TCP/IPv4 or TCP/IPv6 network connection to the AEM Forms on JEE server
- You must have Administrative privileges to install Workbench on Windows. If you are installing using a non-administrator account, the installer prompts you for the credentials for an appropriate account.


### Designer {#designer}


- Microsoft&reg; Windows&reg; 2016 Server, Microsoft&reg; Windows&reg; 2019 Server, Microsoft&reg; Windows&reg; 10, or Windows&reg; 11
- 1 GHz or faster processor with support for PAE, NX, and SSE2.
- 1 GB of RAM for 32-bit or 2 GB of RAM for 64-bit OS
- 16-GB disk space for 32-bit or 20-GB disk space for 64-bit OS
- Graphics memory - 128 MB of GPU (256 MB recommended)
- 2.35 GB of available hard-disk space
- 1024 X 768 pixels or greater monitor resolution
- Video hardware acceleration (optional)
- Acrobat Pro DC, Acrobat Standard DC, or Adobe Acrobat Reader DC
- Administrative privileges to install Designer
- Microsoft&reg; Visual C++ 2019 (VC 14.28 or greater) 32-bit runtime


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
  <td><p>Microsoft&reg; Edge (Evergreen)</p> </td>
  <td><p>A: Supported</p> </td>
  <td><p>Service packs and updates</p> </td>
 </tr>
 <tr>
  <td><p>Mozilla Firefox (Evergreen)</p> </td>
  <td><p>A: Supported</p> </td>
  <td>All updates</td>
 </tr>
 <tr>
  <td>Mozilla Firefox ESR</td>
  <td>E: Expected to work</td>
  <td> All updates</td>
 </tr>
 <tr>
  <td><p>Google Chrome (Evergreen)</p> </td>
  <td><p>A: Supported</p> </td>
  <td>All updates</td>
 </tr>
 <tr>
  <td>Apple Safari on macOS</td>
  <td>A: Supported</td>
  <td>All updates</td>
 </tr>
</tbody>
</table>


>[!NOTE]
>
>Some browser-related exceptions for desktops are as follows:
>
>- Safari is supported only on Macintosh OS X.
>- Workspace supports Safari 5.1 on Macintosh OS X 10.6 and 10.7 with Acrobat DC or later versions. For more information about Safari 5.1 compatibility with Adobe Reader, Acrobat, see [https://helpx.adobe.com/x-productkb/multi/safari-5-1-incompatible-reader.html](https://helpx.adobe.com/x-productkb/multi/safari-5-1-incompatible-reader.html).
>- Administration Console is not supported on Safari.
>- Correspondence Management does not support Windows&reg; Internet Explorer 9.0 for AEM 6.1 forms.
>- Forms Portal supports JAWS 14.0 screen reader software on Internet Explorer 11 for accessibility.


#### Mobile clients {#mobile-clients}


<table>
<tbody>
 <tr>
  <th><p><strong>Browser (Base)</strong></p> </th>
  <th><p><strong>Supported Patch Definitions</strong></p> </th>
 </tr>
 <tr>
  <td><p>Chrome on Android&trade; 4.1.2 and above</p> </td>
  <td><p>All updates</p> </td>
 </tr>
 <tr>
  <td>Safari on iOS 15.1 and above</td>
  <td>All updates</td>
 </tr>
 <tr>
  <td>Microsoft&reg; Edge<br /> </td>
  <td>All updates<br /> </td>
 </tr>
 <tr>
  <td>Native Android&trade; browser on Android&trade; 4.4 and above</td>
  <td>All updates</td>
 </tr>
</tbody>
</table>


>[!NOTE]
>
>- Forms Portal is supported on Safari on iPad only.


### AEM Forms app {#aem-forms-workspace-app}


#### Mobile device support {#mobile-device-support}


AEM Forms app is available on the following platforms:


| **Platform**      | **Supported Devices**                                                                                               |
| ----------------- | ------------------------------------------------------------------------------------------------------------------- |
| Apple iOS         | Apple iPhone, iPad, iPad Air, and iPad mini running iOS 15.1 and above.                                               |
| Google Android&trade;    | Android&trade; 5.1 and above. AEM Forms app is certified on 7-inch and 10-inch Samsung Galaxy tablets and popular smartphones. |
| Microsoft&reg; Windows | Microsoft&reg; Surface devices, tablets, laptops, and desktops running Microsoft&reg; Windows 10 operating system.            |


### Adobe Document Security Extension for Microsoft&reg; Office {#adobe-rights-management-extension-for-microsoft-office}


Click [here](https://www.adobe.com/products/livecycle/rightsmanagement/extension/downloads.html) to see the system requirements for Adobe Document Security Extension for Microsoft&reg; Office.


### Exceptions to client support {#exceptions-to-client-support}


AEM Forms on JEE support updates, patches, and fix packs on top of the specified major and minor version of supported software. However, update to the next major or minor version is not supported unless specified.


## Third-party patch support policy {#third-party-patch-support-policy}


The third-party software requirements for AEM Forms on JEE are documented in the "System Requirements" section of their respective product documents. Access all documentation from [https://adobe.com/go/learn_aemforms_documentation_65](https://adobe.com/go/learn_aemforms_documentation_65) .


AEM Forms on JEE's third-party reference platforms state the specific patch level of third-party infrastructure that was current during the development and release of AEM Forms on JEE, and from the minimum patch/service pack level of the infrastructure supported by that version of AEM Forms on JEE.


Adobe supports urgent or recommended patches issued by third-party vendors upon their release assuming that third-party vendors guarantee backward compatibility with the versions that AEM Forms on JEE support. Adobe will only support patches released after the minimum patch level stated in the AEM Forms on JEE documentation.


Sometimes, Adobe does not support third-party updates that change major functionality, and thus do not support full backward compatibility. For details on the supported updates, see [Supported patch definitions](https://helpx.adobe.com/aem-forms/aem-forms-third-party-software-patch.html) for specific vendor products and the patch types Adobe supports.


Under circumstances beyond Adobe's control, third-party patches that claim backward compatibility may have negative impact on the Adobe products or customer environments. In such cases, Adobe recommends that customers assess the impact of any urgent patch from a third-party before applying them to critical systems. Adobe works with third parties using reasonable business efforts to resolve such issues, either through normal Adobe support programs or by third parties rectifying the issue in their patch. This does not guarantee that a newly released third-party patch that will be supported by Adobe works as documented by the vendor or with AEM Forms on JEE.


Adobe reserves the right to change the third-party reference platforms supported by a AEM Forms on JEE release and their supported patch definitions at any given point.


Additional information for third-party patches can also be found by searching the Adobe Enterprise Support site for knowledgebase articles related to your product.


<!--


## Platform updates {#platform-updates}


The following platforms are marked as deprecated with AEM Forms 6.5.18.0 release on August 31, 2023:


- Microsoft&reg; Windows Server 2019 (64-bit)
- Microsoft&reg; Active Directory 2016


The following platforms are marked as deprecated with AEM Forms 6.5.13.0 release on June 2, 2022:
- Microsoft&reg; SharePoint 2016


The following platforms are marked as deprecated with AEM Forms 6.5.10.0 release on September 7, 2021:


- Adobe Acrobat 2017 - [Core support for Adobe Acrobat 2017 ends on June 6, 2022](https://helpx.adobe.com/support/programs/eol-matrix.html).
- Red Hat&reg; Enterprise Linux&reg; 7 (Kernel 3.x) (64-bit)
- Microsoft&reg; Windows Server 2016 (64-bit)
- Microsoft&reg; Office 2016
- OpenOffice 4.1.2


-->




## Revision History {#revision-history}


<!--


- 6.5.18.0 (Aug 31, 2023)
 - **Added support**: [!DNL Adobe Experience Manager Forms] on JEE has added support for the following platforms:
   - MongoDB Enterprise 4.4
   - Oracle WebLogic Server 14c
   - My SQL JDBC connector 8
   - Active Directory 2022
   - Microsoft&reg; Windows Server 2022 (64-bit)


 - **Removed support**: [!DNL Adobe Experience Manager Forms] on JEE has removed support for the following platforms:
   - Windows Server 2016 (64-bit)
   - MongoDB Enterprise 4.0
   - Oracle Database 12c Release 2 (12.2.0.1.0)
   - MySQL 5.7.35
   - Microsoft&reg; SQL Server 2016
   - JBoss&reg; EAP 7.1.4
   - My SQL JDBC connector 5.1.44
   - Microsoft&reg; SQL Server JDBC driver 6.2.1.0
   - Microsoft&reg; SQL Server JDBC driver 6.2.2.0
   - Microsoft&reg; JDBC Driver 8.x for SQL Server


   The release has also removed support for the following platforms for PDF Generator and in-general:
   - Microsoft&reg; Sharepoint 2016
   - Microsoft&reg; Office 2016
   - Microsoft&reg; Office Visio 2016
   - Microsoft&reg; Publisher 2016
   - Microsoft&reg; Project 2016
   - OpenOffice 4.1.2
   - Acrobat 2017 (Classic track) Version 17.011.30078 or later


 - **Deprecated support**: [!DNL Adobe Experience Manager Forms] on JEE has deprecated the following platforms:
   - Microsoft&reg; Windows Server 2019 (64-bit)
   - Microsoft&reg; Active Directory 2016
  
- 6.5.13.0 (June 2, 2022)


 The following platforms are deprecated with AEM Forms 6.5.13.0 release on:
 - Microsoft&reg; SharePoint 2016


- 6.5.12.0 (March 3, 2022)


   - **Platform Updates**: [!DNL Adobe Experience Manager Forms] on JEE has removed support for the following platforms:
     - IBM&reg; J9 Virtual Machine (build 2.8, JRE 1.8.0)
     - Oracle Database 12c Release 1
     - Oracle Database 18c
     - Oracle Unified Directory (OUD) 11g Release 2
     - IBM&reg; Lotus Domino 9.0
     - IBM&reg; FileNet 5.2
     - Adobe Flash Player


   - **Platform Updates**: [!DNL Adobe Experience Manager Forms] on JEE has deprecated the following platforms:


     - MongoDB Enterprise 4.0
     - MongoDB Enterprise 4.2
     - IBM&reg; DB2&reg; 11.1
     - Oracle Database 12c Release 2
     - MySQL 5.7.35
     - Microsoft&reg; SQL Server JDBC driver 6.2.1.0
     - JBoss&reg; Enterprise Application Platform (EAP) 7.1.4
     - IBM&reg; Content Manager Server 8.5 Fix pack 2
     - IBM&reg; Content Manager Client 8.5
     - Microsoft&reg; SQL Server 2016


- 6.5.10.0 (Sep 01, 2022)


 - **Added support**: [!DNL Adobe Experience Manager Forms] on JEE has added support for the following platform:
    - Oracle Java&trade; SE 11 (64 bit) SDK for application server JBoss&reg; EAP 7.4.
 - **Deprecated support**: [!DNL Adobe Experience Manager Forms] on JEE has deprecated the following platforms:


   - Adobe Acrobat 2017 - [Core support for Adobe Acrobat 2017 ends on June 6, 2022](https://helpx.adobe.com/support/programs/eol-matrix.html).
   - Red Hat&reg; Enterprise Linux&reg; 7 (Kernel 3.x) (64-bit)
   - Microsoft&reg; Windows Server 2016 (64-bit)
   - Microsoft&reg; Office 2016
   - OpenOffice 4.1.2




-->


### Release 6.5.23.0 (June 06, 2025)


| Added Support | Removed Support | Deprecated Support |
| -------------- | --------------- | ------------------- |
| MongoDB Enterprise 7.0 |    MongoDB Enterprise 5.0 | MongoDB Enterprise 6.0 |
| MYSQL 8.4 |SUSE&reg; Linux&reg; Enterprise Server 12 (64-bit) | MYSQL 8.0.27 |
| Microsoft&reg; SQL Server 2022 | |Microsoft&reg; SQL Server 2019 |
| Microsoft&reg; SQL Server JDBC driver 12.8 | | Microsoft&reg; SQL Server JDBC driver 8.2 |
| Microsoft&reg; Office 2021 | | Microsoft&reg; Office 2019 |
| Red Hat&reg; Enterprise Linux&reg; 9 (Kernel 4.x) (64-bit) | |Red Hat&reg; Enterprise Linux&reg; 8 (Kernel 4.x) (64-bit)  |


### Release 6.5.22.0 (Nov 29, 2024)


| Added Support | Removed Support | Deprecated Support |
| -------------- | --------------- | ------------------- |
| SUSE&reg; Linux&reg; Enterprise Server 15 SP6 (64-bit)  | |  |




### Release 6.5.19.1 (Dec 15, 2023)


| Added Support | Removed Support | Deprecated Support |
| -------------- | --------------- | ------------------- |
| MongoDB Enterprise 6.0 |MongoDB Enterprise 4.4   |  |
| MongoDB Enterprise 5.0 |  |  |
|  | |  |


### Release 6.5.18.0 (Aug 31, 2023)


| Added Support | Removed Support | Deprecated Support |
| -------------- | --------------- | ------------------- |
| MongoDB Enterprise 4.4 | Windows Server 2016 (64-bit) | Microsoft&reg; Windows Server 2019 (64-bit) |
| Oracle WebLogic Server 14c | MongoDB Enterprise 4.0 | Microsoft&reg; Active Directory 2016 |
| My SQL JDBC connector 8 | Oracle Database 12c Release 2 (12.2.0.1.0) |  |
| Active Directory 2022 | MySQL 5.7.35 |  |
| Microsoft&reg; Windows Server 2022 (64-bit) | Microsoft&reg; SQL Server 2016 |  |
|  | JBoss&reg; EAP 7.1.4 |  |
|  | My SQL JDBC connector 5.1.44 |  |
|  | Microsoft&reg; SQL Server JDBC driver 6.2.1.0 |  |
|  | Microsoft&reg; SQL Server JDBC driver 6.2.2.0 |  |
|  | Microsoft&reg; JDBC Driver 8.x for SQL Server |  |
|  |  |  |
|  | **Removed Support (PDF Generator and In-General):** |  |
|  | Microsoft&reg; Sharepoint 2016 |  |
|  | Microsoft&reg; Office 2016 |  |
|  | Microsoft&reg; Office Visio 2016 |  |
|  | Microsoft&reg; Publisher 2016 |  |
|  | Microsoft&reg; Project 2016 |  |
|  | OpenOffice 4.1.2 |  |
|  | Acrobat 2017 (Classic track) Version 17.011.30078 or later |  |




### Release 6.5.13.0 (June 2, 2022)


| Added Support | Removed Support | Deprecated Support |
| -------------- | --------------- | ------------------- |
|  |  | Microsoft&reg; SharePoint 2016 |




### Release 6.5.12.0 (March 3, 2022)


| Added Support | Removed Support | Deprecated Support |
| -------------- | --------------- | ------------------- |
|  | IBM&reg; J9 Virtual Machine (build 2.8, JRE 1.8.0) | MongoDB Enterprise 4.0 |
|  | Oracle Database 12c Release 1 | MongoDB Enterprise 4.2 |
|  | Oracle Database 18c | IBM&reg; DB2&reg; 11.1 |
|  | Oracle Unified Directory (OUD) 11g Release 2 | Oracle Database 12c Release 2 |
|  | IBM&reg; Lotus Domino 9.0 | MySQL 5.7.35 |
|  | IBM&reg; FileNet 5.2 | Microsoft&reg; SQL Server JDBC driver 6.2.1.0 |
|  | Adobe Flash Player | JBoss&reg; Enterprise Application Platform (EAP) 7.1.4 |
|  | | IBM&reg; Content Manager Server 8.5 Fix pack 2 |
|  | | IBM&reg; Content Manager Client 8.5 |
|  | | Microsoft&reg; SQL Server 2016 |
|  | | Microsoft&reg; Windows Server 2016 |


### Release 6.5.10.0 (September 01, 20222)


| Added Support | Removed Support | Deprecated Support |
| -------------- | --------------- | ------------------- |
| Oracle Java&trade; SE 11 (64 bit) SDK for application server JBoss&reg; EAP 7.4. | | [Adobe Acrobat 2017 - Core support for Adobe Acrobat 2017 ends on June 6, 2022.](https://helpx.adobe.com/support/programs/eol-matrix.html)|
|  | | Red Hat&reg; Enterprise Linux&reg; 7 (Kernel 3.x) (64-bit) |
|  | | Microsoft&reg; Windows Server 2016 (64-bit)|
|  | | Microsoft&reg; Office 2016 |
|  | | OpenOffice 4.1.2 |




>[!NOTE]
>
> A deprecated platform continue to receive support until the next full installer release or until third-party vendor support for the platform reaches its end-of-life, whichever is earlier.


<!--
- Oct 10, 2021


 - Changed supported version of iOS for AEM Forms App to iOS 15.1. The previous version was iOS 12.


- Sep 07, 2021
 - **Platform Updates**: [!DNL Adobe Experience Manager Forms] on JEE has added support for the following platforms:
   - [!DNL Adobe Acrobat 2020]
   - [!DNL Ubuntu 20.04]
   - [!DNL Open Office 4.1.10]
   - [!DNL Microsoft&reg;&reg; Office 2016]
   - [!DNL Microsoft&reg;&reg; Windows Server 2016]
   - [!DNL RHEL8]


- Dec 03, 2020
 - Support added with AEM Forms 6.5.7.0 or later for the following platform:
   - [!DNL Microsoft&reg;&reg; SQL Server 2019]


- Sep 09, 2020


   - Changed supported version of iOS for AEM Forms App to iOS 12. The previous version was iOS 11.


   -->





