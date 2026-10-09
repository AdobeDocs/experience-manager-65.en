---
title: Admin Consoles
description: Lear how to use the Admin Consoles available in Adobe Experience Manager.
contentOwner: Chris Bohnert
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
docset: aem65
exl-id: d4de517e-50bc-4ca5-89b1-295d259fd5bb
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Admin
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: 5ef752af-d616-5b23-8312-06964e46b208
    internal-label: Administering
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
---

# Admin Consoles{#admin-consoles}

By default, the ability to switch to the classic UI by way of the Admin consoles is disabled. Therefore, the pop-up icons that were seen when mousing over certain console icons, allowing access to classic UI, are no longer displayed.

Every console that has a Classic UI version in `/libs/cq/core/content/nav` can be re-enabled individually so that the **Classic UI** option once again pops up over the console icon when it is moused over.

In this example, you are re-enabling the Classic UI for the Sites console.

1. Using CRXDE Lite, find the node corresponding to the Admin Console for which you want to re-enable Classic UI. They are found under:

   `/libs/cq/core/content/nav`

   For example

   [ `https://localhost:4502/crx/de/index.jsp#/libs/cq/core/content/nav`](https://localhost:4502/crx/de/index.jsp#/libs/cq/core/content/nav)

1. Select the node corresponding to the console for which you want to re-enable Classic UI. For this example, you are re-enabling the classic UI for the Sites console.

   `/libs/cq/core/content/nav/sites`

1. Create an overlay using the **Overlay Node** option; for example:

    * **Path**: `/apps/cq/core/content/nav/sites`
    * **Overlay Location**: `/apps/`
    * **Match Node Types**: active (select the checkbox)

1. Add the following boolean property to the overlaid node:

   `enableDesktopOnly = {Boolean}true`

1. The **Classic UI** option is again available as a popover option in the Admin Console.

   ![classic UI popover option](assets/syui-01-2019-02-27-15-16-55.png)

Repeat these steps for every console for which you wish to re-enable access to the Classic UI version.
