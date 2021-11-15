---
title: Install Workfront for Experience Manager enhanced connector
description: Install Workfront for Experience Manager enhanced connector
contentOwner: AG
role: Admin
feature: Asset Management
---

# Install [!DNL Workfront for Experience Manager enhanced connector] {#assets-integration-overview}

Adobe Experience Manager administrators install the enhanced connector. Before you install, review the platform support and other prerequisites at [Enhanced Connector landing page](https://www.adobe.com).

<!-- TBD: Add the SD link below.
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

1. 

<!--
Borrow the instructions from internal wiki  https://wiki.corp.adobe.com/pages/viewpage.action?spaceKey=AdobeDAM&title=Workfront+for+Experience+Manager+enhanced+connector+%7C+Internal+access
More info is available at https://wiki.corp.adobe.com/pages/viewpage.action?pageId=2445063100 
-->
