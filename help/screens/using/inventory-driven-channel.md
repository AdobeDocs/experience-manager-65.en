---
title: Inventory Driven Channel
seo-title: Inventory Driven Channel
description: null
seo-description: null
page-status-flag: never-activated
uuid: a7e7aa08-8f9e-4458-bdce-225cf29a6da4
contentOwner: jsyal
discoiquuid: 9989ef4c-9fdd-4bf2-9f7c-0c74a9cc4e7f
docset: aem65

---

# Inventory Driven Channel{#inventory-driven-channel}

## Getting Started with Inventory Driven Channels {#getting-started-with-inventory-driven-channels}

This section describes a use case example that emphasizes on creating and managing a data driven asset change using Google Sheets.

### Preconditions {#preconditions}

Before you start this use case, make sure you understand how to:

* ** [Create and Manage Channels](/help/screens/using/managing-channels.md)**
* ** [Create and Manage Locations](/help/screens/using/managing-locations.md)**
* ** [Create and Manage Schedules](/help/screens/using/managing-schedules.md)**
* ** [Device Registration](/help/screens/using/device-registration.md)**

### Primary Actors {#primary-actors}

Content Authors

### Terminolgies {#terminolgies}

Follow the terms below that play a significant role in understanding and setting up the project in the different use cases:

**Activity** Activity refers to the category.

**Area** Project main

**Audience** Location of the data

**Brand** Brand refers

**Segment** Segment refers to a container of assets that you are trying to target.

### Basic Flow: Setting up the Project {#basic-flow-setting-up-the-project}

>[!NOTE]
>
>**Prerequisite:**
>
>Before you dive deep into details of setting up and using data driven asset change in your project, make sure you create an AEM Screens project with a sequence channel. For demo purposes, project titled **DataDrivenAsset** is created and sequence channels titled **DataDrivenRestaurant**, **DataDrivenTextOverlay**, **DataDrivenWeather**, and **DataDrivenRetail** are added to the project, as shown in the figure below.
>
>Creating four different channels is only for demonstration purposes and to showcase four different use cases in different channels. If you want to follow only one use case as your requirement, please feel free to create only one sequence channel.

![](assets/screen_shot_2019-05-01at42043pm.png)

Follow the sections below to create a sample project on creating and managing a data driven asset change using Google Sheets in an AEM Screens project:

## Step 1: Setting up Database {#step-setting-up-database}

>[!CAUTION]
>
>Google Sheets is used in the following example database system from where the values are fetched and is solely for educational purposes. Adobe does not endorse using Google Sheets for production environments.
>
>For more information, refer to [Get API Key](https://developers.google.com/maps/documentation/javascript/get-api-key) in Google documentation.

1. Log in to Google Docs.

   >[!NOTE]
   >
   >You must have an account in Google Drive before you create a new Google Sheet.

1. Start a new blank spreadsheet. Add content to your google sheet and save it. For demo purposes, the Google Sheet is named as **ContextHubDemo**.
1. Click **Share** on the top right corner of the Google Sheet to open **Share with Others** dialog box. Click **Advanced** option and change the settings to **On - Anyone with the link**, as shown in the figure below.

   This step allows you to access values in the google sheet.

   ![](assets/screen_shot_2019-04-22at115829am.png)

1. When you click **Save** from the preceding step, you will get the link for the Google Sheet. Save the click for future references and click **Done**.

   ![](assets/screen_shot_2019-04-22at120242pm.png)

>[!CAUTION]
>
>Google Sheets is used in the following example for educational purposes. Adobe does not endorse using Google Sheets for production environments.

## Step 2: Enabling the Google Sheets REST APIs {#step-enabling-the-google-sheets-rest-apis}

Once you have setup your Google Sheet, you have to enable the Google Sheet REST API to access the values.

To learn in how to enable the REST APIs for Google Sheets, refer to Google APIs documentation.

1. Navigate to [Google API Console](https://console.developers.google.com/apis/credentials). Click **CREATE** to create a new project.

   ![](assets/screen_shot_2019-04-22at125028pm.png)

1. Enter the **Project Name** as **AssetChange** and click **CREATE**.
1. Once you have created the project to need to set up the API Key. Click **Create credentials** and select **API key **to generate API key for your project. Save the API key for future references.

   >[!NOTE]
   >
   >This demo project uses the free Google API key. You may want to refer to pricing and restriction on Google's website **Get API Key** for more information.

### Verifying the Setup of Google Sheets {#verifying-the-setup-of-google-sheets}

```
Verify the data in your Google Sheets using the steps below
```

[https://sheets.googleapis.com/v4/spreadsheets/](https://sheets.googleapis.com/v4/spreadsheets/)&lt;your sheet id&gt;/values/Sheet1?key=&lt;your API key&gt;

For example:

If the** Google Sheets** link is *as below:*

*https://docs.google.com/spreadsheets/d/1Ksd125lAsDd0_wnMWgLNUiEpKOUPaok7xfh64s-VO7M/edit?usp=sharing*, then the

**Sheet Id** is: ***1Ksd125lAsDd0_wnMWgLNUiEpKOUPaok7xfh64s-VO7M***

**API Key** is: ***AIzaSyAfoANOeLkFCCyohjL8cOdJLhrhGefqEy8***

Adding both the values in the syntax above:

*https://sheets.googleapis.com/v4/spreadsheets/1Ksd125lAsDd0_wnMWgLNUiEpKOUPaok7xfh64s-VO7M/values/Sheet1?key=AIzaSyAfoANOeLkFCCyohjL8cOdJLhrhGefqEy8*

You should now be able to view your data in the sheet.

## Step 2: Configuring AEM to fetch the content of the Google Sheets {#step-configuring-aem-to-fetch-the-content-of-the-google-sheets}

The following section describes how to configure Adobe Experience Manager (AEM) to fetch content from the Google Sheets.

1. Navigate to your AEM instance and click the tools icon from left sidebar. Click **Sites** --&gt; **ContextHub**, as shown in the figure below.

   ![](assets/screen_shot_2019-04-22at53222pm.png)

1. **Create a new ContextHub Store Configuration**

    1. Navigate to **global** &gt; **default** &gt; **ContextHub Configuration**.  
    
    1. Click** Create &gt; Configuration Cotainer **and enter the title as** ContextHubDemo**.
    
    1. **Navigate **to** ContextHubDemo **&gt;** ContentHub Store Configuration... **to open the** Configure **wizard** 
       **
    
    1. Enter the **Title **as** Google Sheets**, **Store Name **as **googlesheets**, and **Store Type **as** contexthub.generic-jsonp  
       **
    
    1. Click** Next**
    1. Enter your specific json configuration**.** For example, you can use the following json for demo purposes.
    1. Click **Save**.

   ```
   {
     "service": {
       "host": "sheets.googleapis.com",
       "port": 80,
       "path": "/v4/spreadsheets/<your sheet it>/values/Sheet1",
       "jsonp": false,
       "secure": true,
       "params": {
         "key": "<your API key>"
       }
     },
     "pollInterval": 3000
   }
   ```

   >[!NOTE]
   >
   >In the above sample code, **pollInterval** defines the frequency at which the values are refreshed (in ms).
   >
   >
   >Replace the code with your *&lt;Sheet ID&gt;* and *&lt;API Key&gt;*, that you fetched from **Step 1: Setting up Database.**

   >[!CAUTION]
   >
   >If you create your Google Sheets store configurations outside of the legacy folder (for instance in your own project folder), then targeting will not work out of the box.
   >
   >
   >In case, you want to configure the Google Sheets store configurations outside the global legacy folder, then you should must set the **Store Name** as **segmentation** and **Store Type** as **aem.segmentation**. Additionally, you have to skip the process of defining the json as defined above.

1. **Creating a Brand in Activities**

    1. Navigate from your AEM instance to **Personalization** &gt; **Activities**
    
    1. Click** Create** &gt; **Create Brand**
    
    1. Select **Brand** from the **Create Page** wizard and click **Next** 
    
    1. Enter the **Title** as **ContextHubDemo** and click **Create**. Your brand is now created as shown below.

   ![](assets/screen_shot_2019-05-05at44305pm.png)

1. 

   >[!CAUTION]
   >
   >Known Issue:
   >
   >
   >To add an area, remove the master from the URL, such as
   >
   >
   >[http://localhost:4502/libs/cq/personalization/touch-ui/content/v2/activities.html/content/campaigns/contexthubdemo/master](http://localhost:4502/libs/cq/personalization/touch-ui/content/v2/activities.html/content/campaigns/contexthubdemo/master)

   **Creating an Area in your Brand**

    1. Click **Create** &gt; **Create Area**
    
    1. Select **Area** from the** Create Page** wizard and click Next
    
    1. Enter the **Title** as **GoogleSheets** and click **Create**. Your area will be created in your activity.

1. **Creating Segments in Audiences**

    1. Navigate from your AEM instance to **Personalization** &gt; **Audiences **&gt;** We.Retail**.** 
       **
    
    1. Click** Create** &gt; **Create Context Hub Segment. New ContextHub Segment **dialog box opens.** 
       **
    
    1. Enter the **Title** as **SheetA1 1** and click **Create**. Similarly, create another segment titled as **SheetA2 2**.

1. **Editing the Segments**

    1. Select the segment **Sheets A1 1** (created in step (5)), and click **Edit** from the action bar.
    
    1. Drag and drop the **Comparison: Property - Value** component to the editor.
    1. Click the wrench icon to open the **Comparing a property with value** dialog box.
    1. Select **googlesheets/value/1/0** from the drop-down in **Property name**.
    
    1. Select the **Operator** as **Equal **from the drop-down menu.
    
    1. Enter the **Value** as **1**.

   >[!NOTE]
   >
   >The AEM validates your data from the Google Sheet by showing your segment as green.

   ![](assets/screen_shot_2019-04-23at20142pm.png)

   Similarly, edit the property values to **Sheets A1 2**.

    1. Drag and drop the **Comparison: Property - Value** component to the editor.
    1. Click the wrench icon to open the **Comparing a property with value** dialog box.
    1. Select **googlesheets/value/1/0** from the drop-down in **Property name**.
    
    1. Select the **Operator** as **Equal **from the drop-down menu.
    
    1. Enter the **Value** as **2**.

   >[!NOTE]
   >
   >The rules applied in the preceding steps are just an example as to how you set up segments for implementing the following use cases.

## Step 3: Setting up Context Hub Configurations in AEM Screens Channel {#step-setting-up-context-hub-configurations-in-aem-screens-channel}

Follow the steps below to set up ContextHub configurations and segments path to AEM Screens channel.

1. Navigate to one of the AEM Screens channel (**DataDrivenRetail**) that you created, as a prerequisite.
1. Select the channel (**DataDrivenRetail**)and click **Properties** from the action bar.

   ![](assets/screen_shot_2019-05-01at43332pm.png)

1. Select the **Personalization** tab to setup the ContextHub configurations.

    1. Select the **ContextHub Path** as **libs** &gt; **settings** &gt; **cloudsettings** &gt; **default** &gt; **ContextHub Configurations** and click **Select**.  
    
    1. Select the **Segments Path** as **conf** &gt; **We.Retail **&gt; **settings** &gt; **wcm** &gt; **segments** and click **Select**.
    
    1. Click **Save & Close**.

   >[!NOTE]
   >
   >Use the ContextHub and the Segments path, where you initially saved your context hub configurations and segments.

   ![](assets/screen_shot_2019-05-01at44030pm.png)

   >[!NOTE]
   >
   >If you do not select the **Brand** under **Targeting Configuration** from the dialog box above, you will have to select the Brand and Activity when you start the process of Targeting.

1. Navigate and select the **DataDrivenRetail** from **DataDrivenAssets** &gt; **Channels **and click **Edit** from the action bar.

   >[!NOTE]
   >
   >If you have set up everything correctly, you will see **Targeting** option in the drop-down from the editor, as shown in the figure below.

   ![](assets/screen_shot_2019-05-01at44231pm.png)

   >[!NOTE]
   >
   >Once you have configured the ContextHub configurations for your channel, make sure you follow preceding steps from 1 through 4, for the other three sequence channels too if you want to follow all the use cases below.

## Use Case 1: Retail Inventory Activation {#use-case-retail-inventory-activation}

The following use case demonstrates three different images based on the values in your Google Sheet.

### Description {#description}

This Use Case showcases the retail inventory stock for three different colored sweatshirts. Depending on the number of sweatshirts available in stock that is recorded in Google Sheets, the image (red, green, or blue sweatshirt) with highest number is displayed on the screen.

For this Use Case, the Red, Green, or Blue sweater will display on your screen based on the highest value of number of sweaters that is available.

### Procedure {#procedure}

Follow the steps below to implement the Retail Inventory Activation use case:

1. **Populating the Google Sheets**

    1. Navigate to the ContextHubDemo Google Sheet.
    1. Add three columns (Red, Green, and Blue) with corresponding values for three different sweatshirts.

   ![](assets/screen_shot_2019-05-06at101755am.png)

1. **Configuring the Audiences as per the requirements**

    1. Navigate to the segments in your audience (created in step(5) of section ***Step 2: Configuring AEM to fetch the content of the Google Sheets***).
    1. Add three new segments **For_Red**, **For_Green**, and **For_Blue**. 
    
    1. Select **For_Red** and click **Edit** from the action bar.  
    
    1. Drag and drop the **Comparison : Property - Property** to the editor and click the configure icon to edit the properties.
    1. Select **googlesheets/value/1/2** from the drop-down in **First Property name**
    
    1. Select the **Operator** as **greater-than **from the drop-down menu
    
    1. Seelect **Data Type** as **number** 
    
    1. Select **googlesheets/value/1/1** from the drop-down in **Second Property name**
    
    1. Drag and drop **another Comparison : Property - Property **to the editor and click the configure icon to edit the properties.
    1. Select **googlesheets/value/1/2** from the drop-down in **First Property name**
    
    1. Select the **Operator** as **greater-than **from the drop-down menu
    
    1. Select **Data Type** as **number** 
    
    1. Select **googlesheets/value/1/0** from the drop-down in **Second Property name**

   ![](assets/screen_shot_2019-05-06at102600am.png)

   Similarly, edit and add comparison property rules to **For_Blue** segment as shown in the figure below:

   ![](assets/screen_shot_2019-05-06at103728am.png)

   Similarly, edit and add comparison property rules to** For_Green **segment as shown in the figure below:

   ![](assets/screen_shot_2019-05-06at103418am.png)

   >[!NOTE]
   >
   >You will notice that for segments **For_Green** and **For_Green**, data cannot be loaded in the editor as only the first comparison is valid as of now as per the values in the Google Sheet.

1. Navigate and select your **DataDrivenRetail **channel (a sequencel channel) and click **Edit** from the action bar. 

   ![](assets/screen_shot_2019-05-06at104257am.png)

   >[!CAUTION]
   >
   >You should have set up your **ContextHub** **Configurations** using the channel **Properties** --&gt; **Personalization** tab.

   ![](assets/screen_shot_2019-05-06at105214am.png)

   >[!NOTE]
   >
   >If you do not add the **Brand** under **Targeting Configurations** while setting up **ContextHub Configurations** for your project, as shown in the image above, you do need to select the **Brand** and **Activity** while starting the process of targeting, in the next step.

1. **Adding a default image**

    1. Add a default image to your channel and click **Targeting**.
    1. Select **Brand** and the **Activity** from the drop-down menu and click **Start Targeting**.
    
    1. Click **Start Targeting**.

   ![](assets/screen_shot_2019-05-06at121253pm.png)

   >[!NOTE]
   >
   >Before you start targeting, you must add the segments (**For_Green**, **For_Red**, and **For_Blue**) by clicking on **+ Add Experience Targeting** from the side rail as shown in the figure below.

   ![](assets/screen_shot_2019-05-06at123554pm.png)

1. Add the images to all the three different screnarios as shown below.

   ![](assets/retail_targeting.gif)

1. **Checking the Preview**

    1. Click **Preview. **Also, open your Google Sheet and update its value.** 
       **
    
    1. Change the value for all three different columns and you will notice the display image updates as per the highest value in inventory.

   ![](assets/retail_result.gif)

## Use Case 2: Travel Center Weather Activation {#use-case-travel-center-weather-activation}

The following use case demonstrates two different images based on the values in your Google Sheet.

### Description {#description-1}

For this Use Case, if your Google Sheets has Value less than 50, then an image with hot drinks will display and if the value is greater than or equal to 50, then the image with cold drinks will display. In case of some other or no value, the player will display a default image.

### Procedure {#procedure-1}

Follow the steps below to implement the travel center weather activation use case for your AEM Screens project:

1. **Populating the Google Sheets**

    1. Navigate to the ContextHubDemo Google Sheet.
    1. Add a column with **Heading1** with corresponding value for temperature.

   ![](assets/screen_shot_2019-05-08at112911am.png)

1. **Configuring the segments in Audiences as per the requirements**

    1. Navigate to the segments in your audience (created in step(5) of section ***Step 2: Configuring AEM to fetch the content of the Google Sheets***).
    1. Select the **Sheets A1 1** and click **Edit**.
    
    1. Select the comparison property and click the configure icon to edit the properties.
    1. Select **googlesheets/value/1/0** from the drop-down in **Property name**
    
    1. Select the **Operator** as **greater-than-or-equal **from the drop-down menu
    
    1. Enter the **Value** as **50**
    
    1. Similarly, Select the** Sheets A1 2 **and click **Edit**.
    
    1. Select the comparison property and click the configure icon to edit the properties.
    1. Select **googlesheets/value/1/0** from the drop-down in **Property name**
    
    1. Select the **Operator** as **less-than **from the drop-down menu
    
    1. Enter the **Value** as **50**

1. Navigate and select your channel () and click **Edit** from the action bar. In the following example, **DataDrivenWeather**, a sequential channel is used to showcase the functionality.

   >[!NOTE]
   >
   >Your channel should already have a default image and the Audiences should be pre-configured as described in Step (3)

   ![](assets/screen_shot_2019-05-08at113022am.png)

   >[!CAUTION]
   >
   >You should have set up your **ContextHub** **Configurations** using the channel **Properties** --&gt; **Personalization** tab.

   ![](assets/screen_shot_2019-05-08at114106am.png)

   >[!NOTE]
   >
   >If you do not add the **Brand** under **Targeting Configurations** while setting up **ContextHub Configurations** for your project, as shown in the image above, you do need to select the **Brand** and **Activity** while starting the process of targeting, in the next step.

1. Select **Targeting** from the editor and select **Brand** and the **Activity** from the drop-down menu and click **Start Targeting**.

   >[!NOTE]
   >
   >If you added the **Brand** under **Targeting Configurations** while setting up **ContextHub Configurations** for your project, you do not need to select the **Brand** and **Activity** in this step.

   ![](assets/new_activity3.gif)

1. Checking the Preview

    1. Click **Preview. **Also, open your Google Sheet and update its value.** 
       **
    
    1. Change the value to less than 50, you should be able to view the an image of summer drinks. If the value in the Google Sheet is 50 or greater than should be able to view the an image of hot drink.** 
       **

   ![](assets/result3.gif)

## Use Case 3: Hospitality Reservation Activation {#use-case-hospitality-reservation-activation}

The following use case demonstrates two different images based on the values and the formula applied in your Google Sheet.

### Description {#description-2}

For this Use Case, the Google Sheet is populated with percentage of reservation on two restaurants **Restaurant1** and **Restaurant2**. A formula is applied based on values of Restaurant1 and Restaurant2 and based on the formula, value 1 or 2 is assigned to the **AdTarget** Column.

If the **Restaurant1** &gt; **Restaurant2**, then **AdTaget** value is 1 otherwise **AdTarget** is assigned value 2. Value 1 generates *Steak food* option and Value 2 results in display of *Thai food* option on your display screen.

### Procedural Approach {#procedural-approach}

Follow the steps below to implement the hospitality reservation activation use case for your AEM Screens project:

1. Populating the Google Sheets and adding the formula.

   For example, apply the formula to the third column **AdTarget**, as shown in the figure below.

   ![](assets/screen_shot_2019-04-29at94132am.png)

1. **Configuring the segments in Audiences as per the requirements**

    1. Navigate to the segments in your audience (created in step(5) of section ***Step 2: Configuring AEM to fetch the content of the Google Sheets***).
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
   >Your channel should already have a default image and the Audiences should be pre-configuredas described in Step (3).

   ![](assets/screen_shot_2019-05-08at14652pm.png)

   >[!CAUTION]
   >
   >You should have set up your **ContextHub** **Configurations** using the channel **Properties** --&gt; **Personalization** tab.

   ![](assets/screen_shot_2019-05-08at14903pm.png)

   >[!NOTE]
   >
   >If you do not add the **Brand** under **Targeting Configurations** while setting up **ContextHub Configurations** for your project, as shown in the image above, you do need to select the **Brand** and **Activity** while starting the process of targeting, in the next step.

1. Select **Targeting** from the editor and select **Brand** and the **Activity** from the drop-down menu and click **Start Targeting**.
1. Checking the Preview

    1. Click **Preview. **Also, open your Google Sheet and update its value.** 
       **
    
    1. Change the value in Restaurant1 &gt; Restaurant2, you should be able to view the an image of steak picture and Restaurant1 &lt; Restaurant12, you should be able to view thai food picture on your display screen.** 
       **

   ![](assets/result5.gif)

## Use Case 4: Digital Menu Board Text Overlay {#use-case-digital-menu-board-text-overlay}

The following use case demonstrates a digital menu board use case commonly prevalent in restaurants and fast food joints.

### Description {#description-3}

The following Use Case describes the usage of text overlay in a sequential channel and how the value update of price in the Google Sheets triggers an update in the text overlay component update.

### Procedural Approach {#procedural-approach-1}

Follow the steps below to implement the digital menu board with text overlay use case for your AEM Screens project:

1. **Populating the Google Sheets**

    1. Navigate to your Google Sheets.
    1. Add a column with pricing value for the use case, as shown in the figure below.

   ![](assets/screen_shot_2019-05-05at111344am.png)

1. **Adding an Image to Sequence Channel**

    1. Navigate and select your channel (**DataDrivenAssets** --&gt; **Channels** --&gt; **DataDrivenTextOverlay**).
    
    1. Click **Edit** from the action bar to open the editor.
    1. Drag and drop an apple pie image in the editor.

   ![](assets/screen_shot_2019-05-05at112933am.png)

1. **Adding Text Overlay to the image**

    1. Select the image in the editor and click configure.
    1. Navigate to the **Text Overlay** tab and add the text overlay to the image. To get the value from your Google Sheets, make sure the value is enclosed in the curly brances. For example, the price is fetched from the google sheets and is mentioned as **{price}** while defining the text overlay.  
    
    1. Navigate to **ContextHub** tab and configure the value that is to be fetched from the google sheets, as shown in the figure below.

   ![](assets/textoverlay_result.gif)

1. **Checking the Preview**

    1. Click **Preview. **Also, open your Google Sheet and update its value.** 
       **
    
    1. Change the under** Price **and you will notice the value as used in the text overlay updates accordingly**, **as shown in the figure below.** 
       **

   ![](assets/textoverlay_result-1.gif)

