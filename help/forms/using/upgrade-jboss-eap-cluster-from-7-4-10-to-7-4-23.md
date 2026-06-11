---
title: Upgrade JBoss EAP cluster from 7.4.10 to 7.4.23 for AEM Forms on JEE
description: Additional steps to upgrade a JBoss EAP cluster from 7.4.10 to 7.4.23 for AEM Forms on JEE.
SEO Description: Additional cluster upgrade steps for JBoss EAP 7.4.10 to 7.4.23 on AEM Forms on JEE.
exl-id: 2c9e7f41-a8d6-4b03-8e5c-1a4f6d9e0b72
solution: Experience Manager, Experience Manager Forms
feature: AEM Forms on JEE
role: User, Developer
---
# Upgrade JBoss EAP cluster from 7.4.10 to 7.4.23 for AEM Forms on JEE {#upgrade-jboss-eap-cluster-from-7-4-10-to-7-4-23}

## Overview {#overview}

When you upgrade a JBoss EAP cluster from version 7.4.10 to 7.4.23 for AEM Forms on JEE, additional configuration is required beyond the standalone upgrade steps. Cluster-specific settings such as cache locators, master-slave authentication, host bindings, and domain controller configuration must be updated on the new JBoss installation.

## Applies to {#applies-to}

This article applies to: 

* AEM Forms on JEE running on JBoss EAP 7.4.10 in a cluster environment
* Master-slave JBoss EAP configurations on Windows and Linux 

## Prerequisites {#prerequisites}

Complete all steps in [Upgrade JBoss EAP from 7.4.10 to 7.4.23 for AEM Forms on JEE](/help/forms/using/upgrade-jboss-eap-from-7-4-10-to-7-4-23.md), including copying the connection URL, username, and password from the existing installation to the new configuration files. 

## Steps {#steps}

Perform the following additional cluster-specific steps:

### Update domain.conf.bat {#update-domain-conf-bat}

1. In your `domain.conf.bat`, add the locators information from your existing setup to the new file:

   ```text
   set "JAVA_OPTS=%JAVA_OPTS% -Doak.documentMK.maxServerTimeDiffMillis=-1"
   set "JAVA_OPTS=%JAVA_OPTS% -Dadobe.cache.cluster-locators=<ip-address-master>[22345],<ip-address-slave>[22345]"
   set "JAVA_OPTS=%JAVA_OPTS% -DentityExpansionLimit=10000"
   ```

### Configure master-slave authentication {#configure-master-slave-authentication}

1. Create a new user for master-slave authentication on the master node.
1. On the slave nodes, update the user password in `host.xml`:

   ```xml
   <server-identities>
       <secret value="Y2hhbmdlaXQ="/>
   </server-identities>
   ```

### Update IP addresses in host.xml {#update-ip-addresses-in-host-xml}

1. Update the IP addresses for both master and slave nodes in `host.xml`:

   ```xml
   <interfaces>
       <interface name="management">
           <inet-address value="${jboss.bind.address.management:<ip-address>}"/>
       </interface>
       <interface name="public">
           <inet-address value="${jboss.bind.address:<ip-address>}"/>
       </interface>
   </interfaces>
   ```

### Remove deployments from domain configuration {#remove-deployments-from-domain-configuration}

1. Ensure that there is no `<deployments>` section in the new `domain_<db>.xml` file.
1. Do not copy the following block from the existing configuration:

   ```xml
   <deployments>
       <deployment name="adobe-forms-ivs-jboss.ear" runtime-name="adobe-forms-ivs-jboss.ear"/>
       <deployment name="adobe-livecycle-cq-author.ear" runtime-name="adobe-livecycle-cq-author.ear"/>
       <deployment name="adobe-livecycle-jboss.ear" runtime-name="adobe-livecycle-jboss.ear"/>
       <deployment name="adobe-livecycle-native-jboss-x86_win32.ear" runtime-name="adobe-livecycle-native-jboss-x86_win32.ear"/>
       <deployment name="adobe-livecycle-native-jboss-x86_win64.ear" runtime-name="adobe-livecycle-native-jboss-x86_win64.ear"/>
       <deployment name="adobe-output-ivs-jboss.ear" runtime-name="adobe-output-ivs-jboss.ear"/>
       <deployment name="adobe-workspace-client.ear" runtime-name="adobe-workspace-client.ear"/>
   </deployments>
   ```

### Update driver class in domain configuration {#update-driver-class-in-domain-configuration}

1. Update the driver class section in `domain_<db>.xml` based on your database engine:

   **MSSQL:**

   ```xml
   <xa-datasource-class>com.microsoft.sqlserver.jdbc.SQLServerXADataSource</xa-datasource-class>
   ```

   **Oracle:**

   ```xml
   <xa-datasource-class>oracle.jdbc.xa.client.OracleXADataSource</xa-datasource-class>
   ```

### Update domain controller on slave nodes {#update-domain-controller-on-slave-nodes}

1. Update the domain controller block on the slave node in `host.xml` with the master IP address, port `9999`, username `slave1`, and realm `ManagementRealm`:

   ```xml
   <remote host="<ip-address>" port="9999" username="slave1" realm="ManagementRealm"/>
   ```

### Update jboss-cli.xml {#update-jboss-cli-xml}

1. Update the `<host>` entry in `jboss-cli.xml` on both the master and slave nodes.
