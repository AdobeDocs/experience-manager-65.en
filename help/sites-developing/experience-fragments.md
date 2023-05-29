---
title: Experience Fragments in AEM Sites development

description: Learn about customizing Experience Fragments.

uuid: fc9f7e59-bd7c-437a-8c63-de8559b5768d
contentOwner: AEM Docs
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
discoiquuid: c02e713e-15f3-408b-879a-d5eb014aef02
docset: aem65
exl-id: c4fb1b5e-e15e-450e-b882-fe27b165ff9f
---
# Experience Fragments{#experience-fragments}

## The Basics {#the-basics}

An [Experience Fragment](/help/sites-authoring/experience-fragments.md) is a group of one or more components including content and layout that can be referenced within pages.

An Experience Fragment Master and/or Variant uses:

* `sling:resourceType` : `/libs/cq/experience-fragments/components/xfpage`

As there is no `/libs/cq/experience-fragments/components/xfpage/xfpage.html` it reverts to

* `sling:resourceSuperType` : `wcm/foundation/components/page`

## The Plain HTML Rendition {#the-plain-html-rendition}

Using the `.plain.` selector in the URL, you can access the plain HTML rendition.

This is available from the browser, but its primary purpose is to allow other applications (for example, third party web apps, custom mobile implementations) to access the content of the Experience Fragment directly, using only the URL.

The plain HTML rendition adds the protocol, host and context path to paths that are:

* of the type: `src`, `href`, or `action`

* or end with: `-src`, or `-href`

For example:

`.../brooklyn-coat/master.plain.html`

>[!NOTE]
>
>Links always reference the publish instance. They are intended to be consumed by third parties, so the link will always be called from the publish instance, not the author.

![xf-14](assets/xf-14.png)

The plain rendition selector uses a transformer as opposed to additional scripts; the [Sling Rewriter](https://sling.apache.org/documentation/bundles/output-rewriting-pipelines-org-apache-sling-rewriter.html) is used as the transformer. This is configured at

* `/libs/experience-fragments/config/rewriter/experiencefragments`

### Configuring the HTML rendition generation {#configuring-html-rendition-generation}

The HTML rendition is generated using the Sling Rewriter Pipelines. The pipeline is defined at `/libs/experience-fragments/config/rewriter/experiencefragments`. The HTML Transformer supports the following options:

* `allowedCssClasses`
  * A RegEx expression which matches the CSS classes that should be left in the final rendition. 
  * This is useful if the customer wants to strip away some specific CSS classes
* `allowedTags` 
  * A list of HTML tags to to be allowed in the final rendition. 
  * By default the following tags are allowed (no configuration needed): html, head, title, body, img, p, span, ul, li, a, b, i, em, strong, h1, h2, h3, h4, h5, h6, br, noscript, div, link, and script

It is recommended to configure the rewriter using an overlay. See [Overlays](/help/sites-developing/overlays.md)

## Social Variations {#social-variations}

Social variants can be posted on social media (text and image). In AEM these social variants can contain components; for example, text components, image components.

The image and text for the social post can be taken from any image resource type or text resource type at any level of depth (in either the building block or layout container).

Social variations also allow building blocks and take them into consideration when making social actions (on the publish environment).

To post the correct text and image to the social media network, some conventions need to be respected if you are developing your own customized components.

For this, the following properties must be used:

* For extracting the image

    * `fileReference`
    * `fileName`

* For extracting the text

    * `text`

Components that do not use this convention are not taken into consideration.

## Templates for Experience Fragments {#templates-for-experience-fragments}

>[!CAUTION]
>
>***Only*** [editable templates](/help/sites-developing/page-templates-editable.md) are supported for Experience Fragments.

When developing a new template for Experience Fragments you can follow follow the standard practices for an [editable template](/help/sites-developing/page-templates-editable.md).

To create an experience fragment template that is detected by the **Create Experience Fragment** wizard, you must follow one of these rule sets:

1. Both:

    1. The resource type of the template (the initial node) must inherit from:
       `cq/experience-fragments/components/xfpage`

    1. And the name of the template must begin with:
       `experience-fragments`
       This allows users to create experience fragments in /content/experience-fragments as the `cq:allowedTemplates` property of this folder includes all the templates that have names beginning with `experience-fragment`. Customers can update this property to include their own naming scheme or template locations.

1. [Allowed templates](/help/sites-authoring/experience-fragments.md#configure-allowed-templates-folder) can be configured in the Experience Fragments console.
<!--
1. Add the template details manually in `cq:allowedTemplates` on the `/content/experience-fragment` node.
-->

<!-- >[!NOTE]
>
>[Allowed templates](/help/sites-authoring/experience-fragments.md#configuring-allowed-templates) can be configured in the Experience Fragments console.
-->

## Components for Experience Fragments {#components-for-experience-fragments}

[Developing components](/help/sites-developing/components.md) for use with/in Experience Fragments follow standard practices.

The only additional configuration is to ensure that the components are [allowed on the template, this is achieved with the Content Policy](/help/sites-developing/page-templates-editable.md#content-policies).

## The Experience Fragment Link Rewriter Provider - HTML {#the-experience-fragment-link-rewriter-provider-html}

In AEM you have the possibility to create Experience Fragments. An Experience Fragment:

* consists of a group of components together with a layout,
* can exist independently of an AEM page.

One of the use cases for such groups is for embedding content in third party touchpoints, such as Adobe Target.

### Default Link Rewriting {#default-link-rewriting}

Using the [Export to Target](/help/sites-administering/experience-fragments-target.md) feature, you can:

* create an Experience Fragment,
* add components to it,
* and then export it as an Adobe Target Offer, either in HTML Format or JSON Format.

This feature can be [enabled on an author instance of AEM](/help/sites-administering/experience-fragments-target.md#Prerequisites). It requires a valid Adobe Target Configuration, and configurations for the Link Externalizer.

The Link Externalizer is used to determine the correct URLs needed when creating the HTML version of the Target Offer, which is subsequently sent to Adobe Target. This is necessary as Adobe Target requires that all links inside the Target HTML Offer can be publicly accessed; this means that any resources the links reference, and the Experience Fragment itself, must be published before they can be used.

By default, when you construct a Target HTML Offer, a request is sent to a custom Sling selector in AEM. This selector is called `.nocloudconfigs.html`. As its name implies, it creates a plain HTML rendering of an Experience Fragment, but does not include cloud configurations (which would be superfluous information).

After you generate the HTML page, the Sling Rewriter pipeline makes modifications to the output:

1. The `html`, `head`, and `body` elements are replaced with `div` elements. The `meta`, `noscript` and `title` elements are removed (they are child elements of the original `head` element, and are not considered when this is replaced by the `div` element).

   This is done to ensure that the HTML Target Offer can be included in Target Activities.

1. AEM modifies any internal links present in the HTML, so that they point to a published resource.

   To determine the links to modify, AEM follows this pattern for attributes of HTML elements:

    1. `src` attributes
    1. `href` attributes
    1. `*-src` attributes (like data-src, custom-src, etc)
    1. `*-href` attributes (like `data-href`, `custom-href`, `img-href`, etc)

   >[!NOTE]
   >
   >In most cases, the internal links in the HTML are relative links, but there may be cases when custom components provide full URLs in the HTML. By default, AEM ignores these fully fledged URLs and makes no modifications.

   The links in these attributes are run through the AEM Link Externalizer `publishLink()` in order to recreate the URL as if it was on a published instance, and as such, publicly available.

When using an out-of-the-box implementation, the process described above should be sufficient to generate the Target Offer from the Experience Fragment and then export it to Adobe Target. However, there are some use cases that are not accounted for in this process; these include:

* Sling Mapping available on the publish instance only
* Dispatcher redirects

For these use cases AEM provides the Link Rewriter Provider Interface.

### Link Rewriter Provider Interface {#link-rewriter-provider-interface}

>[!NOTE]
>
>This interface was introduced in [AEM 6.5 SP1 (6.5.1.0)](/help/release-notes/previous/6.5.1.md).

For more complicated cases, not covered by the [default](#default-link-rewriting), AEM offers the Link Rewriter Provider Interface. This is a `ConsumerType` interface that you can implement in your bundles, as a service. It bypasses the modifications AEM performs on internal links of an HTML offer as rendered from an Experience Fragment. This interface allows you to customize the process of rewriting internal HTML links to align with your business needs.

Examples of use cases for implementing this interface as a service include:

* Sling Mappings are enabled on the publish instances, but not on the author instance
* A dispatcher or similar technology is used to redirect URLs internally
* There are `sling:alias mechanisms` in place for resources

>[!NOTE]
>
>This interface only processes the internal HTML links from the generated Target Offer.

The Link Rewriter Provider Interface ( `ExperienceFragmentLinkRewriterProvider`) is as follows:

```java
public interface ExperienceFragmentLinkRewriterProvider {

    String rewriteLink(String link, String tag, String attribute);

    boolean shouldRewrite(ExperienceFragmentVariation experienceFragment);

    int getPriority();

}
```

### How to use the Link Rewriter Provider Interface {#how-to-use-the-link-rewriter-provider-interface}

To use the interface you first need to create a bundle containing a new service component that implements the Link Rewriter Provider interface.

This service will be used to plug into the Experience Fragment Export to Target rewriting in order to have access to the various links.

For example, `ComponentService`:

```java
import com.adobe.cq.xf.ExperienceFragmentLinkRewriterProvider;
import com.adobe.cq.xf.ExperienceFragmentVariation;
import org.osgi.service.component.annotations.Service;
import org.osgi.service.component.annotations.Component;

@Component
@Service
public class GeneralLinkRewriter implements ExperienceFragmentLinkRewriterProvider {

    @Override
    public String rewriteLink(String link, String tag, String attribute) {
        return null;
    }

    @Override
    public boolean shouldRewrite(ExperienceFragmentVariation experienceFragment) {
        return false;
    }

    @Override
    public int getPriority() {
        return 0;
    }

}
```

For the service to work, there are now three methods that need to be implemented inside the service:

* ` [shouldRewrite](#shouldrewrite)`
* ` [rewriteLink](#rewritelink)`

    * `rewriteLinkExample2`

* ` [getPriority](#priorities-getpriority)`

#### shouldRewrite {#shouldrewrite}

You need to indicate to the system whether it needs to rewrite the links when a call is made for Export to Target on a certain Experience Fragment variation. You do this by implementing the method:

`shouldRewrite(ExperienceFragmentVariation experienceFragment);`

For example:

```java
@Override
public boolean shouldRewrite(ExperienceFragmentVariation experienceFragment) {
    return experienceFragment.getPath().equals("/content/experience-fragment/master");
}
```

This method receives, as a parameter, the Experience Fragment Variation that the Export to Target system is currently rewriting.

In the example above, we would like to rewrite:

* links present in `src`

* `href` attributes only

* for a specific Experience Fragment:
  `/content/experience-fragment/master`

Any other Experience Fragments that pass through the Export to Target system are ignored and not affected by changes implemented in this Service.

#### rewriteLink {#rewritelink}

For the Experience Fragment variation impacted by the rewriting process, it will then proceed to let the service handle the link rewriting. Everytime a link is encountered in the internal HTML, the following method is invoked:

`rewriteLink(String link, String tag, String attribute)`

As input, the method receives the parameters:

* `link`
  The `String` representation of the link that is currently being processed. This is usually a relative URL pointing to the resource on the author instance.

* `tag`
  The name of the HTML element that is currently being processed.

* `attribute`
  The exact attribute name.

If, for example, the Export to Target system is currently processing this element, you can define `CSSInclude` as:

```java
<link rel="stylesheet" href="/etc.clientlibs/foundation/clientlibs/main.css" type="text/css">
```

The call to the `rewriteLink()` method is done using these parameters:

```java
rewriteLink(link="/etc.clientlibs/foundation/clientlibs/main.css", tag="link", attribute="href" )
```

When you create the service you can make decisions based on the given input, and then rewrite the link accordingly.

For our example, we would like to remove the `/etc.clientlibs` part of the URL and add the appropriate external domain. To keep things simple, we will consider that we have access to a Resource Resolver for your service, as in `rewriteLinkExample2`:

>[!NOTE]
>
>For more information on how to get a resource resolver through a service user see [Service Users in AEM](/help/sites-administering/security-service-users.md).

```java
private ResourceResolver resolver;

private Externalizer externalizer;

@Override
public String rewriteLink(String link, String tag, String attribute) {

    // get the externalizer service
    externalizer = resolver.adaptTo(Externalizer.class);
    if(externalizer == null) {
        // if there was an error, then we do not modify the link
        return null;
    }

    // remove leading /etc.clientlibs from resource link before externalizing
    link = link.replaceAll("/etc.clientlibs", "");

    // considering that we configured our publish domain, we directly apply the publishLink() method
    link = externalizer.publishLink(resolver, link);

    return link;
}
```

>[!NOTE]
>
>If the above method returns `null`, then the Export to Target system will leave the link as it is, a relative link to a resource.

#### Priorities - getPriority {#priorities-getpriority}

It is not uncommon to need several services to cater for different kinds of Experience Fragments, or even to have a Generic Service that handles externalizing and mapping for all Experience Fragments. In these cases, conflicts about which service to use might arise, so AEM provides the possibility to define **Priorities** for different services. The priorities are specified by using the method:

* `getPriority()`

This method allows the use of several services where the `shouldRewrite()` method returns true for the same Experience Fragment. The service that returns the highest number from its `getPriority()`method is the service that handles the Experience Fragment Variation.

As an example, you can have a `GenericLinkRewriterProvider` that handles the basic mapping for all Experience Fragments and when the `shouldRewrite()` method returns `true` for all Experience Fragment Variations. For several specific Experience Fragments, you may want special handling, so in this case, you can provide a `SpecificLinkRewriterProvider` for which the `shouldRewrite()` method returns true only for some Experience Fragment Variations. To make sure that `SpecificLinkRewriterProvider` is chosen to handle those Experience Fragment Variations, it must return in its `getPriority()` method a higher number than `GenericLinkRewriterProvider.`
