---
title: Troubleshooting Dynamic Media - Scene7 mode
seo-title: Troubleshooting Dynamic Media - Scene7 mode
description: Troubleshooting Dynamic Media in Scene7 runmode.
seo-description: Troubleshooting Dynamic Media in Scene7 runmode.
uuid: 77e04ccf-33dc-4d2f-8950-318d4b008f74
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: 0d48c031-d3ee-4143-b739-a79ba28fd63a
docset: aem65

---

# Troubleshooting Dynamic Media - Scene7 mode{#troubleshooting-dynamic-media-scene-mode}

The following document describes troubleshooting for Dynamic Media running **dynamicmedia_scene7** run mode.

## Setup and Configuration {#setup-and-configuration}

Ensure that Dynamic Media has been set up properly by doing the following:

* Start up command contains the `-r dynamicmedia_scene7` runmode argument.
* Any AEM 6.4 cumulative fix packs (CFPs) have been installed first *before* any available Dynamic Media Feature Packs.
* Optional Feature Pack 18912 is installed.

  This optional feature pack is for FTP support or if you are migrating assets to Dynamic Media from Dynamic Media Classic (Scene7).

* Navigate to the Cloud Services user interface and confirm that the provisioned account appears under **[!UICONTROL Available Configurations]**.
* Ensure that the `Dynamic Media Asset Activation (scene7)` replication agent is enabled.

  This replication agent is found under Agents on Author.

## General (All Assets) {#general-all-assets}

The following are some general tips and tricks for all assets.

### Asset Synchronization Status Properties {#asset-synchronization-status-properties}

The following asset properties can be reviewed in CRXDE Lite to confirm the successful synchronization of the asset from AEM to Dynamic Media:

| **Property** |**Example** |**Description** |
|---|---|---|
| `<object_node>/jcr:content/metadata/dam:scene7ID` |**`a|364266`** |General indicator that node is linked to Dynamic Media. |
| `<object_node>/jcr:content/metadata/dam:scene7FileStatus` |**PublishComplete** or error text |Status of upload of asset to Dynamic Media. |
| `<object_node>/jcr:content/metadata/dam:scene7File`  |**myCompany/myAssetID** |Must be populated in order to generate URLs to remote asset of Dynamic Media. |
| `<object_node>/jcr:content/dam:lastSyncStatus` |**success** or **failed: `<error text>`** |Synchronization status of sets (spin sets, image sets, and so on), image presets, viewer presets, image map updates for an asset, or images that were edited. |

### Synchronization Logging {#synchronization-logging}

Synchronization errors and issues are logged in `error.log` (AEM server directory `/crx-quickstart/logs/`). Sufficient logging is available to determine the root cause of most issues, however you can increase the logging to DEBUG on the `com.adobe.cq.dam.ips` package through the Sling Console ([https://localhost:4502/system/console/slinglog](https://localhost:4502/system/console/slinglog)) to gather more information.

### Move, Copy, Delete {#move-copy-delete}

Before performing a Move, Copy, or Delete operation, do the following:

* For images and videos, confirm that a `<object_node>/jcr:content/metadata/dam:scene7ID` value exists before performing move, copy, or delete operations.
* For image and viewer presets, confirm that an `https://<server>/crx/de/index.jsp#/etc/dam/presets/viewer/testpreset/jcr%3Acontent/metadata` value exists before performing move, copy, or delete operations.
* If above metadata value is missing, you need to re-upload assets before move, copy, or delete operations.

### Version Control {#version-control}

When replacing an existing Dynamic Media asset (same name and location), you have the option to keep both assets or replace/create a version:

* Keeping both will create a new asset with a unique name for the published asset URL. For example, `image.jpg` is the original asset and `image1.jpg` is the newly uploaded asset.

* Creating a version is not supported in Dynamic Media - Scene7 mode delivery. The new version will replace the existing asset in delivery.

## Images and Sets {#images-and-sets}

If you are having issues with images and sets, see the following troubleshooting guidance.

<table>
 <tbody>
  <tr>
   <td><strong>Issue</strong></td>
   <td><strong>How to debug</strong></td>
   <td><strong>Solution</strong></td>
  </tr>
  <tr>
   <td>Cannot access copy URL/Embed button in asset detail view</td>
   <td>
    <ol>
     <li><p>Go to CRX/DE:</p>
      <ul>
       <li>Check whether the preset in the JCR <code>/etc/dam/presets/viewer/&lt;preset&gt; has lastReplicationAction</code> defined. Note that this location applies if you upgraded from AEM 6.x to 6.4 and opted out of migration. Otherise, the location is <code>/conf/global/settings/dam/dm/presets/viewer</code>.</li>
       <li>Check to make sure that the asset in the JCR has <code>dam:scene7FileStatus</code><strong> </strong>under Metadata shows as <code>PublishComplete</code>.</li>
      </ul> </li>
    </ol> </td>
   <td><p>Refresh page/navigate to another page and come back (side rail JSP needs to be recompiled)</p> <p>If that does not work:</p>
    <ul>
     <li>Publish asset.</li>
     <li>Re-upload asset and publish it.</li>
    </ul> </td>
  </tr>
  <tr>
   <td>Asset selector in set editor stuck in perpetual loading</td>
   <td><p>Known issue to be fixed in 6.4</p> </td>
   <td><p>Close the selector and reopen it.</p> </td>
  </tr>
  <tr>
   <td><strong>Select</strong> button is not active after selecting an asset as part of editing a set</td>
   <td><p> </p> <p>Known issue to be fixed in 6.4</p> <p> </p> </td>
   <td><p>Click on another folder in the Asset Selector first and go back to select the asset.</p> </td>
  </tr>
  <tr>
   <td>Carousel hotspot moves around after switching between slides</td>
   <td><p>Check that all slides are the same size.</p> </td>
   <td><p>Use only images with the same size for the carousel.</p> </td>
  </tr>
  <tr>
   <td>Image does not preview with the Dynamic Media viewer</td>
   <td><p>Check that the asset contains <code>dam:scene7File</code> in the Metadata properties (CRXDE Lite)</p> </td>
   <td><p>Check that all assets have finished processing.</p> </td>
  </tr>
  <tr>
   <td>Uploaded asset does not show in asset selector</td>
   <td><p>Check asset has property <code>jcr:content</code> &gt; <strong><code>dam:assetState</code></strong> = <code>processed</code> (CRXDE Lite)</p> </td>
   <td><p>Check that all assets have finished processing.</p> </td>
  </tr>
  <tr>
   <td>Banner on card view shows <strong>New</strong> when asset has not started processing</td>
   <td>Check asset <code>jcr:content</code> &gt; <code>dam:assetState</code> = if <code>unprocessed</code> it was not picked up by the workflow.</td>
   <td>Wait until asset is picked up by workflow.</td>
  </tr>
  <tr>
   <td>Images or sets do not display the viewer URL or embed code</td>
   <td>Check if the viewer preset has been published.</td>
   <td><p>Go to <strong>Tools</strong> &gt; <strong>Assets</strong> &gt; <strong>Viewer Presets</strong> and publish the viewer preset.</p> </td>
  </tr>
 </tbody>
</table>

## Video {#video}

If you are having issues with video, see the following troubleshooting guidance.

<table>
 <tbody>
  <tr>
   <td><strong>Issue</strong></td>
   <td><strong>How to debug</strong></td>
   <td><strong>Solution</strong></td>
  </tr>
  <tr>
   <td>Video cannot be previewed</td>
   <td>
    <ul>
     <li>Check that the folder has a video profile assigned to it (if non-supported file format). If non-supported, only an image displays.</li>
     <li>Video profile must contain more than one encoding preset to generate an AVS set (single encodings are treated as video content for MP4 files; for non-supported files, treated the same as non-processed).</li>
     <li>Check that the video has finished processing by confirming <code>dam:scene7FileAvs</code> of <code>dam:scene7File</code> in metadata.</li>
    </ul> </td>
   <td>
    <ol>
     <li>Assign a video profile to the folder.</li>
     <li>Edit video profile to include more than one encoding preset.</li>
     <li>Wait for video to finish processing.</li>
     <li>Be you re-load the video, make sure that the Dynamic Media Encode Video workflow is not running.<br /> </li>
     <li>Re-upload the video.</li>
    </ol> </td>
  </tr>
  <tr>
   <td>Video is not encoded</td>
   <td>
    <ul>
     <li>Check that the runmode is <code>dynamicmedia_scene7</code>.</li>
     <li>Check whether Dynamic Media cloud service is configured.</li>
     <li>Check whether a video profile is associated with the upload folder.</li>
    </ul> </td>
   <td>
    <ol>
     <li>Check your AEM instance with <code>-r dynamicmedia_scene7</code></li>
     <li>Check that the Dynamic Media Configuration under Cloud Services is properly setup.</li>
     <li>Check that the folder has a video profile. Also, check the video profile.</li>
    </ol> </td>
  </tr>
  <tr>
   <td>Video processing takes too long</td>
   <td><p>To determine if video encoding is still in progress or if it has entered a failure state:</p>
    <ul>
     <li>Check the video status <code>https://localhost:4502/crx/de/index.jsp#/content/dam/folder/videomp4/jcr%3Acontent</code> &gt; <code>dam:assetState</code></li>
     <li>Monitor the video from the workflow console <code>https://localhost:4502/libs/cq/workflow/content/console.html</code> &gt; Instances, Archive, Failures tabs.</li>
    </ul> </td>
   <td> </td>
  </tr>
  <tr>
   <td>Video rendition missing</td>
   <td><p>When video is uploaded, but there are no encoded renditions:</p>
    <ul>
     <li>Check that the folder has a video profile assigned to it.</li>
     <li>Check that the video has finished processing by confirming <code>dam:scene7FileAvs</code> in metadata.</li>
    </ul> </td>
   <td>
    <ol>
     <li>Assign a video profile to the folder.</li>
     <li>Wait for video to finish processing.<br /> </li>
    </ol> </td>
  </tr>
 </tbody>
</table>

## Viewers {#viewers}

If you are having issues with viewers, see the following troubleshooting guidance.

<table>
 <tbody>
  <tr>
   <td><strong>Issue</strong></td>
   <td><strong>How to debug</strong></td>
   <td><strong>Solution</strong></td>
  </tr>
  <tr>
   <td>Viewer Presets are not published</td>
   <td><p>Proceed to sample manager diagnostic page: <code>https://localhost:4502/libs/dam/gui/content/s7dam/samplemanager/samplemanager.html</code></p> <p>Observe computed values. When operating correctly you should see:</p> <p><code>_DMSAMPLE status: 0 unsyced assets - activation not necessary
       _OOTB status: 0 unsyced assets - 0 unactivated assets</code></p> <p><strong>Note</strong>: It can take about 10 minutes after configuration of Dynamic Media cloud settings for the viewer assets to sync.</p> <p>If unactivated assets remain, click either of the <strong>List all Unactivated Assets</strong> buttons to see details.</p> </td>
   <td>
    <ol>
     <li>Navigate to viewer preset list in admin tools: <code>https://localhost:4502/libs/dam/gui/content/s7dam/samplemanager/samplemanager.html</code></li>
     <li>Select all viewer presets, then click <strong>Publish</strong>.</li>
     <li>Navigate back to sample manager and observe that unactivated asset count is now zero.</li>
    </ol> </td>
  </tr>
  <tr>
   <td>Viewer Preset artwork returns 404 from preview in asset details or copy URL/embed code</td>
   <td><p>In CRXDE Lite do the following:</p>
    <ol>
     <li>Navigate to <code>&lt;sync-folder&gt;/_CSS/_OOTB</code> folder within your Dynamic Media sync folder (for example, <code>/content/dam/_CSS/_OOTB</code>),</li>
     <li>Find the metadata node of the problematic asset (for example, <code>&lt;sync-folder&gt;/_CSS/_OOTB/CarouselDotsLeftButton_dark_sprite.png/jcr:content/metadata/</code>).</li>
     <li>Check for the presence of <code>dam:scene7*</code> properties. If the asset was successfully synced and published you see the <code>dam:scene7FileStatus</code> set is to <strong>PublishComplete</strong>.</li>
     <li>Attempt to request the artwork directly from Dynamic Media by concatenating the values of the following properties and string literals
      <ul>
       <li><code>dam:scene7Domain</code></li>
       <li><code>"is/content"</code></li>
       <li><code>dam:scene7Folder</code></li>
       <li><code>&lt;asset-name&gt;</code></li>
       <li>Example: <code>https://&lt;server&gt;/is/content/myfolder/_CSS/_OOTB/CarouselDotsLeftButton_dark_sprite.png</code></li>
      </ul> </li>
    </ol> </td>
   <td><p>If the sample assets or viewer preset artwork have not synced or published then restart the entire copy/sync process:</p>
    <ol>
     <li>Navigate to CRXDE Lite.
      <ul>
       <li>Delete <code>&lt;sync-folder&gt;/_CSS/_OOTB</code>.</li>
      </ul> </li>
     <li>Navigate to the CRX package manager: <code>https://localhost:4502/crx/packmgr/</code><a href="https://localhost:4502/crx/packmgr/"></a>
      <ol>
       <li>Search for viewer package in list (it starts with <code>cq-dam-scene7-viewers-content</code>)</li>
       <li>Click <strong>Reinstall</strong>.</li>
      </ol> </li>
     <li>Under Cloud Services, navigate to the Dynamic Media Configuration page, then open the configuration dialog box for your Dynamic Media - S7 configuration.
      <ul>
       <li>Make no changes, click <strong>Save</strong>. This triggers the logic again to create and sync the sample assets, viewer preset CSS, and artwork.<br />  </li>
      </ul> </li>
    </ol> </td>
  </tr>
 </tbody>
</table>

