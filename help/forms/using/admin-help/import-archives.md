---
title: Import and manage archives
description: Learn how to import and manage archives. Archives imports and manages LCAs created in workbench. You can import, configure, use and delete an archive. 
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/importing_and_managing_applications_and_archives
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 0c15677a-ee17-425e-a261-fb3ae8688eb2
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Import and manage archives {#import-and-manage-archives}

Use the archives tab to import and manage LCAs that were created in workbench.

## Import an archive {#import-an-archive}

1. In administration console, click Services &gt; Applications and Services &gt; Application Management and click thearchives tab.
1. Click Import.
1. Click Browse to locate the archive to import, and then click Preview.
1. Review the list of resources and objects that will be installed with the archive. Ensure that there are no conflicts with existing resources, objects, and service configurations because no undo capability is available.

   If you select to import the service configurations, AEM forms imports all the process configuration files (endpoints, security profiles, and service configuration parameters) used by the processes in the LCA.

1. Click Import.
1. Review the import results and either click Skip Configuration to finish the import process or click Configure to configure the archive.

   >[!NOTE]
   >
   >If you click Skip Configuration, you can configure the archive later.

1. If you click Configure, the Configure Endpoints page appears, where you can make any changes that you require:

    * To rename an endpoint or edit its description, click it.
    * To add a Task Manager endpoint, click Add TaskManager. For details about the Task Manager settings, see [Configuring Task Manager endpoints](/help/forms/using/admin-help/configuring-task-manager-endpoints.md#configuring-task-manager-endpoints).
    * To add a Watched Folder endpoint, click Add WatchedFolder. For details about the Watched Folder settings, see [Watched folder endpoint settings](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#watched-folder-endpoint-settings).
    * To add an Email endpoint, click Add Email. For details about the Email settings, see [Email endpoint settings](/help/forms/using/admin-help/configuring-email-endpoints.md#email-endpoint-settings).
    * To add an EJB endpoint, click Add EJB and specify a name and description for the endpoint.
    * To add a SOAP endpoint, click Add SOAP and specify a name and description for the endpoint.
    * To add a Remoting endpoint, click Add Remoting. For details about the Remoting settings, see [Remoting endpoint settings](/help/forms/using/admin-help/configuring-remoting-endpoints.md#remoting-endpoint-settings).
    * To add a REST endpoint, click Add REST and specify a name and description for the endpoint. Note the REST invocation URL displayed on the Add REST Endpoint page.
    * To remove an endpoint, select the checkbox next to it and click Remove.

1. Click Next.
1. If a process or service in the LCA has configuration parameters, a Configure Parameters page appears, where you configure the service parameters and click Next.
1. On the Configure Security Profile page, make any changes that you require:

    * **Require callers to authenticate:** This setting indicates whether the service can be invoked with or without credentials.

      If *Callers are currently required to authenticate* is displayed, the caller of the service must be authenticated and the user principal for that caller must be authorized to invoke the service; otherwise, the invocation attempt will be refused. To remove the need to authenticate, click Allow Unauthenticated Callers.

      If *Callers are not required to authenticate* is displayed, the caller of the service does not need to be authenticated. The invocation of the service will always succeed because there is no authorization check. To require authentication, click Require Callers to Authenticate.

    * **Run As:** Specifies run-time identity used by a service after it has been invoked. To change this option, click Change. Choose from the following options:

      **Unspecified:** The default behavior is used.

      **Invoker:** Uses the same identity as the user who invoked the service.

      **System:** Runs the service with full privileges. This is the default setting for long-lived processes.

      **Named User:** Enables you to run the service as a specific user. This is the default setting for short-lived processes. When you select this option, click Select User to display the Select Principal page, where you can search for and select the user.

    * To add a principal to the security profile, click Add Principal and select the user or group to add as a principal. Click Next and then select the permissions you want to assign to this principal:

      **INVOKE_PERM:** To invoke all operations on the service

      **MODIFY_CONFIG_PERM:** To modify the configuration of a service

      **SUPERVISOR_PERM:** To view process instance data for a service that is created from a process

      **START_STOP_PERM:** To start and stop a service

      **ADD_REMOVE_ENDPOINTS_PERM:** To add, remove, and modify endpoints for a service

      **CREATE_VERSION_PERM:** To create a version of the service

      **DELETE_VERSION_PERM:** To delete a version of the service

      **MODIFY_VERSION_PERM:** To modify a version of the service

      **READ_PERM:** To view the service

      Click Finished to add the principal to the security profile.

1. Click Finished to complete the configuration.

## Configure the AEM forms that are part of an archive file {#configure-the-aem-forms-that-are-part-of-an-archive-file}

1. In administration console, click Services &gt; Applications and Services &gt; Application Management and click thearchives tab.
1. On the Archive Management page, select the archive file to configure.
1. On the View Archive page, select the highlighted archive resource.
1. Configure the imported process archive file.

## Use the configuration wizard to configure the AEM forms that are part of an archive file {#use-the-configuration-wizard-to-configure-the-aem-forms-that-are-part-of-an-archive-file}

1. In administration console, click Services &gt; Applications and Services &gt; Application Management and click thearchives tab.
1. Click Configure next to the archive file to configure.
1. The Configure Endpoints page appears, where you can make any changes that you require:

    * To rename an endpoint or edit its description, click it.
    * To add a Task Manager endpoint, click Add TaskManager. For details about the Task Manager settings, see [Configuring Task Manager endpoints](/help/forms/using/admin-help/configuring-task-manager-endpoints.md#configuring-task-manager-endpoints).
    * To add a Watched Folder endpoint, click Add WatchedFolder. For details about the Watched Folder settings, see [Watched folder endpoint settings](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#watched-folder-endpoint-settings).
    * To add an Email endpoint, click Add Email. For details about the Email settings, see [Email endpoint settings](/help/forms/using/admin-help/configuring-email-endpoints.md#email-endpoint-settings).
    * To add an EJB endpoint, click Add EJB and specify a name and description for the endpoint.
    * To add a SOAP endpoint, click Add SOAP and specify a name and description for the endpoint.
    * To add a Remoting endpoint, click Add Remoting. For details about the Remoting settings, see [Remoting endpoint settings](/help/forms/using/admin-help/configuring-remoting-endpoints.md#remoting-endpoint-settings).
    * To add a REST endpoint, click Add REST and specify a name and description for the endpoint. Note the REST invocation URL displayed on the Add REST Endpoint page.
    * To remove an endpoint, select the checkbox next to it and click Remove.

1. Click Next.
1. If a process or service in the LCA has configuration parameters, a Configure Parameters page appears, where you configure the service parameters and click Next.
1. On the Configure Security Profile page, you can make any changes that you require:

    * **Require callers to authenticate:** This setting indicates whether the service can be invoked with or without credentials.

      If *Callers are currently required to authenticate* is displayed, the caller of the service must be authenticated and the user principal for that caller must be authorized to invoke the service; otherwise, the invocation attempt will be refused. To remove the need to authenticate, click Allow Unauthenticated Callers.

      If *Callers are not required to authenticate* is displayed, the caller of the service may or may not be authenticated. The invocation of the service will always succeed because there is no authorization check. To require authentication, click Require Callers to Authenticate.

    * **Run As:** Specifies run-time identity used by a service after it has been invoked. To change this option, click Change. Choose from the following options:

      **Unspecified:** The default behavior is used.

      **Invoker:** Uses the same identity as the user who invoked the service.

      **System:** Runs the service with full privileges. This is the default setting for long-lived processes.

      **Named User:** Enables you to run the service as a specific user. This is the default setting for short-lived processes. When you select this option, click Select User to display the Select Principal page, where you can search for and select the user.

    * To add a principal to the security profile, click Add Principal and select the user or group to add as a principal. Click Next and then select the permissions you want to assign to this principal:

      **INVOKE_PERM:** To invoke all operations on the service

      **MODIFY_CONFIG_PERM:** To modify the configuration of a service

      **SUPERVISOR_PERM:** To view process instance data for a service that is created from a process

      **START_STOP_PERM:** To start and stop a service

      **ADD_REMOVE_ENDPOINTS_PERM:** To add, remove, and modify endpoints for a service

      **CREATE_VERSION_PERM:** To create a version of the service

      **DELETE_VERSION_PERM:** To delete a version of the service

      **MODIFY_VERSION_PERM:** To modify a version of the service

      **READ_PERM:** To view the service

      Click Finished to add the principal to the security profile.

## Remove an archive {#remove-an-archive}

>[!NOTE]
>
>To remove an archive containing assets stored in a third-party repository (EMC Documentum Content Server, IBM FileNet Content Manager, or IBM Content Manager), you must also delete the asset files from the repository using Workbench.

1. In administration console, click Services &gt; Applications and Services &gt; Archive Management.
1. On the Archive Management page, select the check box for the archive to remove and click Remove.
