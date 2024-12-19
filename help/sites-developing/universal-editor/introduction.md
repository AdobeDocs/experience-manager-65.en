---
title: The Universal Editor
description: Learn about the flexibility of the Universal Editor and how it can help power your headless experiences using AEM 6.5.
feature: Developing
role: Developer
exl-id: 7bdf1fcc-02b9-40bc-8605-e6508a84d249
---

# The Universal Editor {#universal-editor}

Learn about the flexibility of the Universal Editor and how it can help power your headless experiences using AEM 6.5.

## Overview {#overview}

The Universal Editor is a versatile visual editor that is part of Adobe Experience Manager Sites. It enables authors to do what-you-see-is-what-you-get (WYSIWYG) editing of any headless experience.

* Authors benefit from the Universal Editor's flexibility as it is supports the same consistent visual editing for all forms of AEM headless content.
* Developers benefit from Universal Editor's versatility as it also supports true decoupling of the implementation. It allows developers to utilize virtually any framework or architecture of their choice, without imposing any SDK or technology constraints.

Please see the [AEM as a Cloud Service documentation on the Universal Editor](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/implementing/developing/universal-editor/introduction) for more detail.

## Architecture {#architecture}

The Universal Editor is a service that works in tandem with AEM to author content headlessly.

* The Universal Editor is hosted at `https://experience.adobe.com/#/aem/editor/canvas` and can edit pages rendered by AEM 6.5.
* The AEM page is read by the Universal Editor via the dispatcher from the AEM author instance.
* The Universal Editor Service, which runs on the same host as the Dispatcher, writes changes back to the AEM author instance.

![Author flow using the Universal Editor](assets/author-flow.png)

## Setup {#setup}

In order to test the Universal Editor you will need to:

1. [Update and configure your AEM authoring instance.](#update-configure-aem)
1. [Set up a local Universal Editor Service.](#set-up-ue)
1. [Adjust your dispatcher to allow the Universal Editor Service.](#update-dispatcher)

Once you have complete the setup, you can [instrument your applications to use the Universal Editor.](#instrumentation)

### Update AEM {#update-aem}

Service pack 21 or 22 and a feature pack for AEM are required in order to use the Universal Editor with AEM 6.5.

#### Apply Latest Service Pack {#latest}

Make sure that you are running at least service pack 21 or 22 for AEM 6.5. You can download the latest service pack from [Software Distribution.](https://experienceleague.adobe.com/docs/experience-cloud/software-distribution/home.html)

#### Install Universal Editor Feature Pack {#feature-pack}

Install the **Universal Editor Feature Pack for AEM 6.5** [available on Software Distribution.](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/cq-6.5.21-universal-editor-1.0.0.zip)

If you are already running service pack 23 or higher, the feature pack is not necesary.

### Configure Services {#configure-services}

The feature pack installs a number of new packages for which additional configuration is needed.

#### Set the SameSite Attribute for the `login-token` cookie. {#samesite-attribute}

1. Open the Configuration Manager.
   * `http://<host>:<port>/system/console/configMgr`
1. Locate **Adobe Granite Token Authentication Handler** in the list and click **Change the configuration values**.
1. In the dialog, change the **SameSite attribute for the login-token cookie** (`token.samesite.cookie.attr`) value to `Partitioned`.
1. Click **Save**.

#### Remove the `SAMEORIGIN` headers X-Frame option. {#sameorigin}

1. Open the Configuration Manager.
   * `http://<host>:<port>/system/console/configMgr`
1. Locate **Apache Sling Main Servlet** in the list and click **Edit the configuration values**.
1. Delete the `X-Frame-Options=SAMEORIGIN` value from the **Additional response headers** attribute (`sling.additional.response.headers`) if it exists.
1. Click **Save**.

#### Configure the Adobe Granite Query Parameter Authentication Handler. {#query-parameter}

1. Open the Configuration Manager.
   * `http://<host>:<port>/system/console/configMgr`
1. Locate **Adobe Granite Query Parameter Authentication Handler** in the list and click **Edit the configuration values**.
1. In the **Path** field (`path`), add `/` to enable.
   * An empty value disables the authentication handler.
1. Click **Save**.

#### Define for which content paths or `sling:resourceTypes` the Universal Editor shall be opened. {#paths}

1. Open the Configuration Manager.
   * `http://<host>:<port>/system/console/configMgr`
1. Locate **Universal Editor URL Service** in the list and click **Edit the configuration values**.
1. Define for which content paths or `sling:resourceTypes` the Universal Editor shall be opened.
   * In the **Universal Editor Opening Mapping** field, provide the paths for which the Universal Editor is opened.
   * In the **Sling:resourceTypes which shall be opened by Universal Editor** field, provide a list of resources which are opened directly by the Universal Editor.
1. Click **Save**.

AEM will open the Universal Editor for pages based on this configuration.

1. AEM will check the mappings under `Universal Editor Opening Mapping` and if the content is under any paths defined there, the Universal Editor is opened for it.
1. For content not under paths defined in `Universal Editor Opening Mapping`, AEM checks if the `resourceType` of the content matches those defined in **Sling:resourceTypes which shall be opened by Universal Editor** and if the content matches one of those types, the Universal Editor is opened for it at `${author}${path}.html`.
1. Otherwise AEM opens the Page Editor.

The following variables are available to define your mappings under `Universal Editor Opening Mapping`.

* `path`: Content path of the resource to open
* `localhost`: Externalizer entry for `localhost` without schema, e.g. `localhost:4502`
* `author`: Externalizer entry for author without schema, e.g. `localhost:4502`
* `publish`: Externalizer entry for publish without schema, e.g. `localhost:4503`
* `preview`: Externalizer entry for preview without schema, e.g. `localhost:4504`
* `env`: `prod`, `stage`, `dev` based on the defined Sling run modes
* `token`: Query token required for the `QueryTokenAuthenticationHandler`

Example mappings:

* Open all pages under `/content/foo` on the AEM Author: 
  * `/content/foo:${author}${path}.html?login-token=${token}`
  * This results in opening `https://localhost:4502/content/foo/x.html?login-token=<token>`
* Open all pages under `/content/bar` on a remote NextJS server, providing all variables as information
  * `/content/bar:nextjs.server${path}?env=${env}&author=https://${author}&publish=https://${publish}&login-token=${token}`
  * This results in opening `https://nextjs.server/content/bar/x?env=prod&author=https://localhost:4502&publish=https://localhost:4503&login-token=<token>`

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

1. Adjust the vhost file of author instance to include a reverse proxy.

   ```html
   <IfModule mod_proxy.c>
    ProxyPass "/universal-editor" "http://localhost:8080"
    ProxyPassReverse "/universal-editor" "http://localhost:8080"
   </IfModule>
   ```

   >[!NOTE]
   >
   >8080 is the default port. If you changed this using the `UES_PORT` parameter in [your `.env` file,](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/implementing/developing/universal-editor/local-dev#setting-up-service) you must adjust the port value here accordingly.

1. Restart Apache.

## Instrument Your App {#instrumentation}

With AEM updated and a local Universal Editor Service running, you can start editing headless content using the Universal Editor.

However your app must be instrumented to take advantage of the Universal Editor. This involves including meta tags to instruct the editor how and where to persist the content. Details of this instrumentation are available in the [Universal Editor documentation for AEM as a Cloud Service.](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-service/content/implementing/developing/universal-editor/getting-started#instrument-page)

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

## Differences Between AEM 6.5 and AEM as a Cloud Service {#differences}

The Universal Editor in AEM 6.5 broadly works the same as in AEM as a Cloud Service including the UI and much of the setup. There are, however, differences that should be noted.

* The Universal Editor in 6.5 supports only the headless use case.
* Setup of the Universal Editor varies slightly for 6.5 ([as described](#setup) in the current document).
* The Universal Editor in 6.5 uses a different asset picker and a different Content Fragment picker than AEM as a Cloud Service.
