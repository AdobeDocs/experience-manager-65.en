---
title: Synchronizing the app
seo-title: Synchronizing the app
description: Synchronize the AEM Forms app on your mobile device with the AEM Forms server.
seo-description: Synchronize the AEM Forms app on your mobile device with the AEM Forms server.
uuid: 50ad6aff-1b23-4112-864e-066aaaf1e0b5
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-app
discoiquuid: efeaf777-6e3e-40a4-bd11-a4a45027369c
index: y
internal: n
snippet: y
---

# Synchronizing the app{#synchronizing-the-app}

## Synchronizing the app {#synchronizing-the-app}

The forms in your app are downloaded from the AEM Forms server. The forms are downloaded under Tasks and Forms tabs. Drafts created from forms are downloaded in the drafts tab, and drafts created from tasks are downloaded in the tasks tab. For a standalone form on OSGi server, forms and drafts are downloaded in Forms and Draft tabs respectively.

When you complete and submit a form, the form is uploaded back to the AEM Forms server instantly if the app is online. The forms are fetched from the server when the app is synchronized. The drafts, however, are synced with the server instantly if the app is online.

When you are online with the AEM Forms server, by default, your app is synchronized every 15 minutes. However, you have the option to change the synchronization frequency. Alternatively, you can manually synchronize the app at any time.

**To synchronize the app manually**

Tap the Synchronize button ![](assets/sync-app.png) at the lower-right corner of the home screen.

**To alter the synchronization frequency**

1. To go to the Setting screen, tap the menu button at the upper-left corner of the Home screen, and then tap **Settings**.
1. In the Settings screen, tap the General tab.

   <!--
   Comment Type: remark
   Last Modified By: unknown unknown
   Last Modified Date:
   <p>Art Spec: If not leaving art spec, delete only the first of the 2 &lt;draft-comment&gt; elements under &lt;adobefig&gt;.</p>
   -->

   <!--
   Comment Type: remark
   Last Modified By: Peter G.A. Barraud (barraud)
   Last Modified Date: 2017-12-21T05:14:55.522-0500
   <p>SP1 UPDATE</p>
   <p>Updated screen shot</p>
   -->

   ![Sync frequency setting in General Settings window](assets/gen-settings-2.png)

1. On the Sync frequency option, tap the value to the right of Sync frequency. 
1. In the drop-down list, select the new synchronization frequency.

   <!--
   Comment Type: remark
   Last Modified By: unknown unknown (harsing)
   Last Modified Date: 2017-12-21T05:14:56.700-0500
   <p>5. going back to the home page shows a message regarding updation to automatic syncher frequency.</p>
   <p>P.S. You can copy paste the message from the snapshot of the application message bar on home page</p>
   -->

### Technical specifications {#technical-specifications}

* The main logic of submitting the offline app data to the AEM Forms server is included in runtime/offline/util/offline.js.
* In the .js, the call to the processOfflineSubmittedSavedTasks(...) function, sends the saved / submitted tasks to the server. It also handles any errors or conflicts in the sync process. If the submission of a task fails, the task on the app is marked as failed. In addition, the task remains in your Outbox.
* The syncSubmittedTask() and syncSavedTask() function perform operations on individual tasks.
* The call to the processOfflineSubmittedSavedTasks() function is initiated by the task list component after a user selects to synchronize offline state to the server or an automatic sync by the background thread.

<!--
Comment Type: remark
Last Modified By: unknown unknown (harsing)
Last Modified Date: 2017-12-21T05:14:57.130-0500
<p>Technical specifications:</p>
<p>As explained earlier, the synchronization of offline data to the server can be user initiated or automatic. In both the cases, the intention is to first try sending the offline work and then update the latest state from the server.</p>
<p>1. The main logic of submitting the offline work to the server is placed in runtime/offline/util/offline.js. Call to processOfflineSubmittedSavedTasks(...) does the task of sending the saved/submitted tasks to the server thereby handling any errors or conflicts in the sync process. In case a task is failed to be submitted to server gets marke as failed and remains in outbox there after.</p>
<p><br type="_moz" /> </p>
<p>2. Futher code details include syncSubmittedTask() and syncSavedTask() performing the operation for individual task.</p>
<p>3. The call to processOfflineSubmittedSavedTasks is initiated by tasklist component after user selects to sync offline state to server OR automatic snc by the background thread.</p>
<p><br type="_moz" /> </p>
-->

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)

<!--
<related-links>
<a href="../../../6-5/forms/using/sync-app.md">Synchronizing the app</a>
<a href="../../../6-5/forms/using/update-general-settings.md">Updating general settings</a>
<a href="/6-5/forms/using/work-offline-mode.md">Working in the offline mode</a>
</related-links>
-->

