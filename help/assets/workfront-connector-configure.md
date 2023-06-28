---
title: Configure [!DNL Workfront for Experience Manager enhanced connector]
description: Configure [!DNL Workfront for Experience Manager enhanced connector]
role: Admin
feature: Integrations
exl-id: 2660de7c-0281-4884-98d9-e78f20cf571c
hide: yes
---
# Configure [!DNL Workfront for Experience Manager enhanced connector] {#assets-integration-overview}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets-view/integrations/workfront-connector-configure.html?lang=en)                  |
| AEM 6.5     | This article         |

A user with administrator access in [!DNL Adobe Experience Manager] configures the enhanced connector after installing it. For instructions to install, see [Install the connector](/help/assets/workfront-integrations.md).

>[!IMPORTANT]
>
>* Adobe requires deployment and configuration of the [!DNL Adobe Workfront for Experience Manager enhanced connector] only via certified partners or [!DNL Adobe Professional Services]. If deployed and configured without a certified partner or [!DNL Adobe Professional Services], it is not supported by Adobe.
>
>* Adobe may release updates to [!DNL Adobe Workfront] and [!DNL Adobe Experience Manager] that make this connector redundant; if this occurs, customers may be required to transition from the use of this connector.
>
>* Adobe supports enhanced connector versions 1.7.4 and higher. Previous prerelease and custom versions are not supported. To check the enhanced connector version, navigate to the `digital.hoodoo` group available in the left pane in [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html?lang=en). 
>
>* See [Partner certification exam for Workfront for Experience Manager Assets enhanced connector](https://solutionpartners.adobe.com/solution-partners/home/applications/experience_cloud/workfront/journey/dev_core.html). For information about the exam, see [Exam Guide](https://express.adobe.com/page/Tc7Mq6zLbPFy8/).

## Configure event subscriptions {#event-subscriptions}

Event subscriptions are used to notify AEM of events that take place in [!DNL Adobe Workfront]. There are three [!DNL Workfront for Experience Manager enhanced connector] features that need event subscriptions in order to work, these are:

* Automatic creation of project linked folders.
* Synchronization of changes in Workfront document custom form values to AEM asset metadata.
* Automatic publication of assets to Brand Portal upon project completion.

To use these features, enable event subscriptions.

* Edit [!UICONTROL Workfront Tools] Cloud Services configuration you created in step 5 and select the [!UICONTROL Event Subscriptions] tab.
* Select the [!UICONTROL Workfront Custom Integration] you created in section 6.
* Click [!UICONTROL Enable Workfront Event Subscriptions].

   ![Event subscription](/help/assets/assets/event-subs.png)

## Configure linked folders {#linked-folders}

To subscribe to the events, follow these steps:

1. Navigate to the **[!UICONTROL Event Subscriptions]** tab in the cloud services.
1. Select the custom integration created in [!DNL Workfront].
1. Click **[!UICONTROL Enable Workfront Event Subscriptions]**.

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

![linked folder configuration](/help/assets/assets/wf-linked-folder-config.png)

## Metadata schema mapping {#metadata-schema-mapping}

### Configure folder metadata mapping {#folder-metadata-mapping}

Metadata mapping between Workfront Projects and AEM Folders is defined within AEM Folder Metadata Schemas. Folder Metadata Schemas should be created and configured as usual in AEM. Workfront Tools adds an autocomplete dropdown to the Settings configuration tab of each folder metadata schema form field. This autocomplete drop- down menu will allow you to specify to which Workfront field each AEM folder property should be mapped to.

To configure the mappings, follow these steps:

1. Navigate to **[!UICONTROL Tools]** > **[!UICONTROL Assets]** > **[!UICONTROL Folder Metadata Schemas]**.
1. Select the folder metadata schema form you wish to edit and click Edit.
1. Select the folder metadata schema form field you wish to edit and select Settings tab on the right panel.
1. In [!UICONTROL Mapped from Workfront Field] field, select the name of the Workfront field that you wish to map to the selected AEM folder property. Available options are:

   * Project custom form fields
   * Project Overview fields (ID, Name, Description, Reference Number, Planned Completion Date, Project Owner, Project Sponsor, Portfolio or Program)

![metadata mapping config](/help/assets/assets/wf-metadata-mapping-config2.png)

### Configure asset metadata mapping {#asset-metadata-mapping}

Metadata mapping between Adobe Workfront Documents and Assets is defined within AEM Metadata Schemas. Metadata Schemas should be created and configured as usual in AEM. Workfront Tools adds configuration options to the Settings configuration tab of each metadata schema form field. These options will allow you to specify to which Workfront field each AEM property should be mapped to.

To configure the mappings, follow these steps:

1. Navigate to **Tools** > **Assets** > **Metadata Schemas**.
1. Select the metadata schema form you wish to edit and click **Edit** or create a new metadata schema from scratch.
1. Select the metadata schema form field you wish to edit and select **Settings** tab on the right panel.
1. In [!DNL Workfront] Custom Form Field select the name of the [!DNL Workfront] field that you wish to map to the selected AEM property. Available options are:

   * Document custom form fields
   * Project custom form fields
   * Issue custom form fields
   * Task custom form fields
   * Project Overview fields (ID, Name, Description, or Reference Number)

1. In the case where the [!DNL Workfront] field selected in [!UICONTROL Workfront Custom Form Field] is a Workfront User type-ahead field, it will be necessary to specify which Workfront User field you wish to map. To do so, check Get value from Workfront referenced object field and then specify the name of the [!UICONTROL Workfront User Custom Form Field] from which to retrieve the value to be mapped.

   ![metadata mapping configuration](/help/assets/assets/wf-metadata-mapping-config1.png)

## Map property {#map-property}

This workflow step lets a user map a property to a [!DNL Workfront] custom form on a project, task, issue, or document. The [!DNL Workfront] artifact this step affects is looked up using a relative path from the payload. The properties to be mapped are controlled from within the steps dialog configuration.

**Type**: This field lets you select the Workfront object type that the properties should be mapped to.

**ID Property**: This field lets you specify the path to the ID of the Workfront object that the properties should be mapped to. The path specified in this field should be relative to the workflow payload.

**Property Assignments**: This multifield lets you specify the mappings between AEM properties and Workfront fields. Each item in the multi-field will specify one mapping. Each mapping should have the format `<workfront-field>=<aem-mapped-property>`. 

* The `workfront-field` can be 

  * A custom form field identified by the prefix `DE:`.
  * An editable field identified by its name. The field names are found in [[!DNL Workfront] API explorer](https://experience.workfront.com/s/api-explorer).

* The `aem-mapped-property` can be:

  * A literal value. These should be surrounded by quotation marks.
  * An AEM property. This reference should be relative to the workflow payload.
  * A named value. These should be surrounded by brackets.
  * A concatenation of the above 3 items. Specify it using `{+}`.
  * An alteration of the above 3 items by surrounding the value with `{replace(<value>,"old-char","new-char")}`.

* Some example are:

  * `status="INP"`
  * `DE:Asset Type=jcr:content/metadata/assetType`
  * `DE:Path={path}`
  * `URL="https://my-aem-author/assets.html"{+}{path}`

![Configuration to map property](/help/assets/assets/wf-map-property-config.png)

## Set status {#set-status}

In workflow editor, edit the properties of **[!UICONTROL Workfront - Set Status]** in the **[!UICONTROL Arguments]** tab.

![Edit workflow to set status](/help/assets/assets/wf-set-status.png)

## Comments synchronization {#comments-sync}

1. In [!DNL Experience Manager], access **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Workfront Tools Configuration]**, select the configuration, and select **[!UICONTROL Properties]**.

   ![comments sync](/help/assets/assets/comments-sync1.png)

1. Select **[!UICONTROL Event Subscriptions]** tab, click **[!UICONTROL Enable Comment Sync]** on **[!UICONTROL Send Comments made in Workfront to AEM]** option.

   ![Synchronization is enabled](/help/assets/assets/wf-comment-sync-enabled.png)

To test the synchronization of comments from Workfront to AEM, follow these steps:

1. Navigate to a linked document in Workfront and add a comment in the Updates tab.

    ![leave comment in Workfront](/help/assets/assets/comments-sync2.png)

1. Navigate to the same linked document in AEM, select the document and open the [!UICONTROL Timeline] option in the left navigation, and select [!UICONTROL Comments]. The left sidebar displays the comments synchronized from [!DNL Workfront].

## Asset versions {#asset-versions}

To maintain version history of assets in AEM, configure asset versioning in AEM.

1. In Experience Manager, access **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Workfront Tools Configuration]**, and open the **[!UICONTROL Advanced]** tab.

1. Select option **[!UICONTROL Store assets with the same name as versions of the existing asset]**. When checked, this option enables storing assets uploaded with the same name and to the same location as the version of the existing asset. If left unchecked, a new asset will be created with a different name (for example, `asset-name.pdf` and `asset-name-1.pdf`).

1. Select option **[!UICONTROL Update asset metadata when creating a new version]**. When checked, this option updates the asset metadata whenever a new version of the asset is created. If unchecked, the asset will keep the metadata it had prior to creating the new version.

![configure asset versioning](/help/assets/assets/wf-config-versioning.png)

>[!NOTE]
>
>The versioning is not supported in linked folders. When creating a [!DNL Workfront] proof with a document inside a linked folder, the comments and annotations on the previous version of the asset get removed.

## Attach custom forms {#attach-custom-forms}

This workflow step lets users attach a custom form to a [!DNL Workfront] artifact. This workflow step can be added to any workflow model. The [!DNL Workfront] artifact this step affects will be looked up using a relative path from the payload.

In workflow editor in Experience Manager, edit the properties of the [!UICONTROL Workfront - Attach custom form] workflow step.

![custom forms](/help/assets/assets/wf-custom-forms.png).

## Auto-publish assets {#auto-publish-assets}

1. In Experience Manager, access **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Workfront Tools Configuration]**, and open the **[!UICONTROL Advanced]** tab.

1. Select **[!UICONTROL Automatically publish assets when sent from Workfront]**. This option enables automatic publishing of assets when they are sent from Workfront to AEM. This feature can be enabled conditionally by specifying a Workfront custom form field  and the value it should be set to. Whenever a document is sent to AEM, if it satisfies the condition, then the asset will be automatically published.

1. Select **[!UICONTROL Publish all project assets to Brand Portal upon project completion]**. This option enables automatic publishing of assets to [!DNL Brand Portal] when the status of the Workfront project they belong to is changed to `Complete`.

![configure auto-publish](/help/assets/assets/wf-auto-publish-config.png)

## Workfront document custom form updates {#subscribe-workfront-doc-custom-form-updates}

To subscribe to the changes in [!DNL Workfront] document custom forms, select the relevant option in the **[!UICONTROL Advanced]** tab. When you subscribe to these updates, it updates your mapped [!DNL Experience Manager] metadata fields when the corresponding field in [!DNL Workfront] document custom form is changed.

![Workfront document custom form updates configuration in [!DNL Experience Manager]](/help/assets/assets/wf-custom-form-update.png)
