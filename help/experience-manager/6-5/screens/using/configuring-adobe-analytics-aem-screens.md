---
title: Configuring Adobe Analytics with AEM Screens
seo-title: Configuring Adobe Analytics with AEM Screens
description: Follow this section to learn more about sequencing and sending custom events using Offline Adobe Analytics 
seo-description: Follow this section to learn more about sequencing and sending custom events using Offline Adobe Analytics 
uuid: 199e4150-fedb-43d5-8442-e4a2aaf3250c
contentOwner: jsyal
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/SCREENS
topic-tags: developing
discoiquuid: b6ba295f-88e7-4a98-a54a-62d604224a1f
index: y
internal: n
snippet: y
---

# Configuring Adobe Analytics with AEM Screens{#configuring-adobe-analytics-with-aem-screens}

>[!CAUTION]
>
>This AEM Screens functionality is only available, if you have installed AEM 6.4.2 Feature Pack 2 and AEM 6.3.3 Feature Pack 4.  

>
>To get access to either of these Feature Packs, you must contact Adobe Support and request access. Once you have permissions you can download it from Package Share.

This section covers the following topics:

* **Sequencing in Adobe Analytics with AEM Screens**
* **Sending Custom Events Using Offline Adobe Analytics**

## Sequencing in Adobe Analytics with AEM Screens {#sequencing-in-adobe-analytics-with-aem-screens}

The ***sequencing process*** starts with data storage service that activates Adobe Analytics service. Channel content sends Adobe Analytics events with payroll, that is, data test capture to Windows I/O and stay events are triggered. The events are saved to index DB and is further put into object store. Based on the schedule, the administrator sets, it cuts the data from object store, and further transfers it in chunk store. It tries to send maximum amount of data, when connected.

### Sequencing Diagram {#sequencing-diagram}

The following sequencing diagram explains the Adobe Analytics Integration with AEM Screens:

![](assets/analytics_chunking.png)

## Sending Custom Events Using Offline Adobe Analytics {#sending-custom-events-using-offline-adobe-analytics}

The following table summarizes the standard data model for events. It lists all the fields sent to Adobe Analytics:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody>
  <tr>
   <td><strong>Section</strong></td> 
   <td><strong>Property Label</strong></td> 
   <td><strong>Property Name/Key</strong></td> 
   <td><strong>Required</strong></td> 
   <td><strong>Data Type</strong></td> 
   <td><strong>Property Type</strong><br /> </td> 
   <td><strong>Description</strong></td> 
  </tr>
  <tr>
   <td><strong><em>Core/Event</em></strong></td> 
   <td>Event GUID</td> 
   <td>event.guid</td> 
   <td>recommended</td> 
   <td>string</td> 
   <td>UUID</td> 
   <td>Unique ID that identifies instance of an event</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Date time of collection of event</td> 
   <td>event.coll_dts</td> 
   <td>optional</td> 
   <td>string</td> 
   <td>timestamp - UTC</td> 
   <td>Collection date time</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Date time of event (start)</td> 
   <td>event.dts_start</td> 
   <td>recommended</td> 
   <td>string</td> 
   <td>timestamp - UTC</td> 
   <td>Event start date time, if you do NOT specify this, the event time will be assumed as the time it was received by the server</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Date time of event (end)</td> 
   <td>event.dts_end</td> 
   <td>optional</td> 
   <td>string</td> 
   <td>timestamp - UTC</td> 
   <td>Event completion date time</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Workflow</td> 
   <td>event.workflow</td> 
   <td>recommended</td> 
   <td>string</td> 
   <td> </td> 
   <td>Workflow name (Screens)</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Main DMe Category</td> 
   <td>event.category</td> 
   <td>required</td> 
   <td>string</td> 
   <td> </td> 
   <td>Main Category (DESKTOP, MOBILE, WEB, PROCESS, SDK, SERVICE, ECOSYSTEM) - Grouping of event types - <strong>We send Player</strong></td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Sub Category</td> 
   <td>event.subcategory</td> 
   <td>recommended</td> 
   <td>string</td> 
   <td> </td> 
   <td>Sub Category- Section of a workflow or Area of a screen etc. (Recent Files, CC Files, Mobile creations, and so on.)</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Event/Action type</td> 
   <td>event.type</td> 
   <td>required</td> 
   <td>string</td> 
   <td> </td> 
   <td>Event Type (render, click, pinch, zoom) - Primary user action</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Subtype</td> 
   <td>event.subtype</td> 
   <td>recommended</td> 
   <td>string</td> 
   <td> </td> 
   <td>Event Sub Type (create, update, delete, publish etc.) - Additional details of the user action</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Offline</td> 
   <td>event.offline</td> 
   <td>optional</td> 
   <td>boolean</td> 
   <td> </td> 
   <td>Event was generated while action was offline/online (true/false)</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>User Agent</td> 
   <td>event.user_agent</td> 
   <td>recommended (web properties)</td> 
   <td>string</td> 
   <td> </td> 
   <td>User agent</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Language/Locale</td> 
   <td>event.language</td> 
   <td>recommended</td> 
   <td>string</td> 
   <td> </td> 
   <td>User locale is a string based on the language-tagging conventions of RFC 3066 (for example, en-US, fr-FR, or es-ES)</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Device GUID</td> 
   <td>event.device_guid</td> 
   <td>optional</td> 
   <td>string<br /> </td> 
   <td>UUID</td> 
   <td>Identifies the Device GUID (e.g. machine ID or hash of IP address + subnet mask + network ID + useragent) - Here we will send the username of the player generated at registration time.</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Count</td> 
   <td>event.count</td> 
   <td>optional</td> 
   <td>number</td> 
   <td> </td> 
   <td>Number of times the event has occured - Here we send the video duration</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Value</td> 
   <td>event.value</td> 
   <td>optional</td> 
   <td>string</td> 
   <td> </td> 
   <td>Value of the event (e.g. settings on/off)</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Pagename</td> 
   <td>event.pagename</td> 
   <td>required for AA</td> 
   <td>string</td> 
   <td> </td> 
   <td>Adobe Analytics support for Custom Page Name</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>URL</td> 
   <td>event.url</td> 
   <td>optional</td> 
   <td>string</td> 
   <td> </td> 
   <td>URL of the web property or mobile schema - must inclued fully qualified URL</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Error Code</td> 
   <td>event.error_code</td> 
   <td> </td> 
   <td>string</td> 
   <td> </td> 
   <td>Failure Code</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Error Type</td> 
   <td>event.error_type</td> 
   <td> </td> 
   <td>string</td> 
   <td> </td> 
   <td>Failure Type</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Error Description</td> 
   <td>event.error_description</td> 
   <td> </td> 
   <td>string</td> 
   <td> </td> 
   <td>Failure Description<br /> </td> 
  </tr>
  <tr>
   <td><strong><em>Source/Originating product</em></strong></td> 
   <td>Name</td> 
   <td>source.name</td> 
   <td>required</td> 
   <td>string</td> 
   <td> </td> 
   <td>App name (AEM Screens)</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Version</td> 
   <td>source.version</td> 
   <td>required</td> 
   <td>string</td> 
   <td> </td> 
   <td>Firmware version</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Platform</td> 
   <td>source.platform</td> 
   <td>required</td> 
   <td>string</td> 
   <td> </td> 
   <td>navigator.platform</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Device</td> 
   <td>source.device</td> 
   <td>required w/execeptions</td> 
   <td>string</td> 
   <td> </td> 
   <td>Player Name</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>OS version</td> 
   <td>source.os_version</td> 
   <td>required w/execeptions</td> 
   <td>string</td> 
   <td> </td> 
   <td>O/S version</td> 
  </tr>
  <tr>
   <td><strong><em>Content</em></strong></td> 
   <td>Action</td> 
   <td>content.action</td> 
   <td>required</td> 
   <td>string</td> 
   <td> </td> 
   <td>The URL to the asset including the rendition that was actually played</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Mime Type</td> 
   <td>content.mimetype</td> 
   <td>optional</td> 
   <td>string</td> 
   <td> </td> 
   <td>Mime type of the content</td> 
  </tr>
  <tr>
   <td><strong><em>Transaction</em></strong></td> 
   <td>Transaction number</td> 
   <td>trn.number</td> 
   <td>required</td> 
   <td>string</td> 
   <td>UUID</td> 
   <td>Unique ID that preferably adheres to UUID v4</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Product Description</td> 
   <td>trn.product</td> 
   <td>required</td> 
   <td>string</td> 
   <td> </td> 
   <td>The URL to the asset (excluding rendition)</td> 
  </tr>
  <tr>
   <td> </td> 
   <td>Quantity</td> 
   <td>trn.quantity</td> 
   <td>required</td> 
   <td>string</td> 
   <td> </td> 
   <td>The duration of playback</td> 
  </tr>
 </tbody>
</table>

