---
title: Supported Platforms for AEM Forms on JEE
seo-title: Supported Platforms for AEM Forms on JEE
description: List of infrastructure components required and supported for installing AEM Forms on JEE
seo-description: List of infrastructure components required and supported for installing AEM Forms on JEE
uuid: 777f943b-4cb4-444e-a036-8032b9fce5be
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: f777865e-d4a8-40ef-87b0-130c19eb1b91
docset: aem65

role: Admin
exl-id: 74d22cf4-56b2-48f5-92d9-928eaa134866
---

# Supported Platforms for AEM Forms on JEE {#supported-platforms-for-aem-forms-on-jee}

## Supported Platforms {#supported-platforms}

### Support levels {#support-levels}

AEM Forms on JEE server can be set up using any combination of supported operating systems, application servers, databases, database drivers, JDK, LDAP servers, and email servers.

This document lists the supported client and server platforms for AEM Forms on JEE. Adobe provides several levels of support, both for our recommended configurations and for other configurations. The document also lists other supported software and their version, exceptions, patch definitions, and third-party software patch support policy.

>[!NOTE]
>
> - For a complete list of exceptions to supported server platforms, see [Exceptions to supported server platforms](../../forms/using/aem-forms-jee-supported-platforms.md#p-exceptions-to-supported-server-platforms-p).
> - AEM Forms on JEE supports only English, French, German, and Japanese versions of the supported operating systems and applications.

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

| Support Level       | Description                                                                                                                            |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| E: Expected to work | The configuration is expected to work, and there are no reports to the contrary.                                                       |
| Z: Not supported    | The configuration is not supported. Adobe does not make any statements about whether the configuration works, and does not support it. |

>[!NOTE]
>
> To help AEM Forms customers reduce the cost of ownership, simplify the deployment architecture, and modernize the development stack, Adobe Experience Manager enterprise platform is moving away from application server-based deployments in favor of standalone OSGi-based deployments. Adobe continues to support the AEM Forms JEE stack with a reduced matrix of infrastructure components.
>
> With the release of 6.5, infrastructure components that have the lowest usage among our customers are no longer supported, as follows:
> • IBM DB2 database
> • IBM AIX and Sun Solaris operating systems
>
> For new installations, where feasible it is recommended to deploy AEM Forms on the modern OSGi stack to leverage the latest innovations around responsive Adaptive Forms for mobile, multi-channel Interactive Communications, and backend data integrations using Form Data Model.
>
> We recognize existing users need to continue to deploy AEM Forms on JEE stack. In such scenarios, Adobe requires the deployment of AEM Forms JEE on supported infrastructure as described in this documentation. If you are upgrading to AEM 6.5 Forms and using a non-supported platform on the previous AEM Forms release, you can contact Adobe Support for help on upgrading to a supported platform.

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
   <td><p>Oracle Java™ SE 11 (64 bit)</p> </td>
   <td><p>Z: Not supported</p> </td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td>Azul Zulu OpenJDK 11 - 64bit</td>
   <td>Z: Not supported</td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td>Azul Zulu OpenJDK 8 - 64bit</td>
   <td>Z: Not supported</td>
   <td><p> </p> </td>
  </tr>
  <tr>
   <td>Oracle Java™ SE 8 (64 bit)</td>
   <td>A: Supported</td>
   <td>Minor releases and updates</td>
  </tr>
  <tr>
   <td>IBM® J9 Virtual Machine (build 2.9, JRE 1.8.0) IBM® JDK SR6-FP26<br /> </td>
   <td>A: Supported</td>
   <td>Minor releases and updates</td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
> - It is recommend to track the Security Bulletins from the Java vendor to ensure the safety and security of production environments and install the latest Java Updates.
> - AEM Forms on JEE supports only 64-bit JVMs on production environments.

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
   <td><p> MongoDB Enterprise 4.0 (Deprecated) </p> </td>
   <td><p>Repository Microkernel</p> </td>
   <td><p>Supported</p> </td>
  </tr>
  <tr>
   <td><p>MongoDB Enterprise 4.2 </p> </td>
   <td><p>Repository Microkernel</p> </td>
   <td><p>Supported</p> </td>
  </tr>
  <tr>
   <td><p>Oracle Database 12c Release 2 (12.2.0.1.0) (Deprecated)</p> </td>
   <td><p>Repository Microkernel</p> </td>
   <td><p>Supported</p> </td>
  </tr>
   <tr>
   <td>Oracle Database 19c (Standard, Real Application Clusters (RAC) and Enterprise editions) </td>
   <td>Repository Microkernal </td>
   <td>Supported</td>
  </tr>
  <tr>
   <td><p>Microsoft SQL Server 2016</p> </td>
   <td><p>Repository Microkernel</p> </td>
   <td><p>Supported</p> </td>
  </tr>
  <tr>
   <td><p>Microsoft SQL Server 2019</p> </td>
   <td><p>Repository Microkernel</p> </td>
   <td><p>Supported</p> </td>
  </tr>
  <tr>
   <td>IBM DB2 11.1 (Deprecated)</td>
   <td>Repository Microkernel</td>
   <td>R: Restricted Support</td>
  </tr>
  <tr>
   <td>MySQL 5.7.35 (Deprecated) </td>
   <td>-</td>
   <td>R: Restricted Support</td>
  </tr>
  <tr>
   <td>MySQL 8.0.27</td>
   <td>-</td>
   <td>R: Restricted Support</td>
  </tr>
 </tbody>
</table>

- IBM DB2 is not supported for fresh installations. It is supported only for exisiting customers upgrading to AEM 6.5 Forms.
- MongoDB is third-party software and is not included in the AEM licensing package. For more information see the [MongoDB licensing policy](https://www.mongodb.org/about/licensing/) page.
- In order to get the most of your AEM deployment, Adobe recommends licensing the MongoDB Enterprise version in order to benefit from professional support.
- Adobe Customer Care will assist qualifying issues related to the usage of MongoDB with AEM. For more information, see the [MongoDB for Adobe Experience Manager page](https://www.mongodb.com/lp/contact/mongodb-adobe-experience-manager).
- 'File System' includes block storage that is POSIX compliant. This includes network storage technology. Mind that file system performance might vary and influences the overall performance. It is recommended to load test AEM in combination with the network/remote file system.
- Only MongoDB Storage Engine WiredTiger is supported.
- MongoDB Sharding is not supported in AEM.
- AEM Forms on JEE does not support MySQL for RDBMK persistence.
- The Document Security module does not use Content Repository. It implies, if you are using only Document Security and do not plan to use HTML Workspace, HTML5 forms, or adaptive forms, then do not install Content Repository.
- AEM Forms on JEE does not support using MySQL for persisting AEM Repository (CRX-Repository).

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
   <td>Microsoft SQL Server<br /> </td>
   <td><p>Microsoft® SQL Server JDBC driver 6.2.1.0 (Deprecated) <br /> </p> <p>sqljdbc6.jar</p> </td>
   <td><p>Supplied with AEM Forms on JEE installation.</p> </td>
  </tr>
  <tr>
   <td>Microsoft SQL Server<br /> </td>
   <td><p>Microsoft® SQL Server JDBC driver 8.2.2<br /> </p> <p>sqljdbc8.jar</p> </td>
   <td><p>Download from Microsoft Website.</p> </td>
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
   <td>Oracle WebLogic Server 12.2.1 (12c R2)</td>
   <td>A: Supported</td>
   <td>Service pack and critical updates</td>
  </tr>
  <tr>
   <td>IBM® WebSphere® Application Server 9.0 <sup>[1] [4]</sup><br /> </td>
   <td>A: Supported</td>
   <td>Service pack and critical updates</td>
  </tr>
  <tr>
   <td><p>JBoss® Enterprise Application Platform (EAP) 7.1.4 <sup>[2] [3] [7]</sup> (Deprecated) </p> </td>
   <td><p>A: Supported</p> </td>
   <td><p>Patches and cumulative patches for the supported EAP version</p> </td>
  </tr>
  <tr>
   <td><p>JBoss® Enterprise Application Platform (EAP) 7.4 <sup>[2] [3] [7]</sup> </p> </td>
   <td><p>A: Supported</p> </td>
   <td><p>Patches and cumulative patches for the supported EAP version</p> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
> IBM® WebSphere® clusters are only supported in Network Deployment editions.

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
   <td>Microsoft Windows Server 2019 (64-bit)</td>
   <td>A: Supported</td>
   <td>Service packs and critical updates</td>
  </tr>
  <tr>
   <td>Ubuntu 20.04</td>
   <td>A: Supported</td>
   <td>Service packs and critical updates</td>
  </tr>
  <tr>
   <td> Microsoft Windows Server 2016 (64-bit) (Deprecated)</td>
   <td>A: Supported</td>
   <td>Service packs and critical updates</td>
  </tr>
  <tr>
   <td><p>Red Hat Enterprise Linux 8 (Kernel 4.x) (64-bit)</p> </td>
   <td><p>A: Supported</p> </td>
   <td><p>Minor releases, cumulative updates, and critical updates</p> </td>
  </tr>
  <tr>
   <td><p>Red Hat Enterprise Linux 7 (Kernel 3.x) (64-bit) (Deprecated)</td>
   <td><p>A: Supported</p> </td>
   <td><p>Minor releases, cumulative updates, and critical updates</p> </td>
  </tr>
  <tr>
   <td><p>SUSE® Linux® Enterprise Server 12 (64-bit)</p> </td>
   <td><p>A: Supported</p> </td>
   <td><p>Service packs, cumulative patches, and critical security updates</p> </td>
  </tr>
  <tr>
   <td>Oracle Linux® 7 Update 3 (64-bit)</td>
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
   <td><p>Microsoft® Windows® 10 64-bit</p> </td>
   <td>E: Expected to work</td>
   <td><p>Service pack and critical updates</p> </td>
  </tr>
 </tbody>
</table>

### Exceptions to supported server platforms {#exceptions-to-supported-server-platforms}

Consider the following exceptions while choosing a platform to set up your AEM Forms on JEE server.

1. AEM Forms on JEE does not support IBM® WebSphere® with MySQL.
1. AEM Forms on JEE does not support and JBoss on SUSE Linux Enterprise Server 12. Only IBM WebSphere is supported on SUSE Linux Enterprise Server 12.
1. AEM Forms on JEE doesn’t support any JDK with JBoss® other than Oracle Java™ SE.
1. AEM Forms on JEE doesn’t support any JDK with IBM® WebSphere® other than IBM® JDK.
1. CRX-repository supports persistence of type TarMK, MongoDB, and relational databases (RDBMK). You cannot have two different database systems between the application server and the CRX-repository. However, on an AEM Forms on JEE environment, you can use MongoMK with CRX-repository and a supported relational database with application server.
1. AEM Forms on JEE does not support WebSphere application server on CentOS.
1. AEM Forms on JEE does not support JBoss role based access control (RBAC).

In addition, consider the following points while choosing software for Adobe AEM Forms on JEE deployments:

- AEM Forms on JEE supports updates, patches, and fix packs on top of the specified major and minor version of supported software. However, update to the next major or minor version is not supported unless specified.
- Cluster-based installations do not support TarMK persistence. For information about supported persistence, see [Choosing a persistence type for an AEM Forms installation](/help/forms/using/choosing-persistence-type-for-aem-forms.md).
- AEM Forms on JEE supports various third-party software as per our [Third-party software support Policy](../../forms/using/aem-forms-jee-supported-platforms.md#p-third-party-patch-support-policy-p).
- AEM Forms on JEE supports platforms as per the support provided by third-party vendors. Some combinations may not be allowed by third-party vendors. For example, many vendors have not certified their application servers with Oracle. As a result, AEM Forms on JEE also doesn’t support these combinations. To ensure that you choose the supported software versions, check the support matrix for the third-party vendors as well.
- AEM Forms on JEE does not support TarMK Cold Standby.
- AEM Forms on JEE does not support vertical clustering.
- AEM Forms on JEE doesn’t support MySQL database on a clustered environment.
- For the list of removed or updated platforms, see [AEM 6.5 Forms New Feature Summary](../../forms/using/whats-new.md) document.

### LDAP servers (optional) {#ldap-servers-optional}

<table>
 <tbody>
  <tr>
   <th><p><strong>Product (Base Version)</strong></p> </th>
   <th><p><strong>Supported Patch Definitions</strong></p> </th>
  </tr>
  <tr>
   <td>Microsoft Active Directory 2016</td>
   <td>Maintenance release and fix packs</td>
  </tr>
  <tr>
   <td><p>IBM® Tivoli Directory Server 6.4</p> </td>
   <td><p>Feature packs and interim fixes</p> </td>
  </tr>
 </tbody>
</table>

### Email servers (optional) {#email-servers-optional}

| Product                 |
| ----------------------- |
| Microsoft Exchange 2013 |
| Microsoft Office 365    |

### Content managers and corresponding connectors {#content-managers-and-corresponding-connectors}

<table>
 <tbody>
  <tr>
   <td><strong>Product<br /> </strong></td>
   <td><strong>Version</strong></td>
  </tr>
  <tr>
   <td>EMC Documentum</td>
   <td>7.3</td>
  </tr>
  <tr>
   <td>IBM Filenet</td>
   <td>5.5.2</td>
  </tr>
  <tr>
   <td>IBM Content Manager Server (Deprecated) </td>
   <td>8.5 Fix pack 2</td>
  </tr>
  <tr>
   <td> IBM Content Manager Client (Deprecated)</td>
   <td>8.5 </td>
  </tr>
  <tr>
   <td>Microsoft Sharepoint</td>
   <td>2016<br /> </td>
  </tr>
 </tbody>
</table>

### Support for Cordova {#support-for-cordova}

AEM Forms App now supports the Apache Cordova. Following are the platform-specific versions of Cordova that are supported:

- Apache Cordova 6.4.0
- Cordova iOS 4.3.0
- Cordova Android 6.0.0
- Cordova Windows 4.4.3

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
   <td><a href="https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html">Acrobat 2017 classic track</a> latest version (Deprecated)</td>
   <td>XPS, image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, DWG, DXF, and DWF</td>
  </tr>
  <tr>
   <td>Microsoft® Office 2019</td>
   <td>DOC, DOCX, XLS, XLSX, PPT, PPTX, RTF, and TXT</td>
  </tr>
  <tr>
   <td>Microsoft® Office 2016 (Deprecated)</td>
   <td>DOC, DOCX, XLS, XLSX, PPT, PPTX, RTF, and TXT</td>
  </tr>
  <tr>
   <td>WordPerfect 2020<br /> </td>
   <td>WP, WPD</td>
  </tr>
  <tr>
   <td>Microsoft® Office Visio 2019<br /> </td>
   <td>VSD, VSDX</td>
  </tr>
  <tr>
   <td>Microsoft® Office Visio 2016 (Deprecated)<br /> </td>
   <td>VSD, VSDX</td>
  </tr>
  <tr>
   <td>Microsoft® Publisher 2019<br /> </td>
   <td>PUB</td>
  </tr>
  <tr>
   <td>Microsoft® Publisher 2016 (Deprecated)<br /> </td>
   <td>PUB</td>
  </tr>
  <tr>
   <td>Microsoft® Project 2019<br /> </td>
   <td>MPP</td>
  </tr>
  <tr>
   <td>Microsoft® Project 2016 (Deprecated)<br /> </td>
   <td>MPP</td>
  </tr>
  <tr>
   <td>OpenOffice 4.1.10</td>
   <td>ODT, ODP, ODS, ODG, ODF, SXW, SXI, SXC, SXD, XLS, XLSX, DOC, DOCX, PPT, PPTX,image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, RTF, and TXT</td>
  </tr>
  <tr>
   <td>OpenOffice 4.1.2 (Deprecated)</td>
   <td>ODT, ODP, ODS, ODG, ODF, SXW, SXI, SXC, SXD, XLS, XLSX, DOC, DOCX, PPT, PPTX,image formats (BMP, GIF, JPEG, JPG, TIF, TIFF, PNG, JPF, JPX, JP2, J2K, J2C, JPC), HTML, HTM, RTF, and TXT</td>
  </tr>  
 </tbody>
</table>

>[!NOTE]
>
> PDF Generator supports only English, French, German, and Japanese versions of the supported operating systems and applications.
>
> In addition:
>
> - PDF Generator requires 32-bit version of [Acrobat 2020 classic track version 20.004.30006](https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html) or Acrobat 2017 version 17.011.30078 to perform the conversion.
> - PDF Generator supports only the 32-bit Retail version of Microsoft Office Professional Plus and other software required for conversion.
> - PDF Generator does not support Microsoft Office 365.
> - PDF Generator conversions for OpenOffice are supported only on Windows and Linux.
> - The OCR PDF, Optimize PDF, and Export PDF features are supported only on Windows.
> - A version of Acrobat is bundled with AEM Forms to enable PDF Generator functionality. The bundled version should only be accessed programmatically only with AEM Forms, during the term of the AEM Forms license, for use with AEM Forms PDF Generator. For more information, refer to AEM Forms product description as per your deployment ([On-Premise](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-on-premise.html) or [Managed Services](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-managed-services.html))”
>
> - PDF Generator service does not support Microsoft Windows 10.

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
   <td>Microsoft Windows Server</td>
   <td>Intel® Xeon® E5-2680, 2.4 GHz processor or equivalent<br /> VMWare ESX 5.1 or later<br /> RAM: 6 GB (64-bit OS with 64-bit JVM)<br /> Free disk space: 15GB of temporary space plus 22GB<br /> for AEM Forms on JEE</td>
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
     <li><strong>Memory: </strong>4 GB <br /> </li>
    </ul> </td>
  </tr>
 </tbody>
</table>

For additional requirements see:

- [System requirements for a single-server AEM Forms on JEE deployment](https://www.adobe.com/go/learn_aemforms_sysreq_single_65)
- [System requirements for a clustered AEM Forms on JEE deployment](https://www.adobe.com/go/learn_aemforms_sysreq_cluster_65)

## Supported Clients for AEM Forms on JEE {#supported-clients-for-aem-forms-on-jee}

### Workbench {#workbench}

<table>
 <tbody>
  <tr>
   <th><p><strong>Platform</strong></p> </th>
   <th><p><strong>Supported Patch Definitions</strong></p> </th>
  </tr>
  <tr>
   <td><p>Microsoft® Windows® 10 (Enterprise, Pro, Basic)</p> <p>32-bit or 64-bit version</p> <p> </p> </td>
   <td>Service packs and critical updates</td>
  </tr>
  <tr>
   <td>Microsoft® Windows® 2016 Server</td>
   <td>Service packs and critical updates</td>
  </tr>
 </tbody>
</table>

- Disk space for installation: 1.7 GB for Workbench only, 2.7 GB on a single drive for a full installation of Workbench, Designer, and the samples assembly 400 MB for temporary install directories - 200 MB in the user temp directory and 200 MB in the Windows temporary directory. If all of these locations reside on a single drive, there must be 1.5 GB of space available during installation. The files copied to the temporary directories are deleted when installation is complete.

- Memory for running Workbench: 2 GB of RAM
- Hardware requirement: Intel® Pentium® 4 or AMD equivalent, 1 GHz processor
- Minimum 1024 X 768 pixels or greater monitor resolution with 16-bit color or higher
- TCP/IPv4 or TCP/IPv6 network connection to the AEM Forms on JEE server
- You must have Administrative privileges to install Workbench on Windows. If you are installing using a non-administrator account, the installer will prompt you for the credentials for an appropriate account.

### Designer {#designer}

- Microsoft® Windows® 2016 Server, Microsoft® Windows® 2019 Server, or Microsoft® Windows® 10
- 1 GHz or faster processor with support for PAE, NX, and SSE2.
- 1 GB of RAM for 32-bit or 2 GB of RAM for 64-bit OS
- 16 GB disk space for 32-bit or 20 GB disk space for 64-bit OS
- Graphics memory - 128 MB of GPU (256 MB recommended)
- 2.35 GB of available hard-disk space
- 1024 X 768 pixels or greater monitor resolution
- Video hardware acceleration (optional)
- Acrobat Pro DC, Acrobat Standard DC, or Adobe Acrobat Reader DC.
- Administrative privileges to install Designer.

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
  <tr>
   <td>Acrobat 2017 (Classic track) (Deprecated)</td>
   <td>Version 17.011.30078 or later<br /> </td>
  </tr>
  
 </tbody>
</table>

>[!NOTE]
>
> The Acrobat DC product family introduces two tracks for both Acrobat and Reader which are essentially different products: “Classic” and “Continuous.” For details and a comparison of the two tracks, see [https://www.adobe.com/go/acrobatdctracks.](https://www.adobe.com/go/acrobatdctracks)

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
   <td><p>Microsoft Edge (Evergreen)</p> </td>
   <td><p>A: Supported</p> </td>
   <td><p>Service packs and updates</p> </td>
  </tr>
  <tr>
   <td><p>Mozilla Firefox (Evergreen)</p> </td>
   <td><p>A: Supported</p> </td>
   <td>All updates</td>
  </tr>
  <tr>
   <td>Microsoft Firefox ESR</td>
   <td>E: Expected to work</td>
   <td> All updates</td>
  </tr>
  <tr>
   <td><p>Google Chrome (Evergreen)</p> </td>
   <td><p>A: Supported</p> </td>
   <td>All updates</td>
  </tr>
  <tr>
   <td>Google Chrome and Firefox on MAC OS X</td>
   <td>A: Supported<br /> <br /> </td>
   <td>All updates</td>
  </tr>
  <tr>
   <td>Apple Safari 11.x</td>
   <td>A: Supported</td>
   <td>All updates</td>
  </tr>
  <tr>
   <td>Apple Safari 12.x<br /> <br /> </td>
   <td>A: Supported</td>
   <td>All updates</td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
> Some browser-related exceptions for desktops are as follows:
>
> - Safari is supported only on Macintosh OS X.
> - Workspace supports Safari 5.1 on Macintosh OS X 10.6 and 10.7 with Acrobat DC or later versions. For more information about Safari 5.1 compatibility with Adobe Reader, Acrobat, see [https://helpx.adobe.com/x-productkb/multi/safari-5-1-incompatible-reader.html](https://helpx.adobe.com/x-productkb/multi/safari-5-1-incompatible-reader.html).
> - Administration Console is not supported on Safari.
> - Correspondence Management does not support Windows® Internet Explorer 9.0 for AEM 6.1 forms.
> - Forms portal supports JAWS 14.0 screen reader software on Internet Explorer 11 for accessibility.

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
   <td>Safari on iOS 15.1 and above</td>
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
> - Forms Portal is supported on Safari on iPad only.

### AEM Forms app {#aem-forms-workspace-app}

#### Mobile device support {#mobile-device-support}

AEM Forms app is available on the following platforms:

| **Platform**      | **Supported Devices**                                                                                               |
| ----------------- | ------------------------------------------------------------------------------------------------------------------- |
| Apple iOS         | Apple iPhone, iPad, iPad Air, and iPad mini running iOS 15.1 and above.                                               |
| Google Android    | Android 5.1 and above. AEM Forms app is certified on 7- and 10-inch Samsung Galaxy tablets and popular smartphones. |
| Microsoft Windows | Microsoft Surface devices, tablets, laptops, and desktops running Microsoft Windows 10 operating system.            |

### Adobe Document Security Extension for Microsoft Office {#adobe-rights-management-extension-for-microsoft-office}

Click [here](https://www.adobe.com/products/livecycle/rightsmanagement/extension/downloads.html) to see the system requirements for Adobe Document Security Extension for Microsoft® Office.

### Exceptions to client support {#exceptions-to-client-support}

AEM Forms on JEE supports updates, patches, and fix packs on top of the specified major and minor version of supported software. However, update to the next major or minor version is not supported unless specified.

## Third-party patch support policy {#third-party-patch-support-policy}

The third-party software requirements for AEM Forms on JEE are documented in the “System Requirements” section of their respective product documents. All documentation can be accessed from [https://adobe.com/go/learn_aemforms_documentation_65](https://adobe.com/go/learn_aemforms_documentation_65) .

AEM Forms on JEE’s third-party reference platforms state the specific patch level of third-party infrastructure that was current during the development and release of AEM Forms on JEE, and from the minimum patch/service pack level of the infrastructure supported by that version of AEM Forms on JEE.

Adobe supports urgent or recommended patches issued by third-party vendors upon their release assuming that third-party vendors guarantee backward compatibility with the versions that AEM Forms on JEE supports. Adobe will only support patches released after the minimum patch level stated in the AEM Forms on JEE documentation.

In some cases, Adobe does not support third-party updates that change major functionality, and thus do not support full backward compatibility. For details on the supported updates, see [Supported patch definitions](https://helpx.adobe.com/aem-forms/aem-forms-third-party-software-patch.html) for specific vendor products and the patch types Adobe supports.

Under circumstances beyond Adobe’s control, third-party patches that claim backward compatibility may have negative impact on the Adobe products or customer environments. In such cases, Adobe recommends that customers assess the impact of any urgent patch from a third party before applying them to critical systems. Adobe will work with third parties using reasonable business efforts to resolve such issues, either through normal Adobe support programs or by third parties rectifying the issue in their patch. This does not guarantee that a newly released third-party patch that will be supported by Adobe will work as documented by the vendor or with AEM Forms on JEE.

Adobe reserves the right to change the third-party reference platforms supported by a AEM Forms on JEE release and their supported patch definitions at any given point.

Additional information for third-party patches can also be found by searching the Adobe Enterprise Support site for knowledgebase articles related to your product.

## Platform updates {#platform-updates}

The following platforms are marked as deprecated with AEM Forms 6.5.12.0 release on March 3, 2022:

- MongoDB Enterprise 4.0
- IBM DB2 11.1
- Oracle Database 12c Release 2
- MySQL 5.7.35
- Microsoft® SQL Server JDBC driver 6.2.1.0
- JBoss® Enterprise Application Platform (EAP) 7.1.4
- IBM Content Manager Server 8.5 Fix pack 2
- IBM Content Manager Client 8.5

The following platforms are marked as deprecated with AEM Forms 6.5.10.0 release on September 7, 2021:

- Adobe Acrobat 2017 - [Core support for Adobe Acrobat 2017 ends on June 6, 2022](https://helpx.adobe.com/support/programs/eol-matrix.html).
- Microsoft Windows Server 2016 (64-bit)
- Red Hat Enterprise Linux 7 (Kernel 3.x) (64-bit)
- Microsoft® Office 2016
- OpenOffice 4.1.2

>[!NOTE]
>
> The platforms marked as [deprecated on with AEM Forms 6.5.12.0 and 6.5.10.0 remain in support until AEM Forms 6.5 Service Pack 18 (6.5.18.0) release](https://helpx.adobe.com/support/programs/eol-matrix.html).

## Revision History {#revision-history}

- Mar 03, 2022

  - Removed support for the following:
    - IBM® J9 Virtual Machine (build 2.8, JRE 1.8.0)
    - Oracle Database 12c Release 2
    - Oracle Database 18c
    - Oracle Unified Directory (OUD) 11g Release 2
    - IBM Lotus Domino 9.0
    - IBM Filenet 5.2
    - Adobe Flash Player

- Oct 10, 2021

  - Changed supported version of iOS for AEM Forms App to iOS 15.1. The previous version was iOS 12.

- Sep 07, 2021
  - **Platform Updates**: [!DNL Adobe Experience Manager Forms] on JEE has added support for the following platforms:
    - [!DNL Adobe Acrobat 2020]
    - [!DNL Ubuntu 20.04]
    - [!DNL Open Office 4.1.10]
    - [!DNL Microsoft Office 2019]
    - [!DNL Microsoft Windows Server 2019]
    - [!DNL RHEL8]

  - Sep 09, 2020

    - Changed supported version of iOS for AEM Forms App to iOS 12. The previous version was iOS 11.
