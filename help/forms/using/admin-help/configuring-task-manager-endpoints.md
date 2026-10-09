---
title: Configuring Task Manager endpoints
description: Learn how to configure Task Manager endpoints to invoke the service. Different settings are required for configuring Task Manager endpoints.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_endpoints
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 8495a3d7-6ac9-41f5-b1f9-31decaba118a
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Configuring Task Manager endpoints {#configuring-task-manager-endpoints}

Task Manager endpoints enable Workspace users to invoke the service.

**Task Manager endpoint settings**

Use the following settings to configure a Task Manager endpoint.

**Name:** (Mandatory) Identifies the endpoint. The name is displayed in the card view in Workspace. Do not include a < character because it will truncate the name displayed in Workspace. If you’re entering a URL as the name of the endpoint, ensure that it conforms with the syntax rules specified in RFC1738.

**Description:** A description of the endpoint. Do not include a < character because it will truncate the description displayed in Workspace.

**Task Instructions:** Instructions for the user who starts this workflow.

**Process Owner:** The name of the person who is responsible for the process.

**User Can Forward Task:** Allows the user to forward the initial task.

**Show Attachment Window:** Allows the user to see the attachment window.

**Allow Attachment Adding:** Allows the user to add attachments and notes.

**Task Initially Locked:** Locks the initial task.

**Add ACLs for Shared Queues:** The initial task is created with ACLs for shared queue users.

**Categorization:** (Mandatory) The category in which the user will see the form in Workspace. Select a category from the list, or select New Category to add a category.

**Operation Name:** (Mandatory) A list of operations that can be assigned to the endpoint.
