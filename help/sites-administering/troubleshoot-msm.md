---
title: Troubleshooting MSM Issues and FAQ
description: Find out how to troubleshoot the most common MSM-related issues and get answers the most common MSM-related questions.
feature: Multi Site Manager
role: Admin
exl-id: 23f3391b-5ce3-48e1-ab27-a37737778089
---
# Troubleshooting MSM Issues and FAQ {#troubleshooting-msm}

## Troubleshooting First Steps {#first-steps}

If you are experiencing what you think is incorrect behavior or an error in MSM, before beginning and detailed troubleshooting be sure to:

* Check the [MSM FAQ](#faq) as your problems or questions may already be addressed there.
* Check the [MSM best practices article](msm-best-practices.md) as a number of tips are offered there along with clarifications of a number of misconceptions.

## Finding advanced information about your blueprint and Live Copy status {#advanced-info}

MSM registers several servlets that can be requested with selectors on the resource URLs. These are used by the UI but can also be requested directly to see directly additional advanced computed MSM statuses for your pages:

1. `http://<host>:<port>/content/path/to/bluprint/page.blueprint.json?&maxSize=500&advancedStatus=true&returnRelationships=true&msm%3Atrigger=ROLLOUT`
   * Use this on a blueprint page to retrieve the list of all Live Copies linked to it, with additional Live Copy status information.
   * for example:
     `http://localhost:4502/content/wknd/language-masters/en.blueprint.json?&maxSize=500&advancedStatus=true&returnRelationships=true&msm%3Atrigger=ROLLOUT`


1. `http://<host>:<port>/content/path/to/livecopy/page.msm.json`
   * Use this on Live Copy pages to retrieve advanced information on their connection with their blueprint pages. If the page is not a Live Copy, nothing is returned.
   * for example:
     `http://localhost:4502/content/wknd/ca/en.msm.json`

Those servlets generate DEBUG Log messages through the `com.day.cq.wcm.msm` logger that can also be helpful.

## Checking MSM-specific information in the repository {#checking-repo}

The prior servlets returned computed information based on the MSM-specific nodes and mixins. The information is stored in the repository in the following way.

* `cq:LiveSync` mixin type
  * This is set on `jcr:content` nodes and define root Live Copy pages.
  * Those pages will have a `cq:LiveSyncConfig` child node of type `cq:LiveCopy` that will contain basic and mandatory information on the Live Copy through the following properties:
    * `cq:master` points to the blueprint page of the Live Copy.
    * `cq:rolloutConfigs` indicates active rollout configurations applied to the Live Copy.
    * `cq:isDeep` is true if the child pages of this root Live Copy page are included in the Live Copy.
* `cq:LiveRelationship` mixin type
  * Any Live Copy page has such a mixin type on its `jcr:content` node.
  * If it does not, the page at some point has been detached or manually created via the authoring interface outside of a Live Copy action (create or rollout).
* `cq:LiveSyncCancelled` mixin type
  * Added to `jcr:content` nodes of Live Copy pages that were suspended.
  * If the suspension is effective for child pages as well, a `cq:isCancelledForChildren` property is set to true on the same node.

The information present in these properties should be reflected in the UI, however when troubleshooting it may be helpful to observe MSM behavior directly in the repository as MSM actions occur.

Knowing those properties can be also useful in order to query your repository and find out sets of pages that are in particular states. For example:

* `select * from cq:LiveSync` returns all Live Copy root pages.

## FAQ {#faq}

Here are some frequently-asked questions related to MSM and Live Copy.

### Why are some properties (e.g. title, annotations) are not updated during an MSM rollout? {#missing-properties}

MSM sync actions are highly configurable. Which properties or components are modified during rollouts directly depends on properties of those configurations.

Please see [this article](msm-best-practices.md) for more information on this topic.

### How can I remove rollout permissions for a group of authors? {#remove-rollout-permissions}

There is no **rollout** privilege that can be set or removed for AEM principals (users or groups).

As an alternative you can either:

* Customization the product UI to hide the Rollout actions for a given principal.
* Remove write privileges from the Live Copy tree for authors who are not allowed to roll-out.

### Why do I see Live Copy pages with the suffix "_msm_moved"? {#moved-pages}

If a blueprint page is rolled out, it will either update its Live Copy page or create a new Live Copy page if it didn't exist yet (e.g. when it is rolled out for the first time or the Live Copy page was manually deleted).

In this latter case however, if a page without a `cq:LiveRelationship` property exists with the same name, this page will be renamed accordingly, before the Live Copy page is created.

By default, the rollout expects either a linked Live Copy page, to which the updates of the blueprints will be rolled out, or no page at, when a Live Copy page is created.

If a "standalone" page is found, MSM chooses to rename this page, and create a separate, linked Live Copy page.

Such a standalone page in a Live Copy sub-tree is typically the result of a **Detach** operation, or the former Live Copy page was manually deleted by an author and then re-created with the same name.

To avoid this use the Live Copy **Suspend** feature instead of **Detach**. More details on the **Detach** action in [this article.](msm-livecopy.md)
