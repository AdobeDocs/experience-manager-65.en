---
title: Embedding a REACT application using the AEM SPA Editor and Integrating with AEM Screens Analytics
seo-title: Embedding a REACT application using the AEM SPA Editor and Integrating with AEM Screens Analytics
description: Follow this page to learn how to embed an interactive single page application using REACT (or Angular) using the AEM SPA editor that can be configured by business professionals in AEM and also how to integrate your interactive application with offline Adobe Analytics.
seo-description: Follow this page to learn how to embed an interactive single page application using REACT (or Angular) using the AEM SPA editor that can be configured by business professionals in AEM and also how to integrate your interactive application with offline Adobe Analytics.
uuid: 02ae67bb-058a-4aa9-b484-0c60a8d897ad
contentOwner: jsyal
products: SG_EXPERIENCEMANAGER/6.4/SCREENS
content-type: reference
topic-tags: developing
discoiquuid: 70fdeeb8-0c82-44f3-a6fa-ee4dfb32a90b
---

# Embedding a REACT application using the AEM SPA Editor and Integrating with AEM Screens Analytics{#embedding-a-react-application-using-the-aem-spa-editor-and-integrating-with-aem-screens-analytics}

This section describes how to embed an interactive single page application using REACT (or Angular) using the AEM SPA editor that can be configured by business professionals in AEM and also how to integrate your interactive application with offline Adobe Analytics.

## Using the AEM SPA Editor {#using-the-aem-spa-editor}

Follow the steps below to use the AEM SPA Editor:

1. Clone the AEM SPA Editor repo at [https://github.com/adobe/aem-spa-project-archetype.](https://github.com/adobe/aem-spa-project-archetype)

   >[!NOTE]
   >
   >This archetype creates a minimal Adobe Experience Manager project as a starting point for your own SPA projects. The properties that must be provided when using this archetype allow to name as desired all parts of this project.

1. Follow the readme instructions to create an AEM SPA editor archetype project:

   ```
   mvn clean install archetype:update-local-catalog
   mvn archetype:crawl
   
   mvn archetype:generate \
   -DarchetypeCatalog=internal \
   -DarchetypeGroupId=com.adobe.cq.spa.archetypes \
   -DarchetypeArtifactId=aem-spa-project-archetype \
   -DarchetypeVersion=1.0.3-SNAPSHOT \
   ```

   >[!NOTE]
   >
   >We use the **GroupId** as ***com.adobe.aem.screens*** and the **ArtifactId** as ***My Sample SPA*** (which is the defaults). You can choose your own as needed.

1. Once the project is created, either use an IDE or editor of your choice and import the generated Maven project.
1. Deploy to your local AEM instance using the command ***mvn clean install -PautoInstallPackage***.

### Editing content in the REACT app {#editing-content-in-the-react-app}

To edit the contents in the REACT app:

1. Navigate to ***http://localhost:4502/editor.html/content/mysamplespa/en/home.html*** (replace the hostname, port and project name as applicable).
1. You should be able to edit the text being displayed in the Hello world application.

### Adding the interactive REACT app to AEM Screens {#adding-the-interactive-react-app-to-aem-screens}

Follow the steps below to add the interative REACT app to AEM Screens:

1. Create a new AEM Screens project. Refer to [Creating and Managing Projects](/help/screens/creating-a-screens-project.md) for more details.

   >[!NOTE]
   >
   >Create a **Sequence Channel** while creating a channel in the **Channels** folder of your Screens project.
   >
   >Refer to [Creating and Managing Channels](/help/screens/managing-channels.md) for more details.

   ![screen_shot_2019-02-15at100330am](assets/screen_shot_2019-02-15at100330am.png)

1. Edit any sequence channel and drag and drop an embedded page component.

   Refer to [Adding Components to a Channel](/help/screens/adding-components-to-a-channel.md) for more details.

   >[!NOTE]
   >
   >Make sure you add the user interaction event when assigning the channel to the display.

1. Click **Edit** from the action bar to edit the properties of the sequence channel. 

   ![screen_shot_2019-02-15at100555am](assets/screen_shot_2019-02-15at100555am.png)

1. Drag and drop the **Embedded Page** component and select the home page under the mysamplespa application for example, ***/content/mysamplespa/en/home***.

   ![screen_shot_2019-02-15at101104am](assets/screen_shot_2019-02-15at101104am.png)

1. Register a player against this project and you should now be able to see your interactive application running on AEM Screens.

   Refer to [Device Registration](/help/screens/device-registration.md) to learn in detail about registering a device.

## Integrating the SPA with Adobe Analytics with Offline Capability through AEM Screens {#integrating-the-spa-with-adobe-analytics-with-offline-capability-through-aem-screens}

Follow the steps below to integrate the SPA with Adobe Analytics with offline capability through AEM Screens:

1. Configure Adobe Analytics in AEM Screens.

   Refer to [Configuring Adobe Analytics with AEM Screens](/help/screens/configuring-adobe-analytics-aem-screens.md) to learn how to perform sequencing in Adobe Analytics with AEM Screens and send custom events using offline Adobe Analytics.

1. Edit your react app in the IDE/editor of your choice (especially the text component or other component which you wish to start emitting events).
1. On the click event or other event that you wish to capture for your component, add the analytics information using the standard data model.

   Refer to [Configuring Adobe Analytics with AEM Screen](/help/screens/configuring-adobe-analytics-aem-screens.md)s for more details.

1. Call the AEM Screens Analytics API to save the event offline and send it in bursts to Adobe Analytics.

   For example,

   ```
   handleClick() {
       if ((window.parent) && (window.parent.CQ) && (window.parent.CQ.screens) && (window.parent.CQ.screens.analytics))
       {
           var analyticsEvent = {};
           analyticsEvent['event.type'] = 'play'; // Type of event
    analyticsEvent['event.coll_dts'] = new Date().getTime(); // Start of collecting the event
    analyticsEvent['event.dts_start'] = new Date().getTime(); // Event start
    analyticsEvent['content.type'] = 'Washing machine'; // Mime Type or product category
    analyticsEvent['content.action'] = 'Path to the washing machine asset in AEM'; // Path in AEM to relevant asset
    analyticsEvent['trn.product'] = 'Washing machine Model number'; // Product being explored
    analyticsEvent['trn.amount'] = 1000; // Product pricing or other numeric value or weight
    analyticsEvent['event.dts_end'] = new Date().getTime(); // Event end
    analyticsEvent['event.count'] = 100; // Numeric value that may count a number of clicks or keystrokes or wait time in seconds for example
    analyticsEvent['event.value'] = 'My favorite analytics event';
           analyticsEvent['trn.quantity'] = 10; // Quantity of product selection
    analyticsEvent['event.subtype'] = 'end'; // Event subtype if applicable
    window.parent.CQ.screens.analytics.sendTrackingEvent(analyticsEvent);
       }
   }
   ```

   >[!NOTE]
   >
   >The player firmware automatically adds more details about the player and its runtime environment to the custom analytics data that you send. Hence you may not need to capture low level OS/device details unless absolutely necessary. You just need to focus on the business analytics data.

