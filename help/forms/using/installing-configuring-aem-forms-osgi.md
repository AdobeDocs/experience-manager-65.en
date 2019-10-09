---
title: Install and configure data capture capabilities
seo-title: Install and configure data capture capabilities
description: Install and configure adaptive forms, PDF Forms, and HTML5 Forms. Configure Adobe Analytics and Adobe Target for adaptive forms to analyze usage of forms and target users based on their profile.
seo-description: Install and configure adaptive forms, PDF Forms, and HTML5 Forms. Configure Adobe Analytics and Adobe Target for adaptive forms to analyze usage of forms and target users based on their profile.
uuid: ce253b5a-eeb2-47d2-a6c9-e6f59384159a
contentOwner: khsingh
topic-tags: installing
discoiquuid: 1bb8360c-5543-484e-9712-590822211298
---

# Install and configure data capture capabilities {#install-and-configure-data-capture-capabilities}

Install and configure adaptive forms, PDF Forms, and HTML5 Forms. Configure Adobe Analytics and Adobe Target for adaptive forms to analyze usage of forms and target users based on their profile.

## Introduction {#introduction}

AEM Forms provides a set of forms to obtain data from end user: adaptive forms, HTML5 Forms, and PDF Forms. It also provides tools to list all the available forms on a webpage, analyze usage of forms, and target users based on their profile. These capabilities are included in AEM Forms add-on package. The add-on package is deployed on an Author or Publish instance of AEM.

**Adaptive forms:** These forms change appearance based on the screen size of the device, are engaging, and interactive in nature. Adaptive Forms can also integrate with Adobe Analytics, Adobe Sign, and Adobe Target. It enabled you to deliver personalized forms and process-oriented experiences to users based on their demography and other features. You can also integrate adaptive forms with Adobe Sign.

**PDF Forms** are suitable for pixel-perfect printing and digital information capture within a PDF document. In the digital avatar, you can use Adobe Acrobat or Acrobat Reader to fill these forms. You can host these forms on your website or use the forms portal to list these forms on an AEM site. You can also email these forms to others as attachments. These forms are best suited for desktop environments.

**HTML5 Forms** are the browser-friendly version of PDF Forms. HTML5 Forms are suitable for environments that do not support PDF plug-ins. HTML5 Forms enables the rendering of XFA-based forms on mobile devices and desktop browsers on which XFA-based PDF is not supported. These forms are best suited for tablets and desktop environments.

AEM Forms is a powerful enterprise-class platform and the data capture (adaptive forms, PDF Forms, and HTML5 Forms) is only one of the capability of AEM Forms. For the complete list of capabilities, see [Introduction to AEM Forms](/help/forms/using/introduction-aem-forms.md).

## Deployment Topology {#deployment-topology}

AEM Forms add-on package is an application deployed onto AEM. You require only a minimum of one AEM Author and AEM Publish instance to run AEM Forms data capture capabilities. The following topology is suggested to run AEM Forms AEM Forms data capture capabilities. For detailed information about the topology, see [Architecture and deployment topologies for AEM Forms](/help/forms/using/aem-forms-architecture-deployment.md).

![recommended-topology](assets/recommended-topology.png) 

## System Requirements {#system-requirements}

Before you begin to install and configure data capture capability AEM Forms, ensure that:

* Hardware and software infrastructure is in place. For a detailed list of supported hardware and software, see [technical requirements](/help/sites-deploying/technical-requirements.md).  

* Installation path of the AEM instance does not contain white-spaces.
* An AEM instance is up and running. In AEM terminology, an "instance" is a copy of AEM running on a server in the author or publish mode. You require at least two [AEM instances (one Author and one Publish)](/help/sites-deploying/deploy.md) to run AEM Forms data capture capabilities:

    * **Author**: An AEM instance used to create, upload, and edit content and to administer the website. Once content is ready to go live, it is replicated to the publish instance.
    * **Publish**: An AEM instance that serves the published content to the public over the internet or an internal network.

* Memory requirements are met. AEM Forms add-on package requires:

    * 15 GB of temporary space for Microsoft Windows-based installations.
    * 6 GB of temporary space for UNIX-based installations.

* Replication and reverse replication for the author and publish instances is set. For details, see [Replication](/help/sites-deploying/replication.md).
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

AEM Forms add-on package is an application deployed onto AEM. The package contains AEM Forms data capture and other capabilities. Perform the following steps to install the add-on package:

1. Log in to the [AEM server](http://localhost:4502) as an administrator and open [package share](http://localhost:4502/crx/packageshare). You require an Adobe ID to log in to the package share.
1. In [AEM package share](http://localhost:4502/crx/packageshare/login.html), search **[!UICONTROL AEM 6.4 Forms add-on packages]**, click the package applicable to your operating system, and click **[!UICONTROL Download]**. Read and accept the license agreement and click **[!UICONTROL OK]**. The download starts. Once downloaded, the word **[!UICONTROL Downloaded]** appears next to the package.

   You can also use the version number to search an add-on package. For version number of the latest package, see the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article.

1. After the download completes, click **[!UICONTROL Downloaded]**. You are redirected to package manager. In the package manager, search the downloaded package, and click **[!UICONTROL Install]**.

   If you manually download the package via the direct link listed in the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article, log in to the package manager, click **[!UICONTROL Upload Package]**, select the downloaded package, and click upload. After the package is uploaded, click package name, and click **[!UICONTROL Install]**.

1. After the package is installed, you are prompted to restart the AEM instance. **Do not immediately restart the server.** Before stopping the AEM Forms server, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the [AEM-Installation-Directory]/crx-quickstart/logs/error.log file and the log is stable.
1. Repeat steps 1-4 on all the Author and Publish instances.

## Post-installation configurations {#post-installation-configurations}

AEM Forms has a few mandatory and optional configurations. The mandatory configurations include configuring BouncyCastle libraries and serialization agent. The optional configurations include configuring dispatcher, Forms portal, Adobe Sign, Adobe Analytics, and Adobe Target.

### Mandatory post-installation configurations {#mandatory-post-installation-configurations}

#### Configure RSA and BouncyCastle libraries  {#configure-rsa-and-bouncycastle-libraries}

Perform the following steps on all the Author and Publish instances to boot delegate the libraries:

1. Stop the underlying AEM instance.
1. Open the [AEM installation directory]\crx-quickstart\conf\sling.properties file for editing.

   If you used [AEM installation directory]\crx-quickstart\bin\start.bat to start AEM, then edit the sling.properties located at [AEM_root]\crx-quickstart\.

1. Add the following properties to the sling.properties file:

   ```
   sling.bootdelegation.class.com.rsa.jsafe.provider.JsafeJCE=com.rsa.*
   sling.bootdelegation.class.org.bouncycastle.jce.provider.BouncyCastleProvider=org.bouncycastle.*
   ```

1. Save and close the file and start the AEM instance.
1. Repeat step 1-4 on all the Author and Publish instances.

#### Configure the serialization agent {#configure-the-serialization-agent}

Perform the following steps on all the Author and Publish instances to whitelist the package:

1. Open AEM Configuration Manager in a browser window. The default URL is `https://[server]:[port]/system/console/configMgr`.
1. Search and open **[!UICONTROL Deserialization Firewall Configuration]**.
1. Add the **[!UICONTROL sun.util.calendar]** package to the **[!UICONTROL whitelist]** field. Click **[!UICONTROL Save]**.
1. Repeat step 1-3 on all the Author and Publish instances.

### Optional post-installation configurations {#optional-post-installation-configurations}

#### Configure Dispatcher {#configure-dispatcher}

Dispatcher is caching and load balancing tool for AEM. AEM Dispatcher also helps to protect AEM server from attacks. You can increase the security of your AEM instance by using the Dispatcher in conjunction with an enterprise-class web server. If you use [Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html), then perform the following configurations for AEM Forms:

1. Configure access for AEM Forms:

   Open the dispatcher.any file for editing. Navigate to the filter section and add the following filter to the filter section:

   `/0025 { /type "allow" /glob "* /bin/xfaforms/submitaction*" } # to enable AEM Forms submission`

   Save and Close the file. For detailed information about filters, see [Dispatcher documentation](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html).

1. Configure the referrer filter service:

   Log in to the Apache Felix configuration manager as an administrator. The Default URL of the configuration manager is `https://[server]:[port_number]/system/console/configMgr`. In the **[!UICONTROL Configurations]** menu, select the **[!UICONTROL Apache Sling Referrer Filter]** option. In the Allow Hosts field, enter host name of the dispatcher to allow it as a referrer and click **[!UICONTROL Save]**. The format of the entry is `https://[server]:[port]`.

#### Configure Cache {#configure-cache}

Caching is a mechanism to shorten data access times, reduce latency, and improve input/output (I/O) speeds. Adaptive forms cache stores only HTML content and JSON structure of an adaptive form without saving any pre-filled data. It helps in reducing the time required to render an adaptive form.

* On using the adaptive forms cache, use the [AEM Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html) to cache client libraries (CSS and JavaScript) of an adaptive form.
* While developing custom components, keep the adaptive forms cache disabled on the server used for development.

Perform the following steps to configure the adaptive forms cache:

1. Go to AEM web console configuration manager at `https://[server]:[port]/system/console/configMgr`.
1. Click **[!UICONTROL Adaptive Form and Interactive Communication Web Channel Configuration]** to edit its configuration values. In the edit configuration values dialog, specify the maximum number of forms or documents an instance of the AEM Forms server can cache in the **[!UICONTROL Number of Adaptive Forms]** field. The default value is 100. Click **[!UICONTROL Save]**.

   >[!NOTE]
   >
   >To disable the cache, set the value in the Number of Adaptive Forms field to **0**. The cache is reset and all forms and documents are removed from the cache when you disable or change the cache configuration.

#### Configure SSL communcation for Form Data Model {#configure-ssl-communcation-for-form-data-model}

You can enable SSL communication for Form Data Model. To enable SSL communication for Form data model, before starting any AEM Forms instance, add certificates to Java Trust Store of all the instances. You can run the below command to add the certificates: ``

`keytool -import -alias <alias-name> -file <pathTo .cer certificate file> -keystore <<pathToJRE>\lib\security\cacerts>`

#### Configure Adobe Sign {#configure-adobe-sign}

Adobe Sign enables e-signature workflows for adaptive forms. E-signatures improve workflows to process documents for legal, sales, payroll, human resource management, and many more areas.

In a typical Adobe Sign and adaptive forms scenario, a user fills an adaptive form to apply for a service. For example, a credit card application and a citizen benefits form. When a user fills, submits, and signs the application form, the form is sent to the service provider for further action. Service provider reviews the application and uses Adobe Sign to mark the application approved. To enable similar electronic-signature workflows, you can integrate Adobe Sign with AEM Forms.

To use Adobe Sign with AEM Forms, [Integrate Adobe Sign with AEM Forms](/help/forms/using/adobe-sign-integration-adaptive-forms.md).

#### Configure Adobe Analytics {#configure-adobe-analytics}

AEM Forms integrates with Adobe Analytics that allows you to capture and track performance metrics for your published forms and documents. The objective behind analyzing these metrics is to make informed decisions based on data about the changes required to make forms or document more usable.

To use Adobe Analytics with AEM Forms, see [Configuring analytics and reports](/help/forms/using/configure-analytics-forms-documents.md).

#### Integrate Adobe Target {#integrate-adobe-target}

Your customers are likely to abandon a form if the experience it delivers is not engaging. While it is frustrating for the customers, it can also upturn the support volume and cost for your organization. It is critical as well as challenging to identify and provide the right customer experience that increases the conversion rate. AEM forms holds the key to this problem.

AEM forms integrates with Adobe Target, an Adobe Marketing Cloud solution, to deliver personalized and engaging customer experiences across multiple digital channels. To use Adobe Target to A/B test adaptive forms, [Integrate Adobe Target with AEM Forms](/help/forms/using/ab-testing-adaptive-forms.md#setupandintegratetargetinaemforms).

## Next steps {#next-steps}

You have configured an environment to use AEM Forms data capture capabilities. Now, the next steps towards using the capability are:

* [Create your first adaptive form](/help/forms/using/create-your-first-adaptive-form.md)
* [Create your first PDF form](https://helpx.adobe.com/content/dam/help/en/experience-manager/6-4/forms/pdf/designer-quickstart.pdf)
* [Introduction to HTML5 Forms](/help/forms/using/introduction.md)

