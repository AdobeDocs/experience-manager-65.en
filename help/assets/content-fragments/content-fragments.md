---
title: Working with Content Fragments
description: Learn how Content Fragments in Adobe Experience Manager (AEM) allow you to design, create, curate, and use page-independent content, ideal for headless delivery.
feature: Content Fragments
role: User
exl-id: 0ee883c5-0cea-46b7-a759-600b8ea3bc3e
---
# Working with Content Fragments {#working-with-content-fragments}

With Adobe Experience Manager (AEM), Content Fragments allow you to design, create, curate and [publish page-independent content](/help/sites-authoring/content-fragments.md) They allow you to prepare content ready for use in multiple locations/over multiple channels, ideal for headless delivery.

Content fragments contain structured content:

* They are based on a [Content Fragment Model](/help/assets/content-fragments/content-fragments-models.md), which predefines a structure for the resulting fragment.
* The structure can range between:
  * Basic
    * For example, a single, multi-line text field.
    * Can be used for preparing straightforward content for use in page authoring.
  * Complex
    * A combination of many fields of varying data types, including text, number, boolean, data and time, amongst others.
    * Can be used either for preparing more structured content for page authoring, or for delivery to your application.
  * Nested
    * The reference data types available allow you to nest your content.
    * Tends to be used for delivery to your application.

Content fragments can also be delivered in JSON format, using the Sling Model (JSON) export capabilities of AEM core components. This form of delivery:

* enables you to use the component to manage which elements of a fragment to deliver
* allows bulk-delivery, by adding multiple content fragment core components on the page being used for API delivery

This and the following pages cover the tasks for creating, configuring, maintaining and using your content fragments:

* [Enable Content Fragment functionality for your instance](/help/assets/content-fragments/content-fragments-configuration-browser.md)
* [Content Fragment Models](/help/assets/content-fragments/content-fragments-models.md) - enabling, creating and defining your models
* [Managing Content Fragments](/help/assets/content-fragments/content-fragments-managing.md) - create your content fragments; then edit, publish and reference
* [Variations - Authoring Fragment Content](/help/assets/content-fragments/content-fragments-variations.md) - author the fragment content and create variations of the Master
* [Markdown](/help/assets/content-fragments/content-fragments-markdown.md) - using markdown syntax for your fragment
* [Using Associated Content](/help/assets/content-fragments/content-fragments-assoc-content.md) - adding associated content
* [Metadata - Fragment Properties](/help/assets/content-fragments/content-fragments-metadata.md) - viewing and editing the fragment properties
* Use [Content Fragments, together with GraphQL, to deliver content](/help/assets/content-fragments/content-fragments-graphql.md) for use in your applications. To help with this, you can preview [JSON output](/help/assets/content-fragments/content-fragments-json-preview.md).

>[!NOTE]
>
>These pages can be read in conjunction with:
>
>* [Page Authoring with Content Fragments](/help/sites-authoring/content-fragments.md).
>* [Customizing and Extending Content Fragments](/help/sites-developing/customizing-content-fragments.md)
>* [Content Fragments Configuring Components for Rendering](/help/sites-developing/content-fragments-config-components-rendering.md)
>* [Content Fragments Support in AEM Assets HTTP API](/help/assets/assets-api-content-fragments.md)
>* [AEM GraphQL API for use with Content Fragments](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md)

The number of communication channels is increasing annually. Typically channels refer to the delivery mechanism, either as the:

* Physical channel; e.g. desktop, mobile.
* Form of delivery in a physical channel; e.g. the "product detail page", "product category page" for desktop, or "mobile web", "mobile app" for mobile.

However, you (probably) do not want to use exactly the same content for all channels - you need to optimize your content according to the specific channel.

Content fragments allow you to:

* Consider how to reach target audiences efficiently across channels.
* Create and manage channel-neutral editorial content.
* Build content pools for a range of channels.
* Design content variations for specific channels.
* Add images to your text by inserting assets (mixed-media fragments).
* Create nested content to reflect the complexity of your data.

These content fragments can then be assembled to provide experiences over a variety of channels.

>[!NOTE]
>
>**Content Fragments** and **[Experience Fragments](/help/sites-authoring/experience-fragments.md)** are different features within AEM:
>* **Content Fragments** are editorial content, that can be used to access structured data, including texts, numbers, and dates, amongst others. They are pure content, with definition and structure, but without additional visual design and/or layout.
>* **Experience Fragments** are fully laid out content; a fragment of a web page.
>
>Experience Fragments can contain content in the form of Content Fragments, but not the other way around.
>
>For further information see also [Understanding Content Fragments and Experience Fragments in AEM](https://experienceleague.adobe.com/docs/experience-manager-learn/sites/content-fragments/understand-content-fragments-and-experience-fragments.html#content-fragments).

>[!NOTE]
>
>Prior to AEM 6.3 Content Fragments were created with the use of templates instead of models. Templates are no longer available for creating new fragments, but any fragments created with such a template are still supported.

## Content Fragments and Content Services {#content-fragments-and-content-services}

AEM Content Services are designed to generalize the description and delivery of content in/from AEM beyond a focus on web pages.

They provide the delivery of content to channels that are not traditional AEM web pages, using standardized methods that can be consumed by any client. These channels can include:

* Single Page Applications
* Native Mobile Applications
* other channels and touch-points external to AEM

Delivery is made in JSON format using the JSON Exporter.

AEM Content Fragments can be used to describe and manage structured content. Structured content is defined in models that can contain a variety of content types; including text, numerical data, boolean, date and time, and more.

Together with the JSON export capabilities of AEM core components, this structured content can then be used to deliver AEM content to channels other than AEM pages.

<!--
>[!NOTE]
>
>See [Headless and AEM](/help/implementing/developing/headless/introduction.md) for an introduction to Headless Development for AEM Sites.
--> 

>[!NOTE]
>
>AEM also supports the translation of fragment content. 

<!--
>[!NOTE]
>
>AEM also supports the translation of fragment content. See [Translating Assets](/help/assets/translate-assets.md) for further information.
-->

## Content Type {#content-type}

Content fragments are:

* Stored as **Assets**:

  * Content fragments (and their variations) can be created and maintained from the **Assets** console.
  * Authored and edited in the Content Fragment Editor.

* Used in the [page editor by means of the Content Fragment component](/help/sites-authoring/content-fragments.md) (referencing component):

  * The **Content Fragment** component is available to page authors. It allows them to reference, and deliver, the required content fragment in either HTML or JSON format.

* Accessible using the [AEM GraphQL API](/help/sites-developing/headless/graphql-api/graphql-api-content-fragments.md).

Content Fragments are a content structure that:

* Are without layout or design (some text formatting is possible in Rich Text mode).
* Contain one, or more, [constituent parts](#constituent-parts-of-a-content-fragment).
* Can [contain, or be connected to, images](#fragments-with-visual-assets).
* Can use [in-between content](#in-between-content-when-page-authoring-with-content-fragments) when referenced on a page.

* Are independent from the delivery mechanism (i.e. page, channel).

### Fragments with Visual Assets {#fragments-with-visual-assets}

To give authors more control of their content, images can be added to and/or integrated with a content fragment.

Assets can be used with a content fragment in several ways; each with its own advantage(s):

* **Insert Asset** into a fragment (mixed-media fragments)

  * Are an integral part of the fragment (see [Constituent Parts of a Content Fragment](#constituent-parts-of-a-content-fragment)).
  * Define the position of the asset.
  * See [Inserting Assets into your Fragment](/help/assets/content-fragments/content-fragments-variations.md#inserting-assets-into-your-fragment) in the Fragment Editor for more information.

  >[!NOTE]
  >
  >Visual assets inserted into the content fragment itself are attached to the preceding paragraph. When the fragment is added to a page these assets are moved in relation to that paragraph when in-between content is added.

* **Associated Content**

  * Are connected to a fragment; but not a fixed part of the fragment (see [Constituent Parts of a Content Fragment](#constituent-parts-of-a-content-fragment)).
  * Allows some flexibility for positioning.
  * Are easily available for use (as in-between content) when using the fragment on a page.
  * See [Associated Content](/help/assets/content-fragments/content-fragments-assoc-content.md) for more information.

* Assets available from the **Assets browser** of the page editor

  * Allow full flexibility for selection of an asset.
  * Allows some flexibility for positioning.
  * Does not provide the concept of being approved for a specific fragment.

<!--
  * See [Assets Browser](/help/sites-authoring/environment-tools.md#assets-browser) for more information.
-->

### Constituent Parts of a Content Fragment {#constituent-parts-of-a-content-fragment}

The content fragment assets are made up of the following parts (either directly or indirectly):

* **Fragment Elements**

  * Elements correlate to the data fields holding content.
  * You use a content model to create the content fragment. The elements (fields) specified in the model define the structure of the fragment. These elements (fields) can be of a variety of data-types.

* **Fragment Paragraphs**

  * Blocks of text, often multi-line, that are delimited as individual entities.

  * In the [Rich Text](/help/assets/content-fragments/content-fragments-variations.md#rich-text) and [Markdown](/help/assets/content-fragments/content-fragments-variations.md#markdown) modes, a paragraph can be formatted as a header, in which case it and the following paragraph belong together as one unit.

  * Enable content control during page authoring.

* **Assets Inserted into a Fragment (Mixed-Media Fragments)**

  * Assets (images) inserted into the actual fragment and used as the internal content of a fragment.
  * Are embedded in the paragraph system of the fragment.
  * Can be formatted when the [fragment is used/referenced on a page](/help/sites-authoring/content-fragments.md). 
  * Can only be added to, deleted from, or moved within, a fragment using the fragment editor. These actions cannot be made in the page editor.
  * Can only be added to, deleted from, or moved within, a fragment using [Rich Text format in the fragment editor](/help/assets/content-fragments/content-fragments-variations.md#inserting-assets-into-your-fragment).
  * Can only be added to multi-line text elements (any fragment type).
  * Are attached to the preceding text (paragraph).

    >[!CAUTION]
    >
    >Assets can be (inadvertently) removed from a fragment by switching to Plain Text format.

    >[!NOTE]
    >
    >Assets can also be added as [additional (in-between) content](/help/sites-authoring/content-fragments.md#using-associated-content) when using a fragment on a page; using either Associated Content or assets from the Assets browser.

* **Associated Content**

  * This is content external to, but with editorial relevance for, a fragment. Typically images, videos or other fragments.
  * The individual assets within the collection are available to be used with the fragment in the page editor, when it is added to a page. This means that they are optional, depending on the requirements of the specific channel.
  * The assets are [associated to fragments via collections](/help/assets/content-fragments/content-fragments-assoc-content.md); associated collections allow the author to decide which assets to use when they are authoring the page.

    * Collections can be associated to fragments as default content, or by authors during fragment authoring.
    * [Assets (DAM) Collections](/help/assets/manage-collections.md) are the basis for the associated content of fragments.
  * Optionally you can also add the fragment itself to a collection to aid tracking.

* **Fragment Metadata**

  * Use the [Assets metadata schemas](/help/assets/metadata-schemas.md).
  * Tags can be created when you:

    * Create and author the fragment
    * Or later:

      * By viewing/editing the fragment **Properties** from the console
      * By editing the **Metadata** when in the fragment editor

  >[!CAUTION]
  >
  >Metadata processing profiles do not apply to Content Fragments.

* **Master**

  * An integral part of the fragment

    * Every content fragment has one instance of Master.
    * Master cannot be deleted.

  * Master is accessible in the fragment editor under **[Variations](/help/assets/content-fragments/content-fragments-variations.md)**.
  * Master is not a variation as such, but is the basis of all variations.

* **Variations**

  * Renditions of fragment text that are specific to editorial purpose; can be related to channel but is not compulsory, can also be for ad-hoc local modifications.
  * Are created as copies of **Master**, but can then be edited as required; there is usually content overlap between the variations themselves.
  * Can be defined during fragment authoring.
  * Stored in the fragment, to help avoid scattering of content copies.
  * Variations can be [synchronized](/help/assets/content-fragments/content-fragments-variations.md#synchronizing-with-master) with Master if the Master content has been updated.
  * Can be [Summarized](/help/assets/content-fragments/content-fragments-variations.md#summarizing-text) to quickly truncate the text to a predefined length.
  * Available under the [Variations](/help/assets/content-fragments/content-fragments-variations.md) tab of the fragment editor.

### In-Between Content when Page Authoring with Content Fragments {#in-between-content-when-page-authoring-with-content-fragments}

In-between content:

* Is available for use in the Page Editor when working with Content Fragments.
* Is [additional content added within the flow of a fragment](/help/sites-authoring/content-fragments.md#adding-in-between-content) once it has been used/referenced on a page.
* Is available for use in the [Page Editor when working with Content Fragments](/help/sites-authoring/content-fragments.md). 
* In-between content can be added to any fragment, where there is only one element visible.
* Associated content can be used, as can assets and/or components from the appropriate browser.

>[!CAUTION]
>
>The in-between content is page content. It is not stored in the content fragment.

### Required by Fragments {#required-by-fragments}

To create content fragments you  need:

* **Content Model**

  * Are [enabled using the Configuration Browser](/help/assets/content-fragments/content-fragments-configuration-browser.md).
  * Are [created using Tools](/help/assets/content-fragments/content-fragments-models.md).
  * Required to [create a fragment](/help/assets/content-fragments/content-fragments-managing.md#creating-content-fragments).
  * Defines the structure of a fragment (title, content elements, tag definitions).
  * Content model definitions require a title and one data element; everything else is optional. 
  * The model can define default content - if applicable. 
  * Authors cannot change the defined structure when authoring fragment content.
  * Changes made to a model after dependent content fragments have been created, can impact those content fragments.

To use your Content Fragments for page authoring you also need:

* **Content Fragment Component**

  * Instrumental to delivering the fragment in HTML and/or JSON format.
  * Required to [reference the fragment on a page](/help/sites-authoring/content-fragments.md).
  * Responsible for layout and delivery of a fragment; i.e. channels.
  * Fragments need one or more dedicated components to define layout and deliver some or all elements/variations and associated content.
  * Dragging a fragment onto a page in authoring will automatically associate the required component.

## Example Usage {#example-usage}

A fragment, with its elements and variations, can be used to create coherent content for multiple channels. When designing your fragment you need to consider what will be used where.
