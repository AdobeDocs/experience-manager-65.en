---
title: Fine-tuning Health Monitor performance

description: Learn how to fine-tune Health Monitor performance. Control the system statistics which impact the performance of forms environment using JAVA setting option.

contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/health_monitor
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 41042e08-5e14-4809-89b7-16d98a72d1b4
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Fine-tuning Health Monitor performance{#fine-tuning-health-monitor-performance}

Collecting the system statistics that populate Health Monitor has some impact on the performance of your AEM forms environment. This impact can be controlled by setting the Java options listed below in your application server.

<table>
 <thead>
  <tr>
   <th><p>Property</p></th>
   <th><p>Purpose</p></th>
   <th><p>Default value</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>adobe.healthmonitor.enabled</p></td>
   <td><p>Turn on or off Health Monitor thread</p></td>
   <td><p>true</p></td>
  </tr>
  <tr>
   <td><p>adobe.cache.statistics-enabled</p></td>
   <td><p>Turn on or off Gemfire caching</p></td>
   <td><p>true</p></td>
  </tr>
  <tr>
   <td><p>adobe.healthmonitor.refresh-interval</p></td>
   <td><p>The interval in milliseconds after which the Health Monitor thread collects the statistics</p></td>
   <td><p>10 minutes (600,000 milliseconds)</p></td>
  </tr>
  <tr>
   <td><p>adobe.cache.multicast-port</p></td>
   <td><p>The multicast port used to communicate with other members of the distributed system. If set to zero, multicast is disabled for both member discovery and distribution. </p><p>Note: Select different multicast addresses and ports for different distributed systems. Do not use different addresses only.</p></td>
   <td><p>No default value. Valid values range from 0 to 65535.</p></td>
  </tr>
  <tr>
   <td><p>statistic-sample-rate</p></td>
   <td><p>The rate in milliseconds at which statistics are sampled. Operating system statistics are only updated when a sample is taken.</p></td>
   <td><p>600000</p></td>
  </tr>
  <tr>
   <td><p>adobe.workmanager.healthmonitor.enabled</p></td>
   <td><p>This property enables or disables Work Manager statistic collection, such as job or work item count.</p></td>
   <td><p>true</p></td>
  </tr>
 </tbody>
</table>

## Add Java options to JBoss {#add-java-options-to-jboss}

1. Stop the JBoss application server.
1. Open the *[appserver root]*/bin/run.bat (Windows) or run.sh (Linux or UNIX) in an editor and add any of the Java options as required.
1. Restart the server.

## Add Java options to WebLogic {#add-java-options-to-weblogic}

1. Start the WebLogic administration console by typing https://[host name]:'port'/console in the URL line of a web browser.
1. Type the user name and password that you created for the WebLogic Server domain and click Log Under Change Center, click Lock & Edit.
1. Under Domain Structure, click Environment &gt; Servers and, in the right pane, click the managed server name.
1. On the next screen, click the Configuration tab &gt; Server Start tab.
1. In the Arguments box, append the arguments you require to the end of the current content. For example, adding - `Dadobe.healthmonitor.enabled=false` disables Health Monitor.
1. Click Save and then click Activate Changes.
1. Restart WebLogic managed server.

## Add Java options to WebSphere {#add-java-options-to-websphere}

1. In the WebSphere Administrative Console navigation tree, do the following for your application server:

   (WebSphere 6.x) Click Servers &gt; Application servers

   (WebSphere 7.x) Click Servers &gt; Server Types &gt; WebSphere application servers

1. In the right pane, click the server name.
1. Under Server Infrastructure, click Java and forms workflow &gt; Process Definition.
1. Under Additional Properties, click Java Virtual Machine.
1. In the Generic JVM arguments box, type the arguments you require.
1. Click OK or Apply, and then click Save directly to the master configuration.
