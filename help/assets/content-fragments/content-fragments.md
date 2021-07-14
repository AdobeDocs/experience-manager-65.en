---
title: Working with Content Fragments
seo-title: Working with Content Fragments
description: Learn how Content Fragments allow you to design, create, curate and use page-independent content.
seo-description: Learn how Content Fragments allow you to design, create, curate and use page-independent content.
uuid: d35d5638-43a9-424d-9806-6e8d459980d7
contentOwner: Alison Heimoz
topic-tags: content-fragments
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
content-type: reference
discoiquuid: 7ecc1bcf-38a9-4a59-8dd3-79cb90dec33d
docset: aem65

feature: Content Fragments
role: User, Admin
exl-id: b204df18-2aef-4905-82f8-c777928ba828
---
# Working with Content Fragments{#working-with-content-fragments}

Adobe Experience Manager (AEM) Content Fragments allow you to design, create, curate and [publish page-independent content](/help/sites-authoring/content-fragments.md). They allow you to prepare content ready for use in multiple locations/over multiple channels.

Content fragments can also be delivered in JSON format, using the Sling Model (JSON) export capabilities of AEM core components. This form of delivery:

* enables you to use the component to manage which elements of a fragment to deliver
* allows bulk-delivery, by adding multiple content fragment core components on the page being used for API delivery

This and the following pages cover the tasks for creating, configuring and maintaining your content fragments:

* [Managing Content Fragments](/help/assets/content-fragments/content-fragments-managing.md) - create your content fragments; then edit, publish and reference
* [Content Fragment Models](/help/assets/content-fragments/content-fragments-models.md) - enabling, creating and defining your models
* [Variations - Authoring Fragment Content](/help/assets/content-fragments/content-fragments-variations.md) - author the fragment content and create variations of the Master
* [Markdown](/help/assets/content-fragments/content-fragments-markdown.md) - using markdown syntax for your fragment
* [Using Associated Content](/help/assets/content-fragments/content-fragments-assoc-content.md) - adding associated content
* [Metadata - Fragment Properties](/help/assets/content-fragments/content-fragments-metadata.md) - viewing and editing the fragment properties

>[!NOTE]
>
>These pages should be read in conjunction with [Page Authoring with Content Fragments](/help/sites-authoring/content-fragments.md).

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

These content fragments can then be assembled to provide experiences over a variety of channels.

## Content Fragments and Content Services {#content-fragments-and-content-services}

AEM Content Services are designed to generalize the description and delivery of content in/from AEM beyond a focus on web pages.

They provide the delivery of content to channels that are not traditional AEM web pages, using standardized methods that can be consumed by any client. These channels can include:

* Single Page Applications
* Native Mobile Applications
* other channels and touch-points external to AEM

Delivery is made in JSON format.

AEM Content Fragments can be used to describe and manage structured content. Structured content is defined in models that can contain a variety of content types; including text, numerical data, boolean, date and time, and more.

Together with the JSON export capabilities of AEM core components, this structured content can then be used to deliver AEM content to channels other than AEM pages.

>[!NOTE]
>
>**Content Fragments** and **[Experience Fragments](/help/sites-authoring/experience-fragments.md)** are different features within AEM:
>* **Content Fragments** are editorial content, primarily text and related images. They are pure content, without design and layout.
>* **Experience Fragments** are fully laid out content; a fragment of a web page.
>
>Experience Fragments can contain content in the form of Content Fragments, but not the other way around.
>
>For further information see also [Understanding Content Fragments and Experience Fragments in AEM](https://docs.adobe.com/content/help/en/experience-manager-learn/sites/content-fragments/understand-content-fragments-and-experience-fragments.html).

>[!CAUTION]
>
>Content fragments are not available in the classic UI.
>
>The Content Fragment component can be seen in the classic UI sidekick, but further functionality is not available.

>[!NOTE]
>
>AEM also supports the translation of fragment content. See [Creating Translation Projects for Content Fragments](/help/assets/creating-translation-projects-for-content-fragments.md) for further information.

## Types of Content Fragment {#types-of-content-fragment}

Content fragments can be either:

* Simple fragments
  These have no predefined structure. They contain only text, and images.
  These are based on the Simple Fragment template.

* Fragments that contain structured content
  These are based on a [Content Fragment Model](/help/assets/content-fragments/content-fragments-models.md), which predefines a structure for the resulting fragment.
  These can also be used to realize Content Services using the JSON Exporter.

## Content Type {#content-type}

Content fragments are:

* Stored as **Assets**:

  * Content fragments (and their variations) can be created and maintained from the **Assets** console.
  * Authored and edited in the Content Fragment Editor.

* Used in the [page editor by means of the Content Fragment component](/help/sites-authoring/content-fragments.md) (referencing component):

  * The **Content Fragment** component is available to page authors. It allows them to reference, and deliver, the required content fragment in either HTML or JSON format.

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
  * See [Assets Browser](/help/sites-authoring/author-environment-tools.md#assets-browser) for more information.

### Constituent Parts of a Content Fragment {#constituent-parts-of-a-content-fragment}

The content fragment assets are made up of the following parts (either directly or indirectly):

* **Fragment Elements**

  * Elements correlate to the data fields holding content.
  * For fragments with structured content, you use a content model to create the content fragment. The elements (fields) specified in the model define the structure of the fragment. These elements (fields) can be of a variety of data-types.
  * For simple fragments:

    * The content is held in one (or more) multi-line text field(s), or element(s).
    * The elements are defined in the fragment template (cannot be defined when authoring the fragment, see [Content Fragment Templates](/help/sites-developing/content-fragment-templates.md)).

* **Fragment Paragraphs**

  * Blocks of text, that are:

    * separated by vertical spaces (carriage return)
    * in multi-line text elements; in either simple or structured fragments

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
  >Can be (inadvertently) removed from a fragment by switching to Plain Text format.

  >[!NOTE]
  >
  >Assets can also be added as [additional (in-between) content](/help/sites-authoring/content-fragments.md#using-associated-content) when using a fragment on a page; using either Associated Content or assets from the Assets browser.

* **Associated Content**

  * This is content external to, but with editorial relevance for, a fragment. Typically images, videos or other fragments.
  * The individual assets within the collection are available to be used with the fragment in the page editor, when it is added to a page. This means that they are optional, depending on the requirements of the specific channel.
  * The assets are [associated to fragments via collections](/help/assets/content-fragments/content-fragments-assoc-content.md); associated collections allow the author to decide which assets to use when they are authoring the page.

    * Collections can be associated to fragments via templates, as default content, or by authors during fragment authoring.
    * [Assets (DAM) Collections](/help/assets/manage-collections.md) are the basis for the associated content of fragments.

  * Optionally you can also add the fragment itself to a collection to aid tracking.

* **Fragment Metadata**

  * Use the [Assets metadata schemas](/help/assets/metadata.md).
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
  * Can be defined during fragment authoring or pre-defined in fragment templates.
  * Stored in the fragment, to help avoid scattering of content copies.
  * Variations can be [synchronized](/help/assets/content-fragments/content-fragments-variations.md#synchronizing-with-master) with Master if the Master content has been updated.
  * Can be [Summarized](/help/assets/content-fragments/content-fragments-variations.md#summarizing-text) to quickly truncate the text to a predefined length.
  * Available under the [Variations](/help/assets/content-fragments/content-fragments-variations.md) tab of the fragment editor.

### In-Between Content when Page Authoring with Content Fragments {#in-between-content-when-page-authoring-with-content-fragments}

In-between content:

* Is available for use in the [Page Editor when working with Content Fragments](/help/sites-authoring/content-fragments.md).
* Is [additional content added within the flow of a fragment](/help/sites-authoring/content-fragments.md#adding-in-between-content) once it has been used/referenced on a page.
* In-between content can be added to any fragment, where there is only one element visible.
* Associated content can be used, as can assets and/or components from the appropriate browser.

>[!CAUTION]
>
>The in-between content is page content. It is not stored in the content fragment.

### Required by Fragments {#required-by-fragments}

To create, edit and use content fragments you also need:

* **Content Model**

  * Are [enabled and then created using Tools](/help/assets/content-fragments/content-fragments-models.md).
  * Required to [create a structured fragment](/help/assets/content-fragments/content-fragments-managing.md#creating-content-fragments).
  * Defines the structure of a fragment (title, content elements, tag definitions).
  * Content models definitions require a title and one data element; everything else is optional. The model defines a minimal scope of the fragment and default content if applicable. Authors cannot change the defined structure when authoring fragment content.

* **Fragment Template**

  * Required to [create a simple fragment](/help/assets/content-fragments/content-fragments-managing.md#creating-content-fragments).
  * Usually [developed during project implementation](/help/sites-developing/content-fragment-templates.md); cannot be created when authoring.
  * Defines the basics properties of a simple fragment (title, number of text elements, tag definitions).
  * Template definitions require a title and one text element; everything else is optional. The template defines a minimal scope of the fragment and default content if applicable. Authors can later extend a fragment beyond what is defined in the template.

* **Content Fragment Component**

  * Instrumental to delivering the fragment in HTML and/or JSON format.
  * Required to [reference the fragment on a page](/help/sites-authoring/content-fragments.md).
  * Responsible for layout and delivery of a fragment; i.e. channels.
  * Fragments need one or more dedicated components to define layout and deliver some or all elements/variations and associated content.
  * Dragging a fragment onto a page in authoring will automatically associate the required component.

## Example Usage {#example-usage}

A fragment, with its elements and variations, can be used to create coherent content for multiple channels. When designing your fragment you need to consider what will be used where.

### We.Retail Sample {#we-retail-sample}

A sample fragment can be seen at:

`https://localhost:4502/assets.html/content/dam/we-retail/en/experiences/arctic-surfing-in-lofoten`
