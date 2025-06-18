---
title: Basic Configuration Concepts
description: Learn how to configure Adobe Experience Manager for your own specific requirements.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: configuring
content-type: reference
feature: Configuring
exl-id: 3777a1ba-cc4e-41b9-9098-236f8141925f
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Basic Configuration Concepts{#basic-configuration-concepts}

Adobe Experience Manager (AEM) is installed with default settings for all parameters which allow it to run "out-of-the-box." However, you can configure AEM for your own specific requirements.

There are many aspects of AEM that can be configured:

* Some are [commonly configured for every project installation](#primary-configuration-considerations) and must be reviewed to confirm whether they are applicable to your project.
* [Further configurations](#further-configuration-considerations) may be common though not imperative; related to features, or system performance and stability.
* Others are only required for certain optional features of AEM (these are documented together with the appropriate feature).

Depending on the specific configuration, these changes can be made by using either the:

* **Adobe CQ Web Console**

  This is a standard location for configuring OSGi bundles and services.

  See [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for further details and recommended practices.

* **Repository**

  A subset of OSGi configurations is available in the repository. This ensures that copying, or replicating, repository contents recreates identical configurations. You can also add your own configurations, dependent on run-mode, to the repository.

  See [OSGi Configuration in the Repository](/help/sites-deploying/configuring-osgi.md#osgi-configuration-in-the-repository) and in particular [Adding a New Configuration to the Repository](/help/sites-deploying/configuring-osgi.md#adding-a-new-configuration-to-the-repository) for further details.

* **File system**

  A few configuration files reside within the file system.

* **AEM WCM**

  Various aspects can be configured within AEM WCM itself, many using the [Tools](/help/sites-administering/tools-consoles.md) console; for example, replication agents.

>[!NOTE]
>
>When working with Adobe Experience Manager, there are several methods of managing the configuration settings for OSGi services (console or repository nodes).
>
>See [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details.

>[!NOTE]
>
>Configuring AEM is straightforward. However, certain changes can have a major impact on the applications. For this reason, ensure you have the necessary experience and knowledge before you start to configure AEM, and make only the changes which you know are required. Any changes made via the OSGi console are **immediately** applied to the running system (no restart is required).

## Primary Configuration Considerations {#primary-configuration-considerations}

This list details the primary areas that are commonly configured for every new project. Not all are needed, but the list must be read and reviewed to see what is applicable to your project.

The list gives a short overview of each configuration aspect, together with links to the pages that provide full details.

### Security Checklist {#security-checklist}

Several key configuration issues are listed in the [Security Checklist](/help/sites-administering/security-checklist.md). Be sure that you read this and take any action necessary for your installation.

### Configuring the Default UI - Touch-Optimized or Classic {#configuring-the-default-ui-touch-optimized-or-classic}

There are two UIs available for use in AEM:

* The Touch-optimized UI
* The Classic UI

You can configure the UI you require using [Root Mapping](/help/sites-deploying/osgi-configuration-settings.md).

>[!NOTE]
>
>Further information about selecting the UI is available under [Selecting your UI](/help/sites-authoring/select-ui.md).

### IPv4 and IPv6 {#ipv-and-ipv}

All elements of AEM (for example, the repository, and the Dispatcher) can be installed in both IPv4 and IPv6 networks.

Operation is seamless as no special configuration is required, when needed you can simply specify an IP address using the format that is appropriate to your network type.

This means that when an IP address must be specified you can select (as required) from:

* an IPv6 address

  for example, `https://[ab12::34c5:6d7:8e90:1234]:4502`

* an IPv4 address

  for example, `https://123.1.1.4:4502`

* a server name

  for example, `https://www.yourserver.com:4502`

* the default case of `localhost` will be interpreted for both IPv4 and IPv6 network installations

  for example, `http://localhost:4502`

### Version Purging {#version-purging}

In a standard installation, AEM creates a version of a page or node whenever you activate a page (after updating the content). You can also create additional versions on request using the **Versioning** tab of the sidekick. All these versions are stored in the repository and can be restored, if necessary.

These versions are never purged, so the repository size grows over time and therefore must be managed.

See [Version Purging](/help/sites-deploying/version-purging.md) for full details, in particular [Version Manager](/help/sites-deploying/version-purging.md#version-manager) for details of how to configure AEM to purge older versions when a new version is created.

### Logging {#logging}

AEM offers you the possibility to configure:

* global parameters for the central logging service
* request data logging; a specialized logging configuration for request information
* specific settings for the individual services; for example, an individual log file and format for the log messages

See [Logging](/help/sites-deploying/configure-logging.md) for full details.

### Run Modes {#run-modes}

Run modes lets you tune your AEM instance for a specific purpose. For example, author or publish, test, development, or intranet, and so on.

This is done by defining collections of configuration parameters for each run mode. A basic set of configuration parameters is applied for all run modes, you can then tune additional sets to the purpose of your specific environment. These are then applied as required.

All configuration settings are stored in the one repository and activated by setting the **Run Mode**.

See [Run Modes](/help/sites-deploying/configure-runmodes.md) for full details.

### Single Sign On {#single-sign-on}

Single Sign On (SSO) allows a user to access multiple systems after providing authentication credentials (such as a user name and password) once. A separate system (known as the trusted authenticator) performs the authentication and provides Experience Manager with the user credentials. Experience Manager checks and enforces the access permissions for the user (that is, determines which resources the user is allowed to access).

See [Single Sign On](/help/sites-deploying/single-sign-on.md) for further details.

### Resource Mapping {#resource-mapping}

Resource mapping is used to define redirects, vanity URLs, and virtual hosts for AEM.

For example, you can use these mappings to:

* Prefix all requests with `/content` so that the internal structure is hidden from the visitors to your website.
* Define a redirect so that all requests to the `/content/en/gateway` page of your website are redirected to `https://gbiv.com/`.

See [Resource Mapping](/help/sites-deploying/resource-mapping.md) for further details.

### Replication, Reverse Replication, and Replication Agents {#replication-reverse-replication-and-replication-agents}

Replication agents are central to AEM as the mechanism used to:

* [Publish (activate)](/help/sites-authoring/publishing-pages.md) content from an author to a publish environment.
* Explicitly flush content from the Dispatcher cache.
* Return user input (for example, form input) from the publish environment to the author environment (under control of the author environment).

For more details, see [Replication](/help/sites-deploying/replication.md).

### OSGi Configuration Settings {#osgi-configuration-settings}

[OSGi](https://www.osgi.org/) is a fundamental element in the technology stack of AEM. It is used to control the composite bundles of AEM and their configuration.

See [OSGi configuration settings](/help/sites-deploying/osgi-configuration-settings.md) for a list of the various bundles that are relevant to project implementation (listed according to bundle). Not all the listed settings need adjusting, some are mentioned to help you understand how AEM operates.

When working with AEM, there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for more details and the recommended practices.

### Configuring LDAP {#configuring-ldap}

LDAP authentication is required to authenticate users stored in a (central) LDAP directory such as Active Directory. This helps reduce the effort required to manage user accounts.

LDAP authentication occurs at the repository level, so it is handled directly by the repository. For further details, see [Configuring LDAP with AEM](/help/sites-administering/ldap-config.md).

For user management within AEM (including assignment of access rights), see [User Administration and Security](/help/sites-administering/security.md).

### Configuring the Dispatcher {#configuring-the-dispatcher}

Dispatcher is Adobe Experience Manager's tool for caching, or load balancing, or both. It can be used with an enterprise-class web server.

See [Dispatcher](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/dispatcher.html) for full details, in particular [Configuring the Dispatcher](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/configuring/dispatcher-configuration.html) for further configuration details.

### Configuring AEM LiveCycle Connector {#configuring-aem-livecycle-connector}

With the release of the AEM Doc Services and AEM Doc Security, AEM now has the capability to invoke the LiveCycle doc services to render an XFA form, convert a document to PDF and policy protect a document. 

### Job Offloading and Topology Administration {#job-offloading-and-topology-administration}

[Offloading](/help/sites-deploying/offloading.md) distributes processing tasks among Experience Manager instances in a topology. With offloading, you can use specific Experience Manager instances for performing specific types of processing. Specialized processing enables you to maximize the usage of available server resources.

Topologies are loosely coupled Experience Manager clusters that are participating in offloading. A cluster consists of one or more Experience Manager server instances (a single instance is considered as a cluster).

For more information on how to view or modify topology membership, consult the [Administering Topologies](/help/sites-deploying/offloading.md#administering-topologies) section.

### Configuring the Welcome Console {#configuring-the-welcome-console}

The Welcome console of the classic UI provides a list of links to the various consoles and functionality within AEM.

It is possible to configure the links that are visible, see [Configuring the Welcome Console](/help/sites-developing/customizing-the-welcome-console.md) for further details.

### Configuring for Performance {#configuring-for-performance}

[Performance](/help/sites-deploying/configuring-performance.md) is key to your project. Certain aspects of AEM (and/or the underlying repository) can be configured to optimize performance.

See [Configuring for Performance](/help/sites-deploying/configuring-performance.md#configuring-for-performance) for further details.

<!--delete ### Scaling {#scaling}

Scaling a CQ installation correctly depends greatly on the details of your particular use case. A detailed discussion of solution patterns for various situations can be found in [Scaling CQ](/help/sites-deploying/scaling.md).-->

### Shared Data Store {#shared-data-store}

The repository data store is used to offload the storage of large binaries from the repository proper to a separate area, so that multiple instances of the same binary (an image, for example) within the repository tree are stored only once.

This "store-once, reference-many-times" feature can be extended to serve not just a single repository tree but entirely separate repositories, by configuring the data store of each to refer to the same shared file system location.

Such a data store can be shared between different nodes in the same cluster, different publish and/or author instances in the same installation, or even entirely separate instances in different installations.

For more information, see [Configuring Data Stores and Node Stores](/help/sites-deploying/data-store-config.md).

## Further Configuration Considerations {#further-configuration-considerations}

### Enabling HTTP over SSL {#enabling-http-over-ssl}

You can enable HTTP over SSL to employ more secure connections to your servers.

See [Enabling HTTP over SSL](/help/sites-administering/ssl-by-default.md) for further details.

### AEM Portals and Portlets {#aem-portals-and-portlets}

A portal is a web application that provides personalization, single sign-on, content integration from different sources, and hosts the presentation layer of information systems. The portlet component also lets you embed a portlet on the page. To access content provided by CQ5 WCM, the portal server can be fitted with the CQ5 Portal Director Portlet. You can do this by installing, configuring, and adding the portlet to the portal page.

See [Portal and Portlets](/help/sites-administering/aem-as-portal.md) for further details.

### Expiration of Static Objects {#expiration-of-static-objects}

Static objects (for example, icons) do not change. Therefore the system should be configured so that they do not expire (for a reasonable time period) and so reduce unnecessary traffic.

See [Expiration of Static Objects](/help/sites-deploying/expiration-static-objects.md) for further details.

### Open FIles in the Java&trade; Process {#open-files-in-the-java-process}

Each Java&trade; process may access files - this requires system resources. For this reason, an upper limit is defined as to how many files each process is allowed to access concurrently. If this is exceeded, an exception error can occur.

If the AEM process exceeds this maximum, then the message " `too many open files`" is seen in `error.log`.

To avoid such exceptions, do the following:

1. Check how many open files that your AEM process is using.

   This check depends on the platform that your instance is running on. Utilities such as lsof (UNIX&reg;) or Process Explorer (Windows) can be used.

   This value should be monitored during development and testing to:

    * confirm that files are being closed as required
    * to determine the maximum value needed (under various circumstances)

1. Set the maximum allowed.

   The new value should cater for both the current needs and any future peaks, so it is advisable to double the current needs.

   By default, `serverctl` configures `CQ_MAX_OPEN_FILES` to `8192`; this should be sufficient for most scenarios.

### Configuring the Rich Text Editor {#configuring-the-rich-text-editor}

The **Rich Text Editor** (**RTE**) provides authors with a wide range of [functionality](/help/sites-authoring/rich-text-editor.md) for editing their textual content; providing them with icons, selection boxes, and menus for a WYSIWYG experience.

See [Configuring the Rich Text Editor](/help/sites-administering/rich-text-editor.md) for further details.

### Configuring Undo for Page Editing {#configuring-undo-for-page-editing}

There are several properties that control the behavior of the undo and redo commands for editing pages. These can be configured, see [Configuring Undo for Page Editing](/help/sites-administering/config-undo.md) for further details.

### Configuring the Video Component {#configuring-the-video-component}

The [Video component](/help/sites-authoring/default-components-foundation.md#video) lets you place a predefined, out-of-the-box video element on your page.

For proper transcoding to occur, your administrator must [Install FFmpeg](/help/sites-administering/config-video.md#install-ffmpeg) separately. They can also [Configure your Video Profiles](/help/sites-administering/config-video.md#configure-video-profiles) for use with html5 elements.

### Configuring and Customizing Reports {#configuring-and-customizing-reports}

To help you monitor and analyze the state of your instance, CQ provides a selection of default reports, which can be configured for your individual requirements:

See the [Basics of Report Customization](/help/sites-administering/reporting.md#the-basics-of-report-customization) for further details.

### Configuring Email Notification {#configuring-email-notification}

CQ sends email notifications to users who:

* Have subscribed to page events, for example, modification or replication.
* Have subscribed to forum events.
* Have to perform a step in a workflow.

See [Configuring Email Notification](/help/sites-administering/notification.md) for further details.

### Enabling Page Impressions {#enabling-page-impressions}

Page impressions are displayed in the **Impressions** column of the classic UI siteadmin console. To enable the capture of page impressions, configure the following:

* On the publish instance:

    * [Day CQ WCM Page Statistics](/help/sites-deploying/osgi-configuration-settings.md)

* On the author instance:

    * [Adobe Page Impressions Tracker](/help/sites-deploying/osgi-configuration-settings.md)

>[!CAUTION]
>
>The configuration of Adobe Page Impressions Tracker on the author environment allows anonymous requests to the tracking service.
