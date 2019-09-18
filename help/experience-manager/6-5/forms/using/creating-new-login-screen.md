---
title: Creating a new login screen
seo-title: Creating a new login screen
description: How-to modify the login page of LiveCycle modules, for example of AEM Forms workspace or Forms Manager.
seo-description: How-to modify the login page of LiveCycle modules, for example of AEM Forms workspace or Forms Manager.
uuid: 9c115efc-7f6b-4698-a9cd-133656ebf473
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: f6b06ec6-e93e-41e2-8cf5-c3a0ae4a1cd9
index: y
internal: n
snippet: y
---

# Creating a new login screen{#creating-a-new-login-screen}

You can modify the login screen of all AEM Forms modules that use the AEM Forms login screen. For example, the modifications affect the login screen of, both, Forms Manager and AEM Forms workspace.

### Prerequisite {#prerequisite}

1. Log in at `/lc/crx/de` with Administrator permissions.
1. Perform the following actions:

    1. Replicate the hierarchical structure: of `/libs/livecycle/core/content` at `/apps/livecycle/core/content`. Maintain the same (node/folder) properties and access control.
    
    1. Copy the content folder: from `/libs/livecycle/core` to `/apps/livecycle/core`.  
    
    1. Delete the contents of `/apps/livecycle/core` folder.

1. Perform these actions:

    1. Replicate the hierarchical structure: of `/libs/livecycle/core/components/login` at `/apps/livecycle/core/components/login`. Maintain the same (node/folder) properties and access control.
    
    1. Copy the components folder: from `/libs/livecycle/core` to `/apps/livecycle/core`.  
    
    1. Delete the contents of the folder: `/apps/livecycle/core/components/login`.

### Adding a new locale {#adding-a-new-locale}

1. Copy the `i18n` folder:

    * from `/libs/livecycle/core/components/login`
    * to `/apps/livecycle/core/components/login`

1. Delete all the folders inside `i18n` except one, say `en`.
1. On the folder `en`, perform these actions:

    1. Rename the folder to the locale name you wish to support. For example, `ar`.
    1. Change the property `jcr:language` value to `ar`(for the `ar` folder).

   >[!NOTE]
   >
   >If locale is a language-country code combination, say, `ar-DZ`, then change the folder name and property value to `ar-DZ`.

1. Copy `login.jsp`:

    * from `/libs/livecycle/core/components/login` 
    * to `/apps/livecycle/core/components/login`

1. Modify the following snippet of code for `/apps/livecycle/core/components/login/login.jsp`:

   ***Locale is language code***

   ```
   String browserLocale = "en";
       for(int i=0; i<locales.length; i++)
       {
           String prioperty = locales[i];
           if(prioperty.trim().startsWith("en")) {
               browserLocale = "en";
               break;
           }
           if(prioperty.trim().startsWith("de")){
               browserLocale = "de";
               break;
           }
           if(prioperty.trim().startsWith("ja")){
               browserLocale = "ja";
               break;
           }
           if(prioperty.trim().startsWith("fr")){
               browserLocale = "fr";
               break;
           }
       }
   
   To
   
   String browserLocale = "en";
       for(int i=0; i<locales.length; i++)
       {
           String prioperty = locales[i];
           if(prioperty.trim().startsWith("ar")) {
               browserLocale = "ar";
               break;
           }
           if(prioperty.trim().startsWith("en")) {
               browserLocale = "en";
               break;
           }
           if(prioperty.trim().startsWith("de")){
               browserLocale = "de";
               break;
           }
           if(prioperty.trim().startsWith("ja")){
               browserLocale = "ja";
               break;
           }
           if(prioperty.trim().startsWith("fr")){
               browserLocale = "fr";
               break;
           }
       }
   ```

   ***Locale is language-country code***

   ```
   String browserLocale = "en";
       for(int i=0; i<locales.length; i++)
       {
           String prioperty = locales[i];
           if(prioperty.trim().startsWith("en")) {
               browserLocale = "en";
               break;
           }
           if(prioperty.trim().startsWith("de")){
               browserLocale = "de";
               break;
           }
           if(prioperty.trim().startsWith("ja")){
               browserLocale = "ja";
               break;
           }
           if(prioperty.trim().startsWith("fr")){
               browserLocale = "fr";
               break;
           }
       }
   
   To
   
   String browserLocale = "en";
       for(int i=0; i<locales.length; i++)
       {
           String prioperty = locales[i];
           if(prioperty.trim().equalsIgnoreCase("ar-DZ")) {
               browserLocale = "ar-DZ";
               break;
           }
           if(prioperty.trim().startsWith("en")) {
               browserLocale = "en";
               break;
           }
           if(prioperty.trim().startsWith("de")){
               browserLocale = "de";
               break;
           }
           if(prioperty.trim().startsWith("ja")){
               browserLocale = "ja";
               break;
           }
           if(prioperty.trim().startsWith("fr")){
               browserLocale = "fr";
               break;
           }
       }
   ```

   ***To change Default locale***

   ```
   String browserLocale = "en";
   for(int i=0; i<locales.length; i++)
   
   To
   
   String browserLocale = "ar";
   for(int i=0; i<locales.length; i++)
   ```

### Adding new text, or modifying existing text {#adding-new-text-or-modifying-existing-text}

1. Copy `i18n` folder:

    * from `/libs/livecycle/core/components/login`
    * to `/apps/livecycle/core/components/login`

1. Now modify the value of the property `sling:message` of the node (under the desired locale code folder) for which you wish to change the text. Translation is done via the key mentioned in the value of `sling:key` property of the node.
1. For adding new key-value pair, perform the following actions. Check an example in the screenshot that follows.

    1. Create a node of type `sling:MessageEntry`, or copy an existing node and rename it, under all the locale folders.
    1. Copy `login.jsp` :

        * from `/libs/livecycle/core/components/login`  
        
        * to `/apps/livecycle/core/components/login`

    1. Modify `/apps/livecycle/core/components/login/login.jsp` to incorporate the newly added text.

   ![Add new key-value pair](assets/capture_new.png) 

   ```
   div class="loginContent">
                       <span class="loginFlow"></span>
                       <span class="loginVersion"><%= i18n.get("Version: 11.0.0") %></span>
                       <span class="loginTitle"><%= i18n.get("Login") %></span>
                       <% if (loginFailed) {%>
   
   To
   
   div class="loginContent">
                       <span class="loginFlow"></span>
                       <span class="loginVersion"><%= i18n.get("My Welcome Message") %></span>
                       <span class="loginVersion"><%= i18n.get("Version: 11.0.0") %></span>
                       <span class="loginTitle"><%= i18n.get("Login") %></span>
                       <% if (loginFailed) {%>
   ```

### Adding new style, or modifying existing style {#adding-new-style-or-modifying-existing-style}

1. Copy `login` node:

    * from `/libs/livecycle/core/content` 
    * to `/apps/livecycle/core/content`

1. Delete files `login.js` and `jquery-1.8.0.min.js`, from the node `/apps/livecycle/core/content/login.`
1. Modify the styles in the CSS file.
1. To add new styles:

    1. Add new styles to `/apps/livecycle/core/content/login/login.css`
    1. Copy `login.jsp`

        * from `/libs/livecycle/core/components/login`  
        
        * to `/apps/livecycle/core/components/login`

    1. Modify `/apps/livecycle/core/components/login/login.jsp` to incorporate the newly added styles.

1. For example:

    * Add the following to `/apps/livecycle/core/content/login/login.css`.

   ```css
   
   .newLoginContentArea {
    width: 700px;
    padding: 100px 0px 0px 100px;
   }

   ```

    * Modify following in /apps/livecycle/core/components/login.jsp.

   ```
   <div class="loginContentArea">
   
   To
   
   <div class="newLoginContentArea">
   ```

>[!NOTE]
>
>If the existing images in `/apps/livecycle/core/content/login` (copied from `/libs/livecycle/core/content/login`) are removed, then remove the corresponding references in CSS.

### Add new images {#add-new-images}

1. Follow the steps of Adding new style, or modifying existing style (documented above).
1. Add new images in `/apps/livecycle/core/content/login`. To add image:

    1. Install WebDAV client.
    1. Navigate to `/apps/livecycle/core/content/login` folder, using webDAV client. For more information, see: [http://dev.day.com/docs/en/crx/current/how_to/webdav_access.html](http://docs.adobe.com/docs/en/crx/current/how_to/webdav_access.html).
    
    1. Add new images.

1. Add new styles in `/apps/livecycle/core/content/login/login.css,` corresponding to new images added in `/apps/livecycle/core/content/login`.
1. Use the new styles in `login.jsp` at `/apps/livecycle/core/components`.
1. For Example:

    * Add the following to `/apps/livecycle/core/content/login/login.css`

   ```css
   .newLoginContainerBkg {
    background-image: url(my_Bg.gif);
    background-repeat: no-repeat;
    background-position: left top;
    width: 727px;
   }
   ```

    * Modify following in /apps/livecycle/core/components/login.jsp.

   ```
   <div class="loginContainerBkg">
   
   To
   
   <div class="newLginContainerBkg">
   ```

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)

<!--
<related-links>
<a href="../../../6-5/forms/using/introduction-customizing-html-workspace.md">Introduction to Customizing AEM Forms workspace</a>
<a href="../../../6-5/forms/using/generic-steps-html-workspace-customization.md">Generic steps for AEM Forms workspace customization</a>
<a href="../../../6-5/forms/using/tasks-organizational-hierarchy-using-manager.md">Managing tasks in an organizational hierarchy using Manager View</a>
<a href="../../../6-5/forms/using/integrating-correspondence-management-html-workspace.md">Integrating Correspondence Management in AEM Forms workspace</a>
<a href="/6-5/forms/using/single-sign-timeout-handlers.md">Single Sign On and timeout handlers</a>
<a href="/6-5/forms/using/displaying-user-avatar.md">Displaying the user avatar</a>
<a href="/6-5/forms/using/displaying-information-task-summary-pane.md">Displaying information in the Task Summary pane</a>
<a href="/6-5/forms/using/changing-organization-logo-branding.md">Changing the organization logo</a>
<a href="/6-5/forms/using/changing-color-scheme-interface.md">Changing the color scheme of the interface</a>
<a href="../../../6-5/forms/using/changing-font-interface.md">Changing the font on the interface</a>
<a href="../../../6-5/forms/using/changing-locale-user-interface.md">Changing the locale of the user interface</a>
<a href="/6-5/forms/using/customizing-error-dialogs.md">Customizing error dialogs</a>
<a href="/6-5/forms/using/customizing-tabs-task.md">Customizing tabs for a task</a>
<a href="/6-5/forms/using/customizing-task-actions.md">Customizing Task Actions</a>
<a href="/6-5/forms/using/customizing-listing-process-instances.md">Customizing the listing of process instances</a>
<a href="/6-5/forms/using/customizing-task-details-page.md">Customizing the task Details page</a>
<a href="../../../6-5/forms/using/display-additional-data-in-todo-list.md">Displaying additional data in ToDo list</a>
<a href="/6-5/forms/using/getting-task-variables-summary-url.md">Getting Task Variables in Summary URL</a>
<a href="/6-5/forms/using/images-route-actions.md">Images for Route Actions</a>
<a href="../../../6-5/forms/using/creating-new-login-screen.md">Creating a new login screen</a>
<a href="/6-5/forms/using/minification-javascript-files.md">Minification of the JavaScript files</a>
<a href="/6-5/forms/using/sorting-tracking-tables-add-columns.md">Sorting of Tracking tables and adding more columns</a>
<a href="/6-5/forms/using/updating-link-help-documentation.md">Updating the link to the documentation</a>
<a href="/6-5/forms/using/two-html-workspace-instances-one.md">Hosting two AEM Forms workspace instances on one server</a>
</related-links>
-->

