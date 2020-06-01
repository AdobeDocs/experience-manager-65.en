---
title: Alter the Appearance
seo-title: Alter the Appearance
description: Modify the script
seo-description: Modify the script
uuid: 30555b9f-da29-4115-9ed5-25f80a247bd6
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: c9d31ed8-c105-453b-bd3c-4660dfd81272
docset: aem65

---

# Alter the Appearance {#alter-the-appearance}

## Modify the Script {#modify-the-script}

The comment.hbs script is responsible for creating the overall HTML for each comment.

To not display the avatar next to each posted comment:

1. Copy `comment.hbs`from `libs`to `apps`

   1. Select `/libs/social/commons/components/hbs/comments/comment/comment.hbs`
   1. Select **Copy**
   1. Select `/apps/social/commons/components/hbs/comments/comment`
   1. Select **Paste**

1. Open the overlaid `comment.hbs`

   * Double-click on node `comment.hbs` in `/apps/social/commons/components/hbs/comments/comment folder`

1. Find the following lines and either delete or comment them out:

```xml
  <aside class="scf-comment-author">
        <img class="scf-comment-avatar {{#if topLevel}}withTopLevel{{/if}}" src="{{author.avatarUrl}}"></img>

```

Either delete the lines, or surround them with `<!--` and `-->` to comment them out. Also, the characters 'xxx' are being added as a visual indicator of where the avatar would have been.

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
 >A more robust form of replication would be to create a package in Package Manager and [activate](/help/sites-administering/package-manager.md#replicating-packages) it. A package can be exported and archived.
 >

From the global navigation, select **[!UICONTROL Tools]** > **[!UICONTROL Deployment]** > **[!UICONTROL Replication]** and click **[!UICONTROL Activate Tree]**.

For the Start Path enter `/apps/social/commons` and select **[!UICONTROL Activate]**.

![chlimage_1-77](assets/chlimage_1-77.png)

### View Results {#view-results}

If you login to the publish instance as an administrator, e.g., https://localhost:4503/crx/de as admin/admin, you can verify the overlaid components are there.

If you logout and re-login as `aaron.mcdonald@mailinator.com/password` and refresh the page, you will observe that the posted comment no longer displays with an avatar, instead a simple 'xxx' is displayed.

![chlimage_1-78](assets/chlimage_1-78.png)

