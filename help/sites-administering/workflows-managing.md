---
title: Managing Access to Workflows
description: Learn how to configure Access Control Lists according to user accounts to allow (or disable) starting, and participating in, workflows.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
exl-id: cc54d637-d66c-49d2-99ee-00d96f1a74e0
solution: Experience Manager, Experience Manager Sites
feature: Operations
role: Admin
---
# Managing Access to Workflows{#managing-access-to-workflows}

Configure ACLs according to user accounts to allow (or disable) starting, and participating in, workflows.

## Required User Permissions for Workflows {#required-user-permissions-for-workflows}

Actions on workflows can be undertaken if:

* you are working with the `admin` account
* the account has been assigned to the default group `workflow-users`:

    * this group holds all the privileges necessary for your users to perform workflow actions.
    * when the account is in this group it only has access to workflows that it has initiated.

* the account has been assigned to the default group `workflow-administrators`:

    * this group holds all the privileges necessary for your privileged users to monitor and administer workflows.
    * when the account is in this group it has access to all workflows.

>[!NOTE]
>
>These are the minimum requirements. Your account must also be either the assigned participant or a member of the assigned group to take specific steps.

## Configuring Access to Workflows {#configuring-access-to-workflows}

Workflow models inherit a default access control list (ACL) for controlling how users can interact with workflows. To customize user access for a workflow, modify the Access Control List (ACL) in the repository for the folder containing the workflow model node:

* [Apply an ACL for the specific workflow model to /var/workflow/models](/help/sites-administering/workflows-managing.md#apply-an-acl-for-the-specific-workflow-model-to-var-workflow-models)
* [Create a subfolder in /var/workflow/models and apply the ACL to that](/help/sites-administering/workflows-managing.md#create-a-subfolder-in-var-workflow-models-and-apply-the-acl-to-that)

>[!NOTE]
>
>For information about using CRXDE Lite to configure ACLs, see [Access Right Management](/help/sites-administering/user-group-ac-admin.md#access-right-management).

### Apply an ACL for the specific workflow model to /var/workflow/models {#apply-an-acl-for-the-specific-workflow-model-to-var-workflow-models}

If the workflow model is stored within `/var/workflow/models`, then you can assign a specific ACL, relevant to only that workflow, on the folder:

1. Open CRXDE Lite in your web browser (for example, [http://localhost:4502/crx/de](http://localhost:4502/crx/de)).
1. In the node tree, select the node for the workflow models folder:

   `/var/workflow/models`

1. Click the **Access Control** tab.
1. In the **Local Access Control Policies** (**Access Control List**) table, click the plus icon to **Add Entry**.
1. In the **Add New Entry** dialog box, add an ACE with the following properties:

    * **Principal**: `content-authors`
    * **Type**: `Deny`
    * **Privileges**: `jcr:read`
    * **rep:glob**: reference to the specific workflow

   ![wf-108](assets/wf-108.png)

   The **Access Control List** table now includes the restriction for `content-authors` on the `prototype-wfm-01` workflow model.

   ![wf-109](assets/wf-109.png)

1. Click **Save All**.

   The `prototype-wfm-01` workflow is no longer available to members of the `content-authors` group.

### Create a subfolder in /var/workflow/models and apply the ACL to that {#create-a-subfolder-in-var-workflow-models-and-apply-the-acl-to-that}

Your [development team can create the workflows in a subfolder](/help/sites-developing/workflows-models.md#creating-a-new-workflow) of

`/var/workflow/models`

Comparable to the DAM workflows stored under

`/var/workflow/models/dam/`

You can then add an ACL to the folder itself.

1. Open CRXDE Lite in your web browser (for example, [http://localhost:4502/crx/de](http://localhost:4502/crx/de)).
1. In the node tree, select the node for the individual folder in the workflow models folder; for example:

   `/var/workflow/models/prototypes`

1. Click the **Access Control** tab.
1. In the **Applicable Access Control Policy** table, click the plus icon to **Add** an entry.
1. In the **Local Access Control Policies** (**Access Control List**) table, click the plus icon to **Add Entry**.
1. In the **Add New Entry** dialog box, add an ACE with the following properties:

    * **Principal**: `content-authors`
    * **Type**: `Deny`
    * **Privileges**: `jcr:read`

   >[!NOTE]
   >
   >As with [Apply an ACL for the specific workflow model to /var/workflow/models](/help/sites-administering/workflows-managing.md#apply-an-acl-for-the-specific-workflow-model-to-var-workflow-models) you can include a rep:glob to limit access to a specific workflow.

   ![wf-110](assets/wf-110.png)

   The **Access Control List** table now includes the restriction for `content-authors` on the `prototypes` folder.

   ![wf-111](assets/wf-111.png)

1. Click **Save All**.

   The models in the `prototypes` folder are no longer available to members of the `content-authors` group.
