---
title: Creating an Assets Folder Headless Quick Start Guide
description: Use AEM Content Fragment Models to define the structure of Content Fragments, the basis of your headless content.
exl-id: 8d913056-fcfa-4cdd-b40a-771f13dfd0f4
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
# Creating an Assets Folder Headless Quick Start Guide {#creating-an-assets-folder}

Use AEM Content Fragment Models to define the structure of Content Fragments, the basis of your headless content. Content Fragments are then stored in assets folders.

## What is an Assets Folder? {#what-is-an-assets-folder}

[Now that you have created Content Fragment Models](create-content-model.md) that define the structure that you want for your future Content Fragments, you are probably excited to create some fragments.

However you will first need to create an assets folder where you will store them.

Assets folders are used to [organize traditional content assets](/help/assets/manage-assets.md) like images and video and Content Fragments.

## How to Create an Assets Folder {#how-to-create-an-assets-folder}

An administrator would only need to create folders occasionally to organize content as it is created. For the purposes of this getting started guide, we only need to create one folder.

1. Log into AEM and from the main menu select **Navigation > Assets > Files**.
1. Click **Create > Folder**.
1. Provide a **Title** and a **Name** for your folder.
   * The **Title** should be descriptive.
   * The **Name** will become the node name in the repository.
      * It will be automatically generated based on the title and adjusted according to [AEM naming conventions.](/help/sites-developing/naming-conventions.md)
      * It can be adjusted if necessary.

   ![Create folder](assets/assets-folder-create.png)
1. Select the folder you created and then select **Properties** from the toolbar (or use the `p` [keyboard shortcut.](/help/sites-authoring/keyboard-shortcuts.md))
1. In the **Properties** window, select the **Cloud Services** tab.
1. For the **Cloud Configuration** Select the [configuration you created previously.](create-configuration.md)
   ![Configure assets folder](assets/assets-folder-configure.png)
1. Click **Save &amp; Close**.
1. Click **OK** in the confirmation window.

   ![Confirmation window](assets/assets-folder-confirmation.png)

You can create additional subfolders within the folder you created. The subfolders will inherit the **Cloud Configuration** of the parent folder. This can be overridden however if you wish to use models from another configuration.

If you are using a localized site structure, you can [create a language root](/help/assets/multilingual-assets.md) below your new folder.

## Next Steps {#next-steps}

Now that you have created a folder for your Content Fragments, you can move on to the fourth part of the getting started guide and [create content fragments.](create-content-fragment.md)

>[!TIP]
>
>For complete details about managing Content Fragments, see the [Content Fragments documentation](/help/assets/content-fragments/content-fragments.md)
