---
title: [!DNL Experience Manager Assets] integration with [!DNL Adobe Workfront]
description: Introduction to integration between [!DNL Assets] and [!DNL Workfront]
role: Admin,Leader,Architect
feature: Integrations
---

# [!DNL Adobe Experience Manager Assets] integration with [!DNL Adobe Workfront] {#assets-integration-overview}

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
>Adobe requires deployment and configuration of the [!DNL Adobe Workfront for Experience Manager enhanced connector] only via certified partners or [!DNL Adobe Professional Services]. If deployed and configured without a certified partner or [!DNL Adobe Professional Services], it is not supported by Adobe.
>
>Adobe may release updates to [!DNL Adobe Workfront] and [!DNL Adobe Experience Manager] that make this connector redundant; if this occurs, customers may be required to transition from the use of this connector.

## Compare different integrations between [!DNL Assets] and [!DNL Workfront] {#feature-parity-matrix}

The following are the details of the functionalities available through various types of integrations between [!DNL Assets] and [!DNL Workfront].

| Feature   |Description  | [!DNL Workfront] and [!DNL Assets Essentials] | [!DNL Workfront] for [!DNL Experience Manager] connector | [!DNL Workfront for Experience Manager enhanced connector] |
|----|----|----|------|-----|
| Deployment methods   | Appropriate for which [!DNL Assets] offering. | Assets Essentials| Cloud Service, Adobe Managed Services, On-premise | Cloud Service, Adobe Managed Services, On-premise|
| Send digital files from [!DNL Workfront] to [!DNL Assets]| Latest version of a WF document can be uploaded to AEM Assets which will be linked as a new version of the document.  | &#10003; | &#10003;   | &#10003;  |
| Manually Link AEM Folders to Workfront Objects| Existing AEM folders can be linked as a Workfront folder and its child assets are linked as new Workfront documents.  | &#10003; | &#10003;   | &#10003;  |
| Link [!DNL Assets] to Workfront Objects | Existing assets in AEM can be linked to a new Workfront document or as a new version of an existing document. | &#10003; | &#10003;   | &#10003;  |
| Assets added to linked folders are automatically sent to AEM| If document is added to a linked folder, the associated asset is automatically uploaded to AEM Assets as a new asset. | &#10003; | &#10003;   | &#10003;  |
| Download Linked AEM Assets from within Workfront   | When an asset is linked in Workfront, the user can download the bytes of the asset. | &#10003; | &#10003;   | &#10003;  |
| Search for AEM Assets from within Workfront| The AEM Assets selector in Workfront allows for full-text searches for assets. | &#10003; | &#10003;   | &#10003;  |
| View and Navigate AEM Folder Hierarchy from within Workfront   | The AEM Assets selector in Workfront allows for browsing of the AEM Assets hierarchy limited by the   user’s associated access controls and permissions set in AEM.  | &#10003; | &#10003;   | &#10003;  |
| Unlink Assets from AEM Assets in Workfront | An existing linked asset from AEM can be unlinked from the associated Workfront document. This does not delete the original asset inside of AEM.| &#10003; | &#10003;   | &#10003;  |
| Add Newly Versioned Asset to AEM Assets from Workfront  | When a newly added version is added on a document in Workfront, a user can send the new version to AEM to replace the existing version.   | &#10003; | &#10003;   | &#10003;  |
| Assets Linked in Workfront when Clicked Direct User to AEM| Users are directed to AEM to preview a linked asset from within Workfront.| &#10003; | &#10003;   | Custom |
| Automatically Create Linked AEM Folders in Workfront    | Automatically create linked AEM folders in Workfront using object statuses. Automatically, organize AEM folders based on Workfront Portfolios, Programs, and Projects.   | No  | No    | &#10003;  |
| Comment Syncing| Automatically sync comments for assets from [!DNL Workfront] to [!DNL Assets]| No  | &#10003;   | &#10003;  |
| Map Workfront Asset Metadata to AEM Assets | Workfront object and custom form properties may be mapped to AEM asset metadata properties. Values will be pushed on initial upload/link.    | &#10003; | &#10003;   | &#10003;  |
| Automatically Create Document Custom Forms in Workfront | Attach custom forms to Workfront documents, tasks, and issues using AEM workflows.| No  | Manually add the custom form, then automated syncing works | &#10003;  |
| Bi-directional Automatic Updating of Metadata between AEM Assets and Workfront   | Automatically update metadata between AEM Assets and Workfront.| No  | &#10003;   | &#10003;  |
| Map Workfront Metadata to AEM Assets Folders | Sync Workfront project metadata with linked AEM folders.| No  | No    | &#10003;  |
| AEM Metadata Updates with New Versions| A configuration in AEM can be made to determine whether a newly versioned asset in Workfront also pushes with any changes made to its metadata.  | No  | No    | &#10003;  |
| Automatically Update AEM Metadata on Changes to Custom Forms in Workfront| Workfront is configured such that specified AEM asset metadata properties are mapped to a document custom form. When an asset is initially linked, or when an asset is updated, the values of these metadata properties are copied to the corresponding Workfront document custom form field. Care must be taken to prevent the change from AEM from being sent back to AEM as if it were a change that originated in Workfront. | No  | &#10003;   | &#10003;  |
| Create New Proof Version on Linked Assets  | Upon linking an asset in Workfront a proof can be automatically generated.| No  | &#10003;   | Custom|
| Set Status on Workfront Objects  | Set Workfront object statuses based configurable conditions using AEM workflows| No  | No    | &#10003;  |
| Publish Assets to AEM Publish Environment or Brand Portal| Give Workfront users the option to automatically publish linked assets to an AEM Publish environment or Brand Portal. | No  | No    | &#10003;  |
