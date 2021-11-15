---
title: Configure Workfront for Experience Manager enhanced connector
description: Configure Workfront for Experience Manager enhanced connector
contentOwner: AG
role: Admin
feature: Asset Management
---

# Configure [!DNL Workfront for Experience Manager enhanced connector] {#assets-integration-overview}

Adobe Experience Manager administrators configure the enhanced connector after it is installed. For instructions to install, see [Install enhanced connector](/help/assets/integrations.md).

## System User Configuration {#system-user-config}

<!--
Use the wiki shared by James. 
If not documented on the wiki, use the steps from https://workfront-tools.hoodoo.digital/WTFAUG/Installing-Workfront-for-Experience-Manager-enhanced-connector.618823781.html#InstallingWorkfrontforExperienceManagerenhancedconnector-SystemUserConfiguration.

-->

## Configure event subscriptions {#event-subscriptions}

<!-- From https://workfront-tools.hoodoo.digital/WTFAUG/Configure-Event-Subscriptions.630259731.html. 
-->

Event subscriptions are used to notify AEM of events that take place in [!DNL Adobe Workfront]. There are three Workfront for Experience Manager enhanced connector features that need event subscriptions in order to work, these are:

* Automatic creation of project linked folders.
* Synchronization of changes in Workfront document custom form values to AEM asset metadata.
* Automatic publication of assets to Brand Portal upon project completion.

To use these features, enable event subscriptions.

* Edit [!UICONTROL Workfront Tools] Cloud Services configuration you created in step 5 and select the [!UICONTROL Event Subscriptions] tab.
* Select the [!UICONTROL Workfront Custom Integration] you created in section 6.
* Click [!UICONTROL Enable Workfront Event Subscriptions].

   ![Event subscription](/help/assets/assets/event-subs.png)

## Configure linked folders {#linked-folders}

<!-- From https://workfront-tools.hoodoo.digital/WTFAUG/Configure-Linked-Folders.618659910.html.
-->

To subscribe to the events, follow these steps:

1. Go to the Event Subscriptions tab in the cloud services.
1. Select the custom integration you created in Workfront.
1. Click Enable Workfront Event Subscriptions.

### Linked folder structure configuration {#linked-folder-structure}

1. Go to the Project Linked Folders tab in the cloud services.
1. Linked folder parent path: Select a folder in the DAM where you wish to create the linked folders. If left empty, it will default to /content/dam. Make sure that the Workfront Tools metadata schema and Workfront Linked Folder folder metadata schema have been applied to the selected folder.
1. Linked folder structure: Enter comma-separated values. Each value should be `DE:<some-project-custom-form-field>`, Portfolio, Program, Year, Name, or some "Literal String Value" (this last one with quotation marks). It is currently set to Portfolio,Program,Year,DE:Project Type,Name.
1. Build linked folder title in Workfront using the folder structure names checkbox should be checked if the title of the folder in Workfront should include all folders in the structure. Otherwise, it will be the title of the last folder.
1. Sub-folders multifield lets you specify a list of folders that should be created as a child folder of the linked folder.
1. Project status: Select the status the project has to be set to in order to create the linked folder.
1. Create a linked folder in projects with portfolio: List of Portfolios that the project has to belong to in order to create the linked folder. Leave this list empty to create the linked folder for all project portfolio.
1. Create a linked folder in projects with custom form field: Custom form field and its corresponding value that the project has to have in order to create the linked folder. This configuration will be ignored if left empty. Select `CUSTOM FORMS: Create DAM Linked Folder` for the field and input `Yes` for the value.
1. Click on Enable automatic creation of linked folders. If you go back to the Event Subscriptions tab, you'll see there is now one create event.


## Metadata schema mapping {#metadata-schema-mapping}

### Configure folder metadata mapping {#folder-metadata-mapping}

### Configure asset metadata mapping {#asset-metadata-mapping}

<!-- From https://workfront-tools.hoodoo.digital/WTFAUG/Metadata-Schema-Mapping.618790933.html.
-->

## Map property {#map-property}

## Set status {#set-status}

In workflow editor, edit the properties of [!UICONTROL Workfront - Set Status] in the [!UICONTROL Arguments] tab.

![Edit workflow to set status](/)

## Comments synchronization {#comments-sync}

1. In Experience Manager, access **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Workfront Tools Configuration]**, select the configuration, and select **[!UICONTROL Properties]**.

  ![comments sync](/help/assets/assets/comments-sync1.png)

1. Select **[!UICONTROL Event Subscriptions]** tab, click **[!UICONTROL Enable Comment Sync]** on **[!UICONTROL Send Comments made in Workfront to AEM]** option.

To test the synchronization of comments from Workfront to AEM, follow these steps:

1. Navigate to a linked document in Workfront and add a comment in the Updates tab.

   ![leave comment in Workfront](/help/assets/assets/comments-sync2.png)

1. Navigate to the same linked document in AEM, select the document and open the [!UICONTROL Timeline] option in the left navigation, and select [!UICONTROL Comments]. The left sidebar displays the comments synchronized from [!DNL Workfront].

## Asset versions {#asset-versions}

To maintain version history of assets in AEM, configure asset versioning in AEM.

1. In Experience Manager, access **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Workfront Tools Configuration]**, and open the **[!UICONTROL Advanced]** tab.

1. Option **[!UICONTROL Store assets with the same name as versions of the existing asset]**: when checked, this option enables storing assets uploaded with the same name and to the same location as the version of the existing asset. If left unchecked, a new asset will be created with a different name (for example, `asset-name.pdf` and `asset-name-1.pdf`).

1. Option **[!UICONTROL Update asset metadata when creating a new version]**: when checked, this option updates the asset metadata whenever a new version of the asset is created. If unchecked, the asset will keep the metadata it had prior to creating the new version.

![configure asset versioning](/help/assets/assets/wf-config-versioning.png)

>[!NOTE]
>
>The versioning is not supported in linked folders. When creating a [!DNL Workfront] proof with a document inside a linked folder, the comments and annotations on the previous version of the asset get removed.

## Attach custom forms {#attach-custom-forms}



## Auto-publish assets {#auto-publish-assets}

## Content Fragments {#content-fragments}
