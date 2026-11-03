---
title: Understanding the folder structure
description: How to understand the folder structure of AEM Forms workspace source code to customize.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: a4c1d3d8-477e-4edf-9dde-4ef9c766be5a
solution: Experience Manager, Experience Manager Forms
feature: HTML5 Forms,Adaptive Forms,Mobile Forms
role: Admin, User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 97aafc4b-2598-52d6-9012-295a95969e38
    internal-label: HTML5 Forms
  - id: 59f95943-e802-56ac-990d-21ab923984c1
    internal-label: Mobile Forms
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Understanding the folder structure {#understanding-the-folder-structure}

AEM Forms workspace components are designed on MVC architecture using Backbone. Each component has a file for:

* Model, that contains business logic.
* Template, that is an HTML file containing interface controls.
* View, that acts as a Controller class to Template.

The assets for all the components are placed in the folder structure described below. To access the assets, log in to CRXDE Lite and browse to `/libs/ws/js/runtime/`.

**models** Contains backbone models.

**views** Contains backbone views.

**templates** Contains only the HTML templates for the components.

**routes** Contains universal routes. Templates folder inside routes contains the HTML code and the references to the components.

**services** Contains service interface to call Adobe Experience Manager server APIs on REST endpoint.

**util** Contains generic utilities usable by multiple components.
