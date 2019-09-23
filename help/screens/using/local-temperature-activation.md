---
title: Travel Center Temperature Activation
seo-title: Travel Center Temperature Activation
description: The following use case demonstrates the usage of travel center local temperature activation based on the values populated in Google Sheets.
seo-description: The following use case demonstrates the usage of travel center local temperature activation based on the values populated in Google Sheets.
uuid: 523f7e54-5e8f-4596-8b80-114f88b9c7d9
contentOwner: jsyal
products: SG_EXPERIENCEMANAGER/6.5/SCREENS
content-type: reference
topic-tags: use-case-examples
discoiquuid: 9d65ce71-f512-4a32-a089-ce21f48993dc
index: y
internal: n
snippet: y
---

# Travel Center Temperature Activation{#travel-center-temperature-activation}

The following use case demonstrates the usage of travel center local temperature activation based on the values populated in Google Sheets.

## Description {#description}

For this Use Case, if your Google Sheets has Value less than 50, then an image with hot drinks will display and if the value is greater than or equal to 50, then the image with cold drinks will display. In case of some other or no value, the player will display a default image.

## Preconditions {#preconditions}

Before you start implementing the travel center local temperature activation, you must learn how to set up ***Data Store***, ***Audience Segmentation*** and ***Enable Targeting for Channels*** in an AEM Screens Project.

Refer to [**Configuring ContextHub in AEM Screens**](../../screens/using/configuring-context-hub.md) for detailed information.

## Basic Flow {#basic-flow}

Follow the steps below to implement the Travel Center Local Temperature Activation use case:

1. **Populating the Google Sheets**

    1. Navigate to the ContextHubDemo Google Sheet.
    1. Add a column with **Heading1** with corresponding value for temperature.

   ![](assets/screen_shot_2019-05-08at112911am.png)

1. **Configuring the segments in Audiences as per the requirements**

    1. Navigate to the segments in your audience (Refer to ***Step 2: Setting up Audience Segmentation*** in ** [Configuring ContextHub in AEM Screens](../../screens/using/configuring-context-hub.md)** page for more details).
    
    1. Select the **Sheets A1 1** and click **Edit**.
    
    1. Select the comparison property and click the configure icon to edit the properties.
    1. Select **googlesheets/value/1/0** from the drop-down in **Property name**
    
    1. Select the **Operator** as **greater-than-or-equal **from the drop-down menu
    
    1. Enter the **Value** as **50**
    
    1. Similarly, Select the** Sheets A1 2 **and click **Edit**.
    
    1. Select the **Comparison Property - Value** and click the configure icon to edit the properties.
    1. Select **googlesheets/value/1/0** from the drop-down in **Property name**
    
    1. Select the **Operator** as **less-than **from the drop-down menu
    
    1. Enter the **Value** as **50**

1. Navigate and select your channel () and click **Edit** from the action bar. In the following example, **DataDrivenWeather**, a sequential channel is used to showcase the functionality.

   >[!NOTE]
   >
   >Your channel should already have a default image and the Audiences should be pre-configured as described in [**Configuring ContextHub in AEM Screens**](../../screens/using/configuring-context-hub.md).

   ![](assets/screen_shot_2019-05-08at113022am.png)

   >[!CAUTION]
   >
   >You should have set up your **ContextHub** **Configurations** using the channel **Properties** --&gt; **Personalization** tab.

   ![](assets/screen_shot_2019-05-08at114106am.png)

1. Select **Targeting** from the editor and select **Brand** and the **Activity** from the drop-down menu and click **Start Targeting**.

   ![](assets/new_activity3.gif)

1. **Checking the Preview**

    1. Click **Preview. **Also, open your Google Sheet and update its value.** 
       **
    
    1. Change the value to less than 50, you should be able to view the an image of summer drinks. If the value in the Google Sheet is 50 or greater than should be able to view the an image of hot drink.** 
       **

   ![](assets/result3.gif)

