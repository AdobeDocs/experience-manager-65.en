---
title: Add Clientlibs
description: Learn how to add a ClientLibraryFolder (clientlibs) that is used to contain the JavaScript and  Cascading Style Sheets used to render the pages of your site.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
docset: aem65
exl-id: 569f2052-b4fe-4f7f-aec9-657217cba091
---
# Add Clientlibs {#add-clientlibs}

## Add a ClientLibraryFolder (clientlibs) {#add-a-clientlibraryfolder-clientlibs}

Create a ClientLibraryFolder named `clientlibs` which contains the JavaScript (JS) and Cascading Styles Sheets (CSS) used to render the pages of your site.

The `categories` property value given to this client library is the identifier used to directly include this clientlib from a content page or to embed it in other clientlibs.

1. Using **CRXDE Lite**, expand `/etc/designs`

1. Right-click `an-scf-sandbox` and select `Create Node`

    * Name : `clientlibs`
    * Type : `cq:ClientLibraryFolder`

1. Click **OK**

![add-client-library](assets/add-client-library.png)

In the **Properties** tab for the new `clientlibs` node, enter the **categories** property:

* Name : **categories**
* Type : **String**
* Value : **apps.an-scf-sandbox**
* Click **Add**
* Click **Save All**

Note: prefacing the categories value with 'apps.' is a convention to identify the 'owning application' as being in the /apps folder, not /libs. IMPORTANT: Add placeholder `js.tx`t and **`css.txt`** files. (It is not officially a cq:ClientLibraryFolder without them.)

1. Right-click **`/etc/designs/an-scf-sandbox/clientlibs`**
1. Select **Create File...**
1. Enter **Name:** `css.txt`
1. Select **Create File...**
1. Enter **Name:** `js.txt`
1. Click **Save All**

![clientlibs-css](assets/clientlibs-css.png)

The first line of the css.txt and js.txt identifies the base location from which the following lists of files are to be found.

Try setting the content of css.txt to

```
#base=.
 style.css
```

Then create a file under clientlibs named style.css, and set the content to

`body {`

`background-color: #b0c4de;`

`}`

### Embed SCF Clientlibs {#embed-scf-clientlibs}

In the **Properties** tab for the `clientlibs` node, enter the multi-value String property **embed**. This embeds the necessary [client-side libraries (clientlibs) for SCF components](/help/communities/client-customize.md#clientlibs-for-scf). For this tutorial, many of the clientlibs necessary for the Communities components are added.

This may or may not be the desired approach to use for a production site as there are considerations of convenience versus size/speed of the clientlibs downloaded for every page.

If only using one feature on one page, you could include that feature's complete clientlib directly on the page, for example, 

`% ui:includeClientLib categories=cq.social.hbs.forum" %`

In this case, including them all and so the more basic SCF clientlibs which are the author clientlibs are preferred:

* Name : **`embed`**
* Type : **`String`**
* Click **`Multi`**
* Value: **`cq.social.scf`**
  
  * It will pop up a dialog,
  click **`+`** after each entry to add the following clientlib categories:

    * **`cq.ckeditor`**
    * **`cq.social.author.hbs.comments`**
    * **`cq.social.author.hbs.forum`**
    * **`cq.social.author.hbs.rating`**
    * **`cq.social.author.hbs.reviews`**
    * **`cq.social.author.hbs.voting`**
    * Click **OK**

* Click **Save All**

![scf-clientlibs](assets/scf-clientlibs.png)

This is how `/etc/designs/an-scf-sandbox/clientlibs` should now appear in the repository :

![scf-clientlibs-view](assets/scf-clientlibs1.png)

### Include Clientlibs in PlayPage Template {#include-clientlibs-in-playpage-template}

Without including the `apps.an-scf-sandbox` ClientLibraryFolder category on the page, the SCF components are not functional nor styled as the necessary JavaScript and CSS styles are not available.

For example, without including the clientlibs, the SCF comments component appears unstyled :

![clientlibs-comment](assets/clientlibs-comment.png)

Once apps.an-scf-sandbox clientlibs is included, the SCF comments component appears styled :

![clientlibs-comment-styled](assets/clientlibs-comment1.png)

The include statement belongs in the `head` section of the `html` script. The default **`foundation head.jsp`** includes a script that can be overlaid : **`headlibs.jsp`**.

**Copy headlibs.jsp and include clientlibs:**

1. Using **CRXDE Lite**, select **`/libs/foundation/components/page/headlibs.jsp`**

1. Right-click and select **Copy** (or select Copy from the toolbar)
1. Select **`/apps/an-scf-sandbox/components/playpage`**
1. Right-click and select **Paste** (or select Paste from the toolbar)
1. Double-click **`headlibs.jsp`** so you can open it
1. Append the following line to the end of the file
   **`<ui:includeClientLib categories="apps.an-scf-sandbox"/>`**

1. Click **Save All**

```xml
<%@ page session="false" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
%><ui:includeClientLib categories="cq.foundation-main"/><%
%>
<cq:include script="/libs/cq/cloudserviceconfigs/components/servicelibs/servicelibs.jsp"/>
<% currentDesign.writeCssIncludes(pageContext); %>
<ui:includeClientLib categories="apps.an-scf-sandbox"/>

```

Load your website in the browser and see if the background is not a shade of blue.

[https://localhost:4502/content/an-scf-sandbox/en/play.html](https://localhost:4502/content/an-scf-sandbox/en/play.html)

![community-play](assets/community-play.png)

### Saving Your Work So Far {#saving-your-work-so-far}

At this point, there exists a minimalist sandbox. It might be worth saving as a package so that, while playing, if your repository becomes corrupt and you desire to start over, you can turn off your server. Then rename or delete the folder crx-quickstart/, turn on your server, upload and install this saved package, and not have to repeat these most basic of steps.

This package exists on the [Create a Sample Page](/help/communities/create-sample-page.md) tutorial for those who cannot wait to jump in and start playing.

To create a package:

* From CRXDE Lite, click the [Package icon](https://localhost:4502/crx/packmgr/)
* Click **Create Package**

    * Package Name: an-scf-sandbox-minimal-pkg
    * Version: 0.1
    * Group: `leave as default`
    * Click **OK**

* Click **Edit**

    * Select **Filters** tab

        * Click **Add filter**
        * Root Path: browse to `/apps/an-scf-sandbox`
        * Click **Done**
        * Click **Add filter**
        * Root Path: browse to `/etc/designs/an-scf-sandbox`
        * Click **Done**
        * Click **Add filter**
        * Root Path: browse to `/content/an-scf-sandbox**`
        * Click **Done**

    * Click **Save**

* Click **Build**

Now you can select **Download** to save it to disk and **Upload Package** elsewhere, and select **More > Replicate** to push the sandbox to a localhost publish instance to expand the realm of your sandbox.
