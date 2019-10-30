---
title: Authoring Nested Groups
seo-title: Authoring Nested Groups
description: Create nested groups
seo-description: Create nested groups
uuid: b377dc1b-bbb6-41c9-b0fc-8281e1410685
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: introduction
content-type: reference
discoiquuid: 752235d2-21ac-46d2-82ed-5fec09c645e9
docset: aem65

---

# Authoring Nested Groups{#authoring-nested-groups}

## Creating Groups on Author {#creating-groups-on-author}

On AEM Author instance, from global navigation:

* Select** Communities, Sites.**
* Select **engage folder** to open it.
* Select the card for the **Getting Started Tutorial** English site.

    * Select the card image.
    * Do *not* select an icon.

The result is to reach the [Groups console](/help/communities/groups.md):

![](assets/chlimage_1-91.png)

The groups function will display as a folder in which instances of groups are created. Select the Groups folder to open it. The group created on publish is visible.

![](assets/chlimage_1-92.png)

## Create Main Arts Group {#create-main-arts-group}

This group can be created because the site structure for engage includes a groups function. The configuration of the function in the site's `Reference Template` defaults to allowing the selection of any enabled group template. Thus, the template chosen for this new group is the `Reference Group`.

These consoles are similar to the Communities Sites console.

* Select **Create Group.**
* **Community Group Template**:

    * Community Group Title: Arts.
    * Community Group Description: A parent group for various arts groups.
    * Community Group Root: *leave as default.*
    * Additional Available Community Group Language(s): use the drop-down menu to select the available community group language(s). The menu displays all the language(s) in which the parent community site is created. Users can select among these languages to create groups in multiple locales in this single step. Same group gets created in multiple specified languages in the Groups console of the respective community sites.
    * Community Group Name: arts.
    * Template: drop down to select `Reference Group.`
    * `Select Next.`

![Nested community groups](assets/parent-to-nestedgroup.png)

Continue through the other panels with these settings:

* **Design**

    * Change the design or allow default parent site's design.
    * Select **Next.**

* **Settings**

    * **Moderation**

        * leave empty (inherit from parent site).

    * **Membership**

        * use default `Optional Membership.`

    * **Thumbnail**

        * `*optional.*`

    * `Select Next.`

* Select **Create.**

### Nesting Groups within Arts Group {#nesting-groups-within-arts-group}

The `groups` folder now contains two groups (refresh the page).

![Nesting the groups](assets/create-community-group.png)

#### Publish Group {#publish-group}

Before creating groups nested within the `arts`group, hover over the `arts` card and select the publish icon to publish it.

![](assets/chlimage_1-93.png)

Wait for confirmation that the group was published.

![](assets/chlimage_1-94.png)

The `arts` group should also contain a `groups` folder, but one that is empty and in which new groups can be created. Navigate to the arts group folder and create 3 nested groups, each with a different membership setting:

1. Visual

    * Title: `Visual Arts`
    * Name: `visual`
    * Template: `Reference Group`
    * Membership: select `Optional Membership`
      a public group, open to all members

1. Auditory

    * Title: `Auditory Arts`
    * Name: `auditory`
    * Template: `Reference Group`
    * Membership: select `Required Membership`
      an open group, available for members to join

1. History

    * Title: `Art History`
    * Name: `history`
    * Template: `Reference Group`
    * Membership: select `Restricted Membership`
      a secret group, visible only to invited members
      as an example, invite [demo user](/help/communities/tutorials.md#demo-users) `emily.andrews@mailinator.com`

Refresh the page to see all three nested groups (sub-communities).

To navigate to the nested groups from the Communities Sites console:

* select engage folder
* select Getting Started Tutorial card
* select Groups folder
* select arts card
* select Groups folder

![](assets/chlimage_1-95.png)

## Publishing Groups {#publishing-groups}

![](assets/chlimage_1-96.png)

After publishing the main community site:

* publish each group individually

    * waiting for confirmation that the group was published

* publish parent group before publishing any groups nested within

    * all groups must be published in a top-down fashion.

![](assets/chlimage_1-97.png)

## Experience on Publish {#experience-on-publish}

It is possible to experience the different groups when signed in, for example with the [demo users](/help/communities/tutorials.md#demo-users) used for

* Art/History group member: emily.andrews@mailinator.com/password

    * the restricted (secret) group, arts/history, is visible
    * can see optional (public) groups
    * can join restricted (open) groups

* Group manager: aaron.mcdonald@mailinator.com/password

    * can see optional (public) groups
    * can join restricted (open) groups
    * can not see restricted (secret) groups

Access the Communities [Members and Groups consoles](/help/communities/members.md) on author to add other users to various member groups that correspond to the community groups.

