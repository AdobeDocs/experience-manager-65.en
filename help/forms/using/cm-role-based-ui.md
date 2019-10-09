---
title: DO NOT PUBLISH Role based user interface in Correspondence Management
seo-title: DO NOT PUBLISH Role based user interface in Correspondence Management
description: null
seo-description: null
page-status-flag: de-activated
uuid: 60808852-f63f-4c0a-badb-b0af93c995a8
contentOwner: gtalwar
products: SG_EXPERIENCEMANAGER/6.3/FORMS
discoiquuid: 342f111e-f15a-4f9a-8993-f90760363c02
---

# DO NOT PUBLISH Role based user interface in Correspondence Management {#do-not-publish-role-based-user-interface-in-correspondence-management}

In AEM, the Admin can provide role-based access to different user groups perform various actions on different resources. For example, the funtionality to create or edit data dictionaries could be available only to users in a specific user group while other users could only view and user the data dictionaries.

The AEM interface displays the options, such as to create or edit an asset type, based on a user's access level. For example, if a user does not have the permissions to create a data dictionary, the option to create a data dictionary does not appear in the UI.

Although CRX allows you to configure the access rights for both user and groups accounts, this article is about role or user group based access rights.

For more information on groups, permissions, access control lists, and managing users and groups, see [User Administration and Security](/help/sites-administering/security.md).

## Managing Permissions {#managing-permissions}

1. Ensure that the user for which you want to manage the permissions is added to the relevant user group.

   For example, the user John Doe is added to the groups `agents` and `cm-creditcard`. For more information, see Adding Users or Groups to a Group. For more information, see [Managing Users and User Groups](/help/communities/users.md).

   ![]()

1. Create the folders as suited for allowing the intended permissions.

   For example, if an enterprise has home mortgage, credit card, and insurance divisions, they can create folders named `HomeMortgage`, `CreditCard,`and `Insurance` to keep the relevant assets and give access selectively to agents for assets relevant to their departments only. 

1. To access AEM WCM security, do one of the following:

    1. From the Welcome screen or various locations in AEM, click the security icon:  

    1. Navigate directly to `https://[server]:[port]/useradmin`. Be sure you log into AEM as an administrator.

       ![]()

   The left tree lists all the users and groups currently in the system. You can select the columns you want displayed, sort the contents of the columns, and even change the order in which the columns are displayed by dragging the column-header to a new position.

   The tabs provide access to various configurations:

1. In the left tree list, double-tap the name of the relevant group and then select the Permissions tab.

   To locate the name of the group, you can type the name of the group in the space provided.

1. In the permissions tab, navigate to the path you want to add permissions to. The Correspondence Management folders are under the `content/apps/cm/` folder.

   Select the check box in the Member column for the members you want to have permissions to that path. Clear the check box for member you want to remove permissions for. A red triangle appears in the cell you made changes to.

   ![useradmin-creditcard](assets/useradmin-creditcard.png)

   >[!NOTE]
   >
   >The permissions specified in a folder supersede the permissions specified in its subfolders.

1. Tap Save.
1. Step text
1. Step text
1. Step text

