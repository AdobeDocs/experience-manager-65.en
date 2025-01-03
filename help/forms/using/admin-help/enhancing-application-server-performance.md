---
title: Enhancing application server performance
description: This document describes optional settings that you can configure to improve the performance of your AEM forms application server.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/maintaining_the_application_server
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 6e2f3d4c-2ead-45b3-98e7-32cacc7e2985
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Enhancing application server performance{#enhancing-application-server-performance}

This content describes optional settings that you can configure to improve the performance of your AEM forms application server.

## Configuring application server data sources {#configuring-application-server-data-sources}

AEM forms uses the AEM forms repository as its data source. The AEM forms repository stores application assets and, at run time, services can retrieve assets from the repository as part of completing an automated business process.

Access to the data source can be significant, depending on the number of AEM forms modules you are running and the number of concurrent users accessing the application. Data source access can be optimized using connection pooling. *Connection pooling* is a technique used to avoid the overhead of making new database connections each time an application or server object requires access to the database. Connection pooling is usually used in web-based and enterprise applications and is usually handled by, but not limited to, an application server.

It is important to properly configure your connection pool parameters so that you never run out of connections, which can cause application performance to deteriorate.

To properly configure connection pool settings, it is important for the application server administrator to monitor the connection pool during peak hours of the day. Monitoring ensures that sufficient connections are available for applications and users at all times. Most application servers include monitoring tools.

You can monitor various statistics for each JDBC data source instance in your domain by using the WebLogic Server Administration Console. See your WebLogic documentation for details.

When the application server administrator determines the correct connection pool settings, that person must communicate this information to the database administrator. The database administrator needs this information because the number of database connections equals the number of connections in the connection pool for the data source. Then, complete the steps to configure the connection pool settings for your application server and data source type as described below.

### Configure connection pool settings for WebLogic for Oracle and MySQL {#configure-connection-pool-settings-for-weblogic-for-oracle-and-mysql}

1. Under Domain Structure, click Services &gt; JDBC &gt; Data Sources and, in the right pane, click IDP_DS.
1. On the next screen, click the Configuration &gt; Connection Pool tab, and enter a value in the following boxes:

    * Initial Capacity
    * Maximum Capacity
    * Capacity Increment
    * Statement Cache Size

1. Click Save and then click Activate Changes.
1. Restart WebLogic managed server.

### Configure connection pool settings for WebLogic for SQLServer {#configure-connection-pool-settings-for-weblogic-for-sqlserver}

1. Under Change Center, click Lock & Edit.
1. Under Domain Structure, click Services &gt; JDBC &gt; Data Sources and, in the right pane, click EDC_DS.
1. On the next screen, click the Configuration &gt; Connection Pool tab, and enter a value in the following boxes:

    * Initial Capacity
    * Maximum Capacity
    * Capacity Increment
    * Statement Cache Size

1. Click Save and then click Activate Changes.
1. Restart WebLogic managed server.

### Configure connection pool settings for WebSphere for DB2 {#configure-connection-pool-settings-for-websphere-for-db2}

1. In the navigation tree, click Resources &gt; JDBC &gt; JDBC Providers. In the right pane, click the data source you created, either DB2 Universal JDBC Driver Provider or LiveCycle - db2 - IDP_DS.
1. Under Additional Properties, click Data Sources and then select IDP_DS.
1. On the next screen, under Additional Properties, click Connection Pool Properties and enter a value in the Maximum Connections box and the Minimum Connections box.
1. Click OK or Apply, and then click Save Directly To Master Configuration.

### Configure connection pool settings for WebSphere for Oracle {#configure-connection-pool-settings-for-websphere-for-oracle}

1. In the navigation tree, click Resources &gt; JDBC &gt; JDBC Providers. In the right pane, click the Oracle JDBC Driver data source you created.
1. Under Additional Properties, click Data Sources and then select IDP_DS.
1. On the next screen, under Additional Properties, click Connection Pool Properties and enter a value in the Maximum Connections box and the Minimum Connections box.
1. Click OK or Apply, and then click Save Directly To Master Configuration.

### Configure connection pool settings for WebSphere for SqlServer {#configure-connection-pool-settings-for-websphere-for-sqlserver}

1. In the navigation tree, click Resources &gt; JDBC &gt; JDBC Providers and, in the right pane, click the User-Defined JDBC Driver data source you created.
1. Under Additional Properties, click Data Sources and then select IDP_DS.
1. On the next screen, under Additional Properties, click Connection Pool Properties and enter a value in the Maximum Connections box and the Minimum Connections box:
1. Click OK or Apply, and then click Save Directly To Master Configuration.

## Optimizing inline documents and impact on JVM memory {#optimizing-inline-documents-and-impact-on-jvm-memory}

If you are typically processing documents of a relatively small size, you can improve the performance that is associated with the document transfer speed and storage space. To do so, implement the following AEM forms product configurations:

* Increase the default document maximum inline size for AEM forms so that it is larger than the size of most documents.
* For processing larger files, specify storage directories that are on a high-speed disk system or a RAM disk.

The maximum inline size and the storage directories (the AEM forms temporary file directory and the GDS directory) are configured in the administration console.

### Document size and maximum inline size {#document-size-and-maximum-inline-size}

When a document that is sent for processing by AEM forms is less than or equal to the default document maximum inline size, the document is stored on the server inline and the document is serialized as an Adobe Document object. Storing documents inline can have significant performance benefits. However, if you are using forms workflow, the content may also be stored in the database for tracking purposes. Therefore, increasing the maximum inline size may affect the database size.

A document that is larger than the maximum inline size is stored on the local file system. The Adobe Document object that is transferred to and from the server is only a pointer to that file.

When document content is inlined (that is, less than the maximum inline size) the content is stored in the database as part of the document's serialization payload. Therefore, increasing the maximum inline size can affect the database size.

**Change the maximum inline size**

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

1. In administration console, click Settings &gt; Core System Settings &gt; Configurations.
1. Enter a value in the Default Document Max Inline Size box and click OK.

   >[!NOTE]
   >
   >The value of Document Max Inline Size property must be identical for AEM Forms on JEE environment and AEM Forms on OSGi bundle included AEM Forms on JEE environment. This steps updated value only for AEM Forms on JEE environment and not for AEM Forms on OSGi bundle included AEM Forms on JEE environment.

1. Restart the application server with the following system property:

   com.adobe.idp.defaultDocumentMaxInlineSize=`[value specified in Step 2]`

   >[!NOTE]
   >
   >The above-mentioned system property overrides value of Document Max Inline Size property set for AEM Forms on JEE environment and AEM Forms on OSGi bundle included AEM Forms on JEE environment.

>[!NOTE]
>
>The default maximum inline size is 65536 bytes.

### JVM maximum heap size {#jvm-maximum-heap-size}

An increase in the maximum inline size requires more memory for storing the serialized documents. Therefore, it generally also requires an increase in the JVM maximum heap size.

A heavily loaded system that is processing many documents can rapidly saturate the JVM heap memory. To avoid an OutOfMemoryError, increase the JVM maximum heap size by an amount corresponding to the size of the inline documents multiplied by the number of documents that are typically executed at any given time.

JVM maximum heap size increase = (inline documents size) x (average number of documents processed).

**Calculating the JVM maximum heap size**

In this example, the current JVM maximum heap is set to 512 MB and the maximum inline size is 64 KB. The server must be configured for the scenario where 10 jobs are run simultaneously, and each job has 9 input files and 1 result file (a total of 10 files per job and 100 files processed simultaneously). All the files are under 512 KB in size.

To store all the files inline, set the maximum inline size o at least 512 KB.

The required increase in the JVM maximum heap size is calculated using the following equation:

(512 KB) x (100) = 51200 KB, or 50 MB

The JVM maximum heap size must be increased by 50 MB for a total of 562 MB.

**Considering heap fragmentation**

Setting the size of inline documents to large values raises the risk of an OutOfMemoryError on systems that are prone to heap fragmentation. To store a document inline, the JVM heap memory must have sufficient contiguous space. Some operating systems, JVMs, and garbage collection algorithms are prone to heap fragmentation. Fragmentation decreases the amount of contiguous heap space and can lead to an OutOfMemoryError even when sufficient total free space exists.

For example, previous operations on the application server left the JVM heap in a fragmented state, and the garbage collector cannot compact the heap sufficiently to regain large blocks of free space. An OutOfMemoryError can occur even though the JVM maximum heap size was adjusted for an increase in maximum inline size.

To account for heap fragmentation, the inline document size must not be set higher than 0.1% of the total heap size. For example, a JVM maximum heap size of 512 MB can support a maximum inline size of 512 MB x 0.001 = 0.512 MB, or 512 KB.

## WebSphere Application Server enhancements {#websphere-application-server-enhancements}

This section describes settings specific to a WebSphere Application Server environment.

### Increasing the maximum memory allocated to the JVM {#increasing-the-maximum-memory-allocated-to-the-jvm}

If you are running Configuration Manager or trying to generate Enterprise JavaBeans (EJB) deploy code by using the command line utility *ejbdeploy* and an OutOfMemory error occurs, increase the amount of memory allocated to the JVM.

1. Edit the ejbdeploy script in the *[appserver root]*/deploytool/itp/ directory:

    * (Windows) `ejbdeploy.bat`
    * (Linux and UNIX) `ejbdeploy.sh`

1. Find the `-Xmx256M` parameter and change it to a higher value, such as `-Xmx1024M`.
1. Save the file.
1. Run the `ejbdeploy` command or redeploy using Configuration Manager.

## Improving Windows Server 2003 performance with LDAP {#improving-windows-server-2003-performance-with-ldap}

This content describes settings specific to a Microsoft Windows Server 2003 operating system environment.

Using connection pooling on the search connection can decrease the number of ports needed by as much as 50%. This is because that connection always uses the same credentials for a given domain, and the context and related objects are closed explicitly.

### Configure your Windows Server for connection pooling {#configure-your-windows-server-for-connection-pooling}

1. Click Start > Run to start the registry editor and, in the Open box, type `regedit` and click OK.
1. Go to the registry key `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters`
1. In the right pane of the registry editor, find the TcpTimedWaitDelay value name. If the name does not appear, select Edit &gt; New &gt; DWORD Value from the menu bar to add the name.
1. In the Name box, type `TcpTimedWaitDelay`

   >[!NOTE]
   >
   >If you do not see a flashing cursor and `New Value #` inside the box, right-click inside the right panel, select Rename and, in the Name box, type `TcpTimedWaitDelay`*.*

1. Repeat step 4 for the value names MaxUserPort, MaxHashTableSize, and MaxFreeTcbs.
1. Double-click inside the right pane to set the TcpTimedWaitDelay value. Under Base, select Decimal and, in the Value box, type `30`.
1. Double-click inside the right pane to set the MaxUserPort value. Under Base, select Decimal and, in the Value box, type `65534`.
1. Double-click inside the right pane to set the MaxHashTableSize value. Under Base, select Decimal and, in the Value box, type `65536`.
1. Double-click inside the right pane to set the MaxFreeTcbs value. Under Base, select Decimal and, in the Value box, type `16000`.

>[!NOTE]
>
>Serious problems can occur if you modify the registry incorrectly by using Registry Editor or by using another method. These problems may require that you reinstall your operating system. Modify the registry at your own risk.
