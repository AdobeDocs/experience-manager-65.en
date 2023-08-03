---
title: Client-side Customization
seo-title: Client-side Customization
description: Customizing behavior or appearance client-side in AEM Communities
seo-description: Customizing behavior or appearance client-side in AEM Communities
uuid: 57978c39-9a8a-4098-9001-c8bbe7ee786f
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 24b6d1d2-c118-4a25-959f-2783961c4ae3
exl-id: bf34f564-ac93-4c8c-95f7-8690d99d85cb
---
# Client-side Customization  {#client-side-customization}

| **[⇐ Feature Essentials](essentials.md)** |**[Server-side Customization ⇒](server-customize.md)** |
|---|---|
|   |**[SCF Handlebars Helpers ⇒](handlebars-helpers.md)** |

To customize the appearance and/or behavior of an AEM Communities component on the client-side, there are several approaches.

Two major approaches are to overlay or extend a component.

[Overlaying](#overlays) a component changes the default component and affects every reference to the component.

[Extending](#extensions) a component, being uniquely named, limits the scope of changes. The term 'extend' is used interchangeably with 'override'.

## Overlays {#overlays}

Overlaying a component is a method of making modifications to a default component and affecting all instances which use the default.

The overlay is accomplished by modifying a copy of the default component in the /**apps** directory, rather than modifying the original component in the /**libs** directory. The component is constructed with an identical relative path, except 'libs' is replaced with 'apps'.

The /apps directory is the first place searched to resolve requests, and if not found, the default version located in the/libs directory is used.

The default component in the /libs directory must never be modified as future patches and upgrades are free to alter the /libs directory in any manner necessary while maintaining public interfaces.

This is different from [extending](#extensions) a default component where the desire is to make modifications for a specific use, creating a unique path to the component and relying on referencing the original default component in the /libs directory as the super resource type.

For a quick example of overlaying the comments component, try the [Overlay Comments Component tutorial](overlay-comments.md).

## Extensions {#extensions}

Extending (overriding) a component is a method of making modifications for a specific use without affecting all instances which use the default. The extended component is uniquely named in the /apps folder and references the default component in the /libs folder, thus a component's default design and behavior are not modified.

This is different from [overlaying](#overlays) the default component where the nature of Sling resolves relative references to the apps/ folder before searching in the libs/ folder, thus a component's design or behavior is modified globally.

For a quick example of extending the comments component, try the [Extend Comments Component tutorial](extend-comments.md).

## JavaScript Binding {#javascript-binding}

The HBS script for the component must be bound to the JavaScript objects, models, and views, which implement this feature.

The value of the `data-scf-component` attribute may be the default, such as **`social/tally/components/hbs/rating`**, or an extended (customized) component for customized functionality, such as **weretail/components/hbs/rating**.

To bind a component, the entire component script must be enclosed within a &lt;div&gt; element with the following attributes:

* `data-component-id`="`{{id}}`"

  resolves to the id property from the context

* `data-scf-component`="*&lt;resourceType&gt;*

For example, from `/apps/weretail/components/hbs/rating/rating.hbs`:

```xml
<div class="we-Rating" data-component-id="`{{id}}`" data-scf-component="weretail/components/hbs/rating">

     <!-- HTML with HBS accessing the rating component -->

</div>
```

## Custom Properties {#custom-properties}

When extending or overlaying a component, it is possible to add properties to a modified dialog.

All properties set on a component/resource can be accessed by referencing the property keys in the handlebars template:

`{{properties.<property_name>}}`

## Skinning CSS {#skinning-css}

Customizing components to match the overall theme of the website can be achieved by 'skinning' - changing colors, fonts, images, buttons, links, spacing, and even positioning to a certain extent.

Skinning can be achieved by selectively overriding the framework styles or by writing entirely new style sheets. The SCF components define namespaced, modular, and semantic CSS classes that affect the various elements that make up a component.

To skin a component:

1. Identify the elements that you want to change (example - composer area, toolbar buttons, message font, and so on).
1. Identify the CSS class/rules that affect these elements.
1. Create a style sheet file (.css).
1. Include the style sheet in a client library folder ([clientlibs](#clientlibs-for-scf)) for your site and make sure it is included from your templates and pages with [ui:includeClientLib](../../help/sites-developing/clientlibs.md).

1. Redefine the CSS classes and rules that you have identified (#2) in your style sheet and add styles.

The custom styles will now override the default framework styles and the component will be rendered with the new skin.

>[!CAUTION]
>
>Any CSS class name that is prefixed with `scf-js` has a specific use in JavaScript code. These classes affect the state of a component (for example, toggle from hidden to visible) and should neither be overridden nor removed.
>
>While the `scf-js` classes do not affect styles, the class names may be used in style sheets with the caveat that, as they control the states of elements, there may be side effects.

## Extending JavaScript {#extending-javascript}

To extend a components JavaScript implementation, you need to:

1. Create a component for your app with a jcr:resourceSuperType set to the value of the extended component's jcr:resourceType, for example, social/forum/components/hbs/forum.
1. Examine the default SCF component's JavaScript to determine what methods need to be registered using SCF.registerComponent().
1. Either copy the extended component's JavaScript or start from scratch.
1. Extend the method.
1. Use SCF.registerComponent() to register all methods with either the defaults or the customized objects and views.

### forum.js: Sample Extension of Forum - HBS  {#forum-js-sample-extension-of-forum-hbs}

```xml
(function($CQ, _, Backbone, SCF) {
    "use strict";
    var GMForumView = SCF.ForumView.extend({
        viewName: "GMForum",
        showComposer: function(e) {
            SCF.ForumView.prototype.toggleComposer.apply(this);
            var cancel = this.$el.find('.cancel-new-topic');
            cancel.toggle();
        },
        hideComposer: function(e) {
            SCF.ForumView.prototype.toggleComposer.apply(this);
            var cancel = this.$el.find('.cancel-new-topic');
            cancel.toggle();
        }
    });

    SCF.registerComponent('social/forum/components/hbs/post', SCF.Post, SCF.PostView);
    SCF.registerComponent('social/forum/components/hbs/topic', SCF.Topic, SCF.TopicView);
    SCF.registerComponent('social/forum/components/hbs/forum', SCF.Forum, GMForumView );
})($CQ, _, Backbone, SCF);
```

## Script Tags {#script-tags}

Script tags are an inherent part of the client-side framework. They are the glue that helps bind the markup generated on the server side with the models and views on the client side.

Script tags in SCF scripts should not be removed when overlaying or overriding components. SCF script tags auto created for injecting JSON in the HTML are identified with the attribute `data-scf-json=true`.

## Clientlibs for SCF {#clientlibs-for-scf}

The use of [client-side libraries](../../help/sites-developing/clientlibs.md) (clientlibs), provides a means of organizing and optimizing the JavaScript and CSS used to render content on the client.

The clientlibs for SCF follow a very specific naming pattern for two variants, which vary only by the presence of 'author' in the category name:

|Clientlib Variant|Pattern for Categories Property|
|--- |--- |
|complete clientlib|cq.social.hbs.&lt;component name&gt;|
|author clientlib|cq.social.author.hbs.&lt;component name&gt;|

### Complete Clientlibs {#complete-clientlibs}

The complete (non-author) clientlibs include dependencies and are convenient for including with ui:includeClientLib.

These versions are found in:

* `/etc/clientlibs/social/hbs/&lt;component name&gt;`

For example:

* Client folder node: `/etc/clientlibs/social/hbs/forum`
* Categories property: `cq.social.hbs.forum`

The [Community Components guide](components-guide.md) lists the complete clientlibs required for each SCF component.

[Clientlibs for Communities Components](clientlibs.md) describes how to add clientlibs to a page.

### Author Clientlibs {#author-clientlibs}

The author version clientlibs are stripped down to the minimal JavaScript necessary to implement the component.

These clientlibs should never be directly included, but instead are available to embed into other clientlibs, which are handcrafted for a site.

These versions are found in the SCF libs folder:

* `/libs/social/&lt;feature&gt;/components/hbs/&lt;component name&gt;/clientlibs`

For example:

* Client folder node: `/libs/social/forum/hbs/forum/clientlibs`
* Categories property: `cq.social.author.hbs.forum`

Note: while author clientlibs never embed other libraries, they do list their dependencies. When embedded in other libraries, the dependencies are not automatically pulled in and must be embedded as well.

The required author clientlibs can be identified by inserting "author" into the clientlibs listed for each SCF component in the [Community Components guide](components-guide.md).

### Usage Considerations {#usage-considerations}

Every site is different in how they manage client libraries. Various factors include:

* Overall Speed: Maybe the desire is for the site to be responsive, but it is acceptable for the first page to be a little slow to load. If many of the pages use the same JavaScript, then the various JavaScript can be embedded into one clientlib and referenced from the first page to load. The JavaScript in this single download remains cached, minimizing the amount of data to download for subsequent pages.
* Short Time to First Page: Maybe the desire is for the first page to load quickly. In this case, the JavaScript is in multiple small files to be referenced only where needed.
* A balance between first page load and subsequent downloads.

| **[⇐ Feature Essentials](essentials.md)** |**[Server-side Customization ⇒](server-customize.md)** |
|---|---|
|   |**[SCF Handlebars Helpers ⇒](handlebars-helpers.md)** |
