---
title: Install [!DNL Workfront for Experience Manager enhanced connector]
description: Install [!DNL Workfront for Experience Manager enhanced connector]
role: Admin
feature: Integrations
exl-id: 087bc811-e8f8-4db5-b066-627a9b082f57
hide: yes
---
# Install [!DNL Workfront for Experience Manager enhanced connector] {#assets-integration-overview}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service  |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/assets-view/integrations/workfront-connector-install.html?lang=en)                  |
| AEM 6.5     | This article         |

A user with administrator access in [!DNL Adobe Experience Manager] installs the enhanced connector. Before you install, review the platform support and other [prerequisites for the connector](https://one.workfront.com/s/csh?context=2467&pubname=the-new-workfront-experience).

>[!IMPORTANT]
>
>* Adobe requires deployment and configuration of the [!DNL Adobe Workfront for Experience Manager enhanced connector] only via certified partners or [!DNL Adobe Professional Services]. If deployed and configured without a certified partner or [!DNL Adobe Professional Services], it is not supported by Adobe.
>
>* Adobe may release updates to [!DNL Adobe Workfront] and [!DNL Adobe Experience Manager] that make this connector redundant; if this occurs, customers may be required to transition from the use of this connector.
>
>* Adobe supports enhanced connector versions 1.7.4 and higher. Previous prerelease and custom versions are not supported. To check the enhanced connector version, navigate to the `digital.hoodoo` group available in the left pane in [Package Manager](https://experienceleague.adobe.com/docs/experience-manager-65/administering/contentmanagement/package-manager.html?lang=en). 
>
>* See [Partner certification exam for Workfront for Experience Manager Assets enhanced connector](https://solutionpartners.adobe.com/solution-partners/home/applications/experience_cloud/workfront/journey/dev_core.html). For information about the exam, see [Exam Guide](https://express.adobe.com/page/Tc7Mq6zLbPFy8/).

To install the connector, follow these steps:

1. Download the connector from [[!DNL Software Distribution] link](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/product/assets/workfront-tools.ui.apps.zip).
1. [Configure the firewall](https://one.workfront.com/s/document-item?bundleId=the-new-workfront-experience&topicId=Content%2FAdministration_and_Setup%2FGet_started-WF_administration%2Fconfigure-your-firewall.html).
1. On the Dispatcher, allow HTTP headers named `authorization`, `username`, and `apikey`. Allow `GET`, `POST`, and `PUT` requests to `/bin/workfront-tools`.
1. Ensure that the following paths do not exist in [!DNL Experience Manager] repository:

   * `/apps/dam/gui/coral/components/admin/schemaforms/formbuilder`
   * `/apps/dam/gui/coral/components/admin/folderschemaforms/formbuilder`
   * `/apps/dam/gui/content/foldermetadataschemaeditor`
   * `/apps/dam/cfm/models/editor/components/datatypeproperties`
   * `/apps/settings/dam/cfm/models/formbuilderconfig`

1. Install the package using [!UICONTROL Package Manager]. To know how to install packages, see [Package Manager documentation](/help/sites-administering/package-manager.md).
1. Create `wf-workfront-users` in [!DNL Experience Manager] User Group and assign the permission `jcr:all` to `/content/dam`.

A system user `workfront-tools` is automatically created and the required permissions are managed automatically. All users from [!DNL Workfront] who use the connector are automatically added as a part of this group.

## Configure the connection between [!DNL Experience Manager] and [!DNL Workfront] {#configure-connection}

To create a connection with Workfront, follow these steps:

1. In [!DNL Experience Manager], select **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Workfront Tools Configuration]**.

1. Select `workfront-tools` in the left panel and select **[!UICONTROL Create]** option in the upper-right area of the page.

1. In the **[!UICONTROL Workfront Connection]** dialog, provide the required details of your [!DNL Workfront] deployment, and select **[!UICONTROL Connect to Workfront]** option. Once successfully connected, the [!DNL Workfront] document custom integration is auto-created in the [!DNL Workfront] environment.

   ![Connect [!DNL Experience Manager] and [!DNL Workfront]](/help/assets/assets/wf-connection-config.png)

1. To verify the connection, access it in [!DNL Workfront] and verify that the API key is the same and that the connection is **[!UICONTROL Enabled]**. To do so, select **[!UICONTROL Setup]** > **[!UICONTROL Documents]** > **[!UICONTROL Custom Integrations]** in [!DNL Workfront].

## Update [!DNL Workfront for Experience Manager enhanced connector] {#update-enhanced-connector-for-workfront}

Experience Manager Assets enables you to update the [!DNL Workfront for Experience Manager enhanced connector] from a previous version to the latest version. 

To update the [!DNL Workfront for Experience Manager enhanced connector] to the latest version:

1. Download the latest version of the enhanced connector from [[!DNL Software Distribution] link](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html?package=/content/software-distribution/en/details.html/content/dam/aem/public/adobe/packages/cq650/product/assets/workfront-tools.ui.apps.zip).
1. Install the package using [!UICONTROL Package Manager]. To know how to install packages, see [Package Manager documentation](/help/sites-administering/package-manager.md).
