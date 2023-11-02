---
title: Create the Components
description: Learn how to extend components using the comment system that is composed of Comments and Comment components.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 2e02db9f-294d-4d4a-92da-3ab1d38416ab
---
# Create the Components  {#create-the-components}

The example of extending components uses the comment system, which is composed of two components.

* Comments - The encompassing comment system which is the component placed on a page.
* Comment - The component which captures an instance of a posted comment.

Both components must be put in place, especially if customizing the appearance of a posted comment.

>[!NOTE]
>
>Only one comment system per site page is allowed.
>
>Many Communities features already include a comment system whose resourceType can be modified to reference the extended comment system.

## Create the Comments Component {#create-the-comments-component}

These directions specify a **Group** value other than `.hidden` so the component may be made available from the component browser (sidekick).

The deletion of the auto-created JSP file is because the default HBS file is used instead.

1. Browse to **CRXDE|Lite** ([http://localhost:4502/crx/de/index.jsp](http://localhost:4502/crx/de/index.jsp))

1. Create a location for custom applications:

   * Select the `/apps` node

     * **Create Folder** named **[!UICONTROL custom]**

   * Select the `/apps/custom` node

     * **Create Folder** named **[!UICONTROL components]**

1. Select the `/apps/custom/components` node

   * **[!UICONTROL Create > Component...]**

     * **Label**: *comments*
     * **Title**: *Alt Comments*
     * **Description**: *Alternative comments style*
     * **Super Type**: *social/commons/components/hbs/comments*
     * **Group**: *Custom*

   * Select **[!UICONTROL Next]**
   * Select **[!UICONTROL Next]**
   * Select **[!UICONTROL Next]**
   * Select **[!UICONTROL OK]**

1. Expand the node that was created: `/apps/custom/components/comments`
1. Select **[!UICONTROL Save All]**
1. Right-click `comments.jsp`
1. Select **[!UICONTROL Delete]**
1. Select **[!UICONTROL Save All]**

![create-component](assets/create-component.png)

### Create the Child Comment Component {#create-the-child-comment-component}

These directions set **Group** to `.hidden` as only the parent component should be included within a page.

The deletion of the auto-created JSP file is because the default HBS file is used instead.

1. Navigate to the `/apps/custom/components/comments` node
1. Right-click the node

   * Select **[!UICONTROL Create]** > **[!UICONTROL Component...]**

     * **Label**: *comment*
     * **Title**: *Alt Comment*
     * **Description**: *Alternative comment style*
     * **Super Type**: *social/commons/components/hbs/comments/comment*
     * **Group**: `*.hidden*`

   * Select **[!UICONTROL Next]**
   * Select **[!UICONTROL Next]**
   * Select **[!UICONTROL Next]**
   * Select **[!UICONTROL OK]**

1. Expand the node that was created: `/apps/custom/components/comments/comment`
1. Select **[!UICONTROL Save All]**
1. Right-click `comment.jsp`
1. Select **[!UICONTROL Delete]**
1. Select **[!UICONTROL Save All]**

![create-child-component](assets/create-child-component.png) 

![create-component-crxde](assets/create-component-crxde.png)

### Copy and Modify the Default HBS Scripts {#copy-and-modify-the-default-hbs-scripts}

Using [CRXDE Lite](../../help/sites-developing/developing-with-crxde-lite.md):

* Copy `comments.hbs`

  * From [/libs/social/commons/components/hbs/comments](http://localhost:4502/crx/de/index.jsp#/libs/social/commons/components/hbs/comments)
  * To [/apps/custom/components/comments](http://localhost:4502/crx/de/index.jsp#/apps/custom/components/comments)

* Edit `comments.hbs` to:

  * Change the value of the `data-scf-component` attribute (~line 20):

    * From `social/commons/components/hbs/comments`
    * To `/apps/custom/components/comments`

  * Modify to include the custom comment component (~line 75):

    * Replace `{{include this resourceType='social/commons/components/hbs/comments/comment'}}`
    * With `{{include this resourceType='/apps/custom/components/comments/comment'}}`

* Copy `comment.hbs`

  * From [/libs/social/commons/components/hbs/comments/comment](http://localhost:4502/crx/de/index.jsp#/libs/social/commons/components/hbs/comments/comment)
  * To [/apps/custom/components/comments/comment](http://localhost:4502/crx/de/index.jsp#/apps/custom/components/comments/comment)

* Edit `comment.hbs` to:

  * Change the value of the data-scf-component attribute (~ line 19)

    * From `social/commons/components/hbs/comments/comment`
    * To `/apps/custom/components/comments/comment`

* Select `/apps/custom` node
* Select **[!UICONTROL Save All]**

## Create a Client Library Folder {#create-a-client-library-folder}

To avoid having to include this client library, the categories value for the default comment system's clientlib can be used ( `cq.social.author.hbs.comments`). However, this clientlib would then have to be included for all instances of the default component, too.

Using [CRXDE Lite](../../help/sites-developing/developing-with-crxde-lite.md):

* Select `/apps/custom/components/comments` node
* Select **[!UICONTROL Create Node]**

  * **Name**: `clientlibs`
  * **Type**: `cq:ClientLibraryFolder`
  * Add to **[!UICONTROL Properties]** tab:

    * **Name** `categories` **Type** `String` **Value** `cq.social.author.hbs.comments` `Multi`
    * **Name** `dependencies` **Type** `String` **Value** `cq.social.scf` `Multi`

* Select **[!UICONTROL Save All]**
* With `/apps/custom/components/comments/clientlib`s node selected, create three files:

  * **Name**: `css.txt`
  * **Name**: `js.txt`
  * **Name**: customcommentsystem.js

* Enter 'customcommentsystem.js' as the content of `js.txt`
* Select **[!UICONTROL Save All]**

![comments-clientlibs](assets/comments-clientlibs.png)

## Register the SCF Model & View {#register-the-scf-model-view}

When extending (overriding) an SCF component, the resourceType is different (overlaying uses the relative search mechanism that searches through `/apps` before `/libs` so that the resourceType remains the same). This is why it is necessary to write JavaScript (in the client library) to register the SCF JS model and view for the custom resourceType.

Enter the following text as the content of `customcommentsystem.js`:

### customcommentsystem.js {#customcommentsystem-js}

```xml
(function($CQ, _, Backbone, SCF) {
    "use strict";

    var CustomComment = SCF.Components["social/commons/components/hbs/comments/comment"].Model;
    var CustomCommentView = SCF.Components["social/commons/components/hbs/comments/comment"].View;

    var CustomCommentSystem = SCF.Components["social/commons/components/hbs/comments"].Model;
    var CustomCommentSystemView = SCF.Components["social/commons/components/hbs/comments"].View;

    SCF.registerComponent('/apps/custom/components/comments/comment', CustomComment, CustomCommentView);
    SCF.registerComponent('/apps/custom/components/comments', CustomCommentSystem, CustomCommentSystemView);

})($CQ, _, Backbone, SCF);
```

* Select **[!UICONTROL Save All]**

## Publish the App {#publish-the-app}

To experience the extended component in the publish environment, it is necessary to replicate the custom component.

One way to do so is:

* From global navigation,

  * Select **[!UICONTROL Tools]** > **[!UICONTROL Deployment]** > **[!UICONTROL Replication]**
  * Select **[!UICONTROL Activate Tree]**
  * Set `Start Path` to `/apps/custom`
  * Uncheck **[!UICONTROL Only Modified]**
  * Select **[!UICONTROL Activate]** button
