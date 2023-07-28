---
title: SCF Handlebars Helpers
description: Handlebars Helper methods to facilitate work with SCF
uuid: 9c514199-871e-4b68-8147-2052d2eeda15
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 8b6c1697-d693-41f4-8337-f41658465107
exl-id: bfb95cae-4b0f-4521-a113-042dc4005a63
---
# SCF Handlebars Helpers {#scf-handlebars-helpers}

| **[⇐ Feature Essentials](essentials.md)** |**[Server-side Customization ⇒](server-customize.md)** |
|---|---|
|   |**[Client-side Customization ⇒](client-customize.md)** |

Handlebars Helpers (helpers) are methods callable from Handlebars scripts to facilitate working with SCF components.

The implementation includes a client-side and a server-side definition. It is also possible for developers to create custom helpers.

The custom SCF helpers delivered with AEM Communities are defined in the [client library](../../help/sites-developing/clientlibs.md):

* `/etc/clientlibs/social/commons/scf/helpers.js`

>[!NOTE]
>
>Be sure to install the [latest Communities feature pack](deploy-communities.md#latestfeaturepack).

## Abbreviate {#abbreviate}

A helper to return an abbreviated string conforming to the maxWords and maxLength properties.

The string to be abbreviated is provided as the context. If no context is provided, an empty string is returned.

First, the context is trimmed to maxLength, and then the context is sliced into words and reduced to maxWords.

If safeString is set to true, then the returned string is a SafeString.

### Parameters {#parameters}

* **context**: String

  (Optional) Default is the empty string

* **maxLength**: Number

  (Optional) Default is the length of the context.

* **maxWords**: Number

  (Optional) Default is the number of words in the trimmed string.

* **safeString**: Boolean

  (Optional) Returns a Handlebars.SafeString() if true. Default is false.

### Examples {#examples}

```
{{abbreviate subject maxWords=2}}

/*
If subject =
    "AEM Communities - Site Creation Wizard"

Then abbreviate would return
    "AEM Communities".
*/
```

```
{{{abbreviate message safeString=true maxLength=30}}}

/*
If message =
    "The goal of AEM Communities is to quickly create a community engagement site."

Then abbreviate would return
    "The goal of AEM Communities is"
*/
```

## Content-loadmore {#content-loadmore}

A helper to add two spans under a div, one for the full text and the other for the less text, with the ability to toggle between the two views.

### Parameters {#parameters-1}

* **context**: String

  (Optional) Default is the empty string.

* **numChars**: Number

  (Optional) The number of characters to display when not displaying full text. Default is 100.

* **moreText**: String

  (Optional) The text to display indicating there is more text to display. Default is "more".

* **ellipsesText**: String

  (Optional) The text to display indicating there is hidden text. Default is "...".

* **safeString**: Boolean

  (Optional) Boolean value indicating whether to apply Handlebars.SafeString() before returning the result. Default is false.

### Example {#example}

```
{{content-loadmore  context numChars=32  moreText="go on"  ellipsesText="..." }}

/*
If context =
    "Here is the initial less content and this is more content."

Then content-loadmore would return
    "Here is the initial less content<span class="moreelipses">...</span> <span class="scf-morecontent"><span>and this is more content.</span>  <a href="" class="scf-morelink" evt="click=toggleContent">go on</a></span>"
*/
```

## DateUtil {#dateutil}

A helper to return a formatted date string.

### Parameters {#parameters-2}

* **context**: Number

  (Optional) a millisecond value offset from January 1, 1970 (epoch). Default is the current date.

* **format**: String

  (Optional) The date format to apply. Default is "YYYY-MM-DDTHH:mm:ss.sssZ" and the result appears as "2015-03-18T18:17:13-07:00"

### Examples {#examples-1}

```
{{dateUtil this.memberSince format="dd MMM yyyy, hh:mm"}}

// returns "18 Mar 2015, 18:17"
```

```
{{dateUtil this.birthday format="MM-DD-YYYY"}}

// returns "03-18-2015"
```

## Equals {#equals}

A helper to return content depending on an equality conditional.

### Parameters {#parameters-3}

* **lvalue**: String

  The left-hand value to compare.

* **rvalue**: String

  The right-hand value to compare.

### Example {#example-1}

```
{{#equals  value "some-value"}}
  <div>They are EQUAL!</div>
{{else}}
  <div>They are NOT equal!</div>
{{/equals}}

```

## If-wcm-mode {#if-wcm-mode}

A block helper that tests the current value of [WCM mode](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/wcm/api/WCMMode.html) against a string separated list of modes.

### Parameters {#parameters-4}

* **context**: String

  (Optional) The string to translate. Required if no default provided.

* **mode**: String

  (Optional) A comma-separated list of [WCM modes](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/wcm/api/WCMMode.html) to test if set.

### Example {#example-2}

```xml
{{#if-wcm-mode mode="DESIGN, EDIT"}}
 ...
{{else}}
 ...
{{/if-wcm-mode}}
```

## i18n {#i-n}

This helper overrides the Handlebars helper 'i18n'.

See also [Internationalizing Strings in JavaScript Code](../../help/sites-developing/i18n-dev.md#internationalizing-strings-in-javascript-code).

### Parameters {#parameters-5}

* **context**: String

  (Optional) The string to translate. Required if no default provided.

* **default**: String

  (Optional) The default string to translate. Required if no context provided.

* **comment**: String

  (Optional) A translation hint

### Example {#example-3}

```
{{i18n "hello"}}
{{i18n "hello" comment="greeting" default="bonjour"}}

```

## Include {#include}

A helper to include a component as a non-existing resource in a template.

This method lets the resource be programmatically customized more easily than is possible for a resource added as a JCR node. See [Add or Include a Communities Component](scf.md#add-or-include-a-communities-component).

Only a select few of Communities components are available to include. <!-- OBSOLETE/OLD  NEED TO UPDATE FOR 6.5  For AEM 6.1, those that are includable are [comments](essentials-comments.md), [rating](rating-basics.md), [reviews](reviews-basics.md), and [voting](essentials-voting.md). -->

This helper, appropriate only on the server-side, provides functionality similar to [cq:include](../../help/sites-developing/taglib.md) for JSP scripts.

### Parameters {#parameters-6}

* **context**: String or object

  (Optional, unless providing a relative path)

  Use `this` to pass the current context.

  Use `this.id` to obtain the resource at `id` for rendering the resourceType requested.

* **resourceType**: String

  (Optional) resource type defaults to resource type from context.

* **template**: String

  Path to component script.

* **path**: String

  (Required) The path to the resource. If path is relative, a context must be provided, else the empty string is returned.

* **authoringDisabled**: Boolean

  (Optional) Default is false. For internal use only.

### Example {#example-4}

```
{{include this.id path="comments" resourceType="social/commons/components/hbs/comments"}}
```

Includes a new comments component at `this.id` + /comments.

## IncludeClientLib {#includeclientlib}

A helper that includes an AEM html client library, which can be a js, a css or a theme library. For multiple inclusions of different types, for example js and css, this tag must be used multiple times in the Handlebars script.

This helper, appropriate only on the server-side, provides functionality similar to [ui:includeClientLib](../../help/sites-developing/taglib.md) for JSP scripts.

### Parameters {#parameters-7}

* **categories**: String

  (Optional) A list of comma-separated client lib categories. Include all JavaScript and CSS libraries for the given categories. The theme name is extracted from the request.

* **theme**: String

  (Optional) A list of comma-separated client lib categories. Include all theme-related libraries (both CSS and JS) for the given categories. The theme name is extracted from the request.

* **js**: String

  (Optional) A list of comma-separated client lib categories. Includes all JavaScript libraries for the given categories.

* **css**: String

  (Optional) A list of comma-separated client lib categories. Includes all CSS libraries for the given categories.

### Examples {#examples-2}

```
// all: js + theme (theme-js + css)
{{includeClientLib categories="cq.social.hbs.comments, cq.social.hbs.voting"}}

// returns
    <link href="/etc/clientlibs/social/hbs/tally/voting.css" rel="stylesheet" type="text/css">
    <link href="/etc/clientlibs/social/hbs/socialgraph.css" rel="stylesheet" type="text/css">
    <link href="/etc/clientlibs/social/hbs/comments.css" rel="stylesheet" type="text/css">
    <script src="/etc/clientlibs/social/hbs/tally/voting.js" type="text/javascript"></script>
    <script src="/etc/clientlibs/social/hbs/socialgraph.js" type="text/javascript"></script>
    <script src="/etc/clientlibs/social/hbs/comments.js" type="text/javascript"></script>

// only js libs
{{includeClientLib js="cq.social.hbs.comments, cq.social.hbs.voting"}}

// returns
    <script src="/etc/clientlibs/social/hbs/tally/voting.js" type="text/javascript"></script>
    <script src="/etc/clientlibs/social/hbs/socialgraph.js" type="text/javascript"></script>
    <script src="/etc/clientlibs/social/hbs/comments.js" type="text/javascript"></script>

// theme only (theme-js + css)
{{includeClientLib theme="cq.social.hbs.comments, cq.social.hbs.voting"}}

// returns
    <link href="/etc/clientlibs/social/hbs/tally/voting.css" rel="stylesheet" type="text/css">
    <link href="/etc/clientlibs/social/hbs/comments.css" rel="stylesheet" type="text/css">
    <script src="/etc/clientlibs/social/hbs/tally/voting.js" type="text/javascript"></script>
    <script src="/etc/clientlibs/social/hbs/comments.js" type="text/javascript"></script>

// css only
{{includeClientLib css="cq.social.hbs.comments, cq.social.hbs.voting"}}

// returns
    <link href="/etc/clientlibs/social/hbs/tally/voting.css" rel="stylesheet" type="text/css">
    <link href="/etc/clientlibs/social/hbs/socialgraph.css" rel="stylesheet" type="text/css">
    <link href="/etc/clientlibs/social/hbs/comments.css" rel="stylesheet" type="text/css">
```

## Pretty-time {#pretty-time}

A helper to display how much time has passed up to a cutoff point, after which a regular date format is displayed.

For example:

* 12 hours ago
* 7 days ago

### Parameters {#parameters-8}

* **context**: Number

  A time in the past to compare to 'now'. Time is expressed as a millisecond value offset from January 1, 1970 (epoch).

* **daysCutoff**: Number

  The number of days ago before switching to an actual date. Default is 60.

### Example {#example-5}

```
{{pretty-time this.published daysCutoff=7}}

/*
Depending on how long in the past, may return

  "3 minutes ago"

  "3 hours ago"

  "3 days ago"
*/
```

## Xss-html {#xss-html}

A helper that encodes a source string for HTML element content to help guard against XSS.

NOTE: This helper is not a validator and is not to be used for writing attribute values.

### Parameters {#parameters-9}

* **context**: object

  The HTML to encode.

### Example {#example-6}

```
<p>{{xss-html forum-ugc}}</p>
```

## Xss-htmlAttr {#xss-htmlattr}

A helper that encodes a source string for writing to an HTML attribute value to help guard against XSS.

NOTE: This helper is not a validator and is not to be used for writing actionable attributes (href, src, event handlers).

### Parameters {#parameters-10}

* **context**: Object

  The HTML to encode.

### Example {#example-7}

```
<div id={{xss-htmlAttr id}} />
```

## Xss-jsString {#xss-jsstring}

A helper that encodes a source string for writing to JavaScript string content to help guard against XSS.

NOTE: This helper is not a validator and is not to be used for writing to arbitrary JavaScript.

### Parameters {#parameters-11}

* **context**: Object

  The HTML to encode.

### Example {#example-8}

```
var input = {{xss-jsString topic-title}}
```

## Xss-validHref {#xss-validhref}

A helper that sanitizes a URL for writing as an HTML href or srce attribute value to help guard against XSS.

NOTE: This helper may return an empty string.

### Parameters {#parameters-12}

* **context**: Object

  The URL to sanitize.

### Example {#example-9}

```
<a href="{{xss-validHref url}}">my link</a>
```

## Handlebars.js Basic Overview {#handlebars-js-basic-overview}

* A Handlebars helper call is a simple identifier (the *name* of the helper), followed by zero or more space-separated parameters.
* Parameters may be a simple String, number, boolean, or JSON object, and an optional sequence of key-value pairs (hash arguments) as the last parameters.
* The keys in hash arguments must be simple identifiers.
* The values in hash arguments are Handlebars expressions: simple identifiers, paths, or Strings.
* The current context, `this`, is always available to Handlebars helpers.
* The context may be a String, number, boolean, or a JSON data object.
* It is possible to pass an object nested within the current context as the context, such as `this.url` or `this.id` (see following examples of simple and block helpers).

* Block helpers are functions that can be called from anywhere in the template. They can invoke a block of the template zero or more times with a different context each time. They contain a context between `{{#*name*}}` and `{{/*name*}}`.

* Handlebars provide a final parameter to helpers named 'options'. The special object 'options' includes

    * Optional private data (options.data)
    * Optional key-value properties from the call (options.hash)
    * Ability to invoke itself (options.fn())
    * Ability to invoke the inverse of itself (options.inverse())

* It is recommended that the HTML String content returned from a helper is a SafeString.

### An example of a simple helper from Handlebars.js documentation: {#an-example-of-a-simple-helper-from-handlebars-js-documentation}

```
Handlebars.registerHelper('link_to', function(title, options) {
    return new Handlebars.SafeString('<a href="/posts' + this.url + '">' + title + "!</a>");
});

var context = {posts: [
    {url: "/hello-world",
      body: "Hello World!"}
  ] };

// when link_to is called, posts is the current context
var source = '<ul>{{#posts}}<li>{{{link_to "Post"}}}</li>{{/posts}}</ul>'

var template = Handlebars.compile(source);

template(context);
```

Would render:

&lt;ul&gt;
&lt;li&gt;&lt;a href="/posts/hello-world"&gt;Post!&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

### An example of a block helper from Handlebars.js documentation: {#an-example-of-a-block-helper-from-handlebars-js-documentation}

```
Handlebars.registerHelper('link', function(options) {
    return new Handlebars.SafeString('<a href="/people/' + this.id + '">' + options.fn(this) + '</a>');
});

var data = { "people": [
  { "name": "Alan", "id": 1 },
  { "name": "Yehuda", "id": 2 }
]};

// when link is called, people is the current context
var source = "<ul>{{#people}}<li>{{#link}}{{name}}{{/link}}</li>{{/people}}</ul>";

var template = Handlebars.compile(source);

template(data);
```

Would render:
&lt;ul&gt;
&lt;li&gt;&lt;a href="/people/1"&gt;Alan&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href="/people/2"&gt;Yehuda&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

## Custom SCF Helpers {#custom-scf-helpers}

Custom helpers must be implemented on the server-side and the client-side, especially when passing data. For SCF, most templates are compiled and rendered on the server-side as the server generates the HTML for a given component when the page is requested.

### Server-side Custom Helpers {#server-side-custom-helpers}

To implement and register a custom SCF helper on the server-side, simply implement the Java&trade; interface [TemplateHelper](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/cq/social/handlebars/api/TemplateHelper.html), make it an [OSGi Service](../../help/sites-developing/the-basics.md#osgi) and install it as part of an OSGi bundle.

For example:

### FooTextHelper.java {#footexthelper-java}

```java
/** Custom Handlebars Helper */

package com.my.helpers;

import java.io.IOException;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;

import com.adobe.cq.social.handlebars.api.TemplateHelper;
import com.github.jknack.handlebars.Options;

@Service
@Component
public class FooTextHelper implements TemplateHelper<String>{

    @Override
    public CharSequence apply(String context, Options options) throws IOException {
        return "foo-" + context;
    }

    @Override
    public String getHelperName() {
        return "foo-text";
    }

    @Override
    public Class<String> getContextType() {
        return String.class;
    }
}

```

>[!NOTE]
>
>A helper created for the server-side must also be created for the client-side.
>
>The component gets re-rendered on the client-side for the logged in user, and if the client-side helper is not found, the component disappears.

### Client-side Custom Helpers {#client-side-custom-helpers}

The client-side helpers are Handlebars scripts registered by invoking `Handlebars.registerHelper()`.
For example:

### custom-helpers.js {#custom-helpers-js}

```
function(Handlebars, SCF, $CQ) {

    Handlebars.registerHelper('foo-text', function(context, options) {
        if (!context) {
            return "";
        }
        return "foo-" + context;
    });

})(Handlebars, SCF, $CQ);

```

The custom client-side helpers must be added to a custom client library.
The clientlib must:

* Include a dependency on `cq.social.scf`.
* Load after Handlebars has been loaded.
* Be [included](clientlibs.md).

Note: the SCF helpers are defined in `/etc/clientlibs/social/commons/scf/helpers.js`.

| **[⇐ Feature Essentials](essentials.md)** |**[Server-side Customization ⇒](server-customize.md)** |
|---|---|
|   |**[Client-side Customization ⇒](client-customize.md)** |
