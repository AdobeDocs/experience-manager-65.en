---
title: Sites Repository Restructuring in AEM 6.5
description: Learn how to make the necessary changes to migrate to the new repository structure in AEM 6.5 for Sites.
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: repo_restructuring
feature: Upgrading
exl-id: b4531792-06dd-4545-9dbb-57224be20dc7
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Sites Repository Restructuring in AEM 6.5 {#sites-repository-restructuring-in-aem}

As described on the parent [Repository Restructuring in AEM 6.5](/help/sites-deploying/repository-restructuring.md) page, customers upgrading to AEM 6.5 should use this page to assess the work effort associated with repository changes impacting the AEM Sites Solution. Some changes require work effort during the AEM 6.5 upgrade process, while others can be deferred until a future upgrade.

**With 6.5 Upgrade**

* [ContextHub Segments](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#contexthub-segments)

**Prior to Future Upgrade**

* [Adobe Analytics Client Libraries](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#adobe-analytics-client-libraries)
* [Classic Microsoft Word to Web Page Designs](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#classic-microsoft-word-to-web-page-designs)
* [Mobile Device Emulator Configurations](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#mobile-device-emulator-configurations)
* [Multi-site Manager Blueprint Configurations](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#multi-site-manager-blueprint-configurations)
* [Multi-site Manager Rollout Configurations](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#multi-site-manager-rollout-configurations)
* [Page Event Notification E-mail Template](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#page-event-notification-e-mail-template)
* [Page Scaffolding](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#page-scaffolding)
* [Responsive Grid LESS](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#responsive-grid-less)
* [Static Template Designs](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#static-template-designs)
<!-- Search&Promote is end-of-life September 1, 2022 * [Adobe Search and Promote Integration Client Libraries](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#adobe-search-and-promote-integration-client-libraries) -->
* [Adobe Target Integration Client Libraries](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#adobe-target-integration-client-libraries)
* [WCM Foundation Client Libraries](/help/sites-deploying/sites-repository-restructuring-in-aem-6-5.md#wcm-foundation-client-libraries)

## With 6.5 Upgrade {#with-upgrade}

### ContextHub Segments {#contexthub-segments}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/segmentation/contexthub</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/apps/settings/wcm/segments</code><br /> </p> <p><code>/conf/settings/settings/wcm/segments</code><br /> </p> <p><code>/conf/&lt;tenant&gt;/settings/wcm/segments</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>If any new or modified ContextHub Segments are edited in source control rather than being edited in AEM, they must be migrated to the new location:</p>
    <ol>
     <li>Copy any new or modified ContextHub Segments from the previous location to the appropriate new location (/<code>apps</code>, <code>/conf/global</code> or <code>/conf/&lt;tenant&gt;</code>)</li>
     <li>Update references to ContextHub Segments in the previous location to the migrated ContextHub Segments in the new locations (<code>/apps</code>, <code>/conf/global</code>, <code>/conf/&lt;tenant&gt;</code>).</li>
    </ol> <p>The following QueryBuilder query locates all references to ContextHub Segments in the Previous Locations.<br /> <br /> <code class="code">path=/content
       property=cq:segments
       property.operation=like
       property.value=/etc/segmentation/contexthub/%</code><br /> <br /> This can be executed via <a href="/help/sites-developing/querybuilder-api.md" target="_blank">AEM QueryBuilder Debugger UI</a>. Note that this is a traversing query, so do not run it against production, and ensure traversal limits adjusted as needed.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>ContextHub Segments persisted to the previous location display as read-only in <strong>AEM &gt; Personalization &gt; Audiences</strong>.</p> <p>If ContextHub Segments are to be editable in AEM, they must be migrated to the new location (<code>/conf/global</code> or <code>/conf/&lt;tenant&gt;</code>). Any new ContentHub Segments segments created in AEM are persisted to the new location (<code>/conf/global</code> or <code>/conf/&lt;tenant&gt;</code>).</p> <p>AEM Sites Page Properties only allow either the Previous Location (<code>/etc</code>) or a single new location (<code>/apps</code>, <code>/conf/global</code> or <code>/conf/&lt;tenant&gt;</code>) to be selected, thus ContextHub Segments must be migrated accordingly.</p> <p>Any unused ContextHub Segments from AEM reference sites can be removed and not migrated to the New Location:</p>
    <ul>
     <li>/etc/segmentation/geometrixx/</li>
     <li>/etc/segmentation/geometrixx-outdoors</li>
    </ul> <p>Note: If ClientContext is in use, it is recommended to convert to ContextHub.</p> </td>
  </tr>
 </tbody>
</table>

## Prior to Future Upgrade {#prior-to-upgrade}

### Adobe Analytics Client Libraries {#adobe-analytics-client-libraries}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/clientlibs/foundation/sitecatalyst</code></p> </td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/cq/analytics/clientlibs/analytics</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any custom use of these Client Libraries should reference the Client Library by category, and not by path:</p>
    <ol>
     <li>Any references to the Client Library by path at the Previous Location should be updated to use <a href="/help/sites-developing/clientlibs.md#referencing-client-side-libraries" target="_blank">AEM's Client Library referencing framework</a>.</li>
     <li>If AEM's Client Library referencing framework cannot be used, the absolute path of the Client Libraries can be referenced via AEM's Client Library Proxy servlet.
      <ul>
       <li><code>/etc.clientlibs/cq/analytics/clientlibs/sitecatalyst/appmeasurement.js</code></li>
       <li><code>/etc.clientlibs/cq/analytics/clientlibs/sitecatalyst/plugins.js</code></li>
       <li><code>/etc.clientlibs/cq/analytics/clientlibs/sitecatalyst/sitecatalyst.js</code></li>
       <li><code>/etc.clientlibs/cq/analytics/clientlibs/sitecatalyst/tracking.js</code></li>
       <li><code>/etc.clientlibs/cq/analytics/clientlibs/sitecatalyst/util.js</code></li>
      </ul> </li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Editing of these Client Libraries was never supported.</p> <p>To obtain the Client Library categories, visit each <code>cq:ClientLIbraryFolder</code> node via CRXDELite and inspect the categories property.</p>
    <ul>
     <li><code>/libs/cq/analytics/clientlibs/sitecatalyst/appmeasurement</code></li>
     <li><code>/libs/cq/analytics/clientlibs/sitecatalyst/plugins</code></li>
     <li><code>/libs/cq/analytics/clientlibs/sitecatalyst/sitecatalyst</code></li>
     <li><code>/libs/cq/analytics/clientlibs/sitecatalyst/tracking</code></li>
     <li><code>/libs/cq/analytics/clientlibs/sitecatalyst/util</code></li>
    </ul> </td>
  </tr>
 </tbody>
</table>

### Classic Microsoft Word to Web Page Designs {#classic-microsoft-word-to-web-page-designs}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/wordDesign</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/wcm/designs/wordDesign</code></p> <p><code>/apps/settings/wcm/designs/wordDesign</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For any Designs that are managed in SCM, and not written to at run-time via Design Dialogs.</p>
    <ol>
     <li>Copy the designs from the Previous Location to the New Location (<code>/apps</code>).</li>
     <li>Convert any CSS, JavaScript and static resources in the Design to a <a href="/help/sites-developing/clientlibs.md#creating-client-library-folders" target="_blank">Client Library</a> with <code>allowProxy = true</code>.</li>
     <li>Update references to the Previous Location in the cq:designPath property.</li>
     <li>Update any Pages referencing the Previous Location to use the new Client Library category (this requires updating Page implementation code).</li>
     <li>Update AEM Dispatcher rules to allow serving of Client Libraries via the <code>/etc.clientlibs/</code> proxy servlet.</li>
    </ol> <p>For any Designs that NOT managed in SCM, and modified run-time via Design Dialogs:</p>
    <ul>
     <li>Do not move author-able Designs out of <code>/etc</code>.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Mobile Device Emulator Configurations {#mobile-device-emulator-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/mobile</code></p> </td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/mobile</code></p> <p><code>/apps/settings/mobile</code></p> <p><code>/conf/global/settings/mobile</code></p> <p><code>/conf/&lt;tenant&gt;/settings/mobile</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td>Any new Mobile Device Emulator Configurations must be migrated to the New Location.
    <ol>
     <li>Copy any new Mobile Device Emulator Configurations from the Previous Location to the new location (<code>/apps</code>, <code>/conf/global</code>, <code>/conf/&lt;tenant&gt;</code>).</li>
     <li>For any AEM Sites Pages that depend on these Mobile Device Emulator Configurations, update the Page's <span class="code">
       <code>
        jcr
       </code>
       <code>
        :content
       </code></span> node: <br /> <span class="code">[cq:Page]/jcr:content@cq:
       <code>
        deviceGroups
       </code> = String[ mobile/groups/responsive ]</span></li>
     <li>For any Editable Templates that depend on these Mobile Device Emulator Configurations, update the Editable Templates, pointing the <span class="code">
       <code>
        cq
       </code>:
       <code>
        deviceGroups
       </code></span> to the New Location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Mobile Device Emulator Configurations resolution occurs in the following order:</p>
    <ol>
     <li><code>/conf/&lt;tenant&gt;/settings/mobile</code></li>
     <li><code>/conf/global/settings/mobile</code></li>
     <li><code>/apps/settings/mobile</code></li>
     <li><code>/libs/settings/mobile</code></li>
     <li><code>/etc/mobile</code></li>
    </ol> </td>
  </tr>
 </tbody>
</table>

### Multi-site Manager Blueprint Configurations {#multi-site-manager-blueprint-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/blueprints</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/apps/msm</code> (Customer Blueprint configurations)</p> <p><code>/libs/msm</code> (Out Of the Box Blueprint configurations for Screens, Commerce)</p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified Multi-site Manager Blueprint Configurations must be migrated to the New Location (<code>/apps</code>).</p>
    <ol>
     <li>Copy any new or modified Multi-site Manager Blueprint Configurations from the Previous Location to the New Location (<code>/apps</code>).</li>
     <li>Remove any migrated Multi-site Manager Blueprint Configurations from the Previous Location.</li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>All AEM provided Multi-site Manager Blueprint Configurations exist in the New Location in <code>/libs</code>.</p> <p>Content does not reference the Multi-site Manager Blue Configurations therefore there are not content references to adjust.</p> </td>
  </tr>
 </tbody>
</table>

### Multi-site Manager Rollout Configurations {#multi-site-manager-rollout-configurations}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/msm/rolloutConfigs</code></p> </td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/msm/wcm/rolloutconfigs</code></p> <p><code>/apps/msm/wcm/rolloutconfigs</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any new or modified Multi-site Manager Rollout Configurations must be migrated to the New Location.</p>
    <ol>
     <li>Copy any new or modified Multi-site Manager Rollout Configurations from the Previous Location to the new location (<code>/apps</code>).</li>
     <li>Update any references on AEM Pages to Multi-site Manager Rollout Configurations in the Previous Location, to point to their counterparts in the New Locations (<code>/libs</code> or <code>/apps</code>).</li>
    </ol> <p>Remove migrated Multi-site Manager Rollout Configurations from the Previous Location.</p> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>Failing to remove migrated Multi-site Manager Rollout Configurations from the Previous Location results in duplicate rollout options displayed to AEM authors.</td>
  </tr>
 </tbody>
</table>

### Page Event Notification E-mail Template {#page-event-notification-e-mail-template}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/notification/email/default/com.day.cq.wcm.core.page</code></p> </td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><code>/libs/settings/notification-templates/com.day.cq.wcm.core.page</code></p> <p><code>/apps/settings/notification-templates/com.day.cq.wcm.core.page</code></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>The only supported new Page Event Notification E-mail Templates are to support new locales.</p> <p>Page Event E-mail Template resolution occurs in the following order:</p>
    <ol>
     <li><code>/etc/notification/email/default/com.day.cq.wcm.core.page</code></li>
     <li><code>/apps/settings/notification-templates/com.day.cq.wcm.core.page</code></li>
     <li><code>/libs/settings/notification-templates/com.day.cq.wcm.core.page</code></li>
    </ol> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Any new or modified Page Event Notification E-mail Templates must be migrated to the new location under <code>/apps</code>:</p>
    <ol>
     <li>Copy any new or modified Page Event Notification E-mail Templates from the Previous Location to the new location (<code>/apps</code>).</li>
     <li>Remove any migrated Page Event Notification E-mail Templates from the Previous Location.</li>
    </ol> </td>
  </tr>
 </tbody>
</table>

### Page Scaffolding {#page-scaffolding}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/scaffolding</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><p><span class="code">/libs/settings/
      <code>
       wcm
      </code>/template-types/scaffolding/scaffolding</span></p> <p><span class="code">/apps/settings/
      <code>
       wcm
      </code>/template-types/scaffolding/scaffolding</span></p> </td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td>Scaffolding created under the Previous Location uses the legacy Scaffolding framework and cannot be migrated to the New Location. To align with the New Location any legacy Scaffolding must be re-developed using the supported Scaffolding framework.</td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>N/A<br /> </td>
  </tr>
 </tbody>
</table>

### Responsive Grid LESS {#responsive-grid-less}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/clientlibs/wcm/foundation/grid/grid_base.less</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/wcm/foundation/clientlibs/grid/grid_base.less</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any references to the Previous Location in custom LESS files must be updated to import from the New Location.</p>
    <ul>
     <li>Update any referencing custom LESS files that reference grid_base.less in the Previous Location to reference the new location.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>Referencing a non-existing <code>grid_base.less</code> file results in the Layout Mode of the Page and Template Editor not working, and a disruption of page layout.</td>
  </tr>
 </tbody>
</table>

### Static Template Designs {#static-template-designs}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><code>/etc/designs/&lt;custom-site&gt;</code></td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/apps/settings/wcm/designs/&lt;custom-site&gt;</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>For any Designs that are managed in SCM, and not written to at run-time via Design Dialogs.</p>
    <ol>
     <li>Copy the designs from the Previous Location to the New Location (<code>/apps</code>).</li>
     <li>Convert any CSS, JavaScript and static resources in the Design to a <a href="/help/sites-developing/clientlibs.md#creating-client-library-folders" target="_blank">Client Library</a> with <code>allowProxy = true</code>.</li>
     <li>Update references to the Previous Location in the <code>cq:designPath</code> property via <strong>AEM &gt; Sites &gt; Custom Site Pages &gt; Page Properties &gt; Advanced Tab &gt; Design Field</strong>.</li>
     <li>Update any Pages referencing the Previous Location to use the new Client Library category (this requires updating Page implementation code).</li>
     <li>Update AEM Dispatcher rules to allow the serving of Client Libraries via the <code>/etc.clientlibs/</code> proxy servlet.</li>
    </ol> <p>For any Designs that NOT managed in SCM, and modified run-time via Design Dialogs:</p>
    <ul>
     <li>Do not move author-able Designs out of <code>/etc</code>.</li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td>The recommended approach is to build AEM Sites and Pages using Editable Templates which use Structure Content and Policies in lieu of Designs.</td>
  </tr>
 </tbody>
</table>

<!-- Search&Promote is end of life as of September 1, 2022 ### Adobe Search and Promote Integration Client Libraries {#adobe-search-and-promote-integration-client-libraries}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/clientlibs/foundation/searchpromote</code></p> </td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/cq/searchpromote/clientlibs/searchpromote</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any custom use of these Client Libraries should reference the Client Library by category, and not by path.</p>
    <ol>
     <li>Any references to the Client Library by path at the Previous Location should be updated to use <a href="/help/sites-developing/clientlibs.md#referencing-client-side-libraries" target="_blank">AEM's Client Library referencing framework</a>.</li>
     <li>If AEM's Client Library referencing framework cannot be used, the absolute path of the Client Libraries can be referenced via AEM's Client Library Proxy servlet:</li>
    </ol>
    <ul>
     <li><code>/etc.clientlibs/cq/searchpromote/clientlibs/searchpromotei.js</code></li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Editing of these Client Libraries was never supported.</p> <p>To obtain the Client Library categories, visit each cq:ClientLIbraryFolder node via CRXDELite and inspect the categories property:</p>
    <ul>
     <li><code>/libs/cq/searchpromote/clientlibs/searchpromote</code></li>
    </ul> </td>
  </tr>
 </tbody>
</table> -->

### Adobe Target Integration Client Libraries {#adobe-target-integration-client-libraries}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/clientlibs/foundation/target</code></p> </td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/cq/testandtarget/clientlibs/testandtarget</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any custom use of these Client Libraries should reference the Client Library by category, and not by path.</p>
    <ol>
     <li>Any references to the Client Library by path at the Previous Location should be updated to use <a href="/help/sites-developing/clientlibs.md#referencing-client-side-libraries" target="_blank">AEM's Client Library referencing framework</a>.</li>
     <li>If AEM's Client Library referencing framework cannot be used, the absolute path of the Client Libraries can be referenced via AEM's Client Library Proxy servlet:</li>
    </ol>
    <ul>
     <li><code>/etc.clientlibs/cq/testandtarget/clientlibs/testandtarget/testandtarget.js</code></li>
     <li><code>/etc.clientlibs/cq/testandtarget/clientlibs/testandtarget/atjs.js</code></li>
     <li><code>/etc.clientlibs/cq/testandtarget/clientlibs/testandtarget/atjs-integration.js</code></li>
     <li><code>/etc.clientlibs/cq/testandtarget/clientlibs/testandtarget/init.js</code></li>
     <li><code>/etc.clientlibs/cq/testandtarget/clientlibs/testandtarget/mbox.js</code></li>
     <li><code>/etc.clientlibs/cq/testandtarget/clientlibs/testandtarget/parameters.js</code></li>
     <li><code>/etc.clientlibs/cq/testandtarget/clientlibs/testandtarget/util.js</code></li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Editing of these Client Libraries was never supported.</p> <p>To obtain the Client Library categories, visit each cq:ClientLIbraryFolder node via CRXDELite and inspect the categories property:</p>
    <ul>
     <li><code>/libs/cq/testandtarget/clientlibs/testandtarget/testandtarget</code></li>
     <li><code>/libs/cq/testandtarget/clientlibs/testandtarget/atjs</code></li>
     <li><code>/libs/cq/testandtarget/clientlibs/testandtarget/atjs-integration</code></li>
     <li><code>/libs/cq/testandtarget/clientlibs/testandtarget/init</code></li>
     <li><code>/libs/cq/testandtarget/clientlibs/testandtarget/mbox</code></li>
     <li><code>/libs/cq/testandtarget/clientlibs/testandtarget/parameters</code></li>
     <li><code>/libs/cq/testandtarget/clientlibs/testandtarget/util</code></li>
    </ul> </td>
  </tr>
 </tbody>
</table>

### WCM Foundation Client Libraries {#wcm-foundation-client-libraries}

<table>
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td>
   <td><p><code>/etc/clientlibs/wcm/foundation</code></p> </td>
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td>
   <td><code>/libs/wcm/foundation/clientlibs</code></td>
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td>
   <td><p>Any custom use of these Client Libraries should reference the Client Library by category, and not by path.</p>
    <ol>
     <li>Any references to the Client Library by path at the Previous Location should be updated to use <a href="/help/sites-developing/clientlibs.md#referencing-client-side-libraries" target="_blank">AEM's Client Library referencing framework</a>.</li>
     <li>If AEM's Client Library referencing framework cannot be used, the absolute path of the Client Libraries can be referenced via AEM's Client Library Proxy servlet.</li>
    </ol>
    <ul>
     <li><code>/etc.clientlibs/wcm/foundation/clientlibs/accessibility.css</code></li>
     <li><code>/etc.clientlibs/wcm/foundation/clientlibs/main.css</code></li>
     <li><code>/etc.clientlibs/wcm/foundation/clientlibs/main.js</code></li>
    </ul> </td>
  </tr>
  <tr>
   <td><strong>Notes</strong></td>
   <td><p>Editing of these Client Libraries was never supported.</p> <p>To obtain the Client Library categories, visit each <code>cq:ClientLIbraryFolder</code> node via CRXDELite and inspect the categories property:</p>
    <ul>
     <li><code>/libs/wcm/foundation/clientlibs/accessibility</code></li>
     <li><code>/libs/wcm/foundation/clientlibs/main</code></li>
    </ul> </td>
  </tr>
 </tbody>
</table>
