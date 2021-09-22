---
title: Deprecated and Removed Features in Adobe Experience Manager 6.5 release.
description: Release notes specific to deprecated and removed features in Adobe Experience Manager 6.5.
exl-id: d9b6140a-c37d-4b90-a60c-01f471d65621
---
# Deprecated and removed features {#deprecated-and-removed-features}

Adobe constantly evaluates product capabilities, to over time reinvent or replace older features with more modern alternatives to improve overall customer value, always under careful consideration of backward compatibility.

To communicate the impending removal or replacement of AEM capabilities, the following rules apply:

1. Announcement of deprecation comes first. While deprecated, capabilities are still available but are not further enhanced.
1. Removal of deprecated capabilities occurs in the following major release at the earliest. Actual target date for removal will be announced.

This process gives customers at least one release cycle to adapt their implementation to a new version or successor of a deprecated capability, before actual removal.

## Deprecated features {#deprecated-features}

This section lists features and capabilities that have been marked as deprecated with AEM 6.5. Generally, features that are planned to be removed in a future release are set to deprecated first, with an alternative provided.

Customers are advised to review if they make use of the feature/capability in their current deployment, and make plans to change their implementation to use the alternative provided.

|Area|Feature|Replacement|
|---|---|---|
| [!DNL Sites]       | Template-based simple content fragments. | [Model-based structured content fragments](/help/assets/content-fragments/content-fragments-models.md) now. |
|Creative Cloud integration|AEM to Creative Cloud Folder Sharing was introduced in AEM 6.2 as a way to give creative users access to assets from AEM, so that they could open them in CC applications and upload new files or save changes to AEM. A new capability released in Creative Cloud application, Adobe Asset Link, provides a much better user experience and more powerful access to assets from AEM directly from inside Photoshop, InDesign, and Illustrator. Adobe does not plan to make further enhancements to the AEM to Creative Cloud Folder Sharing integration. While the feature is included in AEM, customers are strongly advised to use replacement solutions.|Customers are advised to switch to new Creative Cloud integration capabilities, including Adobe Asset Link or AEM desktop app. |
| Assets |`AssetDownloadServlet` is disabled by default for the publish instances. For more details, see [AEM security checklist](/help/sites-administering/security-checklist.md). | Configuration described at [AEM Security checklist](/help/sites-administering/security-checklist.md). |
| Assets | If a user does not have sufficient (read and write) permissions on `/content/dam/collections`, the user cannot create a Collection. | Honor the access control setup of user and ensure appropriate permissions. |
|Adobe Search & Promote|The integration with Adobe Search & Promote is deprecated. Adobe does not plan to make further enhancements to the Search & Promote integration. Note that Search & Promote integration remains fully supported while being deprecated.||
| DTM Tag Manager | The integration with DTM (Dynamic Tag Manager) is deprecated. | Switch to use Adobe Experience Platform Launch as a tag manager. |
|Adobe Target|With adding the ability for AEM to connect to Adobe Target service using the [!DNL Adobe I/O] based Adobe Target Standard API (Rest API) in AEM 6.5, the Target Classic API (XML) way is deprecated.|Reconfigure the integration to [use the new API](https://helpx.adobe.com/experience-manager/kt/sites/using/aem-sites-target-standard-technical-video-understand.html). |
|Adobe Target|Using the `mbox.js` based integration with Adobe Target in AEM is deprecated.|Switch to use `at.js` 1.x.|
| Commerce | [CIF REST](https://github.com/adobe/commerce-cif-api) was provided in 2018 as a set of microservices to enable integrations between AEM and commerce engines. After Adobe acquired Magento in mid 2018, Adobe decided to change its approach for two reasons. Magento has its own set of Commerce APIs (REST and GraphQL) and it's not good practice to maintain two sets of APIs. Market trends indicated that customers were moving towards GraphQL, because it's a more efficient way of querying data. In 2019, Adobe has released the new Commerce Integration Framework using Magento's GraphQL APIs as the source of truth. Adobe doesn't plan to make any further investment in CIF REST. Customers are strongly advised to use the replacement solution.|For AEM-Magento integrations, switch to [AEM CIF Archetype](https://github.com/adobe/aem-cif-project-archetype) and [AEM CIF Core Components](https://github.com/adobe/aem-core-cif-components). See AEM and Magento integration [using Commerce Integration Framework](https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/integrations.html#!AdobeDocs/commerce-cif-documentation/master/integrations/02-AEM-Magento.md). Support for third party (other than Magento) integrations with the new approach is on our roadmap.|
| Components (AEM Sites) | Adobe does not plan to make further enhancements to most of the Foundation Components stored in `/libs/foundation/components`. Look for the `cq:deprecated` and `cq:deprecatedReason` property in the component folder. AEM 6.5 has the Foundation Components included, and customers upgrading from earlier releases can keep using them as is. Further, the Foundation Components is completely supported even though deprecated. | Adobe recommends using the Core Components for future projects. Existing sites can remain as is or use the [AEM Modernize Tools Suite](https://github.com/adobe/aem-modernize-tools) to refactor the site to use Core Components. |
|Components (AEM Sites)|Design Importer Components `/libs/wcm/designimporter/components` have been marked as deprecated starting 6.5. Adobe does not plan to make further enhancements to that implementation of the design importer. | Adobe plans to provide an alternative implementation of the use case in future releases. |
|Foundation|Granite Offloading Framework. Adobe does not plan to make further enhancements to the offloading framework that was introduced in CQ 5.6.1 to externalize asset processing.|Adobe is working on a next-generation cloud-native offloading framework.|
|Developers|`Hobbes.js`. Adobe does not plan to make further enhancements to the `hobbes.js` user interface testing framework.|Adobe recommends that customers use Selenium automation.|
|Developers|jQuery UI client library. Adobe does not plan to further maintain and update the jQuery UI client library that is shipped as part of the distribution (Quickstart)|Adobe recommends customers that still require jQuery UI for their code to add it into their project code base.|
|Developers|jQuery Animation client library (`granite.jquery.animation`). Adobe does not plan to further maintain and update the jQuery Animation client library that is shipped as part of the distribution (Quickstart)|Adobe recommends customers that still require jQuery Animations for their code to add it into their project code base.|
|Developers|Handlebars client library. Adobe does not plan to further maintain and update the Handlebar client library that is shipped as part of the distribution (Quickstart)|Adobe recommends customers that still require Handlebars for their code to add it into their project code base.|
|Developers|Lawnchair client library. Adobe does not plan to further maintain and update the Lawnchair client library that is shipped as part of the distribution (Quickstart)|Adobe recommends customers that still require Lawnchair for their code to add it into their project code base.|
|Developers|`Granite.Sling.js` client library. Adobe does not plan to further enhance the Granite.Sling.js client library that is shipped as part of the distribution (Quickstart)|Adobe recommends customers that are relying on the capability of the library to refactor their code to no longer use it.|
|Developers|Using YUI to compress/minify JavaScript client libraries. Adobe does not plan to further update the YUI library. Up until AEM 6.4, YUI was default to minify JavaScript with the option to switch to Google Closure Compiler (GCC). Starting AEM 6.5, GCC is default.|Adobe recommends customers that upgrade to AEM 6.5 to switch to GCC for their implementation|
|Developers|Classic UI Dialog Editor in CRXDE lite. Adobe does not plan to further enhance the Classic UI Dialog Editor that is shipped as part of the distribution (Quickstart)| No replacement is available. |
|Forms|AEM Forms integration with AEM Mobile is deprecated. | No Replacement is available. ||Developers|Classic UI Dialog Editor in CRXDE lite. Adobe does not plan to further enhance the Classic UI Dialog Editor that is shipped as part of the distribution (Quickstart)| No replacement is available. |
|Developers|Lodash/underscore client library. Adobe does not plan to further maintain and update the Lodash/underscore client library that is shipped as part of the distribution (Quickstart) | Adobe recommends customers that still require Lodash/underscore for their code to add it into their project code base. |

## Removed features {#removed-features}

This section lists features and capabilities that have been removed from AEM 6.5. Prior releases had these capabilities marked as deprecated.

|Area|Feature|Replacement|
|--- |--- |--- |
| Integration with [!DNL Experience Cloud] | You could synchronize your assets with [!DNL Experience Cloud] using a configuring via [!DNL Adobe I/O]. [!DNL Adobe Experience Cloud] was formerly called [!DNL Adobe Marketing Cloud]. | If you have any queries, [contact Adobe Customer Care](https://www.adobe.com/account/sign-in.supportportal.html). |
|Analytics Activity Map|The version of the Activity Map that is included within AEM.|Due to security changes within the Adobe Analytics API, it is no longer possible to use the version of Activity Map that is included within AEM. Use the [ActivityMap plug-in provided by Adobe Analytics](https://docs.adobe.com/content/help/en/analytics/analyze/activity-map/getting-started/get-started-users/activitymap-install.html). |
|Integrations|ExactTarget integration has been removed from the default distribution (Quickstart) and it is no longer available.|No replacement. |
|Integrations|Salesforce Force API integration has been removed from the default distribution (Quickstart) and is now an extra package to install from [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).| The feature is still available.|
|Forms|Support for Adobe Central Migration Bridge service has been removed as Adobe Central product is no longer supported.|No replacement. |
|Forms|`com.adobe.fd.df.fdinternal.model.ConfigurationInstance`|No replacement. |
|Forms|`com.adobe.fd.ccm.channels.print.fdinternal.api.service.PrintDataTransformer`|No replacement|
|Forms|Single-hop upgrade from LiveCycle ES4 SP1 to AEM 6.5 Forms on JEE is not available|See [available upgrade paths](../forms/using/upgrade.md) in AEM Forms upgrade documentation.|
|Forms|Removed UPD based clustering support from AEM Forms on JEE| You can use only TCP-based clustering in AEM Forms on JEE. If you upgrade a UDP multicast server from a previous version to AEM 5.5 Forms on JEE perform manual configurations to switch to TCP based gemfire clustering. For detailed instructions, see [Upgrade to AEM 6.5 forms on JEE](../forms/using/upgrade-forms-jee.md)|
|Developers|Firebug Lite has been removed from the default distribution (Quickstart)|Use the browser built-in developer consoles|
|Developers|Remove `customJavaScriptPath` support in HTML Client Library Manager.|No replacement|
| [!DNL Assets] | The assets offloading feature is removed in [!DNL Adobe Experience Manager] 6.5. | No replacement is available. |
| Cache | `system/console/slingjsp` is removed is no longer available in AEM 6.5.|Classes and Slightly cache is stored under the Apache Sling Commons FileSystem ClassLoader bundle. You can check the bundle number in the AEM Web Console and remove the cache folder directly from the file system (`crx-quickstart/launchpad/felix/bundle<ID>`).|

## Pre-announcement for next release {#pre-announcement-for-next-release}

This section is used to pre-announce the upcoming changes in the future releases. The announced changes are not yet effective but will impact customers. For example the features are not yet deprecated but impacts the users after deprecation. These updates are provided for planning purpose.

|Area|Feature|Announcement|
|--- |--- |--- |
|Foundation|UI Framework|Adobe is planning to deprecate the Coral UI 2 components in 2019. Coral UI 3 was introduced with AEM 6.2, and AEM 6.5 is fully based on Coral 3. Adobe recommends customers and partners that have build custom UIs with Coral 2 to refactored them to Coral 3. Adobe is providing a tool to convert Coral 2 dialogs to Coral 3 - [Read more](/help/sites-developing/modernization-tools.md).|
