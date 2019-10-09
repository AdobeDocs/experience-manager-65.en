---
title: Tools Consoles
seo-title: Tools Consoles
description: Learn about the different tools consoles throughout AEM.
seo-description: Learn about the different tools consoles throughout AEM.
uuid: d01382f8-0c8f-4d76-9271-bed9e34b3b4b
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: operations
content-type: reference
discoiquuid: 2bf8496d-a485-4b39-a6c9-07222b66d0cd
---

# Tools Consoles{#tools-consoles}

The **Tools** consoles provide access to a number of specialized tools that help you administer your websites, digital assets and other aspects of your content repository. There are currently two flavors of the **Tools** console dependent on the UI you are using:

* [Tools - Classic UI](#tools-classic-ui)
* [Tools - Touch-Optimized UI](#tools-touch-optimized-ui)

## Tools - Classic UI {#tools-classic-ui}

<table> 
 <tbody> 
  <tr> 
   <th>Page or Folder</th> 
   <th> </th> 
   <th>Purpose</th> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/msm.md">MSM Control Center</a></td> 
   <td> </td> 
   <td>Centralized point for managing your multiple sites.</td> 
  </tr> 
  <tr> 
   <td>Client Context Configurations<br /> </td> 
   <td> </td> 
   <td>The <a href="/help/sites-developing/client-context.md">Client Context</a> represents a dynamically assembled collection of user data. The default and marketing cloud configurations are held here.<br /> </td> 
  </tr> 
  <tr> 
   <td>Cloud Services Configurations<br /> </td> 
   <td> </td> 
   <td>Holds configurations related to <a href="/help/sites-administering/marketing-cloud.md">Integrating with the Adobe Marketing Cloud</a>.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/ecommerce.md">Commerce</a></td> 
   <td> </td> 
   <td>Provides access to importers and various product data.</td> 
  </tr> 
  <tr> 
   <td>DAM - Digital Rights Management<br /> </td> 
   <td> </td> 
   <td>Provides access to digital rights information and licences.</td> 
  </tr> 
  <tr> 
   <td>DAM - Health Checker<br /> </td> 
   <td> </td> 
   <td>Compares <code>/var/dam</code> and <code>/content/dam</code> and checks for<br /> any inconsistencies. Any files/folders listed can then be synchronized or deleted. Node types for folder comparison are configurable in the web console.</td> 
  </tr> 
  <tr> 
   <td>DAM - Adobe Indesign<br /> </td> 
   <td> </td> 
   <td>Scripts for use in conjunction with Adobe Indesign.</td> 
  </tr> 
  <tr> 
   <td>DAM - Video Profiles<br /> </td> 
   <td> </td> 
   <td>Configurable profiles for ffmpeg transcodings.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/dashboards.md">Dashboards</a></td> 
   <td> </td> 
   <td>Allows you to create reporting dashboards; these provide a customizable way to define pages that display consolidated data.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-developing/designer.md">Designs</a></td> 
   <td> </td> 
   <td>Holds the list of designs defined, including the graphics and css files to be used.</td> 
  </tr> 
  <tr> 
   <td>Custom Documentation</td> 
   <td> </td> 
   <td>Used when extending the documentation and online help.</td> 
  </tr> 
  <tr> 
   <td>Form Submissions</td> 
   <td> </td> 
   <td>Holds the list of form submissions received.</td> 
  </tr> 
  <tr> 
   <td>Importers - <a href="/help/sites-administering/bulk-editor.md">Bulk Editor</a></td> 
   <td> </td> 
   <td>Lets you search for items and edit them in bulk. You can also export and import content (in bulk) into the repository.</td> 
  </tr>
  <tr> 
   <td>Importer - Feed Importer</td> 
   <td> </td> 
   <td><p>The feed importer is a framework to repeatedly import content from external sources into your repository. The idea of the feed importer is to poll a remote resource at a specified interval, to parse it, and to create nodes in the content repository that represent the content of the remote resource.</p> </td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/external-link-checker.md">External Linkchecker</a></td> 
   <td> </td> 
   <td>Scans all content pages within your AEM instance and checks any external links. A list of valid and invalid links displays.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-authoring/mobile.md">Mobile</a></td> 
   <td> </td> 
   <td>Helps you create websites designed for mobile devices.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/msm.md">MSM</a></td> 
   <td> </td> 
   <td>Handles multilingual and multinational content, helping you balance centralized branding with localized content.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/notification.md">Notification</a></td> 
   <td> </td> 
   <td>Notification templates.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/package-manager.md">Packages</a></td> 
   <td> </td> 
   <td>An alternative link to the Package Manager that shows the packages that have been loaded for AEM WCM. Similar to the information shown in CRX's Package Manager.</td> 
  </tr> 
  <tr> 
   <td>Replication - <a href="/help/sites-deploying/configuring.md#replication-reverse-replication-and-replication-agents">Replication Agents</a></td> 
   <td> </td> 
   <td>Used to replicate data from author to publish when publishing pages, or with reverse replication to return user comments from the publish environment to author.</td> 
  </tr> 
  <tr> 
   <td>Importers - <a href="/help/sites-authoring/publishing-pages.md#publishing-and-unpublishing-a-tree">Activate Tree</a></td> 
   <td> </td> 
   <td>From the Websites tab you can activate the individual pages. When you have entered, or updated, a considerable number of content pages - all of which are resident under the same root page - it can be easier to activate the entire tree in one action. You can also perform a Dry Run to emulate an activation and highlight which pages would be activated.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/reporting.md">Reports</a></td> 
   <td> </td> 
   <td>AEM provides a range of customized reports, allows you to create customized reports and/or develop your own.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-authoring/scaffolding.md">Default Page Scaffolding</a></td> 
   <td> </td> 
   <td>With scaffolding you can create a form (a scaffold) with fields that reflect the structure you want for your pages and then use this form to easily create pages based on this structure.</td> 
  </tr> 
  <tr> 
   <td>Security - <a href="/help/sites-administering/notification.md">Self-Service Configuration </a> </td> 
   <td> </td> 
   <td>Lets you configure the emails that users automatically receive when they create an account or reset a password and to confirm a password that has been reset.</td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/campaign-segmentation.md">Segmentation</a></td> 
   <td> </td> 
   <td>Site visitors have different interests and objectives when they come to a site. Understanding these goals and fulfilling the expectations is an important success factor for online marketing. Segmentation helps to achieve this by analyzing and characterizing a visitor's details.<br /> </td> 
  </tr> 
  <tr> 
   <td><a href="/help/communities/working-with-srp.md">socialconfig</a></td> 
   <td> </td> 
   <td>Default SRP configuration. See <a href="/help/communities/srp-config.md">Storage Configuration</a> console.</td> 
  </tr> 
  <tr> 
   <td>taskmanagement</td> 
   <td> </td> 
   <td>No active functionality related to this entry.</td> 
  </tr> 
  <tr> 
   <td>tenants</td> 
   <td> </td> 
   <td>No active functionality related to this entry.</td> 
  </tr> 
  <tr> 
   <td>Versioning - <a href="/help/sites-deploying/version-purging.md">Purge Versions</a></td> 
   <td> </td> 
   <td>Allows you to purge page versions as required.</td> 
  </tr> 
  <tr> 
   <td>Virtual Repositories</td> 
   <td> </td> 
   <td>You can set up a Virtual Repository using the workspace mount feature to provide JCR-enabled content applications with simplified access to JCR content infrastructure based on CRX and the JCR Connectors.</td> 
  </tr> 
  <tr> 
   <td>watchwords</td> 
   <td> </td> 
   <td>Deprecated. See <a href="/help/communities/moderate-ugc.md#watchwords">Moderating Community Content</a></td> 
  </tr> 
  <tr> 
   <td><a href="/help/sites-administering/workflows.md">Workflow</a></td> 
   <td> </td> 
   <td>Workflows control a series of actions on pages or digital assets that support any editorial process.</td> 
  </tr> 
 </tbody> 
</table>

## Tools - Touch-Optimized UI {#tools-touch-optimized-ui}

<table> 
 <tbody> 
  <tr> 
   <th>Section</th> 
   <th>Option</th> 
   <th>Purpose</th> 
  </tr> 
  <tr> 
   <td>Authoring</td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-classic-ui-authoring/classic-personalization-campaigns.md">Campaigns</a></td> 
   <td>Manage your marketing campaigns.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-authoring/launches.md">Launches</a></td> 
   <td>Manage your marketing launches.</td> 
  </tr> 
  <tr> 
   <td>Tasks</td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-authoring/task-content.md">Inbox</a></td> 
   <td>Manage your Inbox items.</td> 
  </tr> 
  <tr> 
   <td>Operations</td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-administering/security.md">Users and Groups</a></td> 
   <td>Manage your users and groups.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-authoring/tags.md">Tag Management</a></td> 
   <td>Organize your tags and their namespaces.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="https://helpx.adobe.com/cloud-manager/using/using-cloud-manager.html">Cloud Services</a></td> 
   <td>Connect to Adobe Marketing Cloud.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-administering/workflows.md">Workflows</a></td> 
   <td>Model and manage workflows.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-deploying/replication.md">Replication</a></td> 
   <td>Create and manager multiple website.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-administering/reporting.md">Reports</a></td> 
   <td>Create and monitor custom reports.<br /> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-developing/hobbes.md">Testing</a></td> 
   <td>Run tests defined for your application.</td> 
  </tr> 
  <tr> 
   <td>Granite Operations</td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-developing/developing-with-crxde-lite.md">CRXDE Lite</a></td> 
   <td>Develop applications with a web-based IDE.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-administering/package-manager.md">Packages</a></td> 
   <td>Package and share applications.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-administering/package-manager.md#package-share">Package Share</a></td> 
   <td>Download applications from Adobe and the community.<br /> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-deploying/offloading.md#administering-topologies">Topology Browser</a></td> 
   <td>View the instances topology.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-deploying/offloading.md">Offloading Browser</a></td> 
   <td>Manage offloading.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td><a href="/help/sites-deploying/monitoring-and-maintaining.md#backups">Backup</a></td> 
   <td>Carry out backup tasks.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td>Web Console<br /> </td> 
   <td>Configure and manage the application platform.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td>Web Console Configuration Dump<br /> </td> 
   <td>Download the configuration status from the web console.<br /> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td>Users</td> 
   <td>Manage your users.</td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td>Groups</td> 
   <td>Manage your groups.</td> 
  </tr> 
  <tr> 
   <td>External Resources<br /> </td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td>Documentation</td> 
   <td>View the Web Experience Management documentation.<br /> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td>Developer Resources</td> 
   <td>Developer resources and downloads.</td> 
  </tr> 
 </tbody> 
</table>

>[!NOTE]
>
>Some of the above options actually link to the classic UI.

