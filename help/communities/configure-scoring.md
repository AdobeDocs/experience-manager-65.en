---
title: Scoring and Badges Essentials
seo-title: Scoring and Badges Essentials
description: Scoring and Badges feature overview
seo-description: Scoring and Badges feature overview
uuid: 6e3af071-04e8-4dc1-977a-0da711b72961
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: 628b6dcd-8b1c-4166-8fc2-843baa86ac1c
docset: aem65
exl-id: 470a382a-2aa7-449e-bf48-b5a804c5b114
---
# Scoring and Badges Essentials {#scoring-and-badges-essentials}

The AEM Communities scoring and badges feature identifies and rewards community members.

The details of setting up the feature are described at

* [Communities Scoring and Badges](/help/communities/implementing-scoring.md)

This page contains additional technical details :

* How to [display a badge](#displaying-badges) as either image or text
* How to turn on extensive [debug logging](#debug-log-for-scoring-and-badging)
* How to [access UGC](#ugc-for-scoring-and-badging) related to scoring and badging

>[!CAUTION]
>
>The implementation structure visible in CRXDE Lite is subject to change.

## Displaying Badges {#displaying-badges}

Whether a badge is displayed as text or image is controlled on the client side in the HBS template.

For example, search for `this.isAssigned` in `/libs/social/forum/components/hbs/topic/list-item.hbs`:

```
{{#each author.badges}}

  {{#if this.isAssigned}}

    <div class="scf-badge-text">

      {{this.title}}

    </div>

  {{/if}}

{{/each}}

{{#each author.badges}}

  {{#unless this.isAssigned}}

    <img class="scf-badge-image" alt="{{this.title}}" title="{{this.title}}" src="{{this.imageUrl}}" />

  {{/unless}}

{{/each}}
```

If true, isAssigned indicates that the badge was assigned for a role and the badge should be displayed as text.

If false, isAssigned indicates that the badge was awarded for an earned score and the badge should be displayed as an image.

Any changes to this behavior should be made in a customized script (either override or overlay). See [Client-side Customization](/help/communities/client-customize.md).

## Debug Log for Scoring and Badging {#debug-log-for-scoring-and-badging}

To help debug scoring and badging, a custom log file can be setup. The contents of this log file may then be provided to customer support if problems are encountered with the feature.

For detailed instructions, visit [Create a Custom Log File](/help/sites-deploying/monitoring-and-maintaining.md#create-a-custom-log-file).

To quickly setup a slinglog file :

1. Access the **Adobe Experience Manager Web Console Log Support**, for example

    * https://localhost:4502/system/console/slinglog

1. Select **Add new logger**

    1. Select `DEBUG` for **Log Level**

    1. Enter a name for **Log File**, for example

        * logs/scoring-debug.log

    1. Enter two **Logger** (class) entries (using `+` icon)

        * `com.adobe.cq.social.scoring`
        * `com.adobe.cq.social.badging`

    1. Select **Save**

![debug-scoring-log](assets/debug-scoring-log.png)

To see log entries:

* From the Web Console

    * Under the **Status** menu
    * Select **Log Files**
    * Search for your Log File name, such as `scoring-debug`

* On the server's local disk

    * The log file is at &lt;*server-install-dir*&gt;/crx-quickstart/logs/&lt;*log-file-name*&gt;.log

    * For example, `.../crx-quickstart/logs/scoring-debug.log`

![scoring-log](assets/scoring-log.png)

## UGC for Scoring and Badging {#ugc-for-scoring-and-badging}

It is possible to view the UGC related to scoring and badging when the chosen SRP is either JSRP or MSRP, but not ASRP. (If not familiar with these terms, see [Community Content Storage](/help/communities/working-with-srp.md) and [Storage Resource Provider Overview](/help/communities/srp.md).)

The descriptions for accessing scoring and badging data use JSRP, as the UGC is easily accessible using [CRXDE Lite](/help/sites-developing/developing-with-crxde-lite.md).

**JSRP on author**: experimenting in the author environment results in UGC that is only visible from the author environment.

**JSRP on publish**: similarly, if testing on the publish environment, it is necessary to access CRXDE Lite with administrative privileges on a publish instance. If the publish instance is running in [production mode](/help/sites-administering/production-ready.md) (nosamplecontent runmode), it is necessary to [enable CRXDE Lite](/help/sites-administering/enabling-crxde-lite.md).

The base location of UGC on JSRP is `/content/usergenerated/asi/jcr/`.

### Scoring and Badging APIs {#scoring-and-badging-apis}

The following APIs are available for use :

* [com.adobe.cq.social.scoring.api in 6.3](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/previous-updates/aem-previous-versions.html)
* [com.adobe.cq.social.badging.api in 6.3](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/previous-updates/aem-previous-versions.html)

The latest Javadocs for the installed feature pack are available to developers from the Adobe repository. See [Using Maven for Communities : Javadocs](/help/communities/maven.md#javadocs).

**The location and format of the UGC in the repository is subject to change without warning**.

### Example Setup {#example-setup}

The screen shots of repository data come from setting up scoring and badging for a forum on two different AEM sites :

1. An AEM site *with* a unique id (community site created using wizard) :

   * Using the Getting Started Tutorial (engage) site created during the [getting started tutorial](/help/communities/getting-started.md)
   * Locate the forum page node

     `/content/sites/engage/en/forum/jcr:content`

   * Add scoring and badging properties

    ```
    scoringRules = [/libs/settings/community/scoring/rules/comments-scoring,
    /libs/settings/community/scoring/rules/forums-scoring]
    ```

    ```
    badgingRules =[/libs/settings/community/badging/rules/comments-scoring,
    /libs/settings/community/badging/rules/forums-scoring]
    ```

   * Locate the forum component node

      `/content/sites/engage/en/forum/jcr:content/content/primary/forum`
      ( `sling:resourceType = social/forum/components/hbs/forum`)

   * To display badges, add property

     `allowBadges = true`

   * A user signs in, creates a forum topic, and is awarded a bronze badge

1. An AEM site *without* a unique id :

   * Using the [Community Components guide](/help/communities/components-guide.md)
   * Locate the forum page node

     `/content/community-components/en/forum/jcr:content`

   * Add scoring and badging properties

    ```
    scoringRules = [/libs/settings/community/scoring/rules/comments-scoring,
    /libs/settings/community/scoring/rules/forums-scoring]
    ```

    ```
    badgingRules =[/libs/settings/community/badging/rules/comments-badging,
    /libs/settings/community/badging/rules/forums-badging]
    ```

   * Locate the forum component node

     `/content/community-components/en/forum/jcr:content/content/forum`
    ( `sling:resourceType = social/forum/components/hbs/forum`)

   * To display badges, add property

     `allowBadges = true`

   * A user signs in, creates a forum topic, and is awarded a bronze badge

1. A user is assigned a moderator badge using cURL :

   ```shell

   curl -i -X POST -H "Accept:application/json" -u admin:admin -F ":operation=social:assignBadge" -F "badgeContentPath=/libs/settings/community/badging/images/moderator/jcr:content/moderator.png" https://localhost:4503/home/users/community/w271OOup2Z4DjnOQrviv/profile.social.json

   ```

   As a user has earned two bronze badges and has been awarded a moderator badge, the user appears with their forum entry as follows:

   ![moderator](assets/moderator.png)

>[!NOTE]
>
>This example does not follow these best practices:
>
>* Scoring rule names should be globally unique; they should not end with the same name.
>
>  An example of what *not* to do:
>
>  /libs/settings/community/scoring/rules/site1/forums-scoring
>  /libs/settings/community/scoring/rules/site2/forums-scoring
>
>* Creating unique badge images for different AEM sites

### Access Scoring UGC {#access-scoring-ugc}

Use of the [APIs](#scoring-and-badging-apis) is preferred.

For investigative purposes, using JSRP for the example, the base folder containing scores is

* `/content/usergenerated/asi/jcr/scoring`

The child node of `scoring` is the scoring rule name. Thus, a best practice is that scoring rule names on a server be globally unique.

For the Geometrixx Engage site, the user, and their score, are in a path constructed with the scoring rule name, community site's site id ( `engage-ba81p`), a unique id, and the user's id :

* `.../scoring/forums-scoring/engage-ba81p/6d179715c0e93cb2b20886aa0434ca9b5a540401/riley`

For the Community Components guide site, the user, and their score, are in a path constructed with the scoring rule name, a default id ( `default-site`), a unique id, and the user's id :

* `.../scoring/forums-scoring/default-site/b27a17cb4910a9b69fe81fb1b492ba672d2c086e/riley`

The score is stored in the property `scoreValue_tl` which may only contain a value or indirectly refer to an atomicCounter.

![access-scoring-ugc](assets/access-scoring-ugc.png)

### Access Badging UGC {#access-badging-ugc}

Use of the [APIs](#scoring-and-badging-apis) is preferred.

For investigative purposes, using JSRP for the example, the base folder containing information about assigned or awarded badges is

* `/content/usergenerated/asi/jcr`

Followed by the path to the user's profile, ending in a badges folder, such as:

* `/home/users/community/w271OOup2Z4DjnOQrviv/profile/badges`

#### Awarded badge {#awarded-badge}

![awarded-badging-ugc](assets/access-badging-ugc.png)

#### Assigned badge {#assigned-badge}

![assigned-badge](assets/assigned-badge.png)

## Additional Information {#additional-information}

To display a sorted list of members based on points:

* [Leaderboard function](/help/communities/functions.md#leaderboard-function) for inclusion in a community site or group template.
* [Leaderboard component](/help/communities/enabling-leaderboard.md), the featured component of the Leaderboard function, for page authoring.
