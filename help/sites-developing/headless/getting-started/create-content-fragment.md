---
title: Creating Content Fragments Headless Quick Start Guide
description: Learn how to use AEM's Content Fragments to design, create, curate, and use page-independent content for headless delivery.
exl-id: 5787204d-bcce-447e-b98c-2bc1c0d744c3
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
# Creating Content Fragments Headless Quick Start Guide {#creating-content-fragments}

Learn how to use AEM's Content Fragments to design, create, curate, and use page-independent content for headless delivery.

## What are Content Fragments? {#what-are-content-fragments}

[Now that you have created an assets folder](create-assets-folder.md) where you can store your Content Fragments, you can now create the fragments!

Content Fragments let you design, create, curate, and publish page-independent content. They let you prepare content ready for use in multiple locations and over multiple channels.

Content fragments contain structured content and can be delivered in JSON format.

## How to Create a Content Fragment {#how-to-create-a-content-fragment}

Content authors will create any number of Content Fragments to represent the content that they create. This will be their main task in AEM. For the purposes of this getting started guide, we will only need to create one.

1. Log into AEM and from the main menu select **Navigation > Assets**.
1. Navigate to the [folder you created previously.](create-assets-folder.md)
1. Click **Create > Content Fragment**.
1. The creation of a Content Fragment is presented as a wizard in two steps. First select which model you wish to use to create your content fragment and click **Next**.
   * The models available depend on the [**Cloud Configuration** you defined for the assets folder](create-assets-folder.md) in which you are creating the Content Fragment.
   * If you receive the message `We could not find any models`, check the configuration of your assets folder.

   ![Select Content Fragment Model](assets/content-fragment-model-select.png)
1. Provide a **Title**, **Description**, and **Tags** as necessary and click **Create**.

   ![Create Content Fragment](assets/content-fragment-create.png)
1. Click **Open** in the confirmation window.

   ![Content Fragment created confirmation](assets/content-fragment-confirmation.png)
1. Provide the details of the Content Fragment in the Content Fragment Editor.

   ![Content Fragment Editor](assets/content-fragment-edit.png)
1. Click **Save** or  **Save & close**.

Content Fragments can reference other Content Fragments, allowing for a nested content structure if necessary.

Content Fragments can also reference other assets in AEM. [These assets need to be stored in AEM](/help/assets/manage-assets.md) before creating a referencing Content Fragment.

## Next Steps {#next-steps}

Now that you have created a Content Fragment, you can move on to the final part of the getting started guide and [create API requests to access and deliver content fragments.](create-api-request.md)

>[!TIP]
>
>For complete details about managing Content Fragments, see the [Content Fragments documentation](/help/assets/content-fragments/content-fragments.md)
