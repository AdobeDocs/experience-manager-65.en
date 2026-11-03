---
title: Work with Workflows
description: Workflows in Adobe Experience Manager let you automate a series of steps that are performed on a page or asset.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: site-features
exl-id: 7383d590-c6b7-440a-a33d-196dce9736ef
solution: Experience Manager, Experience Manager Sites
feature: Authoring,Workflow
role: User,Admin,Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: e2c1b6d3-bb7e-4fe8-8c72-f7b403298e91
    internal-label: Authoring
  - id: f6a6f91a-8819-530a-8e7b-c50884a25aef
    internal-label: Workflow
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Work with Workflows{#working-with-workflows}

AEM Workflows let you automate a series of steps that are performed on (one or more) pages and/or assets.

For example, when publishing, an editor has to review the content - before a site administrator activates the page. A workflow that automates this example notifies each participant when it is time to perform their required work:

1. The author applies the workflow to the page.
1. The editor receives a work item that indicates that they are required to review the page content. When finished, they indicate that their work item is complete.
1. The site administrator then receives a work item that requests the activation of the page. When finished, they indicate that their work item is complete.

Typically:

* Content authors apply workflows to pages and participate in workflows.
* The workflows that you use are specific to the business processes of your organization.

The following pages cover:

* [Applying Workflows to Pages](/help/sites-authoring/workflows-applying.md)
* [Participating in Workflows](/help/sites-authoring/workflows-participating.md)
