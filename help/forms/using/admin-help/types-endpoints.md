---
title: Types of endpoints
description: Learn about the different types of endpoints. Different types of endpoints such as Email, Watched folder and many more, can be added to services.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_endpoints
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 380cab7f-e7f7-4cb7-bd20-ea530a349fac
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Types of endpoints {#types-of-endpoints}

Before a service can be used, you must configure and enable an endpoint. An endpoint specifies how a service is to be invoked.

>[!NOTE]
>
>In Workbench, endpoints are called start points.

The following types of endpoints can be added to services. Not all services support all endpoints:

**Email:** Enables a user to invoke a service by sending an email message with one or more file attachments to a specified email account. Before you configure an email endpoint, you must configure the required email accounts. (See Configuring email endpoints.)

**Watched Folder:** Enables a user to invoke a service by placing a file in a folder, which is scanned at a defined interval. (See Configuring watched folder endpoints.)

**TaskManager:** Enables a Workspace user to invoke the service.

**Remoting:** Enables an application built with Flex to invoke the service using (Deprecated for AEM forms) AEM forms Remoting. A remoting endpoint is automatically created for each activated service. A Flex destination that has the same name as the endpoint is created, and Flex clients can create remote objects that point to this destination to invoke operations on the relevant service.

**SOAP:** Enables a client application developed using the AEM forms programming APIs to invoke the service using SOAP mode. A SOAP endpoint is automatically created for each activated service.

**note**: *Security can be removed from document security documents when the SOAP endpoint is used while viewing the documents in Adobe Acrobat or Adobe Reader. For details on how to disable SOAP enpoints on your LCRM documents, see [Disable SOAP endpoints for document security documents](/help/forms/using/admin-help/configuring-client-server-options.md#disable-soap-endpoints-for-document-security-documents)*

**EJB:** Enables a client application developed using the AEM forms programming APIs to invoke the service using Enterprise JavaBeans (EJB) mode. An EJB endpoint is automatically created for each activated service.

**WSDL:** Enables a client application developed using the AEM forms programming APIs to invoke the service using Web Service Definition Language (WSDL). The Core Configurations page contains an option to enable WSDL generation for all services that are part of AEM forms. (See Configure general AEM forms settings.)

**REST:** Processes created in Workbench can be configured so that you can invoke them through Representational State Transfer (REST) requests. REST requests are sent from HTML pages. That is, you can invoke an AEM forms process directly from a web page using a REST request.

The Email, TaskManager, Watched Folder, and Remoting endpoints expose only a specific operation of the service. Adding these endpoints requires a second configuration step to select a method to invoke the service, setting configuration parameters, and specifying input and output parameter mappings.
