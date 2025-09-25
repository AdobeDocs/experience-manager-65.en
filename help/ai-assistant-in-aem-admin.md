---
title: Configure AI Assistant in AEM
description: Learn how to set up and configure AI Assistant using the Admin Console in Adobe Experience Manager.
solution: Experience Manager
feature: Authoring, AI Assistant, AI Tools
role: Admin, Architect, Developer, User
exl-id: 06824b3d-f912-4922-8fb6-ee2ca04c6326

---
# Configure AI Assistant in AEM {#aem-ai-asst-admin-setup}

<!-- An Administrator must configure access, permissions, and settings before users in their organization can use the features in AI Assistant in AEM. -->

<!-- badge: label="Beta" type="Positive" -->

To use AI Assistant in AEM (Adobe Experience Manager), permission to access Product Knowledge through the AI Assistant is mandatory. This permission is turned ON by default.

If you want to control who can access Product Knowledge, send an email to [aemaiassistant@adobe.com](mailto:aemaiassistant@adobe.com) from your email address associated with your Adobe ID. Adobe can enable user-level access control. When it is enabled, your Admin can grant user-level access by following the steps described below.

If you requested user-level access control, your organization must opt in by way of the Adobe Admin Console. A product administrator creates (or chooses) a user group and grants it the new "AI Assistant" permission. Anyone added to that group instantly gains access to AI Assistant across AEM. If the goal is company-wide availability, the admin simply assigns all users to that group.

From an employee's perspective, the process is straightforward: identify the product administrator for Adobe Experience Manager in your organization and request to be added to the AI-enabled user group. Once you appear in that group, the Assistant icon shows up automatically the next time you sign in.

Administrators should keep normal Cloud Manager governance in mind. Hold product administrator rights in the Admin Console to create profiles, manage user groups, or edit permissions. If users also need the Assistant's built-in **Create Support Ticket** feature, add the standard **Support Admin** role (standard Admin Console role) to the same individuals or group.

The configuration process of AI Assistant in AEM consists of the following steps:

1. [Create a new product profile in the Adobe Admin Console](#create-profile).
1. [Enable AI Assistant Product Knowledge permission](#enable-permission).
1. [Create a new user group (or use an existing user group)](#create-user-group).
1. [Add users to the user group](#add-users).
1. [Assign the product profile to the user group](#assign-product-profile).

**Prerequisites**

Before you begin, be sure you have met the following prerequisites:

* You must have product administrator rights at a minimum in the Adobe Admin Console.
* You have an understanding of your organization's user management structure.

**Configuration considerations**
    
* Processing time: Resources created in Cloud Manager may take up to 2 minutes to display in the Admin Console for permission configuration.
* Multiple profiles: Users can be part of multiple profiles, and permissions are combined from all assigned profiles.
* Organization scope: Some permissions may apply at the organization level across all programs.
* Predefined profiles: Do not delete predefined permission profiles from the Admin Console.


## 1 - Create a new product profile in the Adobe Admin Console{#create-profile}

1. Follow the detailed instructions in [Create a new product profile in the Adobe Admin Console](https://experienceleague.adobe.com/en/docs/experience-platform/access-control/ui/create-profile) found in the Experience Platform documentation.

1. When creating the new product profile, you can use the following suggested values for AI Assistant.

    | Text field | Suggested value |
    | --- | --- |
    | Product profile name | `AI Assistant in AEM` (or your preferred descriptive name) |
    | Display name (optional) | `AI Assistant` |
    | Description (optional) | `Product profile for managing AI Assistant in AEM access` |
    | Notification | Configure based on your organization's preferences |


## 2 - Enable AI Assistant Product Knowledge permission{#enable-permission}

The process for assigning custom permissions to product profiles follows the standard Adobe Cloud Manager custom permissions workflow.

Reference article: [Assign custom permissions to the new product profile](https://experienceleague.adobe.com/en/docs/experience-manager-cloud-manager/content/requirements/custom-permissions#assign-permissions)

1. In the Admin Console, click the name of your newly created product profile (`AI Assistant in AEM`)

    ![Screenshot](/help/assets/assets-ai/ai-assistant-console.png)

1. To view the list of editable permissions, click the **Permissions** tab.

1. In the table list, locate the `AI Assistant Product Knowledge` permission.

    ![AI Assistant Permissions tab in Admin Console](/help/assets/assets-ai/ai-assistant-permission.png)

1. To the right of the permission name, click ![Pencil icon or Edit icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Edit_18_N.svg).

1. On the **Edit Permissions for AI Assistant** page, turn on the **AI Assistant Product Knowledge** toggle. 

    ![Edit Permissions page for AI Assistant Product Knowledge toggle option](/help/assets/assets-ai/ai-assistant-prod-knowledge.png)

1. In the lower-right corner of the page, click **Save**.

    Your product profile now has AI Assistant Product Knowledge permission enabled.


## 3 - Create a new user group (or use an existing user group){#create-user-group}

1. Do one of the following:

>[!BEGINTABS]

>[!TAB Create a new user group]

1. In the Admin Console, click **Users** > **User groups**.

    ![User groups](/help/assets/assets-ai/ai-assistant-user-groups.png)

1. On the **User Groups** page, click **New user group**.

    ![New user group button on the User groups page](/help/assets/assets-ai/ai-assistant-new-user-group.png)

1. On the **Create a new user group** page, provide the following information:
 
    | Option | Suggested value |
    | --- | --- |
    | User group name | `AI Assistant in AEM` (or your preferred name) |
    | Description (optional) | `User group for managing AI Assistant in AEM access` |

    ![Create a new user group page](/help/assets/assets-ai/ai-assistant-create-new-user-group.png)

1. In the lower right corner of the page, click **Save**.

>[!TAB Use an existing user group] 

You can use an existing AEM user group if it meets AI Assistant access requirements, instead of creating a new group.

>[!ENDTABS]

## 4 - Add users to the user group{#add-users}

1. Do one of the following:

>[!BEGINTABS]

>[!TAB Add individual users]

1. On the **User groups** page, in the **Group name** table, click the user group name that you newly created, or an existing user group name.

    ![User groups page showing AI Assistant in AEM user group name in the table](/help/assets/assets-ai/ai-assistant-user-group-name-in-table.png)

1. In the **User groups** page for the **AI Assistant in AEM**, click the **Users** tab, then click **Add users**.

    ![AI Assistant in AEM user groups page, showing the Users tab and the Add users buttion](/help/assets/assets-ai/ai-assistant-add-users.png)

1. On the **`Add users to this user group`** page, search for and select users who need access to AI Assistant in AEM.

    ![Add users to this user group page](/help/assets/assets-ai/ai-assistant-add-users-to-this-group.png)

1. In the lower-right corner of the page, click **Save**.
1. Now, [assign the product profile to the user group](#assign-product-profile).

>[!TAB Add users in bulk]

You can use the bulk upload feature in the Admin Console.
    
1. Prepare a CSV file with user information.
1. Use the **`Add users by CSV`** option for efficient bulk addition.
1. Now, [assign the product profile to the user group](#assign-product-profile).

>[!ENDTABS]


## 5 - Assign the product profile to the user group{#assign-product-profile}

This step follows the standard Adobe Admin Console workflow for assigning product profiles to user groups.

Reference article: [Manage product profiles for enterprise users](https://helpx.adobe.com/enterprise/using/manage-product-profiles.html)

1. While still in your AI Assistant in AEM user group from [4 - Add users to the user group](#add-users), click the **Assigned product profiles** tab.
1. Click **Assign profile**.

    ![AI Assistant in AEM user group page with Assigned product profiles tab selected](/help/assets/assets-ai/ai-assistant-assign-profile.png)

1. On the **Assign products and profiles** page, in the **Select product profiles** dialog box, search for and select your **AI Assistant** product profile.

    ![The "Assign products and profiles" page, showing the "Select product profiles" dialog box, and the "AI Assistant" product profile selected](/help/assets/assets-ai/ai-assistant-select-product-profile.png)

1. Near the lower-right corner of the dialog box, click **Apply**.
1. Near the lower-right corner of the **Assign products and profiles** page, click **Save**.

    ![AI Assistant product profile shown assigned to AI Assistant in AEM user group](/help/assets/assets-ai/ai-assistant-profile-assigned-to-user-group.png)


## Verify the configuration

* Check that your product profile shows the correct number of assigned user groups.
* Verify that the user group shows the correct number of users.
* Confirm that AI Assistant Product Knowledge permission is enabled and properly configured.


## Test the configuration

Have a user from the assigned group do the following:

1. Log into AEM.
2. Verify that AI Assistant features are accessible.
3. Test the functionality of AI Assistant to ensure proper activation.

## See also 

* [AI Assistant in AEM](/help/ai-assistant-in-aem.md)
* [Adobe Experience Platform Access Control](https://experienceleague.adobe.com/en/docs/experience-platform/access-control/ui/overview)
<!-- * [Cloud Manager Custom Permissions](/help/implementing/cloud-manager/custom-permissions.md) -->
