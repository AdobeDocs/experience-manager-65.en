---
title: OSGi Configuration Settings
seo-title: OSGi Configuration Settings
description: This article details the OSGi configuration settings (listed according to bundle) that are relevant to project implementation. The list acts as a guideline and it is not exhaustive.
seo-description: This article details the OSGi configuration settings (listed according to bundle) that are relevant to project implementation. The list acts as a guideline and it is not exhaustive.
uuid: 192d3287-ec99-403b-bab0-45721e4e3abd
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: configuring
content-type: reference
discoiquuid: ed3a858c-7a43-4515-a2ff-43ca465c7d7d
docset: aem65

feature: Configuring
---

# OSGi Configuration Settings{#osgi-configuration-settings}

[OSGi](https://www.osgi.org/) is a fundamental element in the technology stack of AEM. It is used to control the composite bundles of AEM and their configuration.

OSGi "*provides the standardized primitives that allow applications to be constructed from small, reusable and collaborative components. These components can be composed into an application and deployed*".

This allows easy management of bundles as they can be stopped, installed, started individually. The interdependencies are handled automatically. Each OSGi Component (see the [OSGi Specification](https://www.osgi.org/Specifications/HomePage)) is contained in one of the various bundles. When working with AEM there are several methods of managing the configuration settings for such bundles; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for more details and the recommended practices.

The following OSGi configuration settings (listed according to bundle) are relevant to project implementation. Not all the listed settings need adjusting, some are mentioned to help you understand how AEM operates.

>[!CAUTION]
>
>The list is intended to act as a guideline and is not exhaustive. Not all bundles are listed, nor all parameters for some of the bundles that are.
>
>The configuration necessary will vary from project to project.
>
>Please see the Web console for values used and detailed information about parameters.

>[!NOTE]
>
>The OSGi Configuration Diff tool, part of the [AEM Tools](https://helpx.adobe.com/experience-manager/kb/tools/aem-tools.html), can be used to list the default OSGi configurations.

>[!NOTE]
>
>Further bundles may be required for specific areas of functionality within AEM. In these cases, configuration details can be found on the page related to the appropriate functionality.

**AEM Replication Event Listener** Configure:

* The **Run Modes**, in which replication events will be distributed to listeners. For example, if defined as author, then this is the system that will "initiate" the replication.

* The run mode **publish** needs to be added if the project code processes replication events (reverse replication) in a publish environment. For example, when the dispatcher is used to flush from the publish environment or when standard replication to other publish instances occurs.

**AEM Repository change listener** Configure:

* The **Paths**, locations to listen for repository events ready for distribution.

**CRX Sling Client Repository** Configure access to the underlying content repository.

* The **Admin Password** should be changed after installation to ensure the [security](/help/sites-administering/security-checklist.md) of your instance.
* Other changes should not be necessary and care must be taken as they can affect access to the repository.

**Wiki Mail Service** Configure the email settings for emails sent by a wiki.

**Apache Felix OSGi Management Console** Configure:

* **Plugins**, the main navigation items (console plugins) to be available in the **Apache Felix Web Management Console** as top level menu items. Disable any you do not need as each requires space and resources.

>[!CAUTION]
>
>Be sure to configure the following:
>
>**User Name** and **Password**, the credentials for accessing the Apache Felix Web Management Console itself.
>The password must be changed after the initial installation to ensure the [security](/help/sites-administering/security-checklist.md) of your instance.

>[!NOTE]
>
>This configuration should be made using the Felix Console as it is needed at startup - before the repository is available.

**Apache Sling Customizable Request Data Logger** Configure:

* **Logger Name** and **Log Format** to configure the location and format of request and access logging (default: `request.log`). This log file is essential when analyzing performance or debugging functionality related to the web chain.
  This is paired with the [Apache Sling Request Logger](#apacheslingrequestlogger).

For further information see [AEM Logging](/help/sites-deploying/configure-logging.md) and [Sling Logging](https://sling.apache.org/site/logging.html).

**Apache Sling Eventing Thread Pool** Configure:

* **Min Pool Size** and **Max Pool Size**, the size of the pool used to hold event threads.

* **Queue Size**, the maximum size of the thread queue if the pool is exhausted.
  The recommended value is `-1` as this sets the queue to unlimited; if a limit is set then losses might occur when it is exceeded.

* Changing these settings can help performance in scenarios with a high number of events; for example, heavy AEM DAM or Workflow usage.
* Values specific to your scenario should be established using tests.
* These settings can affect the performance of your instance, so do not change them without reason and due consideration.

**Apache Sling GET Servlet** Configure some aspects of rendering:

* **Auto Index** to enable/disable directory rendering for browsing.
* **Enable** (or disable) default renditions, such as **HMTL**, **Plain Text**, **JSON** or **XML**.
  You should not disable JSON.

>[!NOTE]
>
>This setting is automatically configured for production instances if you run AEM in [Production Ready Mode](/help/sites-administering/production-ready.md).

**Apache Sling Java Script Handler** Configure settings for the compilation of .java files as scripts (servlets).

Certain settings can affect performance, these should be disabled where possible, in particular for a production instance.

* S**ource VM** and **Target VM**, define the JDK version as that used as the runtime JVM

* for production instances:

    * disable **Generate Debug Info**

**Apache Sling JCR Installer** These parameters probably do not need configuration, but can be useful to know when developing or debugging. For example the installation folder(s) can be useful for checking in/out or creating a package.

* **Installation folders name regexp** and **Max hierarchy depth of install folders** - specify where, and to which depth, repository folders are searched for resources to be installed. When a wildcard is used (as in .&#42;/install) all appropriate matches will be searched, for example, `/libs/sling/install` and `/libs/cq/core/install`.

* **Search Path**, list of paths that jcrinstall searches for resources to be installed, together with a number indicating the weighting factor for that path.

**Apache Sling Job Event Handler** Configure parameters that manage job scheduling:

* **Retry interval**, **Maximum Retries**, **Maximum Parallel Jobs**, **Acknowledge Wait Time**, amongst others.

* Changing these settings can improve performance in scenarios with a high number of jobs; for example, heavy usage of AEM DAM and Workflows.
* Values specific to your scenario should be established using tests.
* Do not change these settings without reason, only change after due consideration.

**Apache Sling JSP Script Handler** Configure performance relevant settings for the JSP script handler. To improve performance you should disable as much as possible.

In particular for production instances:

* disable **Generate Debug Info**
* disable **Keep Generated Java**
* disable **Mapped Content**
* disable **Display Source Fragments**

>[!NOTE]
>
>This setting is automatically configured for production instances if you run AEM in [Production Ready Mode](/help/sites-administering/production-ready.md).

**Apache Sling Logging Configuration** Configure:

* **Log Level** and **Log File**, to define the location and log level of the central logging configuration (error.log). The level can be set to one of `DEBUG`, `INFO`, `WARN`, `ERROR` and `FATAL`.

* **Number of Log Files** and **Log File Threshold** to define the size and version rotation of the log file.

* **Message Pattern** defines the format of the log messages.

For further information see [AEM Logging](/help/sites-deploying/configure-logging.md#global-logging) and [Sling Logging](https://sling.apache.org/site/logging.html).

**Apache Sling Logging Logger Configuration (Factory Configuration)** Configure:

* **Log Level**, **Log File** and **Message Format** to define details of the log file and messages.

* **Logger** to define the category; for example, only log for com.day.cq.

* By using **Factory Configurations**, any number of additional configurations can be added to cater with the various log levels and categories needed.
* Such configurations are helpful during development; for example, to log TRACE messages for a specific service in a specific log file.
* Such configurations are helpful in a production environment; for example, to have messages about a specific service logged to an individual log file for easier monitoring.

For further information see [AEM Logging](/help/sites-deploying/configure-logging.md) and [Sling Logging](https://sling.apache.org/site/logging.html).

**Apache Sling Logging Writer Configuration (Factory Configuration)** Configure:

* **Log File** to define the existence of a log file.
* **Number of Log Files** to define the version rotation.

* The writer can be used by a **Apache Sling Logging Logger Configuration** configuration.

* Such configurations are helpful during development; for example, to log TRACE messages for a specific service in a specific log file.
* Such configurations are helpful in a production environment; for example, to have messages about a specific service logged to an individual log file for easier monitoring.

For further information see [AEM Logging](/help/sites-deploying/configure-logging.md) and [Sling Logging](https://sling.apache.org/site/logging.html).

**Apache Sling Main Servlet** Configure:

* **Number of Calls per Request** and **Recursion Depth** to protect your system against infinite recursion and excessive script calls.

**Apache Sling MIME Type Service** Configure:

* **MIME Types** to add those required by your project to the system. This allows a `GET` request on a file to set the correct content-type header for linking the file type and application.

**Apache Sling Referrer Filter** To address known security issues with Cross-Site Request Forgery (CSRF) in CRX WebDAV and Apache Sling you need to configure the Referrer filter.

The referrer filter service is an OSGi service that allows you to configure:

* which http methods should be filtered
* whether an empty referrer header is allowed
* and a list of servers to be allowed in addition to the server host.

See the [Security Checklist - Issues with Cross-Site Request Forgery](/help/sites-administering/security-checklist.md#protect-against-cross-site-request-forgery) for further details.

>[!NOTE]
>
>The Apache Sling Referrer Filter is dependent on the installation of a quick fix package.

**Apache Sling Request Logger** Configure:

* various parameters to define how requests are logged.
* **Enable Request Log**, to enable or disable.

* **Enable Access Log**, to enable or disable.

This is paired with the [Apache Sling Customizable Request Data Logger](#apacheslingcustomizablerequestdatalogger).

For further information see [AEM Logging](/help/sites-deploying/configure-logging.md) and [Sling Logging](https://sling.apache.org/site/logging.html).

**Apache Sling Resource Resolver Factory** Configure central aspects of Sling resource resolution:

* **Resource Search Path**(s), add any project specific paths (but do not remove `/libs` or `/apps`).

* **Virtual URLs** to define your vanity URL mappings.

* **URL Mappings** to define any aliases; for example from `/content` to `/`.

* **Mapping Location**, the mapper configuration externalized in `/etc/map`.

* Use your local installation (for example, use `https://localhost:4502/system/console/jcrresolver`) to determine which Resource Resolver is active.

For further information see: [https://cwiki.apache.org/confluence/display/SLING/Flexible+Resource+Resolution](https://cwiki.apache.org/confluence/display/SLING/Flexible+Resource+Resolution).

>[!CAUTION]
>
>In particular these options must be configured in the repository.
>
>Otherwise changes made to **URL Mappings** using the Felix console might be overwritten by AEM upon the next startup.

**Apache Sling Servlet/Script Resolver and Error Handler** The Sling Servlet and Script Resolver has multiple tasks:

1. It is used as the `ServletResolver` to select the Servlet or Script to call to handle the request.

1. It acts as the `SlingScriptResolver`.

1. It manages error handling by implementing the `ErrorHandler` interface using the same algorithm to select error handling servlets and scripts as is used to resolve request processing servlets and scripts.

Various parameters can be set, including:

* **Execution Paths** lists the paths to search for executable scripts; by configuring specific paths you can limit which scripts can be executed. If no path is configured then the default is used ( `/` = root), this allows the execution of all scripts.
  If a configured path value ends with a slash, the whole sub tree is searched. Without such a trailing slash the script will only be executed if it is an exact match.

* **Script User** - this optional property can specify the repository user account used for reading the scripts. If no account is specified the `admin` user is used by default.

* **Default Extensions** The list of extensions for which the default behavior will be used. This means that the last path segment of the resource type can be used as the script name.

**Day Commons GFX Font Helper** When rendering graphics you can use DrawText to embed text. For this you can also install your own fonts:

* Define the **Font Path** to be searched for project specific fonts.
  For example, `/apps/myapp/fonts`.

**Apache HTTP Components Proxy Configuration** Proxy configuration for all code using the Apache HTTP client, used when a HTTP is made; for example upon replication.

When creating a new configuration, do not make changes to the factory configuration but instead create a new factory configuration for this component using the configuration manager available here: **https://localhost:4502/system/console/configMgr/**. The proxy configuration is available in **org.apache.http.proxyconfigurator.**

>[!NOTE]
>
>In AEM 6.0 and earlier releases proxy was configured in Day Commons HTTP Client. As of AEM 6.1 and later releases the proxy configuration has moved to the "Apache HTTP Components Proxy Configuration" instead of the 'Day Commons HTTP Client' config.

**Day CQ Antispam** Configure the anti-spam service (Akismet) used. This requires you to register the:

* **Provider**
* **API key**
* **Registered URL**

**Adobe Granite HTML Library Manager** Configure this to control the handling of client libraries (css or js); including, for example, how the underlying structure is seen.

* For production instances:

    * enable **Minify** (to remove CRLF and whitespace characters).
    * enable **Gzip** (to allow files to be gzipped and accessed with one request).
    * disable **Debug**
    * disable **Timing**

* For JS development (especially when firebugging/debugging):

    * disable **Minify**
    * enable **Debug** to separate the files for debugging and use with firebug.
    * enable **Timing** in the case of interest in timing.
    * enable **Debug** console to see JS console log messages.

>[!CAUTION]
>
>When changing the setting for either **Minify** or **Gzip** you will also need to delete the contents of `/var/clientlibs`. This is a cached version of the clientlibs and will be rebuilt when next requested.

>[!NOTE]
>
>This setting is automatically configured for production instances if you run AEM in [Production Ready Mode](/help/sites-administering/production-ready.md).

**Day CQ HTTP Header Authentication Handler** System wide settings for the basic authentication method of the HTTP request.

When using [closed user groups](/help/sites-administering/cug.md) you can configure (amongst others):

* **HTTP Realm**
* The **Default Login Page**

**Day CQ Link Checker Service** Check and if necessary configure:

* **Scheduler Period** to define the interval at which external links are to be automatically checked.

* Check **Bad Link Tolerance Interval** for the period after which an unsuccessful external link is considered bad.
* **Link Check Override Patterns**, to define any paths to be excluded from link checking.

**Day CQ Link Checker Task** Configure settings for a single link checker task (a task which checks an external link):

* Check the intervals defined in **Good Link Test Interval** and **Bad Link Test Interval**

* The various parameters related to proxies for internet access and NTLM that are needed for external access when checking a link.

**Day CQ Mail Service** Configure hostname and access details for the mail server. Please refer to the Configuring the Mail Service section.

**Day CQ MCM Newsletter** Configure the various settings used with the newsletter.

**Day CQ Root Mapping** Configure:

* **Target Path** to define where a request to " `/`" will be redirected to.

There are two UIs available in AEM:

* the touch-enabled UI is the standard UI
* and the deprecatd classic UI is still fully operational

Using AEM Root Mapping you can configure the UI that you want to have as the default for your instance:

* To have the touch-enabled UI as the default UI the **Target Path** should point to:

  ```
     /projects.html
  ```

* To have the classic UI as the default UI the **Target Path** should point to:

  ```
     /welcome.html
  ```

>[!NOTE]
>
>Upon a standard installation the touch-optimized UI is the default UI.

**Adobe Granite SSO Authentication Handler** Configure Single Sign On (SSO) details; these are often needed in enterprise author setups, often in conjunction with LDAP.

Various configuration properties are available:

* **Path**
  Path for which this authentication handler is active. If this parameter is left empty the authentication handler is disabled. For example, the path / causes the authentication handler to be used for the entire repository.

* **Service Ranking**
  OSGi Framework Service Ranking value is used to indicate the order used for calling this service. This is an `int` value where higher values designate higher precedence.
  Default value is `0`.

* **Header Names**
  The name(s) of headers that might contain a user ID.

* **Cookie Names**
  The name(s) of cookies that might contain a user ID.

* **Parameter Names**
  The name(s) of request parameters that might provide the user ID.

* **User Map**
  For selected users, the user name extracted from the HTTP request can be replaced with a different one in the credentials object. The mapping is defined here. If the user name `admin` appears on either side of the map, the mapping will be ignored. Please be aware that the character "=" has to be escaped with a leading "\".

* **Format**
  Indicates the format in which the user ID is provided. Use:

    * `Basic` if the user ID is encoded in the HTTP Basic Authentication format
    * `AsIs` if the user ID is provided in plain text or any regular expression applied value should be used as is or any regular expression

**Day CQ WCM Debug Filter** This is useful when developing as it allows the use of suffixes such as ?debug=layout when accessing a page. For example, https://localhost:4502/cf#/content/geometrixx/en/support.html?debug=layout will provide layout information that may be of interest to the developer.

* Disable this on production instances to ensure performance and security.

**Day CQ WCM Filter** Configure:

* **WCM Mode **to define the default mode.
* On an author instance this might be `edit`, `disable,preview` or `analytics`.
  The other modes can be accessed from the sidekick, or the suffix `?wcmmode=disabled` can be used to emulate a production environment.

* On a publish instance this must be set to `disabled` to ensure that no other mode is accessible.

>[!NOTE]
>
>This setting is automatically configured for production instances if you run AEM in [Production Ready Mode](/help/sites-administering/production-ready.md).

**Day CQ WCM Link Checker Configurator** Configure:

* **List of rewrite configurations** to specify a list of locations for content-based linkchecker configurations. The configurations can be based on run mode; this is important to distinguish between author and publish environments, as linkchecker settings may differ.

**Day CQ WCM Page Processor** Configure:

* **Paths**, a list of locations where the system listens for page modifications before triggering a `jcr:Event`.

**Adobe Page Impressions Tracker** For an author instance configure:

* **sling.auth.requirements**: set the value of this property to `-/libs/wcm/stats/tracker`

>[!CAUTION]
>
>This configuration will allow anonymous requests to the tracking service.

>[!NOTE]
>
>See [Page Impressions](/help/sites-deploying/configuring.md#enabling-page-impressions) for more information.

**Day CQ WCM Page Statistics** For a publish instance configure:

* **URL to send data** to configure the URL used to track page statistics (is vital if a tracker request goes through the dispatcher); for example, the default is `https://localhost:4502/libs/wcm/stats/tracker`.

* **Tracking script enabled** to enable ( `true`) or disable ( `false`) the inclusion of the tracking script on the pages. The default value is `false`.

>[!NOTE]
>
>See [Page Impressions](/help/sites-deploying/configuring.md#enabling-page-impressions) for more information.

**Day CQ WCM Version Manager** Control if, and how, versions are managed in your system:

* **Create Version on Activation**, enabled in a standard installation
* **Enable Purging**

* **Purge Paths**, the paths that a search action will search
* **Implicit Versioning Paths**, the paths where implicit versioning is active.

* **Max Version Age**, the maximum age (in days) of a version

* **Max Number Versions**, the maximum number of versions to keep

See [Version Purging](/help/sites-deploying/version-purging.md) for more information.

**Day CQ Workflow Email Notification Service** Configure the email settings for notifications sent by a workflow.

**Day CQSE HTTP Service** Control the CQ Servlet Engine:

* **NIO for HTTP, **Whether or not to use NIO for HTTP. Defaults to true. Only used if HTTP is enabled.
* **Connection Timeout, **Connection timeout in milliseconds. This property applies to both HTTP and HTTPS connections. Defaults to 60 seconds.

* **Enable HTTPS,** Whether or not HTTPS is enabled. Defaults to false.
* **Session Timeout**, Default lifetime of an HTTP session specified in minutes. If the timeout is 0 or less, sessions will never timeout. Defaults to 10 minutes.
* **Debug Logging**, Whether to write DEBUG level messages or not. Defaults to false.
* **Request Buffer Size**, Size of the buffer for requests in bytes. Default is 8KB.
* **Maximum number of threads**, Maximum number of threads to use to handle requests. Default is 200.

The following properties only apply if HTTPS is enabled.

* **HTTPS Port**, Port to listen on for HTTPS request. Defaults to 433.
* **NIO for HTTPS**, Whether or not to use NIO for HTTP. Defaults to the value of the NIO for HTTP property.
* **Keystore**, Absolute path to the Keystore to use for HTTPS. Required if HTTPS is enabled.
* **Keystore Password**, Password to access the Keystore.
* **Key Alias**, Alias of the secret key in the Keystore.
* **Key Password**, Password to unlock the secret key in the Keystore.
* **Client Certificate**, Requirement for the Client to provide a valid certifcate. Defaults to none.

See also [Enabling HTTP Over SSL](/help/sites-administering/ssl-by-default.md) for details on the SSL-related options and a complete description on how to enable HTTPS for CQSE.

**CQ Rewriter HTML Parser Factory**

Controls the HTML Parser for the CQ rewriter.

* **Additional Tags to Process** - You can add or remove HTML tags to be processed by the parser. By default, the following tags are processed: A,IMG,AREA,FORM,BASE,LINK,SCRIPT,BODY,HEAD.
* **Preserve Camel Case** - By default, the HTML parser converts attributes in camel case (e.g. eBay) to lower case (e.g. ebay). You can turn this off to preserve the camel case attributes. This is useful when using frontend frameworks such as Angular 2.

**Day Commons JDBC Connections Pool** Configure access to an external database being used as a source for content.

This is a Factory Configuration, so multiple instances can be configured.

**Adobe CQ Media DPS Sessions Service** Manage DPS Sessions for use with Publications.

In particular you can define the `dps.session.service.url.name`: default is set to [https://dpsapi2.digitalpublishing.acrobat.com/webservices/sessions](https://dpsapi2.digitalpublishing.acrobat.com/webservices/sessions)

**CDN Rewriter** Communication between AEM and a CDN must be ensured so that assets/binaries are delivered to end user in a secure way. This involves two tasks:

* Accessing the resource from AEM via the CDN the very first time (or after it expired in cache).
* Accessing the resource cached in CDN securely since once the resource is cached in CDN, the request won't go to AEM and all the users who have access to that resource on should be served from CDN.

AEM provides a rewriter for rewriting internal assets URLs to external CDN URLs. It rewrites links to be passed on to the CDN including a JWS signature and expire time to allow the asset to be accessed securely. This feature is to be used on author instances.

The overall flow is as follows:

1. User authenticates with AEM and requests a page with assets.
1. Requested page contains an asset similar to `/content/dam/geometrixx-media/articles/paladin_trailer.jpg/jcr:content/renditions/cq5dam.thumbnail.319.319.png`
1. Rewriter transforms the link to a CDN URL containing a JWS Signature:
   `CDN_domain/content/dam/geometrixx-media/articles/paladin_trailer.jpg/_jcr_content/renditions/cq5dam.thumbnail.319.319.png?cdn_sign=JWS_SIGNATURE`

1. User's browser then forwards the asset request to CDN server
1. CDN should be configured to forward the request to AEM along with the `cdn_sign` parameter.
1. An Authentication Handler validates the `cdn_sign` parameter and returns the asset to CDN which is then delivered to user

The flow between the user's browser, the CDN, and AEM can be visualized as follows.

![chlimage_1-8](assets/chlimage_1-8.png)

>[!NOTE]
>
>This feature is currently only enabled for AEM author instances.

**CDNConfigServiceImpl** Provides CDN configurations

The CDN rewriting feature can be enabled by providing **CDN distribution domain name** in the configuration for com.adobe.cq.cdn.rewriter.impl.CDNConfigServiceImpl.

The service also contains other configuration options like enabling/disabling CDN rewriting, path prefixes for which CDN rewriting is performed, TTL values, and protocol (HTTP or HTTPS).

**CDNRewriter** A rewriter for rewriting internal image URLs to CDN URLs

The **Tag Attributes** value in com.adobe.cq.cdn.rewriter.impl.CDNRewriter can be defined so that only selective image links are rewritten.
