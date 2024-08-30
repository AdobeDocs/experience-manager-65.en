---
title: Extending and Configuring the Design Importer for Landing Pages
description: Learn how to configure the Design Importer for landing pages.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference
docset: aem65
exl-id: 1b8c6075-13c6-4277-b726-8dea7991efec
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Admin
---
# Extending and Configuring the Design Importer for Landing Pages{#extending-and-configuring-the-design-importer-for-landing-pages}

This section describes how to configure and if desired, extend the design importer for landing pages. Working with Landing Pages after import is covered in [Landing Pages.](/help/sites-classic-ui-authoring/classic-personalization-campaigns-landingpage.md)

**Making the design importer extract your custom component**

Here are the logical steps to make design importer recognize your custom component

1. Create a TagHandler

    * A tag handler is a POJO that handles HTML tags of a specific kind. The "kind" of HTML tags your TagHandler can handle is defined via the TagHandlerFactory's OSGi property "tagpattern.name". This OSGi property is essentially a regex that should match the input html tag you wish to handle. All the nested tags would be thrown to your tag handler for handling. For example, if you register for a div that contains a nested &lt;p&gt; tag, the &lt;p&gt; tag would also be thrown to your TagHandler and it is up to you how you want to take care of it.
    * The tag handler interface is similar to a SAX content handler interface. It receives SAX events for each html tag. As a tag handler provider, you need to implement certain lifecycle methods which are automatically called by the design importer framework.

1. Create its corresponding TagHandlerFactory.

    * The tag handler factory is an OSGi component(singleton) that's responsible for spawning instances of your tag handler.
    * your tag handler factory must expose an OSGi property called "tagpattern.name" the value of which is matched against the input html tag.
    * If there are multiple tag handlers matching the input html tag, the one with a higher ranking is picked. The ranking itself is exposed as an OSGi property **service.ranking**.
    * The TagHandlerFactory is an OSGi component. Any references that you wish to provide to your TagHandler must be via this factory.

1. Make sure that your TagHandlerFactory has a better ranking if you wish to override the default.

>[!CAUTION]
>
>The Design Importer, used to import landing pages, [has been deprecated with AEM 6.5](/help/release-notes/deprecated-removed-features.md#deprecated-features).

## Preparing the HTML for Import {#preparing-the-html-for-import}

After you have created an importer page, you can import your full HTML landing page. To import your HTML landing page, you need to first zip its contents into a design package. The design package contains your HTML landing page along with the referenced assets (images, css, icons, scripts, and so on).

The following cheat sheet provides a sample for how to prepare your HTML for import:

Landing page Cheat Sheet

[Get File](assets/cheatsheet.zip)

### Zip file layout and requirements {#zip-file-layout-and-requirements}

>[!NOTE]
>
>At this point, ZIP files can only contain one HTML page or one part of a page.

A sample layout of the zip is as follows:

* /index.html > landing page HTML file
* /css > to add into the CSS clientlib
* /img > all images and assets
* /js > to add into the JS clientlib

The layout is based on the HTML5 Boilerplate best practices layout. Read more at [https://html5boilerplate.com/](https://html5boilerplate.com/)

>[!NOTE]
>
>At a minimum, the design package **must** contain an **index.html** file at the root level. In case the landing page to be imported has a mobile version as well, then the zip must contain a **mobile.index.html** along with **index.html** at the root level.

### Preparing the Landing Page HTML {#preparing-the-landing-page-html}

To be able to import the HTML, you need to add a canvas div to the landing page HTML.

The canvas div is an html **div** with `id="cqcanvas"` that must be inserted within the HTML `<body>` tag and must wrap the content intended for conversion.

A sample snippet of the landing page HTML after addition of the canvas div is as follows:

```xml
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="description" content="">
</head>
<body>
 <div id="cqcanvas">
  <!-- HTML content intended for conversion -->
 </div>
</body>
</html>
```

### Preparing the HTML to include editable AEM components {#preparing-the-html-to-include-editable-aem-components}

When you import a landing page, you have the choice to import the page as-is, which means that after the landing page is imported you cannot edit any of the imported items in AEM (you can still add additional AEM components on the page).

Before you import the landing page, you may want to convert some of the parts of the landing page so that they are editable AEM components. This lets you quickly edit parts of the landing page even after the landing page design has been imported.

You do this by adding the `data-cq-component` to the appropriate component in the HTML file that you import.

The following section describes how to edit your HTML file so that you convert certain parts of your landing pages into different editable AEM components. Components are described in detail at [Landing Pages Components](/help/sites-classic-ui-authoring/classic-personalization-campaigns-landingpage.md).

>[!NOTE]
>
>HTML markup to convert parts of the landing page into AEM components have both a long form and a shorthand tag declaration. Both are described for each component.

### Limitations {#limitations}

Before importing, note the following limitations:

### Any attribute like class or id applied on the &amp;lt;body> tag is not preserved {#any-attribute-like-class-or-id-applied-on-the-amp-lt-body-tag-is-not-preserved}

If any attribute like id or class is applied on the body tag for example, `<body id="container">` then it is not preserved after the import. So the design being imported should not have any dependencies on the attributes applied on the `<body>` tag.

### Drag and Drop zip {#drag-and-drop-zip}

Drag/Drop zip upload is not supported for Internet Explorer and Firefox versions 3.6 and earlier. To upload a design when using these browsers, click the drop file zone to open up a file upload dialog box and upload your design using that dialog.

The browsers that support "drag and drop" of the design zip are Chrome, Safari5.x, Firefox 4 and above.

### Modernizr is not supported {#modernizr-is-not-supported}

`Modernizr.js` is a JavaScript based tool that detects native capabilities of browsers and detects if they are suited for html5 elements or not. Designs that use Modernizr for enhancing support in older versions of different browsers can cause import issues in the landing page solution. `Modernizr.js` scripts are not supported with the Design importer.

### Page properties are not preserved at the time of importing design package {#page-properties-are-not-preserved-at-the-time-of-importing-design-package}

Any page property (for example, Custom Domain, Enforcing HTTPS, and so on) set for a page (that uses Blank Landing Page template) before importing the design package are lost after the design has been imported. Therefore, the recommended practice is to set the page properties after importing the design package.

### HTML only markup assumed {#html-only-markup-assumed}

On import, the markup is sanitized for security reasons and to avoid importing and publishing invalid markup. This assumes HTML-only markup and all other form of elements such as inline SVG or Web Components will be filtered out.

### Text {#text}

HTML markup to insert a text component ( `foundation/components/text`) in the HTML within design package:

```xml
<div data-cq-component="text"> <p>This is some editable text</p> </div>
```

Including the above markup in the HTML, does the following:

* Creates an editable AEM text component ( `sling:resourceType=foundation/components/text`) in the landing page created after importing the design package.
* Sets the `text` property of the created text component to the HTML enclosed within the `div`.

**Shorthand component tag declaration**:

```xml
<p data-cq-component="text">Text component shorthand</p>
```

**Text with a list**

To add a text with a list:

* 1st
* 2nd

that can be edited in the RTE editor:

```xml
<div data-cq-component="text"><p>This is text with a list:</p><ul><li>1st</li><li>2nd</li></ul><p>It can be edited with the RTE editor</p></div>
```

**Text with color**

To add a text with color (pink) that can be edited in the RTE editor:

```xml
<div class="pink" data-cq-component="text"><p>This is pink text.</p><p>It can be edited with the RTE editor</p></div>
```

### Title {#title}

HTML markup to insert a title component ( `wcm/landingpage/components/title`) in the HTML within design package:

```xml
<div data-cq-component="title"> <h1>This is some editable title text</h1> </div>
```

Including the above markup in the HTML, does the following:

* Creates an editable AEM title component ( `sling:resourceType=wcm/landingpage/components/title`) in the landing page created after importing the design package.
* Sets the `jcr:title` property of the created title component to the text within heading tag wrapped within div.
* Sets the `type` property to the heading tag, in this case `h1`.

The title component supports seven types - `h1, h2, h3, h4, h5, h6` and `default`.

**Shorthand component tag declaration**:

```xml
<h1 data-cq-component="title">Title component shorthand</h1>
```

### Image {#image}

HTML markup to insert an image component (foundation/components/image) in the HTML within design package:

```xml
<div data-cq-component="image">
<img src="img/video1.png" alt="Video about Polar Brake Goggles in action" title="Polar Brake Goggles" width="300" height="200" />
</div>
```

Including the above markup in the HTML, does the following:

* Creates an editable AEM image component ( `sling:resourceType=foundation/components/image`) in the landing page created after importing the design package.
* Sets the `fileReference` property of the created image component to the path to which image specified in src attribute is imported.
* Sets the `alt` property to the value of alt attribute in the img tag.
* Sets the `title` property to the value of title attribute in the img tag.
* Sets the `width` property to the value of width attribute in the img tag.
* Sets the `height` property to the value of height attribute in the img tag.

**Shorthand component tag declaration:**

```xml
<img data-cq-component="image" src="test.png" alt="Image component shorthand"/>
```

#### Absolute URL img src not supported within Image component Div {#absolute-url-img-src-not-supported-within-image-component-div}

If an `<img>` tag with an absolute url src is attempted for component conversion, an appropriate **UnsupportedTagContentException** is raised. For example, the following is not supported:

`<div data-cq-component="image">`

`<img src="https://cdn.printfriendly.com/pf-button.gif" alt="Print Friendly and PDF"/>`

`</div>`

But otherwise, absolute URL images are supported for img tags that are not part of Image Component div.

### Call-to-action components {#call-to-action-components}

You can mark part of landing page for importing as an "editable Call to action component" - such imported call-to-action components can be edited after importing the landing page. AEM includes the following CTA components:

* Click Through Link - Lets you add a text link that when clicked takes the visitor to a target URL.
* Graphical Link - Lets you add an image that when clicked takes the visitor to a target URL.

#### Click Through Link {#click-through-link}

This CTA component can be used to add a text link on the landing page.

Supported properties

* Label, with bold, italics, and underline options
* Target URL, supports third-party and AEM url
* Page rendering options (same window, new window, and so on)

HTML tag to include click through component in the imported zip. Here href maps to target url, "View Product Details" maps to label, and so on.

```xml
<div id="cqcanvas">
.
.
                <div data-cq-component="clickThroughLink">
        <a href="/content/we-retail/us/en/products/equipment/snow-sports/flying-snowboard.html">View Product Details  ></a>
  </div>
.
.
</div>
```

This component can be used in any standalone application or can be imported from zip.

**Shorthand component tag declaration**:

```xml
<a href="/somelink.html" data-cq-component="clickThroughLink">Click Through Link shorthand</a>
```

#### Graphical Link {#graphical-link}

This CTA component can be used to add any graphical image with link on the landing page. The image can be a simple button or any graphical image as background. When the image is clicked, the user is taken to the target URL specified in the component properties. It is a part of "Call to Action" group.

Supported properties

* Image cropping, rotation
* Hover text, description, size in px
* Target URL, supports third-party and AEM url
* Page rendering options (same window, new window, and so on)

HTML tag to include graphical link component in the imported zip. Here href maps to target url, img src is the rendering image, "title" is taken as hover text, and so on.

```xml
<div id="cqcanvas">
  <div data-cq-component="clickThroughGraphicalLink"><a href="https://www.adobe.com/go/wem"><img src="img/call-to-action-button.png" title="Click Here to Learn More" /></a></div>
</div>
```

**Shorthand component tag declaration**:

```xml
<a href="/somelink.html" data-cq-component="clickThroughGraphicalLink"><img src="linkimage.png" alt="Click Through Graphical Link shorthand"/></a>
```

>[!NOTE]
>
>To create a clickthroughgraphical link, you need to wrap an anchor tag and the image tag inside a div with `data-cq-component="clickthroughgraphicallink"` attribute.
>
>For example, `<div data-cq-component="clickthroughlink"> <a href="https://myURLhere/"><img src="image source here"></a> </div>`
>
>Other ways to associate an image with an anchor tag using CSS are not supported. For example, the following markup does not work:
>
>`<div data-cq-component="clickthroughgraphicallink">`
>
>`<a class="hasBackground" href="https://myURLhere/"></a>`
>
>`</div>`
>
>with an associated `css .hasbackground { background-image: pathtoimage }`
>

### Lead Form {#lead-form}

A lead form is a form that is used to collect a visitor/lead's profile information. This information can be stored and used later to do an effective marketing based on the information. This information generally includes title, name, email, date of birth, address, interest, and so on. It is a part of "CTA Lead form" group.

**Supported features**

* Pre-defined lead fields - first-name, last-name, address, dob, gender, about, userId, emailId, submit button are available in the sidekick. Simply drag/drop required component in your lead form.
* With the help of these components author can design a standalone lead form, these fields corresponds to lead form fields. In standalone or imported zip application user can add extra fields using cq:form or cta lead form fields, name, and design them according to the requirements.
* Map lead form fields using specific pre-defined names of CTA lead form, for example, - firstName for first-name in lead form, and so on.
* Fields that are not mapped to lead form maps to cq:form components - text, radio, checkbox, dropdown, hidden, password.
* User can provide the title using "label" tag and can provide styling by using style attribute "class" (only available for CTA lead form components).
* Thank You page and subscription list can be provided as a hidden parameter of the form (present in the index.htm) or can be added/edited from edit bar of "Start of lead form"

  &lt;input type="hidden" name="redirectUrl" value="/content/we-retail/en/user/register/thank_you"/&gt;

  &lt;input type="hidden" name="groupName" value="leadForm"/&gt;

* Constraints like - required can be provided from edit configuration of each of the component.

HTML tag to include graphical link component in the imported zip. Here "firstName" is mapped to lead form firstName, and so on, except for checkboxes - these two check boxes map to cq:form dropdown component.

```xml
<div id="cqcanvas">
   <div id="form_wrapper">
    <h2>NEWSLETTER SIGN UP</h2>
       <div data-cq-component="leadFormGeneration">
       <form method="post" action="#" onsubmit="return popupBox()">
       <label for="firstName" class="checkText">
        FIRST NAME
       </label><br />
       <input name="firstName" class="text pink" type="text" /><br />
       <label for="lastName" class="checkText">
        LAST NAME
       </label><br />
       <input name="lastName" class="text pink" type="text" /><br />
       <label for="emailId" class="checkText">
        EMAIL ADDRESS
       </label><br />
       <input name="emailId" class="text pink" type="text" /><br />

       <div class="checkboxes">
       <input type="checkbox" class="check" name="send_news" /> <label for="send_news" class="checkText">Send me the latest We.Retail news and announcements.</label><br />
       <input type="checkbox" class="check" name="send_offers" /> <label for="send_offers" class="checkText">Send me We.Retail deals and special offers.</label><br />
       </div>
       <input type="submit" name="submit" class="submit pink" value="Sign Up >" />
       </form>
     </div>
   </div>
```

### Parsys {#parsys}

The AEM Parsys component is a container component that can contain other AEM components. It is possible to add a Parsys component in the imported HTML. This allows the user to add/delete editable AEM components to the landing page even after it has been imported.

The paragraph system gives users the ability to add components using the sidekick.

HTML markup to insert a Parsys component ( `foundation/components/parsys`) in the HTML within design package:

```xml
<div data-cq-component="parsys">
   <div data-cq-component="title"><h2>ULTIMATE PROTECTION</h2></div>
        <div data-cq-component="title"><h3>ON SALE</h3></div>
</div>

```

Including the above markup in the HTML does the following:

* Inserts a AEM Parsys component (foundation/components/parsys) in the landing page created after importing the design package.
* Initializes the sidekick with default components. New components can be added to the landing page by dragging components from the sidekick onto the Parsys component.
* Two title components are also part of the Parsys.

### Target {#target}

The target component shows the contents of an experience on the page. One can have many experiences created in a campaign and the target component can dynamically show content from different experiences to various users visiting the page.

The html markup to insert a target component and also create different experiences in a campaign:

```xml
<div data-cq-component="target">
 <section data-cq-component="experience" data-cq-experience="default">
  <p data-cq-component="text">Default content. Select this campaign in client context to view other experiences</p>
 </section>

 <section data-cq-component="experience" data-cq-segment="over-30">
  <p data-cq-component="text">Content for Over 30</p>
 </section>

 <section data-cq-component="experience" data-cq-segment="under-30">
  <p data-cq-component="text">Content for Under 30</p>
 </section>
</div>
```

## Additional Importing Options {#additional-importing-options}

Besides specifying whether components imported are editable AEM components, you can also configure the following before importing the design package:

* Setting page properties by extracting the metadata defined in the imported HTML.
* Specifying the charset encoding in the HTML.
* Overlaying the importer page template.

### Setting page properties by extracting metadata defined in imported HTML {#setting-page-properties-by-extracting-metadata-defined-in-imported-html}

Following metadata declared in the head of the imported HTML shall be extracted and preserved by design importer as property "jcr:description":

* &lt;meta name="description" content=""&gt;

Lang attribute set in the HTML tag shall be extracted and preserved by design importer as property "jcr:language"

* &lt;html lang="en"&gt;

### Specifying the charset encoding in the html {#specifying-the-charset-encoding-in-the-html}

The design importer reads the encoding specified in the imported HTML. Encoding can be specified as follows:

`<meta charset="UTF-8">`

*OR*

`<meta http-equiv="content-type" content="text/html;charset=utf-8">`

If no encoding is specified in the imported HTML, then the default encoding set by the design importer is UTF-8.

### Overlaying template {#overlaying-template}

The Blank Landing Page template can be over layed by creating a one at: `/apps/<appName>/designimporter/templates/<templateName>`

Steps for creating a template in AEM are explained under [Templates](/help/sites-developing/templates.md).

### Referring a component from Landing page {#referring-a-component-from-landing-page}

Suppose you have a component which you want to reference in your HTML using data-cq-component attribute such that the design importer renders a component include at this place. For example, you want to reference the table component ( `resourceType = /libs/foundation/components/table`). Following needs to be added in the HTML:

`<div data-cq-component="/libs/foundation/components/table">foundation table</div>`

The path in the data-cq-component should be the resourceType of the component.

### Best Practices {#best-practices}

Use of CSS selectors similar to following ones is not recommended for use with elements which are marked for component conversion on import.

| E > F |an F element child of an E element | [Child combinator](https://www.w3.org/TR/css3-selectors/#child-combinators) |
|---|---|---|
| E + F |an F element immediately preceded by an E element | [Adjacent sibling combinator](https://www.w3.org/TR/css3-selectors/#adjacent-sibling-combinators) |
| E ~ F |an F element preceded by an E element | [General sibling combinator](https://www.w3.org/TR/css3-selectors/#general-sibling-combinators) |
| E:root |an E element, root of the document | [Structural pseudo-classes](https://www.w3.org/TR/css3-selectors/#structural-pseudos) |
| E:nth-child(n) |an E element, the n-th child of its parent | [Structural pseudo-classes](https://www.w3.org/TR/css3-selectors/#structural-pseudos) |
| E:nth-last-child(n) |an E element, the n-th child of its parent, counting from the last one | [Structural pseudo-classes](https://www.w3.org/TR/css3-selectors/#structural-pseudos) |
| E:nth-of-type(n) |an E element, the n-th sibling of its type | [Structural pseudo-classes](https://www.w3.org/TR/css3-selectors/#structural-pseudos) |
| E:nth-last-of-type(n) |an E element, the n-th sibling of its type, counting from the last one | [Structural pseudo-classes](https://www.w3.org/TR/css3-selectors/#structural-pseudos) |

This is because additional html elements like &lt;div&gt; tag are added to the generated Html after the import.

* Scripts relying on the structure similar to above also are not recommended for use with elements marked for conversion to AEM components.
* Use of styles on the markup tags for component conversion like &lt;div data-cq-component="&ast;"&gt; is not recommended.
* The design layout should follow best practices from HTML5 Boilerplate. Read more on: [https://html5boilerplate.com/](https://html5boilerplate.com/).

## Configuring OSGI modules {#configuring-osgi-modules}

The components that expose properties configurable via OSGI console are as follows:

* Landing Page Design Importer
* Landing Page Builder
* Mobile Landing Page Builder
* Landing Page Entry Preprocessor

The below table briefly describes the properties:

<table>
 <tbody>
  <tr>
   <td><strong>Component</strong></td>
   <td><strong>Property Name</strong></td>
   <td><strong>Property Description </strong></td>
  </tr>
  <tr>
   <td>Landing Page Design Importer</td>
   <td>Extract Filter</td>
   <td>The list of regular expressions to be used for filtering files from extraction. <br /> Zip entries matching any of the specified patterns are excluded from extraction</td>
  </tr>
  <tr>
   <td>Landing Page Builder</td>
   <td>File Pattern</td>
   <td>The Landing Page Builder can be configured to handle HTML files matching a regular expression as defined by file pattern.</td>
  </tr>
  <tr>
   <td>Mobile Landing Page Builder</td>
   <td>File Pattern</td>
   <td>The Landing Page Builder can be configured to handle HTML files matching a regular expression as defined by file pattern.</td>
  </tr>
  <tr>
   <td> </td>
   <td>Device Groups</td>
   <td>The list of device groups to be supported.</td>
  </tr>
  <tr>
   <td>Landing Page Entry Preprocessor</td>
   <td>Search Pattern </td>
   <td>The pattern to search for, in the archive entry contents. This regular expression is matched with the entry content line by line. Upon match, the matching text is replaced with the replacement pattern specified.<br /> <br /> See note below regarding current limitations of landing page entry preprocessor.</td>
  </tr>
  <tr>
   <td> </td>
   <td>Replace Pattern</td>
   <td>The pattern that replaces the matches found. You may use regex group references like $1, $2. Also, this pattern supports keywords like {designPath} that get resolved with the actual value during import.</td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
>**Current limitation of Landing Page Entry Preprocessor:**
>If you need to make any changes to the search pattern, when you open the felix property editor, you need to manually add backslash characters to escape the regex metacharacters. If you do not manually add backslash characters, the regex is considered invalid and will not replace the older one.
>
>For example, if the default configuration is
>
>>`/\* *CQ_DESIGN_PATH *\*/ *(['"])`
>
>And you need to replace `CQ_DESIGN_PATH` with `VIPURL` in the search pattern, then your search pattern should look like this:
>
>`/\* *VIPURL *\*/ *(['"])`

## Troubleshooting {#troubleshooting}

When importing the design package, you may encounter several errors, described in this section.

### Initialization of sidekick with Landing Page relevant components {#initialization-of-sidekick-with-landing-page-relevant-components}

If the design package contains a Parsys component markup, then after importing, the sidekick starts showing landing-page relevant components. You can drag and drop new components onto the Parsys component within your landing page. You can also go to the design mode and add new components to the sidekick.

### Error messages displayed during import {#error-messages-displayed-during-import}

If there was any errors (for example, the imported package is not a valid zip), the design import does not import the package. Instead, an error message is displayed on top of the page just above the drag and drop box. Examples of error scenarios are stated here. After correcting the error, you can reimport the updated zip onto the same blank landing page. Different scenarios where errors are thrown are as follows:

* Imported design package is not a valid zip archive.
* Imported design package does not contain an index.html at the top-level.

### Warnings displayed after import {#warnings-displayed-after-import}

If there are any warnings (for example, HTML refers to images that do not exist within the package), the design importer imports the zip but at the same time display a list of issues/warnings on the Result Pane, Clicking on the issues link, will display a list of warnings which point out any issues within the design package. Different scenarios where warnings are caught and displayed by design importer are as follows:

* HTML refers to images that do not exist within the package.
* HTML refers to scripts that do not exist within the package.
* HTML refers to styles that do not exist within the package.

### Where are the files of the ZIP file being stored in AEM? {#where-are-the-files-of-the-zip-file-being-stored-in-aem}

After the landing page has been imported, the files (images, css, js, and so on) within the design package are stored in the following location in AEM:

`/etc/designs/default/canvas/content/campaigns/<name of brand>/<name of campaign>/<name of landing page>`

Suppose that the landing page is created under the campaign `We.Retail` and the name of the landing page is **myBlankLandingPage** then the location were Zip files are stored is as follows:

`/etc/designs/default/canvas/content/campaigns/geometrixx/myBlankLandingPage`

### Formatting not preserved {#formatting-not-preserved}

When creating your CSS, be aware of the following limitations:

If a text and (editable) image are like the following:

```xml
<div class="box">
<p><div data-cq-component="image"><img src="assets/image.jpg" width="115"
height="116" /></div>Some Text </p>
</div>
```

with a CSS applied on the class `box` as follows:

```xml
.box

{ width: 450px; padding:10px; border: 1px #C5DBE7 solid; margin: 0px auto 0 auto; background-image:url(assets/box.gif); background-repeat:repeat-x,y; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:12px; color:#6D6D6D; }
```

Then `box img` is used in the design importer, the resulting landing page appears not to have preserved the formatting. To work around this, AEM adds div tags in the CSS and rewrite code accordingly. Otherwise, some CSS rules will be invalid.

```xml
.box img

{ float:right; margin: 0 0 5px 5px; border: 1px #343434 solid; }
```

>[!NOTE]
>
>Designers should only code inside the **id=cqcanvas** tag is recognized by the importer, otherwise design is not preserved.
