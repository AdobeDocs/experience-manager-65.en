---
title: MSM Best Practices
description: Find best practices compiled by Adobe engineering and consulting teams to help get up and running with the AEM Multi Site Manager.
topic-tags: site-features, best-practices
feature: Multi Site Manager
exl-id: 3fedc1ba-64f5-4fbe-9ee5-9b96b75dda58
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# MSM Best Practices{#msm-best-practices}

## General {#general}

MSM is a configurable framework for automating content deployment. Implementations often involve major portions of a website and span organizations and geographies. It is therefore highly recommended to plan MSM implementations as carefully as you plan your website:

* Carefully **plan structure and content flows** before starting implementation.
* **Keep the amount of live copies to a minimum.** Processing live copies is a resource-intensive task. The more live copies exist in your system the more performance can be affected: from processing internal live copy indexes, over live copy operations such as rollouts, to UI operations such as showing live copy relationships in the Sites Admin references rail. Best practice is to create live copies of sites or branches of a site, where the live copy relationships are inherited to pages in the site or branch. Avoid creating individual live copies for pages in a site or branch when the entire structure can be made into a live copy.
* **Customize as much as necessary, but as little as possible.** While MSM supports a high degree of customization (for example, rollout configurations) typically the best practice for the performance, reliability and upgradeability of your website is to minimize customization.
* Establish a **governance** model early, and train users accordingly, to ensure success. A best practice from a governance point of view is to **minimize the authority that local content producers have** to allocate/connect content to other local users and their respective live copies. This is because un-governed, chained inheritances can significantly increase the complexity of a MSM structure and compromise its performance and reliability.

* Once a plan exists for your structure, content flows, automation and governance - **prototype and thoroughly test your system**, before starting live implementation.
* Keep in mind that **Adobe Consulting and leading System Integrators** have deep experience planning and implementing content automation with MSM, so they can help you both get started with your MSM project and throughout its entire implementation.

>[!NOTE]
>
>Further information about working with MSM is available in the Knowledge Base articles:
>
>* [Troubleshooting MSM Issues and FAQ](troubleshoot-msm.md)
>

>[!NOTE]
>
>You can also use the [Reference component](/help/sites-authoring/default-components-foundation.md#reference) to reuse a single page or paragraph. Keep in mind however:
>
>* MSM is more flexible and allows fine-grained control over what content is synchronized and when.
>* [Core components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/introduction.html) are now recommended over the foundation components.
>

## Live Copy Sources and Blueprint Configurations {#live-copy-sources-and-blueprint-configurations}

Keep in mind that a live copy can be created using either [regular pages](/help/sites-administering/msm-livecopy.md#creating-a-live-copy-of-a-page) or a [blueprint configuration](/help/sites-administering/msm-livecopy.md#creating-a-live-copy-of-a-site-from-a-blueprint-configuration). Both are valid use cases.

The additional benefits of using a blueprint configuration are that they:

* Allow the author to use the **Rollout** option on a blueprint - to (explicitly) push modifications to live copies that inherit from this blueprint.
* Allow the author to use **Create Site**; this allows the user to easily select languages and configure the structure of the live copy.
* Define a default rollout configuration for live copies that have a relationship with the blueprint.

In the case that a blueprint configuration is not referenced, rollouts can only be initiated from the live copies themselves, essentially pulling content from source.

When creating a site with live copy, it is advantageous to create blueprint configurations to ensure the availability of the full MSM feature set.

>[!NOTE]
>
>Note that CUGs in the Permissions tab cannot be rolled out to Live Copies from Blueprints. Plan around this when configuring Live Copy.

## Components and Container Synchronization {#components-and-container-synchronization}

In general, the rollout rule in MSM regarding the synchronization of components is:

* Components are rolled out syncing any resources contained in the blueprint.
* Containers synchronize only the current resource.

This means that components are treated as an aggregate, and in a rollout the component itself and all its children are replaced with those in the blueprints. This means that if a resource is added to such a component locally, it will be lost to the content of the blueprint at rollout.

To support the nesting of components such that locally added components are maintained in a rollout, the component must be declared as a container. As an example, the default parsys is declared as a container so it can support locally-added content.

>[!NOTE]
>
>Add the property `cq:isContainer` to the component to designate it as a container.

## Create Site {#create-site}

Notice that AEM has two main approaches for creating live copies:

* When [creating a Live Copy](/help/sites-administering/msm-livecopy.md#creating-a-live-copy-of-a-page)

  This can be considered as the more generic approach, allowing you to create live copies from any page. The content structure of a live copy exactly matches the source.

* When [creating a Site](/help/sites-administering/msm-livecopy.md#creating-a-live-copy-of-a-site-from-a-blueprint-configuration)

  This is a more specialized approach, primarily for creating websites with a multilingual structure.

Following are a few considerations to keep in mind when creating a site:

* To create a site, you need a [blueprint configuration](/help/sites-administering/msm-livecopy.md#managing-blueprint-configurations).
* To allow the selection of language paths to create in a new site, the corresponding language roots must exist in the blueprint (source).
* Once a [new site has been created as a live copy](/help/sites-administering/msm-livecopy.md#creating-a-live-copy-of-a-site-from-a-blueprint-configuration) (using **Create**, then **Site**), the first two levels of this live copy are *shallow*. Children of the page do not belong to the live-relationship, but a roll-out will still descend if a live-relationship that matches the trigger is found.

  It helps avoid:

    * manually adding languages in the blueprint (below the first level)
    * manually adding content directly below the language root,
    * does not result in automatically carrying this new content over to the live copy on rollout.

## MSM and Multilingual Websites {#msm-and-multilingual-websites}

MSM can assist in the creation of multilingual websites in two ways:

* When creating language masters.

    * While MSM itself **does not provide content translation**, it can be integrated with third-party translation connectors that do. Note that:

        * MSM lets you cancel inheritance at the page- and/or component- level. This helps prevent overwriting translated content (from a live copy, with not-yet-translated content from a blueprint) on the next rollout.
        * Some third-party translation connectors automate this management of MSM inheritances.

          Check with your translation service provider for more information.

        * An alternative approach for creating and translating language masters is to use language copies in conjunction with AEM's out-of-the-box translation integration framework.

* When rolling out content from language masters.

    * For example, from the French language master to country-specific sites, such as France/French, Canada/French, Switzerland/French.

For more information see [Translating Content for Multilingual Sites](/help/sites-administering/translation.md) and the [Translation Best Practices](/help/sites-administering/tc-bp.md).

## Structure Changes and Rollouts {#structure-changes-and-rollouts}

Modifications to the content structure in a blueprint/source tree are reflected differently in a live copy. This is dependent on the modification type:

* **Creating** new pages in a blueprint will result in corresponding pages being created in live copies after rollout with the standard rollout configuration.

* **Deleting** pages in a blueprint will result in corresponding pages being deleted from live copies after rollout with standard rollout configuration.

* **Moving** pages in a blueprint will **not** result in corresponding pages being moved in live copies after rollout with standard rollout configuration:

    * The reason for this behavior is that a page move implicitly includes a page delete. This could potentially lead to unexpected behavior on publish, as deleting pages on author automatically deactivates corresponding content on publish. This can also have a knock-on effect on related items such as links, bookmarks, and others.
    * Content inheritance in the respective live copy pages is updated to reflect the new location of their sources in the blueprint.
    * To fully realize a page move from a blueprint to live copies, consider the following best practices:

>[!NOTE]
>
>This will work only with the [On Rollout trigger](/help/sites-administering/msm-sync.md#rollout-triggers).

* Create a custom rollout configuration:

    * This new configuration must include the action:

      `PageMoveAction`

      Do not add other actions to this configuration.

* Position the new configuration:

    * To fully roll out the page move, while deleting respective pages at their old location in the live copy:

        * Position the newly created configuration before the standard rollout configuration.

          The standard rollout configuration will take care of deleting the pages in their old location.

    * To roll out the page move while keeping respective pages in their old location in the live copies (essentially duplicating the content):

        * Position the newly created configuration after the standard rollout configuration.

          This will ensure no content is deleted in the live copy or deactivated from publish.

## Customizing Rollouts {#customizing-rollouts}

MSM rollout configurations are highly customizable. Automating rollouts can have far reaching consequences. As a best practice, you should plan *very* carefully before, for example:

* automating rollouts; for example, with [onModify triggers](#onmodify),
* customizing [node types/properties](#node-types-properties),
* starting subsequent workflows,
* and/or activating content as part of rollouts.

### onModify {#onmodify}

When using the [rollout trigger](/help/sites-administering/msm-sync.md#rollout-triggers) `onModify` you should consider that:

* Automating rollouts with `onModify` triggers may have a negative impact on authoring performance as they trigger rollouts after *every* page modification.

* The rollout result may differ from the one expected as:

    * You cannot specify the order of the resulting modify events.
    * The event-based architecture cannot guarantee the sequence of the events passed to the Rollout Manager.

* Using such a rollout configuration could lead to commit conflicts if concurrent updates of the same resource occur.

Therefore, it is recommended that you *only* use `onModify` triggers if the benefits of automatic rollout initiation outweigh any potential performance issues.

### Node Types/Properties {#node-types-properties}

Remember that:

* In addition to customizing rollout actions, MSM also lets you customize node properties that are being rolled out. The [MSM OSGi configuration lets you exclude node types](/help/sites-administering/msm-sync.md#excluding-properties-and-node-types-from-synchronization) from being copied from the source to the live copy.

## Further Information {#further-information}

This and the following pages cover the related issues:

* [Creating and Synchronizing Live Copies](/help/sites-administering/msm-livecopy.md)
* [Live Copy Overview Console](/help/sites-administering/msm-livecopy-overview.md)
* [Configuring Live Copy Synchronization](/help/sites-administering/msm-sync.md)
* [MSM Rollout Conflicts](/help/sites-administering/msm-rollout-conflicts.md)
