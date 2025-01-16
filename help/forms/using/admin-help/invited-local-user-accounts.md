---
title: Managing invited and local user accounts

description: Using document security, you can search for, view, edit, lock, unlock, and delete invited and local user accounts.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: Document Security
exl-id: 23f71b34-a0cb-4664-bb8b-a60f33dc70d8
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Managing invited and local user accounts {#managing-invited-and-local-user-accounts}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

Use the Invited and Local Users page to manage your invited and local users. This page is displayed only if the following requirements are met:

* You are an administrator who is assigned the document security Manage Invited and Local Users role and the administration console User role. (See [Creating and configuring roles](/help/forms/using/admin-help/creating-configuring-roles.md#creating-and-configuring-roles).)
* Invited user registration is enabled. (See [Configuring invited user registration](/help/forms/using/admin-help/configuring-client-server-options.md#configuring-invited-user-registration).)

The Invited and Local Users page contains two tabs that you can use to search for, view, edit, lock, unlock, and delete invited and local user accounts.

You can also manually send registration emails to your invited users. You may want to do this, for example, if the registration period that the email authorized ends and the user cannot use the URL to register. In this case, you can resend a registration email to the invited user. When the invited user registers and activates the account, the user becomes a local user.

>[!NOTE]
>
>Invited users can also be added directly through the LDAP directory that document security references, or when a user or administrator invites a new user when creating or editing a policy, therefore initiating a registration invitation email. Users can add new invited users to policies if you enable the Enable Invited User Registration option on the Invited User Registration page.

## Add an invited user {#add-an-invited-user}

You can add one or more invited user accounts to document security at a time. To add an invited user account, you need the email address of the user. When you add a user, document security sends a registration email inviting the user to register.

1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users, and then click Invite New User.
1. Type the email addresses of the users you want to invite. Enter multiple addresses on a line, separated by a comma.

   The message that you created when enabling invited user registration is sent to the users. (See [Configuring invited user registration](/help/forms/using/admin-help/configuring-client-server-options.md#configuring-invited-user-registration).)

1. Click OK.

## View information about a local user {#view-information-about-a-local-user}

You can view information about local users, including the name, email address, organization, registration status, and domain.

1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users, and then click Invite New User.
1. Click the Local Users tab and, on the Manage Local Users page, click the email address for the user you want to view.

   The user details are displayed, and you can reset the user’s password and deactivate the account.

## Send an email to an unregistered external user {#send-an-email-to-an-unregistered-external-user}

When you add an invited user, document security automatically sends the user a registration email request. You can also manually generate a registration email to send to an invited user who has not yet registered. You may want to do this, for example, to send a new invitation if an invited user's registration email expires.

1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users.
1. In the user list, select the check box for each user to send a registration email to and then click Resend Invitation Email.
1. Review the list of selected users and click OK.

## Reset a local user password {#reset-a-local-user-password}

You can reset passwords for activated invited users who registered with document security but forgot their password. When you reset a password, an email is generated that contains a new, temporary password for the user.

When you enabled the invited user registration process, you created an email message that will be sent to users prompting them to reset their passwords. (See [Configuring invited user registration](/help/forms/using/admin-help/configuring-client-server-options.md#configuring-invited-user-registration).)

1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users and click the Local Users tab.
1. In the user list, select the appropriate user.
1. On the Manage Local User page, click Reset Password and click OK. A reset password email containing the new password is sent to the user.

## Enable or disable a user account {#enable-or-disable-a-user-account}

You can disable local user accounts to temporarily restrict a user from logging in to document security. When you disable the account, the user cannot use policy-protected documents or create or apply policies.

You can enable a local user account that is currently disabled. You cannot enable an invited user account that is listed as registered. The registered status indicates that the invited user is registered but has not yet activated the account using the link in the activation email.

**Restrict a user account**

1. In Administration Console, click Services &gt; document security &gt; Invited and Local Users and click the Local Users tab.
1. In the user list, select the appropriate user.
1. On the Local User Detail page, click Account Disable.

**Reinstate a user account**

1. Click Invited and Local Users and click the Local Users tab.
1. In the user list, select the appropriate user.
1. On the Local User Detail page, click Account Enable.

## Remove an invited user account {#remove-an-invited-user-account}

You can delete invited user accounts from document security. You may want to delete an account, for example, when a user changes their personal email account information.

If you delete a user account, only you or another administrator can reinstate the account by selecting the Add Invited User option on the Invited Users page. Users cannot add the deleted user account to a policy, and no invitation process can be initiated by that method.

>[!NOTE]
>
>Invited users who were deleted through the AEM forms User Management interface cannot be reinvited until they have been deleted again using the following procedure.

1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users and click the Invited Users tab.
1. Select the check box beside one or more users, click Delete, and then click OK.

## Search for an invited user account {#search-for-an-invited-user-account}

You can search for invited user accounts by using an email address.

1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users.
1. In the Find Email box, type the user’s email address, and then click Find.

## Search for a local user account {#search-for-a-local-user-account}

You can search for a local user by using the user’s email address or name and domain.

1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users and click the Local Users tab.
1. Type the search criteria in the Find box, select Name or Email, and then click Find.

## Remove a local user account {#remove-a-local-user-account}

You can delete local user accounts from document security. You may want to delete accounts, for example, when users change their personal email account information.

1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users and click the Local Users tab.
1. Select the check box beside one or more users, click Delete, and then click OK.

## Sort the user list {#sort-the-user-list}

You can find users more easily by sorting the user list by column heading. Triangle icons beside the column heading indicate which column is currently used to sort:

* An upward-pointing triangle indicates ascending order.
* A downward-pointing triangle indicates descending order.

    1. In administration console, click Services &gt; Document Security &gt; Invited and Local Users.
    1. To sort invited users, click the Invited Users tab and click the appropriate column heading.
    1. To sort local users, click the Local Users tab and click the appropriate column heading.
