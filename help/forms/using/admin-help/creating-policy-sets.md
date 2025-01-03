---
title: Creating and managing policy sets

description: Policy sets are used to group policies that have a common business purpose. You can create, edit and delete policies in a policy set.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: Document Security
exl-id: 736926af-ae41-4da3-b181-444de72407bd
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Creating and managing policy sets {#creating-and-managing-policy-sets}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

Policy sets are used to group policies that have a common business purpose. Policy sets can be made available to a subset of users in the system.

Each policy set has at least one associated policy set coordinator. The *policy set coordinator* is an administrator or a user who has additional permissions. The policy set coordinator is typically a specialist in the organization who can best author the policies in a given policy set.

Policy set coordinators can perform these tasks:

* Create new policies
* Edit and delete any policy in the policy set
* Edit policy set settings
* Add and remove coordinators for the policy set
* View policy and document events for any policy or document within the policy set
* Revoke access to documents
* Switch policies for the document

Policy sets are created and deleted in the document security administrator interface by super users and policy set coordinators who have permission to do so.

When you delete a policy set, policies that were part of the set cannot be applied to new documents. However, you can view the policy information in both the administration console and the end user web pages for policies that are still in use. You can view the policy information from the document detail page for any document protected by the policy. Policies still in use can be edited.

The super user or policy set coordinator adds domains that are created in User Management to the visible user and group for each policy set. This list is visible to the policy set coordinator and is used to put limits on which domains the policy set coordinator can browse when choosing users to add to policies.

When you create policy sets, you assign users the role of document publisher. The *document publisher* is the user who protects the document with a policy. This user is, by default, always included on a policy with full access rights, including revoke and policy switching capabilities. However, administrators can change the document publisher’s access rights for shared policies. For example, the administrator can disable the document publisher’s right to revoke document access or switch the policy. If an administrator switches the policy attached to the document, the Publisher name will be updated to the name of the owner of the policy last applied to the document.

Upon installation of document security, a default policy set is created called *Global Policy Set*. This policy set is managed by the administrator who installed the software or the policy set coordinator who is designated for this policy set.

## Create a policy set {#create-a-policy-set}

Global Policy Set is the only default policy set that is created upon installation. You can create additional policy sets and add policies, users, policy set coordinators, and document publishers. After creating a policy set, you can create policies within the set.

During policy set creation, you can use the Back button to return to the previous screen and the Save button to save your policy set at any time.

1. On the document security, page, click Policies, click the Policy Sets tab, and then click New.
1. In the Name box, type a name for the policy set, optionally type a Description, and then click Next. The name cannot contain a colon **:**.

   >[!NOTE]
   >
   >You can create a policy set name that contains extended characters; however, when a comparison is made between two strings, accented and non-accented characters such as "e" and "é" are considered to be the same. When someone creates a policy set, a comparison is made to check whether a policy set with the same name already exists. The comparison cannot distinguish between names that are the same except for accented characters. It is assumed that the policy set is already added to the database and the new one is not added.

1. (Optional) To set the domains that are visible to Document Publishers when they are adding users to a policy, click Add Domains, select the domains to make searchable, click Add, and then click OK.
1. On the Add Visible Users and Groups page, click Next.
1. (Optional) To add a policy set coordinator, click Add Users and Groups on the Add Policy Set Coordinator(s) (Step 3 of 4) page and perform these tasks:

    * In the Find box, type the name or email address.
    * In the Using list, select the appropriate option.
    * In the Type list, select User and, in the In list, select a domain to search.
    * In the Display list, select the number of results to display per page, and then click Find.
    * Select the check box for the user or group to add and click Next.
    * Select the policy set coordinator permissions and click Add. The following permissions can be set:

        * View events
        * Manage documents (revoke and reinstate access to documents, and switch policies on documents)
        * Manage policies (create, edit, and delete policies)
        * Managing Document Publishers (add and remove Document Publishers)
        * Delegate (add and remove Policy Set Coordinators)

1. Repeat step 5 to add more policy set coordinators.
1. Review the policy set coordinator settings and click Next.
1. Click Add Users and Groups to add document publishers who can use the policies within the policy set to protect documents.
1. On the Add Document Publishers page, perform these tasks:

    * In the Find box, type the name or email address.
    * In the Using list, select the appropriate option.
    * In the Type list, select User and, in the In list, select a domain to search.
    * In the Display list, select the number of results to display per page, and then click Find.
    * Select the check boxes for the users and groups to add, click Add, and then click OK.

1. Click Save.

You can now add policies to your policy set. (See [Creating and editing policies](/help/forms/using/admin-help/creating-policies.md#creating-and-editing-policies).)

## Edit a policy set {#edit-a-policy-set}

1. On the document security, page, click Policies, click the Policy Sets tab, and click the policy set to edit.
1. Click the appropriate tab and edit as required:

    * **Detail:** Edit the policy set name and description.
    * **Policies:** Create, enable, edit, and delete policies within the policy set.
    * **Visible Users and Groups:** Add and remove visible users and groups who can be included in a policy.
    * **Policy Set Coordinators:** Add, remove, and change permissions for coordinators.
    * **Document Publishers:** Add and remove users who can publish documents by using the policies in the set.

1. To delete a visible user or group, Policy Set Coordinator, or Document Publisher, click the appropriate tab, select the check box for the entry, click Delete, and then click OK.
1. To add visible users or groups, a Policy Set Coordinator, or Document Publishers, click the appropriate tab, click Add Users or Groups, search for the user or group to add, select the entry, click Add, and then click OK.
1. On the Policies tab, search for policies to add to the policy set and create new policies:

    * To search for a policy, select Policy ID or Policy Name, type the corresponding value, select the number of items to display, and click Find.
    * For details about creating an policy, see [Creating and editing policies](/help/forms/using/admin-help/creating-policies.md#creating-and-editing-policies).

## Delete a policy set {#delete-a-policy-set}

When you delete a policy set, policies that were part of the set cannot be applied to new documents. However, you can view the policy information in both the administration console and the end-user web pages for policies that are still in use. You can view the policy information from the document detail page for any document protected by the policy. Policies still in use can be edited.

1. Click Policies and click the Policy Sets tab.
1. Select the check box for the policy set to delete.
1. Click Delete and then click OK.
