---
title: Common Repository Restructuring in AEM 6.5
description: Learn how to make the necessary changes to migrate to the new repository structure in AEM 6.5 that are common for all areas of AEM.
contentOwner: chaikels
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: repo_restructuring
exl-id: 2d852d9d-9be3-487a-966a-4902bd7df7f9
solution: Experience Manager, Experience Manager Sites
feature: Upgrading
role: Admin
---
# Common Repository Restructuring in AEM 6.5 {#common-repository-restructuring-in-aem}

As described on the parent [Repository Restructuring in AEM 6.5](/help/sites-deploying/repository-restructuring.md) page, customers upgrading to AEM 6.5 should use this page to assess the work effort associated with repository changes potentially impacting all solutions. Some changes require work effort during the AEM 6.5 upgrade process, while others can be deferred until a future upgrade.

**With 6.5 Upgrade**

* [ContextHub Configurations](#contexthub-6.5)
* [Workflow Instances](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#workflow-instances)
* [Workflow Models](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#workflow-models)
* [Workflow Launchers](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#workflow-launchers)
* [Workflow Scripts](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#workflow-scripts)

**Prior to Future Upgrade**

* [ContextHub Configurations](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#contexthub-configurations)
* [Classic Cloud Services Designs](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#classic-cloud-services-designs)
* [Classic Dashboards Designs](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#classic-dashboards-designs)
* [Classic Reports Designs](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#classic-reports-designs)
* [Default Designs](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#default-designs)
* [Adobe DTM JavaScript Endpoint](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#adobe-dtm-javascript-endpoint)
* [Adobe DTM Web-Hook Endpoint](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#adobe-dtm-web-hook-endpoint)
* [Inbox Tasks](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#inbox-tasks)
* [Multi-site Manager Blueprint Configurations](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#multi-site-manager-blueprint-configurations)
* [AEM Projects Dashboard Gadget Configurations](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#aem-projects-dashboard-gadget-configurations)
* [Replication Notification E-mail Template](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#replication-notification-e-mail-template)
* [Tags](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#tags)
* [Translation Cloud Services](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#translation-cloud-services)
* [Translation Languages](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#translation-languages)
* [Translation Rules](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#translation-rules)
* [Translation Widget Client Library](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#translation-widget-client-library)
* [Tree Activation Web Console](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#tree-activation-web-console)
* [Vendor Translation Connector Cloud Services](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#vendor-translation-connector-cloud-services)
* [Workflow Notification Email Templates](/help/sites-deploying/all-repository-restructuring-in-aem-6-5.md#workflow-notification-email-templates)

## With 6.5 Upgrade {#with-upgrade}

### ContextHub Configurations {#contexthub-6.5}

 From AEM 6.4 onwards, there is no default ContextHub configuration. Therefore on the root level of the site a `cq:contextHubPathproperty` should be set to indicate which configuration should be used.

1. Navigate to the root of the site.
1. Open the page properties of the root page and select the Personalization tab.
1. In the Contexthub Path field enter your own ContextHub configuration path.

Additionally on the ContextHub configuration, the `sling:resourceType` needs to be updated to be relative and not absolute.

1. Open the properties of ContextHub configuration node in CRX DE Lite, for example, `/apps/settings/cloudsettings/legacy/contexthub`
1. Change `sling:resourceType` from `/libs/granite/contexthub/cloudsettings/components/baseconfiguration` to `granite/contexthub/cloudsettings/components/baseconfiguration`

I.e. the `sling:resourceType` of the ContextHub configuration must be relative rather than absolute.

### Workflow Models {#workflow-models}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/workflow/models</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/workflow/models</code></p> <p><code>/conf/global/settings/workflow/models</code></p> <p><code>/var/workflow/models</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified Workflow Models must be migrated to /conf/global/workflow/models.</p>
    <ol>
     <li>Deploy the modified Workflow Models into a local AEM 6.5 development instance, such that they exist in the Previous location.</li>
     <li>Edit the Workflow Model using AEM's Workflow Model Editor at AEM &gt; Tools &gt; Workflow &gt; Models.</li>
     <li>When migrating modified AEM-provided Workflow Models
      <ol>
       <li>With the Workflow Model Editor open, modify the browser's address URL, and replace the path segment /libs/settings/workflow/models with /etc/workflow/models.
        <ul>
         <li>For example, change: <em>http://localhost:4502/editor.html<strong>/libs/settings/workflow/models</strong>/dam/update_asset.html</em> to <em>http://localhost:4502/editor.html<strong>/etc/workflow/models</strong>/dam/update_asset.html</em></li>
        </ul> </li>
      </ol> </li>
     <li>Enable Edit mode in the Workflow Model Editor which will copy the Workflow Model definition to /conf/global/workflow/models.</li>
     <li>Select the Sync button to sync the changes to the Runtime Workflow Model under /var/workflow/models.</li>
     <li>Export both the Workflow Model (/conf/global/workflow/models/&lt;workflow-model&gt;) and Runtime Workflow Model (/var/workflow/models/&lt;workflow-model&gt;) and integrate into the AEM project.
      <ol>
       <li>For example, export:
        <ul>
         <li><code>/conf/global/settings/workflow/models/dam/my_workflow_model</code><br /> and </li>
         <li><code>/var/workflow/models/dam/my_workflow_model</code></li>
        </ul> </li>
      </ol> </li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Workflow Model resolution occurs in the following order:</p>
    <ol>
     <li><code>/conf/global/settings/workflow/models</code></li>
     <li><code>/libs/settings/workflow/models</code></li>
     <li><code>/etc/workflow/models</code></li>
    </ol> <p>Thus, any customizations of AEM-provided Workflow Models persisted in the Previous location must be moved to /conf/global/settings/workflow/models if they are to be retained, otherwise they will be superseded by the AEM-provided Workflow Model definition in /libs/settings/workflow/models.</p> </td>
  </tr>
 </tbody>
</table>

### Workflow Instances {#workflow-instances}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/workflow/instances</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/var/workflow/instances</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>No action is required to align with the New Location.</p> <p>Historical Workflow Instances can safely continue residing in the Previous Location, and new Workflow Instances will be created in the New Location.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>Any explicit path references in
    <code>
     custom
    </code> code to the Previous Location should also account for the New Location. It is recommended that this code is refactored to use the AEM Workflow APIs.</td>
  </tr>
 </tbody>
</table>

### Workflow Launchers {#workflow-launchers}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/workflow/launcher/config</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/workflow/launcher/config</code></p> <p><code>/conf/global/settings/workflow/launcher/config</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified Workflow Launchers must be migrated to <code>/conf/global/workflow/launcher/config</code>.</p>
    <ol>
     <li>Copy any new or modified Workflow Launcher configurations from the Previous Location to New Location (<code>/conf/global</code>).</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Workflow Launcher resolution occurs in the following order:</p>
    <ol>
     <li><code>/conf/global/settings/workflow/launcher</code></li>
     <li><code>/libs/settings/workflow/launcher</code></li>
     <li><code>/etc/workflow/launcher</code></li>
    </ol> <p>Thus, any customizations of AEM-provided Workflow Launcher persisted in the Previous location must be moved to the New Location (<code>/conf/global/settings/workflow/launcher</code> if they are to be retained, otherwise they will be superseded by the AEM-provided Workflow Launcher definition in <code>/libs/settings/workflow/launcher</code>.</p> </td>
  </tr>
 </tbody>
</table>

### Workflow Scripts {#workflow-scripts}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/workflow/scripts</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/workflow/scripts</code></p> <p><code>/apps/workflow/scripts</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified Workflow Scripts must be migrated to the New Location and the referencing Workflow Models updated to reflect the New Location.</p>
    <ol>
     <li>Copy any new or modified Workflow Scripts from the Previous Location to the New Location.<br />
      <ul>
       <li><code>/apps/workflow/scripts</code> should be maintained in SCM.</li>
      </ul> </li>
     <li>Update any references to the Workflow Scripts at the Previous Location in Workflow Models to point to the New Locations.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>AEM 6.4 SP1, when it is released, makes it so this restructuring can be deferred until 6.5
     <code>
      upgrade
     </code>.</p> <p>If upgrading to AEM 6.4 prior to AEM 6.4 SP1 being released, this restructuring should be performed as part of the upgrade project. Without doing so, editing and saving Workflow Steps referencing scripts in the Previous Location will remove the Workflow Script reference from the Workflow Step entirely, and only Workflow Scripts in New Locations will be available in the script selection drop-down.</p> </td>
  </tr>
 </tbody>
</table>

## Prior to Future Upgrade {#prior-to-upgrade}

### ContextHub Configurations {#contexthub-configurations}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/cloudsettings</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/cloudsettings</code></p> <p><code>/conf/global/settings/cloudsettings</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudsettings</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified ContextHub Configurations must be migrated to the new location and the referencing AEM Sites pages must be updated to reflect the new location.</p>
    <ol>
     <li>Copy any new or modified ContextHub Configurations from the previous location to the new location.</li>
     <li>Associate the applicable AEM configurations with the AEM content hierarchies.
      <ol>
       <li><strong>AEM Sites page hierarchies via AEM Sites &gt; Page &gt; Page Properties &gt; Advanced Tab &gt; Cloud Configuration</strong>.</li>
      </ol> </li>
     <li>Disassociate any migrated legacy ContextHub Configurations from the aforementioned AEM content hierarchies.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Classic Cloud Services Designs {#classic-cloud-services-designs}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/cloudservices</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/wcm/designs/cloudservices</code></p> <p><code>/apps/settings/wcm/designs/cloudservices</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For any Designs that are managed in SCM, and not written to at run-time via Design Dialogs.</p>
    <ol>
     <li>Copy the designs from the Previous Location to the New Location (<code>/apps</code>).</li>
     <li>Convert any CSS, JavaScript and static resources in the Design to a <a href="/help/sites-developing/clientlibs.md#creating-client-library-folders" target="_blank">Client Library</a> with <code>allowProxy = true</code>.</li>
     <li>Update references to the Previous Location in the <span class="code">
       <code>
        cq
       </code>:
       <code>
        designPath
       </code></span> property.</li>
     <li>Update any Pages referencing the Previous Location to use the new Client Library category (this requires updating Page implementation code).</li>
     <li>Update AEM Dispatcher rules to allow the serving of Client Libraries via the /etc.clientlibs/.. proxy servlet.</li>
    </ol> <p>For any Designs that NOT managed in SCM, and modified run-time via Design Dialogs.</p>
    <ul>
     <li>Do not move author-able Designs out of <code>/etc</code>.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Classic Dashboards Designs {#classic-dashboards-designs}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/dashboards</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/wcm/designs/dashboards</code></p> <p><code>/apps/settings/wcm/designs/dashboards</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For any Designs that are managed in SCM, and not written to at run-time via Design Dialogs.</p>
    <ol>
     <li>Copy the designs from the Previous Location to the New Location (/apps).</li>
     <li>Convert any CSS, JavaScript and static resources in the Design to a <a href="/help/sites-developing/clientlibs.md#creating-client-library-folders" target="_blank">Client Library</a> with <code>allowProxy = true</code>.</li>
     <li>Update references to the Previous Location in the
      <code>
       cq
      </code>:
      <code>
       designPath
      </code> property.</li>
     <li>Update any Pages referencing the Previous Location to use the new Client Library category (this requires updating Page implementation code).</li>
     <li>Update AEM Dispatcher rules to allow the serving of Client Libraries via the /etc.clientlibs/.. proxy servlet.</li>
    </ol> <p>For any Designs that NOT managed in SCM, and modified run-time via Design Dialogs.</p>
    <ul>
     <li>Do not move author-able Designs out of <code>/etc</code>.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Classic Reports Designs {#classic-reports-designs}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/reports</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/wcm/designs/reports</code></p> <p><code>/apps/settings/wcm/designs/reports</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For any Designs that are managed in SCM, and not written to at run-time via Design Dialogs.</p>
    <ol>
     <li>Copy the designs from the Previous Location to the New Location (/apps).</li>
     <li>Convert any CSS, JavaScript and static resources in the Design to a <a href="/help/sites-developing/clientlibs.md#creating-client-library-folders" target="_blank">Client Library</a> with <code>allowProxy = true</code>.</li>
     <li>Update references to the Previous Location in the
      <code>
       cq
      </code>:
      <code>
       designPath
      </code> property.</li>
     <li>Update any Pages referencing the Previous Location to use the new Client Library category (this requires updating Page implementation code).</li>
     <li>Update AEM Dispatcher rules to allow the serving of Client Libraries via the /etc.clientlibs/.. proxy servlet.</li>
    </ol> <p>For any Designs that NOT managed in SCM, and modified run-time via Design Dialogs.</p>
    <ul>
     <li>Do not move author-able Designs out of <code>/etc</code>.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Default Designs {#default-designs}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/default</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/wcm/designs/default</code></p> <p><code>/apps/settings/wcm/designs/default</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For any Designs that are managed in SCM, and not written to at run-time via Design Dialogs.</p>
    <ol>
     <li>Copy the designs from the Previous Location to the New Location (/apps).</li>
     <li>Convert any CSS, JavaScript and static resources in the Design to a <a href="/help/sites-developing/clientlibs.md#creating-client-library-folders" target="_blank">Client Library</a> with <code>allowProxy = true</code>.</li>
     <li>Update references to the Previous Location in the
      <code>
       cq
      </code>:
      <code>
       designPath
      </code> property.</li>
     <li>Update any Pages referencing the Previous Location to use the new Client Library category (this requires updating Page implementation code).</li>
     <li>Update AEM Dispatcher rules to allow the serving of Client Libraries via the /etc.clientlibs/.. proxy servlet.</li>
    </ol> <p>For any Designs that NOT managed in SCM, and modified run-time via Design Dialogs.</p>
    <ul>
     <li>Do not move author-able Designs out of <code>/etc</code>.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Adobe DTM JavaScript Endpoint {#adobe-dtm-javascript-endpoint}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/clientlibs/dtm</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/var/cq/dtm/clientlibs</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>No action required.</p> <p>The public previous location acts as a proxy endpoint for the private new location.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Adobe DTM Web-Hook Endpoint {#adobe-dtm-web-hook-endpoint}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/dtm-hook</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/var/cq/dtm/web-hook</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>No action required.</p> <p>The public previous location acts as a proxy endpoint for the private new location.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Inbox Tasks {#inbox-tasks}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/taskmanagement</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/var/taskmanagement</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td>Use the <strong>Inbox Purge Maintenance Task</strong> to remove old tasks from the previous location as needed.</td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>No action is required to migration Tasks to the new location.</p>
    <ul>
     <li>Tasks present in the Previous Location continue to be available and function.</li>
     <li>New Tasks are created in the New Location.</li>
    </ul> </td>
  </tr>
 </tbody>
</table>

### Multi-site Manager Blueprint Configurations {#multi-site-manager-blueprint-configurations}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong><em></em>Previous location</strong></td>
   <td><code>/etc/blueprints</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/msm</code></p> <p><code>/apps/msm</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td>
    <ol>
     <li>Copy custom configurations from <code>/etc/blueprints</code> to <code>/apps/msm</code>.</li>
     <li>Remove <code>/etc/blueprints</code>.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### AEM Projects Dashboard Gadget Configurations {#aem-projects-dashboard-gadget-configurations}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/projects/dashboard/gadgets</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/cq/core/content/projects/dashboard/gadgets</code></p> <p><code>/apps/cq/core/content/projects/dashboard/gadgets</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified AEM Projects Dashboard Gadget Configurations must be migrated to the new location (<code>/apps</code>).</p>
    <ol>
     <li>Copy any new or modified AEM Projects Dashboard Gadget Configurations from the previous location to the new location (<code>/apps</code>).
      <ol>
       <li>Do not copy unmodified AEM Projects Dashboard Gadget Configurations as these now exist in the new location (<code>/libs</code>).</li>
      </ol> </li>
     <li>Update any AEM Projects templates that reference the Previous Location to point to the appropriate new location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>If the AEM 6.4 compatibility package is applied, it will be necessary to perform the repository alignment activities at the time of the compatibility package's removal.</td>
  </tr>
 </tbody>
</table>

### Replication Notification E-mail Template {#replication-notification-e-mail-template}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/notification/email/default/com.day.cq.replication</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/notification-templates/com.day.cq.replication</code></p> <p><code>/apps/settings/notification-templates/com.day.cq.replication</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified Replication Notification E-mail Templates must be migrated to the new location (<code>/apps</code>)</p>
    <ol>
     <li>Copy any new or modified Replication Notification E-mail Templates from the previous location to new location (<code>/apps</code>).</li>
     <li>Remove any migrated Replication Notification E-mail Templates from the previous location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>The only supported new Replication Notification E-mail Templates are to support new locales.</p> <p>Replication Notification E-mail Template resolution occurs in the following order:</p>
    <ol>
     <li><code>/etc/notification/email/default/com.day.cq.replication</code></li>
     <li><code class="code">/apps/settings/notification-templates/com.day.cq.replication
        </code></li>
     <li><code>/libs/settings/notification-templates/com.day.cq.replication</code></li>
    </ol> </td>
  </tr>
 </tbody>
</table>

### Tags {#tags}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/tags</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/content/cq:tags</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>All Tags must be migrated to <code>/content/cq:tags</code>.</p>
    <ol>
     <li>Copy all Tags from the Previous Location to the New Location.</li>
     <li>Remove all Tags from the Previous Location.</li>
     <li>Via the AEM Web Console, restart the Day Communique 5 Tagging OSGi bundle at <em>https://serveraddress:serverport/system/console/bundles/com.day.cq.cq-tagging</em> for AEM to recognize the New Location contains content and should be used.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Restarting the Day Communique Tagging OSGi bundle will only register the New Location as the tag root if the Previous Location is empty.</p> <p>References to the Previous Location will continue to work after migrating to New Location for all functionality that uses AEM's TagManager API for tag resolution.</p> <p>Any custom code that explicitly references the path <code>/etc/tags</code> must be updated to <span class="code">/content/
      <code>
       cq
      </code>
      <code>
       :tags
      </code></span>, or preferably rewritten to use the TagManager Java API, in tandem with this migration.</p> </td>
  </tr>
 </tbody>
</table>

### Translation Cloud Services {#translation-cloud-services}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/cloudservices/translation</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/cloudconfigs/translation/translationcfg</code></p> <p><code>/apps/settings/cloudconfigs/translation/translationcfg</code></p> <p><code>/conf/global/settings/cloudconfigs/translation/translationcfg</code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/translation/translationcfg</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new Translation Cloud Services must be migrated to the new location (<code>/apps</code>, <code>/conf/global</code> or <code>/conf/&lt;tenant&gt;</code>).</p>
    <ol>
     <li>Migrate existing configurations in the previous location to the new location.
      <ul>
       <li>Manually recreate new Translation Cloud Services configurations via the AEM authoring UI at <strong>Tools &gt; Cloud Services &gt; Translation Cloud Services</strong>.<br /> OR </li>
       <li>Copy any new Translation Cloud Services configurations from the Previous Location to the New Location (<code>/apps</code>, <code>/conf/global</code> or <code>/conf/&lt;tenant&gt;</code>).</li>
      </ul> </li>
     <li>Associate the applicable AEM configurations with the AEM content hierarchies.
      <ol>
       <li>AEM Sites page hierarchies via <strong>AEM Sites &gt; Page &gt; Page Properties &gt; Advanced Tab &gt; Cloud Configuration</strong>.</li>
       <li>AEM Experience Fragment hierarchies via <strong>AEM Experience Fragments &gt; Experience Fragment &gt; Properties &gt; Cloud Services Tab &gt; Cloud Configuration</strong>.</li>
       <li>AEM Experience Fragment Folder hierarchies via <strong>AEM Experience Fragments &gt; Folder &gt; Properties &gt; Cloud Services Tab &gt; Cloud Configuration</strong>.<br /> </li>
       <li>AEM Assets folder hierarchies via <strong>AEM Assets &gt; Folder &gt; Folder Properties &gt; Cloud Services Tab &gt; Configuration</strong>.</li>
       <li>AEM Projects via <strong>AEM Projects &gt; Project &gt; Project Properties &gt; Advanced Tab &gt; Cloud Configuration</strong>.</li>
      </ol> </li>
     <li>Disassociate any migrated legacy Translation Cloud Services from the aforementioned AEM content hierarchies.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Translation Cloud Services resolution occurs in the following order:</p>
    <ol>
     <li><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/translations/translationcfg</code></li>
     <li><code>/conf/global/settings/cloudconfigs/translations/translationcfg</code></li>
     <li><code>/apps/settings/cloudconfigs/translations/translationcfg</code></li>
     <li><code>/libs/settings/cloudconfigs/translations/translationcfg</code></li>
    </ol> <p>Migrated Translation Cloud Services must be compatible with AEM 6.4.</p> </td>
  </tr>
 </tbody>
</table>

### Translation Languages {#translation-languages}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/translation/supportedLanguages</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/translation/supportedLanguages</code></p> <p><code>/apps/settings/translation/supportedLanguages</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified Translation Language definitions require a migration of all Translation Language definitions to the new location (<code>/apps</code>).</p>
    <ol>
     <li>If any additions or modifications have been made to the Translation Language definitions, then copy all Translation Language definitions from the previous location to the new location (<code>/apps</code>).</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Translation Language path resolution occurs in the following order:</p>
    <ol>
     <li><code>/etc/translation/supportedLanguages</code></li>
     <li><code>/apps/settings/translation/supportedLanguage</code></li>
     <li><code>/libs/settings/translation/supportedLanguages</code></li>
    </ol> <p>This resolution does not support a merging overlay, meaning the resolved path must contain all Supported Languages, and will not inherit Supported Languages from higher-order resolutions.</p> </td>
  </tr>
 </tbody>
</table>

### Translation Rules {#translation-rules}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/workflow/models/translation/translation_rules.xml</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/translation/rules/translation_rules.xml</code></p> <p><code>/apps/settings/translation/rules/translation_rules.xml</code></p> <p><code>/conf/global/settings/translation/rules/translation_rules.xml</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>A modified Translation Rules XML file must be migrated to the new location (<code>/apps</code>, or <code>/conf/global</code>).</p> <p>1. Copy the modified Translation Rules XML file from the previous location to the new location.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Replication Translation Rules XML resolution occurs in the following order:</p>
    <ol>
     <li><code>/conf/global/settings/translation/rules/translation_rules.xml</code></li>
     <li><code class="code">/apps/settings/translation/rules/translation_rules.xml
        </code></li>
     <li><code class="code">/etc/workflow/models/translation/translation_rules.xml
        </code></li>
     <li><code>/libs/settings/translation/rules/translation_rules.xml</code></li>
    </ol> </td>
  </tr>
 </tbody>
</table>

### Translation Widget Client Library {#translation-widget-client-library}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/translation/translationwidget</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/wcm/designs/translation/translationwidget</code></p> <p><code>/apps/settings/wcm/designs/translation/translationwidget</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For any Designs that are managed in SCM, and not written to at run-time via Design Dialogs.</p>
    <ol>
     <li>Copy the designs from the Previous Location to the New Location (/apps).</li>
     <li>Convert any CSS, JavaScript and static resources in the Design to a <a href="/help/sites-developing/clientlibs.md#creating-client-library-folders" target="_blank">Client Library</a> with <code>allowProxy = true</code>.</li>
     <li>Update references to the Previous Location in the
      <code>
       cq
      </code>:
      <code>
       designPath
      </code> property.</li>
     <li>Update any Pages referencing the Previous Location to use the new Client Library category (this requires updating Page implementation code).</li>
     <li>Update AEM Dispatcher rules to allow the serving of Client Libraries via the /etc.clientlibs/.. proxy servlet.</li>
    </ol> <p>For any Designs that NOT managed in SCM, and modified run-time via Design Dialogs.</p>
    <ul>
     <li>Do not move author-able Designs out of <code>/etc</code>.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A</td>
  </tr>
 </tbody>
</table>

### Tree Activation Web Console {#tree-activation-web-console}

| **Previous location** | `/etc/replication/treeactivation` |
|---|---|
| **New location(s)** | `/libs/replication/treeactivation` |
| **Restructuring guidance** |No action required. |
| **Notes** |The Tree Activation Web Console is now available via **Tools > Deployment > Replication > Activate Tree**. |

{style="table-layout:auto"}

### Vendor Translation Connector Cloud Services {#vendor-translation-connector-cloud-services}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/cloudservices/&lt;vendor&gt;</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/cloudconfigs/translation/&lt;vendor&gt;</code></p> <p><code class="code">/apps/settings/cloudconfigs/translation/&lt;vendor&gt;
       </code></p> <p><code class="code">/conf/global/settings/cloudconfigs/translation/&lt;vendor&gt;
       </code></p> <p><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/translation/&lt;vendor&gt;</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new Vendor Translation Connector Cloud Services must be migrated to the new location (<code>/apps</code>, <code>/conf/global</code> or <code>/conf/&lt;tenant&gt;</code>).</p>
    <ol>
     <li>Migrate existing configurations in the Previous Location to the New Location.
      <ul>
       <li>Manually create net-new Vendor Translation Connector Cloud Services configurations via the <strong>AEM authoring UI at Tools &gt; Cloud Services &gt; Translation Cloud Services</strong>.<br /> OR </li>
       <li>Copy any new Vendor Translation Connector Cloud Services configurations from previous location to the new location (<code>/apps</code>, <code>/conf/global </code>or <code>/conf/&lt;tenant&gt;</code>).</li>
      </ul> </li>
     <li>Associate the applicable AEM configurations with the AEM content hierarchies.
      <ol>
       <li>AEM Sites page hierarchies via <strong>AEM Sites &gt; Page &gt; Page Properties &gt; Advanced Tab &gt; Cloud Configuration</strong>.</li>
       <li>AEM Experience Fragment hierarchies via <strong>AEM Experience Fragments &gt; Experience Fragment &gt; Properties &gt; Cloud Services Tab &gt; Cloud Configuration</strong>.</li>
       <li>AEM Experience Fragment Folder hierarchies via <strong>AEM Experience Fragments &gt; Folder &gt; Properties &gt; Cloud Services Tab &gt; Cloud Configuration</strong>.</li>
       <li>AEM Assets folder hierarchies via <strong>AEM Assets &gt; Folder &gt; Folder Properties &gt; Cloud Services Tab &gt; Configuration</strong>.</li>
       <li>AEM Projects via <strong>AEM Projects &gt; Project &gt; Project Properties &gt; Advanced Tab &gt; Cloud Configuration</strong>.</li>
      </ol> </li>
     <li>Disassociate any migrated legacy Translation Cloud Services from the aforementioned AEM content hierarchies.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Translation Cloud Services resolution occurs in the following order:</p>
    <ol>
     <li><code>/conf/&lt;tenant&gt;/settings/cloudconfigs/translations/&lt;vendor&gt;</code></li>
     <li><code>/conf/global/settings/cloudconfigs/translations/&lt;vendor&gt;</code></li>
     <li><code>/apps/settings/cloudconfigs/translations/&lt;vendor&gt;</code></li>
     <li><code>/libs/settings/cloudconfigs/translations/&lt;vendor&gt;</code></li>
    </ol> </td>
  </tr>
 </tbody>
</table>

### Workflow Notification Email Templates {#workflow-notification-email-templates}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/workflow/notification</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/workflow/notification</code></p> <p><code>/conf/global/settings/workflow/notification</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any modified Workflow Notification Email Templates must be migrated to the New Location (<code>/conf/global</code>).</p>
    <ol>
     <li>Copy any modified Workflow Notification Email Templates from the previous location to the new location.</li>
     <li>Remove migrated Workflow Notification Email Templates from the previous location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Workflow Notification Email Template resolution occurs in the following order:</p>
    <ol>
     <li><code>/etc/workflow/notification</code></li>
     <li><code>/conf/global/settings/workflow/notification</code></li>
     <li><code>/libs/settings/workflow/notification</code></li>
    </ol> </td>
  </tr>
 </tbody>
</table>

### Workflow Packages {#workflow-packages}

<table style="table-layout:auto">
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/workflow/packages</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/var/workflow/packages</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Existing Workflow Packages in the previous location should be migrated to the new location.</p>
    <ol>
     <li>Remove any Workflow Packages in the previous location that are not referenced by other content and are otherwise not required.</li>
     <li>Move any Workflow Packages in the previous location that are not referenced by other content but otherwise required in the new location.</li>
     <li>Leave any Workflow Packages that are referenced by other content in the previous location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Workflow Packages created via the Classic UI Miscadmin console are persisted in the previous location, while all others are persisted to the new location.</p> <p>Workflow Packages stored in either the previous or lew locations can be managed via the Classic UI Miscadmin console.</p> </td>
  </tr>
 </tbody>
</table>
