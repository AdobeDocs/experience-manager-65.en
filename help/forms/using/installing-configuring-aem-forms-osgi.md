---
title: Install and configure data capture capabilities

description: Install and configure adaptive forms, PDF Forms, and HTML5 Forms. Configure Adobe Analytics and Adobe Target for adaptive forms to analyze usage of forms and target users based on their profile.


topic-tags: installing
products: SG_EXPERIENCEMANAGER/6.5/FORMS

docset: aem65

role: Admin, User, Developer
exl-id: 19b5765e-50bc-4fed-8af5-f6bb464516c8
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, OSGI
---
# Install and configure data capture capabilities{#install-and-configure-data-capture-capabilities}

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

Before you begin to install and configure data capture capability of AEM Forms, ensure that:

* Hardware and software infrastructure is in place. For a detailed list of supported hardware and software, see [technical requirements](/help/sites-deploying/technical-requirements.md).

* Installation path of the AEM instance does not contain white-spaces.
* An AEM instance is up and running. For Windows users, install the AEM instance in elevated mode. In AEM terminology, an "instance" is a copy of AEM running on a server in the author or publish mode. You require at least two [AEM instances (one Author and one Publish)](/help/sites-deploying/deploy.md) to run AEM Forms data capture capabilities:

    * **Author**: An AEM instance used to create, upload, and edit content and to administer the website. Once content is ready to go live, it is replicated to the publish instance.
    * **Publish**: An AEM instance that serves the published content to the public over the internet or an internal network.

* Memory requirements are met. AEM Forms add-on package requires:

    * 15 GB of temporary space for Microsoft Windows-based installations.
    * 6 GB of temporary space for UNIX-based installations.

* Replication and reverse replication for the author and publish instances is set. For details, see [Replication](/help/sites-deploying/replication.md).
* For UNIX-based systems:

    * Install the following 32-bit packages from the installation media:

<table>
 <tbody>
  <tr>
   <td>expat</td>
   <td>fontconfig</td>
   <td>freetype</td>
   <td>glibc</td>
  </tr>
  <tr>
   <td>libcurl</td>
   <td>libICE</td>
   <td>libicu</td>
   <td>libSM</td>
  </tr>
  <tr>
   <td>libuuid</td>
   <td>libX11</td>
   <td><p>libXau</p> </td>
   <td>libxcb</td>
  </tr>
  <tr>
   <td>libXext</td>
   <td>libXinerama</td>
   <td>libXrandr</td>
   <td>libXrender</td>
  </tr>
  <tr>
   <td>nss-softokn-freebl</td>
   <td>OpenSSL</td>
   <td>zlib</td>
   <td> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>* If OpenSSL is already installed on the server, upgrade it to the latest version.
>* Create libcurl.so, libcrypto.so, and libssl.so symlinks pointing to the latest version of the libcurl, libcrypto, and libssl libraries respectively.
>

* Install the following 64-bit package from the installation media:

    * libicu

* Install [Microsoft Visual Studio 2019 32-bit Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170).


## Install AEM Forms add-on package {#install-aem-forms-add-on-package}

AEM Forms add-on package is an application deployed onto AEM. The package contains AEM Forms data capture and other capabilities. Perform the following steps to install the add-on package:

1. Open [Software Distribution](https://experience.adobe.com/downloads). You require an Adobe ID to log in to the Software Distribution.
1. Select **[!UICONTROL Adobe Experience Manager]** available in the header menu.
1. In the **[!UICONTROL Filters]** section:
   1. Select **[!UICONTROL Forms]** from the **[!UICONTROL Solution]** drop-down list.
   2. Select the version and type for the package. You can also use the **[!UICONTROL Search Downloads]** option to filter the results.
1. Select the package name applicable to your operating system, select **[!UICONTROL Accept EULA Terms]**, and select **[!UICONTROL Download]**.
1. Open [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html)  and click **[!UICONTROL Upload Package]** to upload the package.
1. Select the package and click **[!UICONTROL Install]**.

   You can also download the package via the direct link listed in the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article.
1. After the package is installed, you are prompted to restart the AEM instance. **Do not immediately restart the server.** Before stopping the AEM Forms server, wait until the ServiceEvent REGISTERED and ServiceEvent UNREGISTERED messages stop appearing in the `[AEM-Installation-Directory]/crx-quickstart/logs/error.log` file and the log is stable.

    >[!NOTE]
    >
    > It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

1. Repeat steps 1-7 on all the Author and Publish instances.

### (Windows only) Automatic installation of Visual Studio redistributables {#automatic-installation-visual-studio-redistributables}

If you install an AEM instance in elevated mode, the 32-bit Visual Studio redistributables are installed automatically during the installation of AEM Forms add-on package.

To evaluate if the Visual Studio redistributables are installed automatically, open the `error.log` file available at the `/crx-repository/logs/` directory. The logs include the following message:

`Redist <service name> already installed on system, will not attempt re-installation`

If the redistributables fail to install, the logs include the following message:

`Current user does not have elevated privileges, aborting installation of redist <service name>`

To resolve the issue, restart the AEM server, install AEM in elevated mode, and then install the AEM Forms add-on package.

If the privilege check fails, the logs include the following message:

`Privilege escalation check failed with error: <error message>`

## Post-installation configurations {#post-installation-configurations}

AEM Forms has a few mandatory and optional configurations. The mandatory configurations include configuring BouncyCastle libraries and serialization agent. The optional configurations include configuring dispatcher, Forms portal, Adobe Sign, Adobe Analytics, and Adobe Target.

### Mandatory post-installation configurations {#mandatory-post-installation-configurations}

#### Configure RSA and BouncyCastle libraries  {#configure-rsa-and-bouncycastle-libraries}

Perform the following steps on all the Author and Publish instances to boot delegate the libraries:

1. Stop the underlying AEM instance.
1. Open the `[AEM installation directory]\crx-quickstart\conf\sling.properties` file for editing.

   If you used `[AEM installation directory]\crx-quickstart\bin\start.bat` to start AEM, then edit the sling.properties located at `[AEM_root]\crx-quickstart\`.

1. Add the following properties to the sling.properties file:

   ```shell
   sling.bootdelegation.class.com.rsa.jsafe.provider.JsafeJCE=com.rsa.*  
   ```

1. Save and close the file and start the AEM instance.
1. Repeat step 1-4 on all the Author and Publish instances.

#### Configure the serialization agent {#configure-the-serialization-agent}

Perform the following steps on all the Author and Publish instances to add the package to the allowlist:

1. Open AEM Configuration Manager in a browser window. The default URL is `https://'[server]:[port]'/system/console/configMgr`.
1. Search for **com.adobe.cq.deserfw.impl.DeserializationFirewallImpl.name** and open the configuration.
1. Add the **sun.util.calendar** package to the **allowlist** field. Click **Save**.
1. Repeat step 1-3 on all the Author and Publish instances.

### Optional post-installation configurations {#optional-post-installation-configurations}

#### Configure Dispatcher {#configure-dispatcher}

Dispatcher is Adobe Experience Manager's caching and/or load balancing tool that can be used in conjunction with an enterprise-class web server. If you use [Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html), then perform the following configurations for AEM Forms:

1. Configure access for AEM Forms:

   Open the dispatcher.any file for editing. Navigate to the filter section and add the following filter to the filter section:

   `/0025 { /type "allow" /glob "* /bin/xfaforms/submitaction*" } # to enable AEM Forms submission`

   Save and Close the file. For detailed information about filters, see [Dispatcher documentation](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html).

1. Configure the referrer filter service:

   Log in to the Apache Felix configuration manager as an administrator. The Default URL of the configuration manager is `https://[server]:[port_number]/system/console/configMgr`. In the **Configurations** menu, select the **Apache Sling Referrer Filter** option. In the Allow Hosts field, enter host name of the dispatcher to allow it as a referrer and click **Save**. The format of the entry is `https://[server]:[port]`.

#### Configure Cache {#configure-cache}

Caching is a mechanism to shorten data access times, reduce latency, and improve input/output (I/O) speeds. Adaptive forms cache stores only HTML content and JSON structure of an adaptive form without saving any pre-filled data. It helps in reducing the time required to render an adaptive form.

* On using the adaptive forms cache, use the [AEM Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-configuration.html) to cache client libraries (CSS and JavaScript) of an adaptive form.
* While developing custom components, keep the adaptive forms cache disabled on the server used for development.

Perform the following steps to configure the adaptive forms cache:

1. Go to AEM web console configuration manager at https://'[server]:[port]'/system/console/configMgr.
1. Click **Adaptive Form and Interactive Communication Web Channel Configuration** to edit its configuration values. In the edit configuration values dialog, specify the maximum number of forms or documents an instance of the AEM Forms server can cache in the **Number of Adaptive Forms** field. The default value is 100. Click **Save**.

   >[!NOTE]
   >
   >To disable the cache, set the value in the Number of Adaptive Forms field to **0**. The cache is reset and all forms and documents are removed from the cache when you disable or change the cache configuration.

#### Configure SSL communcation for Form Data Model {#configure-ssl-communcation-for-form-data-model}

You can enable SSL communication for Form Data Model. To enable SSL communication for Form data model, before starting any AEM Forms instance, add certificates to Java Trust Store of all the instances. You can run the below command to add the certificates: ``

`keytool -import -alias <alias-name> -file <pathTo .cer certificate file> -keystore <<pathToJRE>\lib\security\cacerts>`

#### Configure Adobe Sign {#configure-adobe-sign}

Adobe Sign enables e-signature workflows for adaptive forms. E-signatures improve workflows to process documents for legal, sales, payroll, human resource management, and many more areas.

In a typical Adobe Sign and adaptive forms scenario, a user fills an adaptive form to **apply for a service**. For example, a credit card application and a citizen benefits form. When a user fills, submits, and signs the application form, the form is sent to the service provider for further action. Service provider reviews the application and uses Adobe Sign to mark the application approved. To enable similar electronic-signature workflows, you can integrate Adobe Sign with AEM Forms.

To use Adobe Sign with AEM Forms, [Integrate Adobe Sign with AEM Forms](/help/forms/using/adobe-sign-integration-adaptive-forms.md).

#### Configure Adobe Analytics {#configure-adobe-analytics}

AEM Forms integrates with Adobe Analytics that lets you capture and track performance metrics for your published forms and documents. The objective behind analyzing these metrics is to make informed decisions based on data about the changes required to make forms or document more usable.

To use Adobe Analytics with AEM Forms, see [Configuring analytics and reports](/help/forms/using/configure-analytics-forms-documents.md).

#### Integrate Adobe Target {#integrate-adobe-target}

Your customers are likely to abandon a form if the experience it delivers is not engaging. While it is frustrating for the customers, it can also upturn the support volume and cost for your organization. It is critical and challenging to identify and provide the right customer experience that increases the conversion rate. AEM forms holds the key to this problem.

AEM forms integrates with Adobe Target, an Adobe Marketing Cloud solution, to deliver personalized and engaging customer experiences across multiple digital channels. To use Adobe Target to A/B test adaptive forms, [Integrate Adobe Target with AEM Forms](/help/forms/using/ab-testing-adaptive-forms.md#setupandintegratetargetinaemforms).

## Next steps {#next-steps}

You have configured an environment to use AEM Forms data capture capabilities. Now, the next steps towards using the capability are:

* [Create your first adaptive form](/help/forms/using/create-your-first-adaptive-form.md)
* [Create your first PDF form](https://www.adobe.com/go/learn_aemforms_designer_quick_start_65)
* [Introduction to HTML5 Forms](/help/forms/using/introduction.md)
