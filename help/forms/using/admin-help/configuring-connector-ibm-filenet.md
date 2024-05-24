---
title: Configuring Connector for IBM FileNet
description: Learn how to configure the Connector for IBM FileNet to enable communication between AEM forms and IBM FileNet.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/connecting_to_a_content_management_system
products: SG_EXPERIENCEMANAGER/6.5/FORM
exl-id: f4045df5-a35b-41d7-910e-971017148597
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Data Connectors
role: User, Developer
---
# Configuring Connector for IBM FileNet {#configuring-connector-for-ibm-filenet}

Connector for IBM FileNet enables communication between AEM forms and IBM FileNet. For additional background information, see "Connectors for ECM" in [Services Reference](https://www.adobe.com/go/learn_aemforms_services_63).

>[!NOTE]
>
>In earlier releases, assets could be stored in an ECM repository. In this release, assets are stored in the AEM forms native repository and the Repository Provider services have been deprecated. The migration of assets from an ECM repository to the AEM forms repository is done when you perform an upgrade to AEM forms. For more information, see the AEM forms Upgrade guide for your application server.

## Configure the connection to the Content Engine {#configure-the-connection-to-the-content-engine}

IBM FileNet P8 Content Engine provides software services for managing enterprise content and customer-defined business objects in FileNet content repositories.

1. In administration console, click Services &gt; Connector for IBM FileNet.
1. In the Content Engine URL box, enter the complete connection URL. For example:

   If you are using FileNet Content Engine 4.x with CEWS transport, enter:

   `cemp:https://ContentEngineHostNameorIP:port/wsi/FNCEWS40DIME?jaasConfigurationName=FileNetP8WSI`

   If you are using FileNet Content Engine 4.x with EJB transport, which is supported on WebLogic only, enter:

   `cemp:t3://ContentEngineHostNameorIP:port/FileNet/Engine?jaasConfigurationName=FileNetP8Engine`

1. In the Credential Protection Scheme list, select one of these protection levels:

    * **Clear:** Sends credentials across the network in an unprotected mode
    * **Symmetric:** Sends encrypted credentials across the network

1. In the Encryption File Location box, enter the path to the encryption file:

    * If you selected Clear as the credential protection scheme, this keyword and its value are ignored.
    * If you selected Symmetric as the credential protection scheme, the path you enter points to the location of an encryption file on the Forms Server that contains the cryptographic keys to be used.

1. In the Default Object Store box, enter the object store connector that AEM forms connects to by default.
1. In the User Name box, enter the user name of a user who has access rights to the default object store that you specified in the previous step.
1. In the Password box, enter the password for the user and click Save.

## Configure the process engine settings {#configure-the-process-engine-settings}

Connector for IBM FileNet contains the Process Engine Connector for IBM FileNet service, which is used to interact with the IBM FileNet Process Engine. You can configure settings for this service.

1. In administration console, click Services &gt;Connector for IBM FileNet.
1. To enable the use of the Process Engine Connector for IBM FileNet service, select Use Process Engine Connector Service.
1. In the Process Router/Connection Point box, enter the host name or IP address and port number followed by the name of the process router. For example:

   `rmi://ProcessEngineHostNameorIP:port/Name`

1. In the User Name box, enter the user name that is used to connect to the process engine.
1. In the Password box, enter the password that is used to connect to the process engine and click Save.

## Validation of service settings {#validation-of-service-settings}

If you enter an incorrect user name or password when configuring the connection to the Content Engine or the process engine settings, you will get the following results, depending on whether the services are currently running:

* If both the Repository Provider service for IBM FileNet and the Content Repository Connector for IBM FileNet service are stopped, when you save the service configuration information, no error appears. However, the next time you start the service, an exception will be thrown and the service will not start.
* If either the Repository Provider service for IBM FileNet or the Content Repository Connector for IBM FileNet service are started, when you save the service configuration information, the service attempts to validate the credential information immediately. In this case, an error occurs and the configuration information is not saved.

## Change the repository service provider {#change-the-repository-service-provider}

You can configure which repository service provider to use with FileNet. Repository service calls are delegated to the provider you configure.

The following options are available:

**Current Repository Provider Name:** The name of the current repository service provider

**IBM FileNet Repository Provider:** Makes the FileNet repository provider the provider for the repository. This option has been deprecated.

**repository provider:** Makes the native repository provider the provider for the repository

>[!NOTE]
>
>To select a repository service provider other than those listed, configure RepositoryService in Applications and Services. <!-- Fix broken link(See Managing Services) -->

1. In administration console, click Services > Connector for IBM FileNet.
1. In the Repository Service Provider Information area, select the alternative repository service provider, and then click Save.
