---
title: AEM Livefyre Recipes
seo-title: AEM Livefyre Recipes
description: Step-by-step instructions on common use cases for Adobe Experience Manager Livefyre. 
seo-description: Step-by-step instructions on common use cases for Adobe Experience Manager Livefyre. 
uuid: 78695a63-fca6-4990-9755-0aeaae4a7f64
contentOwner: alba
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: integration
content-type: reference
discoiquuid: fdea5ede-d44f-463e-af8a-111ee7469ede
---

# AEM Livefyre Recipes{#aem-livefyre-recipes}

Step-by-step instructions on common use cases for Adobe Experience Manager Livefyre.

## Curate UGC using the out-of-the-box Livefyre AEM components and display using Livefyre Media Wall {#curate-ugc-using-the-out-of-the-box-livefyre-aem-components-and-display-using-livefyre-media-wall}

Media Wall streams social and native Livefyre content into a real-time social wall. There are multiple ways to implement Media Wall in AEM depending on your use case and requirements.

The AEM Livefyre Package provides an out-of-box implementation, whereas the traditional integration provides the ability to create custom Livefyre AEM components.

### AEM Integration {#aem-integration}

The Livefyre Adobe Experience Manager Package is available for AEM 6.1, 6.2SP1, 6.3, ,6.4 and 6.4 SP1. AEM 5.x and 6.0 are not supported. For detailed instructions, see [Integrating with Livefyre](https://https://helpx.adobe.com/experience-manager/6-4/sites/administering/using/livefyre.html).

To see which Livefyre Apps are supported, see the [AEM Support Matrix for Livefyre Apps](https://https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/livefyre.html#AEMSupportMatrixforLivefyreApps).

### Traditional Implementation (for customized AEM components) {#traditional-implementation-for-customized-aem-components}

There are three ways to implement Livefyre into a custom AEM component or other CMSs like WordPress, Sitecore, or DemandWare. A traditional Livefyre integration is CMS agnostic.

**Method 1: Designer App Implementation**

* **What:** Simplest and fastest way of integrating a Livefyre App. You can design, configure, and generate a customized JavaScript embed code to integrate a Media Wall App on a page in minutes.
* **How:**  [Create, Preview, Publish, and Embed a Media Wall App](https://marketing.adobe.com/resources/help/en_US/livefyre/c_create_an_app.html)

* **Example:** [https://codepen.io/dharafyre/pen/bvGrLo](https://codepen.io/dharafyre/pen/bvGrLo)

**Method 2: SDK Implementation**

* **What:** [Livefyre.js](https://marketing.adobe.com/resources/help/en_US/livefyre/c_livefyre.js.html) is the core library that powers Apps and Auth on a site. It defines the global *window.Livefyre* object and a single public method, *Livefyre.require*, which can be used to load other Livefyre JavaScript libraries that help with embedding Livefyre Apps and integrating with third party User Auth platforms.

* **How**: [Use the Livefyre JavaScript SDK’s streamhub-wallpackage](https://marketing.adobe.com/resources/help/en_US/livefyre/?f=c_media_wall_app&s=c_media_wall_integration)

* **Example**: [https://codepen.io/dharafyre/pen/KZKBNv?editors=1010](https://codepen.io/dharafyre/pen/KZKBNv?editors=1010)

For advanced customizations using the SDK, please refer to [StreamHub SDKs](https://github.com/Livefyre/streamhub-sdk).

**Method 3: API Implementation**

* For creating customized experiences and data visualizations, Livefyre Apps can be created from scratch by consuming Livefyre and social data using the [Bootstrap and Stream API](https://marketing.adobe.com/resources/help/en_US/livefyre/bootstrap-stream-api.html).

Make sure you follow [Twitter](https://developer.twitter.com/en/developer-terms/display-requirements.html), [Facebook](https://en.facebookbrand.com/guidelines/brand), and [Instagram](https://en.instagram-brand.com/) display guidelines when building the UI for UGC.

### Media Wall Authentication Integration {#media-wall-authentication-integration}

For Media Wall Integrations requiring authentication, please refer to:

* [Customize Single Sign on Integration](https://https://helpx.adobe.com/experience-manager/6-4/sites/administering/using/livefyre.html#CustomizeSingleSignonIntegration) for AEM Identity Management
* [Identity Integration](https://marketing.adobe.com/resources/help/en_US/livefyre/t_about_identity_integration.html) for third party authentication platforms

### Use Case Overview {#use-case-overview}

As an AEM customer, I want to curate UGC using the out-of-the-box Livefyre AEM components and display using Livefyre Media Wall:

Steps to implement:

1. [Getting Started](https://https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/livefyre.html)
1. [Configure AEM to use Livefyre](https://https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/livefyre.html)
1. [Drag and drop AEM Media Wall component onto your page](https://https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/livefyre.html#UseLivefyrewithAEMSites)
1. [Configure Streams and add rules to curate UGC and display on the Media Wall component](https://marketing.adobe.com/resources/help/en_US/livefyre/c_streams.html)

For training videos on streaming UGC, see [Create Automatic Content Streams and Search Social Content in Adobe Experience Manager Livefyre](https://helpx.adobe.com/experience-manager/tutorials.html).

### Customer Examples {#customer-examples}

* [CNN Media Wall](https://edition.cnn.com/specials/nepal-earthquake-media-wall)
* [PGA Tour Media Wall](https://www.pgatour.com/social-hub.html)

For creating customized experiences and data visualizations, Livefyre Apps can be created from scratch by consuming Livefyre and social data using the [Bootstrap and Stream API](https://marketing.adobe.com/resources/help/en_US/livefyre/bootstrap-stream-api.html).

For Livefyre Apps requiring authentication, please see [Identity Integration](https://marketing.adobe.com/resources/help/en_US/livefyre/t_about_identity_integration.html) for third party authentication platforms.

* [PGA Tour Media Wall](https://www.pgatour.com/social-hub.html)
* [TimeOut](https://www.timeout.com/london/restaurants/forest-bar-kitchen#tab_panel_3)

## Integrate Livefyre Comments using AEM Components or traditional Livefyre integration {#integrate-livefyre-comments-using-aem-components-or-traditional-livefyre-integration}

### AEM Integration {#aem-integration-1}

The Livefyre Adobe Experience Manager Package is available for AEM 6.1, 6.2SP1, 6.3, ,6.4 and 6.4 SP1. AEM 5.x and 6.0 are not supported. For detailed instructions, see [Integrating with Livefyre](https://https://helpx.adobe.com/experience-manager/6-4/sites/administering/using/livefyre.html).

### Traditional Implementation (for customized AEM components) {#traditional-implementation-for-customized-aem-components-1}

There are three ways to implement Livefyre Comments App into a custom AEM component or other CMSs like WordPress, Sitecore, or DemandWare. A traditional Livefyre integration is CMS agnostic.

**Method 1: Designer App Implementation**

* **What:** Simplest and fastest way of integrating a Livefyre App. You can design, configure, and generate a customized JavaScript embed code to integrate a Media Wall App on a page in minutes.
* **How:** [Create, Preview, Publish, and Embed a Comments App](https://marketing.adobe.com/resources/help/en_US/livefyre/c_create_an_app.html)

* **Example:** [https://codepen.io/dharafyre/pen/oYoJdP](https://codepen.io/dharafyre/pen/oYoJdP)

**Method 2: SDK Implementation**

* **What:** [Livefyre.js](https://marketing.adobe.com/resources/help/en_US/livefyre/c_livefyre.js.html) is the core library that powers Apps and Auth on a site. It defines the global *window.Livefyre* object and a single public method, *Livefyre.require*, which can be used to load other Livefyre JavaScript libraries that help with embedding Livefyre Apps and integrating with third party User Auth platforms.

* **How:**

    * Create a collection/App using [CollectionMeta token](https://marketing.adobe.com/resources/help/en_US/livefyre/t_create_a_collectionmeta_token.html).
    * Integrate [Comments App](https://marketing.adobe.com/resources/help/en_US/livefyre/c_comments_integration.html) into sites using the Livefyre.js embed code structure.

* **Example:**  [https://codepen.io/dharafyre/pen/oYoJdP](https://codepen.io/dharafyre/pen/oYoJdP)

For advanced customizations using the SDK, please see [StreamHub SDKs](https://github.com/Livefyre/streamhub-sdk).

**Method 3: API Implementation**

* For creating customized experiences and data visualizations, Livefyre Apps can be created from scratch by consuming Livefyre and social data using the [Bootstrap and Stream API](https://marketing.adobe.com/resources/help/en_US/livefyre/bootstrap-stream-api.html).

### Comments App Authentication Integration {#comments-app-authentication-integration}

* [Customize Single Sign on Integration](https://https://helpx.adobe.com/experience-manager/6-4/sites/administering/using/livefyre.html#CustomizeSingleSignonIntegration) for AEM Identity Management
* [Identity Integration](https://marketing.adobe.com/resources/help/en_US/livefyre/t_about_identity_integration.html) for third party authentication platforms

### Customer Examples {#customer-examples-1}

* [Poise (Kimberly Klark)](https://www.poise.com/en-us/advice-and-support/blog-and-podcast/blog/5-holiday-party-tips-for-managing-lbl)

## Use Livefyre AEM Assets integration to import UGC in AEM Assets {#use-livefyre-aem-assets-integration-to-import-ugc-in-aem-assets}

**Livefyre Setup (for UGC Curation and Rights Management):**

1. [Configure Streams and Add Rules to curate UGC to Livefyre Asset Library Folders](https://marketing.adobe.com/resources/help/en_US/livefyre/c_streams.html).

    1. For training videos on streaming UGC, see [Create Automatic Content Streams and Search Social Content in Adobe Experience Manager Livefyre](https://helpx.adobe.com/experience-manager/tutorials.html).

1. [Gather, organize, and manage curated UGC in Livefyre Asset Library folders](https://marketing.adobe.com/resources/help/en_US/livefyre/c_assets.html).

    1. For training videos on creating and managing folders in the Livefyre Studio Asset Library, see [Work with Assets in Adobe Experience Manager Livefyre](https://helpx.adobe.com/experience-manager/tutorials.html).

1. [Request Rights for curated UGC using Livefyre Studio](https://marketing.adobe.com/resources/help/en_US/livefyre/c_how_requesting_rights_works.html).

**AEM Setup (for importing UGC to AEM Assets):**

1. [Getting Started](https://https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/livefyre.html#GettingStarted)
1. [Configure AEM to use Livefyre](https://https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/livefyre.html#ConfigureAEMtouseLivefyre)
1. [Import UGC curated by Livefyre in to AEM Assets](https://https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/livefyre.html#UseLivefyrewithAEMAssets)

* [Tourism Australia](https://www.australia.com/en-us)

## Integrate Livefyre Reviews using AEM Components or traditional Livefyre integration {#integrate-livefyre-reviews-using-aem-components-or-traditional-livefyre-integration}

### AEM Integration {#aem-integration-2}

The Livefyre Adobe Experience Manager Package is available for AEM 6.1, 6.2SP1, 6.3, ,6.4 and 6.4 SP1. AEM 5.x and 6.0 are not supported. For detailed instructions, see [Integrating with Livefyre](https://https://helpx.adobe.com/experience-manager/6-4/sites/administering/using/livefyre.html).

Reviews Component is not a supported component for AEM 6.1. Please check the [AEM support matrix for all Livefyre Apps](https://https://helpx.adobe.com/experience-manager/6-3/sites/administering/using/livefyre.html#AEMSupportMatrixforLivefyreApps).

### Traditional Implementation (for customized AEM components) {#traditional-implementation-for-customized-aem-components-2}

There are two ways to implement Livefyre Reviews App into a custom AEM component or other CMSs like WordPress, Sitecore, or DemandWare. A traditional Livefyre integration is CMS agnostic.

**Method 1: SDK Implementation**

* **What:** [Livefyre.js](https://marketing.adobe.com/resources/help/en_US/livefyre/c_livefyre.js.html) is the core library that powers Apps and Auth on a site. It defines the global *window.Livefyre* object and a single public method, *Livefyre.require*, which can be used to load other Livefyre JavaScript libraries that help with embedding Livefyre Apps and integrating with third party User Auth platforms.

* **How:**

    * Create the Reviews [CollectionMeta token](https://marketing.adobe.com/resources/help/en_US/livefyre/c_reviews_integration.html) to specify metadata to store within the Reviews Collection.
    * Integrate [Reviews App](https://marketing.adobe.com/resources/help/en_US/livefyre/c_reviews_integration.html) into Sites using the *Livefyre.js* embed code structure

* **Example:**  [https://codepen.io/dharafyre/pen/GXgvvd](https://codepen.io/dharafyre/pen/GXgvvd)

For advanced customizations using the SDK, please see [StreamHub SDKs](https://github.com/Livefyre/streamhub-sdk).

**Method 2: API Implementation**

* For creating customized experiences and data visualizations, Livefyre Apps can be created from scratch by consuming Livefyre and social data using the Bootstrap and Stream API.

Additional Ratings and Reviews APIs can be found [here](https://api.livefyre.com/docs/apis/by-category/ratings-and-reviews).

### Comments App Authentication Integration {#comments-app-authentication-integration-1}

* [Customize Single Sign on Integration](https://https://helpx.adobe.com/experience-manager/6-4/sites/administering/using/livefyre.html#CustomizeSingleSignonIntegration) for AEM Identity Management
* [Identity Integration](https://marketing.adobe.com/resources/help/en_US/livefyre/t_about_identity_integration.html) for third party authentication platforms

### Customer Examples {#customer-examples-2}

* [TimeOut](https://www.timeout.com/london/restaurants/forest-bar-kitchen#tab_panel_3)
* [myrecipes](https://www.myrecipes.com/recipe/shrimp-florentine-pasta)

