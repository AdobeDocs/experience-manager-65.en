---
title: Minification of the JavaScript files
description: Instructions to generate minified code after AEM Forms workspace customizations to optimize the JS files for the web.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: d88c6831-8ae9-426d-acb5-2a7e066ad158
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Minification of the JavaScript files {#minification-of-the-javascript-files}

Minification removes from the source code the redundant characters, such as white space, new lines, and comments. This improves the performance by reducing the size of the code. While minification does not impact the functionality, it reduces the readability of the code.

To generate minified code for semantic changes, follow these steps.

1. Copy `client-html/src/main/webapp/js` from src-package on filesystem.

   >[!NOTE]
   >
   >See [Introduction to Customizing AEM Forms workspace](/help/forms/using/introduction-customizing-html-workspace.md) for more details about the packages.

1. Update paths in `main.js` located under client-html/src/main/webapp/js, for added/updated models/views.

   For example, the addition of a new Sharequeue model, say mySharequeue, change:

   ```javascript
   sharequeuemodel : pathprefix + 'runtime/models/sharequeue',

   ```

   To

   ```javascript

   sharequeuemodel : pathprefix + 'runtime/myModels/mySharequeue',
   ```

1. Update `registry-config.xml, located at client-html/src/main/webapp/js/resource_generator,` in case there is change/addition of alias in `main.js`.

   For example, the addition of a new Sharequeue model, say mySharequeue, change:

   ```xml
   <sharequeue
               name="sharequeue"
               path="runtime/models/sharequeue.js"
               service="service"/>

   ```

   To

   ```xml

   <sharequeue
               name="sharequeue"
               path="runtime/myModels/mySharequeue.js"
               service="service"/>
   ```

1. At client-html/src/main/webapp/js/minifier, run command:

   ```shell
   mvn clean install
   ```

   It generates a minified-files folder, under client-html/src/main/webapp/js with minified main.js and registry.js.

>[!NOTE]
>
>Minification only works on a 64-bit JVM.

>[!NOTE]
>
>If you minify, your upgrade is impacted.
