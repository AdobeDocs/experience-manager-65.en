---
title: Creating a Configuration Headless Quick Start Guide
description: Create a configuration as a first step to getting started with headless in AEM 6.5.
exl-id: f1df97a1-164f-4ed4-bb63-34caf35ae27c
---
# Creating a Configuration Headless Quick Start Guide {#creating-configuration}

As a first step to getting started with headless in AEM 6.5, you need to create a configuration.

## What is a Configuration? {#what-is-a-configuration}

The Configuration Browser provides a generic configuration API, content structure, resolution mechanism for configurations in AEM.

In the context of headless content management in AEM, think of a configuration as a workplace within AEM where you can create your Content Models, which define the structure of your future content and Content Fragments. You can have multiple configurations to separate these models.

>[!NOTE]
>
>If you are familiar with [page templates in a full-stack AEM implementation,](/help/sites-authoring/templates.md) the usage of configurations for the management of Content Models is similar.

## How to Create a Configuration {#how-to-create-a-configuration}

An administrator would only need to create a configuration once, or very seldomly when a new workspace is required for organizing your Content Models. For the purposes of this getting started guide, we only need to create one configuration.

1. Log into AEM and from the main menu select **Tools -&gt; General -&gt; Configuration Browser**.
1. Provide a **Title** for your configuration.
   * A name will be automatically generated based on the title and adjusted according to [AEM naming conventions.](/help/sites-developing/naming-conventions.md). It will become the node name in the repository.
1. Check the following options:
   * **Content Fragment Models**
   * **GraphQL Persistent Queries**

   ![Create Configuration](assets/create-configuration.png)

1. Tap or click **Create**

You can create multiple configurations if required. Configurations can also be nested.

>[!NOTE]
>
>Configuration options in addition to **Content Fragment Models** and **GraphQL Persistent Queries** may be necessary depending on your implementation requirements.

## Next Steps {#next-steps}

Using this configuration, you can now move on to the second part of the getting started guide and [create Content Fragment Models.](create-content-model.md)

<!--
>[!TIP]
>
>For complete details about the Configuration Browser, [see the Configuration Browser documentation.](/help/sites-developing/configurations.md)
-->
