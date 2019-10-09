---
title: Creative Project and PIM Integration
seo-title: Creative Project and PIM Integration
description: Creative Project streamlines the entire photo shoot workflow that including generating a photo shoot request, uploading a photo shoot, collaborating on a photo shoot, and packaging approved assets
seo-description: Creative Project streamlines the entire photo shoot workflow that including generating a photo shoot request, uploading a photo shoot, collaborating on a photo shoot, and packaging approved assets
uuid: 09f27d36-e725-45cb-88d1-27383aedceed
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: projects
content-type: reference
discoiquuid: 0e5d0a45-c663-4d91-b793-03d39119d103
---

# Creative Project and PIM Integration{#creative-project-and-pim-integration}

If you are a marketer or creative professional, you can use Creative Project tools in Adobe Experience Manager (AEM) to manage eCommerce-related product photography and associated creative processes within your organization.

In particular, you can use Creative Project to streamline the following tasks in your photo shoot workflow:

* Generating a photo shoot request
* Uploading a photo shoot
* Collaborating on a photo shoot
* Packaging approved assets

>[!NOTE]
>
>See [Project User Roles for information](/help/sites-authoring/projects.md#user-roles-in-a-project) on assigning user roles and workflows to certain types of users.

## Exploring Product Photo Shoot workflows  {#exploring-product-photo-shoot-workflows}

Creative Project provides various project templates to meet diverse project requirements. The **Product Photo Shoot Project **template is available out of the box. This template includes photo shoot workflows that let you initiate and manage product photo shoot requests. It also includes a series of tasks that enable you to obtain digital images for products through appropriate review and approval processes.

The template includes the following workflows:

* **Product Photo Shoot (commerce integration) workflow**: This workflow leverages commerce integration with the product information management (PIM) system to automatically generate a shot list for the selected products (hierarchy). You can view the product data as part of the asset metadata after the workflow is complete.
* **Product Photo Shoot workflow**: This workflow lets you provide a shot list instead of depending on commerce integration. It maps the uploaded images to a CSV file in the project assets folder.

>[!NOTE]
>
>The CSV file that is uploaded in the Upload Shot list task of the Product Photo Shoot workflow should have the filename shotlist.csv.

## Create a Product Photo Shoot project {#create-a-product-photo-shoot-project}

1. In the **Projects** console, tap/click **Create** and then choose **Create Project** from the list.

   ![chlimage_1-132](assets/chlimage_1-132.png)

1. In the **Create Project** page, select the photoshoot project template and tap/click **Next**.

   ![chlimage_1-133](assets/chlimage_1-133.png)

1. Enter project details, including title, description, and due date. Add users and assign various roles to them. You can also add a thumbnail for the project.

   ![chlimage_1-134](assets/chlimage_1-134.png)

1. Tap/click **Create**. A confirmation message notifies that the project is created.
1. Tap/click **Done** to return to the **Projects** console. Alternatively, tap/click **Open** to view the assets within the photoshoot project.

## Starting Work in a Product Photo Shoot Project {#starting-work-in-a-product-photo-shoot-project}

To initiate a photo shoot request, tap or click a project and then tap/click **Add Work** within the project details page to start a workflow.

![chlimage_1-135](assets/chlimage_1-135.png)

A Product Photo Shoot project includes the following out-of-the-box workflows:

* Product Photo Shoot (Commerce Integration) Workflow
* Product Photo Shoot Workflow

Use the Product Photo Shoot (Commerce Integration) workflow to map image assets with the products in AEM. This workflow leverages Commerce Integration to link the approved images to the existing product data at the location */etc/commerce*.

The Product Photo Shoot (Commerce Integration) workflow includes the following tasks:

* Create Shot list
* Upload Photo Shoot
* Retouch Photo Shoot
* Review and Approve
* Move to Production Task

If product information isn’t available in AEM, use the Product Photo Shoot workflow to map image assets with the products based on the details you upload in a CSV file. The CSV file must contain basic product information, such as product ID, category, and description. The workflow fetches approved assets for the products.

This workflow includes the following tasks:

* Upload Shot list
* Upload Photo Shoot
* Retouch Photo Shoot
* Review and Approve
* Move to Production Task

You can customize this workflow using the workflow configurations option.

Both workflows include steps to link products with their approved assets. Each workflow includes the following steps:

* Workflow Configuration: Describes the options to customize the workflow
* Starting a project workflow: Explains how to start a Product Photo Shoot
* Workflow Tasks Details: Provides details of tasks available in the workflow

## Tracking Project Progress {#tracking-project-progress}

You can track the progress of a project by monitoring the active/completed tasks within a project.

Use the following to monitor the progress of a project:

* **Task card** 

* **Task list**

The Task card depicts the overall progress of the project. It appears on the Project Details page only if the project has any related tasks. The Task card displays the current completion status of the project based on the number of tasks completed. It does not include future tasks.

The Task card provides the following details:

* Percentage of active tasks
* Percentage of completed tasks

![chlimage_1-136](assets/chlimage_1-136.png)

The Task list provides detailed information around the currently active workflow task for the project. To display the list, tap/click the Task card. The Task list also displays metadata such as start date, due date, assignee, priority, and status of the task.

![chlimage_1-137](assets/chlimage_1-137.png) 

## Workflow Configuration {#workflow-configuration}

This task involves assigning workflow steps to users based on their roles.

To configure the **Product Photo Shoot** workflow:

1. Navigate to **Tools** &gt; **Workflows**, and then tap the **Models** tile to open the **Workflow Models** page.
1. Select the **Product Photo Shoot** workflow, and the tap the **Edit** icon from the toolbar to open it in edit mode.

   ![chlimage_1-138](assets/chlimage_1-138.png)

1. In the **Product Photo Shoot Workflow** page, open a project task. For example, open the **Upload Shot List** task.

   ![chlimage_1-139](assets/chlimage_1-139.png)

1. Click the **Task** tab to configure the following:

    * Name of the task
    * Default user (role) that receives the task
    * Default priority of the task, which is displayed in the task list of the user
    * Task description to be displayed when the assignee opens the task
    * Due date for a task, which is calculated based on the time the task started

1. Click **OK** to save the configuration settings.

   Similarly, you can configure the following tasks for the **Product Photo Shoot** workflow:

    * Upload Photo Shoot
    * Retouch Product Photo Shoot
    * Photo Shoot Review
    * Move to Production

   Perform a similar procedure to configure the tasks in the **Product Photo Shoot (Commerce Integration) workflow**.

This section describes how to integrate product information management with your creative project.

## Starting a Project Workflow {#starting-a-project-workflow}

1. Navigate to a Product Photo Shoot project, and tap/click the **Add Work** icon on the **Workflows** card.
1. Select the **Product Photo Shoot (Commerce Integration)** workflow card to start the Product Photo Shoot (Commerce Integration) workflow. If the product information isn't available under /etc/commerce, select the **Product Photo Shoot** workflow and start the Product Photo Shoot workflow.

   ![chlimage_1-140](assets/chlimage_1-140.png)

1. Tap/click **Next** to initiate the workflow in the project.
1. Enter workflow details on the next page.

   ![chlimage_1-141](assets/chlimage_1-141.png)

   Click **Submit** to start the photo shoot workflow. The project details page for the photo shoot project is displayed.

   ![chlimage_1-142](assets/chlimage_1-142.png)

### Workflow Tasks Details {#workflow-tasks-details}

The photo shoot workflow includes several tasks. Each task is assigned to a user group based on the configuration defined for the task.

#### Create Shot List Task {#create-shot-list-task}

The **Create Shot List** task enables the project owner to select products for which images are required. Based on the option selected by the user, a CSV file is generated that contains basic product information.

1. In the project folder, tap/click the ellipses in the [Tasks Card](#tracking-project-progress) to view the task item in the workflow.

   ![chlimage_1-143](assets/chlimage_1-143.png)

1. Select the **Create Shot List** task, and then tap/click the **Open** icon from the toolbar.

   ![chlimage_1-144](assets/chlimage_1-144.png)

1. Review the task details and then tap/click the **Create Shot List** button.

   ![chlimage_1-145](assets/chlimage_1-145.png)

1. Select products for which product data exists without associated images.

   ![chlimage_1-146](assets/chlimage_1-146.png)

1. Tap/click the **Add To Shotlist** icon to create a CSV file that contains a list of all such products. A message confirms that the shot list is created for the selected products. Click **Close** to complete the workflow.
1. After you create a shot list, the **View Shot List** link appears. To add more products to the shot list, tap/click **Add to Shot List**. In this case, the data gets appended to the initially created shot list.

   ![chlimage_1-147](assets/chlimage_1-147.png)

1. Tap/click **View Shot List** to view the new shot list.

   ![chlimage_1-148](assets/chlimage_1-148.png)

   To edit the existing data or add new data, tap/click **Edit** from the toolbar. Only the **Product **and **Description** fields are editable.

   ![chlimage_1-149](assets/chlimage_1-149.png)

   After you update the file, tap/click **Save** on toolbar to save the file.

1. After adding the products, tap/click the **Complete** icon on the **Create Shot List **task details page to mark the task as completed. You can add an optional comment.

   The completion of the task introduces the following changes within the project:

    * Assets corresponding to the product hierarchy are created in a folder with the same name as the workflow title.
    * The metadata for the assets becomes editable using the Assets console, even before the photographer provides the images.
    * A Photo Shoot folder is created that stores the images the photographer provides. The Photo Shoot folder contains subfolders for each product entry in the Shot List.

   For the Product Photo Shoot (without commerce integration) workflow, Upload Shot List is the first task. Tap/click **Upload Shot List** to upload a **shotlist.csv** file. The CSV file should contain the product ID. The other fields are optional. You can use them to map assets to products.

### Upload Shot List Task {#upload-shot-list-task}

This task is part of the Product Photo Shoot workflow. You perform this task if product information isn’t available in AEM. In this case, you upload a list of products in a CSV file for which image assets are required. Based on the details in the CSV file, you map image assets with the products.

Use the **View Shot List** link under the project card in the previous procedure to download a sample CSV file. Review the sample file to know the usual contents of a CSV file.

The product list or the CSV file can contain fields, such as **Category, Product, Id, Description**, and **Path**. The **Id** field is mandatory and contains the product ID. The other fields are optional.

A product can belong to a particular category. The product category can be listed in the CSV below the **Category** column. The **Product** field contains the name of the product. In the **Description** field, enter the product description or instructions for the photographer.

>[!NOTE]
>
>The name of images to be uploaded should start with "**&lt;ProductId&gt;_"** where Product ID is referenced from the **Id** field in the *shotlist.csv* file. For example, for a product in the shot list with **Id 397122**, you can upload files with names **397122_highcontrast.jpg**, **397122_lowlight.png**, and so on.

1. In the project folder, tap/click the ellipses in the [Tasks Card](#tracking-project-progress) to view the list of tasks in the workflow.
1. Select the **Upload Shot List** task, and then tap/click the **Open** icon from the toolbar.

   ![chlimage_1-150](assets/chlimage_1-150.png)

1. Review the task details and then tap/click the **Upload Shot List** button.

   ![chlimage_1-151](assets/chlimage_1-151.png)

1. Tap/click the **Upload Shot List** button to upload the CSV file with filename shotlist.csv. The workflow recognizes this file as a source to be used to extract product data for the next task.
1. Upload a CSV file containing product information in the appropriate format. The **View Uploaded Assets **link appears under the card after the CSV file is uploaded.

   ![chlimage_1-152](assets/chlimage_1-152.png)

   Click the **Complete** icon to complete the task.

1. Tap/click the **Complete** icon to complete the task.

### Upload Photo Shoot Task {#upload-photo-shoot-task}

If you are an Editor, you can upload shots for the products listed in the **shotlist.csv** file that is created or uploaded in the previous task.

The name of images to be uploaded should begin with **"&lt;productId&gt;_"** where Product ID is referenced from the **Id** field in the **shotlist.csv** file. For example, for a product with **ID 397122** in the shot list, you can upload files with names **397122_highcontrast.jpg**, **397122_lowlight.png**, and so on.

You can either upload the images directly or upload a ZIP file that contains the images. Based on their names, the images are placed inside respective product folders within the **Photo Shoot** folder.

1. Under the project folder, tap/click the ellipses in the [Task Card](#tracking-project-progress) to view the task item in the workflow.
1. Select the **Upload Photo Shoot** task, and then tap/click the **Open** icon from the toolbar.

   ![chlimage_1-153](assets/chlimage_1-153.png)

1. Tap/click **Upload Photo Shoot **and upload the photo shoot images.
1. Tap/click the **Complete** icon from the toolbar to complete the task.

### Retouch Photo Shoot Task {#retouch-photo-shoot-task}

If you have editing rights, perform the Retouch Photo Shoot task to edit the images uploaded to the Photo Shoot folder.

1. Under the project folder, tap/click the ellipses in the [Task Card](#tracking-project-progress) to view the task item in the workflow.
1. Select the **Retouch Photo Shoot** task, and then tap/click the **Open** icon from the toolbar.

   ![chlimage_1-154](assets/chlimage_1-154.png)

1. Tap/click the **View Uploaded Assets** link in the **Retouch Photo Shoot** page to browse the uploaded images.

   ![chlimage_1-155](assets/chlimage_1-155.png)

   If necessary, edit the images using an Adobe Creative Cloud application.

   ![chlimage_1-156](assets/chlimage_1-156.png)

1. Tap/click the **Complete** icon from the toolbar to complete the task.

### Review and Approve Task {#review-and-approve-task}

In this task, you review the photo shoot images uploaded by a photographer and mark images as approved for use.

1. Under the project folder, tap/click the ellipses in the [Task Card](#tracking-project-progress) to view the task item in the workflow.
1. Select the **Review & Approve** task, and then tap/click the **Open** icon from the toolbar.

   ![chlimage_1-157](assets/chlimage_1-157.png)

1. In the **Review & Approve** page, assign the review task to role, for example Reviewers, and then tap/click **Review **to start reviewing the uploaded product images.

   ![chlimage_1-158](assets/chlimage_1-158.png)

1. Select a product image, and tap/click the Approve icon from the toolbar to mark it as approved.

   ![chlimage_1-159](assets/chlimage_1-159.png)

   Once you approve an image, an approved banner displays over it.

   >[!NOTE]
   >
   >You may leave out some products without any image. Later, you can revisit the task and mark it complete once done.

1. Tap/click **Complete**. The approved images are linked with the empty assets that were created.

You can navigate to project assets using the Assets UI and verify the approved images.

Tap/click the next level to view products as per your product data hierarchy.

Creative Project associates approved assets with the referenced product. The asset metadata is updated with the product reference and basic information in the **Product Data **tab under asset properties they appear in the AEM Asset Metadata section.

>[!NOTE]
>
>In the Product Photo Shoot workflow (without commerce integration), the approved images have no association with products.

### Move to Production Task {#move-to-production-task}

This task moves the approved assets to the production-ready folder to make them available for use.

1. Under the project folder, tap/click the ellipses in the [Task Card](#tracking-project-progress) to view the task item in the workflow.
1. Select the **Move to Production** task, and then tap/click the **Open** icon from the toolbar.

   ![chlimage_1-160](assets/chlimage_1-160.png)

1. To view the approved assets for the photo shoot prior to moving them to production ready folder, click the **View Approved Assets** link below the project thumbnail on the **Move to Production** task page.

   ![chlimage_1-161](assets/chlimage_1-161.png)

1. Enter the path of the production-ready folder in the **Move To** field.

   ![chlimage_1-162](assets/chlimage_1-162.png)

   Tap/click **Move to Production**. Close the confirmation message. The assets are moved to the mentioned path and a spin set is authomatically created for the approved assets for each product based on the folder hierarchy.

1. Tap/click the **Complete** icon from the toolbar. The workflow completes as the last step is marked complete.

## Viewing DAM Asset Metadata {#viewing-dam-asset-metadata}

After you approve, the assets are linked to the corresponding products. The [Properties Page](/help/assets/managing-assets-touch-ui.md#editing-properties) of the approved assets now has an additional **Product Data** (linked product information) tab. This tab displays the product details, SKU number, and other product-related details linking the asset. Tap/click the **Edit** icon to update an asset property. The product-related information remains read-only.

Tap/click the link that appears to navigate to the respective product detail page in the product console with which asset is associated.

## Customizing the Project Photo Shoot Workflows {#customizing-the-project-photo-shoot-workflows}

You can customize the Project Photo Shoot workflows based on requirements. This is an optional, role-based task that you perform to set the value of a variable within the project. Later, you can then use the configured value to arrive at a decision.

1. Click/tap the AEM logo, and then navigate to **Tools** &gt; **Workflow** &gt; **Models** to open the Workflow Models page.
1. Select the **Product Photo Shoot (Commerce Integration)** workflow or the **Product Photo Shoot** workflow and the click/tap **Edit** from the toolbar to open the workflow in edit mode.
1. Open the **Projects** tasks in the side kick, and drag the **Create Role Based Project Task** step to the workflow.

   ![chlimage_1-163](assets/chlimage_1-163.png)

1. Open the **Role Based Task** step.
1. In the **Task** tab, provide a name for the Task that will display in the **Task** List. You may also assign the task to a role, set the default priority, provide a description, and specify a time when the task is due. 

   ![chlimage_1-164](assets/chlimage_1-164.png)

1. In the **Routing** tab, specify the actions for the task. To add multiple actions, tap/click the **Add Item **link.

   ![chlimage_1-165](assets/chlimage_1-165.png)

1. After adding the options click **OK** to add the changes to the step.

   >[!NOTE]
   >
   >Tapping/clicking **OK** does not save the changes in the workflow. To save changes in the workflow, tap/click **Save**.

1. Open the **Workflow** tasks from side kick, and add a **Goto** task. 
1. Open the **Goto** task and tap/click the **Process** tab.
1. Specify the following code in the **Script** box:

```
   function check() {

   if (workflowData.getMetaDataMap().get("lastTaskAction","") == "Reject All") {

   return true

   }

   // set copywriter user in metadata

   var previousId = workflowData.getMetaDataMap().get("lastTaskCompletedBy", "");

   workflowData.getMetaDataMap().put("copywriter", previousId);

   return false;

   }
```

   >[!NOTE]
   >
   >For details around scripting in workflow steps, see [Defining a Rule for an OR Split](/help/sites-developing/workflows-models.md).

   ![chlimage_1-166](assets/chlimage_1-166.png)

1. Tap/click **OK**.  

1. Tap/click **Save** to save the workflow.

   ![chlimage_1-167](assets/chlimage_1-167.png)

1. A new Project owner acceptance task now comes up after the [Move to Production task](#move-to-production-task) is completed and is assigned to the owner.

   The user in the Owner role can complete the task and select an action (from the list of actions added in the workflow step configurations) from the list in the comments popup.

   ![chlimage_1-168](assets/chlimage_1-168.png)

   Select the appropriate option and click **Complete** to run the **Goto Step** in the workflow.

>[!NOTE]
>
>When you start a server, the Project task list servlet caches the mappings between task types and URLs defined under `/libs/cq/core/content/projects/tasktypes`. You can then perform the usual overlay and add custom task types by placing them under `/apps/cq/core/content/projects/tasktypes`.

