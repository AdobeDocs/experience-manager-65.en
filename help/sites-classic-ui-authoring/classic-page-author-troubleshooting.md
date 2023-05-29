---
title: Troubleshooting AEM when authoring
description: The following section covers some issues that you might encounter when using AEM, together with suggestions on how to troubleshoot them.
uuid: eb95e5ba-1eed-4ffb-80c1-9b8468820c22
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: page-authoring
content-type: reference
discoiquuid: 9b492b17-9029-46ae-9dc0-bb21e6b484df
exl-id: 27a6b012-576e-40bc-9b50-c310b3c56c9e
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

      `http://localhost:4502/sites.html/content?`

      This will request the page directly from AEM and bypass the Dispatcher. If you receive the updated page, it is an indication that you should clear the Dispatcher cache.

    * Contact your system administrator is there are issues with the replication queues.

## Sidekick not visible {#sidekick-not-visible}

* **Issue**:

    * Sidekick is not visible when editing a content page on the author environment.

* **Reason**:

    * In rare cases you might have positioned the header of your sidekick outside the scope of your current window. This means you cannot reposition it again.

* **Solution**:

    * Log out from your current session and log back in again. Sidekick will return to the default position.

## Find & Replace - not all instances are replaced {#find-replace-not-all-instances-are-replaced}

* **Issue:**

    * When using the **Find & Replace** option it can happen that not all instances of the `find` term are replaced on a page.

* **Reason**:

    * The capability of **Find & Replace** depends on how the content is saved, and whether it can be searched upon. For example, a blog text is stored in `jcr:text` property which is not configured to be searched upon. The default scope for the find and replace servlet covers the following properties:

        * `jcr:title`
        * `jcr:description`
        * `jcr:text`
        * `text`

* **Solution**:

    * These definitions can be changed with the configuration for **Day CQ WCM Find Replace Servlet** using the **Web Console**; for example, at

      `http://localhost:4502/system/console/configMgr`
