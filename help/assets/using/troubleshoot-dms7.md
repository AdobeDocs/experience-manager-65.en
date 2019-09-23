---
title: Troubleshooting Dynamic Media - Scene7 mode
seo-title: Troubleshooting Dynamic Media - Scene7 mode
description: Troubleshooting Dynamic Media in Scene7 runmode.
seo-description: Troubleshooting Dynamic Media in Scene7 runmode.
uuid: e18754d0-c924-4f07-95ca-da429c98fd2d
contentOwner: Rick Brough
products: SG_EXPERIENCEMANAGER/6.5/ASSETS
topic-tags: dynamic-media
content-type: reference
discoiquuid: cd76e06a-7ae4-466c-a124-bd75ba0158c4
index: y
internal: n
snippet: y
---

# Troubleshooting Dynamic Media - Scene7 mode{#troubleshooting-dynamic-media-scene-mode}

The following document describes troubleshooting for Dynamic Media running **dynamicmedia_scene7** run mode.

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2018-02-21T18:16:03.398-0500
Change title to Trobulshooting DM S7 and leave content as is.
-->

<!--
Comment Type: remark
Last Modified By: Warren Yamashita (wyamashi)
Last Modified Date: 2018-08-07T20:44:25.020-0400
<p>The information in this topic came from:</p>
<p><a href="https://wiki.corp.adobe.com/pages/viewpage.action?spaceKey=scene7qa&title=DMS7+Tips+and+Tricks" target="_blank">https://wiki.corp.adobe.com/pages/viewpage.action?spaceKey=scene7qa&title=DMS7+Tips+and+Tricks</a></p>
<p> </p>
<p>See also <a href="https://jira.corp.adobe.com/browse/CQDOC-11911" target="_blank">CQDOC-11911</a></p>
-->

## Setup and Configuration {#setup-and-configuration}

Ensure that Dynamic Media has been set up properly by doing the following:

<!--
Comment Type: annotation
Last Modified By: wyamashi
Last Modified Date: 2018-08-08T17:41:51.909-0400
Message from Warren: Annotations does not adjust for horizontally scrolling text Several of the annotations I've added may be horizontally misaligned
-->

* Start up command contains the **-r dynamicmedia_scene7** runmode argument.

  <!--
  Comment Type: annotation
  Last Modified By: rbrough
  Last Modified Date: 2019-01-15T13:02:45.201-0500
  You can add that the other run mode methods (Java command sling argument or the configuration file) work, except for renaming the JAR file RB: Didn't add. Only wanted to discuss *one* method.
  -->

* Any AEM 6.4 cumulative fix packs (CFPs) have been installed first *before* any available Dynamic Media Feature Packs.
* Optional Feature Pack 18912 is installed.

  This optional feature pack is for FTP support or if you are migrating assets to Dynamic Media from Dynamic Media Classic (Scene7).

* Navigate to the Cloud Services user interface and confirm that the provisioned account appears under **Available Configurations**.
* Ensure that the** Dynamic Media Asset Activation (scene7)** replication agent is enabled.

  This replication agent is found under Agents on Author.

  <!--
  Comment Type: annotation
  Last Modified By: rbrough
  Last Modified Date: 2019-01-10T16:28:25.017-0500
  append something like: This replication agent can be found under Agents on author RB: Fixed.
  -->

## General (All Assets) {#general-all-assets}

The following are some general tips and tricks for all assets.

### Asset Synchronization Status Properties {#asset-synchronization-status-properties}

The following asset properties can be reviewed in CRXDE Lite to confirm the successful synchronization of the asset from AEM to Dynamic Media:

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:29:50.967-0500
insert between "reviewed" and "to confirm": "in CRXDE Lite " These instructions should be a bit more clear RB: Fixed.
-->

| **Property** |**Example** |**Description** |
|---|---|---|
| `<object_node>/jcr:content/metadata/dam:scene7ID` |**a|364266** |General indicator that node is linked to Dynamic Media. |
| `<object_node>/jcr:content/metadata/dam:scene7FileStatus` |**PublishComplete** or error text |Status of upload of asset to Dynamic Media. |
| `<object_node>/jcr:content/metadata/dam:scene7File`  |**myCompany/myAssetID** |Must be populated in order to generate URLs to remote asset of Dynamic Media. |
| `<object_node>/jcr:content/dam:lastSyncStatus` |**success **or **failed: <error text>** |Synchronization status of sets (spin sets, image sets, and so on), image presets, viewer presets, image map updates for an asset, or images that were edited. |

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:35:18.000-0500
The "lastSyncStatus" property will also show for images that have been edited It is probably more accurate to say for any set, not just image sets It is also used with image presets RB: Fixed.
-->

### Synchronization Logging {#synchronization-logging}

Synchronization errors and issues are logged in **error.log** (AEM server directory** /crx-quickstart/logs/**). Sufficient logging is available to determine the root cause of most issues, however you can increase the logging to DEBUG on the ***com.adobe.cq.dam.ips ***package through the Sling Console ([http://localhost:4502/system/console/slinglog](http://localhost:4502/system/console/slinglog)) to gather more information.

<!--
Comment Type: annotation
Last Modified By: wyamashi
Last Modified Date: 2018-08-07T21:10:22.552-0400
I have requested more information from the developers because "com.adobe.cq.dam.ips" is not a logger that is present by default, nor is it in any of QE's wikis
-->

### Move, Copy, Delete {#move-copy-delete}

Before performing a Move, Copy, or Delete operation, do the following:

* For images and videos, confirm that a **&lt;object_node&gt;/jcr:content/metadata/dam:scene7ID** value exists before performing move, copy, or delete operations. 
* For image and viewer presets, confirm that an `http://<server>/crx/de/index.jsp#/etc/dam/presets/viewer/testpreset/jcr%3Acontent/metadata` value exists before performing move, copy, or delete operations.
* If above metadata value is missing, you need to re-upload assets before move, copy, or delete operations.

<!--
Comment Type: annotation
Last Modified By: wyamashi
Last Modified Date: 2018-08-08T14:38:31.253-0400
This is the old location and applies if a customer has upgraded from AEM 6.x to 6.4 and opted out of migration The new locations are under: image presets - /conf/global/settings/dam/dm/presets/macros viewer presets - /conf/global/settings/dam/dm/presets/viewer
-->

### Version Control {#version-control}

When replacing an existing Dynamic Media asset (same name and location), you have the option to keep both assets or replace/create a version:

* Keeping both will create a new asset with a unique name for the published asset URL; for example,** image.jpg** is the original asset and **image1.jpg** is the newly uploaded asset.

* Creating a version is not supported in Dynamic Media - Scene7 mode delivery. The new version will replace the existing asset in delivery.

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:38:10.516-0500
insert "S7 " between "Dynamic Media " and "delivery" RB: Fixed.
-->

## Images and Sets {#images-and-sets}

If you are having issues with images and sets, see the following troubleshooting guidance.

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
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
       <li>Check whether the preset in the JCR <span class="code">/etc/dam/presets/viewer/&lt;preset&gt; has lastReplicationAction</span> defined. Note that this location applies if you upgraded from AEM 6.x to 6.4 and opted out of migration. Otherise, the location is <span class="code">/conf/global/settings/dam/dm/presets/viewer</span>.</li> 
       <li>Check to make sure that the asset in the JCR has <span class="code">dam:scene7FileStatus</span><strong> </strong>under Metadata shows as <span class="code">PublishComplete</span>.</li> 
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
   <td><p>Check that the asset contains <span class="code">dam:scene7File</span> in the Metadata properties (CRXDE Lite)</p> </td> 
   <td><p>Check that all assets have finished processing.</p> </td> 
  </tr> 
  <tr> 
   <td>Uploaded asset does not show in asset selector</td> 
   <td><p>Check asset has property <span class="code">jcr:content</span> &gt; <strong><span class="code">dam:assetState</span></strong> = <span class="code">processed</span> (CRXDE Lite)</p> </td> 
   <td><p>Check that all assets have finished processing.</p> </td> 
  </tr> 
  <tr> 
   <td>Banner on card view shows <strong>New</strong> when asset has not started processing</td> 
   <td>Check asset <span class="code">jcr:content</span> &gt; <span class="code">dam:assetState</span> = if <span class="code">unprocessed</span> it was not picked up by the workflow.</td> 
   <td>Wait until asset is picked up by workflow.</td> 
  </tr> 
  <tr> 
   <td>Images or sets do not display the viewer URL or embed code</td> 
   <td>Check if the viewer preset has been published.</td> 
   <td><p>Go to <strong>Tools</strong> &gt; <strong>Assets</strong> &gt; <strong>Viewer Presets</strong> and publish the viewer preset.</p> </td> 
  </tr> 
 </tbody> 
</table>

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:50:04.286-0500
This is the old location and should apply if the customer is upgrading from 6.x to 6.4 and opts out of migration The new location is: /conf/global/settings/dam/dm/presets/viewer RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:47:11.054-0500
It took me a while to find this. This info should be more specific. dam:scene7FileStatus under Metadata should show as PublishComplete RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:52:00.521-0500
Maybe move #3 under #1 and change to a bullet point Make it the second bullet point, since it then leads into check PublishComplete RB: Fixed
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:59:03.717-0500
consistent use of CRX/DE or crXDE RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:56:22.979-0500
Instead of "Wait until the asset finishes processing." maybe use "Check that all assets have finished processing." RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:59:46.057-0500
consistent use of CRX/DE or crXDE RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:59:28.852-0500
Instead of "Wait until the asset finishes processing." maybe use "Check that all assets have finished processing." RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T17:02:18.819-0500
consistent styling: locations in CRX/DE should be boldface like it earlier in the page also, instead of using ">" state that dam:assetState is under jcr:content RB: Not fixed. It's fine the way it is.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:41:34.065-0500
consistent styling: properties should be boldface like earlier in the page RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:46:24.585-0500
consistent styling: property values should be boldface like earlier in the page RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:54:36.991-0500
consistent styling: properties should be boldface like earlier in the page RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T16:58:04.285-0500
consistent styling: properties should be boldface like earlier in the page RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T17:01:21.096-0500
consistent styling: property values should be boldface like earlier in the page remove the quotes since it'll be boldface RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T17:07:14.855-0500
consistent styling: properties should be boldface like earlier in the page dam:assetState is under jcr:content; write that RB: Not fixed.
-->

## Video {#video}

If you are having issues with video, see the following troubleshooting guidance.

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
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
     <li>Check that the video has finished processing by confirming <span class="code">dam:scene7FileAvs</span> of <span class="code">dam:scene7File</span> in metadata.</li> 
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
     <li>Check that the runmode is <span class="kbd">dynamicmedia_scene7</span>.</li> 
     <li>Check whether Dynamic Media cloud service is configured.</li> 
     <li>Check whether a video profile is associated with the upload folder.</li> 
    </ul> </td> 
   <td> 
    <ol> 
     <li>Check your AEM instance with <span class="kbd">-r dynamicmedia_scene7</span></li> 
     <li>Check that the Dynamic Media Configuration under Cloud Services is properly setup.</li> 
     <li>Check that the folder has a video profile. Also, check the video profile.</li> 
    </ol> </td> 
  </tr> 
  <tr> 
   <td>Video processing takes too long</td> 
   <td><p>To determine if video encoding is still in progress or if it has entered a failure state:</p> 
    <ul> 
     <li>Check the video status <span class="code">https://localhost:4502/crx/de/index.jsp#/content/dam/folder/videomp4/jcr%3Acontent</span> &gt; <span class="kbd">dam:assetState</span></li> 
     <li>Monitor the video from the workflow console <span class="code">http://localhost:4502/libs/cq/workflow/content/console.html</span> &gt; Instances, Archive, Failures tabs.</li> 
    </ul> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td>Video rendition missing</td> 
   <td><p>When video is uploaded, but there are no encoded renditions:</p> 
    <ul> 
     <li>Check that the folder has a video profile assigned to it.</li> 
     <li>Check that the video has finished processing by confirming <span class="code">dam:scene7FileAvs</span> in metadata.</li> 
    </ul> </td> 
   <td> 
    <ol> 
     <li>Assign a video profile to the folder.</li> 
     <li>Wait for video to finish processing.<br /> </li> 
    </ol> </td> 
  </tr> 
 </tbody> 
</table>

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T17:10:14.193-0500
Before re-uploading a video, the user should make sure that the Dynamic Media Encode Video workflow is not still running. RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T17:11:22.404-0500
Instead of saying "Start" say something like "Check" and update rest of sentence to work with "Check" RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T17:13:05.209-0500
Instead of "Configure Dynamic Media cloud service." say something like "Check the Dynamic Media Configuration under Cloud Services is properly setup." RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-10T17:15:02.815-0500
Instead of current text, something more like, "Check the folder has the a video profile. Also, check the video profile." RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:18:00.787-0500
Since this is not a real link, remove the link so it does not try to launch this URL RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:25:58.373-0500
Since this is not a real link, remove the link so it does not try to launch this URL RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:25:44.180-0500
consistent styling: properties should be boldface like earlier in the page remove quotes if it's changed to boldface RB: Fixed
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:26:44.867-0500
Should these have numbers to coincide with the Solution column? RB: Not fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:27:57.522-0500
There is also checking the dam:assetState under jcr:content RB: No idea which row this annotation is referring to.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:27:24.449-0500
consistent styling: nodes should be boldface like earlier in the page RB: Fixed.
-->

## Viewers {#viewers}

If you are having issues with viewers, see the following troubleshooting guidance.

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>Issue</strong></td> 
   <td><strong>How to debug</strong></td> 
   <td><strong>Solution</strong></td> 
  </tr> 
  <tr> 
   <td>Viewer Presets are not published</td> 
   <td><p>Proceed to sample manager diagnostic page: <span class="code">http://localhost:4502/libs/dam/gui/content/s7dam/samplemanager/samplemanager.html</span></p> <p>Observe computed values. When operating correctly you should see:</p> <p><code class="code">_DMSAMPLE status: 0 unsyced assets - activation not necessary
       _OOTB status: 0 unsyced assets - 0 unactivated assets</code></p> <p><strong>Note</strong>: It can take about 10 minutes after configuration of Dynamic Media cloud settings for the viewer assets to sync.</p> <p>If unactivated assets remain, click either of the <strong>List all Unactivated Assets</strong> buttons to see details.</p> </td> 
   <td> 
    <ol> 
     <li>Navigate to viewer preset list in admin tools: <span class="code">http://localhost:4502/libs/dam/gui/content/s7dam/samplemanager/samplemanager.html</span></li> 
     <li>Select all viewer presets, then click <strong>Publish</strong>.</li> 
     <li>Navigate back to sample manager and observe that unactivated asset count is now zero.</li> 
    </ol> </td> 
  </tr> 
  <tr> 
   <td>Viewer Preset artwork returns 404 from preview in asset details or copy URL/embed code</td> 
   <td><p>In CRXDE Lite do the following:</p> 
    <ol> 
     <li>Navigate to <span class="code">&lt;sync-folder&gt;/_CSS/_OOTB</span> folder within your Dynamic Media sync folder (for example, <span class="code">/content/dam/_CSS/_OOTB</span>),</li> 
     <li>Find the metadata node of the problematic asset (for example, <span class="code">&lt;sync-folder&gt;/_CSS/_OOTB/CarouselDotsLeftButton_dark_sprite.png/jcr:content/metadata/</span>).</li> 
     <li>Check for the presence of <span class="code">dam:scene7*</span> properties. If the asset was successfully synced and published you see the <span class="code">dam:scene7FileStatus</span> set is to <strong>PublishComplete</strong>.</li> 
     <li>Attempt to request the artwork directly from Dynamic Media by concatenating the values of the following properties and string literals 
      <ul> 
       <li><span class="code">dam:scene7Domain</span></li> 
       <li><span class="code">"is/content"</span></li> 
       <li><span class="code">dam:scene7Folder</span></li> 
       <li><span class="code">&lt;asset-name&gt;</span></li> 
       <li>Example: <span class="code">http://&lt;server&gt;/is/content/myfolder/_CSS/_OOTB/CarouselDotsLeftButton_dark_sprite.png</span></li> 
      </ul> </li> 
    </ol> </td> 
   <td><p>If the sample assets or viewer preset artwork have not synced or published then restart the entire copy/sync process:</p> 
    <ol> 
     <li>Navigate to CRXDE Lite. 
      <ul> 
       <li>Delete <span class="code">&lt;sync-folder&gt;/_CSS/_OOTB</span>.</li> 
      </ul> </li> 
     <li>Navigate to the CRX package manager: <span class="code">http://localhost:4502/crx/packmgr/</span><a href="http://localhost:4502/crx/packmgr/"></a> 
      <ol> 
       <li>Search for viewer package in list (it starts with <span class="kbd">cq-dam-scene7-viewers-content</span>)</li> 
       <li>Click <strong>Reinstall</strong>.</li> 
      </ol> </li> 
     <li>Under Cloud Services, navigate to the Dynamic Media Configuration page, then open the configuration dialog box for your Dynamic Media - S7 configuration. 
      <ul> 
       <li>Make no changes, click <strong>Save</strong>. This triggers the logic again to create and sync the sample assets, viewer preset CSS, and artwork.<br /> <br /> </li> 
      </ul> </li> 
    </ol> </td> 
  </tr> 
 </tbody> 
</table>

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:38:53.839-0500
Since this is not a real link, remove the link so it does not try to launch this URL RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:28:28.934-0500
This table needs to be adjusted so the user does not have to use a horizontal scroll bar. RB: Not fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:39:06.711-0500
Since this is not a real link, remove the link so it does not try to launch this URL RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:30:09.333-0500
Since this is not a real link, remove the link so it does not try to launch this URL RB: What is this annotation referencing?
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:39:49.707-0500
remove the * (or asterisk) and spell it out e.g. Check for the presence of all properties that start with dam:scene7 consistent styling: properties should be boldface like earlier in the page RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:40:11.390-0500
consistent styling: properties should be boldface like earlier in the page RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T13:39:28.582-0500
Since this is not a real link, remove the link so it does not try to launch this URL RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T14:45:29.381-0500
Dynamic Media Configuration under Cloud Services RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T14:40:00.489-0500
change "click edit to open the configuration dialog" to "open the configuration" RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T14:41:50.925-0500
change "cloud" to "S7" RB: Fixed.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T14:46:28.565-0500
Add bullet points before this one: * Enter in the password * Click Connect to Dynamic media RB: No idea what this annotation is referring to.
-->

<!--
Comment Type: annotation
Last Modified By: rbrough
Last Modified Date: 2019-01-15T14:40:17.827-0500
change "OK" to "Save" RB: Fixed.
-->

