---
title: Configuring Undo for Page Editing

description: Learn how to configure Undo support for page editing in AEM.


contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference

exl-id: 2cf3ac3f-ee17-480d-a32a-c57631502693
solution: Experience Manager, Experience Manager Sites
feature: Configuring
role: Admin
---
# Configuring Undo for Page Editing{#configuring-undo-for-page-editing}

The [OSGi service](/help/sites-deploying/configuring-osgi.md)  **Day CQ WCM Undo Configuration** ( `com.day.cq.wcm.undo.UndoConfigService`) exposes several properties that control the behavior of the undo and redo commands for editing pages.

## Default Configuration {#default-configuration}

In a standard installation the default settings are defined as properties on the `sling:OsgiConfig`node:

`/libs/wcm/core/config.author/com.day.cq.wcm.undo.UndoConfig`

This node contains `cq.wcm.undo.whitelist` and `cq.wcm.undo.blacklist` properties, for the other properties the defaults are taken.

>[!CAUTION]
>
>You ***must*** not change anything in the `/libs` path.
>
>This is because the content of `/libs` is overwritten the next time you upgrade your instance (and may well be overwritten when you apply either a hotfix or feature pack).

## Configuring Undo and Redo {#configuring-undo-and-redo}

You can configure these OSGi service properties for your own instance.

>[!NOTE]
>
>When working with AEM, there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for more details and the recommended practices.

The following lists the properties as displayed in the Web console, followed by the name of the corresponding OSGi parameter, together with a description and the default value (where appropriate):

* **Enable**
  ( `cq.wcm.undo.enabled`)

    * **Description**: Determines whether page authors can undo and redo changes.
    * **Default**: `Selected`
    * **Type**: `Boolean`

* **Path**
  ( `cq.wcm.undo.path`)

    * **Description**: The repository path for persisting binary undo data. When authors change binary data such as images, the original version of the data is persisted here. When changes to binary data is undone, this binary undo data is restored to the page.
    * **Default**: `/var/undo`
    * **Type**: `String`

  >[!NOTE]
  >
  >By default, only administrators can access the `/var/undo` node. Authors can perform undo and redo operations on binary content only after they are given permissions to access the binary undo data.

* **Min. validity**
  ( `cq.wcm.undo.validity`)

    * **Description**: The minimum amount of time that binary undo data is stored, in hours. After this time period, the binary data is available for deletion, to conserve disk space.
    * **Default**: `10`
    * **Type**: `Integer`

* **Steps**
  ( `cq.wcm.undo.steps`)

    * **Description**: The maximum number of page actions that are stored in the undo history.
    * **Default**: `20`
    * **Type**: `Integer`

* **Persistence**
  ( `cq.wcm.undo.persistence`)

    * **Description**: The class that persists undo history. Two persistence classes are provided:

        * `CQ.undo.persistence.WindowNamePersistence`: Persists history using the window.name property.
        * `CQ.undo.persistence.CookiePersistance`: Persists history using cookies.

    * **Default**: `CQ.undo.persistence.WindowNamePersistence`
    * **Type**: `String`

* **Persistence mode**
  ( `cq.wcm.undo.persistence.mode`)

    * **Description**: Determines when undo history is persisted. Select this option to persist undo history after each page edit. Clear this option to persist only when a page reload occurs (for example, the user navigates to a different page).

      Persisting undo history uses web browser resources. If your users' browser reacts slowly to page edits, try persisting the undo history on page reloads.

    * **Default**: `Selected`
    * **Type**: `Boolean`

* **Marker mode**
  ( `cq.wcm.undo.markermode`)

    * **Description**: Specifies the visual cue to use for indicating which paragraphs are affected when an undo or redo occurs. The following values are valid:

        * flash: The selection indicator of the paragraphs flash temporarily.
        * select: The paragraph is selected.

    * **Default**: `flash`
    * **Type**: `String`

* **Good components**
  ( `cq.wcm.undo.whitelist`)

    * **Description**: A list of components that you want to be affected by undo and redo commands. Add component paths to this list when they function correctly with undo/redo. Append an asterisk (&ast;) to specify a group of components:

        * The following value specifies the foundation text component:

          `foundation/components/text`

        * The following value specifies all foundation components:

          `foundation/components/*`

    * When undo or redo is issued to a component that is not in this list, a message appears that indicates that the command can be unreliable.

    * **Default**: The property is populated with many components that AEM provides.
    * **Type**: `String[]`

* **Bad components**
  ( `cq.wcm.undo.blacklist`)

    * **Description**: A list of components and/or component operations that you do not want to be affected by the undo command. Add components and component operations that do not behave correctly with the undo command:

        * Add a component path when you want none of the component's operations in the undo history, for example, `collab/forum/components/post`
        * Append a colon (:) and an operation to the path when you want that specific operation to be omitted from the undo history (other operations function correctly), for example, `collab/forum/components/post:insertParagraph.`

  >[!NOTE]
  >
  >When an operation is on this list, it is still added to the undo history. Users cannot undo operations that exist earlier than a **Bad Component** operation in the undo history.

    * Typical operation names are as follows:

        * `insertParagraph`: The component is added to the page.
        * `removeParagraph`: The component is deleted.
        * `moveParagraph`: The paragraph is moved to a different location.
        * `updateParagraph`: The paragraph properties are changed.

    * **Default**: The property is populated with several component operations.
    * **Type**: `String[]`
