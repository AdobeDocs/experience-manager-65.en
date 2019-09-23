---
title: Alter the Appearance
seo-title: Alter the Appearance
description: Modify the script
seo-description: Modify the script
uuid: 97fd8006-573c-4ceb-b021-4b3fe5672017
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 1154f713-bee7-4bf4-b1cd-701c1ef2f299
index: y
internal: n
snippet: y
---

# Alter the Appearance{#alter-the-appearance}

| ** [⇐ Create Nodes](/communities/using/overlay-create-nodes.md)** |  |
|---|---|

### Modify the Script {#modify-the-script}

The comment.hbs script is responsible for creating the overall HTML for each comment.

To not display the avatar next to each posted comment:

1. copy** ** `comment.hbs`from `libs`to `apps`

    1. select** ** `/libs/social/commons/components/hbs/comments/comment/comment.hbs`
    
    1. select **Copy**
    1. select `/apps/social/commons/components/hbs/comments/comment`
    1. select **Paste**

1. open the overlaid `comment.hbs`

    * double-click on node** ** `comment.hbs`in `/apps/social/commons/components/hbs/comments/comment folder`

1. find the following lines and either delete or comment them out:

```xml
  <aside class="scf-comment-author">
        <img class="scf-comment-avatar {{#if topLevel}}withTopLevel{{/if}}" src="{{author.avatarUrl}}"></img>

```

Either delete the lines, or surround them with '&lt;!--' and '--&gt;' to comment them out. Also, the characters 'xxx' are being added as a visual indicator of where the avatar would have been.

```xml
   xxx
   <!-- do not display avatar with comment
    <aside class="scf-comment-author">
        <img class="scf-comment-avatar {{#if topLevel}}withTopLevel{{/if}}" src="{{author.avatarUrl}}"></img>

```

### Replicate the Overlay {#replicate-the-overlay}

Push the overlaid comments component to the publish instance using the Replication Tool.

>[!NOTE]
>
>A more robust form of replication would be to create a package in Package Manager and [activate](../../sites/administering/using/package-manager.md#replicating-packages) it. A package can be exported and archived.

From the global navigation, select **Tools, Deployment, Replication** and then **Activate Tree**.

For the Start Path enter `/apps/social/commons`** **and select **Activate**.

![](assets/chlimage_1-78.png) 

### View Results {#view-results}

If you login to the publish instance as an administrator, e.g., http://localhost:4503/crx/de as admin/admin, you can verify the overlaid components are there.

If you logout and re-login as `aaron.mcdonald@mailinator.com/password` and refresh the page, you will observe that the posted comment no longer displays with an avatar, instead a simple 'xxx' is displayed.

![](assets/chlimage_1-79.png) 

| ** [⇐ Create Nodes](/communities/using/overlay-create-nodes.md)** |  |
|---|---|

