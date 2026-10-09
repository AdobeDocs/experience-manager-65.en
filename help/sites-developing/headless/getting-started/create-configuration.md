---
title: Creating a Configuration Headless Quick Start Guide
description: Create a configuration as a first step to getting started with headless in AEM 6.5.
exl-id: f1df97a1-164f-4ed4-bb63-34caf35ae27c
solution: Experience Manager, Experience Manager Sites
feature: Headless,Content Fragments,GraphQL,Persisted Queries,Developing
role: Admin,Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: bfd4bc52-c397-5127-8f86-8953ba9fc0a3
    internal-label: Headless
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
  - id: a642c50e-80eb-4fc1-a5d2-f3762d1f841d
    internal-label: Administration
  - id: d429a63e-ade4-4117-b04e-9b996d1c94ef
    internal-label: Integrations
  - id: c124fa01-25c5-42ec-adf6-21d1c114058b
    internal-label: Developer tools
subfeature_v2:
  - id: e9db7c79-8f65-4281-a439-c9049296d903
    internal-label: Content Fragments
  - id: a02b73a7-bdfc-4225-bdfd-69f7891ab55e
    internal-label: GraphQL
  - id: d781bc8f-52af-43f6-84d0-b73e59a130d5
    internal-label: Persisted queries
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
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

1. Log into AEM and from the main menu select **Tools > General > Configuration Browser**.
1. Provide a **Title** for your configuration.
   * A name will be automatically generated based on the title and adjusted according to [AEM naming conventions.](/help/sites-developing/naming-conventions.md). It will become the node name in the repository.
1. Check the following options:
   * **Content Fragment Models**
   * **GraphQL Persistent Queries**

   ![Create Configuration](assets/create-configuration.png)

1. Click **Create**

You can create multiple configurations if necessary. Configurations can also be nested.

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
