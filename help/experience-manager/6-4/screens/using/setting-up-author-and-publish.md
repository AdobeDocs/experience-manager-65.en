---
title: Setting Up Author and Publish
seo-title: Setting Up Author and Publish
description: null
seo-description: null
page-status-flag: never-activated
uuid: bdb2f74b-f1d5-445c-a9b0-b1813fe75804
contentOwner: jsyal
discoiquuid: 08b9fb08-c679-44ff-b6be-f3cbf3c00cf3
index: y
internal: n
snippet: y
---

# Setting Up Author and Publish{#setting-up-author-and-publish}

The following section covers the following topics:

* Overview

    * Prerequisites

* Setting up Author and Publish Channels

## Overview {#overview}

AEM Screens architecture resembles a traditional AEM Sites architecture. Content is authored on an AEM author instance and then forward-replicated to multiple publish instances. AEM Screens devices can now connect to an AEM publish farm via load balancer. Multiple AEM publish instances can be added to continue to scale the publish farm.

This section explains how to transfer content from author to publish servers and then consequently all the way up to the players.

### Prerequisites {#prerequisites}

You must learn the basics of Author and Publish servers and the AEM topology, to continue setting up Author and Publish channel in your AEM instance.

To learn in detail about Publish Servers, Architectural Overview, and Replication Agents, please refer to [**Supporting Author and Publish in AEM Screens**](/6-4/screens/using/author-and-publish.md).

## Setting up Author and Publish Channels {#setting-up-author-and-publish-channels}

Follow the steps below to set up and implement author and publish channels in your AEM Screens project.

## On the Author Instance {#on-the-author-instance}

Follow the steps on the author instance, such as [http://localhost:4502/aem/start.html.](/aem/start.md)

1. **Create Channels**

    1. Navigate to Screens project from** Test Project **--&gt;** Channels**.
    
    1. Click **Create** next to the plus icon in the action bar. A wizard will open (*See Channel Types for more information*).
    
    1. Select the **Sequence Channel** template from the wizard and click **Next**.
    
    1. Enter the **Title **as** Offline Channel**.
    
    1. Click **Create** and the channel is created and added to your channels folder.

   Similarly, create another channel titled as **Offline Channel**, as shown in the figure below.

   ![](assets/screen_shot_2018-12-03at15354pm.png)

1. **Add Content to Channels**

    1. Navigate to **Test Channel **--&gt; **Channels** --&gt; **Offline Channel**.
    
    1. Click **Edit** from the action bar to open the editor.  
    
    1. Drag and drop the images and videos to your channel.

   ![](assets/screen_shot_2018-12-03at23332pm.png)

   Similarly add content to** Online Channel**, as shown in the figure below.

   ![](assets/screen_shot_2018-12-03at23239pm.png)

1. Step text
1. Step text
1. Step text

