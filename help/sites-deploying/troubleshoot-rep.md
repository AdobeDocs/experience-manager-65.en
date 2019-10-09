---
title: Troubleshooting Replication
seo-title: Troubleshooting Replication
description: This article provides information on how to troubleshoot replication issues.
seo-description: This article provides information on how to troubleshoot replication issues.
uuid: 7c3fdaad-0916-4159-a26c-17ff8c6617fe
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
content-type: reference
topic-tags: configuring
discoiquuid: e862c8a9-b5b6-4857-a154-03d3ffac3e67
---

# Troubleshooting Replication{#troubleshooting-replication}

This page provides information on how to troubleshoot replication issues.

## Problem {#problem}

Replication (non-reverse replication) is failing for some reason.

## Resolution {#resolution}

There are various reasons for replication to fail. This article explains the approach one might take when analyzing these issues.

**Are replications getting triggered at all when clicking the Activate button? If NOT then do the following:**

1. Go to /crx/explorer (CQ5.5) and login as admin.
1. Open "Content Explorer"
1. See if a node /bin/replicate or /bin/replicate.json exists. If the node exists then delete it and save.

**Are the replications getting queued up in the replication agent queues?**

Check this by going to /etc/replication/agents.author.html then click on the replication agents to check.

**If one agent queue or a few agent queues are stuck:**

1. Does the queue show **blocked** status? If so then is the publish instance not running or totally unresponsive? Check the publish instance to see what is wrong with it (i.e. check the logs, and see if there is an OutOfMemory error or some other issue. Then if it is just generally slow then take thread dumps and analyze them.
1. Does the queue status show **Queue is active - # pending**? Basically the replication job could be stuck in a socket read waiting for the pubilsh instance or dispatcher to respond. This could mean that the publish instance or dispatcher is under high load or stuck in a lock. Take thread dumps from author and publish in this case.

    * Open the thread dumps from author in a thread dump analyzer, check if it shows that the replication agent's sling eventing job is stuck in a socketRead.
    * Open the thread dumps from publish in a thread dump analyzer, analyze what might be causing the publish instance not to respond. You should see a thread with POST /bin/receive in its name, that is the thread receiving the replication from author.

**If all agent queues are stuck**

1. It is possible that a certain piece of content cannot be serialized under /var/replication/data due to repository corruption or some other issue. Check the logs/error.log for a related error. To clear out the bad replication item, do the following:

    1. Go to https://&lt;host&gt;:&lt;port&gt;/crx and login as admin user. In CQ5.5 go to https://&lt;host&gt;:&lt;port&gt;/crx/explorer instead.
    1. Click on "Content Explorer".
    1. In the "Content Explorer" window click on the magnifying glass button on the top right of the window and a search dialog will pop up.
    1. Select the "XPath" radio button.
    1. In the "Query" box enter this query /jcr:root/var/eventing/jobs//element(&ast;,slingevent:Job) order by @slingevent:created
    1. Click "Search"
    1. In the results the top items are the latest sling eventing jobs. Click on each one and find the stuck replications that match what shows up in the top of the queue.

1. There might be something wrong with sling eventing framework job queues. Try restarting the org.apache.sling.event bundle in the/system/console.
1. It might be that job processing is completely turned off. You can check that under Felix Console in the Sling Eventing Tab. Check if it displays - Apache Sling Eventing (JOB PROCESSING IS DISABLED!)

    * If yes, then check Apache Sling Job Event Handler under Configuration tab in Felix Console. Might be that 'Job processing Enabled' checkbox is unchecked. If that is checked and still it displays that 'job processing is disabled', then check if there is any overlay under /apps/system/config that is disabling the job processing. Try creating an osgi:config node for jobmanager.enabled with a boolean value to true and re-check if the activation started and there are no more jobs in queue.

1. It might also be the case that DefaultJobManager configuration gets into an inconsistent state. This can happen when someone manually modifies the 'Apache Sling Job Event Handler' configuration via the OSGiconsole (For example disable and re-enable the 'Job Processing Enabled' property and Save the configuration).

    * At this point the DefaultJobManager configuration which is stored at crx-quickstart/launchpad/config/org/apache/sling/event/impl/jobs/DefaultJobManager.config gets into an inconsistent state. And even though the 'Apache Sling Job Event Handler' property shows 'Job Processing Enabled' to be in checked state, when one navigates to the Sling Eventing tab, it shows the message - JOB PROCESSING IS DISABLED and the replication does not work.
    * To resolve this issue, one would need to navigate to the Configuration page of the OSGi console and delete the 'Apache Sling Job Event Handler' configuration. Then restart the Master node of the cluster to get the configuration back into a consistent state. This should fix the issue and replication will start working again.

**Create a replication.log**

Sometimes it can be very helpful to set all replication logging to be added in a separate log file at DEBUG level. To do this:

1. Go to `https://host:port/system/console/configMgr` and login as admin.
1. Find the Apache Sling Logging Logger factory and create an instance by clicking the **+** button on the right of the factory configuration. This will create a new logging logger.
1. Set the configuration like this:

    * Log Level: DEBUG
    * Log File Path: *(CQ5.4 and 5.3)* ../logs/replication.log *(CQ5.5)* logs/replication.log
    * Categories: com.day.cq.replication

1. If you suspect the problem to be related to sling eventing/jobs in any way then you can also add this java package under categories:org.apache.sling.event

### Pausing Replication Agent Queue  {#pausing-replication-agent-queue}

Sometime it might be suitable to pause the replication queue to reduce load on the author system, without disabling it. Currently this is only possible by a hack of temporarily configuring an invalid port. From 5.4 onwards you could see pause button in replication agent queue it has some limitation

1. The state is not persisted that means if you restart a server or replication bundle is recycled it gets back to running state.
1. The pause is idle for a shorter period (OOB 1 hour after no activities with replication by other threads) and not for a longer time. Because There is feature in sling which avoid idle threads. Basically check if a job queue thread has been unused for a longer time, if so it kicks up clean up cycles. Due to cleanup cycle it stops the thread and hence the paused setting is lost. Since jobs are persisted it initiates a new thread to process the queue which does not have details of the paused configuration. Due to this queue turns into running state.

### Page Permissions are not Replicated on User Activation {#page-permissions-are-not-replicated-on-user-activation}

Page permissions are not replicated because they are stored under the nodes to which access is granted, not with the user.

In general page permissions should not be replicated from the author to publish and are not by default. This is because access rights should be different in those two environments. Therefore it is recommended to configure ACLs on publish separately from author.

### Replication queue blocked when replicating namespace information from Author to Publish {#replication-queue-blocked-when-replicating-namespace-information-from-author-to-publish}

In some cases the replication queue is blocked when trying to replicate namespace information from the author instance to the publish instance. This happens because the replication user does not have `jcr:namespaceManagement` privilege. To avoid this issue, make sure that:

* The replication user (as configured under the [Transport](/help/sites-deploying/replication.md#replication-agents-configuration-parameters) tab&gt;User) also exists on the Publish instance.
* The user has read and write privileges at the path where the content is installed.
* The user has `jcr:namespaceManagement` privilege at the repository level. You can grant the privilege as follows:

1. Login to CRX/DE ( `http://localhost:4502/crx/de/index.jsp`) as administrator.
1. Click on the **Access Control** tab.
1. Select **Repository**.
1. Click **Add Entry** (the plus icon).
1. Enter the name of the user.
1. Select `jcr:namespaceManagement` from the privileges list.
1. Click OK.

