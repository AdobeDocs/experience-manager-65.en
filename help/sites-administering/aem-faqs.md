---
title: AEM FAQs
seo-title: AEM 6.4 frequently asked questions
description: Use these FAQs to understand, configure, and troubleshoot common workflows or issues in AEM.
seo-description: Use these FAQs to understand, configure, and troubleshoot common workflows or issues in AEM.
uuid: 17d34923-f1ce-463b-8e9d-a713edcce51b
contentOwner: jsyal
discoiquuid: a3bb5695-6593-413d-9c2f-4c164e663b15
docset: aem65
exl-id: 182c464a-ff7a-467b-9eb5-8ffac335a87a
---
# AEM FAQs {#aem-faqs}

Know the answers to some AEM troubleshooting and configuration issues.

## Sites {#sites}

### How do I configure binary-less distribution? {#how-do-i-configure-binary-less-distribution}

Binary-less distribution is supported for deployments over a shared data store and involves agents that leverage the Vault-based Distribution package exporter (factory PID: `org.apache.sling.distribution.serialization.impl.vlt.VaultDistributionPackageBuilderFactory`) package builder.

With binary-less mode enabled, the content packages distributed contain references to binaries rather than the actual binaries.

#### How do I enable binary-less distribution? {#how-do-i-enable-binary-less-distribution}

To enable binary-less distribution, deploy with a shared blob store.
Check the `useBinaryReferences` property in the OSGI configuration with the factory PID ( `org.apache.sling.distribution.serialization.impl.vlt.VaultDistributionPackageBuilderFactory`*)* that your agent is using.

#### How can I customize the error messages while navigating page hierarchy in AEM sites console? {#how-can-i-customize-the-error-messages-while-navigating-page-hierarchy-in-aem-sites-console}

Check the Network panel (of Chrome browser) where a personal setup (JS has not been minified).

View the `Initiator` column to determine what the initiator of a request was. It provides the files and the line numbers from where the AJAX calls are made. Later, you can trace the error handling function and change the error message as per your requirement.

#### How to enable permissions while creating Language Copy for Content-Authors in AEM? {#how-to-enable-permissions-while-creating-language-copy-for-content-authors-in-aem}

To create language copy feature, content-authors need permissions at `/content/projects` location.

If one requires the authors to manage projects as well, then the workaround is to add the author to `project-administrators` group.

#### How to change the format while creating Language Copy for a project? {#how-to-change-the-format-while-creating-language-copy-for-a-project}

Create a language root and language copy inside the root, before creating a translation project.

For example,
Create a language root at `/content/geometrixx` with name as `fr_LU` (and title as French (Luxembourg)). Subsequently, create language copy of page from the references panel and navigate to `Create structure only` option in `Create & Translate`. Finally, create a translation project and then add the language copy to the translation job.

For details, refer to the additional resources below:

* [Preparing content for translation](/help/sites-administering/tc-prep.md)
* [Managing translation projects](/help/sites-administering/tc-manage.md)

#### How to audit AEM capabilities such as, login attempts and ACL or permission changes? {#how-to-audit-aem-capabilities-such-as-login-attempts-and-acl-or-permission-changes}

AEM has introduced the ability to log administrative changes for better troubleshooting and audit. By default, the information is logged in the `error.log` file. To make monitoring easier, it is recommended that they be redirected to a separate log file.
To redirect the output to a separate log file, see [How to audit user management operations in AEM](/help/sites-administering/audit-user-management-operations.md).

#### How to enable SSL by default? {#how-to-enable-ssl-by-default}

Adobe Experience Manager (AEM) 6.4 ships with the SSL wizard and offers a User Interface to configure Jetty and Granite Jetty SSL support.

To enable SSL by default, see [SSL by default](/help/sites-administering/ssl-by-default.md).

#### What is the recommended architecture when using AEM’s Content Services from a mobile app, ideally React Native? {#what-is-the-recommended-architecture-when-using-aem-s-content-services-from-a-mobile-app-ideally-react-native}

The Content Services are based on the Sling Models and the AEM developers must provide a Sling Model pojo for each component that is exported.

To understand how to consume AEM content services from a React application, see [Get Started with AEM Content Services](https://helpx.adobe.com/experience-manager/kt/sites/using/content-services-tutorial-use.html) tutorial.

Also, if the developers want to export a tree of components they can also implement the `ComponentExporter` and `ContainerExporter` interfaces as well as use the `ModelFactory` to iterate over the child components and return their model representation. See the resources below:

[1] [Adobe-Marketing-Cloud/aem-core-wcm-components](https://github.com/Adobe-Marketing-Cloud/aem-core-wcm-components/blob/master/bundles/core/src/main/java/com/adobe/cq/wcm/core/components/internal/models/v1/PageImpl.java#L245)

[2] [Apache Sling :: Sling Models](https://sling.apache.org/documentation/bundles/models.html)

#### How to disable AEM 6.4 survey pop-up? {#how-to-disable-aem-survey-pop-up}

You can opt into usage statistics collection by using either the Touch UI or the Web Console. For detailed instructions, see [Opting into aggregated usage statistics collection](/help/sites-deploying/opt-in-aggregated-usage-statistics.md).

#### Is there a good resource that highlights the key features for upgrading to AEM 6.4? {#is-there-a-good-resource-that-highlights-the-key-features-for-upgrading-to-aem}

Please refer to [Understanding Reasons to Upgrade AEM](https://helpx.adobe.com/experience-manager/kt/platform-repository/using/upgrade-aem-article-understand.html) that describes high-level breakdown of key features for customers considering upgrading to the latest version of Adobe Experience Manager.

## Assets {#assets}

### Why the Assets workflow repeats itself while uploading MP4 files (for example, using drag-and-drop method)? {#why-the-assets-workflow-repeats-itself-while-uploading-mp-files-for-example-using-drag-and-drop-method}

If the user, uploading the movie files does not have delete permissions under asset node, the delete chunk nodes fail and the upload restarts.

#### What is the maximum number of digital assets that can be operated with AEM 6.4 at a time? {#what-is-the-maximum-number-of-digital-assets-that-can-be-operated-with-aem-at-a-time}

Adobe Experience Manager (AEM) 6.5 currently lets you upload up to 2 GB of assets at a time.

For additional information on maximum number of assets that can be operated with AEM 6.5, see [Assets sizing guide](/help/assets/assets-sizing-guide.md).

#### What are the default settings for OOTB configurations while creating Language Copy? {#what-are-the-default-settings-for-ootb-configurations-while-creating-language-copy}

When creating language copies through classic UI, Assets are not moved under the new language hierarchy but used from the language master.

Whereas, when you create a language copy through Touch UI (**References** -&gt; **Update Language Copy**), a new DAM folder is created under the new language and assets are referenced from there.

This is default setting for OOTB configurations. You can set **Translate Page Assets** = **Do not translate** in Translation configurations.
For AEM 6.4, **Tools** &gt; **Cloud Services** &gt; **Translation Cloud services**.

#### How to disable an AEM component causing exponential growth for the AEM SegmentStore (AEM 6.3.1.1)? {#how-to-disable-an-aem-component-causing-exponential-growth-for-the-aem-segmentstore-aem}

You can disable the OSGi Component Disabler. To use this service, see [OSGi Component Disabler](https://adobe-consulting-services.github.io/acs-aem-commons/features/osgi-disablers/component-disabler/index.html).

As a workaround, you can also manually disable the component either via the UI or via a `curl` command (example below), after every AEM restart.

`curl -u admin:$(pass CQ_Admin) 'https://localhost:4502/system/console/components/com.day.cq.analytics.sitecatalyst.impl.importer.ReportImporter' --data 'action=disable'`

#### How to configure Asset Insights with AEM 6.5 instance? {#how-to-configure-asset-insights-with-aem-instance}

To setup and configure Asset Insights for Experience Manager deployed via Adobe Activation (DTM), see how to [Set up Asset Insights with AEM Assets](https://docs.adobe.com/content/help/en/experience-manager-learn/assets/advanced/asset-insights-launch-tutorial.html).

#### How to customize admin consoles? {#how-to-customize-admin-consoles}

AEM provides various mechanisms to enable you to customize the consoles and the page authoring functionality of your authoring instance. To learn how to create a custom console and customize a default view for a console, please refer to [Customizing the Consoles](/help/sites-developing/customizing-consoles-touch.md).

#### What is the difference between CoralUI 2 and CoralUI 3-based components? {#what-is-the-difference-between-coralui-and-coralui-based-components}

A new set of Sling components of Granite UI Foundation is created for Coral3 and is located under [/libs/granite/ui/components/coral/foundation.](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/granite-ui/api/jcr_root/libs/granite/ui/components/coral/foundation/server.html) There is one set for CoralUI 2-based components and one set for CoralUI 3-based components. The new set will not be just a copy-paste of the old set, rather it will be cleaned up (for example streamlining, removing deprecated feature). So it is recommended that a page only use either CoralUI 3-based or CoralUI 2-based set.

To learn more in detail, please refer to [Migration Guide to CoralUI 3-based](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/granite-ui/api/jcr_root/libs/granite/ui/components/legacy/coral2/migration.html).

#### How to customize the search component in AEM Assets? {#how-to-customize-the-search-component-in-aem-assets}

To learn about search boost/ranking and further implementation information, please refer to [Simple search implementation guide](https://helpx.adobe.com/experience-manager/kt/sites/using/search-tutorial-develop.html).

The Simple search implementation are the materials from the 2017 Summit lab AEM Search Demystified.

#### What is the difference between AEM Assets and AEM MediaLibrary? {#what-is-the-difference-between-aem-assets-and-aem-medialibrary}

AEM Assets is an application on the AEM Platform that allows our customers to manage their digital assets (images, videos, documents and audio clips) in a web-based repository whereas AEM Media Library is a designated part of the AEM WCM content repository where images and other shared resources are stored.

Refer to [AEM Assets vs. AEM MediaLibrary](/help/assets/medialibrary.md) for more information.

#### Is it possible to build plugin for WordPress that allows a customer to access Adobe Asset Picker to select images ? {#is-it-possible-to-build-plugin-for-wordpress-that-allows-a-customer-to-access-adobe-asset-picker-to-select-images}

Yes, a customer using WordPress can use Adobe Asset Picker to select images from their AEM Assets server to add to posts on their WordPress site.

Refer to [Asset Selector](../assets/search-assets.md#assetpicker) for more information.

#### Is it possible to extend the search facets in AEM Assets to add additional predicates ? {#is-it-possible-to-extend-the-search-facets-in-aem-assets-to-add-additional-predicates}

An enterprise-wide deployment of Adobe Experience Manager (AEM) Assets has the capacity to store many assets. You can add predicates to the default form or use a custom form that includes facets of your choice.

Refer to [Search Facets](/help/assets/search-facets.md) to learn more.
