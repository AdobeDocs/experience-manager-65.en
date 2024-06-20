---
title: Configuring Connector for EMC Documentum
description: Learn how to configure the Connector for EMC Documentum to enable communication between AEM forms and EMC Documentum.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/connecting_to_a_content_management_system
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: a31a496f-87b9-43c0-a98c-5f6ca5d11690
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Configuring Connector for EMC Documentum {#configuring-connector-for-emc-documentum}

Connector for EMC Documentum enables communication between AEM forms and EMC Documentum. For additional background information, see "Connectors for ECM" in [Services Reference](https://www.adobe.com/go/learn_aemforms_services_63).

Setting up Connector for EMC Documentum involves configuring the server connection and the repository credentials.

>[!NOTE]
>
>In earlier releases , assets could be stored in an ECM repository. In the current release, assets are stored in the AEM forms native repository and the Repository Provider services have been deprecated. The migration of assets from an ECM repository to the AEM forms repository is done when you perform an upgrade to AEM forms. For more information, see the AEM forms Upgrade guide for your application server.

## Configuring the server connection {#configuring-the-server-connection}

This topic describes the tasks for Connector for EMC Documentum that you can perform on the Configuration Settings page.

>[!NOTE]
>
>If you are configuring all the settings simultaneously, you only need to click Save once.

### Configure the server {#configure-the-server}

You need to configure the connection broker server information. This information is necessary for connecting to the Documentum content repositories and starting the Connector for EMC Documentum.

1. In administration console, click Services &gt; Connector for EMC Documentum &gt; Configuration Settings.
1. In the Documentum Configuration Information area, enter the host name or IP address and the port number of the connection broker. The port number must be a positive integer (for example, 1489).
1. Click Save.

### Configure principal credentials {#configure-principal-credentials}

When configuring the principal credentials, the repository name you provide depends on whether an explicit repository name is provided during login.

If you enter an incorrect user name or password, you will get the following results, depending on whether the service is currently running:

* If both the EMC Documentum Repository Provider service and the EMC Documentum Content Repository Connector service are stopped, when you save the service configuration information, no error appears. However, the next time you start the service, an exception will be thrown and the service will not start.
* If either the EMC Documentum Repository Provider service or the EMC Documentum Content Repository Connector service are started, when you save the service configuration information, the service attempts to validate the credential information immediately. In this case, an error occurs and the configuration information is not saved.

1. In administration console, click Services &gt; Connector for EMC Documentum &gt; Configuration Settings.
1. In the Documentum Principal Credentials Information area, type the user name and password of a user with super-administrator privileges.
1. If an explicit repository name is not provided during login, enter the repository name that the credentials are associated with.
1. Click Save.

### Change the repository service provider {#change-the-repository-service-provider}

You can configure which repository service provider to use with Documentum. Repository service calls are delegated to the provider you configure. The following options are available:

**Current Repository Service Provider Name:** The name of the current repository service provider

**ECM Documentum Repository Provider:** Makes the Documentum repository provider the provider for the repository. This option has been deprecated

**repository provider:** Makes the native repository provider the provider for the repository

>[!NOTE]
>
>To select a repository service provider other than those listed, configure RepositoryService in Applications and Services > Service Management. <!-- Fix broken link (See Managing Services) -->.

1. In administration console, click Services > Connector for EMC Documentum > Configuration Settings.
1. In the Repository Service Provider Information area, select the alternative repository service provider.
1. Click Save.

## Configuring repository credentials {#configuring-repository-credentials}

The Documentum credential information is used in the AEM forms system context. Repository credentials are specific to particular repositories in Documentum. You can provide credentials for any number of repositories; however, you can specify only one set of credentials per repository.

### Add a repository credential {#add-a-repository-credential}

1. In administration console, click Services &gt; Connector for EMC Documentum &gt; Repository Credentials Settings.
1. Click Add. The Documentum System Credentials Information page appears.
1. Enter a name for the repository.
1. Enter a user name and password.
1. Click Save.

If the Content Repository Connector for EMC Documentum service and/or the Repository Service for EMC Documentum are running, the credential information is verified against the specified repository before is stored in the database. If the credentials are invalid or exist, an error message is displayed.

### Remove a repository credential {#remove-a-repository-credential}

1. In administration console, click Services &gt; Connector for EMC Documentum &gt; Configuration Settings.
1. Select the check box next to the repository to remove credentials from and click Remove. The credentials for the selected repository are removed from the database.

### Change the user name and password for a repository credential {#change-the-user-name-and-password-for-a-repository-credential}

1. In administration console, click Services &gt; Connector for EMC Documentum &gt; Configuration Settings.
1. Click the name of the repository to edit credentials for.
1. Change the repository's user name or password, or both. (The repository name is read-only.)
1. Click Save.

If the Content Repository Connector for EMC Documentum service and/or the Repository Service for EMC Documentum are running, the credential information is verified against the specified repository before is stored in the database. If the credentials are invalid or exist, an error message is displayed.

## Enable the request for sharing of Workspace task queues {#enable-the-request-for-sharing-of-workspace-task-queues}

Some manual steps are required to ensure that the Request for Sharing of Task Queue feature in Workspace functions properly with Connector for EMC Documentum.

1. After AEM forms is deployed and Workbench is installed, log in to Workbench and open the Resources view. You will determine where the QueueSharing.swf file is located from this view.
1. Drag the QueueSharing.swf file from the Resources View to the Windows desktop or an equivalent location, depending on your operating system.
1. In administration console, click Services &gt; Connector for EMC Documentum &gt; Configuration Settings.
1. Under Repository Service Provider Information, change the configured repository provider to EMC Documentum Repository Provider.
1. Start Workbench and copy the QueueSharing.swf file from the location where you originally copied it to (for example, the Windows desktop or another location) into an existing directory inside the EMC Documentum repository.
1. In the Workbench Processes view, open the Queue Sharing process.
1. In the Variables view, open the properties of the "theForm" variable and change the URI to match the path where you placed the QueueSharing.swf file in step 5.
1. Save the process.
1. Migrate the process to the production environment according to your organization's policy.
