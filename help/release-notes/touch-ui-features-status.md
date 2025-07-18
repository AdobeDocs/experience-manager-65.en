---
title: Touch UI Feature Status
description: Release notes specific to [!DNL Adobe Experience Manager] Touch-Enabled UI.
exl-id: 7b71e8db-e8c6-4470-bc22-db3d4600b7fc
solution: Experience Manager
feature: Release Information
role: User,Admin,Architect,Developer
---
# Touch UI Feature Status {#touch-ui-feature-status}

Adobe Experience Manager (AEM) 6.4 onwards [Classic UI is deprecated](../release-notes/deprecated-removed-features.md). Adobe is not making any more enhancements to the Classic UI and users are encouraged to use the powerful new features available in the touch-enabled UI.

Starting with version 6.0, AEM introduced a new user interface referred as the "touch-enabled UI" (called "Touch UI") that is aligned to the [!DNL Adobe Experience Cloud] and to the overall Adobe user interface guidelines. With near feature parity reached, this has become the standard UI in AEM with the legacy, desktop-oriented interface referred to as "classic UI".

While most capabilities are present in the touch-enabled UI, there are features that are not yet complete and will be added in future releases.

The following list shows the status of the capabilities as implemented in AEM 6.5.

For recommendations for customers that upgrade to AEM 6.5, see [User interface recommendations for customers](/help/sites-deploying/ui-recommendations.md).

>[!NOTE]
>
>This page only covers feature parity with classic UI. Capabilities added to and unique to the Touch-enabled UI that are not present in the Classic UI are not listed.

>[!NOTE]
>
>This list strives to be complete, but is not exhaustive.

## Legend {#legend}

* **Complete**: The feature is fully available in the touch-enabled UI.
* **Mostly**: The feature is mostly available in the touch-enabled UI.
* **Missing**: The feature is not present in the touch-enabled UI, the classic UI has to be used to do this action.
* **Replaced**: The feature was replaced with a new implementation that works differently.
* **Removed**: The feature no longer exists in the touch-enabled UI and will not be replaced.

## Feature Status: Sites Admin {#feature-status-sites-admin}

This is a list of capabilities the classic UI Site Admin (`/siteadmin`) has and the status in the touch-enabled UI (`/sites.html`).

|Feature|Status|Comment|
|--- |--- |--- |
|Navigate Site Hierarchy|Complete|AEM 6.4 introduced a [content tree view](/help/sites-authoring/basic-handling.md#content-tree).|
|Start Workflow|Complete||
|Create new page|Complete||
|Create new site|Complete||
|Create new launch|Complete||
|Create new live copy|Complete||
|Create folder|Complete||
|Show Publication Status|Complete|Starting AEM 6.5, the workflow status is shown in the list view.|
|Search|Complete||
|Copy and paste page (Duplicate)|Complete||
|Move pages|Complete||
|Publish pages|Complete||
|Publish pages without replication rights|Complete||
|Publish later|Complete||
|Publish tree|Complete||
|Unpublish pages|Complete||
|Unpublish pages without replication rights|Complete||
|Unpublish later|Complete||
|Delete|Complete||
|Lock/Unlock|Complete||
|View/Edit Properties|Complete||
|Set Permissions on Pages|Complete||
|Version history|Complete||
|Restore version|Complete||
|Restore tree and restore deleted pages|Missing|Use Classic UI.|
|Show difference between old and current version|Complete||
|Live copy Actions (Roll-out)|Complete||
|See language copies|Complete||
|Find and replace|Missing|Use Classic UI.|
|Notification inbox (JCR events)|Missing|Use Classic UI. Replaced with a different implementation in the future.|
|References|Complete|Display of incoming page links added to AEM 6.5. Only direct links to the page are shown for performance reasons.|

## Feature Status: Page Editor {#feature-status-page-editor}

This is a list of capabilities the classic UI Page Editor (`/cf#`) has and the status in the touch-enabled (`/editor.html`).

|Feature|Status|Comment|
|--- |--- |--- |
|Edit Web Pages|Complete||
|Edit Mobile Web Pages|Complete||
|Edit content imported via Design Importer|Complete||
|Edit E-Mails|Complete||
|Edit Hybrid Mobile Apps|Complete||
|Edit Forms|Complete||
|Edit Offers|Complete||
|Edit Workflows Models|Complete||
|Mode: Edit and Preview|Complete||
|Responsive Preview|Complete||
|Mode: Edit Design|Complete||
|Mode: Scaffolding|Complete||
|Mode: Live Copy Status|Complete||
|Add annotations|Complete||
|Edit properties|Complete||
|Roll-out page|Complete||
|Start and show workflow|Complete||
|Workflow package handing|Mostly|Accessible in the touch-enabled UI. Multiple workflow payload still presented in the classic UI.|
|Lock/Unlock Page|Complete||
|Publish Page|Complete||
|Unpublish Page|Complete||
|Copy Page|Removed|Use Site Admin to [copy pages](/help/sites-authoring/managing-pages.md#copying-and-pasting-a-page).|
|Move Page|Removed|Use Site Admin to [move pages](/help/sites-authoring/managing-pages.md#moving-or-renaming-a-page).|
|Delete Page|Removed|Use Site Admin to [delete pages](/help/sites-authoring/managing-pages.md#deleting-a-page).|
|Show References|Removed|Use Site Admin to see the [detailed reference list](/help/sites-authoring/author-environment-tools.md#references).|
|Audit Log|Removed|Use Site Admin and [open activity rail](/help/sites-authoring/author-environment-tools.md#events-timeline).|
|Create Version|Removed|Use Site Admin to [create new versions](/help/sites-authoring/working-with-page-versions.md#creating-a-new-version).|
|Restore Version|Removed|Use Site Admin to [restore versions](/help/sites-authoring/working-with-page-versions.md#reverting-to-a-page-version).|
|Switch Launches|Removed|Use Site Admin to [switch between launches](/help/sites-authoring/launches-promoting.md).|
|Translate Page|Removed|Use Site Admin to [add page to translation projects](/help/sites-administering/tc-manage.md).|
|Timewarp (choose the date/time and browse the site as it then looked)|Complete||
|Set Permissions|Complete||
|Client Context UI|Replaced|Use the [ContextHub](/help/sites-authoring/ch-previewing.md) UI going forward.|
|Content Finder for the various media types|Complete||
|Component List|Complete||
|Copy and paste components|Complete||
|List of components in clipboard|Missing||
|Undo / Redo|Complete||
|Drag content into component placeholder|Complete||
|Drag content directly into parsys placeholder with component auto-creation|Complete||

## Feature Status: Text, Table, and Image Editors {#feature-status-text-table-and-image-editors}

This is a list of capabilities the classic UI Text, Table, and Image Editor have and the status in the touch-enabled UI.

|Feature|Status|Comment|
|--- |--- |--- |
|Rich Text Editor|Complete|Usable in-place, in dialog, and in full screen.|
|Enable/disable RTE Plug-ins|Complete|It can be done using the [Template Editor](/help/sites-authoring/templates.md).|
|Use RTE for Plain-text|Complete||
|RTE Plug-in: Links and anchor|Complete||
|RTE Plug-in: Character Map|Complete||
|RTE Plug-in: Copy/Paste|Complete||
|RTE Plug-in: Paste from Microsoft&reg; Word|Complete||
|RTE Plug-in: Find and replace|Complete||
|RTE Plug-in: Text Formats (bold, ...)|Complete||
|RTE Plug-in: Sub and superscript|Complete||
|RTE Plug-in: Justify|Complete||
|RTE Plug-in: Lists (bullets / numbers)|Complete||
|RTE Plug-in: Paragraph Format|Complete||
|RTE Plug-in: Text Styles|Complete||
|RTE Plug-in: Source Editor (Edit HTML)|Complete|Only available in dialog and full screen.|
|RTE Plug-in: Spellchecker|Complete||
|RTE Plug-in: Table (embedded Table Editor)|Complete||
|RTE Plug-in: Undo/Redo|Complete||
|RTE Plug-In: Allow in-line images|Complete||
|Table Editor|Complete|Usable in-place, in dialog, and in full screen.|
|Drag image into table cell|Complete|Usable in-line|
|Image Editor|Complete|Usable in-place, in dialog, and in full screen.|
|Enable/disable IPE Plug-ins|Complete|AEM 6.3 introduced a UI in the [Template Editor](/help/sites-authoring/templates.md).|
|IPE Plug-in: Crop|Complete||
|IPE Plug-in: Flip|Complete||
|IPE Plug-in: Undo/Redo|Complete||
|IPE Plug-in: Image Map|Complete||
|IPE Plug-in: Rotate|Complete||
|IPE Plug-in: Zoom|Complete||

## Feature Status: Tools {#feature-status-tools}

This is a list of various tools that the classic UI has and the status in the touch-enabled UI.

|Feature|Status|Comment|
|--- |--- |--- |
|Task Management|Replaced|6.0 introduced Projects and tasks.|
|Workflow Inbox|Complete||
|Workflow to Page Template Configuration (`/etc/workflow/wcm/templates.html`)|Missing|Use Classic UI.|
|Tagging Admin UI|Complete||
|MSM/Blueprint Control Center|Complete||
|Blueprint Manager UI|Complete||
|Roll-out Configuration UI|Missing|Use Classic UI.|
|User, Groups, and permissions UI|Mostly Complete|For advanced permission editing use Classic UI.|
|Purge Versions (`/etc/versioning/purge.html`)|Missing|Use Classic UI.|
|External Linkchecker (`/etc/linkchecker.html`)|Missing|Use Classic UI.|
|Bulk Editor (`/etc/importers/bulkeditor.html`)|Missing|Use Classic UI.|
|Upload thumbnails to add or overwrite those|Missing|Use Classic UI.|
