---
title: Hosting two AEM Forms workspace instances on one server
description: How LC administrators can customize HTML WS to host two instances on a single server accessible via different URLs.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: 32a546fc-e33f-46f9-ac3b-45eca0e12239
solution: Experience Manager, Experience Manager Forms
feature: HTML5 Forms,Adaptive Forms,Mobile Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 97aafc4b-2598-52d6-9012-295a95969e38
    internal-label: HTML5 Forms
  - id: 59f95943-e802-56ac-990d-21ab923984c1
    internal-label: Mobile Forms
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Hosting two AEM Forms workspace instances on one server {#hosting-two-aem-forms-workspace-instances-on-one-server}

The default installation and settings of AEM Forms allow for only one AEM Forms workspace to be available on the server. However, you may need to host two different instances of AEM Forms workspace on a single AEM Forms Server. The two instances are accessible by different URLs.

AEM Forms administrators customize the workspace to create two different URLs and make two workspaces available on the same server. In this customization article, you can assume that the two workspaces are accessible at `https://'[server]:[port]'/lc/ws` and `https://'[server]:[port]':/lc/ws2`.

Follow these steps to configure AEM Forms workspace.

1. Install the dev package of AEM Forms workspace on your server. See [dev package](/help/forms/using/introduction-customizing-html-workspace.md#p-crx-package-p), for instructions to create it.
1. Log in to CRXDE Lite as an administrator, by accessing `https://'[server]:[port]'/lc/crx/de/index.jsp`.
1. Copy node ws at /content and paste at /content. Rename node to ws2. Click **[!UICONTROL Save all]**. In properties of this node, change value of `sling:resourceType` to ws2. Click **[!UICONTROL Save all]**.

1. Copy folder ws from /libs and paste at /apps. Rename the folder to ws2. Click **[!UICONTROL Save all]**.
1. In `GET.jsp` at `/apps/ws2`, make the following code changes. Replace the following

   ```html
   <html lang="en">
   <head>
       <meta charset="utf-8">
       <title>Workspace Next</title>
       <meta http-equiv="refresh" content="0;URL='/lc/libs/ws/index.html'" /><html lang="en">
   <head>
       <meta charset="utf-8">
       <title>Workspace Next</title>
       <meta http-equiv="refresh" content="0;URL='/lc/libs/ws/index.html'" />
   ```

   with the following code

   ```html
   <html lang="en">
   <head>
       <meta charset="utf-8">
       <title>Workspace Next</title>
       <meta http-equiv="refresh" content="0;URL='/lc/apps/ws2/index.html'" />
   ```

1. In `registry.js` at `/apps/ws2/js`, change path of templates to refer to templates at `/apps/ws2/js/runtime/templates`. Replace the following code

   ```css
   "tasklist" : {
   "name": "tasklist",
   "path": "tasklistview",
   "model": "tasklist",
   "template": "text!/lc/libs/ws/js/runtime/templates/tasklist.html",
   "utility": "utility",
   "view": "taskview",
   "errorModel": null
   }
   ```

   with the following code

   ```css
   "tasklist" : {
   "name": "tasklist",
   "path": "tasklistview",
   "model": "tasklist",
   "template": "text!/lc/apps/ws2/js/runtime/templates/tasklist.html",
   "utility": "utility",
   "view": "taskview",
   "errorModel": null
   }
   ```

1. In `userinfo.js` at `/apps/ws2/js/runtime/models` and `/apps/ws2/js/runtime/views`, change string `/lc/content/ws` to `lc/content/ws2`.

1. In `/apps/ws2/js/runtime/services/service.js`, change the path in `getLocalizationData` function to point to `/lc/apps/ws2/Locale.html`.

1. To refer to `pdf.html` of the new Workspace, change the path of `pdf.html` in `/apps/ws2/js/runtime/views/forms/pdftaskform.js`.

1. To refer to `pdf.html` of the new Workspace, change paths of `pdf.html` and `WsNextAdapter.swf` in `startprocess.html`, `taskdetails.html`, and `processinstancehistory.html` at `/apps/ws2/js/runtime/templates`.

1. Copy `/etc/map/ws` folder and paste at `/etc/map`. Rename the new folder to ws2. Click Save all.

1. In properties of `ws2`, change value of `sling:redirect` to `content/ws2`.

1. Change value of `sling:match` to `^[^/\||]/[^/\||]/ws2$`.
