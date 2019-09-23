---
title: Generic steps for AEM Forms workspace customization
seo-title: Generic steps for AEM Forms workspace customization
description: How to get started customizing AEM Forms workspace user interface.
seo-description: How to get started customizing AEM Forms workspace user interface.
uuid: 12bac6e0-75d2-4eba-9edf-354c1776d8b6
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: 14f1fc86-0137-4a51-9eb1-42bf9a376854
index: y
internal: n
snippet: y
---

# Generic steps for AEM Forms workspace customization{#generic-steps-for-aem-forms-workspace-customization}

The generic steps to perform any customizations are:

1. Log in to CRXDE Lite by accessing `http://[server]:[port]/lc/crx/de/index.jsp`.
1. Create a folder named `ws`at `/apps`, if it does not exist. Click **[!UICONTROL Save All]**.
1. Browse to `/apps/ws`, and navigate to the **[!UICONTROL Access Control]** tab.
1. In the **[!UICONTROL Access Control]** list, click **[!UICONTROL +]** to add a new entry. Click **[!UICONTROL +]** again.
1. Search and select the **PERM_WORKSPACE_USER **Principal.

   ![Select PERM_WORKSPACE_USER principal as part of the generic steps to customize HTML Workspace](assets/perm_workspace_user.png)

1. Give `jcr:read` privilege to the Principal.
1. Click **[!UICONTROL Save All]**.
1. Copy the `GET.jsp` and `html.jsp`files from the `/libs/ws`folder to the `/apps/ws` folder.
1. Copy the `/libs/ws/locales` folder in the `/apps/ws` folder. Click **[!UICONTROL Save All]**.
1. Update the references and relative paths in the `GET.jsp` file, as shown below, and click **[!UICONTROL Save all]**.

   ```
   <meta http-equiv="refresh" content="0;URL='/lc/apps/ws/index.html'" />
   ```

1. Do the following for CSS customizations:

    1. Navigate to the `/apps/ws` folder and create a new folder named `css`.
    
    1. In the `css`folder folder, create a new file named `newStyle.css`.
    
    1. Open `/apps/ws/html`.jsp and change from

   ```css
   <link lang="en" rel="stylesheet" type="text/css" href="css/style.css" />
   <link lang="en" rel="stylesheet" type="text/css" href="css/jquery-ui.css"/>
   ```

   to

   ```css
   <link lang="en" rel="stylesheet" type="text/css" href="../../libs/ws/css/style.css" />
   <link lang="en" rel="stylesheet" type="text/css" href="css/newStyle.css" />
   <link lang="en" rel="stylesheet" type="text/css" href="../../libs/ws/css/jquery-ui.css"/>
   ```

   >[!NOTE]
   >
   >Place the entry of the user-defined CSS file after the entry of newStyle.css, as shown above.

1. In the /apps/ws/html.jsp file, change from

   ```css
   <script data-main="js/main" src="js/libs/require/require.js"></script>
   ```

   to

   ```css
   <script data-main="js/main" src="../../libs/ws/js/libs/require/require.js"></script>
   ```

1. Do the following:

    1. Create a folder named `js`at `/apps/ws`. Click **[!UICONTROL Save All]**.
    
    1. Create a folder named `libs`at `/apps/ws/js`. Click **[!UICONTROL Save All]**.
    
    1. Create a folder named `jqueryui`at `/apps/ws/js/libs`. Click **[!UICONTROL Save All]**.
    
    1. Copy `/libs/ws/js/libs/jqueryui/jquery.ui.datepicker-ja.js` to `/apps/ws/js/libs/jqueryui`. Click **[!UICONTROL Save All]**.

1. Do the following for HTML customizations:

    1. Under `/apps/ws/js`, create a folder named `runtime`. Click **[!UICONTROL Save All]**.
    
    1. Under `/apps/ws/js/runtime`, create a folder named `templates`. Click **[!UICONTROL Save All]**.
    
    1. Copy `/libs/ws/js/main.js` to `/apps/ws/js/main.js`.
    
    1. Copy /libs/ws/js/registry.js to `/apps/ws/js/registry.js`.

1. Click **[!UICONTROL Save All]**, clear cache, and refresh AEM Forms workspace.

   Access the URL `http://[server]:[port]/lc/ws` and log in with administrator/password credentials. The browser redirects to `http://[server]:[port]/lc/apps/ws/index.html`.

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)

<!--
<related-links>
<a href="../../forms/using/introduction-customizing-html-workspace.md">Introduction to Customizing AEM Forms workspace</a>
<a href="../../forms/using/generic-steps-html-workspace-customization.md">Generic steps for AEM Forms workspace customization</a>
<a href="../../forms/using/tasks-organizational-hierarchy-using-manager.md">Managing tasks in an organizational hierarchy using Manager View</a>
<a href="../../forms/using/integrating-correspondence-management-html-workspace.md">Integrating Correspondence Management in AEM Forms workspace</a>
<a href="/forms/using/single-sign-timeout-handlers.md">Single Sign On and timeout handlers</a>
<a href="/forms/using/displaying-user-avatar.md">Displaying the user avatar</a>
<a href="/forms/using/displaying-information-task-summary-pane.md">Displaying information in the Task Summary pane</a>
<a href="/forms/using/changing-organization-logo-branding.md">Changing the organization logo</a>
<a href="/forms/using/changing-color-scheme-interface.md">Changing the color scheme of the interface</a>
<a href="../../forms/using/changing-font-interface.md">Changing the font on the interface</a>
<a href="../../forms/using/changing-locale-user-interface.md">Changing the locale of the user interface</a>
<a href="/forms/using/customizing-error-dialogs.md">Customizing error dialogs</a>
<a href="/forms/using/customizing-tabs-task.md">Customizing tabs for a task</a>
<a href="/forms/using/customizing-task-actions.md">Customizing Task Actions</a>
<a href="/forms/using/customizing-listing-process-instances.md">Customizing the listing of process instances</a>
<a href="/forms/using/customizing-task-details-page.md">Customizing the task Details page</a>
<a href="../../forms/using/display-additional-data-in-todo-list.md">Displaying additional data in ToDo list</a>
<a href="/forms/using/getting-task-variables-summary-url.md">Getting Task Variables in Summary URL</a>
<a href="/forms/using/images-route-actions.md">Images for Route Actions</a>
<a href="../../forms/using/creating-new-login-screen.md">Creating a new login screen</a>
<a href="/forms/using/minification-javascript-files.md">Minification of the JavaScript files</a>
<a href="../../forms/using/generic-steps-html-workspace-customization.md">Sorting of Tracking tables and adding more columns</a>
<a href="/forms/using/updating-link-help-documentation.md">Updating the link to the documentation</a>
<a href="/forms/using/two-html-workspace-instances-one.md">Hosting two AEM Forms workspace instances on one server</a>
</related-links>
-->

