---
title: Adding and configuring users 
seo-title: Adding and configuring users 
description: The User Management settings in the administration console allow you to create or delete users  and configure other user settings.
seo-description: The User Management settings in the administration console allow you to create or delete users  and configure other user settings.
uuid: fe650cdb-7d0d-4f38-9899-e5349559ed32
contentOwner: admin
geptopics: SG_AEMFORMS/categories/setting_up_and_organizing_users
discoiquuid: 20ca99e3-4843-4254-b3e9-0255cc752363
exl-id: 50eea35d-d844-4f4b-9cbe-7d84bd6b1e3b
---
# Adding and configuring users {#adding-and-configuring-users}

User and group information is maintained in a third-party storage system, such as an LDAP directory. User Management does not write to the third-party storage system. Instead, User Management synchronizes the user and group information with its own database

## Create a user {#create-a-user}

When you create users, you can add the them to groups and assign roles to the them.

1. In administration console, click **[!UICONTROL Settings > User Management > Users and Groups]**, and click **[!UICONTROL New User]**.
.
1. Under **[!UICONTROL General Settings]**, provide information as required, and then click **[!UICONTROL Next]**. For details about the settings, see [User settings](adding-configuring-users.md#user-settings).
1. (Optional) To add the user to a group, click **[!UICONTROL Find Groups]**, and do these tasks:

    * In the **[!UICONTROL Find]** box, type all or part of the group name.
    * Select the domain to search, select the number of items to display, and click **[!UICONTROL Find]**.
    * (Optional) To view group details, select the group name, and then click **[!UICONTROL OK]** to return to the search results page.
    * Select the check box for the group and click **[!UICONTROL OK]**.
    * Click **[!UICONTROL Next]**.

1. (Optional) To assign roles to the user, click **[!UICONTROL Find Roles]**, select the check box for the roles to assign, and then click **[!UICONTROL OK]**.
1. Click **[!UICONTROL Finish]**.

   >[!NOTE]
   >
   >If you enounter any login issue with the user, see [AEM Forms on JEE user fails to login on AEM Forms on OSGi side](https://helpx.adobe.com/aem-forms/kb/AEM-users-fails-to-login.html).

## User settings {#user-settings}

Specify the following settings when you create or edit a user.

**Canonical Name:** (Mandatory) Unique identifier for the user. Each user and group in a domain must have a unique canonical name. Select the System Generated checkbox to let User Management assign a unique value, or clear the checkbox and specify a custom value for the Canonical Name.

Avoid using underscore characters (_) in canonical names, for example, `sample_user`. When you search for users based on their canonical name, those containing underscore characters are not returned.

**First Name:** (Mandatory) User's given name

**Last Name:** (Mandatory) User's family name

**Common Name:** Full name or display name for the user. For example, if First Name = Gloria and Last Name = Rios, then Common Name = Gloria Rios.

**Email:** User's email address

**Telephone:** User's telephone number

**Description:** Optional description. Use this field as suits your organization's needs.

**Address:** User's mailing address

**Organization:** Organization to which the user belongs

**Email Aliases:** User's email aliases. Separate the email aliases with commas.

**Domain:** Domain to which the user belongs

**Locale:** User's ISO locale

**Business Calendar Key:** Enables you to map a business calendar to a user, based on the value for this setting. Business calendars define business and non-business days. AEM forms can use business calendars when calculating future dates and times for events such as reminders, deadlines, and escalations. The way that you assign business calendar keys to users depends on whether you are using an enterprise, local, or hybrid domain. (See [Adding domains](/help/forms/using/admin-help/adding-domains.md#adding-domains).)

If you are using a local or hybrid domain, information about users is stored only in the User Management database. For these users, set the Business Calendar Key to a string. Then map the business calendar key (the string) to a business calendar in forms workflow.

If you are using an enterprise domain, information about users resides in a third-party storage system, such as an LDAP directory. User Management synchronizes user information from the directory with the User Management database. This feature allows you to map a business calendar key to a field in the LDAP directory. For example, consider a scenario where each user record in your directory contains a country field, and you want to assign business calendars based on the country where the user is located. In this case, you specify the country field name as the value for the Business Calendar Key setting. You can then map the business calendar keys (the values defined for the country field in the LDAP directory) to business calendars in forms workflow.

For additional information on business calendars, including how to map business calendar keys to business calendars, see [Configuring Business Calendars](/help/forms/using/admin-help/configuring-business-calendars.md#configuring-business-calendars).

Limit the name to fewer than 53 characters. A shorter name helps prevent problems displaying the business calendar key in the Process Management pages in administration console.

**User ID:** (Mandatory) User ID that the user uses to log in. User ID is not case sensitive and it must be unique across the domain.

In enterprise domains, use a non-DN attribute as the user ID because a user's DN can change if they move to another part of the organization. This setting depends on the directory server. The value is `objectGUID` for Active Directory 2003, `nsuniqueID` for Sun&trade; One, and `guid` for eDirectory.

Ensure that the user ID is unique. Do not use one that was assigned to a deleted user.

AEM forms cannot differentiate between user accounts that have identical user IDs and passwords but belong to different domains. To avoid this problem, do not create accounts that have the same user ID on multiple domains.

When using SQL Server as your database, you cannot create a user ID that exceeds 255 characters.

When using MySQL, the user ID can contain extended characters. However, when a comparison is made between two strings, such as abcde and âbcdè, they are considered the same. For example, when syncing, if a new user was added to the database, a comparison is made to check whether a user with the same user ID exists in the database. If user *abcde* exists in the database when the new user *âbcdè* is added, the comparison cannot distinguish between the two names. It is assumed that the user exists in the database, and the new user is ignored and not added.

Avoid creating user names that begin with a number sign (#). Performing task searches returns no results for those user names. (See [Working with tasks](/help/forms/using/admin-help/tasks.md#working-with-tasks).)

**Password and Confirm Password:** Password that the user uses to log in. It must have a minimum of eight characters. A password is not required for a user who is part of a hybrid domain.

## View details about a user {#view-details-about-a-user}

1. In administration console, click Settings &gt; User Management &gt; Users and Groups.
1. Specify information to narrow the search and, in the In list, select Users and then click Find. The results of the search are listed at the bottom of the page. You can sort the list by clicking any of the column headings.
1. Click the name of the user to display details about. The Edit User page displays such details as below about the user:

    * General identification information, such as name, email, address, domain, and organization
    * Roles assigned to the user
    * Groups the user is a member of

## Change the password for a local user {#change-the-password-for-a-local-user}

1. In administration console, click **[!UICONTROL Settings > User Management > Users and Groups]**.
1. Specify information to narrow the search for a particular user and click **[!UICONTROL Find]**. The results of the search are listed at the bottom of the page. You can sort the list by clicking any of the column headings.
1. Click the name of the user and then click **[!UICONTROL Change Password]**.
1. Type and confirm the new password, and then click **[!UICONTROL OK]**. The password must be a minimum of eight characters.

## Edit a user's properties {#edit-a-user-s-properties}

1. In administration console, click **[!UICONTROL Settings > User Management > Users and Groups]**.
1. To find the user to edit, do these tasks:

    * In the **[!UICONTROL Find]** box, type your search criteria. 
    * In the **[!UICONTROL Using]** list, select **[!UICONTROL Name]**, **[!UICONTROL Email]**, or **[!UICONTROL User ID]**. 
    * In the **[!UICONTROL In list]**, select **[!UICONTROL Users]**. 
    * Select the domain, select the number of items to display, and then click **[!UICONTROL Find]**.

1. Click the user to edit.
1. For a user who is part of a local or hybrid domain, on the **[!UICONTROL Detail]** tab, edit the **[!UICONTROL General Settings]** and **[!UICONTROL Login Settings]**, and click **[!UICONTROL Save]**. For details about the settings, see [User settings](adding-configuring-users.md#user-settings). You cannot edit the general and login settings for a user who belongs to an enterprise domain.
1. To edit the group settings for the user, click the **[!UICONTROL Group Membership]** tab and do these tasks:

    * Click **[!UICONTROL Find Group]** and complete the search information. 
    * To add the user to a new group, select the check box for the group, click **[!UICONTROL OK]**, and then click **[!UICONTROL Save]**.

    >[!NOTE]
    >
    >Local users cannot be added to directory groups. However, directory users can be added to local groups.

    * To remove the user from a group, select the check box for the group, click **[!UICONTROL Delete]**, and then click **[!UICONTROL Save]**.

1. To edit the user's roles, click the **[!UICONTROL Role Assignments]** tab and do these tasks:

    * To display a list of roles, click **[!UICONTROL Find Roles]**. 
    * To add a role, select the check box for the role, click **[!UICONTROL OK]**, and then click **[!UICONTROL Save]**.
    * To remove a role, select the check box for the role, click **[!UICONTROL Unassign]**, and then click **[!UICONTROL Save]**.

## Delete a user {#delete-a-user}

1. In administration console, click **[!UICONTROL Settings > User Management > Users and Groups]**.
1. To find the user to delete, do these tasks:

    * In the **[!UICONTROL Find]** box, type your search criteria. 
    * In the **[!UICONTROL Using]** list, select **[!UICONTROL Name]**, **[!UICONTROL Email]**, or **[!UICONTROL User ID]**. 
    * In the **[!UICONTROL In list]**, select **[!UICONTROL Users]**. 
    * Select the domain, select the number of items to display, and then click **[!UICONTROL Find]**.

1. Select the check box for the user, click **[!UICONTROL Delete]**, and then click **[!UICONTROL OK]**.

>[!NOTE]
>
>AEM Forms on JEE also allows users of the AEM forms add-on running on an OSGi to be recognized as AEM users. This is required for scenarios where single sign-on between AEM Forms on JEE and AEM forms add-on running on an OSGi is required (for example, HTML workspace). The above-mentioned delete operation removes a user only from AEM Forms on JEE. The user is not deleted from AEM Forms add-on running on OSGi environment. But any login attempt made after deleting the user (a login attempt to AEM Forms add-on JEE server or AEM Forms add-on on OSGi environment) is denied.

## Create custom login error handler {#create-custom-login-error-handler}

If a user without the required AEM forms and CQ permissions, attempts to log into the following applications embedded in CQ, the user is redirected to the default CQ 404 page containing the error trace:

* Correspondence Management solution
* AEM forms Workspace

  ***note**: The Flex Worksapce is deprecated for AEM forms release.*

* forms manager
* Process Reporting

CQ provides a mechanism to override the default 404 handler jsp.

For details on how to customize the error handling page, see [Customizing Pages shown by the Error Handler](https://experienceleague.adobe.com/docs/experience-manager-65/developing/platform/customizing-errorhandler-pages.html?lang=en) in the Adobe Experience Manager documentation.
