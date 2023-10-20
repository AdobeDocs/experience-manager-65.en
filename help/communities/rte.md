---
title: Rich Text Editor Essentials
description: Learn about the fundamentals and features of a Rich Text Editor that lets you enter text with markup.
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
exl-id: 821e32f4-da8d-4bbb-936a-0844b8a24cdd
---
# Rich Text Editor Essentials {#rich-text-editor-essentials}

## Overview {#overview}

A Rich Text Editor (RTE) lets you enter text with markup.

For Communities components, while similar to the [rich text editor in the author environment](../../help/sites-authoring/rich-text-editor.md), it affects text entered in the publish environment.

![rich-text-editor](assets/rich-text-editor.png)

## Enabling Rich Text Editor {#enabling-rich-text-editor}

Communities components that allow user generated content (UGC) can be enabled to allow RTE. If the component was added to a page or included within a [function](functions.md), RTE may or may not be enabled by default.

If not enabled, simply enter [author edit mode](sites-console.md#authoring-site-content), select the component for edit, and select the `Rich Text Editor` checkbox.

RTE is available for the following Communities components:

* [Blog](blog-feature.md)
* [Calendar](calendar.md)
* [Comments](comments.md)
* [Filelibrary](file-library.md)
* [Forum](forum.md)
* [Messaging](configure-messaging.md)
* [QnA](working-with-qna.md)
* [Reviews](reviews.md)

## Customization {#customization}

Customization of the rich text editor is possible as the implementation is based on [CKEditor](https://ckeditor.com/).

The current configuration for Communities components is in the `cq.social.  scf   clientlib`, in the repository at

`/libs/clientlibs/social/commons/scf/ckrte.js`

Modifying the cq.social.scf clientlib is not recommended as future upgrades may override any edits.

### Example Customization: Inline Links {#example-customization-inline-links}

Due to security concerns, the hyperlink options are not included in the set of rich text icons presented to members by default. The ability for mischief is extensive when hrefs are allowed in UGC.

To add the hyperlink options to the toolbar:

* Add a toolbar named " `links`"
  * `{ name: 'links', items: [ 'Link','Unlink','Anchor' ] }`
* Select **[!UICONTROL Save All]**

#### /libs/clientlibs/social/commons/scf/ckrte.js {#libs-clientlibs-social-commons-scf-ckrte-js}

```
CKRte.prototype.config = {
    toolbar: [
        { name: "basicstyles",
           items: ["Bold", "Italic", "Underline", "NumberedList", "BulletedList", "Outdent", "Indent", "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyBlock", "TextColor"]
        },
        { name: 'links',
           items: [ 'Link','Unlink','Anchor' ]
        }
    ],
    autoParagraph: false,
    autoUpdateElement: false,
    removePlugins: "elementspath",
    resize_enabled: false
};
```
