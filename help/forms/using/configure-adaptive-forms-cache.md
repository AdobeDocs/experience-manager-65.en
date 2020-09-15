---
title: Configure adaptive forms cache
seo-title: Configure adaptive forms cache
description: The adaptive forms cache is designed specifically for adaptive forms and documents. It caches adaptive forms and adaptive documents with the objective of reducing the time required to render an adaptive form or document on the client. 
seo-description: The adaptive forms cache is designed specifically for adaptive forms and documents. It caches adaptive forms and adaptive documents with the objective of reducing the time required to render an adaptive form or document on the client. 
uuid: ba8f79fd-d8dc-4863-bc0d-7c642c45505c
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Configuration
discoiquuid: 9fa6f761-58ca-4cd0-8992-b9337dc1a279
docset: aem65

---

# Configure adaptive forms cache {#configure-adaptive-forms-cache}

A cache is a mechanism to shorten data access times, reduce latency, and improve input/output (I/O) speeds. Adaptive forms cache stores only HTML content and JSON structure of an adaptive form without saving any pre-filled data. It helps in reducing the time required to render an adaptive form or document on the client. It is designed specifically for adaptive forms and also supports adaptive documents.

## Considerations {#considerations}

* When using the adaptive forms cache, use the AEM [!DNL Dispatcher] to cache client libraries (CSS and JavaScript) of an adaptive form or document.
* While developing custom components, on the server used for development, keep the adaptive forms cache disabled.
* URLs without extension are not cached. For example, URL with pattern  pattern`/content/forms/<folder-structure>/<form-name>.html` are cached and caching ignores URLs with pattern /content/dam/formsanddocument/<folder-name>/<form-name>/jcr:content.

## Pre-requisites {#pre-requisites}

* Enable the [merging or prefilling data at client](prepopulate-adaptive-form-fields.md#prefill-at-client) option
* Use URL format `http://host:port/content/forms/af/<afName>.<locale>.html` to request a localized version of an adaptive form instead of `http://host:port/content/forms/af/afName.html?afAcceptLang=<locale>`
* [Invalidate Dispatcher Cache from the Publish instances](https://docs.adobe.com/content/help/en/experience-manager-dispatcher/using/configuring/page-invalidate.html)
* Disable using browser locale for URLs with format `http://host:port/content/forms/af/<adaptivefName>.html`. To disable browser locale,
  * Open the configuration manager.
  * Locate and open the ![UIControl Adaptive Form and Interactive Communication Web Channel] configuration.
  * Disable the ![UIControl Use Browser Locale] option.


## Configure the cache {#configure-the-cache}

Perform the following steps to configure the adaptive forms cache:

1. Open the following URL for every publish instance of you environment and configure the replication agent:
   `http://[server]:[port]]/etc/replication/agents.publish/flush.html`

1. Add the following to your dispatcher.any or custom filter file:

   ```JSON
      /invalidate
      {
      /0000
      {
      /glob "*"
      /type "deny"
      }
      /0001
      {
      # Consider all HTML files stale after an activation.
      /glob "*.html"
      /type "allow"
      }
      /0002
      {
      # Exclude htmls present in AF directories
      /glob "/content/forms/**/*.html"
      /type "deny"
      }
   ```

   After adding the above filters:

   * An adaptive form and remains in cache until an updated is not pushed from a corresponding author instance .

   * When a resource referenced in an adaptive form is updated or a newer version of the resource is published, the impacted adaptive forms is automatically invalidated.  

1. Add the below rules dispatcher.any or custom rules file. It excludes the URLs that do not support caching. For example, Interactive Communication:

   ``` JSON

   /0000 {
         /glob "*"
         /type "allow"
   }
   ## Don't cache csrf login tokens
   /0001 {
         /glob "/libs/granite/csrf/token.json"
         /type "deny"
   }
   ## Don't cache IC - print channel
   /0002 {
         /glob "/content/forms/**/channels/print.html"
         /type "deny"
   }
   ## Don't cache IC - web channel
   /0003 {
         /glob "/content/forms/**/channels/web.html"
         /type "deny"
   }

   ```

1. Add the following parameters to the ignore URL parameters list: 
   
   ``` JSON

   /ignoreUrlParams {
    /0001 { /glob "*" /type "deny" }
    # added for AEM forms specific use cases.
    /0003 { /glob "dataRef" /type "allow" }
    /0004 { /glob "wcmmode" /type "allow" }
    /0005 { /glob "logConfig" /type "allow" }
   }

   ```  

Your environment is configured to use cache adaptive forms and related assets. 

<!-- 
1. Go to AEM web console configuration manager at https://'[server]:[port]'/system/console/configMgr.
1. Click **[!UICONTROL Adaptive Form and Interactive Communication Web Channel Configuration]** to edit its configuration values.
1. In the [!UICONTROL edit configuration values] dialog, specify the maximum number of forms or documents an instance of the AEM [!DNL Forms] server can cache in the **[!UICONTROL Number of Adaptive Forms]** field. The default value is 100.

   >[!NOTE]
   >
   >To disable the cache, set the value in the Number of Adaptive Forms field to **0**. The cache is reset and all forms and documents are removed from the cache when you disable or change the cache configuration.

   ![Configuration dialog for adaptive forms HTML cache](assets/cache-configuration-edit.png)

1. Click **[!UICONTROL Save]** to save the configuration. -->
