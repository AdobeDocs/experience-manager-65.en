---
title: Develop Sandbox Application
seo-title: Develop Sandbox Application
description: Develop application using foundation scripts
seo-description: Develop application using foundation scripts
uuid: 572f68cd-9ecb-4b43-a7f8-4aa8feb6c64e
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 910229a3-38b1-44f1-9c09-55f8fd6cbb1d
exl-id: 7ac0056c-a742-49f4-8312-2cf90ab9f23a
---
# Develop Sandbox Application  {#develop-sandbox-application}

In this section, now that the template has been setup in the [initial application](initial-app.md) section, and the initial pages established in the [initial content](initial-content.md) section, the application can be developed using foundation scripts including the ability to enable authoring with Communities components. At the end of this section, the website will be functional.

## Using Foundation Page Scripts {#using-foundation-page-scripts}

The default script, created when the component which renders the playpage template was added, is modifed to include the foundation page's head.jsp and a local body.jsp.

### Super Resource Type {#super-resource-type}

The first step is to add a resource super type property to the `/apps/an-scf-sandbox/components/playpage` node so that it inherits the scripts and properties of the super type.

Using CRXDE Lite:

1. Select node `/apps/an-scf-sandbox/components/playpage`.
1. In properties tab, enter a new property with the following values:
   
   Name: `sling:resourceSuperType`
   
   Type: `String`
   
   Value: `foundation/components/page`

1. Click the green **[!UICONTROL +Add]** button.
1. Click **[!UICONTROL Save All]**.

   ![page-script](assets/page-script.png)

### Head and body scripts {#head-and-body-scripts}

1. In **CRXDE Lite** explorer pane, navigate to `/apps/an-scf-sandbox/components/playpage` and double-click the file `playpage.jsp` to open it in the edit pane.

   `/apps/an-scf-sandbox/components/playpage/playpage.jsp`

   ```xml
   <%--

     An SCF Sandbox Play Component component.

     This is the component which renders content for An SCF Sandbox page.

   --%><%
   %><%@include file="/libs/foundation/global.jsp"%><%
   %><%@page session="false" %><%
   %><%
    // TODO add your code here
   %>
   ```

1. Being aware of open/close script tags, replace " // TODO ..." with includes of scripts for the head and body parts of &lt;html&gt;.

   With a super type of `foundation/components/page`, any script not defined in this same folder will resolve to a script in `/apps/foundation/components/page` folder (if it exists), else to a script in `/libs/foundation/components/page` folder.

   `/apps/an-scf-sandbox/components/playpage/playpage.jsp`

   ```xml
   <%--

       An SCF Sandbox Play Component component: playpage.jsp

     This is the component which renders content for An SCF Sandbox page.

   --%><%
   %><%@include file="/libs/foundation/global.jsp"%><%
   %><%@page session="false" %>
   <html>
     <cq:include script="head.jsp"/>
     <cq:include script="body.jsp"/>
   </html>
   ```

1. The foundation script `head.jsp` need not be overlaid, but the foundation script `body.jsp` is empty.

   To setup for authoring, overlay `body.jsp` with a local script and include a paragraph system (parsys) in the body:

   1. Navigate to `/apps/an-scf-sandbox/components`.
   1. Select the `playpage` node.
   1. Right-click and select `Create > Create File...`

      * Name: **body.jsp**

   1. Click **[!UICONTROL Save All]**.

   Open `/apps/an-scf-sandbox/components/playpage/body.jsp` and paste in the following text:

   ```xml
   <%--

       An SCF Sandbox Play Component component: body.jsp

     This is the component which renders content for An SCF Sandbox page.

   --%><%
   %><%@include file="/libs/foundation/global.jsp"%><%
   %><%@page session="false" %>
   <body>
       <h2>Community Play</h2>
       <cq:include path="par" resourceType="foundation/components/parsys" />
   </body>
   ```

1. Click **[!UICONTROL Save All]**.

**View the page in a browser in edit mode:**

* Standard UI: `http://localhost:4502/editor.html/content/an-scf-sandbox/en/play.html`

You should not only see the heading **Community Play**, but also the UI for editing page content.

The Assets/Component side panel is seen when both the side panel is toggled open and the window is wide enough for both the side content and the page content to be displayed.

![view-page](assets/view-page.png)

* Classic UI: `http://localhost:4502/cf#/content/an-scf-sandbox/en/play.html`

Following is how the play page appears in the classic UI including with content finder (cf):

![play-page-view](assets/play-page-view.png)

## Communities Components {#communities-components}

To enable Communities components for authoring, start by following these instructions:

* [Accessing Communities Components](basics.md#accessing-communities-components)

For the purposes of this sandbox, start with these **Communities** components (enable by checking the box):

* Comments
* Forum
* Rating
* Reviews
* Reviews Summary (Display)
* Voting

In addition, choose **[!UICONTROL General]** components, such as

* Image
* Table
* Text
* Title (Foundation)

>[!NOTE]
>
>The components enabled for the page par are stored in the repository as the value of the `components` property of the
>
>`/etc/designs/an-scf-sandbox/jcr:content/playpage/par` node.

## Landing Page {#landing-page}

In a multi-language environment, the root page would include a script which would parse the request from the client to determine the preferred langauge.

In this simple example, the root page is being statically set to redirect to the english page, which may be developed in the future to be the main landing page with a link to the play page.

Change the browser URL to the root page: `http://localhost:4502/editor.html/content/an-scf-sandbox.html`

* Select the Page Information icon
* Select **[!UICONTROL Open Properties]**
* On the ADVANCED tab

  * For the Redirect entry, browse to **[!UICONTROL Websites]** > **[!UICONTROL SCF Sandbox Site]** > **[!UICONTROL SCF Sandbox]**
  * Click **[!UICONTROL OK]**

* Click **[!UICONTROL OK]**

Once the site is published, browsing to the root page on a publish instance will redirect to the english page.

The last step before playing with the communities SCF components is to add a Client Library Folder (clientlibs) .... [Add Clienlibs](add-clientlibs.md)
