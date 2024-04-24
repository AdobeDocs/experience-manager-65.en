---
title: Advanced Scoring and Badges
description: Learn how to set up advanced scoring so you can allow awarding of badges to identify members as experts.
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
docset: aem65
role: Admin
exl-id: d3bb6664-6c01-4bcf-840c-072fc491fc99
solution: Experience Manager
feature: Communities
---
# Advanced Scoring and Badges{#advanced-scoring-and-badges}

## Overview {#overview}

Advanced scoring allows awarding of badges to identify members as experts. Advanced scoring assigns points based on the quantity *and* quality of content created by a member, whereas basic scoring assigns points based on the quantity of content created.

This difference is due to the scoring engine used to calculate the scores. The basic scoring engine applies simple math. The advanced scoring engine is an adaptive algorithm that rewards active members who contribute valued and relevant content, deduced through natural language processing (NLP) of a topic.

In addition to content relevance, the scoring algorithms account for member activities, such as voting and percentage of answers. While basic scoring includes them quantitatively, advanced scoring uses them algorithmically.

Therefore, the advanced scoring engine requires enough data to make analysis meaningful. The achievement threshold for becoming an expert is constantly reevaluated as the algorithm continually adjusts to the volume and quality of content created. There is also a concept of *decay* of a member's older posts. If an expert member stops participating in the subject matter where they gained expert status, at some pre-determined point (see [scoring engine configuration](#configurable-scoring-engine)) they could lose their status as an expert.

Setting up advanced scoring is virtually the same as basic scoring:

* Basic and advanced scoring and badging rules are [applied to content](/help/communities/implementing-scoring.md#apply-rules-to-content) in the same manner.

    * Basic and advanced scoring and badging rules may be applied to the same content.

* [Enabling badges for components](/help/communities/implementing-scoring.md#enable-badges-for-component) is generic.

The differences in setting up the scoring and badging rules are:

* Configurable advanced scoring engine
* Advanced scoring rules:

    * `scoringType` set to `advanced`
    * Requires `stopwords`

* Advanced badging rules:

    * `badgingType` set to `advanced`
    * `badgingLevels` set to **number of expert levels to award**
    * Requires `badgingPaths` array of badges instead of thresholds array-mapping points to badges.

>[!NOTE]
>
>To use advanced scoring and badging capabilities, install the [Expert Identification package](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=%2Fcontent%2Fsoftware-distribution%2Fen%2Fdetails.html%2Fcontent%2Fdam%2Faem%2Fpublic%2Fadobe%2Fpackages%2Fcq610%2Fsocial%2Ffeaturepack%2Fcq-social-expert-identification-pkg).

## Configurable Scoring Engine {#configurable-scoring-engine}

The advanced scoring engine provides an OSGi configuration with parameters that affect the advanced scoring algorithm.

![advanced-scoring-engine](assets/advanced-scoring-engine.png)

* **Scoring weights**
  
  For a topic, specify the verb that should be given the highest priority when calculating the score. One or more topics may be entered, but limited to **one verb per topic**. See [Topics and Verbs](/help/communities/implementing-scoring.md#topics-and-verbs).
  Entered as `topic,verb` with the comma escaped. For example:
  `/social/forum/hbs/social/forum\,ADD`
  Default is set to the ADD verb for QnA and forum components.

* **Scoring range**
  
  The range for advanced scores is defined by this value (maximum score) and 0 (lowest possible score).
  
  Default value is 100 so that scoring range is 0-100.

* **Entity decay time interval**
  
  This parameter represents the number of hours after which all entity scores are decayed. This is required to no longer include old content in scores for a community site.
  
  Default value is 216000 hours (~24 years).

* **Scoring growth rate**
  This specifies the score between 0&ndash;scoring range, beyond which growth slows to limit the number of experts.
  
  Default value is 50.

## Advanced Scoring Rules {#advanced-scoring-rules}

In basic scoring, the quantity needed to earn a badge is known.

In advanced scoring, the quantity needed is constantly adjusting based on the amount of quality data within the system. The scoring is continually calculated in a manner similar to a bell curve.

If a member earned an expert badge on a topic which is no longer active, there is a possibility they will lose their badge due to decay over time.

### scoringType {#scoringtype}

A scoring rule is a set of scoring subrules, each of which declares the `scoringType`.

To invoke the advanced scoring engine, the `scoringType`should be set to `advanced`.

See [Scoring Sub-Rules](/help/communities/implementing-scoring.md#scoring-sub-rules).

![advanced-scoring-type](assets/advanced-scoring-type.png)

### Stopwords {#stopwords}

The advanced scoring package installs a configuration folder that contains a stopwords file:

* `/libs/settings/community/scoring/configuration/stopwords`

The advanced scoring algorithm uses the list of words contained in the stopwords file to identify common English words that are ignored during content processing.

There is no expectation that this file would be modified.

If the stopwords file is missing, the advanced scoring engine gives an error.

## Advanced Badging Rules {#advanced-badging-rules}

The advanced badging rule properties differ from the [basic badging rule properties](/help/communities/implementing-scoring.md#badging-rules).

Instead of associating points with a badge image, it is only necessary to identify the number of experts allowed and the badge image to award.

![advanced-badging-rules](assets/advanced-badging-rules.png)

<table>
 <tbody>
  <tr>
   <th>Property</th>
   <th>Type</th>
   <th>Value Description</th>
  </tr>
  <tr>
   <td>badgingPath</td>
   <td>String[]</td>
   <td><em>(Required)</em> A multi-value string of badge images up to the number of badgingLevels. The badge image paths must be ordered so the first is awarded to the highest expert. If there are fewer badges than indicated by badgingLevels, the last badge in the array fills out the rest of the array. Example entry:<br /> <code>/libs/settings/community/badging/images/expert-badge/jcr:content/expert.png</code></td>
  </tr>
  <tr>
   <td>badgingLevels</td>
   <td>Long</td>
   <td><em>(Optional)</em> Specifies the levels of expertise to be awarded. For example, if there should be an <code>expert </code>and an <code>almost expert</code> (two badges), then the value should be set to 2. The badgingLevel should correspond with the number of expert-related badge images listed for the badgingPath property. Default is 1.</td>
  </tr>
  <tr>
   <td>badgingType</td>
   <td>String</td>
   <td><em>(Required)</em> Identifies the scoring engine as either "basic" or "advanced". Set to "advanced" else the default is "basic".</td>
  </tr>
  <tr>
   <td>scoringRules</td>
   <td>String[]</td>
   <td><em>(Optional)</em> A multi-value string to restrict the badging rule to scoring events identified by one or more scoring rules listed.<br /> Example entry:<br /> <code>/libs/settings/community/scoring/rules/adv-comments-scoring</code><br /> Default is no restriction.</td>
  </tr>
 </tbody>
</table>

## Included Rules and Badge {#included-rules-and-badge}

### Included Badge {#included-badge}

Included in this beta release is one reward-based expert badge:

* `expert`
  
  `/libs/settings/community/badging/images/expert-badge/jcr:content/expert.png`

![expert-badge](assets/included-badge.png)

For the expert badge to appear as a reward for activity, make sure:

* `Badges` are enabled for the feature, such as a forum or QnA component.

* Advanced scoring and badging rules are applied to the page (or ancestor) on which the component is placed

See the basic information for:

* [Enabling badging for a component](/help/communities/implementing-scoring.md#enableforcomponent)
* [Applying rules](/help/communities/implementing-scoring.md#applytopage)

### Included Scoring Rules and Sub-Rules {#included-scoring-rules-and-sub-rules}

Included in the beta release are two advanced scoring rules for the [forum function](/help/communities/functions.md#forum-function) (one each for the forum and comments components of the forum feature):

1. `/libs/settings/community/scoring/rules/adv-comments-scoring`

   ```
   subRules[] =
   /libs/settings/community/scoring/rules/sub-rules/adv-comments-rule
   /libs/settings/community/scoring/rules/sub-rules/adv-voting-rule-owner
   /libs/settings/community/scoring/rules/sub-rules/adv-voting-rule
   ```

1. `/libs/settings/community/scoring/rules/adv-forums-scoring`

   ```
   subRules[] =
   /libs/settings/community/scoring/rules/sub-rules/adv-forums-rule
   /libs/settings/community/scoring/rules/sub-rules/adv-comments-rule
   /libs/settings/community/scoring/rules/sub-rules/adv-voting-rule-owner
   ```

**Notes:**

* Both `rules` and `sub-rules` nodes are of type `cq:Page`.
* `subRules` is an attribute of type String`[]` on the rule's `jcr:content` node.
* `sub-rules` may be shared among various scoring rules.
* `rules` should be in a repository location with read permission for everyone.
* Rule names must be unique regardless of location.

### Included Badging Rules {#included-badging-rules}

Included in the release are two advanced badging rules that correspond to the [advanced forums and comments scoring rules](#included-scoring-rules-and-sub-rules).

* `/libs/settings/community/badging/rules/adv-comments-badging`
* `/libs/settings/community/badging/rules/adv-forums-badging`

**Notes:**

* `rules` nodes are of type cq:Page.
* `rules` should be in a repository location with read permission for everyone.
* Rule names must be unique regardless of location.
