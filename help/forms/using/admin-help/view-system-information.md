---
title: View system information
description: Learn how you can view resource monitoring charts and information about the server that is running AEM forms.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/health_monitor
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 27a2e81c-47b0-4de8-95bd-7cb34b9450da
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# View system information {#view-system-information}

The System tab displays resource monitoring charts and information about the server that is running AEM forms. To access this information, in administration console, click Health Monitor in the upper-right corner of the page. If you are running AEM forms in a clustered environment, the information displayed is for the node selected from the Server list.

To save the current system information as a properties file, click Save.

The right pane of the System tab displays graphical representations of the following information:

* Job and Work Count items
* Heap and Committed Heap usage
* Non Heap and Committed Non Heap usage

You can drag your pointer along the timeline to get values for a particular point in time.

>[!NOTE]
>
>The graph data, server information values, and clock time are updated every 10 minutes. The information is not displayed in real time.

The left pane of the System tab displays the following information about the server or node:

**Virtual Machine:** Java Virtual Machine (JVM) version on the server.

**Virtual Machine Vendor:** Manufacturer of the JVM.

**Virtual Machine Version:** JVM version number

**Machine Name:** Host name of the server where AEM forms is installed.

**Up Time:** The time, in hours and minutes, that the server has been running.

**Just-In-Time Compiler:** The name of the compiler being used.

**Compile Time:** The amount of time spent in compile.

**Number of Live Threads:** The total number of threads currently present in the AEM forms system.

**Number of Threads Peak:** Largest number of live threads ever recorded on the system.

**Number of Loaded Classes:** Number of classes Loaded into the JVM.

**Number of Unloaded Classes:** Number of classes Unloaded from the JVM.

**Minimum Heap:** The minimum amount of heap that was used.

**Maximum Heap:** The maximum amount of heap that was used.

**Operating System Name:** The name of the operating system running on the AEM Forms Server.

**Operating System Version:** Version number of the operating system running on the AEM Forms Server.

**Operating System Arch:** The operating system architecture that the JVM is running on.

**Number of Processors:** The number of processors on the system.

**Virtual Machine Arguments:** The argument used by the JVM.

**Class Path:** The class path used by the JVM.

**Library Path:** The library path used by the JVM.

**Boot Class Path:** The boot class path used by the JVM.

**Application Server Type:** Type of application server used to run AEM forms.

**Application Server Version:** Version number of the application server used to run AEM forms.

**Application Server Vendor:** Manufacturer of the application server used to run AEM forms.

**Installation Date:** Date (in yyyy-mm-dd format) that AEM forms was installed.

**AEM forms Version:** Version of AEM forms that is installed.

**Patch Version:** AEM forms patch number.

**Database Name:** Type of database used by AEM forms.

**Database Version:** Version number of the database used by AEM forms.

**Database Drive Name:** The name of the driver used by the JVM to connect to the database.

**Database Driver Version:** The version of the driver used by the JVM to connect to the database.

The **Save** button lets you save this system information in a property file.
