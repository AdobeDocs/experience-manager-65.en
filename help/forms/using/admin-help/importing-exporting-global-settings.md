---
title: Importing and exporting global settings
description: You can import and export search template definitions and global settings for Workspace.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_workspace
products: SG_EXPERIENCEMANAGER/6.4/FORMS
exl-id: cdb7ff54-7891-45b1-a921-10b01ef5188d
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Importing and exporting global settings {#importing-and-exporting-global-settings}

You can import and export search template definitions and global settings for Workspace.

>[!NOTE]
>
>The Flex Worksapce is deprecated for AEM forms release.

For example, you can move from a development environment to a production environment by exporting the search template definitions and global settings from one environment and importing them into the other.

After you export the global settings file, you can modify the settings in an XML or text editor. However, the only settings you may want to edit are the JChannelConnectionProperties, formViewOnly, and specialRoutes settings. For more information, see [Workspace global settings](importing-exporting-global-settings.md#workspace-global-settings).


>[!NOTE]
>
>If you change the event properties in the global settings file, you must restart the server.

## Import a search template definition {#import-a-search-template-definition}

1. In administration console, click Services &gt; Workspace &gt; Global Administration.
1. Under Import Search Template Definition box, click Choose File and select the search template. You can only import search template definitions that were originally exported from an instance of Workspace.
1. Click Import.

## Export a search template definition {#export-a-search-template-definition}

1. On the Global Administration page, under Export search template definition, click List All. 
1. In the list of search templates, select the template to export.

   >[!NOTE]
   >
   >You can select more than one template, but only the last template selected is exported.

1. Click Export and then save the file on your computer.

## Import global settings {#import-global-settings}

1. On the Global Administration page, under Import Global Settings, click Choose File and select the global settings file. The global settings file must be in XML format. 
1. Click Import.

## Export global settings {#export-global-settings}

1. On the Global Administration page, under Export Global Settings, click Export. 
1. Save the file on your computer.

## Workspace global settings {#workspace-global-settings}

You can modify the global settings file; however, the only settings you may want to edit are the JChannelConnectionProperties, formViewOnly, and specialRoutes settings.

>[!NOTE]
>
>The Flex Worksapce is deprecated for AEM forms release.

The Workspace global settings file includes the following settings:

### specialRoutes settings {#specialroutes-settings}

The *specialRoutes* settings specify the properties of the special routes, approve and deny, in Workspace. In certain situations, the buttons for these routes appear on the task cards in Workspace, and the user can select them without opening the form. You can modify the specialRoutes settings in the global settings file to add customized names for approve and deny or to create additional routes.

**client_specialRoutes_routes_approve_style:** The name of the style that is in the Workspace theme, which identifies the approve button icons. The style must include values for an enabled icon and disabled icon. To define a style for a custom button, you must use the following template:
` .buttonApprove {  icon: Embed('images/LC_DirectApprove_Sm_N.png');  disabledIcon: Embed('images/LC_DirectApprove_Sm_D.png');  paddingLeft: 5;  }` The Workspace CSS file is embedded in the workspace-theme.swf file, which is in the adobe-workspace-client.ear > adobe-workspace-client.war file. To change the appearance of Workspace, you must recompile the workspace-theme.swf file.

**client_specialRoutes_routes_deny_names:** The variety of strings that a Workbench user can use to be interpreted as "deny". The strings are case-sensitive. For example, the default value is deny. If the Workbench user uses the word Deny in a process, the word will not be recognized. The word Deny must be added to this setting for the route button to be customized and have the style applied to it.

**client_specialRoutes_routes_deny_style:** The name of the style that is in the Workspace theme file, which identifies the deny button icons. The style must include values for an enabled icon and disabled icon. To define a style for a custom button, you must use the following template:
`  .buttonDeny {   icon: Embed('images/LC_DirectDeny_Sm_N.png');   disabledIcon: Embed('images/LC_DirectDeny_Sm_D.png');   paddingLeft: 0;   }` **client_specialRoutes_routes_approve_names:** The variety of strings that a Workbench user can use to be interpreted as "approve". The strings are case-sensitive. For example, the default value is approve. If the Workbench user uses the word Approve in a process, the word will not be recognized. The word Approve must be added to this setting for the route button to be customized and have the style applied to it.

**client_specialRoutes_names:** The keys used to locate the customized string value from the resource files. Each entry in this setting needs to include the values for the names and style.

### JGroup settings {#jgroup-settings}

These settings appear only if you have upgraded from Adobe LiveCycle ES 2.5 or earlier.

**server_remoteevents_ClientTimeoutMilliseconds:** The maximum time the JGroup waits for event messages. This setting should not be changed.

**server_remoteevents_ServerTimeoutMilliseconds:** The timeout for receiving JGroup messages on the server. This option sets the delay for sending messages from the server to the client.

**server_remoteevents_JChannelConnectionProperties:** The connection properties for the JGroup that are used to communicate between the server (on which a service event is processed by the RemoteEvent service) and all instances of Workspace.

You may need to change the UDP values for the multicast IP address (mcast_addr), the multicast IP port (mcast_port), and the TTL for the multicast packets (ip_ttl). By default, the multicast IP address and port values are randomly generated and, generally, the values do not need to be changed. However, if your company has any network policies regarding specific multicast ranges for multicast IP addresses, you may need to change the values.

>[!NOTE]
>
>The TTL must be greater than the number of network switches between the servers in the cluster; however, if the value is set too high, it can cause multicast packets to travel into subnets, where they will be discarded.

The remaining properties in this setting should not be changed.

**server_remoteevents_JGroupName:** The name of the JGroup used for remote event communication. This value is randomly generated to avoid conflicts in clusters. This value should not be changed.

<!--

For additional information on JGroups and Workspace, see [JGroups and AEM forms Workspace - Explained](https://blogs.adobe.com/livecycle/2011/03/jgroups-and-livecycle-workspace-explained.html).

-->

### formView settings {#formview-settings}

**client_formView_openFormInFullScreen:** To display all forms in Workspace in full-screen mode, set this option to true. By default, this option is set to false, and forms are not displayed in full-screen mode. The User service contains an option to open the document associated with a task in full screen mode. This enables you to control the display on a per-process basis.

**client_routes_formViewOnly:** When set to True, routes are not displayed in card view or list view in Workspace. The default value is False, meaning that the routes are displayed in card view and list view.

### Other settings {#other-settings}

**client_mimeTypes_openOutsideBrowser:** The MIME type of documents that opens outside of the Workspace browser instance. If your organization’s processes require an additional MIME type, specify it here. The default values are:

* `application/msword`
* `application/msexcel`
* `application/ms-powerpoint`

**client_customUI_caching:** Caches a custom task user interface.

**server_debugLevel:** Do not change this setting.

**client_pollingInterval:** Sets the polling interval (in seconds) used on the (Deprecated for AEM forms on JEE) Flex Workspace to detect new and modified tasks. The default is 3 seconds. This does not work for AEM Forms Workspace.

**client_systemContext_name:** Specify a custom name (for example, Citizen) to display in the Added By field (in the Attachments tab) for the attachments of a task in AEM Forms Workspace.

To define the custom name:

`<client_systemContext_name>[custom name to display]</client_systemContext_name>`

>[!NOTE]
>
>For the Demo application, the default display name is **Citizen**. For a custom application that you create, the default display name is **System Context Account**.
>
>**client_idleTimeout:** When a user remains inactive for a specific amount of time, AEM Forms Workspace session expires. To enable the feature, add an entry to Global Settings &lt;client_idleTimeout&gt;*IDLE_TIMEOUT_IN_SECONDS*&lt;/client_idleTimeout&gt;. You can specify value 0 to disable the idle timeout. The amount of time is specified in seconds.
