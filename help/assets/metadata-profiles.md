---
title: Metadata Profiles
seo-title: Metadata Profiles
description: Know about metadata profiles for assets. Learn how to create a metadata profile and apply it to folder assets.
seo-description: Know about metadata profiles for assets. Learn how to create a metadata profile and apply it to folder assets.
uuid: fd366fb8-0585-40e8-bb9a-97475879f293
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
topic-tags: administering
content-type: reference
discoiquuid: a8e2c376-7a53-45e2-b547-204115fe35c3
---

# Metadata Profiles {#metadata-profiles}

A Metadata Profile lets you apply default metadata to assets within a folder. Create a Metadata Profile and apply it to a folder. Any asset that you subsequently upload to the folder inherits the default metadata that you configured in the Metadata Profile.

## Adding a metadata profile {#adding-a-metadata-profile}

1. Tap or click the AEM logo and navigate to **[!UICONTROL Tools > Assets > Metadata Profiles]**, and then tap **[!UICONTROL Create]**.
1. Enter a title for the Metadata Profile, for example Sample Metadata, and click **[!UICONTROL Submit]**. The **[!UICONTROL Edit Form]** for the Metadata Profile is displayed. 

   ![chlimage_1-480](assets/chlimage_1-480.png)

1. Click a component and configure its properties in the **[!UICONTROL Settings]** tab. For example, click the **[!UICONTROL Description]** component and edit its properties.

   ![chlimage_1-481](assets/chlimage_1-481.png)

   Edit the following properties for the **[!UICONTROL Description]** component:

    * **[!UICONTROL Field Label]**: The display name of the metadata property. It is only for the user reference.
    * **[!UICONTROL Map to Property]**: The value of this property provides the relative path/name to the asset node where it is saved in the repository. The value should always start with `./` because it indicates that the path is under the asset's node.

   ![chlimage_1-482](assets/chlimage_1-482.png)

   The value you specify for **[!UICONTROL Map to property]** is stored as a property under the asset's metadata node. For example, if you specify . `/jcr:content/metadata/dc:desc` as the name of **[!UICONTROL Map to property]**, AEM Assets stores the value `dc:desc` at the asset's metadata node.

    * **[!UICONTROL Default Value]**: Use this property to add a default value for the metadata component. For example, if you specify "My description" then this value is assigned to the property `dc:desc` at the asset's metadata node.

   ![chlimage_1-483](assets/chlimage_1-483.png)

   >[!NOTE]
   >
   >Adding a default value to a new metadata property (which does not exist already at the . `/jcr:content/metadata` node) does not display the property and its value on the asset's **[!UICONTROL Properties]** page by default. To view the new property on the assets's Properties page, modify the corresponding schema form.

1. (Optional) Add more components to the **[!UICONTROL Edit Form]** from the **[!UICONTROL Build Form]** tab, and configure their properties in the **[!UICONTROL Settings]** tab. The following properties are available from the **[!UICONTROL Build Form]** tab:

    <table> 
    <tbody> 
      <tr> 
      <td><strong>Component</strong></td> 
      <td><strong>Properties</strong></td> 
      </tr> 
      <tr> 
      <td>Section Header</td> 
      <td> 
        <ul> 
        <li>Field Label</li> 
        <li>Description</li> 
        </ul> </td> 
      </tr> 
      <tr> 
      <td>Single Line Text</td> 
      <td> 
        <ul> 
        <li>Field Label</li> 
        <li>Map to property</li> 
        <li>Default Value</li> 
        </ul> </td> 
      </tr> 
      <tr> 
      <td>Multi Value Text</td> 
      <td> 
        <ul> 
        <li>Field Label</li> 
        <li>Map to property</li> 
        <li>Default Value</li> 
        </ul> </td> 
      </tr> 
      <tr> 
      <td>Number</td> 
      <td> 
        <ul> 
        <li>Field Label</li> 
        <li>Map to property</li> 
        <li>Default Value</li> 
        </ul> </td> 
      </tr> 
      <tr> 
      <td>Date</td> 
      <td> 
        <ul> 
        <li>Field Label</li> 
        <li>Map to property</li> 
        <li>Default Value</li> 
        </ul> </td> 
      </tr> 
      <tr> 
      <td>Standard Tags</td> 
      <td> 
        <ul> 
        <li>Field Label</li> 
        <li>Map to property</li> 
        <li>Default Value</li> 
        <li>Description</li> 
        </ul> </td> 
      </tr> 
    </tbody> 
    </table>

      ![chlimage_1-484](assets/chlimage_1-484.png)

1. Click **[!UICONTROL Done]**. The Metadata Profile is added to the list of profiles in the **[!UICONTROL Metadata Profiles]** page. 

   ![chlimage_1-485](assets/chlimage_1-485.png)

## Copying a metadata profile {#copying-a-metadata-profile}

1. From the **Metadata Profiles** page, select a Metadata Profile to make a copy of it. 

   ![chlimage_1-486](assets/chlimage_1-486.png)

1. Click **Copy** from the toolbar.
1. In the **Copy Metadata Profile** dialog, enter a title for the new copy of the Metadata Profile.
1. Click **Copy**. The copy of the Metadata Profile appears in the list of profiles in the **Metadata Profiles** page. 

   ![chlimage_1-487](assets/chlimage_1-487.png)

## Deleting a metadata profile {#deleting-a-metadata-profile}

1. From the **[!UICONTROL Metadata Profiles]** page, select a profile to delete. 

   ![chlimage_1-488](assets/chlimage_1-488.png)

1. Click **[!UICONTROL Delete Metadata Profiles]** in the toolbar.
1. In the dialog box, click **[!UICONTROL Delete]** to confirm the delete operation. The metadata profile is deleted from the list.

## Applying a metadata profile to folders {#applying-a-metadata-profile-to-folders}

When you assign a metadata profile to a folder, any subfolders automatically inherit the profile from its parent folder. This means that you can assign only one metadata profile to a folder. As such, consider carefully the folder structure of where you upload, store, use, and archive assets.

If you assigned a different metadata profile to a folder, the new profile overrides the previous profile. The previously existing folder assets remain unchanged. The new profile is applied on the assets that are added to the folder later.

Folders that have a profile assigned to it are indicated in the user interface by the name of the profile appearing in the card name.

![chlimage_1-489](assets/chlimage_1-489.png)

You can apply metadata profiles to specific folders or globally to all assets.

### Applying metadata profiles to specific folders {#applying-metadata-profiles-to-specific-folders}

You can apply a metadata profile to a folder from within the **[!UICONTROL Tools]** menu or if you are in the folder, from **[!UICONTROL Properties]**. This section describes how to apply metadata profiles to folders both ways.

Folders that have a profile already assigned to it are indicated by the display of the profile's name directly below the folder name.

#### Applying metadata profiles to folders from Profiles user interface {#applying-metadata-profiles-to-folders-from-profiles-user-interface}

1. Tap the AEM logo and navigate to **[!UICONTROL Tools > Assets > Metadata Profiles]**.
1. Select the metadata profile that you want to apply to a folder or multiple folders.

   ![chlimage_1-490](assets/chlimage_1-490.png)

1. Tap **[!UICONTROL Apply Metadata Profile to Folder(s)]** and select the folder or multiple folders you want use to receive the newly uploaded assets and tap **[!UICONTROL Done]**. Folders that have a profile already assigned to it are indicated by the display of the profile's name directly below the folder name.

#### Applying metadata profiles to folders from Properties {#applying-metadata-profiles-to-folders-from-properties}

1. In the left rail, tap **[!UICONTROL Assets]** then navigate to the folder that you want to apply a metadata profile to.
1. On the folder, tap the check mark to select it, then tap  **[!UICONTROL Properties]**.  

1. Select the **[!UICONTROL Metadata Profiles]** tab and select the profile from the drop-down menu and click **[!UICONTROL Save]**.

   ![chlimage_1-491](assets/chlimage_1-491.png)

   Folders that have a profile already assigned to it are indicated by the display of the profile's name directly below the folder name.

### Applying a metadata profile globally {#applying-a-metadata-profile-globally}

In addition to applying a profile to a folder, you can also apply one globally so that any content uploaded into AEM assets in any folder has the selected profile applied.

**To apply a metadata  profile globally**:

1. Do one of the following:

    * Navigate to **https://&lt;AEM server&gt;/mnt/overlay/dam/gui/content/assets/foldersharewizard.html/content/dam** and apply the appropriate profile and tap or click **Save**.

      ![chlimage_1-492](assets/chlimage_1-492.png)

    * Navigate to CRXDE Lite to the following node: `/content/dam/jcr:content`. Add the property metadataProfile:/etc/dam/metadata/dynamicmedia/&lt;name_of_metadata_profile&gt; and tap **[!UICONTROL Save All]**. 

      ![chlimage_1-493](assets/chlimage_1-493.png)

## Removing a metadata profile from folders {#removing-a-metadata-profile-from-folders}

When you remove a metadata profile from a folder, any subfolders automatically inherit the removal of the profile from its parent folder. However, any processing of files that has occurred within the folders remains intact.

You can remove a metadata profile from a folder from within the **[!UICONTROL Tools]** menu or if you are in the folder, from the **[!UICONTROL Properties]**. This section describes how to remove metadata profiles from folders both ways.

### Removing metadata profiles from folders via Profiles user interface {#removing-metadata-profiles-from-folders-via-profiles-user-interface}

To remove a metadata profile from folders via Profiles user interface:

1. Tap the AEM logo and navigate to **[!UICONTROL Tools > Assets > Metadata Profiles]**.
1. Select the metadata profile that you want to remove from a folder or multiple folders.
1. Tap **[!UICONTROL Remove Metadata Profile from Folder(s)]** and select the folder or multiple folders you want use to remove a profile from, then tap **[!UICONTROL Done]**.

   You can confirm that the metadata profile is no longer applied to a folder because the name no longer appears below the folder name.

### Removing metadata profiles from folders by way of Properties {#removing-metadata-profiles-from-folders-via-properties}

1. Tap the AEM logo and navigate **[!UICONTROL Assets]** and then to the folder that you want to remove an metadata profile from.
1. On the folder, tap the check mark to select it, then tap **[!UICONTROL Properties]**.
1. Select the **[!UICONTROL Metadata Profiles]** tab, then select **[!UICONTROL None]** from the drop-down menu.
1. Tap **Save**.
Folders that have a profile already assigned to it are indicated by the display of the profile's name directly below the folder name.

