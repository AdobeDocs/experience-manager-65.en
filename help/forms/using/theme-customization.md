---
title: Theme Customization
description: Learn how to customize the theme of AEM Forms application. You can customize the HTML code and CSS file to provide organization-specific look and feel.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app

exl-id: 9b8c5933-b783-48f9-b463-15a01e06ee98
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Theme Customization {#theme-customization}

You can customize the HTML code and CSS file to provide a distinct organization-specific look and feel to AEM Forms app. For example, you can change the background color and height of tasks or Startpoints. The following example provides instructions to change:

* display instructions in place of the description
* number of display routes
* background gradient color

## Steps {#steps}

1. Open your project.

    * For iOS, open `Capture.xcodeproj` in Xcode
    * For Android, open the Android project in Eclipse.
    * For Windows, open `MWSWindows.sln` in Visual Studio.

1. Navigate to the templates folder.

    * In Xcode, navigate to the **Capture &gt; www &gt; wsmobile &gt; js &gt; runtime &gt; templates** folder.
    * In Eclipse, navigate to the **assets &gt; www &gt; wsmobile &gt; js &gt; runtime &gt; templates** folder.
    * In Visual Studio, navigate to the **MWSWindows &gt; www &gt; wsmobile &gt; js &gt; runtime &gt; templates** folder.

1. Open the `template.html` file for editing.
1. Locate the following string:

   ```jsp
   <%if ( (task.description !== "") && (task.description !== null) && (typeof task.description !== null) && (typeof task.description !== 'undefined') ) {%>
                  <div class="description_details">
                    <%= task.description %>
                  </div>
                 <%} else
   ```

   Replace it with `<%`.

1. Locate the following code in the `template.html` file:

   ```jsp
   <ul id="task_menu_list">
                                   <li class="approve" title="<%= task.availableCommands.directCommands[0]%>" data-routename="<%= task.availableCommands.directCommands[0]%>">
                                       <%= task.availableCommands.directCommands[0]%>
                                   </li>
                                   <li class="reject last" title="<%= task.availableCommands.directCommands[1]%>" data-routename="<%= task.availableCommands.directCommands[1]%>">
                                       <%= task.availableCommands.directCommands[1]%>
                                   </li>
   ```

1. Comment the following line and save the file.

   ```jsp
   task.availableCommands.directCommands[1]%>">
   <%= task.availableCommands.directCommands[1]%>
   </li>
   ```

1. Navigate to the css folder.

    * In Xcode, navigate to **Capture &gt; www &gt; wsmobile &gt; css**.
    * In Eclipse, navigate to **assets &gt; www &gt; wsmobile &gt; css**.
    * In Visual Studio, navigate to **MWSWindows &gt; www &gt; wsmobile &gt; css**.

1. Open the `_style.css` file for editing.
1. For Background image, change `#323232` to `#fff`.
1. Save the changes and close `_style.css` file.
1. Open the AEM Forms app.

   The AEM Forms app now displays instructions instead of description.
