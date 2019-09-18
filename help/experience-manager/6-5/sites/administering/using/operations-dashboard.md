---
title: Operations Dashboard
seo-title: Operations Dashboard
description: Learn how to use the Operations Dashboard.
seo-description: Learn how to use the Operations Dashboard.
uuid: 1516eb6e-e30c-4198-bf31-e3ff5a8bb257
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
discoiquuid: 59c5aab3-ef83-4cdd-b20b-89b6627ef613
index: y
internal: n
snippet: y
---

# Operations Dashboard{#operations-dashboard}

## Introduction {#introduction}

The Operations Dashboard in AEM 6 helps system operators to monitor AEM system health at a glance. It also provides auto-generated diagnosis informations on relevant aspects of AEM and allows to configure and run self-contained maintenance automation to reduce project operations and support cases significantly. The Operations Dashboard can be extended with custom health checks and maintenance tasks. Further, Operations Dashboard data can be accessed from external monitoring tools via JMX.

**The Operations Dashboard:**

* Is a one-click system status to help operations departments gain efficiency
* Provides system health overview in a single, centralized place

* Reduces time to find, analyze and fix issues
* Provides self-contained maintenance automation that helps reduce project operations costs significantly

It can be accessed by going to **Tools **- **Operations ** from the AEM Welcome screen.

>[!NOTE]
>
>In order to be able to access the Operations Dashboard, the logged in user must be part of the "Operators" user group. For more info, see documentation on [User, Group and Access Right Administration](../../../../6-5/sites/administering/using/user-group-ac-admin.md).

## Health Reports {#health-reports}

The Health Report system provides information on the health of an AEM instance through Sling Health Checks. This can be done via either OSGI, JMX, HTTP requests (via JSON) or through the Touch UI. It offers measurements and threshold of certain configurable counters and in some cases, will offer information on how to resolve the issue.

It has several features, described below.

## Health Checks {#health-checks}

The **Health Reports** are a system of cards indicating good or bad health with regard to a specific product area. These cards are visualizations of the Sling Health Checks, which aggregate data from JMX and other sources and expose processed information again as MBeans. These MBeans can also be inspected in the [JMX web console](../../../../6-5/sites/administering/using/jmx-console.md), under the **org.apache.sling.healthcheck** domain.

The Health Reports interface can be accessed through the **Tools** - **Operations** - **Health Reports** menu on the AEM Welcome screen, or directly through the following URL:

`http://<serveraddress>:port/libs/granite/operations/content/healthreports/healthreportlist.html`

![](assets/chlimage_1-96.png)

The card system exposes three possible states: **OK**, **WARN **and **CRITICAL**. The states are a result of rules and thresholds, which can be configured by hovering the mouse over the card and then clicking the gear icon in the action bar:

![](assets/chlimage_1-97.png) 

### Health Check Types {#health-check-types}

There are two types of health checks in AEM 6:

1. Individual Health Checks
1. Composite Health Checks

An **Individual Health Check** is a single health check that corresponds to a status card. Individual Health Checks can be configured with rules or thresholds and they can provide one or more hints and links to solve identified health issues. Let's take the "Log Errors" check as an example: if there are ERROR entries in the instance logs, you will find them on the details page of the health check. At the top of the page you will see a link to the "Log Message" analyzer in the Diagnosis Tools section, which will enable you to analyze these errors in more detail and reconfigure the loggers.

A **Composite Health Check** is a check that aggregates information from several individual checks.

Composite health checks are configured with the aid of **filter tags**. In essence, all single checks that have the same filter tag will be grouped as a composite health check. A Composite Health Check will have an OK status only if all the single checks it aggregates have OK statuses as well.

### How to create Health Checks {#how-to-create-health-checks}

In the Operations Dashboard you can visualize the result of both individual and composite Health Checks**.**

### Creating an individual Health Check {#creating-an-individual-health-check}

Creating an individual Health Check involves two steps: implementing a Sling Health Check and adding an entry for the Health Check in the Dashboard's configuration nodes.

1. In order to create a Sling Health Check, you need to create an OSGI component implementing the Sling HealthCheck interface. You will add this component inside a bundle. The properties of the component will fully identify the Health Check. Once the component is installed, a JMX MBean will automatically be created for the Health Check. See the [Sling Health Check Documentation](https://sling.apache.org/documentation/bundles/sling-health-check-tool.html) for more information.  
  
   Example of a Sling Health Check component, written with OSGI service component annotations:

   ```java
   @Component(service = HealthCheck.class,         
   property = {             
       HealthCheck.NAME + "=Example Check",             
       HealthCheck.TAGS + "=example",             
       HealthCheck.TAGS + "=test",             
       HealthCheck.MBEAN_NAME + "=exampleHealthCheckMBean"         
   })
    public class ExampleHealthCheck implements HealthCheck { 
       @Override     
       public Result execute() {     
           // health check code     
       }
    }
   
   ```

   >[!NOTE]
   >
   >The `MBEAN_NAME` property defines the name of the mbean that will be generated for this health check.

1. After creating a Health Check, a new configuration node needs to be created, in order to make it accessible in the Operations Dashboard interface. For this step, it is necessary to know the JMX Mbean name of the Health Check (the `MBEAN_NAME` property). To create a configuration for the Health Check, open CRXDE and add a new node (of type **nt:unstructured**) under the following path: `/apps/settings/granite/operations/hc`

   The following properties should be set on the new node:

    * **Name:** `sling:resourceType`** **

        * **Type:** `String`
        
        * **Value:** `granite/operations/components/mbean`

    * **Name:** `resource`

        * **Type:** `String`
        
        * **Value:** `/system/sling/monitoring/mbeans/org/apache/sling/healthcheck/HealthCheck/exampleHealthCheck`  
          ``

   >[!NOTE]
   >
   >The resource path above is created as follows: if the mbean name of your Health Check is "test", add "test" to the end of the path `/system/sling/monitoring/mbeans/org/apache/sling/healthcheck/HealthCheck`
   >
   >
   >So the final path will be:
   >
   >
   >`/system/sling/monitoring/mbeans/org/apache/sling/healthcheck/HealthCheck/test`

   >[!NOTE]
   >
   >Make sure that the `/apps/settings/granite/operations/hc` path has the following properties set to true:  

   >
   >
   >`sling:configCollectionInherit`
   >
   >
   >`sling:configPropertyInherit`  

   >
   >
   >This will tell the configuration manager to merge the new configurations with the existing ones from `/libs`.

### Creating a Composite Health Check {#creating-a-composite-health-check}

A Composite Health Check's role is to aggregate a number of individual Health Checks sharing a set of common features. For instance, the Security Composite Health Check groups together all the individual health checks performing security-related verifications. The first step in order to create a composite check is to add a new OSGI configuration. For it to be displayed in the Operations Dashboard, a new configuration node needs to be added, the same way we did for a simple check.

1. Go to the Web Configuration Manager in the OSGI Console. You can do this by accessing `http://serveraddress:port/system/console/configMgr`

1. Search for the entry called **Apache Sling Composite Health Check**. After you find it, notice that there are two configurations already available: one for the System Checks and another one for the Security Checks.
1. Create a new configuration by pressing the "+" button on the right hand side of the configuration. A new window will appear, as shown below:

   ![](assets/chlimage_1-21.jpeg)

1. Create a configuration and save it. A Mbean will be created with the new configuration.

   The purpose of each configuration property is as follows:

    * **Name (hc.name):** The name of the Composite Health Check. A meaningful name is recommended.
    * **Tags (hc.tags):** The tags for this Health Check. If this composite health check is intended to be a part of another composite health check (such as in a hierarchy of health checks), add the tags this composite is related to.
    * **MBean Name (hc.mbean.name):** The name of the Mbean that will be given to the JMX MBean of this composite health check.
    * **Filter Tags (filter.tags):** This is a property specific to composite health checks. These are the tags which the composite should aggregate. The composite health check will aggregate under its group all the health checks that have any tag matching any of the filter tags of this composite. For example, a composite health check having the filter tags **test** and **check** will aggregate all the individual and composite health checks that have any of the **test** and **check** tags in their tags property ( `hc.tags`).

   >[!NOTE]
   >
   >A new JMX Mbean is created for each new configuration of the Apache Sling Composite Health Check.**

1. Finally, the entry of the composite health check that has just been created needs to be added in the Operations Dashboard configuration nodes. The procedure for this is the same as with individual health checks: a node of type **nt:unstructured **needs to be created under `/apps/settings/granite/operations/hc`. The resource property of the node will be defined by the value of **hc.mean.name** in the OSGI configuration.

   If, for example, you created a configuration and set the **hc.mbean.name** value to **diskusage**, the configuration nodes will look like this:

    * **Name:** `Composite Health Check`

        * **Type:** `nt:unstructured`

   With the following properties:

    * **Name:** `sling:resourceType`** **

        * **Type:** `String`
        
        * **Value:** `granite/operations/components/mbean`

    * **Name:** `resource`

        * **Type:** `String`
        
        * **Value:** `/system/sling/monitoring/mbeans/org/apache/sling/healthcheck/HealthCheck/diskusage`

   >[!NOTE]
   >
   >If you create individual health checks that logically belong under a composite check that is already present in the Dashboard by default, they will be automatically captured and grouped under the respective composite check. Because of this, there is no need to create a new configuration node for these checks.
   >
   >
   >For example, if you create an individual security health check, all you need to do is assign it the "**security**" tag, and it is installed, it will automatically appear under the Security Checks composite check in the Operations Dashboard.  

   >
   >

### Health Checks Provided with AEM {#health-checks-provided-with-aem}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>zHealthcheck Name</strong></td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>Query Performance</td> 
   <td><p>This health check was simplified <strong>in AEM 6.4</strong>, and now checks the recently-refactored <span class="code">Oak QueryStats</span> MBean, more specifically the <span class="code">SlowQueries </span>attribute. If the statistics contain any slow queries, then the health check returns a warning. Otherwise, it returns the OK status.<br /> </p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DqueriesStatus%2Ctype%3DHealthCheck">org.apache.sling.healthcheck:name=queriesStatus,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Oservation Queue Lenght</td> 
   <td><p>Observation Queue Length iterates over all Event Listeners and Background Observers, compares their <span class="code">queueSize </span>to their <span class="code">maxQueueSize</span> and:</p> 
    <ul> 
     <li>returns Critical status if the <span class="code">queueSize</span> value exceeds the <span class="code">maxQueueSize</span> value (that is when events would be dropped)</li> 
     <li>returns Warn if the <span class="code">queueSize</span> value is over the <span class="code">maxQueueSize * WARN_THRESHOLD</span> (the default value is 0.75) </li> 
    </ul> <p>The maximum length of each queue comes from separate configurations (Oak and AEM), and is not configurable from this health check. The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DObservationQueueLengthHealthCheck%2Ctype%3DHealthCheck">org.apache.sling.healthcheck:name=ObservationQueueLengthHealthCheck,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Query Traversal Limits</td> 
   <td><p>Query Traversal Limits checks the <span class="code">QueryEngineSettings</span> MBean, more specifically the <span class="code">LimitInMemory</span> and <span class="code">LimitReads</span> attributes, and returns the following status:</p> 
    <ul> 
     <li>returns the Warn status if one of the limits is equal or higher than the <span class="code">Integer.MAX_VALUE</span></li> 
     <li>returns the Warn status if one of the limits is lower than 10000 (the recommended setting from Oak)</li> 
     <li>returns the Critical status if the <span class="code">QueryEngineSettings</span> or any of the limits cannot be retrieved</li> 
    </ul> <p>The Mbean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DqueryTraversalLimitsBundle%2Ctype%3DHealthCheck">org.apache.sling.healthcheck:name=queryTraversalLimitsBundle,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Synchronized Clocks</td> 
   <td><p>This check is relevant only for <a href="https://github.com/apache/sling-old-svn-mirror/blob/4df9ab2d6592422889c71fa13afd453a10a5a626/bundles/extensions/discovery/oak/src/main/java/org/apache/sling/discovery/oak/SynchronizedClocksHealthCheck.java">document nodestore clusters</a>. It returns the following status:</p> 
    <ul> 
     <li>returns the Warn status when the instance clocks get out of sync and go over a predefined low threshold</li> 
     <li>returns the Critical status when the instance clocks get out of sync and go over a predefined high threshold</li> 
    </ul> <p>The Mbean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DslingDiscoveryOakSynchronizedClocks%2Ctype%3DHealthCheck">org.apache.sling.healthcheck:name=slingDiscoveryOakSynchronizedClocks,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Asynchronous Indexes</td> 
   <td><p>The Asynchronous Indexes check:</p> 
    <ul> 
     <li>returns Critical status if at least one indexing lane is failing</li> 
     <li>checks the <span class="code">lastIndexedTime</span> for all indexing lanes and: 
      <ul> 
       <li>returns Critical status if it's more than 2 hours ago </li> 
       <li>returns Warning status if it's between 2 hours and 45 minutes ago </li> 
       <li>returns OK status if it's less than 45 minutes ago </li> 
      </ul> </li> 
     <li>if none of these conditions are met, it returns the OK status</li> 
    </ul> <p>Both the Critical and Warn status thresholds are configurable. The Mbean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DasyncIndexHealthCheck%2Ctype%3DHealthCheck">org.apache.sling.healthcheck:name=asyncIndexHealthCheck,type=HealthCheck</a>.</p> <p><strong>Note: </strong>This health check is available with AEM 6.4 and has been backported to AEM 6.3.0.1.</p> </td> 
  </tr> 
  <tr> 
   <td>Large Lucene Indexes</td> 
   <td><p>This check uses the data exposed by the <span class="code">Lucene Index Statistics</span> MBean to identify large indexes and returns:</p> 
    <ul> 
     <li>a Warning status if there is an index with more than 1 billion documents</li> 
     <li>a Critical status if there is an index with more than 1.5 billion documents</li> 
    </ul> <p>The thresholds are configurable and the MBean for the health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DlargeIndexHealthCheck%2Ctype%3DHealthCheck">org.apache.sling.healthcheck:name=largeIndexHealthCheck,type=HealthCheck.</a></p> <p><strong>Note: </strong>This check is available with AEM 6.4 and has been backported to AEM 6.3.2.0.</p> </td> 
  </tr> 
  <tr> 
   <td>System Maintenance</td> 
   <td><p>System Maintenance is a composite check that returns the OK if all maintenance tasks are running as configured. Keep in mind that:</p> 
    <ul> 
     <li>each maintenance task is accompanied by an associated health check</li> 
     <li>if a task is not added to a maintenance window, its health check will return Critical</li> 
     <li>you need to configure the Audit Log and Workflow Purge maintenance tasks or otherwise remove them from the maintenance windows. If left unconfigured, these tasks will fail on the first attempted run, so the System Maintenance check will return the Critical status.</li> 
     <li><strong>With AEM 6.4</strong>, there is also a check for the <a href="../../../../6-5/sites/administering/using/operations-dashboard.md#automated-maintenance-tasks">Lucene Binaries Maintenance</a> task</li> 
     <li>on AEM 6.2 and lower, the system maintenance check returns a Warning status right after startup because the tasks never run. Starting with 6.3, they will return OK if the first maintenance window wasn't reached yet.</li> 
    </ul> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3Dsystemchecks%2Ctype%3DHealthCheck">org.apache.sling.healthcheck:name=systemchecks,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Replication Queue</td> 
   <td><p>This check iterates over replication agents and looks at their queues. For the item at the top of the queue, the check looks at how many times the agent retried replication. If the agent retried replication more than the value of the <span class="code">numberOfRetriesAllowed</span> parameter, it returns a warning. The <span class="code">numberOfRetriesAllowed</span> parameter is configurable. </p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DreplicationQueue%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=replicationQueue,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Sling Jobs</td> 
   <td> 
    <div>
      Sling Jobs checks the number of jobs queued in the JobManager, compares it to the 
     <span class="code">maxNumQueueJobs</span> threshold, and: 
    </div> 
    <ul> 
     <li>returns Critical if more than the <span class="code">maxNumQueueJobs</span> are in the queue</li> 
     <li>returns Critical if there are long-running active jobs that are older than 1 hour</li> 
     <li>returns Critical if there are queued jobs, and the last finished job time is older than 1 hour</li> 
    </ul> <p>Only the maximum number of queued jobs parameter is configurable and it has the default value of 1000.</p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DslingJobs%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=slingJobs,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Request Performance</td> 
   <td><p>This check looks at the <span class="code">granite.request.metrics.timer</span> <a href="http://localhost:4502/system/console/slingmetrics" target="_blank">Sling metric </a>and:</p> 
    <ul> 
     <li>returns Critical if the 75th percentile value is over the critical threshold (the default value is 500 milliseconds)</li> 
     <li>returns Warn if the 75th percentile value is over the warn threshold (the default value is 200 milliseconds)</li> 
    </ul> <p>The MBean for this health check is<em> </em><a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DrequestsStatus%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=requestsStatus,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Log Errors</td> 
   <td><p>This check returns the Warn status if there are errors in the log.</p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DlogErrorHealthCheck%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=logErrorHealthCheck,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Disk Space</td> 
   <td><p>The Disk Space check looks at the <span class="code">FileStoreStats</span> MBean, retrieves the size of the Node Store and the amount of usable disk space on the Node Store partition, and:</p> 
    <ul> 
     <li>returns Warn if the usable disk space to repository size ratio is less than the warn threshold (the default value is 10)</li> 
     <li>returns Critical if the usable disk space to repository size ratio is less than the critical threshold (the default value is 2)</li> 
    </ul> <p>Both thresholds are configurable. The check only works on instances with a Segment Store.</p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DDiskSpaceHealthCheck%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=DiskSpaceHealthCheck,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Scheduler Health Check</td> 
   <td><p>This check returns a warning if the instance has Quartz jobs running for more than 60 seconds. The acceptable duration threshold is configurable.</p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DslingCommonsSchedulerHealthCheck%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=slingCommonsSchedulerHealthCheck,type=HealthCheck</a><em>.</em></p> </td> 
  </tr> 
  <tr> 
   <td>Security Checks</td> 
   <td><p>The Security check is a composite which aggregates the results of multiple security-related checks. These individual health checks address different concerns from the security checklist available at the <a href="../../../../6-5/sites/administering/using/security-checklist.md">Security Checklist documentation page.</a> The check is useful as a security smoke test when the instance is started. </p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3Dsecuritychecks%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=securitych</a><a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3Dsecuritychecks%2Ctype%3DHealthCheck" target="_blank"></a><a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3Dsecuritychecks%2Ctype%3DHealthCheck" target="_blank"></a><a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3Dsecuritychecks%2Ctype%3DHealthCheck" target="_blank">ecks,type=HealthCheck</a></p> </td> 
  </tr> 
  <tr> 
   <td>Active Bundles</td> 
   <td><p>Active Bundles checks the state of all bundles and:</p> 
    <ul> 
     <li>returns the Warn status if any of the bundles is not active or (starting, with lazy activation)</li> 
     <li>it ignores the status of bundles in the ignore list</li> 
    </ul> <p>The ignore list parameter is configurable.</p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DinactiveBundles%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=inactiveBundles,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Code Cache Check</td> 
   <td><p>This is a Health Check that verifies several JVM conditions that can trigger a CodeCache bug present in Java 7:</p> 
    <ul> 
     <li>returns Warn if the instance is running on Java 7, with Code Cache flushing enabled</li> 
     <li>returns Warn if the instance is running on Java 7, and the Reserved Code Cache size is less than a minimum threshold (the default value is 90MB)</li> 
    </ul> <p>The <span class="code">minimum.code.cache.size</span> threshold is configurable. For more information about the bug, <a href="http://bugs.java.com/bugdatabase/view_bug.do?bug_id=8012547">check</a><a href="http://bugs.java.com/bugdatabase/view_bug.do?bug_id=8012547"></a><a href="http://bugs.java.com/bugdatabase/view_bug.do?bug_id=8012547"></a><a href="http://bugs.java.com/bugdatabase/view_bug.do?bug_id=8012547"> this page</a>.</p> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DcodeCacheHealthCheck%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=codeCacheHealthCheck,type=HealthCheck</a>.</p> </td> 
  </tr> 
  <tr> 
   <td>Resource Search Path Errors</td> 
   <td><p>Checks if there are any resources in the path <span class="code">/apps/foundation/components/primary</span> and:</p> 
    <ul> 
     <li>returns Warn if there are child nodes under <span class="code">/apps/foundation/components/primary</span></li> 
    </ul> <p>The MBean for this health check is <a href="http://localhost:4502/system/console/jmx/org.apache.sling.healthcheck%3Aname%3DresourceSearchPathErrorHealthCheck%2Ctype%3DHealthCheck" target="_blank">org.apache.sling.healthcheck:name=resourceSearchPathErrorHealthCheck,type=HealthCheck</a>.</p> </td> 
  </tr> 
 </tbody> 
</table>

<!--
Comment Type: draft

<h3>The Production Ready Package</h3>
-->

<!--
Comment Type: draft

<note type="caution">
<p>The Production Ready package is only for publish mode.</p>
</note>
-->

<!--
Comment Type: draft

<p>The Production Ready package can be installed in order to automatically perform most of the configuration steps in the <a href="../../../../6-5/sites/administering/using/security-checklist.md">Security Checklist</a> and make the instance ready for production.</p>
<p>The Production Ready Health Check checks if the above mentioned package is installed. If it is not, it will display a WARN message advising to install the package.</p>
-->

<!--
Comment Type: draft

<img imagerotate="0" src="assets/chlimage_1-98.png" />
-->

<!--
Comment Type: draft

<p>The Production Ready package covers these configuration areas:</p>
<p><strong>Logging</strong></p>
<ul>
<li>All loggers are set to the ERROR level with a default daily rolling policy.</li>
</ul>
<p><strong>Security</strong></p>
<ul>
<li>Uninstalls example content and users</li>
<li>Configures replication and transport users. The default user used for the replication is <i>replication-default</i> with an empty password</li>
<li>Prevents Denial of Service (DoS) attacks by setting the JSON Max Results to 100<br /> </li>
<li>Disables the CQ WCM Debug Filter </li>
<li>Automatically adjusts settings for the OSGi services that might leak internal information if not configured correctly on publish instances. For more info, see <a href="../../../../6-5/sites/administering/using/security-checklist.md#osgi-settings">this section</a> of the Security Checklist.</li>
</ul>
<p><strong>Repository Garbage Collect Scheduler</strong></p>
<ul>
<li>The Scheduler is configured to run weekly with the "Delete" flag set to true.</li>
</ul>
-->

<!--
Comment Type: draft

<note type="caution">
<p>Please note that there is no way for the Garbage Collection Scheduler to determine if the Data Store is shared. For such situations, it is recommended that the settings be configured manually by an administrator in order to avoid accidental data loss.<br /> </p>
</note>
-->

<!--
Comment Type: draft

<p>You can install the Production Ready package by:<br /> </p>
-->

<!--
Comment Type: draft

<ol>
<li><p>Going to Package Admin by going to <strong>Tools</strong> - <strong>Operations</strong> - <strong>Packaging</strong> - <strong>Packages</strong> from the AEM Welcome screen, or accessing the Package Admin directly at <span class="code">http://serveraddress:4502/crx/packmgr/index.jsp</span><br /> </p> </li>
<li><p>Finding the package called <strong>productionready-config-pkg-1.0.0.zip</strong></p> </li>
<li><p>Clicking the <strong>Install</strong> button.</p> </li>
</ol>
-->

<!--
Comment Type: draft

<h2>The Monitoring Dashboard</h2>
-->

<!--
Comment Type: draft

<p>AEM 6.3 introduces a new way of monitoring system in the form of the monitoring dashboard. The aim is to provide a quickly accessible representation of system resources and other key performance indicators in visual form.</p>
<p>You can find the monitoring dashboard by going to <strong>Tools - Operations - Monitoring</strong> from the home screen, or by directly accessing the link below:</p>
<p><i>http://serveraddress:serverport/libs/granite/operations/content/monitoring/page.html</i></p>
<p>By default, the dashboard has three preconfigured charts: <strong>Disk Usage Statistics</strong>, <strong>Repository Statistics</strong> and <strong>Memory Usage Statistics</strong>.</p>
<p>Each chart exposes several statistics, grouped by area.</p>
-->

## Monitoring with Nagios {#monitoring-with-nagios}

The Health Check Dashboard can integrate with Nagios via the Granite JMX Mbeans. The below example illustrates how to add a check that shows used memory on the server running AEM.

1. Setup and install Nagios on the monitoring server.
1. Next, install the Nagios Remote Plugin Executor (NRPE).

   >[!NOTE]
   >
   >For more info on how to install Nagios and NRPE on your system, please consult the [Nagios Documentation](http://library.nagios.com/library/products/nagioscore/manuals/).

1. Add a host definition for the AEM server. This can be done via the Nagios XI Web Interface, by using the Configuration Manager:

    1. Open a browser and point to the Nagios server.
    1. Press the** Configure** button in the top menu.  
    
    1. In the left pane, press the **Core Config Manager** under **Advanced Configuration**.
    
    1. Press te **Hosts** link under the **Monitoring** section.
    
    1. Add the host definition:

   ![](assets/chlimage_1-99.png)

   Below is an example of a host configuration file, in case you are using Nagios Core:

   ```xml
   define host {
      address 192.168.0.5
      max_check_attempts 3
      check_period 24x7
      check-command check-host-alive
      contacts admin
      notification_interval 60
      notification_period 24x7
   }
   ```

1. Install Nagios and NRPE on the AEM server.
1. Install the [check_http_json](https://github.com/phrawzty/check_http_json) plugin on both servers.
1. Define a generic JSON check command on both servers:

   ```xml
   define command{
   
       command_name    check_http_json-int
   
       command_line    /usr/lib/nagios/plugins/check_http_json --user "$ARG1$" --pass "$ARG2$" -u 'http://$HOSTNAME$:$ARG3$/$ARG4$' -e '$ARG5$' -w '$ARG6$' -c '$ARG7$'
   
   }
   ```

1. Add a service for used memory on the AEM server:

   ```xml
   define service {
   
       use generic-service
   
       host_name my.remote.host
   
       service_description AEM Author Used Memory
   
       check_command  check_http_json-int!<cq-user>!<cq-password>!<cq-port>!system/sling/monitoring/mbeans/java/lang/Memory.infinity.json!{noname}.mbean:attributes.HeapMemoryUsage.mbean:attributes.used.mbean:value!<warn-threshold-in-bytes>!<critical-threshold-in-bytes>
   
       }
   ```

1. Check your Nagios dashboard for the newly created service:

   ![](assets/chlimage_1-100.png)

## Diagnosis tools {#diagnosis-tools}

The Operation Dashboard also provides access to Diagnosis Tools that can help finding and troubleshooting root causes of the warnings coming from the Health Check Dashboard, as well as providing important debug information for system operators.

Amongst its most important features are:

* A log message analyzer
* The ability to access heap and thread dumps
* Requests and query performance analyzers

You can reach the Diagnosis Tools screen by going to **Tools - Operations - Diagnosis** from the AEM Welcome screen. You can also access the screen by directly accessing the following URL: `http://serveraddress:port/libs/granite/operations/content/diagnosis.html`

![](assets/chlimage_1-101.png) 

### Log Messages {#log-messages}

The log messages User Interface will display all ERROR messages by default. If you want to have more log messages displayed, you need to configure a logger with the appropriate log level.

The log messages use an in memory log appender and therefore, are not related to the log files. Another consequence is that changing the log levels in this UI will not change the information that gets logged in the traditional log files. Adding and removing loggers in this UI will only affect the in memory logger. Also, note that changing the logger configurations will be reflected in the future of the in memory logger - the entries that are already logged and are not relevant anymore are not deleted, but similar entries will not be logged in the future.

You can configure what gets logged by providing logger configurations from the upper left gear button in the UI. There, you can add, remove or update logger configurations. A logger configuration is composed of a **log level** (WARN / INFO / DEBUG) and a **filter name**. The **filter name** has the role of filtering the source of the log messages that get logged. Alternatively, if a logger should capture all the log messages for the specified level, the filter name should be "**root**". Setting the level of a logger will trigger the capture of all the messages with a level equal or higher than the one specified.

Examples:

* If you plan on capturing all the **ERROR** messages - no configuration is required. All the ERROR messages are captured by default.
* If you plan on capturing all the **ERROR**, **WARN** and **INFO** messages - the logger name should be set to: "**root**", and the logger level to: **INFO**.

* If you plan on capturing all the messages coming from a certain package (for example com.adobe.granite) - the logger name should be set to: "com.adobe.granite", and the logger level to: **DEBUG** (this will capture all the **ERROR**, **WARN**, **INFO** and **DEBUG** messages), as shown in the image below.

![](assets/chlimage_1-102.png)

>[!NOTE]
>
>You can not set a logger name to capture only ERROR messages via a specified filter. By default, all the ERROR messages are captured.

>[!NOTE]
>
>The log messages user interface does not reflect the actual error log. Unless you are configuring other types of log messages in the UI, you will see ERROR messages only. For how to display specific log messages, see instructions above.

>[!NOTE]
>
>The settings in the diagnosis page do not influence what is logged to the log files and vice-versa. So, while the error log might catch INFO messages, you might not see them in the log messages UI. Also, through the UI it's possible to catch DEBUG messages from certain packages without it affecting the error log. For more information on how to configure the log files, see [Logging](/6-5/sites/deploying/using/configure-logging.md).

>[!NOTE]
>
>**With AEM 6.4**, maintenance tasks are logged out of the box in a more information rich format at the INFO level. This allows for better visiblity into the state of the maintenance tasks.
>
>In case you are using third party tools (such as Splunk) to monitor and react to maintenance task activity you can make use of the following log statements:

```
Log level: INFO
DATE+TIME [MaintanceLogger] Name=<MT_NAME>, Status=<MT_STATUS>, Time=<MT_TIME>, Error=<MT_ERROR>, Details=<MT_DETAILS>

```

### Request performance {#request-performance}

The Request Performance page allows the analysis of the slowest page requests processed. Only content requests will be registered on this page. More specifically, the following requests will be captured:

1. Requests accessing resources under `/content`
1. Requests accessing resources under `/etc/design`
1. Requests having the `".html"` extension

![](assets/chlimage_1-103.png)

The page displays:

* The time when the request was made
* The URL and the method of request
* The duration in milliseconds

By default, the slowest 20 page requests are captured, but the limit can be modified in the Configuration Manager.

### Query Performance {#query-performance}

The Query Performance page allows the analysis of the slowest queries performed by the system. This information is provided by the repository in a JMX Mbean. In Jackrabbit, the `com.adobe.granite.QueryStat` JMX Mbean provides this information, while in the Oak repository, it is offered by `org.apache.jackrabbit.oak.QueryStats.`

The page displays:

* The time when the query was made 
* The language of the query 
* The number of times the query was issued 
* The statement of the query 
* The duration in milliseconds

![](assets/chlimage_1-104.png) 

### Explain Query {#explain-query}

For any given query, Oak attempts to figure out the best way to execute based on the Oak indexes defined in the repository under the **oak:index** node. Depending on the query, different indexes may be chosen by Oak. Understanding how Oak is executing a query is the first step to optimizing the query.

The Explain Query is a tool that explains how Oak is executing a query. It can be accessed by going to **Tools - Operations - Diagnosis** from the AEM Welcome Screen, then clicking on **Query Performance** and switching over to the **Explain Query** tab.

**Features**

* Supports the Xpath, JCR-SQL and JCR-SQL2 query languages  
* Reports the actual execution time of the provided query  
* Detects slow queries and warns about queries that could be potentially slow  
* Reports the Oak index used to execute the query
* Displays the actual Oak Query engine explanation
* Provides click-to-load list of Slow and Popular queries

Once you are in the Explain Query UI, all you need to do in order to use it is enter the query and press the **Explain** button:

![](assets/chlimage_1-105.png)

The first entry in the Query Explanation section is the actual explanation. The explanation will show the type of index that was used to execute the query.

The second entry is the execution plan.

Ticking the **Include execution time** box before running the query will also show the amount of time the query was executed in, allowing for more information that can be used for optimizing the indexes for your application or deployment.

![](assets/chlimage_1-106.png) 

### The Index Manager {#the-index-manager}

The purpose of the Index Manager is to facilitate index management such as maintaining indexes, or viewing their status.

It can be accessed by going to **Tools - Operations - Diagnosis **from the Welcome Screen, and then clicking the **Index Manager** button.

It can also be accessed directly at this URL: `http://<server>:<port>/libs/granite/operations/content/diagnosistools/indexManager.html`

![](assets/screen-shot_2019-06-18at154754.png)

The UI can be used to filter indexes in the table by typing in the filter criteria in the search box in the upper left corner of the screen.

### Download Status ZIP {#download-status-zip}

This will trigger the download of a zip containing useful information about the system status and configuration. The archive contains contains instance configurations, a list of bundles, OSGI, Sling metrics and statistics and this can result in a large file. You can reduce the impact of large status files by using the **Download Status ZIP **window. The window can be accessed from: **AEM &gt; Tools &gt; Operations &gt; Diagnosis &gt; Download Status ZIP.**

From this window you can select what to export (log files and or thread dumps) and the number of days of logs included in the download relative to the current date.

![](assets/download_status_zip.png) 

### Download Thread Dump {#download-thread-dump}

This will trigger the download of a zip containing information about the threads present in the system. Information about each thread is provided, such as its status, the classloader and the stacktrace.

### Download Heap Dump {#download-heap-dump}

You also have the ability to download a snapshot of the heap, in order to analyze it at a later time. Take note that this will trigger the download of a large file, in the order of hundreds of megabytes.

## Automated Maintenance Tasks {#automated-maintenance-tasks}

The Automated Maintenance Tasks page is a place where you can view and track recommended maintenance tasks scheduled for periodic execution. The tasks are integrated with the Health Check system. The tasks can also be manually executed from the interface.

In order to get to the Maintenance page in the Operations Dashboard, you need to go to **Tools - Operations - Dashboard - Maintenance** from the AEM Welcome screen, or directly follow this link:

`http://serveraddress:port/libs/granite/operations/content/maintenance.html`

The following tasks are available in the Operations Dashboard:

1. The **Revision Clean Up **task, located under the **Daily Maintenance Window** menu.

1. The **Lucene Binaries Cleanup **task, located under the **Daily Maintenance Window** menu.

1. The **Workflow purge **task, located under the **Weekly Maintenance Window** menu.

1. The **Data Store Garbage Collection** task, located under the **Weekly Maintenance Window** menu.

1. The **Audit Log Maintenance** task, located under the **Weekly Maintenance Window** menu.

1. The **Version Purge Maintenance** task, located under the **Weekly Maintenance Window** menu.

The default timing for the daily maintenance window is 2 to 5 AM. The tasks configured to run in the weekly maintenance window will execute between 1 and 2 AM on Saturdays.

You can also configure the timings by pressing the gear icon on any of the two maintenance cards:

![](assets/chlimage_1-107.png)

>[!NOTE]
>
>Since AEM 6.1, the existing maintenance windows can also be configured to run monthly.

### Revision Clean Up {#revision-clean-up}

For more information on performing Revision Clean Up, [see this dedicated article](/6-5/sites/deploying/using/revision-cleanup.md).

<!--
Comment Type: draft

<note type="caution">
<p>Online Revision Cleanup is present in AEM 6.2 under <strong>restricted</strong> support. For more information on the conditions and terms of using the feature, please contact <a href="https://helpx.adobe.com/marketing-cloud/contact-support.html">Adobe Customer Care</a>. </p>
</note>
-->

<!--
Comment Type: draft

<p>Offline Revision Cleanup is the recommended and supported way of performing revision cleanup. For more details, see <a href="/6-5/sites/deploying/using/storage-elements-in-aem-6.md#performing-offline-revision-cleanup" target="_blank">Performing Offline Revision Cleanup</a>.</p>
-->

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-0436B4A35714BFF67F000101@AdobeID)
Last Modified Date: 2017-11-30T05:01:09.929-0500
<p>As discussed with Peter Klassen we will hide all information about running Online Revision Cleanup in 6.2 and we will only keep the warning.</p>
-->

<!--
Comment Type: draft

<p>As data is never overwritten in a tar file, the disk usage increases even when only updating existing data. To make up for the growing size of the repository, AEM employs a garbage collection mechanism called <strong>Revision Cleanup</strong>. The mechanism will reclaim disk space by removing obsolete data from the repository.</p>
<p>By default, revision cleanup is automatically run each night between 2 am and 5 am. </p>
-->

<!--
Comment Type: draft

<p>The automatic compaction can also be triggered manually in the Operations Dashboard via a maintenance job called Revision Cleanup.</p>
-->

<!--
Comment Type: draft

<p>In order for the Revision Clean Up to be efficient, you first need to run Online Compaction. You can do this by following the below procedure:</p>
-->

<!--
Comment Type: draft

<ol>
<li><p>Go to the JMX console by pointing your browser to <span class="code">http://server:port/system/console/jmx</span></p> </li>
<li><p>Search for <strong>CompactionStrategy</strong> and click the MBean that shows up in the search.</p> </li>
<li><p>Next, verify that the value for <strong>PausedCompaction</strong> is set to <span class="code">false</span>. This confirms that online revision cleanup is set to run:</p> <img imagerotate="0" src="assets/chlimage_1-108.png" /><p>Online revision cleanup is now scheduled to run as part of the tasks performed in the Daily Maintenance Window. For more info, see <a href="#automated-maintenance-tasks">Automated Maintenance Tasks</a>.</p> </li>
<li><p>Next, verify if Online revision cleanup is running properly. You can do this by first going to the Operations Dashboard and checking what is the time interval configured for the <strong>Daily Maintenance Window. </strong>By default, it is scheduled to run between 2 and 5 AM.</p> </li>
<li><p>Now, inspect the <strong>error.log</strong> file for events logged during the time of the daily maintenance window to see if revision cleanup ran correctly. <br /> </p>
<note type="note">
<p>Before checking the logs, note that online revision cleanup will not complete if the calculated disk space gain is less than 10 percent of the entire repository size.</p>
</note><p>This is an example of the log entries that will be generated if the online revision cleanup was not run because the gain is less than 10 percent:</p>
<codeblock gutter="true" class="syntax xml">
16.03.2015&nbsp;02:00:13.736&nbsp;*INFO*&nbsp;[TarMK&nbsp;compaction&nbsp;thread&nbsp;[/author/crx-quickstart/repository/segmentstore],&nbsp;active&nbsp;since&nbsp;Mon&nbsp;Mar&nbsp;16&nbsp;02:00:13&nbsp;EDT&nbsp;2015,&nbsp;previous&nbsp;max&nbsp;duration&nbsp;58249ms]&nbsp;org.apache.jackrabbit.oak.plugins.segment.file.FileStore&nbsp;TarMK&nbsp;compaction&nbsp;started&nbsp;16.03.2015&nbsp;02:00:30.001&nbsp;*INFO*&nbsp;[pool-9-thread-2]&nbsp;com.adobe.granite.taskmanagement.impl.jcr.TaskArchiveService&nbsp;archiving&nbsp;tasks&nbsp;at:&nbsp;'Mon&nbsp;Mar&nbsp;16&nbsp;02:00:30&nbsp;EDT&nbsp;2015'!!discoiqbr!!16.03.2015&nbsp;02:01:06.325&nbsp;*INFO*&nbsp;[TarMK&nbsp;compaction&nbsp;thread&nbsp;[/author/crx-quickstart/repository/segmentstore],&nbsp;active&nbsp;since&nbsp;Mon&nbsp;Mar&nbsp;16&nbsp;02:00:13&nbsp;EDT&nbsp;2015,&nbsp;previous&nbsp;max&nbsp;duration&nbsp;58249ms]&nbsp;org.apache.jackrabbit.oak.plugins.segment.file.FileStore&nbsp;Estimated&nbsp;compaction&nbsp;in&nbsp;52.59&nbsp;s,&nbsp;gain&nbsp;is&nbsp;9%&nbsp;(1028524544/1137660928)&nbsp;or&nbsp;(1.0GB/1.1&nbsp;GB),&nbsp;so&nbsp;skipping&nbsp;compaction&nbsp;for&nbsp;now
</codeblock><p>This an example of the log entries that will be generated if the online revision cleanup is going to be run because the gain is higher than 10 percent:</p>
<codeblock gutter="true" class="syntax xml">
19.03.2015&nbsp;02:00:10.230&nbsp;*INFO*&nbsp;[TarMK&nbsp;compaction&nbsp;thread&nbsp;[/author/crx-quickstart/repository/segmentstore],&nbsp;active&nbsp;since&nbsp;Thu&nbsp;Mar&nbsp;19&nbsp;02:00:10&nbsp;EDT&nbsp;2015,&nbsp;previous&nbsp;max&nbsp;duration&nbsp;1369831ms]&nbsp;org.apache.jackrabbit.oak.plugins.segment.file.FileStore&nbsp;TarMK&nbsp;compaction&nbsp;started!!discoiqbr!!19.03.2015&nbsp;02:00:30.441&nbsp;*INFO*&nbsp;[pool-9-thread-2]&nbsp;com.adobe.granite.taskmanagement.impl.jcr.TaskArchiveService&nbsp;archiving&nbsp;tasks&nbsp;at:&nbsp;'Thu&nbsp;Mar&nbsp;19&nbsp;02:00:30&nbsp;EDT&nbsp;2015'!!discoiqbr!!19.03.2015&nbsp;02:01:01.699&nbsp;*INFO*&nbsp;[TarMK&nbsp;compaction&nbsp;thread&nbsp;[/author/crx-quickstart/repository/segmentstore],&nbsp;active&nbsp;since&nbsp;Thu&nbsp;Mar&nbsp;19&nbsp;02:00:10&nbsp;EDT&nbsp;2015,&nbsp;previous&nbsp;max&nbsp;duration&nbsp;1369831ms]&nbsp;org.apache.jackrabbit.oak.plugins.segment.file.FileStore&nbsp;Estimated&nbsp;compaction&nbsp;in&nbsp;51.47&nbsp;s,&nbsp;gain&nbsp;is&nbsp;69%&nbsp;(1018859520/3343598080)&nbsp;or&nbsp;(1.0&nbsp;GB/3.3&nbsp;GB),&nbsp;so&nbsp;running&nbsp;compaction
</codeblock><p>Lastly, these are the log entry generated when online revision cleanup has successfully completed:</p>
<codeblock gutter="true" class="syntax xml">
19.03.2015&nbsp;02:22:52.638&nbsp;*INFO*&nbsp;[TarMK&nbsp;compaction&nbsp;thread&nbsp;[/author/crx-quickstart/repository/segmentstore],&nbsp;active&nbsp;since&nbsp;Thu&nbsp;Mar&nbsp;19&nbsp;02:00:10&nbsp;EDT&nbsp;2015,&nbsp;previous&nbsp;max&nbsp;duration&nbsp;1369831ms]&nbsp;org.apache.jackrabbit.oak.plugins.segment.file.FileStore&nbsp;TarMK&nbsp;compaction&nbsp;completed&nbsp;in&nbsp;1310939ms
</codeblock></li>
</ol>
-->

<!--
Comment Type: draft

<p>To start revision cleanup manually, you need to go under the <strong>Daily Maintenance Window</strong> page, hover over the <strong>Revision Cleanup</strong> window and press the <strong>Play</strong> button:<br /> </p>
<p> </p>
-->

<!--
Comment Type: draft

<img donotlocalize="true" imagerotate="0" src="do-not-localize/chlimage_1-18.png" />
-->

<!--
Comment Type: draft

<p>The icon will turn orange to indicate that the Revision Clean Up job is running. You can stop it at any time by hovering the mouse over the icon and pressing the <strong>Stop</strong> button:</p>
-->

<!--
Comment Type: draft

<note type="note">
<p>The revision cleanup can also be triggered via the JMX Console or run from an external tool. For more info, please see <a href="/6-5/sites/deploying/using/storage-elements-in-aem-6.md#invoking-revision-garbage-collection-via-the-jmx-console" target="_blank">this page</a>.</p>
</note>
-->

### Lucene Binaries Cleanup {#lucene-binaries-cleanup}

By using the Lucene Binaries Cleanup task, you can purge lucene binaries and reduce the running data store size requirement. This is because the lucene's binary churn will be re-claimed daily instead of the earlier dependency on a successful [data store garbage collection](../../../../6-5/sites/administering/using/data-store-garbage-collection.md) run.

Though the maintenance task was developed to reduce Lucene related revision garbage, there are general efficiency gains when running the task:

* The weekly execution of the data store garbage collection task will complete more quickly
* It may also slightly improve the overall AEM performance

You can access the Lucene Binaries Cleanup task from: **AEM &gt; Tools &gt; Operations &gt; Maintenance &gt; Daily Maintenance Window &gt; Lucene Binaries Cleanup**.

### Data Store Garbage Collection {#data-store-garbage-collection}

For details on Data Store Garbage Collection, see the dedicated [documentation page](../../../../6-5/sites/administering/using/data-store-garbage-collection.md).

### Workflow purge {#workflow-purge}

Workflows can also be purged from the Maintenance Dashboard. In order to run the Workflow Purge task, you need to:

1. Click on the **Weekly Maintenance Window** page.
1. In the following page, click the **Play** button in the **Workflow purge** card.

>[!NOTE]
>
>For more detailed information about Workflow Maintenance, see [this page](/6-5/sites/administering/using/workflows-administering.md#regular-purging-of-workflow-instances).

### Audit Log Maintenance {#audit-log-maintenance}

For Audit Log Maintenance, see the [separate documentation page.](/6-5/sites/administering/using/operations-audit-log.md) [](/6-5/sites/administering/using/operations-audit-log.md)

### Version Purge {#version-purge}

You can schedule the Version Purge maintenance task to delete old versions automatically. As a result, this minimizes the need to manually use the [Version Purge tools](../../../../6-5/sites/deploying/using/version-purging.md). You can schedule and configure the Version Purge task by accessing **Tools &gt; Operations &gt; Maintenance &gt; Weekly Maintenance Window** and following these steps:

1. Click the **Add** button.
1. Choose **Version Purge** from the drop-down menu.

   ![](assets/version_purge_maintenancetask.png)

1. To configure the Version Purge task, click on the **gears** icon on the newly created Version Purge maintenance card.

   ![](assets/version_purge_taskconfiguration.png)

**With AEM 6.4**, you can stop the Version Purge maintenance task as follows:

* Automatically - If the scheduled maintenance window closes before the task can complete, the task stops automatically. It will resume when the next maintenance window opens.
* Manually - To manually stop the task, on the Version Purge maintenance card, click the **Stop **icon. On the next execution, the task will safely resume.

>[!NOTE]
>
>To stop the maintenance task means to suspend its execution without losing track of the job already in progress.

>[!CAUTION]
>
>In order to optimize the repository size you should run the version purge task frequently. The task should be scheduled outside of business hours when there is a limited amount of traffic.

## Custom Maintenance Tasks {#custom-maintenance-tasks}

Custom maintenance tasks can be implemented as OSGi services. As the maintenance task infrastructure is based on Apache Sling's job handling, a maintenance task must implement the java interface ` [org.apache.sling.event.jobs.consumer.JobExecutor](https://sling.apache.org/apidocs/sling7/org/apache/sling/event/jobs/consumer/JobExecutor.html)`. In addition, it must declare several service registration properties to be detected as a maintenance task, as listed below:

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>Service Property Name</strong><br /> </td> 
   <td><strong>Description</strong></td> 
   <td><strong>Example</strong><br /> </td> 
   <td><strong>Type</strong></td> 
  </tr> 
  <tr> 
   <td>granite.maintenance.isStoppable</td> 
   <td>Boolean attribute defining whether the task can be stopped by the user. If a task declares that it is stoppable it must check during its execution whether it has been stopped and then act accordingly. The default is false.</td> 
   <td>true</td> 
   <td>Optional</td> 
  </tr> 
  <tr> 
   <td>granite.maintenance.mandatory</td> 
   <td>Boolean attribute defining whether a task is mandatory and must be run periodically. If a task is mandatory but currently not in any active schedule window, a Health Check will report this as an error. The default is false.</td> 
   <td>true</td> 
   <td>Optional</td> 
  </tr> 
  <tr> 
   <td>granite.maintenance.name</td> 
   <td>A unique name for the task - this is used to reference the task. This is usally a simple name.</td> 
   <td>MyMaintenanceTask</td> 
   <td>Required</td> 
  </tr> 
  <tr> 
   <td>granite.maintenance.title</td> 
   <td>A title displayed for this task</td> 
   <td>My Special Maintenance Task</td> 
   <td>Required</td> 
  </tr> 
  <tr> 
   <td>job.topics</td> 
   <td>This is a unique topic of the maintenance task.<br /> The Apache Sling job handling will start a job with exactly this topic to execute the maintenance task and as the task is registered for this topic it gets executed.<br /> The topic must start with <i>com/adobe/granite/maintenance/job/</i></td> 
   <td>com/adobe/granite/maintenance/job/MyMaintenanceTask</td> 
   <td>Required</td> 
  </tr> 
 </tbody> 
</table>

Apart from the above service properties, the `process()` method of the `JobConsumer` interface needs to be implemented by adding the code that should be executed for the maintance task. The provided `JobExecutionContext` can be used to output status information, check if the job is stopped by the user and create a result (success or failed).

For situations where a maintenance task should not be run on all installations (for example, run only on the publish instance), you can make the service require a configuration in order to be active by adding `@Component(policy=ConfigurationPolicy.REQUIRE)`. You can then mark the according configuration as being run mode dependent in the repository. For more information, see [Configuring OSGi](/6-5/sites/deploying/using/configuring-osgi.md#creating-the-configuration-in-the-repository). [](/6-5/sites/deploying/using/configuring-osgi.md#creating-the-configuration-in-the-repository)

Below is an example of a custom maintenance task that deletes files from a configurable temporary directory which have been modified in the last 24 hours:

<!--
Comment Type: draft

<note type="note">
<p>For more information on building AEM services, see the <a href="https://docs.adobe.com/content/docs/en/cq/aem-how-tos/development.html">AEM How-tos</a> section.</p>
</note>
-->

src/main/java/com/adobe/granite/samples/maintenance/impl/DeleteTempFilesTask.java

<table border="0" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td><p> </p> <p><span class="code">/*</span></p> <p><span class="code"> * #%L</span></p> <p><span class="code"> * sample-maintenance-task</span></p> <p><span class="code"> * %%</span></p> <p><span class="code"> * Copyright (C) 2014 Adobe</span></p> <p><span class="code"> * %%</span></p> <p><span class="code"> * Licensed under the Apache License, Version 2.0 (the "License");</span></p> <p><span class="code"> * you may not use this file except in compliance with the License.</span></p> <p><span class="code"> * You may obtain a copy of the License at</span></p> <p><span class="code"> * </span></p> <p><span class="code"> * <a href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a></span></p> <p><span class="code"> * </span></p> <p><span class="code"> * Unless required by applicable law or agreed to in writing, software</span></p> <p><span class="code"> * distributed under the License is distributed on an "AS IS" BASIS,</span></p> <p><span class="code"> * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.</span></p> <p><span class="code"> * See the License for the specific language governing permissions and</span></p> <p><span class="code"> * limitations under the License.</span></p> <p><span class="code"> * #L%</span></p> <p><span class="code"> */</span></p> <p><span class="code"> </span></p> <p><span class="code">package com.adobe.granite.samples.maintenance.impl;</span></p> <p><span class="code"> </span></p> <p><span class="code">import java.io.File;</span></p> <p><span class="code">import java.util.Calendar;</span></p> <p><span class="code">import java.util.Collection;</span></p> <p><span class="code">import java.util.Map;</span></p> <p><span class="code"> </span></p> <p><span class="code">import org.apache.commons.io.FileUtils;</span></p> <p><span class="code">import org.apache.commons.io.filefilter.IOFileFilter;</span></p> <p><span class="code">import org.apache.commons.io.filefilter.TrueFileFilter;</span></p> <p><span class="code">import org.apache.felix.scr.annotations.Activate;</span></p> <p><span class="code">import org.apache.felix.scr.annotations.Component;</span></p> <p><span class="code">import org.apache.felix.scr.annotations.Properties;</span></p> <p><span class="code">import org.apache.felix.scr.annotations.Property;</span></p> <p><span class="code">import org.apache.felix.scr.annotations.Service;</span></p> <p><span class="code">import org.apache.sling.commons.osgi.PropertiesUtil;</span></p> <p><span class="code">import org.apache.sling.event.jobs.Job;</span></p> <p><span class="code">import org.apache.sling.event.jobs.consumer.JobConsumer;</span></p> <p><span class="code">import org.apache.sling.event.jobs.consumer.JobExecutionContext;</span></p> <p><span class="code">import org.apache.sling.event.jobs.consumer.JobExecutionResult;</span></p> <p><span class="code">import org.apache.sling.event.jobs.consumer.JobExecutor;</span></p> <p><span class="code">import org.slf4j.Logger;</span></p> <p><span class="code">import org.slf4j.LoggerFactory;</span></p> <p><span class="code"> </span></p> <p><span class="code">import com.adobe.granite.maintenance.MaintenanceConstants;</span></p> <p><span class="code"> </span></p> <p><span class="code">@Component(metatype = true,</span></p> <p><span class="code"> label = "Delete Temp Files Maintenance Task",</span></p> <p><span class="code"> description = "Maintatence Task which deletes files from a configurable temporary directory which have been modified in the last 24 hours.")</span></p> <p><span class="code">@Service</span></p> <p><span class="code">@Properties({</span></p> <p><span class="code"> @Property(name = MaintenanceConstants.PROPERTY_TASK_NAME, value = "DeleteTempFilesTask", propertyPrivate = true),</span></p> <p><span class="code"> @Property(name = MaintenanceConstants.PROPERTY_TASK_TITLE, value = "Delete Temp Files", propertyPrivate = true),</span></p> <p><span class="code"> @Property(name = JobConsumer.PROPERTY_TOPICS, value = MaintenanceConstants.TASK_TOPIC_PREFIX</span></p> <p><span class="code"> + "DeleteTempFilesTask", propertyPrivate = true) })</span></p> <p><span class="code">public class DeleteTempFilesTask implements JobExecutor {</span></p> <p><span class="code"> </span></p> <p><span class="code"> private static final Logger log = LoggerFactory.getLogger(DeleteTempFilesTask.class);</span></p> <p><span class="code"> </span></p> <p><span class="code"> @Property(label = "Temporary Directory", description="Temporary Directory. Defaults to the java.io.tmpdir system property.")</span></p> <p><span class="code"> private static final String PROP_TEMP_DIR = "temp.dir";</span></p> <p><span class="code"> </span></p> <p><span class="code"> private File tempDir;</span></p> <p><span class="code"> </span></p> <p><span class="code"> @Activate</span></p> <p><span class="code"> private void activate(Map&amp;lt;string, object=""&amp;gt; properties) {</span></p> <p><span class="code"> this.tempDir = new File(PropertiesUtil.toString(properties.get(PROP_TEMP_DIR),</span></p> <p><span class="code"> System.getProperty("java.io.tmpdir")));</span></p> <p><span class="code"> }</span></p> <p><span class="code"> </span></p> <p><span class="code"> @Override</span></p> <p><span class="code"> public JobExecutionResult process(Job job, JobExecutionContext context) {</span></p> <p><span class="code"> log.info("Deleting old temp files from {}.", tempDir.getAbsolutePath());</span></p> <p><span class="code"> Collection&amp;lt;file&amp;gt; files = FileUtils.listFiles(tempDir, new LastModifiedBeforeYesterdayFilter(),</span></p> <p><span class="code"> TrueFileFilter.INSTANCE);</span></p> <p><span class="code"> int counter = 0;</span></p> <p><span class="code"> for (File file : files) {</span></p> <p><span class="code"> log.debug("Deleting file {}.", file.getAbsolutePath());</span></p> <p><span class="code"> counter++;</span></p> <p><span class="code"> file.delete();</span></p> <p><span class="code"> // TODO - capture the output of delete() and do something useful with it</span></p> <p><span class="code"> }</span></p> <p><span class="code"> return context.result().message(String.format("Deleted %s files.", counter)).succeeded();</span></p> <p><span class="code"> }</span></p> <p><span class="code"> </span></p> <p><span class="code"> /**</span></p> <p><span class="code"> * IOFileFilter which filters out files which have been modified in the last 24 hours.</span></p> <p><span class="code"> *</span></p> <p><span class="code"> */</span></p> <p><span class="code"> private static class LastModifiedBeforeYesterdayFilter implements IOFileFilter {</span></p> <p><span class="code"> </span></p> <p><span class="code"> private final long minTime;</span></p> <p><span class="code"> </span></p> <p><span class="code"> private LastModifiedBeforeYesterdayFilter() {</span></p> <p><span class="code"> Calendar cal = Calendar.getInstance();</span></p> <p><span class="code"> cal.add(Calendar.DATE, -1);</span></p> <p><span class="code"> this.minTime = cal.getTimeInMillis();</span></p> <p><span class="code"> }</span></p> <p><span class="code"> </span></p> <p><span class="code"> @Override</span></p> <p><span class="code"> public boolean accept(File dir, String name) {</span></p> <p><span class="code"> // this method is never actually called.</span></p> <p><span class="code"> return false;</span></p> <p><span class="code"> }</span></p> <p><span class="code"> </span></p> <p><span class="code"> @Override</span></p> <p><span class="code"> public boolean accept(File file) {</span></p> <p><span class="code"> return file.lastModified() &amp;lt;= this.minTime;</span></p> <p><span class="code"> }</span></p> <p><span class="code"> }</span></p> <p><span class="code"> </span></p> <p><span class="code">}</span></p> <p><span class="code">&amp;lt;/file&amp;gt;&amp;lt;/string,&amp;gt;</span></p> <p> </p> </td> 
  </tr> 
 </tbody> 
</table>

[experiencemanager-java-maintenancetask-sample](https://github.com/Adobe-Marketing-Cloud/experiencemanager-java-maintenancetask-sample)- [src/main/java/com/adobe/granite/samples/maintenance/impl/DeleteTempFilesTask.java](https://github.com/Adobe-Marketing-Cloud/experiencemanager-java-maintenancetask-sample/blob/master/src/main/java/com/adobe/granite/samples/maintenance/impl/DeleteTempFilesTask.java)

Once the service is deployed, it will be exposed to the Operations Dashboard UI and can be added to one of the available maintenance schedules:

![](assets/chlimage_1-109.png)

This will add a corresponding resource at /apps/granite/operations/config/maintenance/[schedule]/[taskname]. If the task is run mode dependent, the property granite.operations.conditions.runmode needs to be set on that node with the values of the runmodes which need to be active for this maintenance task.

<!--
Comment Type: draft

<h2>Maintenance Tasks Shipped with AEM</h2>
-->

<!--
Comment Type: draft

<p>AEM 6 ships with a default set of automated maintenance tasks. Below is a table describing the maintenance tasks and their availability for each of the storage elements present in AEM 6.</p>
-->

<!--
Comment Type: draft

<table border="1" cellpadding="1" cellspacing="0" height="461" width="623">
<tbody>
<tr>
<td>Maintenance Task</td>
<td>Name</td>
<td>CRX2</td>
<td>Tar MK<br /> </td>
<td>Mongo MK</td>
<td>Maintenance Window</td>
<td>Remarks</td>
</tr>
<tr>
<td>Version Purge</td>
<td>com.day.cq.wcm.core.impl.VersionPurgeTask</td>
<td>Yes</td>
<td>Yes</td>
<td>Yes</td>
<td>Configurable.</td>
<td>Not enabled by default. It can be added manually by pressing the "+" button in the "Weekly Maintenance Window" section of the Operations Dashboard.<br /> </td>
</tr>
<tr>
<td>Workflow Purge</td>
<td>WorkflowPurgeTask</td>
<td>Yes</td>
<td>Yes</td>
<td>Yes</td>
<td>Weekly</td>
<td>A purge configuration must first be created in order for the task to run successfully.<br /> </td>
</tr>
<tr>
<td>DataStore Garbage Collection<br /> </td>
<td>DataStoreGarbageCollectionTask</td>
<td>Yes</td>
<td>No</td>
<td>Yes</td>
<td>Weekly</td>
<td> </td>
</tr>
<tr>
<td>Tar Compaction/Optimization</td>
<td>TarOptimizeTask</td>
<td>Yes</td>
<td>No</td>
<td>No</td>
<td>Daily</td>
<td> </td>
</tr>
<tr>
<td>Revision Clean Up<br /> </td>
<td>RevisionCleanupTask</td>
<td>No</td>
<td>Yes</td>
<td>Yes</td>
<td>Daily</td>
<td> </td>
</tr>
<tr>
<td>Tar Index Merge<br /> </td>
<td>TarIndexMergeTask</td>
<td>Yes</td>
<td>No</td>
<td>No</td>
<td>Daily</td>
<td> </td>
</tr>
<tr>
<td>AuditLog Mainenance Task</td>
<td>com.day.cq.audit.impl.AuditLogMaintenanceTask</td>
<td>Yes</td>
<td>Yes</td>
<td>Yes</td>
<td>Weekly</td>
<td> </td>
</tr>
</tbody>
</table>
-->

<!--
Comment Type: remark
Last Modified By: Silviu Raiman (raiman)
Last Modified Date: 2018-03-21T11:22:32.000-0400
<p>The table needs to be either updated for 6.4 or removed.</p>
-->

## System Overview {#system-overview}

The **System Overview Dashboard **displays** **a high-level overview of the configuration, hardware and health of the AEM instance. This means that system health status is transparent and all the information is aggregated in a single dashboard.

>[!NOTE]
>
>You can also [watch this video](https://video.tv.adobe.com/v/21340) for an introduction to the System Overview Dashboard.

### How To Access {#how-to-access}

To access the System Overview Dashboard, navigate to **Tools &gt; Operations &gt; System Overview**.

![](assets/system_overview_dashboard.png) 

### System Overview Dashboard Explained {#system-overview-dashboard-explained}

The table below, describes all the informations displayed in the System Overview Dashboard. Keep in mind that when there is no relevant information to show (for example, backup is not in progress, there are no health checks that are critical) the respective section will display the "No Entries" message.

You can also download a `JSON` file summarizing the dashboard information by clicking the **Download **button in the upper right-hand corner of the dashboard.The `JSON` endpoint is `/libs/granite/operations/content/systemoverview/export.json` and it can be used in a `curl` script for external monitoring.

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>Section</strong></td> 
   <td><strong>What information is displayed</strong></td> 
   <td><strong>When is it critical</strong></td> 
   <td><strong>Links To</strong></td> 
  </tr> 
  <tr> 
   <td>Health Checks</td> 
   <td> 
    <ul> 
     <li>a list of checks that are in Critical status</li> 
     <li>a list of checks that are in Warn status</li> 
    </ul> </td> 
   <td>Indicated visually:<br /> 
    <ul> 
     <li>a red tag for Critical checks</li> 
     <li>an orange tag for Warn checks</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>Health Reports page</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>Maintenance Tasks</td> 
   <td> 
    <ul> 
     <li>a list of tasks that failed</li> 
     <li>a list of tasks that are currently running</li> 
     <li>a list of tasks that have succeeded in the last run</li> 
     <li>a list of tasks that have never run</li> 
     <li>a list of tasks that are not scheduled</li> 
    </ul> </td> 
   <td><p>Indicated visually:</p> 
    <ul> 
     <li>a red tag for failed tasks</li> 
     <li>an orange tag for running tasks (as they might impact performance)</li> 
     <li>grey tags for every other status</li> 
    </ul> </td> 
   <td> 
    <ul> 
     <li>Maintenance Tasks page</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>System</td> 
   <td> 
    <ul> 
     <li>operating system and OS version (for example, Mac OS X)</li> 
     <li>system load average, as retrieved from <a href="https://docs.oracle.com/javase/8/docs/api/java/lang/management/OperatingSystemMXBean.html#getSystemLoadAverage--">OperatingSystemMXBeanusable</a></li> 
     <li>disk space (on the partition where the home directory is located)</li> 
     <li>maximum heap, as returned by <a href="https://docs.oracle.com/javase/8/docs/api/java/lang/management/MemoryMXBean.html#getHeapMemoryUsage--">MemoryMXBean</a></li> 
    </ul> </td> 
   <td>N/A</td> 
   <td>N/A</td> 
  </tr> 
  <tr> 
   <td>Instance</td> 
   <td> 
    <ul> 
     <li>the AEM version</li> 
     <li>list of run modes</li> 
     <li>the date when the instance was started</li> 
    </ul> </td> 
   <td>N/A</td> 
   <td>N/A</td> 
  </tr> 
  <tr> 
   <td>Repository</td> 
   <td> 
    <ul> 
     <li>the Oak version</li> 
     <li>type of node store (Segment Tar or Document) 
      <ul> 
       <li>if the type is document, the type of document store is displayed (RDB or Mongo)</li> 
      </ul> </li> 
     <li>if there is a custom data store: 
      <ul> 
       <li>for a File Data Store, the path is displayed</li> 
       <li>for an S3 Data store, the name of the S3 bucket is displayed</li> 
       <li>for a Shared S3 Data store, the name of the S3 bucket is displayed</li> 
       <li>for an Azure Data Store, the container is displayed</li> 
      </ul> </li> 
     <li>if there is no custom external datastore, a message indicating this fact is displayed</li> 
    </ul> </td> 
   <td>N/A</td> 
   <td>N/A</td> 
  </tr> 
  <tr> 
   <td>Distribution Agents</td> 
   <td> 
    <ul> 
     <li>a list of agents with blocked queues</li> 
     <li>a list of misconfigured agents ("Configuration Error")</li> 
     <li>a list of agents with queue processing paused</li> 
     <li>a list of idle agents</li> 
     <li>a list of running agents (that are currently processing entries)</li> 
    </ul> </td> 
   <td><p>Indicated visually:</p> 
    <ul> 
     <li>a red tag for blocked agents or configuration errors</li> 
     <li>an orange tag for paused agents</li> 
     <li>a grey tag for paused, idle or running agents<br /> </li> 
    </ul> </td> 
   <td>Distribution page<br /> </td> 
  </tr> 
  <tr> 
   <td>Replication Agents</td> 
   <td> 
    <ul> 
     <li>a list of agents with blocked queues</li> 
     <li>a list of idle agents</li> 
     <li>a list of running agents (that are currently processing entries)</li> 
    </ul> </td> 
   <td><p>Indicated visually:<br /> </p> 
    <ul> 
     <li>a red tag for blocked agents</li> 
     <li>a grey tag for paused agents</li> 
    </ul> </td> 
   <td>Replication page</td> 
  </tr> 
  <tr> 
   <td>Workflows</td> 
   <td> 
    <ul> 
     <li>Workflow Jobs: 
      <ul> 
       <li>number of failed workflow jobs (if any)</li> 
       <li>number of canceled workflow jobs (if any)</li> 
      </ul> </li> 
    </ul> 
    <ul> 
     <li>Workflow Counts - number of workflows in a given status (if any): 
      <ul> 
       <li>running</li> 
       <li>failed</li> 
       <li>suspended</li> 
       <li>aborted</li> 
      </ul> </li> 
    </ul> <p>For each of the statuses presented above a query is performed, with a limit of 400 milliseconds. At 400 milliseconds, the number of entries obtained up to that point is displayed.</p> </td> 
   <td><p>Not interpreted:</p> 
    <ul> 
     <li>the user should investigate when there are workflows and jobs in unexpected statuses.</li> 
    </ul> </td> 
   <td>Workflow Failures page</td> 
  </tr> 
  <tr> 
   <td>Sling Jobs</td> 
   <td><p>Sling job counts - number of jobs in a given status (if any):</p> 
    <ul> 
     <li>failed</li> 
     <li>queued</li> 
     <li>canceled</li> 
     <li>active</li> 
    </ul> </td> 
   <td><p>Not interpreted:</p> 
    <ul> 
     <li>the user should investigate when there are jobs in unexpected statuses or with high counts.</li> 
    </ul> </td> 
   <td>N/A</td> 
  </tr> 
  <tr> 
   <td>Estimated Node Counts</td> 
   <td><p>Estimated number of:</p> 
    <ul> 
     <li>pages</li> 
     <li>assets</li> 
     <li>tags</li> 
     <li>authorizables</li> 
     <li>total number of nodes<br /> </li> 
    </ul> <p>The total number of nodes is obtained from the nodeCounterMBean, while the rest of the statistics are obtained from IndexInfoService.</p> </td> 
   <td>N/A</td> 
   <td>N/A</td> 
  </tr> 
  <tr> 
   <td>Backup</td> 
   <td>Displays "Online Backup in Progress" if this is the case.</td> 
   <td>N/A</td> 
   <td>N/A</td> 
  </tr> 
  <tr> 
   <td>Indexing</td> 
   <td><p>Displays:</p> 
    <ul> 
     <li>"Indexing in progress"</li> 
     <li>"Query in progress"</li> 
    </ul> <p>If an indexing or query thread is present in the thread dump.</p> </td> 
   <td>N/A</td> 
   <td>N/A</td> 
  </tr> 
 </tbody> 
</table>

