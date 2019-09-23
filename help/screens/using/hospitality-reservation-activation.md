---
title: Hospitality Reservation Activation
seo-title: Hospitality Reservation Activation
description: The following use case demonstrates the usage of hospital reservation activation based on the values populated in Google Sheets.
seo-description: The following use case demonstrates the usage of hospital reservation activation based on the values populated in Google Sheets.
uuid: 3caf71a4-04f1-402f-be8f-34d840d9ee33
contentOwner: jsyal
products: SG_EXPERIENCEMANAGER/6.5/SCREENS
content-type: reference
topic-tags: use-case-examples
discoiquuid: f1208c6c-aa84-44a1-a097-26f37e6ddfba
index: y
internal: n
snippet: y
---

# Hospitality Reservation Activation{#hospitality-reservation-activation}

The following use case demonstrates the usage of hospital reservation activation based on the values populated in Google Sheets.

## Description {#description}

For this Use Case, the Google Sheet is populated with percentage of reservation on two restaurants **Restaurant1** and **Restaurant2**. A formula is applied based on values of Restaurant1 and Restaurant2 and based on the formula, value 1 or 2 is assigned to the **AdTarget** Column.

If the value of **Restaurant1** &gt; **Restaurant2**, then **AdTaget** is assigned value** 1 **otherwise **AdTarget** is assigned value **2**. Value 1 generates *Steak food* option and Value 2 results in display of *Thai food* option on your display screen.

## Preconditions {#preconditions}

Before you start implementing the reservation activation, you must learn how to set up ***Data Store***, ***Audience Segmentation*** and ***Enable Targeting for Channels*** in an AEM Screens Project.

Refer to [**Configuring ContextHub in AEM Screens**](../../screens/using/configuring-context-hub.md) for detailed information.

## Basic Flow {#basic-flow}

Follow the steps below to implement the hospitality reservation activation use case for your AEM Screens project:

1. **Populating the Google Sheets and adding the formula.**

   For example, apply the formula to the third column **AdTarget**, as shown in the figure below.

   ![](assets/screen_shot_2019-04-29at94132am.png)

1. **Configuring the segments in Audiences as per the requirements**

    1. Navigate to the segments in your audience (Refer to ***Step 2: Setting up Audience Segmentation*** in ** [Configuring ContextHub in AEM Screens](../../screens/using/configuring-context-hub.md)** page for more details).
    
    1. Select the **Sheets A1 1** and click **Edit**.
    
    1. Select the comparison property and click the configure icon to edit the properties.
    1. Select **googlesheets/value/1/2** from the drop-down in **Property name**
    
    1. Select the **Operator** as **equal **from the drop-down menu
    
    1. Enter the **Value** as **1**
    
    1. Similarly, Select the** Sheets A1 2 **and click **Edit**.
    
    1. Select the comparison property and click the configure icon to edit the properties.
    1. Select **googlesheets/value/1/2** from the drop-down in **Property name**
    
    1. Select the **Operator** as **2**

1. Navigate and select your channel () and click **Edit** from the action bar. In the following example, **DataDrivenRestaurant**, a sequential channel is used to showcase the functionality.

   >[!NOTE]
   >
   >Your channel should already have a default image and the Audiences should be pre-configured as described in [**Configuring ContextHub in AEM Screens**](../../screens/using/configuring-context-hub.md).

   ![](assets/screen_shot_2019-05-08at14652pm.png)

   >[!CAUTION]
   >
   >You should have set up your **ContextHub** **Configurations** using the channel **Properties** --&gt; **Personalization** tab.

   ![](assets/screen_shot_2019-05-08at114106am.png)

1. Select **Targeting** from the editor and select **Brand** and the **Activity** from the drop-down menu and click **Start Targeting**.
1. **Checking the Preview**

    1. Click **Preview. **Also, open your Google Sheets and update its value.** 
       **
    
    1. Update the value in **Restaurant1** and **Restaurant2** columns. If **Restaurant1** &gt; **Restaurant2, **you should be able to view an image of *Steak* food otherwise, *Thai* food image displays on your screen.** 
       **

   ![](assets/result5.gif)

