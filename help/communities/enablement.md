---
title: Configuring Enablement Features
seo-title: Configuring Enablement Features
description: Configure enablement features in Communities
seo-description: Configure enablement features in Communities
uuid: 27be3128-1a7d-412e-99a9-6e3b3b0aec1c
contentOwner: Janice Kendall
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: administering
content-type: reference
discoiquuid: 765a3d9b-4552-403e-872c-fdf684ac271d
role: Admin
exl-id: b635e2ed-4637-4b2f-a746-ec8dc7541bab
---
# Configuring Enablement Features {#configuring-enablement-features}

## Overview {#overview}

The enablement features provide the ability to create [enablement communities](overview.md#enablement-community).

* This feature requires additional licensing for use in a production environment.

Use of the enablement features requires the following:

Installation of:

* **SCORM**
  
  Sharable Content Object Reference Model (SCORM) is a collection of standards and specifications for e-learning. SCORM also defines how content may be packaged into a transferable ZIP file.

* **MySQL**
  
  MySQL is a relational database primarily used for SCORM tracking and reporting data for Enablement, as well as tables for tracking video progress. The SCORM for enablement feature pack requires the MySQL JDBC driver.

* **FFmpeg**
  
  FFmpeg is a solution for converting and streaming audio and video and, when installed, is used for proper transcoding of [Video Assets](../../help/sites-authoring/default-components-foundation.md#video). For enablement communities, it is used in the author environment to obtain metadata for uploaded resources as well as generate a thumbnail to display when listing the resource.

Setup of:

* **Community Managers**
  
  For enablement communities, only members of the `Community Enablement Managers` user group may be assigned the role of `Community Site Enablement Manager`, whose permissions may include content creation, assignments, and member management in the publish environment.

Optional configuration of:

* **Adobe Analytics**
  
  Integration with Adobe Analytics adds comprehensive reporting features and supports the Video Heartbeat addtion to Analytics.

* **Dispatcher**

## Configuration Steps {#configuration-steps}

Following are the steps necessary for enablement communities.

Each step links to documentation which provides the necessary details.

**On all author/publish instances:**

1. **[Install JDBC driver for MySQL](deploy-communities.md#jdbc-driver-for-mysql)**

   Use Web Console (bundles): *http://localhost:4502/system/console/bundles*

   Install *before* installing SCORM package

1. **[Install SCORM package](deploy-communities.md#scorm-package)**


   Use Package Manager: *http://localhost:4502/crx/packmgr/*

**On any server:**

1. **[Install MySQL, MySQL Workbench](mysql.md)**

1. **[Install MySQL databases](mysql.md#database-setup)**

   Execute SQL scripts downloaded from author instance

   Use MySQL Workbench

**On same server hosting author instance:**

1. **[Install FFmpeg](ffmpeg.md)**

**On all author/publish instances:**

1. **[Configure JDBC Connections pool](mysql.md#configure-jdbc-connections)**

   Use Web Console (configMgr): *http://localhost:4502/system/console/configMgr*

1. **[Configure SCORM engine service](mysql.md#aem-communities-scormengine-service)**

   Use Web Console (configMgr): *http://localhost:4502/system/console/configMgr*

1. **[Configure CSRF filters](mysql.md#adobe-granite-csrf-filter)**

   Use Web Console (configMgr): *http://localhost:4502/system/console/configMgr*

**On author instance:**

1. (*Optional*) **[Configure Analytics service](analytics.md)**

   Use Tools, Deployment, Cloud Services console: *http://localhost:4502/etc/cloudservices/sitecatalyst.html*

1. **[Configure FFmpeg](ffmpeg.md#configure-ffmpeg-transcoding-service)**

   Use Workflow/Models console

1. **[Enable Tunnel Service](deploy-communities.md#tunnel-service-on-author)**

   Use Web Console (configMgr): *http://localhost:4502/system/console/configMgr*

1. **[Create Community administrators](users.md#creating-community-members)** 

   For author environment use classic-UI Security console: *http://localhost:4502/useradmin*
 
   Create user(s) with path = /home/users/community

   * Add members(s) to the following groups:

     * Community Enablement Managers
     * Communities Administrators

## Dispatcher {#dispatcher}

When the deployment includes [AEM's Dispatcher](https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher.html), in order for the enablement features to work properly, the `clientheader` and `filter` sections need modification. See [Configuring Dispatcher for Communities](dispatcher.md#enablement).
