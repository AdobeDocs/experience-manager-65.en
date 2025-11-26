---
title: Target your Adobe Campaign
description: You can create targeted experiences for Adobe Campaign after setting up segmentation.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: personalization
exl-id: fc6fccba-41c5-4c13-aac0-b4ef67767abe
solution: Experience Manager, Experience Manager Sites
feature: Authoring,Personalization,Integration
role: User,Admin,Developer
---
# Targeting your Adobe Campaign{#targeting-your-adobe-campaign}

To target your Adobe Campaign newsletter, you need to first set up segmentation, which is only available in the Classic UI (for client context). After that you can create targeted experiences for Adobe Campaign. Both are described in this section.

## Setting up segmentation in AEM {#setting-up-segmentation-in-aem}

To set up segmentation, you need to use the classic UI to set up the segments. The remaining steps can be performed in the standard UI.

Setting up segmentation includes creating segments, a brand, campaign, and experiences.

>[!NOTE]
>
>Segment ID needs to be mapped to the one on the Adobe Campaign side.

### Creating Segments {#creating-segments}

To create segments:

1. Open the [segmentation console](http://localhost:4502/miscadmin#/etc/segmentation) at **&lt;host&gt;:&lt;port&gt;/miscadmin#/etc/segmentation**.
1. Create a page and enter a title - for example, **AC Segments**- and select the **Segment (Adobe Campaign)** template.
1. Select the created page in the tree view on the left-hand side.
1. Create a segment, for example, targeting male users, by creating a page under the segment you created called Male and select the **Segment (Adobe Campaign)** template.
1. Open the created segment page and drag and drop a **Segment ID** from the sidekick onto the page.
1. Double-click the trait, enter the ID representing in this case, the male segment defined in Adobe Campaign - for example, **MALE** - and click **OK**. The following message should appear: *`targetData.segmentCode == "MALE"`*
1. Repeat the steps for another segment, for example, a segment targeting female users.

### Creating a Brand {#creating-a-brand}

To create a brand:

1. In **Sites**, navigate to the **Campaigns** folder (for example, in We.Retail).
1. Click **Create Page** and enter a title for the page, for example, We.Retail Brand and select the **Brand** template.

### Creating a Campaign {#creating-a-campaign}

To create a campaign:

1. Open the **Brand** page you created.
1. Click **Create Page** and enter a title for your page, for example, We.Retail Campaign, and select the **Campaign** template and click **Create**.

### Creating Experiences {#creating-experiences}

To create experiences for segments:

1. Open the **Campaign** page you created.
1. Create experiences for your segments by clicking **Create Page** and entering a title for your page, for example, Male as you are creating an experience for the Male segment, and select the **Experience** template.
1. Open the created Experience page.
1. Click **Edit**, then below Segments click **Add Item**.
1. Enter the path to the male segment, for example, **/etc/segmentation/ac-segments/male** and click **OK**. The following message should appear: *Experience is targeted at: Male*
1. Repeat the previous steps to create an experience for all segments, for example, the female target.
