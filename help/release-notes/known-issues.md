---
title: Known Issues
description: Release notes specific to the Known Issues with Adobe Experience Manager 6.5
exl-id: 736037cf-af8c-4ce2-969e-c100a939a038
---
# Known issues {#known-issues}

This page keeps a list of known issues from Adobe Experience Manager 6.5 that was released in April 2019.

[Contact support](https://helpx.adobe.com/support/experience-manager.html) if you need more information about the known issues.

## Platform {#platform}

* An issue is reported where the CRX-Quickstart, and its contents, are deleted.

  On each of these actions, ensure that the property `htmllibmanager.fileSystemOutputCacheLocation` is not an empty string:

  1. Calling `/libs/granite/ui/content/dumplibs.rebuild.html?invalidate=true`.
  2. Upgrading to AEM 6.5.
  3. Executing "lazy content migration" on AEM 6.5.

  A [Knowledge Base](https://helpx.adobe.com/experience-manager/kb/avoid-crx-quickstart-deletion-in-aem-6-5.html) article is available with further details and the workaround for this issue.

* If you are using JDK 11 with AEM 6.5 instance, some of the pages might display as blank after deploying some packages. The following error message displays in the log file:

   ```java
   *ERROR* [OsgiInstallerImpl] org.apache.sling.scripting.sightly bundle org.apache.sling.scripting.sightly:1.1.2.1_4_0 (558)[org.apache.sling.scripting.sightly.impl.engine.extension.use.JavaUseProvider(3345)] : Error during instantiation of the implementation object (java.lang.NoClassDefFoundError: jdk/internal/reflect/ConstructorAccessorImpl)
   java.lang.NoClassDefFoundError: jdk/internal/reflect/ConstructorAccessorImpl
   ```

To resolve this error:

  1. Stop the AEM instance. Go to `<aem_server_path_on_server>crx-quickstart\conf` and open the `sling.properties` file. Adobe recommends taking a backup of this file.

  1. Search for `org.osgi.framework.bootdelegation=`. Add `jdk.internal.reflect,jdk.internal.reflect.*` properties to display the result as.

  ```java
  org.osgi.framework.bootdelegation=sun.*,com.sun.*,jdk.internal.reflect,jdk.internal.reflect.*
  ```

1. Save the file and restart the AEM instance.

## Assets {#assets}

* **Search:** Search does not result any returns if the search string contains leading space(s) ([OAK-4786](https://issues.apache.org/jira/browse/OAK-4786))
* **Folder Metadata Schema**: After adding a choice button, the ID and Value field are not rendered as expected and the delete functionality does not work. (CQ-4261144)
* When renaming an asset, it is not possible to use a whitespace in the asset name. (CQ-4266403)

## Forms {#forms}

* When AEM Forms is installed on Linux operating system, Digital Signature with Hardware Security Module do not work. (CQ-4266721)  
* (AEM Forms on WebSphere only) The **Forms Workflow** &gt; **Task Search** option does not return any result if you search for an **Administrator** with **Username** as the search criteria. (CQ-4266457)  

* AEM Forms fails to convert TIF and TIFF files with JPEG compression to PDF Documents. (CQ-4265972)
* The **AEM Forms Assets Scanner** and **Letter to Interactive Communication Migration** options do not work on the **AEM Forms Migration** page. (CQ-4266572)  

* (JBoss 7 only) When you upgrade from a previous version to AEM 6.5 Forms and the previous version had processes (.lca) that created and used a copy of the default submit or default render process, HTML5 Forms using such processes (.lca) fails to perform the required actions. (CQ-4243928)
* In an adaptive from, when a form data model service is invoked from the rule editor to dynamically update values of the image choice component, values of the image choice component are not updated. (CQ-4254754)
* AEM Forms Designer installer requires the 32-bit version of [Visual C++ redistributable runtime package 2012](https://support.microsoft.com/en-in/help/2977003/the-latest-supported-visual-c-downloads) and [Visual C++ redistributable runtime packages 2013](https://support.microsoft.com/en-in/help/3179560/update-for-visual-c-2013-and-visual-c-redistributable-package). Ensure that the aforementioned redistributable runtime packages are installed before starting the installation. (CQ-4265668)

* PDF Generator does not support smart card-based authentication.  When an administrator enables the Group Policy `Interactive Logon: Require Smart card` on a Windows server, all the existing PDF Generator users are invalidated.

* When an adaptive form is configured to dynamically update values of a component and the publish instance that hosts the form is accessed through the dispatcher, the functionality to dynamically update values of a fields stop working. To resolve the issue, on the publish instance, open CRXDE, navigate to `/libs/fd/af/runtime/clientlibs/guideChartReducer`, and create the property listed in below.

  * Name: allowProxy
  * Type: Boolean
  * Value: true
  * Protected: False
  * Mandatory: False
  * Multiple: False
  * Auto Created: False

  The property enables the client libraries under the runtime folder to access proxies. (CQ-4268679)

* When AEM Forms is started, the `SAX Security Manager could not be setup` warning appears.
* When you open a PDF protected with AEM Forms Document Security on an Apple iOS or iPadOS running Adobe Acrobat Reader version 20.10.00.
* When you submit a form containing a standard HTML upload field from an Apple iOS device, sometimes, the content of the file is not sent and a 0-byte file is received at the other end. Apple iOS 15.1 provides a fix for the issue.  
