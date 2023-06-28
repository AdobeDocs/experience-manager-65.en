---
title: '[!DNL Experience Manager Assets] integration with [!DNL Adobe Workfront]'
description: Introduction to integration between [!DNL Assets] and [!DNL Workfront]
role: Admin,Leader,Architect
feature: Integrations
exl-id: 57e2bffe-8094-4557-99c8-7b482681687e
hide: yes
---
# [!DNL Adobe Experience Manager Assets] integration with [!DNL Adobe Workfront] {#assets-integration-overview}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets-view/integrations/workfront-integrations.html?lang=en)                  |
| AEM 6.5     | This article         |

[!DNL Adobe Workfront] is a work management application that helps you manage the entire lifecycle of work in one place. The integration between [!DNL Workfront] and [!DNL Adobe Experience Manager Assets] lets organizations improve content velocity and time-to-market by intrinsically connecting work and digital asset management. Within the context of managing their work in Workfront, users have access to the required documents and images.

The [!DNL Workfront for Experience Manager enhanced connector] enables enhanced business processes with end-to-end workflows and provides personalized end-to-end client experiences and central storage. Adobe offers a standard connector and an enhanced connector to integrate the two solutions. See the supported features below for a comparison and see [what is new in the [!DNL enhanced connector]](https://one.workfront.com/s/csh?context=2467&pubname=the-new-workfront-experience).

[!DNL Workfront for Experience Manage enhanced connector] enables your organization to:

* Auto-create linked Experience Manager folders in Workfront and organize the folders based on Workfront Portfolios, Programs, and Projects.
* Synchronize Workfront project metadata with linked Experience Manager folders.
* Experience Manager metadata updates with new versions.
* Set Workfront object statuses based on configurable conditions using Experience Manager workflows.
* Publish assets to Experience Manager publish environment or to Brand Portal.

See the platform support and [prerequisites for the enhanced connector](https://one.workfront.com/s/csh?context=2467&pubname=the-new-workfront-experience).

>[!IMPORTANT]
>
>* Adobe requires deployment and configuration of the [!DNL Adobe Workfront for Experience Manager enhanced connector] only via certified partners or [!DNL Adobe Professional Services]. If deployed and configured without a certified partner or [!DNL Adobe Professional Services], it is not supported by Adobe.
>
>* Adobe may release updates to [!DNL Adobe Workfront] and [!DNL Adobe Experience Manager] that make this connector redundant; if this occurs, customers may be required to transition from the use of this connector.
>
>* Adobe supports enhanced connector versions 1.7.4 and higher. Previous prerelease and custom versions are not supported. To check the enhanced connector version, navigate to the `digital.hoodoo` group available in the left pane in [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html?lang=en). 
>
>* See [Partner certification exam for Workfront for Experience Manager Assets enhanced connector](https://solutionpartners.adobe.com/solution-partners/home/applications/experience_cloud/workfront/journey/dev_core.html). For information about the exam, see [Exam Guide](https://express.adobe.com/page/Tc7Mq6zLbPFy8/).

## Compare different integrations between [!DNL Assets] and [!DNL Workfront] {#feature-parity-matrix}

The following are the details of the functionalities available through various types of integrations between [!DNL Assets] and [!DNL Workfront].

| Feature   |Description  | [!DNL Workfront] and [!DNL Assets Essentials] *No Connector (OOTB)* | [!DNL Workfront for Experience Manager enhanced connector] *Requires Connector*| Workfront and [!DNL Experience Manager as a Cloud Service] *No Connector (OOTB)*|
|----|----|----|-----|-----|
| Deployment methods   | Appropriate for which [!DNL Assets] offering. | Assets Essentials| Adobe Managed Services, On-premise| Cloud Service|
| **General** |
| Send digital files from [!DNL Workfront] to [!DNL Assets]| Latest version of a WF document can be uploaded to AEM Assets which is linked as a new version of the document.  | &#10003; | &#10003;  | &#10003; |
| Manually Link AEM Folders to Workfront Objects| Existing AEM folders can be linked as a Workfront folder and its child assets are linked as new Workfront documents.  | &#10003; | &#10003;  | &#10003; |
| Link [!DNL Assets] to Workfront Objects | Existing assets in AEM can be linked to a new Workfront document or as a new version of an existing document. | &#10003; | &#10003;  | &#10003; |
| Assets added to linked folders are automatically sent to AEM| If document is added to a linked folder, the associated asset is automatically uploaded to AEM Assets as a new asset. | &#10003; | &#10003;  | &#10003; |
| Download Linked AEM Assets from within Workfront   | When an asset is linked in Workfront, the user can download the bytes of the asset. | &#10003; | &#10003;  | &#10003; |
| Search for AEM Assets from within Workfront| The AEM Assets selector in Workfront allows for full-text searches for assets. | &#10003; | &#10003;  | &#10003; |
|Search for AEM Folders from within Workfront | The AEM Assets selector in Workfront allows for full-text searches for folders. | &#10003; | &#10003;  | &#10003; |
| View and Navigate AEM Folder Hierarchy from within Workfront   | The AEM Assets selector in Workfront allows for browsing of the AEM Assets hierarchy limited by the   user's associated access controls and permissions set in AEM.  | &#10003; | &#10003;  | &#10003; |
| Track Asset versions in AEM timelines| Maintain document version history between Workfront and AEM. | &#10003; | &#10003;  | &#10003; |
| Unlink Assets from AEM Assets in Workfront | An existing linked asset from AEM can be unlinked from the associated Workfront document. This does not delete the original asset inside AEM.| &#10003; | &#10003;  | &#10003; |
| Add Newly Versioned Asset to AEM Assets from Workfront  | When a newly added version is added on a document in Workfront, a user can send the new version to AEM to replace the existing version.   | &#10003; | &#10003;  | &#10003; |
| Assets Linked in Workfront when Clicked Direct User to AEM| Users are directed to AEM to preview a linked asset from within Workfront.| &#10003; | &#10003; | Upcoming |
| Automatically Create Linked AEM Folders in Workfront    | Automatically create linked AEM folders in Workfront using project statuses. Automatically, configure AEM folders based on Workfront Portfolios, Programs, and Projects.   | No  | &#10003;  | No |
| Navigate directly to AEM repositories from Workfront| Allow users to navigate to available AEM repositories configured within Workfront. | &#10003; | No  | &#10003; |
| Create linked AEM folders in Workfront| Manually create linked AEM folders in Workfront using the option available in the Documents tab. | &#10003; | No  | &#10003; |
| Comment Syncing| Automatically sync comments for assets from [!DNL Workfront] to [!DNL Assets]| No  | &#10003;  | No |
| Support multiple Workfront environments connecting to a single AEM environment| Users from multiple Workfront environments can connect to a single AEM environment. | &#10003; | No  | &#10003; |
| Support multiple AEM environments connecting to a single Workfront environment| Users within a single Workfront environment can send or link assets between multiple AEM environments. | &#10003; | &#10003;  | &#10003; |
| **Metadata** |
| Map Workfront Asset Metadata to AEM Assets | Workfront object and custom form properties may be mapped to AEM asset metadata properties. Values are pushed on initial upload/link.    | &#10003; | &#10003;  | &#10003; |
| Automatically Create Document Custom Forms in Workfront | Attach custom forms to Workfront documents, tasks, and issues using AEM workflows.| No  | &#10003; | No |
| Bi-directional Automatic Updating of Metadata between AEM Assets and Workfront   | Automatically update metadata between AEM Assets and Workfront. The asset must be initially pushed from Workfront to AEM and the Workfront asset metadata must be mapped to AEM assets for bi-directional metadata updates to work appropriately.| No  | &#10003;  | No |
|Real-time view in Workfront for mapped metadata to AEM | View the updated mapped metadata to AEM within Workfront Document Details and Document Summary panels.  | &#10003; | No  | &#10003; |
| Real-time push of updated Workfront metadata to AEM| Automatically update the mapped Workfront metadata to AEM without repushing an asset or a new version of an asset. | &#10003; | No  | &#10003; |
| Map Workfront Metadata to AEM Assets Folders | Sync Workfront project metadata with linked AEM folders.| No  | &#10003;  | &#10003; |
| AEM Metadata Updates with New Versions| A configuration in AEM can be made to determine whether a newly versioned asset in Workfront also pushes with any changes made to its metadata.  | No  | &#10003;  | No |
| Automatically Update AEM Metadata on Changes to Custom Forms in Workfront| AEM allows you to subscribe to the updates to the document forms in Workfront. As a result, any updates to the Workfront document custom form metadata edits the values for the mapped AEM metadata fields.     | No  | &#10003;  | No |
| **Workflows (Out-of-the-box)** |
| Create New Proof Version on Linked Assets  | Upon linking an asset in Workfront a proof can be automatically generated.| No  | Custom| No |
| Set Status on Workfront Objects  | Set Workfront object statuses based configurable conditions using AEM workflows| No  | &#10003;  | Upcoming |
| Publish Assets to AEM Publish Environment or Brand Portal| Give Workfront users the option to automatically publish linked assets to an AEM Publish environment or Brand Portal. | No  | &#10003;  | Upcoming |
