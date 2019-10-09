---
title: Managing Content Fragments
seo-title: Managing Content Fragments
description: Content Fragments are stored as Assets, so are primarily managed from the Assets console.
seo-description: Content Fragments are stored as Assets, so are primarily managed from the Assets console.
uuid: 0659cf03-b4e8-4b8b-bec7-0082f980115a
contentOwner: Alison Heimoz
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: content-fragments
content-type: reference
discoiquuid: da8f968b-91cc-45a8-ae4b-757b4f840b8e
---

# Managing Content Fragments {#managing-content-fragments}

>[!CAUTION]
>
>Some Content Fragment functionality requires the application of [AEM 6.4 Service Pack 2 (6.4.2.0) or later](/help/release-notes/sp-release-notes.md).

Content Fragments are stored as **[!UICONTROL Assets]**, so are primarily managed from the **[!UICONTROL Assets]** console.

>[!NOTE]
>
>Content fragments are then used with authoring pages; see [Page Authoring with Content Fragments](/help/sites-authoring/content-fragments.md).

## Creating Content Fragments {#creating-content-fragments}

### Creating a Content Model {#creating-a-content-model}

[Content fragment models](content-fragments-models.md) can be enabled and created, prior to creating content fragments with structured content.

>[!NOTE]
>
>See [Developing Content Fragments](/help/sites-developing/customizing-content-fragments.md) for further information on templates; used for simple content fragments.

### Creating a Content Fragment {#creating-a-content-fragment}

The method of creating a content fragment is (basically) the same for both simple and structured fragments:

1. Navigate to the **[!UICONTROL Assets]** folder where you want to create the fragment.
1. Select **[!UICONTROL Create]**, then **[!UICONTROL Content Fragment]** to open the wizard.
1. The first step of the wizard requires you to specify the basis of the new fragment.

    * This can be a:

        * [Template](/help/sites-developing/content-fragment-templates.md) - for example **[!UICONTROL Simple Fragment]**
        * [Model](content-fragments-models.md) - used to create a fragment that requires structured content; for example the **Airport** model

    * All available templates and models are displayed.

   After selection, use **[!UICONTROL Next]** to proceed.

   ![cfm-6420-15](assets/cfm-6420-15.png)

1. In the **[!UICONTROL Properties]** step specify:

    * **[!UICONTROL Basic]**

        * **[!UICONTROL Title]**

          The fragment title. 

          Mandatory.  

        * **[!UICONTROL Description]**
        * **[!UICONTROL Tags]**

    * **[!UICONTROL Advanced]**

        * **[!UICONTROL Name]**

          The name; will be used to form the URL. 

          Mandatory; will be automatically derived from the title, but can be updated.

1. Select **[!UICONTROL Create]** to complete the action, then either **[!UICONTROL Open]** the fragment for editing or return to the console with **[!UICONTROL Done]**.

## Actions for a Content Fragment {#actions-for-a-content-fragment}

In the **[!UICONTROL Assets]** console a range of actions are available for your content fragments, either:

* From the toolbar; after selection of your fragment all appropriate actions are available.
* As [quick actions](/help/sites-authoring/basic-handling.md#quick-actions); a subset of actions available for the individual fragment cards.

![cfm-6420-17](assets/cfm-6420-17.png)

Select the fragment to reveal the toolbar with applicable actions:

* **[!UICONTROL Download]**

  * Save the fragment as a ZIP file; you can define whether to include Elements, Variations, Metadata.

* **[!UICONTROL Create]**
* **[!UICONTROL Checkout]**
* **[!UICONTROL Properties]**

  * Allows you to view and/or edit the fragment's metadata.

* **[!UICONTROL Edit]**

  * Allows you to [open the fragment for editing content](content-fragments-variations.md) together with its elements, variations, associated content and metadata.

* **[!UICONTROL Manage Tags]**
* **[!UICONTROL To Collection]**

  * Add the fragment to a collection.
  * This can also be done when [associating a collection with the fragment](content-fragments-assoc-content.md#adding-associated-content).

* **[!UICONTROL Copy/Paste]**
* **[!UICONTROL Move]**
* **[!UICONTROL Quick Publish]**
* **[!UICONTROL Manage Publication]**
* **[!UICONTROL Delete]**

>[!NOTE]
>
>Many of these are [standard actions for Assets](managing-assets-touch-ui.md) and/or the [desktop app](https://helpx.adobe.com/experience-manager/desktop-app/aem-desktop-app.html).

## Opening the Fragment Editor {#opening-the-fragment-editor}

To open your fragment for editing:

>[!CAUTION]
>
>To edit a content fragment you need [the appropriate permissions](/help/sites-developing/customizing-content-fragments.md#asset-permissions). Please contact your system administrator if you are experiencing issues.

1. Use the **[!UICONTROL Assets]** console to navigate to the location of your content fragment.
1. Open the fragment for editing, by either:

    * Clicking/tapping on the fragment or fragment link (this is dependent on the console view).
    * Selecting the fragment, then **[!UICONTROL Edit]** from the toolbar.

   The fragment editor will open:

   ![cfm-6420-18](assets/cfm-6420-18.png)

   >[!NOTE]
   >
   >1. A message will be shown when the fragment is already referenced on a content page.
   >
   >2. The side panel can be hidden/shown using the **[!UICONTROL Toggle Side Panel]** icon.

1. Navigate through the three modes using the icons in the side panel:

    * Variations: [Editing the content](#editing-the-content-of-your-fragment) and [Managing your Variations](#creating-and-managing-variations-within-your-fragment)
    * [Annotations](content-fragments-variations.md#annotating-a-content-fragment)
    * [Associated Content](#associating-content-with-your-fragment)
    * [Metadata](#viewing-and-editing-the-metadata-properties-of-your-fragment)

   ![cfm-10](assets/cfm-10.png)

1. After making changes, use **[!UICONTROL Save]** or **[!UICONTROL Cancel]** as required.

   >[!NOTE]
   >
   >Both **[!UICONTROL Save]** and **[!UICONTROL Cancel]** will exit the editor - see [Save, Cancel and Versions](#save-cancel-and-versions) for full information on how both options operate for content fragments.

## Save, Cancel and Versions {#save-cancel-and-versions}

>[!NOTE]
>
>Versions can also be [created, compared and reverted from the Timeline](https://helpx.adobe.com/experience-manager/6-3/assets/using/content-fragments-managing.html#timeline-for-content-fragments).

The editor has two options:

* **[!UICONTROL Save]**

  Will save the latest changes and exit the editor.

  >[!CAUTION]
  >
  >To edit a content fragment you need [the appropriate permissions](/help/sites-developing/customizing-content-fragments.md#asset-permissions). Please contact your system administrator if you are experiencing issues.

  >[!NOTE]
  >
  >It is possible to remain in the editor, making a series of changes, before selecting **[!UICONTROL Save]**.

  >[!CAUTION]
  >
  >In addition to simply saving your changes, **[!UICONTROL Save]** also updates any references and ensures that the dispatcher is flushed as required. These changes can take time to process. Due to this, there can be a performance impact on a large/complex/heavily-loaded system.
  >
  >
  >Please bear this in mind when using **[!UICONTROL Save]** and then quickly re-entering the fragment editor to make and save further changes.

* **[!UICONTROL Cancel]**

  Will exit the editor without saving the latest changes.

While editing your content fragment AEM automatically creates versions to ensure that prior content can be restored if you **[!UICONTROL Cancel]** your changes:

1. When a content fragment is opened for editing AEM checks for the existence of the cookie-based token that indicates whether an *editing session* exists:

    1. If the token is found, the fragment is considered to be part of the existing editing session.
    1. If the token is *not* available and the user starts editing content, a version is created and a token for this new editing session is sent to the client, where it is saved in a cookie.

1. While there is an *active* editing session, the content being edited is automatically saved every 600 seconds (default).

   >[!NOTE]
   >
   >The auto save interval is configurable using the `/conf` mechanism.
   >
   >Default value, see:
   >
   >`/libs/settings/dam/cfm/jcr:content/autoSaveInterval`

1. If the user selects to **[!UICONTROL Cancel]** the edit, the version created at the start of the editing session is restored and the token is removed to end the editing session.
1. If the user selects to **[!UICONTROL Save]** the edits, the updated elements/variations are persisted and the token is removed to end the editing session.

## Editing the Content of your Fragment {#editing-the-content-of-your-fragment}

Once you have opened your fragment, you can use the [Variations](content-fragments-variations.md) tab to author your content.

## Creating and Managing Variations within your Fragment {#creating-and-managing-variations-within-your-fragment}

Once you have created the Master content, you can create, and manage, [Variations](content-fragments-variations.md) of that content.

## Associating Content with your Fragment {#associating-content-with-your-fragment}

You can also [associate content](content-fragments-assoc-content.md) with a fragment. This provides a connection so that assets (i.e. images) can be (optionally) used with the fragment when it is added to a content page.

## Viewing and Editing the Metadata (Properties) of your Fragment {#viewing-and-editing-the-metadata-properties-of-your-fragment}

You can view, and edit, the properties of a fragment using the [!UICONTROL Metadata](content-fragments-metadata.md) tab.

## Timeline for Content Fragments {#timeline-for-content-fragments}

In addition to the standard options, [Timeline](managing-assets-touch-ui.md#timeline) provides both information and actions specific to content fragments:

* View information about versions, comments, and annotations
* Actions for Versions

    * **[!UICONTROL Revert to this Version](#reverting-to-a-version)** (select an existing fragment, then a specific version)
    * **[!UICONTROL Compare to Current](#comparing-fragment-versions)** (select an existing fragment, then a specific version)
    * Add a **[!UICONTROL Label]** and/or **[!UICONTROL Comment]** (select an existing fragment, then a specific version)
    * **[!UICONTROL Save as Version]** (select an existing fragment, then the up arrow at the bottom of Timeline)

* Actions for Annotations

    * **[!UICONTROL Delete]**

>[!NOTE]
>
>Comments are:
>
>* Standard functionality for all assets
>* Made in Timeline
>* Related to the fragment asset
>
>Annotations (for Content Fragments) are: 
>
>* Entered in the fragment editor
>* Specific to a selected segment of text within the fragment

For example:

![cfm-6420-19](assets/cfm-6420-19.png) 

## Comparing Fragment Versions {#comparing-fragment-versions}

The **[!UICONTROL Compare to Current]** action is available from the [!UICONTROL Timeline](https://helpx.adobe.com/experience-manager/6-3/assets/using/content-fragments-managing.html#timeline-for-content-fragments) after you have selected a specific version.

This will open:

* the **[!UICONTROL Current]** (latest) version (left)  

* the selected version **v&lt;*x.y*&gt;** (right)

They will be shown side-by-side, where:

* Any differences are highlighted

    * Deleted text - red
    * Inserted text - green
    * Replaced text - blue

* The full-screen icon allows you to open either version on its own; then toggle back to the parallel view
* You can **[!UICONTROL Revert]** to the specific version
* **[!UICONTROL Done]** will return you to the console

>[!NOTE]
>
>You cannot edit the fragment content when comparing fragments.

![cfm-6420-20](assets/cfm-6420-20.png) 

## Reverting to a Version  {#reverting-to-a-version}

You can revert to a specific version of your fragment:

* Directly from the [!UICONTROL Timeline](content-fragments-managing.md#timeline-for-content-fragments).

  Select the required version, then the **[!UICONTROL Revert to this Version]** action.

* While [comparing a version to the current version](content-fragments-managing.md#comparing-fragment-versions) you can **[!UICONTROL Revert]** to the selected version.

## Publishing and Referencing a Fragment {#publishing-and-referencing-a-fragment}

>[!CAUTION]
>
>If your fragment is based on a model, then you should ensure that the [model has been published](content-fragments-models.md#publishing-a-content-fragment-model).
>
>If you publish a content fragment for which the model has not yet been published, a selection list will indicate this and the model will be published with the fragment.

Content Fragments must be published for use in the publish enviroment. They can be published:

* After creation; from the **[!UICONTROL Assets]** console.
* When you [publish a page that uses the fragment](/help/sites-authoring/content-fragments.md#publishing); the fragment will be listed in the page references.

>[!CAUTION]
>
>After a fragment has been published and/or referenced, AEM will display a warning when an author opens the fragment for editing again. This is to warn that changes to the fragment will affect the referenced pages as well.

## Deleting a Fragment {#deleting-a-fragment}

To delete a fragment:

1. In the **[!UICONTROL Assets]** console navigate to the location of the content fragment.
1. Select the fragment.

   >[!NOTE]
   >
   >The **[!UICONTROL Delete]** action is not available as a quick action.

1. Select **[!UICONTROL Delete]** from the toolbar.
1. Confirm the **[!UICONTROL Delete]** action.

   >[!CAUTION]
   >
   >If the fragment is already referenced in a page you will then see a warning message and be required to confirm that you want to proceed with a **[!UICONTROL Force Delete]**. The fragment, together with its content fragment component, will be deleted from any content pages.

