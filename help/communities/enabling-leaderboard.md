---
title: Leaderboard Feature
seo-title: Leaderboard Feature
description: Adding a Leaderboard component to a page
seo-description: Adding a Leaderboard component to a page
uuid: 2a766b63-3ab4-44cd-8a26-629a71b837ea
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.4/COMMUNITIES
topic-tags: authoring
content-type: reference
discoiquuid: 1e96d388-8517-4a84-bb0a-d49567eb4bdf
---

# Leaderboard Feature {#leaderboard-feature}

## Introduction {#introduction}

The `Leaderboard` component provides the ability to obtain a sense of how members are interacting within the community by ranking members according to points earned (basic scoring) or their expertise (advanced scoring).

Prior to including the leaderboard component on a page, it is necessary to configure [Communities Scoring and Badges](implementing-scoring.md).

This section of the documentation describes

* Adding the `Leaderboard` component to a [community site](overview.md#community-sites)

* Configuration settings for the `Leaderboard` component

## Adding a Leaderboard to a Page {#adding-a-leaderboard-to-a-page}

To add a `Leaderboard` component to a page in author mode, locate the component

* `Communities / Leaderboard`

and drag it into place on a page.

For necessary information, visit [Communities Components Basics](basics.md).

When first placed on a page of a community site, this is how the component appears:

![chlimage_1-8](assets/chlimage_1-8.png)

## Configuring Leaderboard {#configuring-leaderboard}

Select the placed `Leaderboard` component to access and select the `Configure` icon which opens the edit dialog.

![chlimage_1-9](assets/chlimage_1-9.png) ![chlimage_1-10](assets/chlimage_1-10.png)

### Settings tab {#settings-tab}

Under the **[!UICONTROL Settings]** tab, specify what information related to the member is displayed:

* **[!UICONTROL Display Name]** 
  A descriptive name to display for the board, reflecting the rules selected for displaying badges and scores.

  Default is `Leaderboard`, if nothing entered.

* **[!UICONTROL Badge]** 
  If checked, a column for badge icons is included in the leaderboard.  

  Default is unchecked.

* **[!UICONTROL Badge Name]** 
  If checked, a column for the badge name is included in the leaderboard.  

  Default is unchecked.

* **[!UICONTROL Use Avatar]** 
  If checked, the member's avatar image is included in the leaderboard, next to their name link to their member profile.  

  Default is unchecked.

### Rules tab {#rules-tab}

Under the **[!UICONTROL Rules]** tab, the community site, and its scoring and badging rules

* **[!UICONTROL Rule Location]** 
  (required) Location where the Scoring/Badging rule is configured.

* **[!UICONTROL Scoring Rule]** 
  (required) Specific rule generating the scores to display.

* **[!UICONTROL Badging Rule]** 
  (required) Specific rule generating the badge to display.

* **[!UICONTROL Display Limit]**
Number of members to display per page.  

  Default is 10.

## Example: Participants Leaderboard {#example-participants-leaderboard}

This leaderboard reports results from applying basic scoring rules.

Leaderboard component configuration:

* **[!UICONTROL Settings]** tab:

    * Display Name = `Participation Board`
    * `checked`:

        * Badge
        * Badge Name
        * Use Avatar

* **[!UICONTROL Rules]** tab:

    * Rule Location = `/content/sites/communities/jcr:content`
    * Scoring Rule = `/etc/community/scoring/rules/forums-scoring`
    * Badging Rule = `/etc/community/badging/rules/reference-badging`
    * Display Limit = `10`

![chlimage_1-11](assets/chlimage_1-11.png)

## Example: Experts Leaderboard {#example-experts-leaderboard}

This leaderboard reports results from applying advanced scoring rules.

Leaderboard component configuration:

* **[!UICONTROL Settings]** tab:

    * Display Name = `Expertise Board`
    * `checked`:

        * Badge
        * Use Avatar

* **[!UICONTROL Rules]** tab:

    * Rule Location = `/content/sites/communities/jcr:content`
    * Scoring Rule = `/etc/community/scoring/rules/adv-forums-scoring`
    * Badging Rule = `/etc/community/badging/rules/adv-forums-badging`
    * Display Limit = `10`

![chlimage_1-12](assets/chlimage_1-12.png)

## Additional Information {#additional-information}

More information may be found on the [Leaderboard Essentials](leaderboard.md) page for developers.

Instructions for creating rules are provided on the [Communities Scoring and Badges](implementing-scoring.md) page for administrators.
