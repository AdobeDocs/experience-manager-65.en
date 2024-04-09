---
title: Assets Repository Restructuring in AEM 6.5
description: Learn how to make the necessary changes to migrate to the new repository structure in Adobe Experience Manager (AEM) 6.5 for Assets.
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: repo_restructuring
feature: Upgrading
exl-id: 28ddd23c-5907-4356-af56-ebc7589a2b5d
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Assets Repository Restructuring in AEM 6.5 {#assets-repository-restructuring-in-aem}

As described on the parent [Repository Restructuring in AEM 6.5](/help/sites-deploying/repository-restructuring.md) page, customers upgrading to Adobe Experience Manager (AEM) 6.5 should use this page to assess the work effort associated with repository changes impacting the AEM Assets Solution. Some changes require work effort during the AEM 6.5 upgrade process, while others can be deferred until a future upgrade.

**With 6.5 Upgrade**

* [Misc](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#misc)

**Before Future Upgrade**

* [Asset/Collection Event E-mail Notification Template](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#asset-collection-event-e-mail-notification-template)
* [Classic Asset Share Designs](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#classic-asset-share-designs)
* [Download Asset E-mail Notification Template](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#download-asset-e-mail-notification-template)
* [Example DRM Licenses](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#example-drm-licenses)
* [Link Share E-mail Notification Template](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#link-share-e-mail-notification-template)
* [InDesign Workflow Scripts](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#indesign-workflow-scripts)
* [Video Transcoding Configurations](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#video-transcoding-configurations)
* [Misc](/help/sites-deploying/assets-repository-restructuring-in-aem-6-5.md#misc2)

## With 6.5 Upgrade {#with-upgrade}

### Misc {#misc}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td>/etc/dam/jobs</td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td>/var/dam/jobs</td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>If any custom code depends on this location&ndash;that is, the code explicitly relies on this path&ndash;then the code must be updated to use the new location before upgrading. Ideally, Java&trade; APIs are used when available to reduce dependencies on any specific path in the JCR.</p> <p>Temp location to hold a zip file for the client to download. There is no need to update since when the client requests to download the asset. It generates a file in the new location.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

## Before Future Upgrade {#prior-to-upgrade}

### Asset/Collection Event E-mail Notification Template {#asset-collection-event-e-mail-notification-template}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/notification/email/default</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/dam/notification</code></p> <p><code>/apps/settings/dam/notification</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>If the e-mail templates were modified by the customer, then perform the following actions to align with the new repository structure:</p>
    <ol>
     <li>The <code>/libs/settings/dam/notification</code> e-mail template should be copied from <strong><code>/etc/notification/email/default</code></strong> to <strong><code>/apps/settings/notification/email/default</code></strong>
      <ol>
       <li>Because the destination is in<strong> <code>/apps</code></strong>, this change should be persisted in SCM.</li>
      </ol> </li>
     <li>Remove the folder: <strong><code>/etc/dam/notification/email/default</code></strong> after the e-mail templates within it have been moved.<br />
      <ol>
       <li>If no updates were made to the e-mail template under<strong> <code>/etc/notification/email/default</code></strong>, the folder can be removed as the original e-mail template exists under <strong><code>/libs/settings/notification/email/default</code></strong> as part of AEM 4 install.</li>
      </ol> </li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Classic Asset Share Designs {#classic-asset-share-designs}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/assetshare</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/wcm/designs/assetshare</code></p> <p><code>/apps/settings/wcm/designs/assetshare</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For any Designs that are managed in SCM, and not written to at run-time by way of Design Dialogs, perform the following actions to align to the latest model:</p>
    <ol>
     <li>Copy the designs from the Previous Location to the New Location under <code>/apps</code>.</li>
     <li>Convert any CSS, JavaScript, and static resources in the Design to a <a href="/help/sites-developing/clientlibs.md#creating-client-library-folders" target="_blank">Client Library</a> with <code>allowProxy = true</code>.</li>
     <li>Update references to the Previous Location in the <code>cq:designPath</code> property by way of <strong>AEM &gt; DAM Admin &gt; Asset Share Page &gt; Page Properties &gt; Advanced Tab &gt; Design Field</strong>.</li>
     <li>To use the new Client Library category, update any Pages referencing the Previous Location. This requires updating the Page implementation code.</li>
     <li>Update the Dispatcher rules so you can allow serving of Client Libraries by way of the <code>/etc.clientlibs/</code> proxy servlet.</li>
    </ol> <p>For any Designs that are not managed in SCM, and modified run-time by way of Design Dialogs, do not move authorable designs out of <code>/etc</code>.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Download Asset E-mail Notification Template {#download-asset-e-mail-notification-template}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/dam/workflow/notification/email/downloadasset</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/dam/workflownotification/email/downloadasset</code></p> <p><code>/apps/settings/dam/workflownotification/email/downloadasset</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>If the e-mail templates (<strong>downloadasset</strong> or <strong>transientworkflowcompleted</strong>) have been modified, then follow the below procedure to align to the new structure:</p>
    <ol>
     <li>The updated e-mail template should be copied from <strong><code>/etc/dam/workflow/notification/email/downloadasset</code></strong> to <strong><code>/apps/settings/dam/workflow/notification/email/downloadasset</code></strong>
      <ol>
       <li>Because the destination is in<strong> <code>/apps</code></strong>, this change should be persisted in SCM.</li>
      </ol> </li>
     <li>Remove the folder: <code>/etc/dam/workflow/notification/email/downloadasset </code>after the e-mail templates within it have been moved.<br />
      <ol>
       <li>If no updates were made to the e-mail template under<strong> <code>/etc</code></strong>, the folder can be removed as the original e-mail template exists under <strong><code>/libs/settings/dam/workflownotification/email/downloadasset</code></strong> as part of AEM 6.4 install.</li>
      </ol> </li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>While <code>/conf/global/settings/dam/workflownotification/email/downloadasset</code> is technically supported for look-up (takes precedence before /apps by way of usual Sling CAConfig lookup, but after <code>/etc</code>) the template could be placed in <code>/conf/global/settings/dam/workflownotification/email/downloadasset</code>. However, this is not recommended as there is no runtime UI to facilitate the editing of the e-mail template.</td>
  </tr>
 </tbody>
</table>

### Example DRM Licenses {#example-drm-licenses}

| **Previous location** | `/etc/dam/drm/licenses/` |
|---|---|
| **New location(s)** | `/libs/settings/dam/drm` |
| **Restructuring guidance** |N/A |
| **Notes** |N/A |

### Link Share E-mail Notification Template {#link-share-e-mail-notification-template}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/dam/adhocassetshare</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/dam/adhocassetshare</code></p> <p><code>/apps/settings/dam/adhocassetshare</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>If the e-mail template was modified by the customer, then to align with the new repository structure:</p>
    <ol>
     <li>The updated e-mail template should be copied from <strong><code>/etc/dam/adhocassetshare</code></strong> to <strong><code>/apps/settings/dam/adhocassetshare</code></strong>
      <ol>
       <li>Because the destination is in<strong><code>/apps</code></strong>, this change should be persisted in SCM.</li>
      </ol> </li>
     <li>Remove the folder: <strong><code>/etc/dam/adhocassetshare</code></strong> after the e-mail templates within it have been moved.<br />
      <ol>
       <li>If no updates were made to the e-mail template under<strong> <code>/etc</code></strong>, the folder can be removed as the original e-mail template exists under <strong><code>/libs/settings/dam/adhocassetshare</code></strong> as part of AEM 6.4 install.</li>
      </ol> </li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>While <code>/conf/global/settings/dam/adhocassetshare</code> is technically supported for look-up (it takes precedence before <code>/apps</code> by way of the usual Sling CAConfig lookup, but after <code>/etc</code>), the template can be placed in <code>/conf/global/settings/dam/adhocassetshare</code>. However, this is not recommended as there is no runtime UI to facilitate the editing of the e-mail template</td>
  </tr>
 </tbody>
</table>

### InDesign Workflow Scripts {#indesign-workflow-scripts}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/dam/indesign/scripts</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/dam/indesign</code></p> <p><code>/apps/settings/dam/indesign</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>To Align with the new repository structure:</p>
    <ol>
     <li>Copy all custom or modified scripts from <strong><code>/etc/dam/indesign/scripts</code></strong> to <strong><code>/apps/settings/dam/indesign/scripts</code></strong><br />
      <ol>
       <li>Only copy new or modified scripts as unmodified scripts provided by AEM are available by way of <strong><code>/libs/settings</code></strong> in AEM 6.5</li>
      </ol> </li>
     <li>Locate all Workflow Models that use the Media Extraction Process WF Step and
      <ol>
       <li>For each instance of the Workflow Step, update the paths in config to point explicitly at the proper scripts under<strong> <code>/apps/settings/dam/indesign/scripts</code></strong> or <strong><code>/libs/settings/dam/indesign/scripts</code></strong> as appropriate.</li>
      </ol> </li>
     <li>Remove<strong> <code>/etc/dam/indesign/scripts</code></strong> entirely.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>It is recommended customized scripts be stored under <code>/apps</code>, since that is the location where code should be stored.</td>
  </tr>
 </tbody>
</table>

### Video Transcoding Configurations {#video-transcoding-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/dam/video</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/dam/video</code></p> <p><code>/apps/settings/dam/video</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Project level customizations must be cut and pasted under equivalent <code>/apps</code> or <code>/conf</code> paths as applicable.</p> <p>To align with the AEM 6.4 repository structure:</p>
    <ol>
     <li>Copy any modified video configurations from <code>/etc/dam/video</code> to <code>/apps/settings/dam/video</code></li>
     <li>Remove <code>/etc/dam/video</code></li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Viewer Preset Configurations {#viewer-preset-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/dam/presets/viewer</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/dam/dm/presets/viewer</code></p> <p><code>/conf/global/settings/dam/dm/presets/viewer</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For the out of the box Viewer Preset, it is only available in the new location.</p> <p>For the Custom Viewer preset:</p>
    <ul>
     <li>run a migration script so you can move the node from <code>/etc</code> to <code>/conf</code>. The script is at <em>https://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></li>
     <li>or you can edit the configuration and they are auto-saved to the new location.</li>
    </ul> <p>You do not have to adjust their copyURL/embed code to point to <code>/conf</code>. The existing request to <code>/etc</code> is rerouted to the correct content from <code>/conf</code>.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Misc {#misc2}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/clientlibs/foundation/asseteditor</code></p> <p><code>/etc/clientlibs/foundation/assetshare</code></p> <p><code>/etc/clientlibs/foundation/assetinsights</code></p> </td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/dam/clientlibs</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Adjust any references to point to the new resources under <code>/libs</code> using the <code>/etc.clientlibs/</code> allow proxy prefix.</p> <p>Finally, clean up by removing the folders for the migrated clientlibs from <code>/etc/clientlibs/foundation/</code></p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>
