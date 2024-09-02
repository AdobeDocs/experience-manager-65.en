---
title: The Universal Editor
description: Learn about the flexibility and power of the Universal Editor and how it can help power your headless experiences using AEM 6.5.
feature: Developing
role: Developer
---

# The Universal Editor {#universal-editor}

Learn about the flexibility and power of the Universal Editor and how it can help power your headless experiences using AEM 6.5.

>[!NOTE]
>
>The Universal Editor is available in AEM 6.5 as part of an [early adoption program.](/help/release-notes/release-notes.md#sites)

## Overview {#overview}

The Universal Editor is a versatile visual editor that is part of Adobe Experience Manager Sites. It enables authors to do what-you-see-is-what-you-get (WYSIWYG) editing of any headless experience.

* Authors benefit from the Universal Editor’s flexibility as it is supports same consistent visual editing for all forms of AEM headless content.
* Developers benefit from Universal Editor’s versatility as it also supports true decoupling of the implementation. It allows developers to utilize virtually any framework or architecture of their choice, without imposing any SDK or technology constraints.

Please see the [AEM as a Cloud Service documentation on the Universal Editor](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/implementing/developing/universal-editor/introduction) for more detail.

## Architecture {#architecture}

The Universal Editor is a service that works in tandem with AEM to author content headlessly.

* The Universal Editor is hosted at `https://experience.adobe.com/#/aem/editor/canvas` and can edit an AEM 6.5 rendered page.
* The AEM page is read by the Universal Editor via the dispatcher from the AEM author instance.
* The Universal Editor writes changes back to the AEM author instance using the Universal Editor Service via the dispatcher.

![Author flow using the Universal Editor](assets/author-flow.png)

## Setup {#setup}

In order to test the Universal Editor you will need to:

1. Configure your AEM authoring instance.
1. Set up a local Universal Editor Service.
1. Adjust your dispatcher to allow the Universal Editor Service.

### Configure AEM {#configure-aem}

You will need to take the following steps to update your AEM authoring instance to support authoring with the Universal Editor. Begin by upgrading the **Adobe Granite Token Authentication** bundle.

1. Open the bundles page of the Configuration Manager.
   * `https://<host>:<port>/system/console/bundles`
1. Click **Install/Update...** at the top of the list of bundles.
1. In the **Upload/Install Bundles** dialog, select the **Start Bundle**, **Refresh Packages**, and **Install Version in Parallel** options.
1. Click **Choose file** and browse for the `crx-auth-token-2.7.0.jar` file provided to you by Adobe and then click **Install or Update**.
1. Refresh the list of bundles and then use the search field at the top of the list of bundes to search for **Adobe Granite Token**. Click on **Apply Filter** to search the list.
1. You should see two **Adobe Granite Token Authentication** bundles: one with version `2.6.12` and one with version `2.7.0`.
1. Stop bundle with version `2.6.12` and then delete it.
1. Restart AEM.

Now remove the `SAMEORIGIN` headers X-Frame option.

1. Open the Configuration Manager.
   * `http://<host>:<port>/system/console/configMgr`
1. Edit the **Apache Sling Servlet** in the list and click **Edit the configuration values**.
1. Delete the `X-Frame-Options=SAMEORIGIN` value from the **Additional response headers** attribute.
1. Click **Save**.
   * There is no need to restart AEM.

Now add a redirect for the Universal Editor.

1. Open the Configuration Manager.
   * `http://<host>:<port>/system/console/configMgr`
1. Edit the **Apache Sling Authentication Service** in the list and click **Edit the configuration values**.
1. Under the **Authentication Requirements** attribute, add the line `-/bin/ueredirect`.
1. Click **Save**.
   * There is no need to restart AEM.

Install a bundle for the redirect servlet.

// Details here TBD based on what will be available to customer at release.

Overlay **Edit** button to open the Universal Editor.

// Details here TBD based on what will be available to customer at release.

### Set Up Universal Editor Service {#set-up-ue}

With AEM updated and configured, you can set up a local Universal Editor Service for your own local development and testing.

1. Install Node.js version >=20.
1. Download and unpack latest Universal Editor Service from [Software Distribution](https://experienceleague.adobe.com/en/docs/experience-cloud/software-distribution/home)
1. Configure Universal Editor Service via environment variables or `.env` file.
   * [See the AEM as a Cloud Service Universal Editor documentation for details.](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/implementing/developing/universal-editor/local-dev#setting-up-service)
   * Note that you may need to use the `UES_MAPPING` option if internal IP rewriting is required.
1. Run `universal-editor-service.cjs`

### Update the Dispatcher {#update-dispatcher}

With AEM configured and a local Universal Editor service running, you will need to allow a reverse proxy for the new service [in the dispatcher.](https://experienceleague.adobe.com/en/docs/experience-manager-dispatcher/using/dispatcher)

1. Adjust vhost file of author instance to include a reverse proxy.

   ```html
   <IfModule mod_proxy.c>
    ProxyPass "/universal-editor" "http://localhost:8008"
    ProxyPassReverse "/universal-editor" "http://localhost:8008"
   </IfModule>
   ```

1. Restart Apache.

## Instrument Your App {#instrumentation}

With AEM updated and a local Universal Editor Service running, you can start editing headless content using the Universal Editor.

However that content must be instrumented to take advantage of the Universal Editor. This involves including meta tags to instruct the editor how and where to persist the content. Details of this instrumentation are available in the [Universal Editor documentation for AEM as a Cloud Service.](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/implementing/developing/universal-editor/getting-started#instrument-page)

Note that when following documentation for the Universal Editor with AEM as a Cloud Service, the following changes apply when using it with AEM 6.5.

* The protocol in meta tag must be `aem65` instead of `aem`.
  
  ```html
  <meta name="urn:adobe:aue:system:aemconnection" content={`aem65:${getAuthorHost()}`}/>
  ```

* The Universal Editor Service endpoint must be announced via a meta tag.

   ```html
   <meta name="urn:adobe:aue:config:service" content={`${getAuthorHost()}/universal-editor`}/>
   ```

* In the `plugins` section of the components definition, `aem65` must be used instead of `aem`.

>[!TIP]
>
>For a comprehensive guide for developers getting started with the Universal Editor, please see the document [Universal Editor Overview for AEM Developers](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/implementing/developing/universal-editor/developer-overview) in the AEM as a Cloud Service documentation while keeping in mind the necessary changes needed for AEM 6.5 support as mentioned in this section.
