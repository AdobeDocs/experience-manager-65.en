---
title: Troubleshooting when authoring in AEM
description: Some issues that you might encounter when using AEM.
uuid: 99af51ea-8628-4811-83f2-ab3f88f0279e
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: page-authoring
content-type: reference
discoiquuid: da0a5644-2e1d-4394-a6aa-11bb41406ba6
exl-id: 05586b17-35d4-496e-8f0e-293c755eb066
---
# Troubleshooting AEM when Authoring{#troubleshooting-aem-when-authoring}

The following section covers some issues that you might encounter when using AEM, together with suggestions on how to troubleshoot them.

>[!NOTE]
>
>When experiencing problems it is also worthwhile checking the list of [Known Issues](/help/release-notes/release-notes.md) for your instance (release and service packs).

>[!NOTE]
>
>Users who have administrator privileges, and who want to troubleshoot problems with AEM, can use the troubleshooting methods described in [Troubleshooting AEM (for Administrators)](/help/sites-administering/troubleshoot.md). If you do not have sufficient privileges, please see your system administrator about troubleshooting AEM.

## Old page version still on published site {#old-page-version-still-on-published-site}

* **Issue**:

    * You have made changes to a page and replicated the page to the publish site, but the *old* version of the page is still being shown on the publish site.

* **Reason**:

    * This can have several causes, most often the cache (either your local browser or the Dispatcher), though it can sometimes be an issue with the replication queue.

* **Solutions**:

    * There are various possibilities here:
    * Confirm that the page has been replicated correctly. Check the page status and if necessary, the state of the replication queue.
    * Clear the cache in your local browser and access your page again.
    * Add `?` to the end of the page URL. For example:

        * `http://localhost:4502/sites.html/content?`
        * This will request the page directly from AEM and bypass the Dispatcher. If you receive the updated page, it is an indication that you should clear the Dispatcher cache.

    * Contact your system administrator is there are issues with the replication queues.

## Component Actions not visible on Toolbar {#component-actions-not-visible-on-toolbar}

* **Issue**:

    * The full range of applicable component actions are not visible when editing a content page on the author environment.

* **Reason**:

    * In rare cases a previous action might impact the toolbar.

* **Solution**:

    * Refresh the page.
