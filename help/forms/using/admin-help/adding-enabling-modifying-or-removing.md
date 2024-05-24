---
title: Adding, enabling, modifying, or removing endpoints
description: Learn how to add, enable, modify and remove endpoints.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_endpoints
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: b7461d5c-95d1-4da2-9d2a-f54c410a87f9
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Adding, enabling, modifying, or removing endpoints {#adding-enabling-modifying-or-removing-endpoints}

## Add an endpoint to a service {#add-an-endpoint-to-a-service}

Endpoints can be added only to services. An endpoint cannot exist alone; it must be associated with a service.

>[!NOTE]
>
>It is recommended that you use unique names when adding endpoints.

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. On the Service Management page, click the service to configure.
1. In the list on the Endpoints tab, select the type of endpoint to add and click Add.
1. Depending on the endpoint type, configure additional endpoint settings.

   [Watched folder endpoint settings](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#watched-folder-endpoint-settings)

   [Email endpoint settings](/help/forms/using/admin-help/configuring-email-endpoints.md#email-endpoint-settings)

   [Configuring Task Manager endpoints](/help/forms/using/admin-help/configuring-task-manager-endpoints.md#configuring-task-manager-endpoints)

   [Remoting endpoint settings](/help/forms/using/admin-help/configuring-remoting-endpoints.md#remoting-endpoint-settings)

1. Click Add.

## Enable or disable an endpoint {#enable-or-disable-an-endpoint}

By default, new endpoints are automatically enabled. But if you have disabled an endpoint, you must enable it for it to be operational.

If you are experiencing problems with services, disable the associated endpoints to better troubleshoot the problem. You may also want to disable endpoints during regular system maintenance or when upgrading a service.

1. In administration console, click Services &gt; Applications and Services &gt; Endpoint Management.
1. On the Endpoint Management page, select the check box for the endpoint to enable or disable and click Enable or Disable.

## Modify an endpoint {#modify-an-endpoint}

>[!NOTE]
>
>The changes you make to an endpoint configuration using administration console are not reflected in the design-time copies of your applications. If you redeploy an application, any change that you made to its endpoints using administration console will be lost.

1. In administration console, click Services &gt; Applications and Services &gt; Endpoint Management.
1. On the Endpoint Management page, click the endpoint to modify.
1. On the Update Endpoint page, modify the endpoint name, description, and settings.

   >[!NOTE]
   >
   >Do not include a &lt; character in the name or description because it will truncate the name or description displayed in Workspace.

1. To save your changes, click Update.

You can also do this task from the Service Management page by selecting a service and then clicking the Endpoints tab.

## Remove an endpoint {#remove-an-endpoint}

1. In administration console, click Services &gt; Applications and Services &gt; Endpoint Management.
1. On the Endpoint Management page, select the check box for the endpoint to remove and click Remove. The endpoint is no longer displayed.
