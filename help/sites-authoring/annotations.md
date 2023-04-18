---
title: Annotations when editing a content page
description: Many components directly related to content let you add an annotation.
uuid: 157be55c-8ab8-472e-be32-0dcc02bfa41d
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: page-authoring
content-type: reference
discoiquuid: aa89326a-ad33-4b0b-8d09-c68c5a5c790a
exl-id: de1ae7e3-db3a-4b5e-8a4f-ae111227181f
---
# Annotations when Editing a Page{#annotations-when-editing-a-page}

Adding content to the pages of your website is often subject to discussions prior to it actually being published. To aid this, many components directly related to content (as opposed, for example, to layout) allow you to add an annotation.

An annotation places a colored marker/sticky-note on the page. The annotation allows you (or other users) to leave comments and/or questions for other authors/reviewers.

>[!NOTE]
>
>The definition of an individual component type determines whether adding an annotation is possible (or not) on instances of that component.

>[!NOTE]
>
>Annotations created in the Classic UI will be shown in the touch-enabled UI. However sketches are UI-specific and they are only shown in the UI in which they were created.

>[!CAUTION]
>
>Deleting a resource (e.g. paragraph) deletes all the annotations and sketches attached to that resource irrespective of their position on the page as a whole.

>[!NOTE]
>
>Depending on your requirements you can also develop a workflow to send notifications when annotations are added, updated, or deleted.

## Annotations {#annotations}

A special [mode](/help/sites-authoring/author-environment-tools.md#page-modes) is used for creating and viewing annotations.

>[!NOTE]
>
>Don't forget that [comments](/help/sites-authoring/basic-handling.md#timeline) are also available for providing feedback on a page.

>[!NOTE]
>
>You can annotate a variety of resources:
>
>* [Annotating assets](/help/assets/manage-assets.md#annotating)
>* [Annotating video assets](/help/assets/managing-video-assets.md#annotate-video-assets)
>

### Annotating a Component {#annotating-a-component}

The Annotate mode allows you to create, edit, move or delete annotations on your content:

1. You can enter Annotate mode using the icon in the toolbar (top right) when editing a page:

   ![](do-not-localize/screen_shot_2018-03-22at110414.png)

   You can now view any existing annotations.

   >[!NOTE]
   >
   >To exit Annotation mode tap/click the Annotate icon (x symbol) at the right of the top toolbar.

1. Click/tap the Add Annotation icon (plus symbol at the left of the toolbar) to start adding annotations.

   >[!NOTE]
   >
   >To stop adding annotations (and return to viewing) tap/click the Cancel icon (x symbol in a white circle) at the left of the top toolbar.

1. Click/tap the required component (components that can be annotated will be highlighted with a blue border) to add the annotation and open the dialog:

   ![screen_shot_2018-03-22at110606](assets/screen_shot_2018-03-22at110606.png)

   Here you can use the appropriate field and/or icon to:

    * Enter the annotation text.
    * Create a sketch (lines and shapes) to highlight an area of the component.

      The cursor will change to a crosswire when you are creating a sketch. You can draw multiple distinct lines. The sketch line reflects the annotation color and can be either an arrow, circle, or oval.

   ![](do-not-localize/screen_shot_2018-03-22at110640.png)

    * Choose/change the color:

   ![](do-not-localize/chlimage_1-19.png)

    * Delete the annotation.

   ![](do-not-localize/screen_shot_2018-03-22at110647.png)

1. You can close the annotation dialog by clicking/tapping outside the dialog. A truncated view (the first word) of the annotation, together with any sketches, is shown:

   ![screen_shot_2018-03-22at110850](assets/screen_shot_2018-03-22at110850.png)

1. After you have finished editing a specific annotation, you can:

    * Click/tap the text marker to open the annotation. Once open you can view the full text, make changes or delete the annotation.

        * Sketches cannot be deleted independently of the annotation.

    * Reposition the text marker.
    * Click/tap on a sketch line to select that sketch and drag it to the desired position.
    * Move, or copy, a component

        * Any related annotations and their sketches will also be moved or copied and their position in relation to the paragraph will remain the same.

1. To exit Annotation mode, and return to the mode previously used, tap/click the Annotate icon (x symbol) at the right of the top toolbar.

>[!NOTE]
>
>Annotations can not be added to a page that has been locked by another user.

### Annotation Indicator {#annotation-indicator}

Annotations do not appear in Edit mode, but the badge at the top right of the toolbar shows how many annotations exist for the current page. The badge replaces the default Annotations icon, but still functions as a quick link that toggles to/from the Annotate mode:

![chlimage_1-242](assets/chlimage_1-242.png)
