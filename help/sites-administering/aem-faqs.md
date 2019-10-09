---
title: AEM FAQs
seo-title: AEM 6.4 frequently asked questions
description: Use these FAQs to understand, configure, and troubleshoot common workflows or issues in AEM.
seo-description: Use these FAQs to understand, configure, and troubleshoot common workflows or issues in AEM.
uuid: af197bcc-2c61-4c64-b781-f24d83c27c82
contentOwner: jsyal
discoiquuid: c66b65af-443f-4fc2-b775-9f4e3c60285a
---

# AEM FAQs{#aem-faqs}

Know the answers to some AEM troubleshooting and configuration issues.

## Sites {#sites}

### How do I configure binary-less distribution? {#how-do-i-configure-binary-less-distribution}

Binary-less distribution is supported for deployments over a shared data store and involves agents that leverage the Vault-based Distribution package exporter (factory PID: `org.apache.sling.distribution.serialization.impl.vlt.VaultDistributionPackageBuilderFactory`) package builder.

With binary-less mode enabled, the content packages distributed contain references to binaries rather than the actual binaries.

### How do I enable binary-less distribution? {#how-do-i-enable-binary-less-distribution}

To enable binary-less distribution, deploy with a shared blob store.  
Check the `useBinaryReferences` property in the OSGI configuration with the factory PID ( `org.apache.sling.distribution.serialization.impl.vlt.VaultDistributionPackageBuilderFactory`*)* that your agent is using.

### How can I customize the error messages while navigating page hierarchy in AEM sites console? {#how-can-i-customize-the-error-messages-while-navigating-page-hierarchy-in-aem-sites-console}

Check the Network panel (of Chrome browser) where a personal setup (JS has not been minified).

View the `Initiator` column to determine what the initiator of a request was. It provides the files and the line numbers from where the AJAX calls are made. Later, you can trace the error handling function and change the error message as per your requirement.

### How to enable permissions while creating Language Copy for Content-Authors in AEM? {#how-to-enable-permissions-while-creating-language-copy-for-content-authors-in-aem}

To create language copy feature, content-authors need permissions at `/content/projects` location.

If one requires the authors to manage projects as well, then the workaround is to add the author to `project-administrators` group.

### How to change the format while creating Language Copy for a project? {#how-to-change-the-format-while-creating-language-copy-for-a-project}

Create a language root and language copy inside the root, before creating a translation project.

For example,  
Create a language root at `/content/geometrixx` with name as `fr_LU` (and title as French (Luxembourg)). Subsequently, create language copy of page from the references panel and navigate to `Create structure only` option in `Create & Translate`. Finally, create a translation project and then add the language copy to the translation job.

For details, refer to the additional resources below:

* [Preparing content for translation](/help/sites-administering/tc-prep.md)
* [Managing translation projects](/help/sites-administering/tc-manage.md)

### How to audit AEM capabilities such as, login attempts and ACL or permission changes? {#how-to-audit-aem-capabilities-such-as-login-attempts-and-acl-or-permission-changes}

AEM has introduced the ability to log administrative changes for better troubleshooting and audit. By default, the information is logged in the `error.log` file. To make monitoring easier, it is recommended that they be redirected to a separate log file.  
To redirect the output to a separate log file, see [How to audit user management operations in AEM](/help/sites-administering/audit-user-management-operations.md).

### How to enable SSL by default? {#how-to-enable-ssl-by-default}

Adobe Experience Manager (AEM) 6.4 ships with the SSL wizard and offers a User Interface to configure Jetty and Granite Jetty SSL support.

To enable SSL by default, see [SSL by default](/help/sites-administering/ssl-by-default.md).

### What is the recommended architecture when using AEM’s Content Services from a mobile app, ideally React Native? {#what-is-the-recommended-architecture-when-using-aem-s-content-services-from-a-mobile-app-ideally-react-native}

The Content Services are based on the Sling Models and the AEM developers must provide a Sling Model pojo for each component that is exported.

To understand how to consume AEM content services from a React application, see [Get Started with AEM Content Services](https://helpx.adobe.com/experience-manager/kt/sites/using/content-services-tutorial-use.html) tutorial.

Also, if the developers want to export a tree of components they can also implement the `ComponentExporter` and `ContainerExporter` interfaces as well as use the `ModelFactory` to iterate over the child components and return their model representation. See the resources below:

[1] [Adobe-Marketing-Cloud/aem-core-wcm-components](https://github.com/Adobe-Marketing-Cloud/aem-core-wcm-components/blob/master/bundles/core/src/main/java/com/adobe/cq/wcm/core/components/internal/models/v1/PageImpl.java#L245)

[2] [Apache Sling :: Sling Models](https://sling.apache.org/documentation/bundles/models.html)

### How to disable AEM 6.4 survey pop-up? {#how-to-disable-aem-survey-pop-up}

You can opt into usage statistics collection by using either the Touch UI or the Web Console. For detailed instructions, see [Opting into aggregated usage statistics collection](/help/sites-deploying/opt-in-aggregated-usage-statistics.md).

### Is there a good resource that highlights the key features for upgrading to AEM 6.4? {#is-there-a-good-resource-that-highlights-the-key-features-for-upgrading-to-aem}

Please refer to [Understanding Reasons to Upgrade AEM](https://helpx.adobe.com/experience-manager/kt/platform-repository/using/upgrade-aem-article-understand.html) that describes high-level breakdown of key features for customers considering upgrading to the latest version of Adobe Experience Manager.

### How to configure an AEM instance to use the PorterStem filter? {#how-to-configure-an-aem-instance-to-use-the-porterstem-filter}

PorterStem filter applies the Porter Stemming Algorithm for English. The results are similar to using the Snowball Porter Stemmer with the *language="English"* argument. But this stemmer is coded directly in Java and is not based on Snowball. It does not accept a list of protected words and is only appropriate for English language text.

Oak exposes a set of lucene-provides analyzer configuration elements for use in AEM. To learn how to use filters, please refer to **Apache Oak Analyzers** in [Simple search implementation guide](https://helpx.adobe.com/experience-manager/kt/sites/using/search-tutorial-develop.html).

### How to perform a full re-indexing? {#how-to-perform-a-full-re-indexing}

Re-indexing should always be approached with proper consideration on its impact to AEM's overall performance, and performed during periods of low activity or maintenance windows.

Please refer to the [Best Practices for Queries and Indexing](/help/sites-deploying/best-practices-for-queries-and-indexing.md) to understand the reasons for re-indexing.

### Do we support minified JS libs in Design Importer? {#do-we-support-minified-js-libs-in-design-importer}

You need to change the JS processor default configs property of the Adobe Granite HTML Library Manager to ***min:gcc***. To import the Design Package successfully, it is recommended to include pre-minified 3rd party libraries in our Client-Side Libraries.

## Assets {#assets}

### Why the Assets workflow repeats itself while uploading MP4 files (for example, using drag-and-drop method)? {#why-the-assets-workflow-repeats-itself-while-uploading-mp-files-for-example-using-drag-and-drop-method}

If the user, uploading the movie files does not have delete permissions under asset node, the delete chunk nodes fail and the upload restarts.

### What is the maximum number of digital assets that can be operated with AEM 6.4 at a time? {#what-is-the-maximum-number-of-digital-assets-that-can-be-operated-with-aem-at-a-time}

Adobe Experience Manager (AEM) 6.4 currently lets you upload up to 2 GB of assets at a time.

For additional information on maximum number of assets that can be operated with AEM 6.4, see [Assets sizing guide](/help/assets/assets-sizing-guide.md).

### What are the default settings for OOTB configurations while creating Language Copy? {#what-are-the-default-settings-for-ootb-configurations-while-creating-language-copy}

When creating language copies through classic UI, Assets are not moved under the new language hierarchy but used from the language master.

Whereas, when you create a language copy through Touch UI (**References** -&gt; **Update Language Copy**), a new DAM folder is created under the new language and assets are referenced from there.

This is default setting for OOTB configurations. You can set **Translate Page Assets** = **Do not translate** in Translation configurations.  
For AEM 6.4, **Tools** &gt; **Cloud Services** &gt; **Translation Cloud services**.

### How to disable an AEM component causing exponential growth for the AEM SegmentStore (AEM 6.3.1.1)? {#how-to-disable-an-aem-component-causing-exponential-growth-for-the-aem-segmentstore-aem}

You can disable the OSGi Component Disabler. To use this service, see [OSGi Component Disabler](https://adobe-consulting-services.github.io/acs-aem-commons/features/osgi-disablers/component-disabler/index.html).

As a workaround, you can also manually disable the component either via the UI or via a `curl` command (example below), after every AEM restart.

`curl -u admin:$(pass CQ_Admin) 'http://localhost:4502/system/console/components/com.day.cq.analytics.sitecatalyst.impl.importer.ReportImporter' --data 'action=disable'`

### How to configure Asset Insights with AEM 6.4 instance? {#how-to-configure-asset-insights-with-aem-instance}

To setup and configure Asset Insights for Experience Manager deployed via Adobe Activation (DTM), please refer to [Set up Asset Insights with AEM Assets](https://helpx.adobe.com/experience-manager/kt/assets/using/asset-insights-tutorial-setup.html).

### How to customize admin consoles? {#how-to-customize-admin-consoles}

AEM provides various mechanisms to enable you to customize the consoles and the page authoring functionality of your authoring instance. To learn how to create a custom console and customize a default view for a console, please refer to [Customizing the Consoles](/help/sites-developing/customizing-consoles-touch.md).

### What is the difference between CoralUI 2 and CoralUI 3-based components? {#what-is-the-difference-between-coralui-and-coralui-based-components}

A new set of Sling components of Granite UI Foundation is created for Coral3 and is located under [/libs/granite/ui/components/coral/foundation.](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/granite-ui/api/jcr_root/libs/granite/ui/components/coral/foundation/server.html) There is one set for CoralUI 2-based components and one set for CoralUI 3-based components. The new set will not be just a copy-paste of the old set, rather it will be cleaned up (for example streamlining, removing deprecated feature). So it is recommended that a page only use either CoralUI 3-based or CoralUI 2-based set.

To learn more in detail, please refer to [Migration Guide to CoralUI 3-based](https://helpx.adobe.com/experience-manager/6-4/sites/developing/using/reference-materials/granite-ui/api/jcr_root/libs/granite/ui/components/legacy/coral2/migration.html).

### How to customize the search component in AEM Assets? {#how-to-customize-the-search-component-in-aem-assets}

To learn about search boost/ranking and further implementation information, please refer to [Simple search implementation guide](https://helpx.adobe.com/experience-manager/kt/sites/using/search-tutorial-develop.html).

The Simple search implementation are the materials from the 2017 Summit lab AEM Search Demystified.

### If a customer buys only Sites license in AEM, do they still have access to Assets? {#if-a-customer-buys-only-sites-license-in-aem-do-they-still-have-access-to-assets}

No, the customer cannot access Assets (or anything other than Sites). Even though all of Adobe Experience Manager (AEM) On-premises is included in the JAR, the customer is authorized access to only those components in the JAR for which they are licensed in their contract. If they want to explore other components, they can either use the AEM trial program for up to 45 days or can sign a $0 Sales Order that authorizes them to evaluate (no production use) named components such as Assets.

Please refer to the following resources to learn more about AEM On-premise software and Adobe Managed Services:

* [Adobe Experience Manager On-premise Software](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-on-premise.html)  

* [Adobe Experience Manager Managed Services](https://helpx.adobe.com/legal/product-descriptions/adobe-experience-manager-managed-services.html)

