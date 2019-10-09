---
title: Working with Project Workflows
seo-title: Working with Project Workflows
description: A variety of project workflows are available out of the box.
seo-description: A variety of project workflows are available out of the box.
uuid: 376922ca-e09e-4ac8-88c8-23dac2b49dbe
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: projects
content-type: reference
discoiquuid: 9d2bf30c-5190-4924-82cd-bcdfde24eb39
---

# Working with Project Workflows{#working-with-project-workflows}

The project workflows available out of the box include the following:

* **Project Approval Workflow** - This workflow allows you to assign content to a user, review, then approve.
* **Request Launch** - A workflow the requests a launch.
* **Request Landing Page** - This workflow requests a landing page.
* **Request Email** - Workflow for requesting an email.
* **Product Photo Shoot and Product Photo Shoot (Commerce)** - Maps assets with products
* **DAM Create and Translate Copy and DAM Create Language Copy** - Creates translated binaries, metadata, and tags for assets and folders.

Depending on which Project template you select, you have certain workflows available:

|   |**Simple Project** |**Media Project** |**Product Photo Shoot Project** |**Translation Project** |
|---|:-:|:-:|:-:|:-:|
| Request Copy |  |x |  |  |
| Product Photo Shoot |  |x |x |  |
| Product Photo Shoot (Commerce) |  |  |x |  |
| Project Approval |x |  |  |  |
| Request Launch |x |  |  |  |
| Request Landing Page |x |  |  |  |
| Request Email |x |  |  |  |
| DAM Create Language Copy&ast; |  |  |  |x |
| DAM Create and Translate Language Copy&ast; |  |  |  |x |

>[!NOTE]
>
>&ast; These workflows are not started from the **Workflow** tile in Projects. See [Creating Language Copies for Assets.](/help/sites-administering/tc-manage.md)

The steps for starting and completing workflows are the same no matter which workflow you choose. Only the steps change.

You start a workflow directly in Projects (except for DAM Create Language Copy or DAM Create and Translate Language Copy). Information on any outstanding tasks in a project are listed in the **Tasks** tile. Notifications for tasks that need to be completed appear next to the user icon.

For more information on working with workflows in AEM, see the folllowing:

* [Participating in workflows](/help/sites-authoring/workflows-participating.md)
* [Applying workflows to pages](/help/sites-authoring/workflows-applying.md)
* [Configuring workflows](/help/sites-administering/workflows.md)

This section describes the workflows available for Projects. 

## Request Copy workflow {#request-copy-workflow}

This workflow lets you request a manuscript from a user and then approve it. To start the request copy workflow:

1. In your Media project, select the **+** sign in the **Workflows** tile and select **Request Copy Workflow**.
1. Enter a manuscript title and a brief summary of what you are requesting. If applicable, enter a target word count, task priority and a due date.

   ![chlimage_1-321](assets/chlimage_1-321.png)

1. Click **Create**. The workflow starts. The task appears in the **Tasks** tile.

   ![chlimage_1-322](assets/chlimage_1-322.png)

## Product Photo Shoot workflow {#product-photo-shoot-workflow}

The Product Photo Shoot workflows (both commerce and without commerce) are covered in detail in [Creative Project](/help/sites-authoring/managing-product-information.md).

## Project Approval workflow {#project-approval-workflow}

In the Project Approval workflow, you assign content to a user, review, and then approve the content.

1. In your Simple project, select the ****+** sign in the **Workflows** tile and select **Project Approval Workflow**.
1. Enter a title and select who to assign it to from the Team list. If applicable, enter a description, content path, task priority and a due date.

   ![chlimage_1-323](assets/chlimage_1-323.png)

1. Click **Create**. The workflow starts. The task appears in the **Tasks** tile.

   ![chlimage_1-324](assets/chlimage_1-324.png)

## Request Launch workflow {#request-launch-workflow}

This workflow lets you request a launch.

1. In your Simple project, select the **+** sign in the **Workflows** tile and select **Request Launch Workflow**.
1. Enter a title for the launch and provide the launch source path. You can also add a description and live date, if you applicable. Select Inherit source page live data or exclude sub pages depending on how you want the launch to behave.

   ![chlimage_1-325](assets/chlimage_1-325.png)

1. Click **Create**. The workflow starts. The workflow appears in the **Workflows** list (click ellipses **...** on the **Workflows** tile to access this list).

## Request Landing Page workflow {#request-landing-page-workflow}

This workflow lets you request a landing page.

1. In your Simple project, select the **+** sign in the **Workflows** tile and select Request Landing Page Workflow.
1. Enter a title for your landing page and the parent path. If applicable, enter a live date or choose a file for your landing page.

   ![chlimage_1-326](assets/chlimage_1-326.png)

1. Click **Create**. The workflow starts. The task appears in the **Tasks** tile.

## Request Email workflow {#request-email-workflow}

This workflow lets you request an email. It is the same workflow that appears in the **Emails** tile.

1. In your Media or Simple project, select the **+** sign in the **Workflows** tile and select **Request Email Workflow**.
1. Enter an email title, as well as the campaign and template paths. In addition you can provide a name, description, and live date.

   ![chlimage_1-327](assets/chlimage_1-327.png)

1. Click **Create**. The workflow starts. The task appears in the **Tasks** tile.

   ![chlimage_1-328](assets/chlimage_1-328.png)

## Create (and Translate) Language Copy Workflow for Assets {#create-and-translate-language-copy-workflow-for-assets}

The **Create Language Copy** and the **Create and Translate Language Copy** workflows are covered in detail in [Creating Language Copies for Assets.](/help/assets/translation-projects.md)
