---
title: Troubleshooting AEM
seo-title: Troubleshooting AEM
description: Learn about troubleshooting issues with AEM.
seo-description: Learn about troubleshooting issues with AEM.
uuid: cca863e3-20df-4df4-9b5b-b916159fd1b8
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
discoiquuid: c7cd8412-a6c8-489d-ae4a-71a234d5ebb7
index: y
internal: n
snippet: y
---

# Troubleshooting AEM{#troubleshooting-aem}

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-17AF698443500C5F992016B8@AdobeID)
Last Modified Date: 2017-11-30T05:02:35.020-0500
<p> A troubleshooting section in Developing would also make a lot of sense. Would need content for this.</p>
-->

The following section covers some issues that you may encounter when using AEM, together with suggestions on how to troubleshoot them.

>[!NOTE]
>
>If you are troubleshooting authoring issues in AEM, see [Troubleshooting for Authors.](/6-5/sites/authoring/using/troubleshooting.md)

>[!NOTE]
>
>When experiencing problems it is also worthwhile checking the list of [Known Issues](../../../../6-5/release-notes/known-issues.md) for your instance (release and service packs).

## Troubleshooting scenarios for Administrators {#troubleshooting-scenarios-for-administrators}

The following table provides an overview of problems administrators may need to troubleshoot:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>Role(s)</strong></td> 
   <td><strong>Problem </strong></td> 
  </tr> 
  <tr> 
   <td>System Administrator</td> 
   <td><p>Double-clicking the Quickstart jar does not have any effect or opens the jar file with another program (for example, archive manager)</p> </td> 
  </tr> 
  <tr> 
   <td><p>System Administrator</p> </td> 
   <td><p>My application running on CRX throws out-of-memory errors</p> </td> 
  </tr> 
  <tr> 
   <td><p>System Administrator</p> </td> 
   <td><p>The AEM Welcome screen does not display in the browser after double-clicking AEM CM Quickstart</p> </td> 
  </tr> 
  <tr> 
   <td><p>System Administrator</p> <p>admin user</p> </td> 
   <td><p>Making a Thread Dump</p> </td> 
  </tr> 
  <tr> 
   <td><p>System Administrator</p> <p>admin user</p> </td> 
   <td><p>Checking for unclosed JCR sessions</p> </td> 
  </tr> 
 </tbody> 
</table>

## Installation Issues {#installation-issues}

See [Common Installation Issues](/content/docs/en/aem/6-3/deploy/installing.md#par_title_18) for information about the following troubleshooting scenarios:

* Double-clicking the Quickstart jar has no effect or the JAR file with another program (such as archive manager).
* Applications running on CRX throw out-of-memory errors.
* The AEM Welcome screen does not display in the browser after double-clicking AEM Quickstart.

## Methods for Troubleshooting Analysis {#methods-for-troubleshooting-analysis}

### Making a Thread Dump {#making-a-thread-dump}

The thread dump is a list of all the Java threads that are currently active. If AEM does not respond properly, the thread dump can help you identify deadlocks or other problems.

### Using Sling Thread Dumper {#using-sling-thread-dumper}

1. Open the **AEM Web Console**; for example at `http://localhost:4502/system/console/`.

1. Select the **Threads **under** Status** tab.

![](assets/screen_shot_2012-02-13at43925pm.png) 

<!--
Comment Type: draft

<h3>Using javadump</h3>
-->

<!--
Comment Type: draft

<ol>
<li>Find the PID (process id) of your Java instance.</li>
<li>Run:<br /> <span class="code">javadump.exe &lt;pid&gt;</span></li>
</ol>
-->

<!--
Comment Type: draft

<p>See the <a href="/content/docs/en/aem/6-3/develop/javadump_exe.md">thread dump tool documentation</a> for more information</p>
-->

### Using jstack (command line) {#using-jstack-command-line}

1. Find the PID (process id) of the AEM Java instance.  
   For example, you can use `ps -ef` or `jps`.

1. Run:  
   `jstack <pid>`

1. This will show the thread dump.

>[!NOTE]
>
>You can append the thread dumps to a log file by using the `>>` output redirection:
>
>`jstack <pid> >> /path/to/logfile.log`

See the [How to take Thread Dumps from a JVM](http://helpx.adobe.com/cq/kb/TakeThreadDump.html) documentation for more information

### Checking for unclosed JCR sessions {#checking-for-unclosed-jcr-sessions}

When functionality is developed for AEM WCM, JCR Sessions may be opened (comparable to opening a database connection). If the opened sessions are never closed, your system may experience following symptoms:

* The system becomes slower.
* You can see a lot of CacheManager: resizeAll entries in the log file; the following number (size=&lt;x&gt;) shows the number of caches, each sessions opens several caches.
* From time to time the system runs out of memory (after a few hours, days, or weeks - depending on the severity).

To analyze unclosed sessions and find out which code is not closing a session, refer to the Knowledge Base article [Analyze Unclosed Sessions](http://helpx.adobe.com/crx/kb/AnalyzeUnclosedSessions.html).

### Using the Adobe Experience Manager Web Console {#using-the-adobe-experience-manager-web-console}

The status of the OSGi bundles can also give an early indication of possible issues.

1. Open the **AEM Web Console**; for example at `http://localhost:4502/system/console/`.

1. Select **Bundles** under **OSGI** tab.

1. Check:

    * the Status of the bundles. If any are Inactive or Unsatisfied, then try to stop and restart the bundle. If the issue persists then you may need to investigate further using other methods.
    * whether any of the bundles have missing dependencies. Such details can be seen by clicking on the individual bundle Name, which is a link (the following example does not have any issues):

![](assets/screen_shot_2012-02-13at44706pm.png)

