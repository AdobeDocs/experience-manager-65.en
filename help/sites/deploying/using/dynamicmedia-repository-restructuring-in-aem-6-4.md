---
title: Dynamic Media Repository Restructuring in AEM 6.4
seo-title: Dynamic Media Repository Restructuring in AEM 6.4
description: Learn how to make the necessary changes in order to migrate to the new repository structure in AEM 6.4 for Dynamic Media.
seo-description: Learn how to make the necessary changes in order to migrate to the new repository structure in AEM 6.4 for Dynamic Media.
uuid: 7e9eae7a-fc38-4e66-8c5f-d295636d8e3b
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: repository-restructuring
discoiquuid: a5a229e7-c08e-4101-859f-829748aceffc
index: y
internal: n
snippet: y
---

# Dynamic Media Repository Restructuring in AEM 6.4{#dynamic-media-repository-restructuring-in-aem}

As described on the parent [Repository Restructuring in AEM 6.4](/sites/deploying/using/repository-restructuring.md) page, customers upgrading to AEM 6.4 should use this page to assess the work effort associated with repository changes impacting the Dynamic Media Solution. Some changes require work effort during the AEM 6.4 upgrade process, while others can be deferred until a 6.5 upgrade.

**Prior to 6.5 Upgrade**

* [Custom Adaptive Video Encoding Configurations](../../../sites/deploying/using/dynamicmedia-repository-restructuring-in-aem-6-4.md#custom-adaptive-video-encoding-configurations)
* [Dynamic Media (DMS7) Cloud Configuration](../../../sites/deploying/using/dynamicmedia-repository-restructuring-in-aem-6-4.md#dynamic-media-dms-cloud-configuration)
* [Dynamic Media (DM Hybrid) Cloud Service Configuration](../../../sites/deploying/using/dynamicmedia-repository-restructuring-in-aem-6-4.md#main-pars-header-501711721)
* [Dynamic Media - YouTube Cloud Service Configuration](../../../sites/deploying/using/dynamicmedia-repository-restructuring-in-aem-6-4.md#main-pars-header-1269596831)
* [Misc](../../../sites/deploying/using/dynamicmedia-repository-restructuring-in-aem-6-4.md#misc)

## Prior to 6.5 Upgrade {#prior-to-upgrade}

### Custom Adaptive Video Encoding Configurations  {#custom-adaptive-video-encoding-configurations}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td> 
   <td><span class="code">/etc/dam/video/dynamicmedia</span></td> 
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td> 
   <td><span class="code">/conf/global/settings/dam/dm/presets/video/jcr:content</span></td> 
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td> 
   <td><p>You can run the following migration script to migrate to the new location:</p> <p><em>http://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></p> <p>Alternatively, you can edit the configuration in AEM UI, and the changes will be saved to the new location.</p> </td> 
  </tr>
  <tr>
   <td><strong>Notes</strong></td> 
   <td>N/A<br /> </td> 
  </tr>
 </tbody>
</table>

### Dynamic Media (DMS7) Cloud Configuration {#dynamic-media-dms-cloud-configuration}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td> 
   <td><span class="code">/etc/cloudservices/dmscene7</span></td> 
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td> 
   <td><span class="code">/conf/global/settings/cloudconfigs/dmscene7</span></td> 
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td> 
   <td><p>The customer can run a migration script at this location:<br /> </p> 
    <ul> 
     <li><em>http://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></li> 
     <li>Restart Dynamic Media OSGi bundle.</li> 
    </ul> </td> 
  </tr>
  <tr>
   <td><strong>Notes</strong></td> 
   <td><p>See also <a href="../../../assets/using/config-dms7.md#optional-migrating-dynamic-media-presets-and-configurations-from-to-zero-downtime">(Optional) Migrating Dynamic Media presets and configurations from 6.3 to 6.5 Zero Downtime</a>.</p> </td> 
  </tr>
 </tbody>
</table>

### Dynamic Media (DM Hybrid) Cloud Service Configuration {#cloudserviceconfiguration}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td> 
   <td><span class="code">/etc/cloudservices/dynamicmediaservices</span></td> 
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td> 
   <td><span class="code">/conf/global/settings/dam/dm/cloudservices/dynamicmediaservices</span></td> 
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td> 
   <td><p>You can run the migration script below in order to align to the latest model:</p> <p><em>http://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></p> </td> 
  </tr>
  <tr>
   <td><strong>Notes</strong></td> 
   <td>See also <a href="../../../assets/using/config-dynamic.md#optionalmigratingdynamicmediapresetsandconfigurationsfrom63to65zerodowntime">(Optional) Migrating Dynamic Media presets and configurations from 6.3 to 6.5 Zero Downtime</a>.</td> 
  </tr>
 </tbody>
</table>

### Dynamic Media - YouTube Cloud Service Configuration  {#youtubecloudserviceconfiguration}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td> 
   <td><span class="code">/etc/cloudservices/youtube</span></td> 
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td> 
   <td><span class="code">/libs/settings/dam/dm/youtube</span></td> 
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td> 
   <td><p>1. Unpublish all videos from YouTube<br /> 2. Create the YouTube Configuration using the new TouchUI (from <span class="code">/conf</span>) including copying all the Channels from the old location<br /> 3. Publish all videos back to YouTube.</p> <p>This will result in new YouTube URLs. If you do not unpublish prior to creating a new TouchUI YouTube config, then you will have multiple YouTube URLs listed under Properties because the recreated Channels will publish again if given the chance. This means you'll have useless URLs listed under Properties.</p> </td> 
  </tr>
  <tr>
   <td><strong>Notes</strong></td> 
   <td>N/A<br /> </td> 
  </tr>
 </tbody>
</table>

### Misc {#misc}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td> 
   <td><span class="code">/etc/dam/imageserver/macros</span></td> 
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td> 
   <td><span class="code">/conf/global/settings/dam/dm/presets/macro</span></td> 
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td> 
   <td><p>The customer can run the below migration script.</p> <p><em>http://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></p> <p>Alternatively, you can edit the configuration in AEM UI, and the changes will be saved to the new location.</p> </td> 
  </tr>
  <tr>
   <td><strong>Notes</strong></td> 
   <td>N/A</td> 
  </tr>
 </tbody>
</table>

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Previous location</strong></td> 
   <td><span class="code">/etc/dam/presets/analytics</span></td> 
  </tr>
  <tr>
   <td><strong>New location(s)</strong></td> 
   <td><span class="code">/libs/settings/dam/dm/analytics</span></td> 
  </tr>
  <tr>
   <td><strong>Restructuring guidance</strong></td> 
   <td><p>The customer can run the below migration script.</p> <p><em>http://serveraddress:serverport/libs/settings/dam/dm/presets.migratedmcontent.json</em></p> </td> 
  </tr>
  <tr>
   <td><strong>Notes</strong></td> 
   <td>N/A</td> 
  </tr>
 </tbody>
</table>

