---
title: Introduction to Customizing AEM form workspace
seo-title: Introduction to Customizing AEM form workspace
description: A quick introduction, with conceptual and technical information, to customize LiveCycle AEM Forms workspace for process management.
seo-description: A quick introduction, with conceptual and technical information, to customize LiveCycle AEM Forms workspace for process management.
uuid: 7fca1b07-6be8-4f81-93f7-740526f1784b
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: 67c7304b-197a-4809-b9b2-c5950313ad62
index: y
internal: n
snippet: y
---

# Introduction to Customizing AEM form workspace{#introduction-to-customizing-aem-form-workspace}

AEM form workspace provides capabilities to modify the presentation semantics and functionality of its interface. The types of customizations to change the style, layout, formatting, branding, and core functionality are described below.

![](assets/cu_customized_workspace_example.png)

An example of a customized workspace

## Types of customizations {#types-of-customizations}

AEM Forms workspace supports a wide variety of customizations to update the layout of the user interface, its appearance, functionality, and much more. The customizations involve updating one or more of the following:

* Appearances of the user interface
* Functionality using semantic customizations  
* Reusing HTML components in other applications

### User interface changes {#user-interface-changes}

You can change the appearance, layout, and other presentation semantics of AEM Forms workspace. Change workspace by customizing the CSS, HTML templates, and JavaScript™ files. All the default files are provided in the default installation.

The most commonly applicable steps are covered in [Generic steps for AEM Forms workspace customization](../../../6-5/forms/using/generic-steps-html-workspace-customization.md). For specific examples of such customizations, including the detailed steps, see the related articles at the end of this article.

#### Understanding the style sheet {#understanding-the-style-sheet}

Before customizing workspace, make yourself familiar with the default style sheet supplied with AEM Forms at /libs/ws/css/style.css.

To customize the workspace, it is recommended that you make yourself familiar with the existing style sheet, style.css, located in /libs/ws/css folder. A few prominent components are described below.

<table cellpadding="4" cellspacing="0"> 
 <tbody> 
  <tr> 
   <th class="cellrowborder" valign="top" width="NaN%"><p>CSS element</p> </th> 
   <th class="cellrowborder" valign="top" width="NaN%"><p>User interface component modified</p> </th> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>#header</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Header of the AEM Forms workspace</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.categoryList</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Category list</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.categoryList .header</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Header of category list</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.categories, .filters</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Space below category list</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.category, .filter</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Category</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.category:hover, .category.selected, .filter:hover, .filter.selected</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Selected category and mouse over style of category</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>categoryListBar .tool, categoryListBar .content</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Start process page (closed Category list)</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>filterListBar .tool, filterListBar .content</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>To Do page (closed Filter list)</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>processNameListBar .tool, processNameListBar .content</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Tracking page (closed Process name list)</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.startPointList, .tasklist</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>The startpoint list or the task list</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.startPointList .header, .tasklist .header</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>The header of a startpoint list or a task list</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.startpoint.selected, .task.selected</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>The selected startpoint or task</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.startpoint.selected .description, .task.selected .description</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Description of the selected startpoint or task</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>#taskarea</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>The Task area</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>#header .dropdown</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>User dropdown in header</p> </td> 
  </tr> 
  <tr> 
   <td class="cellrowborder" headers="d19e178 " valign="top" width="NaN%"><p>.sortDrop dd ul</p> </td> 
   <td class="cellrowborder" headers="d19e181 " valign="top" width="NaN%"><p>Sort task dropdown</p> </td> 
  </tr> 
 </tbody> 
</table>

#### CSS {#css}

The appearance of AEM Forms workspace borrows its appearance from a CSS. By customizing the CSS, you can change the presentation semantics of workspace like fonts, colors, branding, and layout.

The top-level steps for CSS customization are:

* Create a CSS file.  
* Add style items to this CSS. See Understanding CSS Styles for more information.
* Update its references in `html.jsp`.

For the exact steps to do these customizations, see [Generic steps for AEM Forms workspace customization](../../../6-5/forms/using/generic-steps-html-workspace-customization.md). The CSS file shipped with AEM Forms workspace is at /libs/ws/css/. For CSS-related customizations, use the [Ship Package](../../../6-5/forms/using/introduction-customizing-html-workspace.md#p-crx-package-p). For specific examples of CSS-related customizations, see the related Help topics at the end of this article.

#### Image {#image}

You can customize the AEM Forms workspace to add avatars of users or to add the logo of your organization. For these customizations, use [Ship Package](../../../6-5/forms/using/introduction-customizing-html-workspace.md#p-crx-package-p).

The top-level steps for customizations to the images are:

* Install and configure WebDAV.
* Add new images.
* Add new styles corresponding to the added images.
* Link to the new CSS file in `html.jsp` file.

To get started with customizing the images in AEM Forms workspace, follow the [Generic steps for AEM Forms workspace customization](../../../6-5/forms/using/generic-steps-html-workspace-customization.md). For specific examples of image-related customizations, see the related Help topics at the end of this article.

#### HTML template {#html-template}

HTML templates help define the appearance and the layout of the workspace user interface. By updating the default HTML templates you can customize the layout default user interface.

The top-level steps for customizations to the HTML template are:

* In a user-created folder, make copies of the required default files.
* Add new templates in user-defined folder.
* Make relevant updates to the copied files like, the path of the new template.

For specific examples of such customizations, see the Help topics provided at the end of this article. Choose between the [Ship Package](../../../6-5/forms/using/introduction-customizing-html-workspace.md#p-crx-package-p) or the [Dev Package](../../../6-5/forms/using/introduction-customizing-html-workspace.md#p-crx-package-p), depending on the template to be customized.

### Semantic changes {#semantic-changes}

To modify the AEM Forms workspace functionality, change the JavaScript source code. Modifications in the core functionality are labeled as Semantic changes. You modify models, view, and templates provided as part of the source code of AEM Forms workspace.

The top-level steps to do semantic changes to modify the functionality of AEM Forms workspace are:

* In a user-created folder, make copies of the appropriate default files.
* Add new models and views in the user-defined folder.
* Make relevant updates like updating paths of newly added models and views in the default JavaScript files.
* Minify the package to optimize the performance.

For more conceptual information about the components that are part of the source code, see the [Description of reusable components](/6-5/forms/using/description-reusable-components.md). For these customizations, use the Dev Package.

### Reusable components {#reusable-components}

As AEM Forms workspace is a component-based software, it can be easily customized and reused. You can easily integrate the workspace components with your web applications.

For more conceptual information, see the [Description of reusable components](/6-5/forms/using/description-reusable-components.md) and for instruction about using the components, see [Integrating AEM Forms workspace components in web applications](/6-5/forms/using/description-reusable-components.md).

## Building AEM Forms workspace&nbsp;code {#building-html-workspace-code}

### SDK package {#sdk-package}

The package contains the source code of AEM Forms workspace. The package is available at `[*LC root*]\sdk\html-workspace\adobe-lc-workspace-src.zip`.

It is primarily meant for customizations, as it provides the capability to generate:

* CRX packages for Ship, Debug, and Dev profiles (mentioned below in [CRX packages](../../../6-5/forms/using/introduction-customizing-html-workspace.md#p-crx-package-p)).
* Minified version of customized code (for semantic changes).

#### WS content {#ws-content}

* client-pkg:

    * src - Contains artifacts needed to create CRX nodes.
    * pom.xml - Script to build deploy packages for various profiles WS-Deploy Package

* client-html:

    * assembly - Contains zip.xml used by script for creating AEM Forms workspace SDK.
    * src/main/webapp -

        * css - Contains style sheets for AEM Forms workspace.
        * images - Contains images used in AEM Forms workspace.
        * js:

            * libs - Contains all third-party libraries used in AEM Forms workspace.
            * licenses - Contains licenses for HTML and JS files as well as code to prefix these licenses to respective source files.
            * minifier - Used for combination, minification, and uglification of customized javascript code.
            * resourcejs_optimizer - Used for combination, minification, and uglification of javascript source.
            * resource_generator - Used for generating register.js and modelcontrollerpath.js.
            * runtime:

                * initializer - Contains initializer.js used to initialize backbone views and models used in AEM Forms workspace.
                * models - Contains backbone models of all components present in AEM Forms workspace.
                * routes - Contains javascript files and HTML files which loads start process, todo, tracking, and preferences in AEM Forms workspace.
                * services - Contains service.js used in AEM Forms workspace. All the server calls are made through service.js.
                * templates - Contains all templates, that is, HTML files of all views in AEM Forms workspace.
                * util - Contains all utility files (javascript) which are used in AEM Forms workspace.
                * views - Contains backbone views of all components in AEM Forms workspace.

            * main.js
            * router.js

        * libs/ws: pdf.html and pluginPing.pdf are used for loading PDF forms in AEM Forms workspace and WSNextAdapter.swf is used to load SWF forms and Guides in AEM Forms workspace.
        * locales:

            * de-DE - Contains translation.json for German.
            * en-US - Contains translation.json for English.
            * fr-FR - Contains translation.json for French.
            * ja-JP - Contains translation.json for Japanese.
            * html.jsp - Contains code to find out current browser locale.

        * html.jsp
        * GET.jsp

### CRX Package {#crx-package}

CRX package can be deployed on the CRX™ repository. It is available at `[*LC root*]\crx-repository\install\adobe-lc-workspace-pkg.zip`.

This package can be built using the three profiles described below.

| **Profile ** |**Description ** |**Usage ** |
|---|---|---|
| Ship profile |This profile creates a CRX package of the smallest possible size using minification. This package is the most efficient. All the JavaScript™ files are combined and minified into a single JS file. |Use this profile when no further semantic changes are required in JS files. |
| Debug profile |This profile creates a moderately efficient CRX package. The size of the package is slightly more than the package created using Ship profile. This package has most of the JavaScript files combined into a single JS file. |Use this profile for debugging. |
| Dev profile |This profile creates a CRX package of the largest possible size. All the JavaScript files are available separately, as they are in SDK package. |Use this profile when incorporating semantic changes. |

#### Ship Profile {#ship-profile}

#### Command {#command}

* mvn clean -P Ship install on client-pkg folder of Source package shipped to client.
* Ship profile command execution works only on a 64-bit JVM.

#### WS content {#ws-content-1}

* css - Contains style.css, ie.css, and jquery-ui.css.
* images - Contains all images.
* js:

    * libs:

        * require - Contains require.js.
        * jqueryui - Contains jquery.ui.datepicker.ja.js.

    * runtime:

        * templates - Contains all templates, that is, HTML files of all components in AEM Forms workspace.

    * main.js (combined, minified, and uglified).
    * registry.js

* libs:

    * ws - Contains pluginPing.pdf, pdf.html, and WSNextAdapter.swf.

* Locale - Contains .content.xml.
* locales:

    * de-DE - Contains translation.json for German.
    * en-US - Contains translation.json for English.
    * fr-FR - Contains translation.json for French.
    * ja-JP - Contains translation.json for Japanese.
    * html.jsp - Contains code to find out current browser locale.

* Index - Contains .content.xml
* profile - Contains offline.jsp.
* GET.jsp
* html.jsp
* content.xml
* _rep_policy.xml

#### Debug Profile {#debug-profile}

#### Command {#command-1}

* mvn clean -P Debug install on client-pkg
* Debug profile command execution works only on 64-bit JVM.

#### WS content {#ws-content-2}

* css - Contains style.css, ie.css, and jqueri-ui.css.
* images - Contains all images.
* js:

    * libs:

        * require - Contains require.js.
        * jqueryui - Contains jquery.ui.datepicker.ja.js.

    * runtime:

        * templates - Contains all templates, that is, HTML files of all components in AEM Forms workspace.

    * main.js (combined).
    * registry.js

* libs:

    * ws - Contains pluginPing.pdf, pdf.html, and WSNextAdapter.swf.

* Locale - Contains .content.xml.
* locales:

    * de-DE - Contains translation.json for German.
    * en-US - Contains translation.json for English.
    * fr-FR - Contains translation.json for French.
    * ja-JP - Contains translation.json for Japanese.
    * html.jsp - Contains code to find out current browser locale.

* Index - Contains .content.xml
* profile - Contains offline.jsp.
* GET.jsp
* html.jsp
* content.xml
* _rep_policy.xml

#### Dev Profile {#dev-profile}

#### Command {#command-2}

mvn clean -P Dev install on client-pkg

#### WS content {#ws-content-3}

* css - Contains style.css, ie.css, and jqueri-ui.css.
* images - Contains all images.
* js:

    * libs - Contains all libraries used in AEM Forms workspace.
    * require - Contains require.js
    * jqueryui - Contains jquery.ui.datepicker.ja.js
    * runtime:

        * initializer - Contains initializer.js and modelcontrollerpath.js.
        * models - Contains models of all components in AEM Forms workspace.
        * routes - Contains javascript files and HTML files which loads start process, todo, tracking, and preferences in AEM Forms workspace.
        * services - Contains service.js used in AEM Forms workspace.
        * templates - Contains all templates, that is, HTML files of all components in AEM Forms workspace.
        * util - Contains all utility files (JavaScript) which are used in AEM Forms workspace.
        * views - Contains views of all components in AEM Forms workspace.

    * main.js
    * registry.js
    * router.js

* libs:

    * ws - Contains pluginPing.pdf, pdf.html, and WSNextAdapter.swf.

* Locale - Contains .content.xml.
* locales:

    * de-DE - Contains translation.json for German.
    * en-US - Contains translation.json for English.
    * fr-FR - Contains translation.json for French.
    * ja-JP - Contains translation.json for Japanese.
    * html.jsp - Contains code to find out current browser locale.

* Index - Contains .content.xml
* profile - Contains offline.jsp.  
* GET.jsp
* html.jsp
* content.xml
* _rep_policy.xml

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)

<!--
<related-links>
<a href="../../../6-5/forms/using/introduction-customizing-html-workspace.md">Introduction to Customizing AEM Forms workspace</a>
<a href="../../../6-5/forms/using/generic-steps-html-workspace-customization.md">Generic steps for AEM Forms workspace customization</a>
<a href="../../../6-5/forms/using/tasks-organizational-hierarchy-using-manager.md">Managing tasks in an organizational hierarchy using Manager View</a>
<a href="../../../6-5/forms/using/integrating-correspondence-management-html-workspace.md">Integrating Correspondence Management in AEM Forms workspace</a>
<a href="/6-5/forms/using/single-sign-timeout-handlers.md">Single Sign On and timeout handlers</a>
<a href="/6-5/forms/using/displaying-user-avatar.md">Displaying the user avatar</a>
<a href="/6-5/forms/using/displaying-information-task-summary-pane.md">Displaying information in the Task Summary pane</a>
<a href="/6-5/forms/using/changing-organization-logo-branding.md">Changing the organization logo</a>
<a href="/6-5/forms/using/changing-color-scheme-interface.md">Changing the color scheme of the interface</a>
<a href="../../../6-5/forms/using/changing-font-interface.md">Changing the font on the interface</a>
<a href="../../../6-5/forms/using/changing-locale-user-interface.md">Changing the locale of the user interface</a>
<a href="/6-5/forms/using/customizing-error-dialogs.md">Customizing error dialogs</a>
<a href="/6-5/forms/using/customizing-tabs-task.md">Customizing tabs for a task</a>
<a href="/6-5/forms/using/customizing-task-actions.md">Customizing Task Actions</a>
<a href="/6-5/forms/using/customizing-listing-process-instances.md">Customizing the listing of process instances</a>
<a href="/6-5/forms/using/customizing-task-details-page.md">Customizing the task Details page</a>
<a href="../../../6-5/forms/using/display-additional-data-in-todo-list.md">Displaying additional data in ToDo list</a>
<a href="/6-5/forms/using/getting-task-variables-summary-url.md">Getting Task Variables in Summary URL</a>
<a href="/6-5/forms/using/images-route-actions.md">Images for Route Actions</a>
<a href="../../../6-5/forms/using/creating-new-login-screen.md">Creating a new login screen</a>
<a href="/6-5/forms/using/minification-javascript-files.md">Minification of the JavaScript files</a>
<a href="/6-5/forms/using/sorting-tracking-tables-add-columns.md">Sorting of Tracking tables and adding more columns</a>
<a href="/6-5/forms/using/updating-link-help-documentation.md">Updating the link to the documentation</a>
<a href="/6-5/forms/using/two-html-workspace-instances-one.md">Hosting two AEM Forms workspace instances on one server</a>
</related-links>
-->

