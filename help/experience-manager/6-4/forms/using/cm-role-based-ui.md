---
title: [DO NOT PUBLISH] Role based user interface in Correspondence Management
seo-title: [DO NOT PUBLISH] Role based user interface in Correspondence Management
description: null
seo-description: null
page-status-flag: de-activated
uuid: c10551d5-da1a-48a0-8483-864e7f7af869
contentOwner: gtalwar
products: SG_EXPERIENCEMANAGER/6.3/FORMS
discoiquuid: e857bc31-2cd0-466a-8e41-a93be6c17813
index: y
internal: n
snippet: y
---

# [DO NOT PUBLISH] Role based user interface in Correspondence Management{#do-not-publish-role-based-user-interface-in-correspondence-management}

In AEM, the Admin can provide role-based access to different user groups perform various actions on different resources. For example, the funtionality to create or edit data dictionaries could be available only to users in a specific user group while other users could only view and user the data dictionaries.

The AEM interface displays the options, such as to create or edit an asset type, based on a user's access level. For example, if a user does not have the permissions to create a data dictionary, the option to create a data dictionary does not appear in the UI.

Although CRX allows you to configure the access rights for both user and groups accounts, this article is about role or user group based access rights.

For more information on groups, permissions, access control lists, and managing users and groups, see [User Administration and Security](/6-4/sites/administering/using/security.md).

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2017-09-11T08:57:56.799-0400
two use cases 1- cm - different modules 2- within CM multiple folders for similar type of assets
-->

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2017-09-14T09:06:01.375-0400
So, the UI filtering works for both user and group accounts?
-->

<!--
Comment Type: annotation
Last Modified By: gtalwar
Last Modified Date: 2017-09-14T09:20:08.891-0400
If customer wants to have different persona for different asset types within the same console, and wants to hide some actions for one asset type over another, that can not be achieved by following this user story. For eg. If customer wants to hide actions for Adaptive Document and display all actions for form set, this can not be achieved by this user story. The reason for the same is that since these different asset ty
-->

## Managing Permissions {#managing-permissions}

1. Ensure that the user for which you want to manage the permissions is added to the relevant user group.

   For example, the user John Doe is added to the groups `agents` and `cm-creditcard`. For more information, see Adding Users or Groups to a Group. For more information, see [Managing Users and User Groups](/6-4/communities/using/users.md).

   ![]()

1. Create the folders as suited for allowing the intended permissions.

   For example, if an enterprise has home mortgage, credit card, and insurance divisions, they can create folders named `HomeMortgage`, `CreditCard,`and `Insurance` to keep the relevant assets and give access selectively to agents for assets relevant to their departments only.

   <!--
   Comment Type: annotation
   Last Modified By: gtalwar
   Last Modified Date: 2017-09-25T10:18:53.268-0400
   more information needs to be added about creating the folders.
   -->

1. To access AEM WCM security, do one of the following:

    1. From the Welcome screen or various locations in AEM, click the security icon:  

    1. Navigate directly to http://[server]:[port]/useradmin. Be sure you log into AEM as an administrator.

       ![]()

   The left tree lists all the users and groups currently in the system. You can select the columns you want displayed, sort the contents of the columns, and even change the order in which the columns are displayed by dragging the column-header to a new position.

   The tabs provide access to various configurations:

1. In the left tree list, double-tap the name of the relevant group and then select the Permissions tab.

   To locate the name of the group, you can type the name of the group in the space provided.

1. In the permissions tab, navigate to the path you want to add permissions to. The Correspondence Management folders are under the `content/apps/cm/` folder.

   Select the check box in the Member column for the members you want to have permissions to that path. Clear the check box for member you want to remove permissions for. A red triangle appears in the cell you made changes to.

   ![](assets/useradmin-creditcard.png)

   >[!NOTE]
   >
   >The permissions specified in a folder supersede the permissions specified in its subfolders.

1. Tap Save.
1. Step text
1. Step text
1. Step text

