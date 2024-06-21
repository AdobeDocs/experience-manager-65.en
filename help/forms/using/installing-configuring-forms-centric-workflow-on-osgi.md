---
title: Installing and Configuring Forms-centric workflow on OSGi
description: Install and configure AEM Forms Interactive Communications to create business correspondences, documents, statements, benefit notices, marketing mails, bills, and welcome kits.
topic-tags: installing
docset: aem65
role: Admin, User, Developer
exl-id: 4b24a38a-c1f0-4c81-bb3a-39ce2c4892b1
solution: Experience Manager, Experience Manager Forms
feature: Interactive Communication
---
# Installing and Configuring Forms-centric workflow on OSGi{#installing-and-configuring-forms-centric-workflow-on-osgi}

## Introduction {#introduction}

Enterprises collect and process data from multiple forms, back-end systems, and other data sources. The processing of data involves review and approval procedures, repetitive tasks, and data archiving. For example, reviewing a form and converting it to PDF document. When done manually, the repetitive tasks can take much time and numerous resources.

You can use [Forms-centric workflow on OSGi](../../forms/using/aem-forms-workflow.md) to rapidly build adaptive forms-based workflows. These workflows can help you automate review and approval workflows, business process workflows, and other repetitive tasks. These workflows also help process documents (create, assemble, distribute, and archive PDF documents, add digital signatures to limit access to documents, decode barcoded forms, and more) and use Adobe Sign signature workflow with forms and documents.

Once set up, these workflows can be triggered manually to complete a defined process or run programmatically when users submit a form or interactive communication. The capability is included in AEM Forms add-on package.

AEM Forms is a powerful enterprise-class platform. Forms-centric workflow on OSGi is only one of the capability of AEM Forms. For the complete list of capabilities, see [Introduction to AEM Forms](introduction-aem-forms.md).

>[!NOTE]
>
>With Forms-centric workflow on OSGi, you can rapidly build and deploy workflows for various tasks on the OSGi stack, without having to install the full-fledged Process Management capability on JEE stack. See a [comparison](capabilities-osgi-jee-workflows.md) of the Forms-centric AEM Workflows on OSGi and Process Management on JEE to learn the difference and similarities in the capabilities.
>
>After the comparison, If you choose to install the Process Management capability on JEE stack, see [Install or Upgrade AEM Forms on JEE](/help/forms/using/introduction-aem-forms.md) for detailed information about installing and configuring JEE stack and the Process Management capabilities.

## Deployment Topology {#deployment-topology}

AEM Forms add-on package is an application deployed onto AEM. You require only a minimum of one AEM Author or Processing instance (production author) to run the Forms-centric workflow on OSGi capability. A processing instance is a [hardened AEM Author](/help/forms/using/hardening-securing-aem-forms-environment.md) instance. Do not perform any actual authoring, like creating workflows or adaptive forms, on the production author.

The following topology is indicative topology to run AEM Forms Interactive Communications, Correspondence Management, AEM Forms data capture, and Forms-Centric workflow on OSGi capabilities. For detailed information about the topology, see [Architecture and deployment topologies for AEM Forms](/help/forms/using/aem-forms-architecture-deployment.md).

![recommended-topology](assets/recommended-topology.png)

AEM Forms Forms-centric workflow on OSGi runs AEM Inbox and AEM Workflow Model creation UI on the Author instances of AEM Forms.

## System Requirements {#system-requirements}

>[!NOTE]
>
>Skip to the [Next steps](../../forms/using/installing-configuring-forms-centric-workflow-on-osgi.md#next-steps) section of the document, if you have already installed AEM Forms on OSGi as explained in the [install and configure data capture capabilities](../../forms/using/installing-configuring-aem-forms-osgi.md) article.

Before you begin to install and configure Forms-centric workflow on OSGi, ensure that:

* Hardware and software infrastructure is in place. For a detailed list of supported hardware and software, see [technical requirements](/help/sites-deploying/technical-requirements.md).

* Installation path of the AEM instance does not contain white-spaces.
* An AEM instance is up and running. In AEM terminology, an "instance" is a copy of AEM running on a server in the author or publish mode. You require at least one AEM instance (Author or Processing) to run Forms-centric workflow on OSGi:

    * **Author**: An AEM instance used to create, upload, and edit content and to administer the website. Once content is ready to go live, it is replicated to the publish instance.
    * **Processing:** A processing instance is a [hardened AEM Author](/help/forms/using/hardening-securing-aem-forms-environment.md) instance. You can set up an Author instance and harden it after performing the installation.

    * **Publish**: An AEM instance that serves the published content to the public over the Internet or an internal network.

* Memory requirements are met. AEM Forms add-on package requires:

    * 15 GB of temporary space for Microsoft Windows-based installations.
    * 6 GB of temporary space for UNIX-based installations.

* Extra requirements for UNIX-based systems: If you are using the UNIX-based operating system, install the following packages from the installation media of the respective operating system.

<table>
 <tbody>
  <tr>
   <td>expat</td>
   <td>libxcb</td>
   <td>freetype</td>
   <td>libXau</td>
  </tr>
  <tr>
   <td>libSM</td>
   <td>zlib</td>
   <td>libICE</td>
   <td>libuuid</td>
  </tr>
  <tr>
   <td>glibc</td>
   <td>libXext</td>
   <td><p>nss-softokn-freebl</p> </td>
   <td>fontconfig</td>
  </tr>
  <tr>
   <td>libX11</td>
   <td>libXrender</td>
   <td>libXrandr</td>
   <td>libXinerama</td>
  </tr>
 </tbody>
</table>

## Install AEM Forms add-on package {#install-aem-forms-add-on-package}

AEM Forms add-on package is an application deployed onto AEM. The package contains Forms-centric workflow on OSGi and other capabilities. Perform the following steps to install the add-on package:

1. Open [Software Distribution](https://experience.adobe.com/downloads). You require an Adobe ID to log in to the Software Distribution.
1. Select **[!UICONTROL Adobe Experience Manager]** available in the header menu.
1. In the **[!UICONTROL Filters]** section:
   1. Select **[!UICONTROL Forms]** from the **[!UICONTROL Solution]** drop-down list.
   2. Select the version and type for the package. You can also use the **[!UICONTROL Search Downloads]** option to filter the results.
1. Select the package name applicable to your operating system, select **[!UICONTROL Accept EULA Terms]**, and select **[!UICONTROL Download]**.
1. Open [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html)  and click **[!UICONTROL Upload Package]** to upload the package.
1. Select the package and click **[!UICONTROL Install]**.

   You can also download the package via the direct link listed in the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article.

1. After the package is installed, you are prompted to restart the AEM instance. **Do not immediately restart the server.** Before stopping the AEM Forms server, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the [AEM-Installation-Directory]/crx-quickstart/logs/error.log file and the log is stable.

    >[!NOTE]
    >
    > It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

1. Repeat steps 1-7 on all the Author and Publish instances.

## Post-installation configurations {#post-installation-configurations}

AEM Forms has a few mandatory and optional configurations. The mandatory configurations include configuring BouncyCastle libraries and serialization agent. The optional configurations include configuring dispatcher and Adobe Target.

### Mandatory post-installation configurations {#mandatory-post-installation-configurations}

#### Configure RSA and BouncyCastle libraries  {#configure-rsa-and-bouncycastle-libraries}

Perform the following steps on all the Author and Publish instances to boot delegate the libraries:

1. Stop the underlying AEM instance.
1. Open the [AEM installation directory]\crx-quickstart\conf\sling.properties file for editing.

   If you used [AEM installation directory]\crx-quickstart\bin\start.bat to start AEM, then edit the sling.properties located at [AEM_root]\crx-quickstart\.

1. Add the following properties to the sling.properties file:

   ```shell
   sling.bootdelegation.class.com.rsa.jsafe.provider.JsafeJCE=com.rsa.*  
   ```

1. Save and close the file and start the AEM instance.
1. Repeat steps 1-4 on all the Author and Publish instances.

#### Configure the serialization agent {#configure-the-serialization-agent}

Perform the following steps on all the Author and Publish instances to add the package to the allowlist:

1. Open AEM Configuration Manager in a browser window. The default URL is https://'[server]:[port]'/system/console/configMgr.
1. Search and open **Deserialization Firewall Configuration**.
1. Add the **sun.util.calendar** package to the **allowlist** field. Click Save.
1. Repeat steps 1-3 on all the Author and Publish instances.

### Optional post-installation configurations {#optional-post-installation-configurations}

#### Configure Dispatcher {#configure-dispatcher}

Dispatcher is caching and load balancing tool for AEM. AEM Dispatcher also helps to protect AEM server from attacks. You can increase the security of your AEM instance by using the Dispatcher in conjunction with an enterprise-class web server. If you use [Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html), then perform the following configurations for AEM Forms:

1. Configure access for AEM Forms:

   Open the dispatcher.any file for editing. Navigate to the filter section and add the following filter to the filter section:

   `/0025 { /type "allow" /glob "* /bin/xfaforms/submitaction*" } # to enable AEM Forms submission`

   Save and Close the file. For detailed information about filters, see [Dispatcher documentation](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html).

1. Configure the referrer filter service:

   Log in to the Apache Felix configuration manager as an administrator. The Default URL of the configuration manager is https://'server':[port_number]/system/console/configMgr. In the **Configurations** menu, select the **Apache Sling Referrer Filter** option. In the Allow Hosts field, enter host name of the dispatcher to allow it as a referrer and click **Save**. The format of the entry is `https://'[server]:[port]'`.

#### Configure Cache {#configure-cache}

Caching is a mechanism to shorten data access times, reduce latency, and improve input/output (I/O) speeds. Adaptive forms cache stores only HTML content and JSON structure of an adaptive form without saving any pre-filled data. It helps in reducing the time required to render an adaptive form.

* On using the adaptive forms cache, use the [AEM Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html) to cache client libraries (CSS and JavaScript) of an adaptive form.
* While developing custom components, keep the adaptive forms cache disabled on the server used for development.

Perform the following steps to configure the adaptive forms cache:

1. Go to AEM web console configuration manager at `https://'[server]:[port]'/system/console/configMgr`.
1. Click **[!UICONTROL Adaptive Form and Interactive Communication Web Channel Configuration]** to edit its configuration values. In the edit configuration values dialog, specify the maximum number of forms or documents an instance of the AEM Forms server can cache in the **Number of Adaptive Forms** field. The default value is 100. Click **Save**.

   >[!NOTE]
   >
   >To disable the cache, set the value in the Number of Adaptive Forms field to **0**. The cache is reset and all forms and documents are removed from the cache when you disable or change the cache configuration.

#### Configure Adobe Sign {#configure-adobe-sign}

Adobe Sign enables e-signature workflows for adaptive forms. E-signatures improve workflows to process documents for legal, sales, payroll, human resource management, and many more areas.

In a typical Adobe Sign and Forms-centric workflow on OSGi scenario, a user fills an adaptive form to **apply for a service**. For example, a credit card application and a citizen benefits form. When a user fills, submits, and signs the application form, an approval/rejection workflow is started. The service provider reviews the application in AEM Inbox and uses Adobe Sign to electronically sign the application. To enable similar electronic-signature workflows, you can integrate Adobe Sign with AEM Forms.

To use Adobe Sign with AEM Forms, [Integrate Adobe Sign with AEM Forms](../../forms/using/adobe-sign-integration-adaptive-forms.md).

## Next steps {#next-steps}

You have configured an environment to use Forms-centric workflow on OSGi capabilities. Now, the steps toward using the capability are:

* [Using Forms-centric workflow on OSGi](../../forms/using/aem-forms-workflow.md)
* [Workflow Step Reference](/help/sites-developing/workflows-step-ref.md)
* [Post processing of letters and interactive communications](../../forms/using/submit-letter-topostprocess.md)
