---
title: Install Workfront for Experience Manager enhanced connector
description: Install Workfront for Experience Manager enhanced connector
contentOwner: AG
role: Admin
feature: Asset Management
---

# Install [!DNL Workfront for Experience Manager enhanced connector] {#assets-integration-overview}

[!DNL Adobe Experience Manager] administrators install the enhanced connector. Before you install, review the platform support and other prerequisites at [Enhanced Connector landing page](https://www.adobe.com).

<!-- TBD: 
Add the landing page link shared by Courtney above.
Add the SD link below.
-->

To install the connector, follow these steps:

1. Download the enhanced connector from [Software Distribution link](https://www.adobe.com).

1. [Configure the firewall](https://one.workfront.com/s/document-item?bundleId=the-new-workfront-experience&topicId=Content%2FAdministration_and_Setup%2FGet_started-WF_administration%2Fconfigure-your-firewall.html).

1. On the dispatcher, allow HTTP headers named `authorization`, `username`, and `apikey`. Allow `GET`, `POST`, and `PUT` requests to `/bin/workfront-tools`.

1. Ensure that the following paths do not exist in [!DNL Experience Manager] repository:

   * `/apps/dam/gui/coral/components/admin/schemaforms/formbuilder`
   * `/apps/dam/gui/coral/components/admin/folderschemaforms/formbuilder`
   * `/apps/dam/gui/content/foldermetadataschemaeditor`
   * `/apps/dam/cfm/models/editor/components/datatypeproperties`
   * `/apps/settings/dam/cfm/models/formbuilderconfig`

1. Install the package using [!UICONTROL Package Manager]. To know how to install packages, see [Package Manager documentation](/help/sites-administering/package-manager.md).

1. Create `wf-workfront-users` in [!DNL Experience Manager] User Group and assign the permission `jcr:all` to `/content/dam`.

A system user `workfront-tools` is automatically created and the required permissions are managed automatically. All users from [!DNL Workfront] who use the enhanced connector are automatically added as a part of this group.

## Configure the connection between [!DNL Experience Manager] and [!DNL Workfront] {#configure-connection}

To create a connection with Workfront, follow these steps:

1. In [!DNL Experience Manager], select **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Workfront Tools Configuration]**.

1. Select `workfront-tools` in the left panel and select **[!UICONTROL Create]** option in the upper-right area of the page.

1. In the **[!UICONTROL Workfront Connection]** dialog, provide the required details of your [!DNL Workfront] deployment, and select **[!UICONTROL Connect to Workfront]** option. Once successfully connected, the [!DNL Workfront] document custom integration is auto-created in the [!DNL Workfront] environment.

   ![Connect [!DNL Experience Manager] and [!DNL Workfront]](/help/assets/assets/wf-connection-config.png)

1. To verify the connection, access it in [!DNL Workfront] and verify that the API key is the same and that the connection is **[!UICONTROL Enabled]**. To do so, select **[!UICONTROL Setup]** > **[!UICONTROL Documents]** > **[!UICONTROL Custom Integrations]** in [!DNL Workfront].

<!--
Borrow the instructions from internal wiki https://wiki.corp.adobe.com/pages/viewpage.action?spaceKey=AdobeDAM&title=Workfront+for+Experience+Manager+enhanced+connector+%7C+Internal+access
-->
