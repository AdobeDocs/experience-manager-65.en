---
title: Managing Content Fragments
description: Learn how to use the Assets console to manage your AEM Content Fragments, the basis of your headless content.
feature: Content Fragments
role: User
exl-id: 333ad877-db2f-454a-a3e5-59a936455932
---
# Managing Content Fragments {#managing-content-fragments}

Learn how to use the Assets console to manage your AEM Content Fragments, the basis of your headless content.

After defining your [Content Fragment Models](#creating-a-content-model) you can use these to [create your Content Fragments](#creating-a-content-fragment).

The [Content Fragment Editor](#opening-the-fragment-editor) provides various [modes](#modes-in-the-content-fragment-editor) to enable you to:

* [Edit the content](#editing-the-content-of-your-fragment) and [manage Variations](#creating-and-managing-variations-within-your-fragment)
* [Annotate your Fragment](/help/assets/content-fragments/content-fragments-variations.md#annotating-a-content-fragment)
* [Associate Content with your Fragment](#associating-content-with-your-fragment)
* [Configure the Metadata](#viewing-and-editing-the-metadata-properties-of-your-fragment)
* [View the Structure Tree](/help/assets/content-fragments/content-fragments-structure-tree.md)
* [Preview the JSON representation](/help/assets/content-fragments/content-fragments-json-preview.md)


>[!NOTE]
>
>Content fragments can be used:
>
>* when authoring pages; see [Page Authoring with Content Fragments](/help/sites-cloud/authoring/fundamentals/content-fragments.md).
>* for [Headless Content Delivery using Content Fragments with GraphQL](/help/assets/content-fragments/content-fragments-graphql.md).

>[!NOTE]
>
>Content Fragments are stored as **Assets**, so are primarily managed from the **Assets** console.

## Creating Content Fragments {#creating-content-fragments}

### Creating a Content Model {#creating-a-content-model}

[Content fragment models](/help/assets/content-fragments/content-fragments-models.md) can be enabled and created, prior to creating content fragments with structured content.

### Creating a Content Fragment {#creating-a-content-fragment}

The method of creating a content fragment is:

1. Navigate to the **Assets** folder where you want to create the fragment.
1. Select **Create**, then **Content Fragment** to open the wizard.
1. The first step of the wizard requires you to specify the basis of the new fragment.

      * [Model](/help/assets/content-fragments/content-fragments-models.md) - used to create a fragment that requires structured content; for example the **Adventure** model

        * All available models are displayed.

   After selection, use **Next** to proceed.

   ![fragment basis](assets/cfm-managing-01.png)

1. In the **Properties** step specify:

    * **Basic**

        * **Title**
  
          The fragment title.

          Mandatory.

        * **Description**

        * **Tags**

    * **Advanced**

        * **Name**

          The name; will be used to form the URL.

          Mandatory; will be automatically derived from the title, but can be updated.

1. Select **Create** to complete the action, then either **Open** the fragment for editing or return to the console with **Done**.

   >[!NOTE]
   >In **List** mode of the console you can update the **View Settings** to enable the **Content Fragment Model** column.

## Actions for a Content Fragment in the Assets Console {#actions-for-a-content-fragment-assets-console}

In the **Assets** console a range of actions are available for your content fragments, either:

* From the toolbar; after selection of your fragment all appropriate actions are available.
* As [quick actions](/help/sites-cloud/authoring/getting-started/basic-handling.md#quick-actions); a subset of actions available for the individual fragment cards.

![actions](assets/cfm-managing-02.png)

Select the fragment to reveal the toolbar with applicable actions:

* **Reprocess Assets**
* **Create**
* **Download**

    * Save the fragment as a ZIP file; you can define whether to include Elements, Variations, Metadata.

* **Checkout**
* **Properties**

    * Allows you to view and/or edit the fragment's metadata.

* **Edit**

    * Allows you to [open the fragment for editing content](/help/assets/content-fragments/content-fragments-variations.md) together with its elements, variations, associated content and metadata.

* **Quick Publish**
* **Manage Publication**
* **Manage Tags**
* **To Collection**
* **Copy** (and **Paste**)
* **Move**
* **Delete**

>[!NOTE]
>
>Many of these are [standard actions for Assets](/help/assets/manage-digital-assets.md) and/or the [AEM desktop app](https://helpx.adobe.com/experience-manager/desktop-app/aem-desktop-app.html).

## Opening the Fragment Editor {#opening-the-fragment-editor}

To open your fragment for editing:

>[!CAUTION]
>
>To edit a content fragment you need [the appropriate permissions](/help/implementing/developing/extending/content-fragments-customizing.md#asset-permissions). Please contact your system administrator if you are experiencing issues.

>[!CAUTION]
>
>To edit a content fragment you need the appropriate permissions. Please contact your system administrator if you are experiencing issues.

1. Use the **Assets** console to navigate to the location of your content fragment.
1. Open the fragment for editing, by either:

   * Clicking/tapping on the fragment or fragment link (this is dependent on the console view).
   * Selecting the fragment, then **Edit** from the toolbar.

1. The fragment editor will open. Make your changes as required:

   ![fragment editor](assets/cfm-managing-03.png)

1. After making changes, use **Save**, **Save & close** or **Close** as required.

   >[!NOTE]
   >
   >**Save & close** is available via the **Save** dropdown.

   >[!NOTE]
   >
   >Both **Save & Close** and **Close** will exit the editor - see [Save, Close and Versions](#save-close-and-versions) for full information on how the various options operate for content fragments.

## Modes and Actions in the Content Fragment Editor {#modes-actions-content-fragment-editor}

There are various modes and actions available from the Content Fragment Editor.

### Modes in the Content Fragment Editor {#modes-in-the-content-fragment-editor}

Navigate through the various modes using the icons in the side panel:

* Variations: [Editing the content](#editing-the-content-of-your-fragment) and [Managing your Variations](#creating-and-managing-variations-within-your-fragment)

* [Annotations](/help/assets/content-fragments/content-fragments-variations.md#annotating-a-content-fragment)
* [Associated Content](#associating-content-with-your-fragment)
* [Metadata](#viewing-and-editing-the-metadata-properties-of-your-fragment)
* [Structure Tree](/help/assets/content-fragments/content-fragments-structure-tree.md)
* [Preview](/help/assets/content-fragments/content-fragments-json-preview.md)

![modes](assets/cfm-managing-04.png)

### Toolbar Actions in the Content Fragment Editor {#toolbar-actions-in-the-content-fragment-editor}

Some features in the top toolbar are available from multiple modes:

![modes](assets/cfm-managing-top-toolbar.png)

* A message will be shown when the fragment is already referenced on a content page. You can **Close** the message.

* The side panel can be hidden/shown using the **Toggle Side Panel** icon.

* Underneath the fragment name you can see the name of the [Content Fragment Model](/help/assets/content-fragments/content-fragments-models.md) used for creating the current fragment:

  * The name is also a link that will open the model editor.

* See the status of the fragment; for example, information about when it was created, modified or published. The status is also color-coded:

  * **New**: grey
  * **Draft**: blue
  * **Published**: green
  * **Modified**: orange
  * **Deactivated**: red

* **Save** provides access to the **Save & close** option.
  
* The three dots (**...**) drop-down provides access to additional actions:
  * **Update page references**
    * This updates any page references. 
  * **[Quick publish](#publishing-and-referencing-a-fragment)**
  * **[Manage Publication](#publishing-and-referencing-a-fragment)**

<!--
This updates any page references and ensures that the Dispatcher is flushed as required. -->

## Save, Close and Versions {#save-close-and-versions}

>[!NOTE]
>
>Versions can also be [created, compared and reverted from the Timeline](/help/assets/content-fragments/content-fragments-managing.md#timeline-for-content-fragments).

The editor has various options:

* **Save** and **Save & close**

  * **Save** will save the latest changes and remain in the editor.
  * **Save & close** will save the latest changes and exit the editor.

  >[!CAUTION]
  >
  >To edit a content fragment you need [the appropriate permissions](/help/implementing/developing/extending/content-fragments-customizing.md#asset-permissions). Please contact your system administrator if you are experiencing issues. 

  >[!NOTE]
  >
  >It is possible to remain in the editor, making a series of changes, before saving.

  >[!CAUTION]
  >
  >In addition to simply saving your changes, the actions also update any references and ensures that the Dispatcher is flushed as required. These changes can take time to process. Due to this, there can be a performance impact on a large/complex/heavily-loaded system.
  >
  >Please bear this in mind when using **Save & close** and then quickly re-entering the fragment editor to make and save further changes.

* **Close**

  Will exit the editor without saving the latest changes (i.e made since the last **Save**).

While editing your content fragment AEM automatically creates versions to ensure that prior content can be restored if you cancel your changes (using **Close** without saving):

1. When a content fragment is opened for editing AEM checks for the existence of the cookie-based token that indicates whether an *editing session* exists:

   1. If the token is found, the fragment is considered to be part of the existing editing session.
   2. If the token is *not* available and the user starts editing content, a version is created and a token for this new editing session is sent to the client, where it is saved in a cookie.

2. While there is an *active* editing session, the content being edited is automatically saved every 600 seconds (default).

   >[!NOTE]
   >
   >The auto save interval is configurable using the `/conf` mechanism.
   >
   >Default value, see:
   >&nbsp;&nbsp;`/libs/settings/dam/cfm/jcr:content/autoSaveInterval`

3. If the user cancels the edit, the version created at the start of the editing session is restored and the token is removed to end the editing session.
4. If the user selects to **Save** the edits, the updated elements/variations are persisted and the token is removed to end the editing session.

## Editing the Content of your Fragment {#editing-the-content-of-your-fragment}

Once you have opened your fragment, you can use the [Variations](/help/assets/content-fragments/content-fragments-variations.md) tab to author your content.

## Creating and Managing Variations within your Fragment {#creating-and-managing-variations-within-your-fragment}

Once you have created the Master content, you can create, and manage, [Variations](/help/assets/content-fragments/content-fragments-variations.md) of that content.

## Associating Content with your Fragment {#associating-content-with-your-fragment}

You can also [associate content](/help/assets/content-fragments/content-fragments-assoc-content.md) with a fragment. This provides a connection so that assets (i.e. images) can be (optionally) used with the fragment when it is added to a content page.

## Viewing and Editing the Metadata (Properties) of your Fragment {#viewing-and-editing-the-metadata-properties-of-your-fragment}

You can view, and edit, the properties of a fragment using the [Metadata](/help/assets/content-fragments/content-fragments-metadata.md) tab.

## Timeline for Content Fragments {#timeline-for-content-fragments}

In addition to the standard options, [Timeline](/help/assets/manage-digital-assets.md#timeline) provides both information and actions specific to content fragments:

* View information about versions, comments, and annotations
* Actions for Versions

  * **[Revert to this Version](#reverting-to-a-version)** (select an existing fragment, then a specific version)

  * **[Compare to Current](#comparing-fragment-versions)** (select an existing fragment, then a specific version)

  * Add a **Label** and/or **Comment** (select an existing fragment, then a specific version)

  * **Save as Version** (select an existing fragment, then the up arrow at the bottom of Timeline)

* Actions for Annotations

  * **Delete**

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
>

For example:

![timeline](assets/cfm-managing-05.png)

## Comparing Fragment Versions {#comparing-fragment-versions}

The **Compare to Current** action is available from the [Timeline](/help/assets/content-fragments/content-fragments-managing.md#timeline-for-content-fragments) after you have selected a specific version.

This will open:

* the **Current** (latest) version (left)

* the selected version **v&lt;*x.y*&gt;** (right)

They will be shown side by side, where:

* Any differences are highlighted

  * Deleted text - red
  * Inserted text - green
  * Replaced text - blue

* The full-screen icon allows you to open either version on its own; then toggle back to the parallel view
* You can **Revert** to the specific version
* **Done** will return you to the console

>[!NOTE]
>
>You cannot edit the fragment content when comparing fragments.

![comparing](assets/cfm-managing-06.png)

## Reverting to a Version  {#reverting-to-a-version}

You can revert to a specific version of your fragment:

* Directly from the [Timeline](/help/assets/content-fragments/content-fragments-managing.md#timeline-for-content-fragments).

  Select the required version, then the **Revert to this Version** action.

* While [comparing a version to the current version](/help/assets/content-fragments/content-fragments-managing.md#comparing-fragment-versions) you can **Revert** to the selected version.

## Publishing and Referencing a Fragment {#publishing-and-referencing-a-fragment}

>[!CAUTION]
>
>If your fragment is based on a model, then you should ensure that the [model has been published](/help/assets/content-fragments/content-fragments-models.md#publishing-a-content-fragment-model).
>
>If you publish a content fragment for which the model has not yet been published, a selection list will indicate this and the model will be published with the fragment.

Content Fragments must be published for use in the publish environment. They can be published:

* After creation; using [actions available in the Assets console](#actions-for-a-content-fragment-assets-console).
* From the [Content Fragment Editor](#toolbar-actions-in-the-content-fragment-editor).
* When you [publish a page that uses the fragment](/help/sites-cloud/authoring/fundamentals/content-fragments.md#publishing); the fragment will be listed in the page references.

>[!CAUTION]
>
>After a fragment has been published and/or referenced, AEM will display a warning when an author opens the fragment for editing again. This is to warn that changes to the fragment will affect the referenced pages as well.

## Deleting a Fragment {#deleting-a-fragment}

To delete a fragment:

1. In the **Assets** console navigate to the location of the content fragment.
2. Select the fragment.

   >[!NOTE]
   >
   >The **Delete** action is not available as a quick action.

3. Select **Delete** from the toolbar.
4. Confirm the **Delete** action.

   >[!CAUTION]
   >
   >If the fragment is already referenced in a page you will then see a warning message and be required to confirm that you want to proceed with a **Force Delete**. The fragment, together with its content fragment component, will be deleted from any content pages.
