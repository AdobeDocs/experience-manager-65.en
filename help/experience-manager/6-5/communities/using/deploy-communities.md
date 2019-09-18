---
title: Deploying Communities
seo-title: Deploying Communities
description: How to deploy AEM Communities
seo-description: How to deploy AEM Communities
uuid: d2da3c1c-cae1-4e72-b57c-d3d7626d239d
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
content-type: reference
topic-tags: deploying
discoiquuid: ea5d606a-8578-4915-b889-fbf316e8055e
index: y
internal: n
snippet: y
---

# Deploying Communities{#deploying-communities}

## Prerequisites {#prerequisites}

* [AEM 6.5 Platform](../../../6-5/sites/deploying/using/deploy.md)

* AEM Communities license

* Optional licenses for :

    * [Adobe Analytics for Communities features](../../../6-5/communities/using/analytics.md)
    * [MongoDB for MSRP](/6-5/communities/using/msrp.md)
    * [Adobe Cloud for ASRP](../../../6-5/communities/using/asrp.md)

## Installation Checklist {#installation-checklist}

**For the [AEM platform](../../../6-5/sites/deploying/using/deploy.md#what-is-aem)**

* install latest [AEM 6.5 Updates](#aem64updates)  

* if not using the default ports (4502, 4503), then [configure replication agents](#replication-agents-on-author)
* [replicate the crypto key](#replicate-the-crypto-key)
* if supporting globalization, [setup automated translation](../../../6-5/sites/administering/using/translation.md)  
  (sample setup is provided for development)

**For the [Communities capability](../../../6-5/communities/using/overview.md)**

* if deploying a [publish farm](../../../6-5/sites/deploying/using/recommended-deploys.md#tarmk-farm), [identify the primary publisher](#primary-publisher)

* [enable the tunnel service](#tunnel-service-on-author)
* [enable social login](/6-5/communities/using/social-login.md#adobe-granite-oauth-authentication-handler)
* [configure Adobe Analytics](../../../6-5/communities/using/analytics.md)
* setup a [default email service](/6-5/communities/using/email.md)
* identify the choice for [shared UGC storage](../../../6-5/communities/using/working-with-srp.md) (**SRP**)

    * if MongoDB SRP [(MSRP)](/6-5/communities/using/msrp.md)

        * [install and configure MongoDB](/6-5/communities/using/msrp.md#mongodb-configuration)
        * [configure Solr](/6-5/communities/using/solr.md)
        * [select MSRP](/6-5/communities/using/srp-config.md)

    * if relational database SRP [(DSRP)](/6-5/communities/using/dsrp.md)

        * [install the JDBC driver for MySQL](#jdbc-driver-for-mysql)
        * [install and configure MySQL for DSRP](/6-5/communities/using/dsrp-mysql.md)
        * [configure Solr](/6-5/communities/using/solr.md)
        * [select DSRP](/6-5/communities/using/srp-config.md)

    * if Adobe SRP [(ASRP)](../../../6-5/communities/using/asrp.md)

        * work with your account representative for provisioning
        * [select ASRP](/6-5/communities/using/srp-config.md)

    * if JCR SRP [(JSRP)](/6-5/communities/using/jsrp.md)

        * not a shared UGC store :

            * UGC is never replicated
            * UGC only visible on AEM instance or cluster in which it was entered

        * default is JSRP

  **For the ** [**enablement feature**](../../../6-5/communities/using/overview.md#enablement-community)

    * [install and configure FFmpeg](/6-5/communities/using/ffmpeg.md)
    * [install the JDBC driver for MySQL](#jdbc-driver-for-mysql)
    * [install AEM Communities SCORM-Engine](#scorm-package)
    * [install and configure MySQL for enablement](/6-5/communities/using/mysql.md)

## Latest Releases {#latest-releases}

AEM 6.5 Communities GA ships with Communities package. To know about updates to AEM 6.5 [Communities](../../../6-5/release-notes.md#experiencemanagercommunities), refer [AEM 6.5 Release Notes](../../../6-5/release-notes.md#communities-release-notes.html).

### AEM 6.5 Updates {#aem-updates}

Starting in AEM 6.4, updates to Communities are delivered as part of AEM Cumulative Fix Packs and Service Packs.

For the latest updates to AEM 6.5, see [Adobe Experience Manager 6.4 Cumulative Fix Packs and Service Packs](/aem-releases-updates.md).

### Version History {#version-history}

As on AEM 6.4 and beyond, AEM Communities features and hotfixes are part of AEM Communities cumulative fix packs and service packs. There are, therefore, no separate feature packs.

### JDBC driver for MySQL {#jdbc-driver-for-mysql}

Two Communities features use a MySQL database :

* for [enablement](/6-5/communities/using/enablement.md) : recording SCORM activities and learners
* for [DSRP](/6-5/communities/using/dsrp.md) : storing user generated content (UGC)

The MySQL connector must be obtained and installed separately.

The necessary steps are :

1. download the ZIP archive from [https://dev.mysql.com/downloads/connector/j/](https://dev.mysql.com/downloads/connector/j/)

    * version must be &gt;= 5.1.38

1. extract mysql-connector-java-&lt;version&gt;-bin.jar (bundle) from the archive
1. use the web console to install and start the bundle :

    * for example, http://localhost:4502/system/console/bundles
    * select **`Install/Update`**
    * Browse... to select the bundle extracted from the downloaded ZIP archive
    * check that* Oracle Corporation's JDBC Driver for MySQLcom.mysql.jdbc* is active, and start it if not (or check the logs)

1. if installing on an existing deployment after JDBC has been configured, then rebind JDBC to the new connector by resaving the JDBC configuration from the web console :

    * for example, http://localhost:4502/system/console/configMgr
    * locate `Day Commons JDBC Connections Pool` configuration
    * select to open
    * select `Save`

1. repeat steps 3 and 4 on all author and publish instances

Further information on installing bundles is found on the [Web Console](/6-5/sites/deploying/using/configuring-web-console.md#bundles) page.

#### Example : Installed MySQL Connector Bundle {#example-installed-mysql-connector-bundle}

![](assets/chlimage_1-181.png) 

### SCORM Package {#scorm-package}

<!--
Comment Type: annotation
Last Modified By: mgulati
Last Modified Date: 2018-10-29T07:19:36.581-0400
Updated the topic as per engineering suggestions.
-->

Shareable Content Object Reference Model (SCORM) is a collection of standards and specifications for e-learning. SCORM also defines how content may be packaged into a transferable ZIP file.

The AEM Communities SCORM engine is required for the [enablement](/6-4/communities/using/overview.md#enablement-community) feature. Scorm packages supported on AEM 6.5 Communities:

* [cq-social-scorm-package, version 2.3.7](https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/social/scorm/cq-social-scorm-pkg) which includes the [SCORM 2017.1](https://rusticisoftware.com/blog/scorm-engine-2017-released/) engine.

<details> 
 <summary>To install a SCORM package</summary> 
 <ol> 
  <li><p>Install the <a href="https://www.adobeaemcloud.com/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/cq650/social/scorm/cq-social-scorm-pkg" target="_blank">cq-social-scorm-package, version 2.3.7</a><strong> </strong>from the Package Share<strong>.</strong></p> </li> 
  <li><p>Download <strong><span class="code">/libs/social/config/scorm/database_scormengine_data.sql</span></strong> from cq instance and execute it in mysql server to create an upgraded scormEngineDB schema.</p> </li> 
  <li><p>Add <span class="code">/content/communities/scorm/RecordResults</span> in Excluded Paths property in CSRF filter from <strong>http://&amp;lt;hostname&amp;gt;:&amp;lt;port&amp;gt;/system/console/configMgr</strong> on publishers.</p> </li> 
 </ol> 
</details>

#### SCORM Logging {#scorm-logging}

As installed, all enablement activity is verbosely logged to the system console.

If desired, the log level can be set to WARN for the `RusticiSoftware.*` package.

For working with logs, see [Working with Audit Records and Log Files](../../../6-5/sites/deploying/using/monitoring-and-maintaining.md#working-with-audit-records-and-log-files).

### AEM Advanced MLS {#aem-advanced-mls}

For the SRP collection (MSRP or DSRP) to support advanced multilingual search (MLS), new Solr plug-ins are required in addition to a custom schema and Solr configuration. All required items are packaged into a downloadable zip file.

The advanced MLS download (also known as 'phasetwo') is available from the Adobe repository :

* [AEM-SOLR-MLS-phasetwo](https://repo.adobe.com/nexus/content/repositories/releases/com/adobe/tat/AEM-SOLR-MLS-phasetwo/1.2.40/)

    * version 1.2.40, April 6, 2016
    * download AEM-SOLR-MLS-phasetwo-1.2.40.zip

For details and installation information, visit [Solr Configuration](/6-5/communities/using/solr.md) for SRP.

### About Links to Package Share {#about-links-to-package-share}

**Packages Visible in Adobe AEM Cloud**

The links to packages on this page require no running instance of AEM as they are to package share on `adobeaemcloud.com`. While the packages are viewable, the `Install`button is for installing the packages into an Adobe hosted site. If intending to install on a local AEM instance, selecting `Install`will result in an error.

**How to Install on Local AEM Instance**

To install the packages visible in `adobeaemcloud.com` on a local AEM instance, the package must first be downloaded to a local disk :

* select the **Assets** tab
* select **download to disk**

On the local AEM instance, use package manager (for example [http://localhost:4502/crx/packmgr/](http://localhost:4502/crx/packmgr/)), to upload to the local AEM's package repository.

Alternatively, accessing the package using package share from the local AEM instance (for example, [http://localhost:4502/crx/packageshare/](http://localhost:4502/crx/packageshare/)), the `Download`button will download to the local AEM instance's package repository.

Once in the local AEM instance's package repository, use package manager to install the package.

For more information, visit [How to Work With Packages](../../../6-5/sites/administering/using/package-manager.md#package-share).

## Recommended Deployments {#recommended-deployments}

In AEM Communities, a common store is used to store user generated content (UGC) and is often referred to as the [storage resource provider (SRP)](../../../6-5/communities/using/working-with-srp.md). The recommended deployment centers on choosing an SRP option for the common store.

The common store supports moderation of, and analytics on, UGC in the publish environment while eliminating the need for [replication](../../../6-5/communities/using/sync.md) of UGC.

* [Community Content Store](../../../6-5/communities/using/working-with-srp.md) : discusses the SRP storage options for AEM communities

* [Recommended Topologies](/6-5/communities/using/topologies.md) : discusses the topology to use depending on use case and SRP choice

## Upgrading {#upgrading}

When upgrading to the AEM 6.5 platform from previous versions of AEM, it is important to read [Upgrading to AEM 6.5](../../../6-5/sites/deploying/using/upgrade.md).

In addition to upgrading the platform, read [Upgrading to AEM Communities 6.5](../../../6-5/communities/using/upgrade.md) to learn about Communities changes.

## Configurations {#configurations}

### Primary Publisher {#primary-publisher}

When the deployment chosen is a [publish farm](/6-5/communities/using/topologies.md#tarmk-publish-farm), then one AEM publish instance must be identified as the **`primary publisher`** for activities which should not occur on all instances, such as features that rely on **notifications **or **Adobe Analytics**.

By default, the `AEM Communities Publisher Configuration` OSGi configuration is configured with the **`Primary Publisher`** checkbox checked, such that all publish instances in a publish farm would self-identify as the primary.

Therefore, it is necessary to **edit the configuration on all secondary publish instances** to uncheck the **`Primary Publisher`** checkbox.

![](assets/chlimage_1-182.png)

For all other (secondary) publish instances in a publish farm :

* sign in with administrator privileges
* access the [web console](/6-5/sites/deploying/using/configuring-osgi.md)

    * for example, [http://localhost:4503/system/console/configMgr](http://localhost:4503/system/console/configMgr)

* locate the `AEM Communities Publisher Configuration`
* select the edit icon
* uncheck the **Primary Publisher** box
* select **Save**

### Replication Agents on Author {#replication-agents-on-author}

Replication is used for site content created in the publish environment, such as community groups, as well as managing members and member groups from the author environment using the [tunnel service](#tunnel-service-on-author).

For the primary publisher, ensure the [Replication Agent Config](../../../6-5/sites/deploying/using/replication.md) correctly identifies the publish server and authorized user. The default authorized user, `admin,` already has the appropriate permissions (is a member of `Communities Administrators`).

In order for some other user to have the appropriate permissions, they must be added as a member to the `administrators` user group (also a member of `Communities Administrators`).

There are two replication agents in the author environment that need the transport configuration to be correctly configured.

* access the Replication console on author

    * from global navigation : **Tools, Deployment, Replication, Agents on author**

* follow the same procecure for both agents :

    * **Default Agent (publish) **
    * **Reverse Replication Agent (publish reverse)**

        1. select the agent
        1. select **edit**
        1. select the **Transport** tab
        1. if not port `4503`, edit the **URI** to specify the correct port
        
        1. if not user `admin`, edit the **User** and **Password** to specify a member of the `administrators` user group

The following images show the results of changing the port from 4503 to 6103 by :

#### Default Agent (publish) {#default-agent-publish}

![](assets/chlimage_1-183.png) 

#### Reverse Replication Agent (publish reverse) {#reverse-replication-agent-publish-reverse}

![](assets/chlimage_1-184.png) 

### Tunnel Service on Author {#tunnel-service-on-author}

When using the author environment to [create sites](../../../6-5/communities/using/sites-console.md), [modify site properties](../../../6-5/communities/using/sites-console.md#modifying-site-properties) or [manage community members](/6-5/communities/using/members.md), it is necessary to access members (users) registered in the publish environment, not users registered on author.

The tunnel service provides this access using the replication agent on author.

To enable the tunnel service :

* on **author**
* sign in with administrative privileges
* if publisher is not localhost:4503 or transport user is not `admin`,  
  then [configure the replication agent](#replication-agents-on-author)

* access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

    * for example, [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr)

* locate the `AEM Communities Publish Tunnel Service`
* select the edit icon
* check the **enable **box
* select **Save**

![](assets/chlimage_1-185.png) 

### Replicate the Crypto Key {#replicate-the-crypto-key}

There are two features of AEM Communities that require all AEM server instances to use the same encryption keys. These are [Analytics](../../../6-5/communities/using/analytics.md) and [ASRP](../../../6-5/communities/using/asrp.md).

As of AEM 6.3, the key material is stored in the file system and no longer in the repository.

In order to copy the key material from author to all other instances, it is necessary to :

* access the AEM instance, typically an author instance, that contains the key material to copy

    * locate the `com.adobe.granite.crypto.file` bundle in the local file system  
      for example,

        * `<author-aem-install-dir>/crx-quickstart/launchpad/felix/bundle21`
        * the `bundle.info` file will identify the bundle

    * navigate into the data folder  
      for example,

        * `<author-aem-install-dir>/crx-quickstart/launchpad/felix/bundle21/data`

    * copy the hmac and master files

* for each target AEM instance

    * navigate into the data folder  
      for example,

        * `<publish-aem-install-dir>/crx-quickstart/launchpad/felix/bundle21/data`

    * paste the 2 files previously copied
    * it is necessary to [refresh the Granite Crypto bundle](#refresh-the-granite-crypto-bundle) if the target AEM instance is currently running

>[!CAUTION]
>
>If another security feature has already been configured that is based on the crypto keys, then replicating the crypto keys could damage the configuration. For assistance, [contact customer care](https://helpx.adobe.com/marketing-cloud/contact-support.html).

#### Repository Replication {#repository-replication}

Having the key material stored in the repository, as was the case for AEM 6.2 and earlier, can be preserved by specifying the following system property on first startup of each AEM instance (which creates the initial repository) :

* `-Dcom.adobe.granite.crypto.file.disable=true`

>[!NOTE]
>
>It is important to verify that the [replication agent on author](#replication-agents-on-author) is correctly configured.

With the key material stored in the repository, the manner for replicating the crypto key from author to other instances is as follows :

Using [CRXDE Lite](../../../6-5/sites/developing/using/developing-with-crxde-lite.md) :

* browse to [http://&lt;server&gt;:&lt;port&gt;/crx/de](http://localhost:4502/crx/de)
* select `/etc/key`
* open `Replication` tab
* select `Replicate`

* [refresh the Granite Crypto bundle](#refresh-the-granite-crypto-bundle)

![](assets/chlimage_1-186.png) 

#### Refresh the Granite Crypto Bundle {#refresh-the-granite-crypto-bundle}

* on each publish instance, access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

    * for example, [http://&lt;server&gt;:&lt;port&gt;/system/console/bundles](http://localhost:4503/system/console/bundles)

* locate `Adobe Granite Crypto Support` bundle (com.adobe.granite.crypto)
* select **Refresh**

![](assets/chlimage_1-187.png)

* after a moment, a **Success **dialog should appear :  
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
    # The RedirectMatch resolves it correctly when modified for the target Community Site :
    RedirectMatch ^/$ http://[server name]/content/sites/engage/en.html
 ...
 </IfModule>
```

### Dispatcher {#dispatcher}

If using a Dispatcher, see :

* AEM's [Dispatcher](/dispatcher/using/dispatcher.md) documentation
* [Installing Dispatcher](/dispatcher/using/dispatcher-install.md)
* [Configuring Dispatcher for Communities](/6-5/communities/using/dispatcher.md)
* [Known Issues](/6-5/communities/using/troubleshooting.md#dispatcher-refetch-fails)

<!--
Comment Type: remark
Last Modified By: Silviu Raiman (raiman)
Last Modified Date: 2018-10-23T11:35:00.488-0400
<p>Changed the Dispatcher download link due to CQDOC-13423.</p>
-->

## Related Communities Documentation {#related-communities-documentation}

* Visit [Administering Communities Sites](/6-5/communities/using/administer-landing.md) to learn about creating a community site, configuring community site templates, moderating community content, managing members, and configuring messaging.

* Visit [Developing Communities](/6-5/communities/using/communities.md) to learn about the social component framework (SCF) and customizing Communities components and features.

* Visit [Authoring Communities Components](../../../6-5/communities/using/author-communities.md) to learn how to author with and configure Communities components.

