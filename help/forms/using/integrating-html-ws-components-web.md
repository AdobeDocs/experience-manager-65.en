---
title: Integrating AEM Forms workspace components in web applications
description: How to reuse AEM Forms workspace components in your own webapps to use functionality and provide tight integration.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: bb4a500d-c34f-4586-83f0-ad7ef69b4fb1
solution: Experience Manager, Experience Manager Forms
feature: HTML5 Forms, Adaptive Forms
role: Admin, User, Developer
---
# Integrating AEM Forms workspace components in web applications {#integrating-aem-forms-workspace-components-in-web-applications}

You can use AEM Forms workspace [components](/help/forms/using/description-reusable-components.md) in your own web application. The following sample implementation uses components from an AEM Forms workspace dev package installed on a CRX&trade; instance to create a web application. Customize the solution below to suit your specific needs. The sample implementation reuses `UserInfo`, `FilterList`, and `TaskList`components inside a web portal.

1. Log into CRXDE Lite environment at `https://'[server]:[port]'/lc/crx/de/`. Ensure that you have an AEM Forms workpace dev package installed.
1. Create a path `/apps/sampleApplication/wscomponents`.
1. Copy css, images, js/libs, js/runtime, and js/registry.js

    * from `/libs/ws`
    * to `/apps/sampleApplication/wscomponents`.

1. Create a demomain.js file inside /apps/sampleApplication/wscomponents/js folder. Copy code from /libs/ws/js/main.js into demomain.js.
1. In demomain.js, remove the code to initialize Router and add the following code:

   ```javascript
   require(['initializer','runtime/util/usersession'],
       function(initializer, UserSession) {
           UserSession.initialize(
               function() {
                   // Render all the global components
                   initializer.initGlobal();
               });
       });
   ```

1. Create a node under /content by name `sampleApplication` and type `nt:unstructured`. In the properties of this node add `sling:resourceType` of type String and value `sampleApplication`. In the Access Control List of this node add an entry for `PERM_WORKSPACE_USER` allowing jcr:read privileges. Also, in the Access Control List of `/apps/sampleApplication` add an entry for `PERM_WORKSPACE_USER` allowing jcr:read privileges.
1. In `/apps/sampleApplication/wscomponents/js/registry.js` update paths from `/lc/libs/ws/` to `/lc/apps/sampleApplication/wscomponents/` for template values.
1. In your portal home page JSP file at `/apps/sampleApplication/GET.jsp`, add the following code to include the required components inside the portal.

   ```jsp
   <script data-main="/lc/apps/sampleApplication/wscomponents/js/demomain" src="/lc/apps/sampleApplication/wscomponents/js/libs/require/require.js"></script>
   <div class="UserInfoView gcomponent" data-name="userinfo"></div>
   <div class="filterListView gcomponent" data-name="filterlist"></div>
   <div class="taskListView gcomponent" data-name="tasklist"></div>

   ```

   Also include the CSS files required for the AEM Forms workspace components.

   >[!NOTE]
   >
   >Each component is added to the component tag (having class gcomponent) while rendering. Ensure that your home page contains these tags. See the `html.jsp` file of AEM Forms workspace to know more about these base control tags.

1. To customize the components, you may extend the existing views for the required component as follows:

   ```javascript
   define([
       'jquery',
       'underscore',
       'backbone',
       'runtime/views/userinfo'],
       function($, _, Backbone, UserInfo){
           var demoUserInfo = UserInfo.extend({
               //override the functions to customize the functionality
               render: function() {
                   UserInfo.prototype.render.call(this); // call the render function of the super class
                   …
                   //other tasks
                   …
               }
           });
           return demoUserInfo;
   });
   ```

1. Modify the portal CSS to configure the layout, positioning, and style of the required components on your portal. For instance you would like to keep background color as black for this portal to view userInfo component well. You can do this by changing background color in `/apps/sampleApplication/wscomponents/css/style.css` as follows:

   ```css
   body {
       font-family: "Myriad pro", Arial;
       background: #000;    //This was origianlly #CCC
       position: relative;
       margin: 0 auto;
   }
   ```
