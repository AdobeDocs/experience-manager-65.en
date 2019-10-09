---
title: Set up and configure AEM Forms reference sites
seo-title: Set up and configure AEM Forms reference sites
description: AEM Forms reference sites showcase how you can use AEM Forms to implement end-to-end workflow in an organization.
seo-description: AEM Forms reference sites showcase how you can use AEM Forms to implement end-to-end workflow in an organization.
uuid: 087d58a1-d84e-49ac-a82d-4e7fc708f00f
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: introduction
discoiquuid: 2feb4a9c-57ad-4c6b-a572-0047bc409bbb
---

# Set up and configure AEM Forms reference sites {#set-up-and-configure-aem-forms-reference-sites}

AEM Forms provides reference site implementation to demonstrate how AEM Forms helps Financial Services Industry and Government organizations in transforming their complex transactions into simple and engaging digital experiences anywhere, anytime, on any device.

We.Finance and We.Gov reference sites draw real life use-cases to engage with existing and potential customers, right from the point of first touch to managing correspondences and transactions in a personalized and cost-effective manner.

The reference sites allow you to explore and showcase the following key capabilities of AEM Forms.

* Simplified authoring experience of engaging and responsive adaptive forms and interactive communications. 
* Interactive Communications to create interactive, personalized, and responsive customer communications that adapt to the device setting and layout.
* Data integration to connect to disparate data sources to prefill and submit form data through a form data model.
* Forms workflow to automate business processes and workflows.
* Advanced user data managing and processing capabilities.
* Integration with Adobe Sign to securely sign and submit adaptive forms.
* Integration with Adobe Target to serve targeted recommendations and perform A/B testing to maximize the ROI from a form.
* Integration with Adobe Analytics to measure the performance of a form or a campaign and take informed decisions.
* Enhanced form filling experience.

The reference sites provide reusable assets that you can use as templates to create your own assets.

* Integration with Adobe Sign to securely sign and submit adaptive forms.

* Integration with Adobe Sign to securely sign and submit adaptive forms.

## Prerequisites and steps to set up reference sites {#prerequisites-and-steps-to-set-up-reference-sites}

Before you set up the reference site, ensure that you have the following:

* **AEM essentials**

  AEM QuickStart, AEM Forms add-on package, and reference site packages. See [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) for add-on and reference sites packages details.

* **An SMTP service** 
  You can use any SMTP service.

* **Adobe Sign developer account and Adobe Sign API application**
  
  To use digital signing capabilities, Adobe Sign developer account is required. See [Adobe Sign](https://acrobat.adobe.com/us/en/why-adobe/developer-form.html).

* A running instance of Microsoft Dynamics 365 to integrate with AEM Forms. To run the reference site, you import the sample data into the Microsoft Dynamics instance to prefill the interactive communication used in the reference site.
* A running instance of AEM 6.4 with Forms add-on package. For more information, see [Installing and configuring AEM Forms](https://helpx.adobe.com/experience-manager/6-3/forms/using/installing-configuring-aem-forms-osgi.html).

Perform the following steps in the recommended sequence to set up and configure the reference sites.

<table> 
 <tbody> 
  <tr> 
   <th><strong>Step</strong></th> 
   <th><strong>Configure</strong></th> 
   <th><strong>Notes</strong></th> 
  </tr> 
  <tr> 
   <td><a href="#installaemforms">Install and configure AEM Forms</a></td> 
   <td>Author and Publish</td> 
   <td>Install and configure AEM Forms author and publish instances.</td> 
  </tr> 
  <tr> 
   <td><a href="#ssl">Configure SSL</a></td> 
   <td>Author and Publish<br /> </td> 
   <td>Enable HTTP over SSL for secure communications with Adobe Sign.</td> 
  </tr> 
  <tr> 
   <td><p><a href="#externalizer">Configure Day CQ Link Externalizer configuration</a></p> </td> 
   <td>Author and Publish<br /> </td> 
   <td><p>Reference Site use cases deliver emails for different transactions. This setting is required for Newsletter delivery via email. It ensures that URLs and Images point to the publish instance. </p> </td> 
  </tr> 
  <tr> 
   <td><a href="#cqmail">Configure Day CQ Mail Service</a></td> 
   <td>Author and Publish</td> 
   <td>Required for email communication.</td> 
  </tr> 
  <tr> 
   <td><a href="#xss">Override default XSS configuration</a></td> 
   <td>Publish</td> 
   <td>Used to override $, {, and } characters that are blocked by xss security.</td> 
  </tr> 
  <tr> 
   <td><a href="#aemds">Configure AEM DS settings</a></td> 
   <td>Author</td> 
   <td>Configure AEM DS for form submission on publish instance and processing workflows on the author instance.</td> 
  </tr> 
  <tr> 
   <td><a href="#refsite">Deploy reference sites packages</a></td> 
   <td>Author</td> 
   <td>Deploy reference sites packages on AEM Forms author instance.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/forms/using/setup-reference-sites.md#optional-import-sample-data-into-microsoft-dynamics">Import sample data into Microsoft Dynamics</a></td> 
   <td>Author and Publish</td> 
   <td>Import sample data for credit card application, home mortgage application, and home insurance application walkthrough</td> 
  </tr> 
  <tr> 
   <td><a href="/help/forms/using/setup-reference-sites.md#configure-oauth-cloud-service-for-microsoft-dynamics">Configure OAuth cloud service for Microsoft Dynamics</a></td> 
   <td>Author and Publish</td> 
   <td>Configure the OAuth cloud service in AEM Forms to enable communication between AEM Forms and Microsoft Dynamics. </td> 
  </tr> 
  <tr> 
   <td><a href="#scheduler">Configure Adobe Sign Scheduler</a></td> 
   <td>Author and Publish<br /> </td> 
   <td>Change the configuration of the scheduler to check status every two minutes.</td> 
  </tr> 
  <tr> 
   <td><a href="#sign-service">Configure Reference Site Adobe Sign Cloud Service</a></td> 
   <td>Author and Publish<br /> </td> 
   <td>A configuration that comes with reference sites packages and needs reconfiguration with valid credentials.</td> 
  </tr> 
  <tr> 
   <td><a href="#anonymous">Configure Forms Common Configuration Service for anonymous users</a></td> 
   <td>Publish</td> 
   <td>The configuration allows submission, sign and Document of Record generation for anonymous users.</td> 
  </tr> 
  <tr> 
   <td><a href="#fdm">Modify Rest Service Swagger File for Form Data Model</a></td> 
   <td>Author and Publish<br /> </td> 
   <td>Modify the service for your environment.</td> 
  </tr> 
 </tbody> 
</table>

## Install and configure AEM Forms {#install-and-configure-aem-forms}

Install and deploy AEM Forms as described in [Installing and configuring AEM Forms on OSGi](/help/forms/using/installing-configuring-aem-forms-osgi.md).

>[!NOTE]
>
>Configure replication and reverse replication agents if there are more than one publish instances or author and publish instances are on different machines.

## Configure SSL {#ssl}

SSL configuration is required to communicate with Adobe Sign servers. For detailed steps, see [Enabling HTTP Over SSL](/help/sites-administering/ssl-by-default.md).

>[!CAUTION]
>
>Do not configure force SSL on `/etc/map` folder.

## Configure Day CQ Link Externalizer configuration {#externalizer}

In AEM, the **Externalizer** is an OSGI service that allows you to programmatically transform a resource path (e.g. /path/to/my/page) into an external and absolute URL (for example, https://www.mycompany.com/path/to/my/page) by prefixing the path with a pre-configured DNS. See [Externalizing URLs](/help/sites-developing/externalizer.md).

>[!CAUTION]
>
>Do not externalize to HTTPS URL if you are using self-signed certificate for SSL.
>
>Also, use localhost instead of its hostname for local server.

Perform the following steps on both author and publish instances:

1. Go to OSGi Configuration at https://&lt;*hostname&gt;*:&lt;*port&gt;*/system/console/configMgr.
1. Find and tap **[!UICONTROL Day CQ Link Externalizer]** configuration.

   The Day CQ Link Externalizer dialog opens for editing the configuration.
   
1. In the Day CQ Link Externalizer dialog, in the Domains field:

    * On the author instance, specify a publish URL that can be accessed from an external system. For example, a hostname or a publishing web server.
    * On the publish instance, specify both the author and publish URLs.

1. On both author and publish instances, ensure that the local server URL is specified in the Domains field.
1. Tap **[!UICONTROL Save]**. Wait for a while for all services to restart.

## Configure Day CQ Mail Service {#cqmail}

Reference site implementation requires emails to be sent to sample users when they fill and submit forms. Configuring Day CQ Mail Service lets you provide SMTP service details to send automated emails to customers. See [Configuring Email Notifications](/help/sites-administering/notification.md).

Perform the following steps to configure mail service on the publish instance:

1. Go to OSGi Configuration at https://&lt;*hostname&gt;*:&lt;*port&gt;*/system/console/configMgr.
1. Find and tap **[!UICONTROL Day CQ Mail Service]** to open it for configuration.
1. Provide SMTP server hostname and port values.
1. Tap **[!UICONTROL Save]**.

>[!NOTE]
>
>You can use your corporate SMTP service or public services like Gmail. For configuring SMTP service, see SMTP service documentation.

## Override default XSS configuration {#xss}

The email templates for We.Finance reference site contain personalized links in emails. These links have placeholder as `${placeholder}`. These placeholders are replaced by actual values before sending emails. The default XSS protection configuration for AEM does not allow curly braces (**{ }**) in the URL in HTML content. However, you can override the default configuration by performing the following steps on publish instance:

1. Copy `/libs/cq/xssprotection/config.xml` to `/apps/cq/xssprotection/config.xml`.
1. Open `/apps/cq/xssprotection/config.xml`.
1. In the `common-regexps` section, modify the `onsiteURL` entry as follows and save the file.

   `<regexp name="onsiteURL" value="([\p{L}\p{N}\\\.\#@\$\{\}%\+&;\-_~,\?=/!\*\(\)]*|\#(\w)+)"/>`

>[!NOTE]
>
>Curly braces (**{ }**) are included as accepted characters in the URL in HTML content.

After configuring the SMTP server, try to fill a form using the Sarah Rose persona and save it as a draft. When you save as draft, you get an option to receive the draft using email. On tapping the **Send Email** button, if you receive an email with a link to the draft of the application, your email configuration is successful. Ensure that you log in using Sarah's credentials to see the draft.

## Configure AEM DS settings {#aemds}

AEM DS Service settings are required on the Publish instance for email communications in the reference site use cases. For detailed steps to configure AEM DS Service setup on the Publish instance, see [Configure AEM DS settings](/help/forms/using/configuring-the-processing-server-url-.md).

For AEM Forms reference sites, in the AEM DS Settings Service, specify URL of the publish server instead of the URL of the processing server.

>[!CAUTION]
>
>Do not put `/lc` in the processing server URL if you are configuring it for AEM Forms OSGi.

## Deploy reference sites packages {#refsite}

Install the following reference sites packages using package share.

* [AEM-FORMS-6.4-FSI-REF-SITE](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/fd/AEM-FORMS-6.4-FSI-REF-SITE)
* [AEM-FORMS-6.4-GOV-REF-SITE](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/fd/AEM-FORMS-6.4-GOV-REF-SITE )

To learn more about how to use packages and package share, see [How to Work With Packages](/help/sites-administering/package-manager.md).

After you have installed the packages and started the author and publish instances, visit the following URLs in your browser:

* `https://[server]:[port]/wegov`
* `https://[server]:[port]/wefinance`

If your installation is successful, you can access the We.Gov and We.Finance reference sites landing pages.

## (Optional) Import sample data into Microsoft Dynamics {#optional-import-sample-data-into-microsoft-dynamics}

The home mortgage application and auto insurance application reference sites are configured to use records from Microsoft Dynamics. The reference site package installs a custom entity and sample records that you can import into Microsoft Dynamics to run the reference site. Perform the following steps to migrate and set up the sample data:

To import the custom entity for auto insurance application:

1. Download the **WeFinanceAutoInsurance_1_0.zip** solution package from `https://[server]:[port]/content/aemforms-refsite-collaterals/we-finance/auto-insurance/ms-dynamics/WeFinanceAutoInsurance_1_0.zip` on your AEM author instance.
1. In your Microsoft Dynamics instance, go to **[!UICONTROL Settings &gt; Solutions]** and click **[!UICONTROL Import]**. Select and import the package.

To import the custom entity for auto insurance application:

1. Download the **AEMFormsFSIRefsite_1_0.zip** package from https://[author]:[port]/content/aemforms-refsite-collaterals/we-finance/home-mortgage/ms-dynamics/AEMFormsFSIRefsite_1_0.zip. Select and import the package.  

1. In your Microsoft Dynamics instance, go to **[!UICONTROL Settings &gt; Solutions]** and click **[!UICONTROL Import]**. Select and import the package.

To import the customer and insurance policy records:

1. Download the **We.Finance Customers.csv, We.Finance Auto Insurance Renewals.csv**, and **home mortgage** data files from the following locations on your AEM author instance:

    * `https://[server]:[port/content/aemforms-refsite-collaterals/we-finance/auto-insurance/ms-dynamics/We.Finance Customers.csv`
    * `https://[server]:[port/content/aemforms-refsite-collaterals/we-finance/auto-insurance/ms-dynamics/We.Finance Auto Insurance Renewals.csv`
    * `https://[server]:[port]/content/aemforms-refsite-collaterals/we-finance/home-mortgage/ms-dynamics/Sarah%20Rose%20Contact.csv`

1. In your Microsoft Dynamics instance, do the following:

    * Go to **[!UICONTROL Sales** &gt;  **We.Finance Customers]** and click **[!UICONTROL Import]**.
    * Go to **[!UICONTROL Sales** &gt;  **We.Finance Auto Insurance]** and click **[!UICONTROL Import]**.
    * Go to **[!UICONTROL Sales** &gt;  **We.Finance Home Mortgage]**  and click **[!UICONTROL Import]**.

## Configure OAuth cloud service for Microsoft Dynamics {#configure-oauth-cloud-service-for-microsoft-dynamics}

Configure the OAuth cloud service in AEM Forms to enable communication between AEM Forms and Microsoft Dynamics. Perform the following steps to configure the OAuth Cloud Service on AEM author and publish instances:

1. On AEM author instance, go to **[!UICONTROL Tools** &gt;  **Cloud Services** &gt; **Data Sources** &gt; **global]**. Tap **[!UICONTROL Refsite Dynamics Integration]** icon and tap **[!UICONTROL Properties]**. 
1. Go to Microsoft Azure Active Directory account. Add the copied cloud service configuration URL in the **[!UICONTROL Reply URL]** setting for your registered application. Save the configuration.
1. In the Authentication Settings tab, specify **[!UICONTROL Service Root]**, **[!UICONTROL Client Id]**, **[!UICONTROL Client Secret]**, and **[!UICONTROL Resource URL]** for your Microsoft Dynamics instance. Click **[!UICONTROL Connect to OAuth]** that redirects to the Microsoft Dynamics login page.
1. Provide your login credentials. Once logged in, you are redirected to the AEM Forms cloud service configuration page. Click **[!UICONTROL Save & Close]**. The cloud service configuration is saved. 
1. Go to **[!UICONTROL Forms** &gt;  **Data Integrations** &gt; **We.Finance]**. Select Auto Insurance (Dynamics) and click Edit. Microsoft Dynamics entities are listed under the Data Sources tab. Wait until all entities are fetched from Microsoft Dynamics and listed under the data sources tab.
1. Select the **[!UICONTROL AutoInsuranceRenewal entity]** and click **[!UICONTROL Test Model Object]**. In the input request section, specify the value for customer ID as “900001” and click **[!UICONTROL Test]**. The Output section displays the records fetched from Microsoft Dynamics for customer ID 900001.
1. In the input request section, specify the value for customer ID as “900001” and click **[!UICONTROL Test]**. The Output section displays the records fetched from Microsoft Dynamics for customer ID 900001.
1. Repeat steps 1-6 on the publish instance.

## Configure Adobe Sign Scheduler {#scheduler}

Do the following on both author and publish instances:

1. Go to AEM Web Configuration console at `https://[server]:[host]/system/console/configMgr`.
1. Find and tap **[!UICONTROL Adobe Sign Configuration Service]** to open it for configuration.
1. Configure **[!UICONTROL Status Update Scheduler Expression]** as **0 0/2 &ast; &ast; &ast; ?**.

   >[!NOTE]
   >
   >The above scheduler configuration checks the status of the Adobe Sign service every two minutes.

1. Tap **[!UICONTROL Save]**.

## Configure reference site Adobe Sign cloud service {#sign-service}

Do the following on both author and publish instances:

1. Go to **[!UICONTROL Tools** &gt;  **Cloud Services** &gt; **Adobe Sign** &gt; **global]**. Select **[!UICONTROL AEM Forms Reference Site Sign]** and tap **[!UICONTROL Properties]**.

   >[!CAUTION]
   >
   >Ensure that the https://[host]:[ssl_port]/mnt/overlay/adobesign/cloudservices/adobesign/properties.html URL is added to the redirect URL list of OAuth configuration of Adobe Sign API application.

1. Specify Client Id and secret of the Adobe Sign application OAuth configuration.
1. (Optional) Select the **[!UICONTROL Enable Adobe Sign for attachments also]** option, and tap **[!UICONTROL Connect to Adobe Sign]**. It appends the files attached to an adaptive forms to the corresponding Adobe Sign document sent for signing.
1. Tap **[!UICONTROL Connect to Adobe Sign]** and log in with your Adobe Sign credentials.

## Configure Forms Common Configuration Service {#anonymous}

Do the following on the publish instance to allow access to anonymous users:

1. Go to AEM Web Configuration console at `https://[server]:[port]/system/console/configMgr`.
1. Find and tap **[!UICONTROL Forms Common Configuration Service]** to open it for configuration.
1. Configure the **[!UICONTROL Allow]** field for **[!UICONTROL All Users]**.
1. Tap **[!UICONTROL Save]**.

## Modify Rest Service for Form Data Model {#fdm}

Do the following on both author and publish instances:

1. Go to CRXDE at `https://[server]:[port]/crx/de/index.jsp`.
1. Navigate to **/conf/global/settings/cloudconfigs/fdm/roi-rest/jcr:content/swaggerFile** and open the swagger file.
1. Update the host and port settings as per your environment.
1. Save the settings.
1. (**Author instance only**) Go to **[!UICONTROL Tools** > **Cloud Services** > **Data Sources** > **global]**. Select **[!UICONTROL roi-rest]** and tap **[!UICONTROL Properties]**. Tap **[!UICONTROL Authentication Settings]** and set **[!UICONTROL Authentication Type]** to **[!UICONTROL Basic Authentication]**. Specify `admin`/ `admin`as the username/password to access the service. Tap **[!UICONTROL Save & Close]**.

## Integrate with Marketing Cloud {#integrate-with-marketing-cloud}

You can integrate the AEM Forms with Adobe Analytics and Adobe Target. While Adobe Analytics helps you generate reports and analyze performance of adaptive forms, Adobe Target helps you deliver personalized experiences and perform A/B testing for adaptive forms.

Do the following to configure Adobe Analytics and Adobe Target in AEM Forms.

### Configure Adobe Analytics {#configure-adobe-analytics}

AEM Forms integration with Adobe Analytics allows you to monitor and analyze how your customers interact with your forms and documents. It helps you identify and fix problem areas and act to increase the conversion rate.

To experience this functionality in reference site, configure your Analytics account as described in [Configuring analytics and reports](/help/forms/using/configure-analytics-forms-documents.md).

To generate a report, seed data is bundled with the reference sites. Before you use seed data, do the following:

1. Ensure that We.Finance and We.Gov analytics configurations are available in the AEM Cloud Services. You can find cloud services in one of the following ways:

    * Navigate to **[!UICONTROL Tools>Cloud Services>Legacy Cloud Services]** or browse to https://&lt;host&gt;:&lt;port&gt;/libs/cq/core/content/tools/cloudservices.html.
    * In the **[!UICONTROL Cloud Services]** page, under **[!UICONTROL Adobe Analytics]** section, click `Show Configurations`. You can see We.Finance and We.Gov configurations available. Click to open the configuration. In the configuration page, click **[!UICONTROL Edit]**. Provide valid Company, Username, Shared Secret (Password) and Data Center and click **[!UICONTROL Connect to Analytics]**. Once you get Connection successful dialog, click **[!UICONTROL OK]** on the configuration dialog. Configure the framework under the Analytics configuration as described in the [Configuring Analytics and Reports](/help/forms/using/configure-analytics-forms-documents.md).

1. Navigate to https://&lt;*host*&gt;:&lt;*port*&gt;/system/console/configMgr and do the following:

    * In the **[!UICONTROL Web Console Configuration]** page, find and click **[!UICONTROL AEM Forms Analytics Configuration]**.
    * In the **[!UICONTROL SiteCatalyst Framework]** field of the AEM Forms Analytics Configuration dialog, select we-finance(we-finance) or we-gov(we-gov).
    * Click **[!UICONTROL Save]** and let the page refresh.

1. Navigate to forms manager at https://&lt;host&gt;:&lt;port&gt;/aem/forms and do the following:

    * Open the We.Finance or We.Gov folder, and select the form for which you want to see the report.
    * Click Enable Analytics in the Actions Toolbar. After you have enabled analytics for the form, click Analytics Report. You can see a blank report generated. After a blank report is generated, you have to provide seed data shipped with refsite package to generate analytics report for demo purpose.

   Reference sites provide analytics reporting with seed data for credit card, home mortgage, and child support use cases. For configuration of seed data, see [We.Finance reference site walkthrough](/help/forms/using/finance-reference-site-walkthrough.md) and [We.Gov reference site walkthrough](/help/forms/using/gov-reference-site-walkthrough.md).

### Configure Target {#configure-target}

The reference site showcases the integration of AEM Forms with Adobe Target that allows you to include targeted and personalized content in adaptive documents. It also enables creating A/B tests for adaptive forms.

To experience the integration in the reference site, do the following to configure Target in AEM:

1. Start the author quickstart with the jvm argument `-Dabtesting.enabled=true` to enable A/B testing on the server.

   **Note**: If the AEM instance is running on JBoss, which is started as a service from Turnkey installation, add the `-Dabtesting.enabled=true` parameter in the following entry in the `jboss\bin\standalone.conf.bat` file, : 

   `set "JAVA_OPTS=%JAVA_OPTS% -Dadobeidp.serverName=server1 -Dfile.encoding=utf8 -Djava.net.preferIPv4Stack=true -Dabtesting.enabled=true"`   

1. Access https://&lt;*hostname*&gt;:&lt;*port*&gt;/libs/cq/core/content/tools/cloudservices.html.

1. In the **[!UICONTROL Adobe Target]** section, click **[!UICONTROL Show Configurations]**. You can see the We.Finance Target Configuration available. Click to open the configuration. In the configuration page, click **[!UICONTROL Edit]**. The **[!UICONTROL Edit Component]** dialog for the configuration opens.

1. Specify your Client Code, Email and Password associated with your Target account. Select API type as **[!UICONTROL REST]**.
1. Click **[!UICONTROL Connect to Adobe target]**. Once the Target account is configured successfully, click **[!UICONTROL OK]**. You can see the packaged configuration has a Target Framework.

1. Go to https://&lt;*hostname*&gt;:&lt;*port*&gt;/system/console/configMgr.

1. Click **[!UICONTROL AEM Forms Target Configuration]**.
1. Select a Target framework.
1. In the **[!UICONTROL Target URLs]** field, specify the URL to AEM Forms. For example: https://&lt;*hostname*&gt;:&lt;*port*&gt;.

1. Click **[!UICONTROL Save]**.

Credit Card Application and Home Mortgage Application use cases demonstrate how to perform A/B testing and showcase a report for demo purpose. For walkthroughs, see [We.Finance reference site walkthrough](/help/forms/using/finance-reference-site-walkthrough.md).

## Next step {#next-step}

Now you are all set to explore the reference site. For more information about reference site workflow and steps, see:

* [We.Finance reference site walkthrough](/help/forms/using/finance-reference-site-walkthrough.md)
* [We.Gov reference site walkthrough](/help/forms/using/gov-reference-site-walkthrough.md)  

* [Employee self-service reference site walkthrough](/help/forms/using/employee-self-service-reference-site.md)

