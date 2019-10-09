---
title: Deploying Communities
seo-title: Deploying Communities
description: How to deploy AEM Communities
seo-description: How to deploy AEM Communities
uuid: 1f7faf1a-a339-4eaa-b728-b9110cb350a8
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
content-type: reference
topic-tags: deploying
discoiquuid: d0249609-2a9c-4d3b-92ee-dbc5fbdeaac6
---

# Deploying Communities {#deploying-communities}

## Prerequisites {#prerequisites}

* [AEM 6.4 Platform](../../help/sites-deploying/deploy.md)

* AEM Communities license

* Optional licenses for:

    * [Adobe Analytics for Communities features](analytics.md)
    * [MongoDB for MSRP](msrp.md)
    * [Adobe Cloud for ASRP](asrp.md)

## Installation Checklist {#installation-checklist}

**For the [AEM platform](../../help/sites-deploying/deploy.md#what-is-aem)**

* Install latest [AEM 6.4 Updates](#aem-updates)

* If not using the default ports (4502, 4503), then [configure replication agents](#replication-agents-on-author)
* [replicate the crypto key](#replicate-the-crypto-key)
* If supporting globalization, [setup automated translation](../../help/sites-administering/translation.md)  
  
  (sample setup is provided for development)

**For the [Communities capability](overview.md)**

* If deploying a [publish farm](../../help/sites-deploying/recommended-deploys.md#tarmk-farm), [identify the primary publisher](#primary-publisher)

* [Enable the tunnel service](#tunnel-service-on-author)
* [Enable social login](social-login.md#adobe-granite-oauth-authentication-handler)
* [Configure Adobe Analytics](analytics.md)
* Setup a [default email service](email.md)
* Identify the choice for [shared UGC storage](working-with-srp.md) (**SRP**)

    * If MongoDB SRP [(MSRP)](msrp.md)

        * [Install and configure MongoDB](msrp.md#mongodb-configuration)
        * [Configure Solr](solr.md)
        * [Select MSRP](srp-config.md)

    * If relational database SRP [(DSRP)](dsrp.md)

        * [Install the JDBC driver for MySQL](#jdbc-driver-for-mysql)
        * [Install and configure MySQL for DSRP](dsrp-mysql.md)
        * [Configure Solr](solr.md)
        * [Select DSRP](srp-config.md)

    * If Adobe SRP [(ASRP)](asrp.md)

        * Work with your account representative for provisioning
        * [Select ASRP](srp-config.md)

    * If JCR SRP [(JSRP)](jsrp.md)

        * Not a shared UGC store:

            * UGC is never replicated
            * UGC only visible on AEM instance or cluster in which it was entered

        * Default is JSRP

  For the **[enablement feature](overview.md#enablement-community)**

    * [Install and configure FFmpeg](ffmpeg.md)
    * [Install the JDBC driver for MySQL](#jdbc-driver-for-mysql)
    * [Install AEM Communities SCORM-Engine](#scorm-package)
    * [Install and configure MySQL for enablement](mysql.md)

## Latest Releases {#latest-releases}

AEM 6.4 Communities GA ships with Communities package. To know about updates to AEM 6.4 [Communities](/help/release-notes/release-notes.md#experience-manager-communities), refer [AEM 6.4 Release Notes](/help/release-notes/release-notes.md#release-information).

### AEM 6.4 Updates {#aem-updates}

Starting in AEM 6.3, updates to Communities are delivered as part of AEM Cumulative Fix Packs and Service Packs.

For the latest updates to AEM 6.4, be sure to check [Adobe Experience Manager 6.4 Cumulative Fix Packs and Service Packs](https://helpx.adobe.com/experience-manager/aem-releases-updates.html).

### Version History {#version-history}

As on AEM 6.4 and beyond, AEM Communities features and hotfixes are part of AEM Communities cumulative fix packs and service packs. There are, therefore, no separate feature packs.

### JDBC driver for MySQL {#jdbc-driver-for-mysql}

Two Communities features use a MySQL database:

* For [enablement](enablement.md): recording SCORM activities and learners
* For [DSRP](dsrp.md): storing user generated content (UGC)

The MySQL connector must be obtained and installed separately.

The necessary steps are:

1. Download the ZIP archive from [https://dev.mysql.com/downloads/connector/j/](https://dev.mysql.com/downloads/connector/j/)

    * Version must be &gt;= 5.1.38

1. Extract mysql-connector-java-&lt;version&gt;-bin.jar (bundle) from the archive

1. Use the web console to install and start the bundle:

    * For example, http://localhost:4502/system/console/bundles
    * Select **`Install/Update`**
    * Browse... to select the bundle extracted from the downloaded ZIP archive
    * Check that *Oracle Corporation's JDBC Driver for MySQLcom.mysql.jdbc* is active, and start it if not (or check the logs)

1. If installing on an existing deployment after JDBC has been configured, then rebind JDBC to the new connector by resaving the JDBC configuration from the web console:

    * For example, http://localhost:4502/system/console/configMgr
    * Locate `Day Commons JDBC Connections Pool` configuration
    * Select to open
    * Select `Save`

1. Repeat steps 3 and 4 on all author and publish instances

Further information on installing bundles is found on the [Web Console](../../help/sites-deploying/configuring-web-console.md#bundles) page.

#### Example: Installed MySQL Connector Bundle {#example-installed-mysql-connector-bundle}

![chlimage_1-410](assets/chlimage_1-410.png) 

### SCORM Package {#scorm-package}

Shareable Content Object Reference Model (SCORM) is a collection of standards and specifications for e-learning. SCORM also defines how content may be packaged into a transferable ZIP file.

The AEM Communities SCORM engine is required for the [enablement](overview.md#enablement-community) feature. Scorm packages supported on AEM Communities 6.4 version are:

* **[ cq -social-  scorm -package, version 1.2.11](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/social/scorm/cq-social-scorm-pkg)**. This SCORM package is supported by all AEM 6.4 Communities versions.

* **[ cq -social-  scorm -package, version 2.2.2](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/social/scorm/cq-social-scorm-2017-pkg)** includes [SCORM 2017.1](https://rusticisoftware.com/blog/scorm-engine-2017-released/) engine. This SCORM package is supported AEM 6.4.2.x Communities onwards.

For a new installation of SCORM engine, the package containing [SCORM 2017.1](https://rusticisoftware.com/blog/scorm-engine-2017-released/) (which is [  cq -social-  scorm -package, version 2.2.2](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/social/scorm/cq-social-scorm-2017-pkg)) should be used. So that you are able to play learning resources supported by SCORM 2017.

<!--This section used to be an accordion until converted to straight Markdown. When accordions are enabled, revert-->

### To install a SCORM package for the first time

1.  Install the **[cq-social-scorm-package, version 2.2.2](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/social/scorm/cq-social-scorm-2017-pkg).**
1.  Download **`/libs/social/config/scorm/database_scormengine_data.sql`** from cq instance and execute it in mysql server to create an upgraded scormEngineDB schema.
1.  Add `/content/communities/scorm/RecordResults` in Excluded Paths property in CSRF filter from `https://<hostname>;:<port>/system/console/configMgr` on publishers.

Existing SCORM installations can be upgraded to [**cq-social-scorm-package, version 2.2.2**](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/social/scorm/cq-social-scorm-2017-pkg) (which uses [SCORM 2017.1](https://rusticisoftware.com/blog/scorm-engine-2017-released/)), if the authored course content requires SCORM 2017.1.

>[!NOTE]
>
>Upgrading to SCORM 2017.1 package requires migration of the existing database (as explained further).

<!--This section used to be an accordion until converted to straight Markdown. When accordions are enabled, revert-->

### To upgrade version of your SCORM engine

1. Take a back up of ScormEngineDB schema.
1. Install the **[cq-social-scorm-package, version 2.2.2](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq640/social/scorm/cq-social-scorm-2017-pkg).**
1. Download the package from `/libs/social/config/scorm/ScormEngine.zip` and extract the same.
1. Go to **Installer** folder of the extracted directory.
1. Update `SystemDatabaseConnectionString` with your `scorm db connection url` in file **[!UICONTROL EngineInstall.xml]**.  
1. Run mysql schema upgrade tool in Installer folder with the command:

    `java -Dlogback.configurationFile=logback.xml -cp "lib/*" RusticiSoftware.ScormContentPlayer.Logic.Upgrade.ConsoleApp EngineInstall.xml`
1. Monitor `engine_upgrade.log` file for any kind of error and schema upgrade status.
1. Add `/content/communities/scorm/RecordResults` in **[!UICONTROL Excluded Paths]** property in CSRF filter from `https://<hostname>:<port>/system/console/configMgr` on publishers.

### SCORM Logging {#scorm-logging}

As installed, all enablement activity is verbosely logged to the system console.

If desired, the log level can be set to WARN for the `RusticiSoftware.*` package.

For working with logs, see [Working with Audit Records and Log Files](../../help/sites-deploying/monitoring-and-maintaining.md#working-with-audit-records-and-log-files).

### AEM Advanced MLS {#aem-advanced-mls}

For the SRP collection (MSRP or DSRP) to support advanced multilingual search (MLS), new Solr plug-ins are required in addition to a custom schema and Solr configuration. All required items are packaged into a downloadable zip file.

The advanced MLS download (also known as 'phasetwo') is available from the Adobe repository:

* [AEM-SOLR-MLS-phasetwo](https://repo.adobe.com/nexus/content/repositories/releases/com/adobe/tat/AEM-SOLR-MLS-phasetwo/1.2.40/)

    * Version 1.2.40, April 6, 2016
    * Download AEM-SOLR-MLS-phasetwo-1.2.40.zip

For details and installation information, visit [Solr Configuration](solr.md) for SRP.

### About Links to Package Share {#about-links-to-package-share}

**Packages Visible in Adobe AEM Cloud**

The links to packages on this page require no running instance of AEM as they are to package share on `adobeaemcloud.com`. While the packages are viewable, the `Install`button is for installing the packages into an Adobe hosted site. If intending to install on a local AEM instance, selecting `Install`will result in an error.

**How to Install on Local AEM Instance**

To install the packages visible in `adobeaemcloud.com` on a local AEM instance, the package must first be downloaded to a local disk:

* Select the **[!UICONTROL Assets]** tab
* Select **[!UICONTROL download to disk]**

On the local AEM instance, use package manager (for example [http://localhost:4502/crx/packmgr/](http://localhost:4502/crx/packmgr/)), to upload to the local AEM's package repository.

Alternatively, accessing the package using package share from the local AEM instance (for example, [http://localhost:4502/crx/packageshare/](http://localhost:4502/crx/packageshare/)), the `Download`button will download to the local AEM instance's package repository.

Once in the local AEM instance's package repository, use package manager to install the package.

For more information, visit [How to Work With Packages](../../help/sites-administering/package-manager.md#package-share).

## Recommended Deployments {#recommended-deployments}

In AEM Communities, a common store is used to store user generated content (UGC) and is often referred to as the [storage resource provider (SRP)](working-with-srp.md). The recommended deployment centers on choosing an SRP option for the common store.

The common store supports moderation of, and analytics on, UGC in the publish environment while eliminating the need for [replication](sync.md) of UGC.

* [Community Content Store](working-with-srp.md): discusses the SRP storage options for AEM communities

* [Recommended Topologies](topologies.md): discusses the topology to use depending on use case and SRP choice

## Upgrading {#upgrading}

When upgrading to the AEM 6.4 platform from previous versions of AEM, it is important to read Upgrading to AEM 6.4.

In addition to upgrading the platform, read [Upgrading to AEM Communities 6.4](upgrade.md) to learn about Communities changes.

## Configurations {#configurations}

### Primary Publisher {#primary-publisher}

When the deployment chosen is a [publish farm](topologies.md#tarmk-publish-farm), then one AEM publish instance must be identified as the **`primary publisher`** for activities which should not occur on all instances, such as features that rely on **notifications** or **Adobe Analytics**.

By default, the `AEM Communities Publisher Configuration` OSGi configuration is configured with the **`Primary Publisher`** checkbox checked, such that all publish instances in a publish farm would self-identify as the primary.

Therefore, it is necessary to **edit the configuration on all secondary publish instances** to uncheck the **`Primary Publisher`** checkbox.

![chlimage_1-411](assets/chlimage_1-411.png)

For all other (secondary) publish instances in a publish farm:

* Sign in with administrator privileges
* Access the [web console](../../help/sites-deploying/configuring-osgi.md)

    * For example, [http://localhost:4503/system/console/configMgr](http://localhost:4503/system/console/configMgr)

* Locate the `AEM Communities Publisher Configuration`
* Select the edit icon
* Uncheck the **[!UICONTROL Primary Publisher]** box
* Select **[!UICONTROL Save]**

### Replication Agents on Author {#replication-agents-on-author}

Replication is used for site content created in the publish environment, such as community groups, as well as managing members and member groups from the author environment using the [tunnel service](#tunnel-service-on-author).

For the primary publisher, ensure the [Replication Agent Config](../../help/sites-deploying/replication.md) correctly identifies the publish server and authorized user. The default authorized user, `admin,` already has the appropriate permissions (is a member of `Communities Administrators`).

In order for some other user to have the appropriate permissions, they must be added as a member to the `administrators` user group (also a member of `Communities Administrators`).

There are two replication agents in the author environment that need the transport configuration to be correctly configured.

* Access the Replication console on author

    * From global navigation: **[!UICONTROL Tools > Deployment > Replication > Agents on author]**

* Follow the same procecure for both agents:

    * **Default Agent (publish)**
    * **Reverse Replication Agent (publish reverse)**

        1. Select the agent
        1. Select **[!UICONTROL edit]**
        1. Select the **[!UICONTROL Transport]** tab
        1. If not port `4503`, edit the **[!UICONTROL URI]** to specify the correct port
        1. If not user `admin`, edit the **[!UICONTROL User]** and **[!UICONTROL Password]** to specify a member of the `administrators` user group

The following images show the results of changing the port from 4503 to 6103 by:

#### Default Agent (publish) {#default-agent-publish}

![chlimage_1-412](assets/chlimage_1-412.png) 

#### Reverse Replication Agent (publish reverse) {#reverse-replication-agent-publish-reverse}

![chlimage_1-413](assets/chlimage_1-413.png) 

### Tunnel Service on Author {#tunnel-service-on-author}

When using the author environment to [create sites](sites-console.md), [modify site properties](sites-console.md#modifying-site-properties) or [manage community members](members.md), it is necessary to access members (users) registered in the publish environment, not users registered on author.

The tunnel service provides this access using the replication agent on author.

To enable the tunnel service:

* On **author**
* Sign in with administrative privileges
* If publisher is not localhost:4503 or transport user is not `admin`,  

  Then [configure the replication agent](#replication-agents-on-author)

* Access the [Web Console](../../help/sites-deploying/configuring-osgi.md)

    * For example, [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr)

* Locate the `AEM Communities Publish Tunnel Service`
* Select the edit icon
* Check the **[!UICONTROL enable]** box
* Select **[!UICONTROL Save]**

![chlimage_1-414](assets/chlimage_1-414.png) 

### Replicate the Crypto Key {#replicate-the-crypto-key}

There are two features of AEM Communities that require all AEM server instances to use the same encryption keys. These are [Analytics](analytics.md) and [ASRP](asrp.md).

As of AEM 6.3, the key material is stored in the file system and no longer in the repository.

In order to copy the key material from author to all other instances, it is necessary to:

* Access the AEM instance, typically an author instance, that contains the key material to copy

    * Locate the `com.adobe.granite.crypto.file` bundle in the local file system  

      For example,

        * `<author-aem-install-dir>/crx-quickstart/launchpad/felix/bundle21`
        * The `bundle.info` file will identify the bundle

    * Navigate into the data folder 

      For example,

        * `<author-aem-install-dir>/crx-quickstart/launchpad/felix/bundle21/data`

    * Copy the hmac and master files

* For each target AEM instance

    * Navigate into the data folder  

      For example,

        * `<publish-aem-install-dir>/crx-quickstart/launchpad/felix/bundle21/data`

    * Paste the 2 files previously copied
    * It is necessary to [refresh the Granite Crypto bundle](#refresh-the-granite-crypto-bundle) if the target AEM instance is currently running

>[!CAUTION]
>
>If another security feature has already been configured that is based on the crypto keys, then replicating the crypto keys could damage the configuration. For assistance, [contact customer care](https://helpx.adobe.com/marketing-cloud/contact-support.html).

#### Repository Replication {#repository-replication}

Having the key material stored in the repository, as was the case for AEM 6.2 and earlier, can be preserved by specifying the following system property on first startup of each AEM instance (which creates the initial repository):

* `-Dcom.adobe.granite.crypto.file.disable=true`

>[!NOTE]
>
>It is important to verify that the [replication agent on author](#replication-agents-on-author) is correctly configured.

With the key material stored in the repository, the manner for replicating the crypto key from author to other instances is as follows:

Using [CRXDE Lite](../../help/sites-developing/developing-with-crxde-lite.md):

* browse to [https://&lt;server&gt;:&lt;port&gt;/crx/de](http://localhost:4502/crx/de)
* select `/etc/key`
* open `Replication` tab
* select `Replicate`

* [refresh the Granite Crypto bundle](#refresh-the-granite-crypto-bundle)

![chlimage_1-415](assets/chlimage_1-415.png) 

#### Refresh the Granite Crypto Bundle {#refresh-the-granite-crypto-bundle}

* On each publish instance, access the [Web Console](../../help/sites-deploying/configuring-osgi.md)

    * For example, [https://&lt;server&gt;:&lt;port&gt;/system/console/bundles](http://localhost:4503/system/console/bundles)

* Locate `Adobe Granite Crypto Support` bundle (com.adobe.granite.crypto)
* Select **[!UICONTROL Refresh]**

![chlimage_1-416](assets/chlimage_1-416.png)

* After a moment, a **Success** dialog should appear:  

  `Operation completed successfully.`

### Apache HTTP Server {#apache-http-server}

If using the Apache HTTP server, ensure that you use the correct server name for all relevant entries.

In particular, be careful to use the correct server name, not `localhost`, in the `RedirectMatch`.

#### httpd.conf sample {#httpd-conf-sample}

```shell
<IfModule alias_module>
     # XAMPP does not have a favicon; this prevents any 404 errors which may arise.
     Redirect 404 /favicon.ico
     <Location /favicon.ico>
         ErrorDocument 404 "No favicon"
     </Location>

    # Return from "Sign Out" generates response header directing you to "/", generating a 404 error
    # The RedirectMatch resolves it correctly when modified for the target Community Site:
    RedirectMatch ^/$ https://[server name]/content/sites/engage/en.html
 ...
 </IfModule>
```

### Dispatcher {#dispatcher}

If using a Dispatcher, see:

* AEM's [Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher.html) documentation
* [Installing Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-install.html)
* [Configuring Dispatcher for Communities](dispatcher.md)
* [Known Issues](troubleshooting.md#dispatcher-refetch-fails)

## Related Communities Documentation {#related-communities-documentation}

* Visit [Administering Communities Sites](administer-landing.md) to learn about creating a community site, configuring community site templates, moderating community content, managing members, and configuring messaging.

* Visit [Developing Communities](communities.md) to learn about the social component framework (SCF) and customizing Communities components and features.

* Visit [Authoring Communities Components](author-communities.md) to learn how to author with and configure Communities components.

