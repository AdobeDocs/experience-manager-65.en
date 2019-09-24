---
title: The External Link Checker
seo-title: The External Link Checker
description: Learn about the External Link Checker in AEM.
seo-description: Learn about the External Link Checker in AEM.
uuid: f3f90209-a99f-4755-9f02-50bc0f9f1d5c
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
discoiquuid: 696f8786-b5ce-430c-bad1-68bb7ac1038d
index: y
internal: n
snippet: y
---

# The External Link Checker{#the-external-link-checker}

An external link checker is provided within AEM. The link checker:

* scans all content pages
* generates a list of all valid and invalid links
* marks invalid links as broken in situ on the individual content pages

## How to Validate External Links {#how-to-validate-external-links}

To use the external link checker:

1. Using **Navigation**, select **Tools**, then **Sites**.
1. Select **External Link Checker**, a list of all external links is generated.
1. Validate a specific link by selecting it in the list, then clicking **Check**:

   ![](assets/telc-01.png)

   Information is displayed:

    * **Status** of the link
    * **URL**
    * **Referrer**
    * time since the link was **Last Checked** (validated)
    * the **Last Status** returned  
    
    * time since the link was **Last Available**
    * time since the link was **Last Accessed**

1. On the individual content pages invalid links will be shown as broken:

   ![](assets/chlimage_1-143.png)

