---
title: Gesture customization
description: Learn how to customize the gestures on AEM Forms app. You can customize the gestures to provide a distinct method of interacting with the application.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
exl-id: 6debb1a7-7889-4fdd-87c7-ecb87cc0b1f5
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Gesture customization {#gesture-customization}

You can customize the gestures of AEM Forms app to provide a distinct method of interacting with the app. For example, you can add new gestures to open or close a task or Startpoint.

## To customize gestures in AEM Forms app {#to-customize-gestures-in-aem-forms-app}

In the AEM Forms app, the left swipe opens up a new task or Startpoint while right swipe does nothing. The following example provides steps to open up a new task or Startpoint on performing the right-swipe gestures in the AEM Forms app.

1. Open your project.

    * For iOS, open `Capture.xcodeproj` in Xcode
    * For Android, open the Android project in Eclipse.
    * For Windows, open `MWSWindows.sln` in Visual Studio.

1. Navigate to the views folder and open the `task.js` file for editing.

    * In Xcode, navigate to the **Capture &gt; www &gt; wsmobile &gt; js &gt; runtime &gt; views** folder.
    * In Eclipse, navigate to the **assets &gt; www &gt; wsmobile &gt; js &gt; runtime &gt; views** folder.
    * In Visual Studio, navigate to the **MWSWindows &gt; www &gt; wsmobile &gt; js &gt; runtime &gt; views** folder.

   >[!NOTE]
   >
   >The task.js file contains the backbone view associated with each task or Startpoint listed in the task or Startpoint lists.

1. In the `task.js` file, search for the events property of the view.

   The events property is a map with each entry in the format:

   `"EventName Selector": "Function"`

   When you trigger a JavaScript event named `EventName`on an HTML element specified by `Selector`, the `Function`is called.

1. Find

    * "select .taskContentArea" : "onTaskClick",

      "select .taskOpenArea" : "onTaskClick",

      "select .task-content" : "onTaskClick",

      "select .last_empty_div" : "onTaskClick",

   and replace with

    * "swipe .taskContentArea" : "onTaskClick",

      "swipe .taskOpenArea" : "onTaskClick",

      "swipe .task-content" : "onTaskClick",

      "swipe .last_empty_div" : "onTaskClick",

1. Save and close the `task.js` file.
1. Build and run the AEM Forms app. Now you can open a using with left-swipe and right-swipe.

Similarly, you can make changes in other views for various combinations of gestures, HTML elements, and functions.
