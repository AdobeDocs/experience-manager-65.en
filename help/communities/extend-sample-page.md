---
title: Add Comment to Sample Page
seo-title: Add Comment to Sample Page
description: Add Custom Comments to a page
seo-description: Add Custom Comments to a page
uuid: 7dbaff4f-9986-435d-9379-7add676ea254
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 7185fb13-46a2-4fa3-aa21-a51e63cdb9be
---

# Add Comment to Sample Page {#add-comment-to-sample-page}

Now that the components for the custom comment system are in place in the application directory (/apps), it is possible to make use of the extended component. The instance of the comment system in a website to be affected must set its resourceType to be the custom comment system and include all necessary client libraries.

## Identify Required Clientlibs {#identify-required-clientlibs}

The client libraries necessary for the style and functioning of the default Comments are also necessary for extended Comments.

The [Community Components Guide](components-guide.md) identifies the required client libraries. Browse to the Component Guide and view the Comments component, for example:

[http://localhost:4502/content/community-components/en/comments.html](http://localhost:4502/content/community-components/en/comments.html)

Note the three client libraries required for Comments to render and function properly. These will need to be included where the extended Comments is referenced, as well as the [extended Comments' client library](extend-create-components.md#create-a-client-library-folder) ( `apps.custom.comments`).

![chlimage_1-47](assets/chlimage_1-47.png)

## Add Custom Comments to a Page {#add-custom-comments-to-a-page}

As there can be only one Comment system per page, it is simpler to create a sample page as described in the short [Create a Sample Page](create-sample-page.md) tutorial.

Once created, enter Design mode and make available the Custom component group to allow the `Alt Comments` component to be added to the page.

In order for the Comment to appear and function properly, the client libraries for Comments must be added to the clientlibslist for the page (see [Clientlibs for Communities Components](clientlibs.md)).

### Comments Clientlibs on Sample Page {#comments-clientlibs-on-sample-page}

![Comments Clientlibs on Sample Page](assets/chlimage_1-48.png)

### Author: Alt Comment on Sample Page {#author-alt-comment-on-sample-page}

![Alt Comment on Sample Page](assets/chlimage_1-49.png)

### Author: Sample Page Comments Node {#author-sample-page-comments-node}

You can verify the resourceType in CRXDE by viewing the properties of the comments node for the sample page at `/content/sites/sample/en/jcr:content/content/primary/comments`.

![chlimage_1-50](assets/chlimage_1-50.png)

### Publish Sample Page {#publish-sample-page}

After the custom component is added to the page, it is also necessary to (re) [publish the page](sites-console.md#publishing-the-site).

### Publish: Alt Comment on Sample Page {#publish-alt-comment-on-sample-page}

After publishing both the custom application and the sample page, it should be possible to enter a comment. When signed in, either with a [demo user](tutorials.md#demo-users) or admin, it should be possible to post a comment.

Here is aaron.mcdonald@mailinator.com posting a comment:

![chlimage_1-51](assets/chlimage_1-51.png) ![chlimage_1-52](assets/chlimage_1-52.png)

Now that it appears the extended component is working correctly with the default appearance, it is time to modify the appearance.

