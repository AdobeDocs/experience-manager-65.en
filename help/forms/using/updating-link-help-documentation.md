---
title: Updating the link to the documentation
description: How-to update the destination of Workspace Help link in AEM Forms workspace to point to your custom documentation link.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: ca637bea-05c1-4920-9283-e782f07607de
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: Admin, User, Developer
---
# Updating the link to the documentation {#updating-the-link-to-the-documentation}

You can access the default help content for AEM Forms workspace by selecting **Help &gt; Workspace Help**. It points to the online documentation on Adobe's website. However, you can update it to point to any other URL.

Consider the following use cases where you may want to change the default help URL:

* For providing localized help in a language of your choice.
* For providing customized help content for your customized workspace.

To update the URL of the online documentation, follow the [Generic Steps of customization](/help/forms/using/generic-steps-html-workspace-customization.md) and then the following steps.

1. Copy the `userinfo.html` file from `/libs/ws/js/runtime/templates` to `/apps/ws/js/runtime/templates`.
1. Change:

   ```html
   <ul class="helpmenu">
     <li>
       <a href="https://www.adobe.com/go/learn_aemforms_documentation_63" title="<%= $.t('index.header.dropdown.WorkspaceHelp')%>" target="_blank"><%= $.t('index.header.dropdown.WorkspaceHelp')%></a>
     </li>
   ```

   to

   ```html
   <ul class="helpmenu">
     <li>
       <a href="<!--place new help url here-->" title="<%= $.t('index.header.dropdown.WorkspaceHelp')%>" target="_blank"><%= $.t('index.header.dropdown.WorkspaceHelp')%></a>
     </li>
   ```

1. Do the following:

    1. Open /apps/ws/js/registry.js for editing.
    1. Search and replace `text!/lc/libs/ws/js/runtime/templates/userinfo.html` with `text!/lc/apps/ws/js/runtime/templates/userinfo.html`.
