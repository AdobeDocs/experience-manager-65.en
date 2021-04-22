---
title: Create and Assign Enablement Resources
seo-title: Create and Assign Enablement Resources
description: Add enablement resources
seo-description: Add enablement resources
uuid: da940242-0c9b-4ad8-8880-61fd41461c3b
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: introduction
content-type: reference
discoiquuid: 8fe97181-600e-42ac-af25-d5d4db248740
exl-id: 78908a9c-a260-44ff-ad1e-baa6d78ae399
---
# Create and Assign Enablement Resources {#create-and-assign-enablement-resources}

## Add an Enablement Resource {#add-an-enablement-resource}

To add an enablement resource to the new community site:

* Login as a system administrator on the author instance:
    * For example, [http://localhost:4502/](http://localhost:4503/)
* From global navigation, select **[!UICONTROL Communities]** > **[!UICONTROL Resources]**

  ![resources](assets/resources.png)

  ![enablement-resource](assets/enablement-resource.png)
* Select the community site to which enablement resources are being added:
  * Select **[!UICONTROL Enablement Tutorial]**.
* From the menu, select **[!UICONTROL Create]**.
* Select **[!UICONTROL Resource]**.

![create-resource](assets/create-enablement-resource.png)

### Basic Info {#basic-info}

Fill in the basic information for the Resource:

* **[!UICONTROL Site Name]**
  
  Set to the name of the selected community site: Enablement Tutorial

* **[!UICONTROL Resource Name&ast;]**

  Ski Lesson 1

* **[!UICONTROL Tags]**

  Tutorial: Sports / Skiing

* **[!UICONTROL Show in Catalog]**

  Set it to **On**.

* **[!UICONTROL Description]**
  
  Sliding on snow for beginners.

* **[!UICONTROL Add Image]**

  Add an image to represent the Resource to the member in their Assignments view.

  ![basic-info](assets/basic-info.png)

* Select **[!UICONTROL Next]**

### Add Content {#add-content}

While it appears as if multiple Resources might be selected, only one is allowed.

Select the `'+' icon`, in the upper right corner, to begin the process of choosing the Resource by identifying the source.

![add-content](assets/add-content.png) 

![upload-resource](assets/upload-resource.png)

Upload a Resource. If a video resource, either upload a custom image to display before the video starts playing, or allow a thumbnail to be generated from the video (may take a few minutes - it's not necessary to wait).

![upload-video](assets/upload-video.png)

* Select **[!UICONTROL Next]**.

### Settings {#settings}

* **[!UICONTROL Social Settings]**
  
  Leave default settings to experience commenting and rating of enablement resources by learners.

* **[!UICONTROL Due Date]**
  
  *(Optional)* A date by which the assignment should be completed may be selected.

* **[!UICONTROL Resource Author]**
  
  *(Optional)* Leave blank.

* **[!UICONTROL Resource Contact&ast;]**
  
  *(Required)* Use the pulldown menu to select member `Quinn Harper`.

* **[!UICONTROL Resource Expert]**
  
  *(Optional)* Leave blank.

  **Note**: If users or groups are not visible, check that they were added to the `Community Enable Members` group and *Saved* on the publish instance.

  ![enablement-settings](assets/enablement-settings.png)

* Select **[!UICONTROL Next]**

### Assignments {#assignments}

* **[!UICONTROL Add Assignees]**
  
  Leave unset as this enablement resource will be added to a learning path. If a learner is assigned to the individual enablement resource as well as a learningpPath containing the enablement resource, the learner will be assigned to the enablement resource twice.

  ![add-assignments](assets/add-assignments.png)

* Select **[!UICONTROL Create]**

  ![create-resource](assets/create-resource.png)

Successful creation of the Resource returns to the Resources console with the newly created Resource selected. From this console, it is possible to publish, add learners and change other settings.

To upload a new version of the enablement resource, it is recommended to create a new Resource, and then unenroll members from the old version and enroll them in the new version.

### Publish the Resource {#publish-the-resource}

Before Enrollees are able to see the assigned Resourse, it must be published:

* Select the world `Publish` icon

Activation is confirmed with a success message:

![publish-resource](assets/publish-resource.png)

## Add a Second Enablement Resource {#add-a-second-enablement-resource}

Repeat the steps above to create and publish a second related enablement resource from which a learning path will be created.

![add-resource](assets/add-resource.png)

**Publish** the second Resource.

Return to the Enablement Tutorial listing of it's Resources.

*Hint: If both Resources are not visible, refresh the page.*

![refresh-resource](assets/refresh-resource.png)

## Add a Learning Path {#add-a-learning-path}

A learning path is a logical grouping of enablement resources which form a course.

* From the Resources console, select `+ Create`
* Select **[!UICONTROL Learning Path]**

![add-learning-path](assets/add-learning-path.png)

Add the **[!UICONTROL Basic Info]**:

* **[!UICONTROL Learning Path Name]** 

  Ski Lessons

* **[!UICONTROL Tags]**
  
  Tutorial: Skiing

* **[!UICONTROL Show in Catalog]**

  Leave unchecked

* **[!UICONTROL Upload an image]** 

  To represent the learning path in the Resources console.

  ![learningpath-basic](assets/learningpath-basic.png)

* Select **[!UICONTROL Next]**.

Skip the next panel as there are no prerequisite learning paths to add.

* Select **[!UICONTROL Next]**

On the Add Resources panel:

* Select `+ Add Resources` to select the 2 ski lessions resources to add to the learning path.

  Note: Only **published** Resources will be selectable.

>[!NOTE]
>
>You can only select the resources available at the same level as the learning path. For example, for a learning path created in a group only the group level resources are available; for a learning path created in a community site the resources in that site are available for adding to the learning path.

* Select **[!UICONTROL Submit]**.

  ![learningpath](assets/learningpath-add.png) 
  
  ![create-learningpath](assets/create-learningpath.png)

* Select **[!UICONTROL Next]**

  ![learningpath-settings](assets/learningpath-settings.png)

* **[!UICONTROL Add Assignees]**
 
  Use the pulldown menu to select the `Community Ski Class` group, which should included members `Riley Taylor` and `Sidney Croft.`

* **[!UICONTROL Learning Path Contact&ast;]**
  
  *(Required)* Use the pulldown menu to select member `Quinn Harper`.

* Select **[!UICONTROL Create]**.

  ![learningpath-info](assets/learningpath-info.png)

Successful creation of the learning path returns to the Resources console with the newly created learning path selected. From this console, it is possible to publish, add learners and change other settings.

**Publish** the learning path.
