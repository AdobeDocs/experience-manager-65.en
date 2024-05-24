---
title: Creating and configuring groups
description: Learn how to create groups manually or dynamically, edit a group, view details about a group, or delete a group.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/setting_up_and_organizing_users
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 72edd8d1-8573-4942-8ced-1a100af58d78
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Users and Roles
role: User, Developer
---
# Creating and configuring groups{#creating-and-configuring-groups}

Creating groups of users lets you assign roles to the group instead of to individual users.

Two different types of groups are available. You can manually create a group and add users and other groups to it. You can also create dynamic groups that automatically include all users who meet a specified set of rules.

Users may experience a slower response time if they belong to many groups (for example, 500 or more) or if the groups are nested deeply (for example, 30 levels). If you are experiencing this problem, you can configure AEM forms to pre-fetch information from certain domains. (See [Configure AEM forms to prefetch domain information](/help/forms/using/admin-help/configure-aem-forms-prefetch-domain.md#configure-aem-forms-to-prefetch-domain-information).)

## Create a group manually {#create-a-group-manually}

When you manually create a group, you can add users and other groups to it and assign roles to the group. You can also associate the group with a parent group.

If you are using Content Services (Deprecated), you can select the Select This Option For Pushing Users And Groups Into Registered External Principal Storage Providers option on the Domain Management page to push the information for any new users or groups that you create in Content Services (Deprecated).

1. In administration console, click Settings &gt; User Management &gt; Users And Groups, and then click New Group.
1. Complete the General Settings section and click Next. Canonical Name and Group Name are mandatory attributes.

   The Canonical Name is a unique identifier for the group. Each group and user in a domain must have a unique canonical name. Select the System Generated checkbox to let User Management assign a unique value, or clear the checkbox and specify a custom value for the Canonical Name.

   Avoid using underscore characters (_) in canonical names, for example, `sample_group`. When you search for groups based on their canonical name, those containing underscore characters are not returned.

1. To add users and groups to this new group, click Find Users/Groups and do these tasks:

    * In the Find box, type your search criteria.
    * In the In list, select Users, Groups, or Users and Groups.
    * In the Using list, select Name, Email, or User ID.
    * Select the domain, select the number of items to display and click Find.
    * In the search results, select the check boxes for the users and groups to add to this new group and click OK.

1. Click Next.
1. To add this new group to other existing groups, click Find Groups and do these tasks:

    * In the Find box, type your search criteria.
    * Select the domain, select the number of items to display, and click Find.
    * In the search results, select the check boxes for the groups that the new group belongs to and click OK.

1. Click Next.
1. To assign roles to the group, click Find Roles, select the check boxes for each role to assign to the group and click OK. Users in the group inherit roles that are assigned at the group level.
1. Click Finish.

## Create a dynamic group {#create-a-dynamic-group}

In a dynamic group, you do not individually select the users who belong to the group. Instead, you specify a set of rules and all users who meet those rules are automatically added to the dynamic group.

Use one of these two ways to create dynamic groups:

* Enable the automatic creation of dynamic groups based on email domains, such as @adobe.com. When you enable this feature, User Management creates a dynamic group for each unique email domain in the AEM forms database. Use a cron expression to specify how often User Management searches the AEM forms database for new email domains. These dynamic groups are added to the DefaultDom local domain and are named "All users with an *`[email domain]`* mail ID."
* Create a dynamic group based on specified criteria, including the user’s email domain, description, canonical name, and domain name. To belong to the dynamic group, a user must meet all the specified criteria. To set up an "or" condition, create two separate dynamic groups and add them both to a local group. For example, use that approach to create a group of users who belong to the @adobe.com email domain or whose canonical name contains ou=adobe.com. However, the users do not necessarily have to meet both conditions.

A dynamic group contains only users. It cannot contain other groups. However, a dynamic group can belong to a parent group.

### Automatically create dynamic groups based on email domains {#automatically-create-dynamic-groups-based-on-email-domains}

1. Click Settings &gt; User Management &gt; Configuration &gt; Configure Advanced System Attributes.
1. Under Auto Creation of Dynamic Group, select the check box.
1. Specify when User Manager checks for new email domains. This time should be after the domain synchronization time because the creation of dynamic groups is logical only if the domain synchronization is completed.

    * To enable automatic synchronization on a daily basis, type the time in the 24-hour format in the Occurs Daily At box. When you save your settings, this value is converted to a cron expression, which is displayed in the box below.
    * To schedule synchronization on a particular day of the week or month, or in a particular month, select type the appropriate cron expression in the box. The default value is `0 00 4 ? * *`(which means check at 4 A.M. every day).

      The cron expression usage is based on the Quartz open source job-scheduling system, version 1.4.0.

1. Click Save.

### Create a dynamic group based on specified criteria {#create-a-dynamic-group-based-on-specified-criteria}

1. In administration console, click Settings &gt; User Management &gt; Users And Groups.
1. Click New Dynamic Group.
1. Complete the General Settings section. Group Name is a mandatory attribute. You can assign the group to any configured domain.
1. Under Dynamic Group Criteria, specify one or more attributes used to populate the dynamic group.

   >[!NOTE]
   >
   >The Email, Description, and Canonical Name attributes are case-sensitive when using the Equals operator. They are not case-sensitive with the Starts With, Ends With, or Contains operators.

   **Email:** User’s email domain, such as `@adobe.com`.

   **Description:** User’s description, such as "Computer Scientist"

   **Canonical Name:** User’s canonical name, such as `ou=adobe.com`

   **Domain Name:** The name of the domain to which the user belongs, such as `DefaultDom`. The Domain Name attribute is case-sensitive when using the Contains operator. It is not case-sensitive with the Starts With, Ends With, or Equals operators.

1. Click Test. A Test page displays the first 200 users who meet the defined criteria. Click Close.
1. If the test returned the expected results, click Next. Otherwise, edit the dynamic group criteria and test again.
1. To add the dynamic group to a parent group, click Find Groups and do these tasks:

    * In the Find box, type your search criteria.
    * Select the domain, select the number of items to display, and click Find.
    * In the search results, select the check boxes for groups that the dynamic group belongs to and click OK.

1. Click Next.
1. To assign roles to the dynamic group, click Find Roles, select the check boxes for each role to assign to the group, and then click OK. Users in the group inherit roles that are assigned at the group level.
1. Click Finish.

## View details about a group {#view-details-about-a-group}

1. In administration console, click Settings &gt; User Management &gt; Users and Groups.
1. In the In list, select Group, and then click Find. The results of the search are listed at the bottom of the page. You can sort the list by clicking any of the column headings.
1. Click the name of the group to display details about. The Group Detail page appears.
1. To view direct members of the group, click Child Principals.

## Edit a group {#edit-a-group}

1. In administration console, click Settings &gt; User Management &gt; Users And Groups.
1. To find the group to edit, do these tasks:

    * In the Find box, type your search criteria.
    * In the Using list, select Name or Email.
    * In the In list, select Groups.
    * Select the domain, select the number of items to display, and click Find.
    * In the search results, click the name of the group to edit.

1. On the Details tab, edit the general settings and click Save.
1. To edit the associated groups, click the Parent Groups tab and do these tasks:

    * To find groups to add to the association, click Find Groups and complete the search information.
    * To add groups, select the check box for the groups to add, click OK, and then click Save.
    * To delete an associated group, select the check box for the group to delete, click Delete, click OK, and then click Save.

1. To edit the users and groups in the group, click the Child Principals tab and do these tasks:

    * To find users and groups to add, click Find Users/Groups and complete the search information.
    * To add a user or group, select the check box for the user or group, click OK, and click then Save.
    * To delete a user or group, select the check box for the user or group, click Delete, click OK, and then click Save.

1. To edit role assignments, click the Role Assignments tab and do these tasks:

    * To find roles to assign to the group, click Find Roles.
    * To add a role, select the check box for the role, click OK, and then click Save.
    * To unassign a role, select the check box for the role, click Unassign, and then click Save.

## Delete a group {#delete-a-group}

1. In administration console, click Settings &gt; User Management &gt; Users And Groups.
1. In the Find list, select Groups, and then click Find.
1. Select the check box for the group to delete, click Delete, and then click OK.
