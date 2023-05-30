---
title: AEM Sites - GDPR Readiness
seo-title: AEM Sites - GDPR Readiness
description: Learn about the details of GDPR Readiness for AEM Sites.
seo-description: Learn about the details of GDPR Readiness for AEM Sites.
uuid: 00d1fdce-ef9a-4902-a7a5-7225728e8ffc
contentOwner: AEM Docs
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
discoiquuid: 772f6188-5e0b-4e66-b94a-65a0cc267ed3
exl-id: 8c1ea483-7319-4e5c-be4c-d43a2b67d316
---
# AEM Sites - GDPR Readiness{#aem-sites-gdpr-readiness}

>[!IMPORTANT]
>
>GDPR is used as an example in the sections below, but the details covered are applicable to all data protection and privacy regulations; such as GDPR, CCPA etc.

The European Union's General Data Protection Regulation on data privacy rights takes effect as of May 2018.

AEM Sites is ready to help customers with their GDPR compliance obligations. This page guides customers through the procedures to handle GDPR requests in AEM Sites. It describes the location of private data stored, and how to remove them manually or with code.

For further information see the [GDPR page at the Adobe Privacy Center](https://www.adobe.com/privacy/general-data-protection-regulation.html).

>[!NOTE]
>
>See [AEM GDPR Readiness](/help/managing/data-protection-and-privacy.md) for further details.

## Author Server {#author-server}

User accounts and UGC content on the author server are covered in the [Platform GDPR documentation](/help/managing/data-protection-and-privacy.md).

## Publish Server {#publish-server}

User accounts used to authenticate visitors on the site, and UGC content on the publish server are covered in the [Platform GDPR documentation](/help/managing/data-protection-and-privacy.md).

By default AEM Sites components do not store form-data entered by visitors on the  publish  server. It is recommended to forward the data to a third party system, or Adobe Campaign for further processing.

## Opt-In/Opt-Out {#opt-in-opt-out}

AEM has a [cookie opt-out service](/help/sites-developing/cookie-optout.md ) that can be used for managing the opt-in/opt-out for users.

## Enhanced Insights by Analytics {#enhanced-insights-by-analytics}

AEM Sites includes an optional integration with Enhanced Insights by Analytics which uses functionality within the Adobe Analytics On-demand Service.

For further information on managing GDPR data subject requests related to Adobe Analytics see [Adobe Analytics and GDPR](https://experienceleague.adobe.com/docs/analytics/admin/data-governance/an-gdpr-overview.html).

## Enhanced Personalization by Target {#enhanced-personalization-by-target}

AEM Sites includes an optional integration with Enhanced Personalization by Target which uses functionality within the Adobe Target On-demand Service.

For further information on managing GDPR data subject requests related to Adobe Target see [Adobe Target - Privacy and General Data Protection Regulation](https://developer.adobe.com/target/before-implement/privacy/cmp-privacy-and-general-data-protection-regulation/?lang=en).

## ContextHub {#contexthub}

AEM provides an optional data layer with [ContextHub](/help/sites-developing/contexthub.md). This keeps visitor-specific data in the browser, to be used for rules-based personalization.

By default, this visitor-data is not stored in AEM; AEM sends rules to the data layer to make personalization decisions in the browser.

>[!NOTE]
>
>Prior to Adobe CQ 5.6, the ClientContext (an earlier version of ContextHub) did send the data to the server, but did not store them.
>
>Adobe CQ 5.5 and earlier are now EOL and not covered by this documentation.

### Implementing Opt-in/Opt-Out {#implementing-opt-in-opt-out}

The site owner needs to implement an opt-out component according to the following guidelines.

These guidelines implement opt-in as the default. Thus, a website visitor must clearly agree, before any Personal Data is stored in the browser's (client-side) persistence.

* The opt-out component should be included every time the ContextHub component is included.
* The terms and conditions that relate to GDPR for the website, must be displayed to the website visitor, allowing them to:

    * accept
    * reject
    * change their previous choice

* If a site visitor accepts the site's terms and conditions, the ContextHub opt-out cookie should be removed:

  ```
  ContextHub.Utils.Cookie.removeItem('cq-opt-out');
  ```

* If a site visitor does not accept the site's terms and conditions, the ContextHub opt-out cookie should be set:

  ```
  ContextHub.Utils.Cookie.setItem('cq-opt-out', 1);
  ```

* To check whether ContextHub is running in opt-out mode, the following call should be made in the browser's console:

  ```
  var isOptedOut = ContextHub.isOptedOut(true) === true;
  // if isOptedOut is true, ContextHub is running in opt-out mode
  ```

### Previewing Persistence of ContextHub {#previewing-persistence-of-contexthub}

To preview persistance used ContextHub, a user can:

* Use the browser's console; for example:

    * Chrome:

        * Open Developer Tools &gt; Application &gt; Storage:

            * Local Storage &gt; (website) &gt; ContextHubPersistence
            * Session Storage &gt; (website) &gt; ContextHubPersistence
            * Cookies &gt; (website) &gt; SessionPersistence

    * Firefox:

        * Open Developer Tools &gt; Storage:

            * Local Storage &gt; (website) &gt; ContextHubPersistence
            * Session Storage &gt; (website) &gt; ContextHubPersistence
            * Cookies &gt; (website) &gt; SessionPersistence

    * Safari:

        * Open Preferences &gt; Advanced &gt; Show Develop menu in menu bar
        * Open Develop &gt; Show JavaScript Console

            * Console &gt; Storage &gt; Local Storage &gt; (website) &gt; ContextHubPersistence
            * Console &gt; Storage &gt; Session Storage &gt; (website) &gt; ContextHubPersistence
            * Console &gt; Storage &gt; Cookies &gt; (website) &gt; ContextHubPersistence

    * Internet Explorer:

        * Open Developer Tools &gt; Console

            * localStorage.getItem('ContextHubPersistence')
            * sessionStorage.getItem('ContextHubPersistence')
            * document.cookie

* Use the ContextHub API, in the browser's console:

    * ContextHub provides following data persistence layers:

        * ContextHub.Utils.Persistence.Modes.LOCAL (default)
        * ContextHub.Utils.Persistence.Modes.SESSION
        * ContextHub.Utils.Persistence.Modes.COOKIE
        * ContextHub.Utils.Persistence.Modes.WINDOW

      The ContextHub store defines which persistence layer will be used, thus to view the current state of the persistence all layers should be checked.

For example, to view data stored in localStorage:

To preview persistance used ContextHub, a user can:

* Use the browser's console:

    * Chrome - open Developer Tools &gt; Application &gt; Storage:

        * Local Storage &gt; (website) &gt; ContextHubPersistence
        * Session Storage &gt; (website) &gt; ContextHubPersistence
        * Cookies &gt; (website) &gt; SessionPersistence

    * Firefox - open Developer Tools &gt; Storage:

        * Local Storage &gt; (website) &gt; ContextHubPersistence
        * Session Storage &gt; (website) &gt; ContextHubPersistence
        * Cookies &gt; (website) &gt; SessionPersistence

* Use the ContextHub API, in the browser's console:

    * ContextHub provides following data persistence layers:

        * ContextHub.Utils.Persistence.Modes.LOCAL (default)
        * ContextHub.Utils.Persistence.Modes.SESSION
        * ContextHub.Utils.Persistence.Modes.COOKIE
        * ContextHub.Utils.Persistence.Modes.WINDOW

      The ContextHub store defines which persistence layer will be used, thus to view the current state of the persistence all layers should be checked.

For example, to view data stored in localStorage:

```
var storage = new ContextHub.Utils.Persistence({ mode: ContextHub.Utils.Persistence.Modes.LOCAL });
console.log(storage.getTree());
```

### Clearing Persistence of ContextHub {#clearing-persistence-of-contexthub}

To clear the ContextHub persistence:

* To clear persistence of currently loaded stores:

  ```
  // in order to be able to fully access persistence layer, Opt-Out must be turned off
  ContextHub.Utils.Cookie.removeItem('cq-opt-out');

  // following call asks all currently loaded stores to clear their data
  ContextHub.cleanAllStores();

  // following call asks all currently loaded stores to set back default values (provided in their configs)
  ContextHub.resetAllStores();

  ```

* To clear a specific persistence layer; for example, sessionStorage:

  ```
  var storage = new ContextHub.Utils.Persistence({ mode: ContextHub.Utils.Persistence.Modes.SESSION });
  storage.setItem('/store', null);
  storage.setItem('/_', null);

  // to confirm that nothing is stored:
  console.log(storage.getTree());
  ```

* To clear all ContextHub persistence layers, the appropriate code must be called for all layers:

    * ContextHub.Utils.Persistence.Modes.LOCAL (default)
    * ContextHub.Utils.Persistence.Modes.SESSION
    * ContextHub.Utils.Persistence.Modes.COOKIE
    * ContextHub.Utils.Persistence.Modes.WINDOW
