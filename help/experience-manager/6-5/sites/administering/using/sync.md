---
title: User Synchronization
seo-title: User Synchronization
description: Learn about user synchronization in AEM.
seo-description: Learn about user synchronization in AEM.
uuid: 3418c921-b5f5-4111-b82b-3ec1fb830979
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
discoiquuid: 27a79bb4-c1a7-488e-889f-738c5d95300b
index: y
internal: n
snippet: y
---

# User Synchronization{#user-synchronization}

## Introduction {#introduction}

When the deployment is a [publish farm](../../../../6-5/sites/deploying/using/recommended-deploys.md#tarmk-farm), members need to be able to log in and see their data on any publish node.

Users and user groups (user data) created in the publish environment are not needed in the author environment.

Most user data created in the author environment is intended to remain in the author environment and not be copied to publish instances.

Registration and modifications made on one publish instance need to be synchronized with other publish instances in order for them to have access to the same user data.

As of AEM 6.1, when user synchronization is enabled, user data is automatically synchronized across the publish instances in the farm and are not created on author.

## Sling Distribution {#sling-distribution}

The user data, along with their [ACLs](../../../../6-5/sites/administering/using/security.md), are stored in the [Oak Core](/6-5/sites/deploying/using/platform.md), the layer below Oak JCR, and are accessed using the [Oak API](/6-5/sites/developing/using/reference-materials/javadoc/org/apache/jackrabbit/oak/api/package-tree.md). With infrequent updates, it is reasonable for user data to be synchronized with other publish instances using [Sling Content Distribution](https://github.com/apache/sling/blob/trunk/contrib/extensions/distribution/README.md) (Sling distribution).

The benefits of user sync using Sling distribution, compared to traditional replication are :

* *users*, *user profiles* and *user groups* created on publish are not created on author

* Sling distribution sets properties in jcr events, making it possible to act within publish-side event listeners without concern for infinite replication loops
* Sling distribution only sends user data to non-originating publish instances, eliminating unnecessary traffic
* [ACLs](../../../../6-5/sites/administering/using/security.md) set in the user node are included in the sychronization

>[!NOTE]
>
>If sessions are required, it is recommended to either use an SSO solution or use sticky session and have customers log in if they get switched to another publsher.

>[!CAUTION]
>
>Synchronization of the ***administrators** *group is not supported, even when user sync is enabled. Instead, a failure to 'import the diff' will be logged in the error log.
>
>Therefore, when the deployment is a publish farm, if a user is added to or removed from the ***administrators** *group, the modification must be manually made on each publish instance.

## Enable User Sync {#enable-user-sync}

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-D9FB647253FD17BE0A4C98A6@AdobeID)
Last Modified Date: 2018-01-12T05:19:07.315-0500
<p> <strong> ************ IMPORTANT - PLEASE READ **************</strong></p>
<p>All titles in this section are referenced from diagnostic code by GoURLs.</p>
<p><strong> navigate to : Tools, Operations, Diagnosis, User Sync Diagnostics</strong></p>
<p>If titles are altered, it may affect links to documentation embedded in code.</p>
<p><a href="https://jira.corp.adobe.com/browse/DOC-6923">DOC-6923 Health Checker for user sync</a></p>
<p><a href="https://wiki.corp.adobe.com/display/aemdoc/AEM+GoURLs">AEM GoURLs wiki</a> : look for URLs prefixed with <i>aem6_2_docs_usersync_enable</i></p>
-->

>[!NOTE]
>
>By default, user sync is `disabled`.
>
>Enabling user sync involves modifying *existing* OSGi configurations.
>
>No new configurations should be added as a result of enabling user sync.

User sync relies on the author environment to manage the user data distributions, even though the user data is not created on author. Much, but not all, of the configuration takes place in the author environment and each step clearly identifies whether it is to be performed on author or publish.

Following are the steps necessary to enable user synchronization, followed by a [Troubleshooting](#troubleshooting) section :

### Prerequisites {#prerequisites}

1) If users and user groups have already been created on one publisher, it is recommended to [manually sync](#manually-syncing-users-and-user-groups) the user data to all publishers prior to configuring and enabling user sync.

Once user sync is enabled, only newly created users and groups are syncrhonized.

2) Ensure the latest code has been installed :

* [AEM platform updates](https://helpx.adobe.com/experience-manager/kb/aem62-available-hotfixes.html)
* [AEM Communities updates](../../../../6-5/communities/using/deploy-communities.md#latestfeaturepack)

### 1. Apache Sling Distribution Agent - Sync Agents Factory {#apache-sling-distribution-agent-sync-agents-factory}

**Enable user sync**

* **on author**

    * sign in with administrator privileges
    * access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

        * for example, [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr)

    * locate `Apache Sling Distribution Agent - Sync Agents Factory`

        * select the existing configuration to open for edit (pencil icon)  
          Verify `name` : **`socialpubsync`**
        
        * select the `Enabled` checkbox
        * select `Save`

** **

![](assets/chlimage_1-5.png)

### 2. Create Authorized User {#createauthuser}

**Configure permissions** 
This authorized user will be used in step 3 to configure Sling distribution on author.

* **on each publish instance**

    * sign in with administrator privileges
    * access the [Security Console](../../../../6-5/sites/administering/using/security.md)

        * for example, [http://localhost:4503/useradmin](http://localhost:4503/useradmin)

    * create a new user

        * for example, `usersync-admin`

    * add this user to the **`administrators`** user group
    * [add ACL for this user to /home](#howtoaddacl)

        * `Allow jcr:all` with restriction `rep:glob=*/activities/*`

>[!CAUTION]
>
>A new user must be created.
>
>* The default user assigned is **`admin`**.
>* Do not use `*communities-user-admin *user*.*`
>

#### How to Add ACL {#addacls}

* access CRXDE Lite

    * for example, [http://localhost:4503/crx/de](http://localhost:4503/crx/de)

* select `/home` node
* in right pane, select the `Access Control` tab
* select the `+` button to add an ACL entry

    * **Principal**: *search for user created for user sync*
    
    * **Type**: `Allow`
    
    * **Privileges**: `jcr:all`
    
    * **Restrictions** rep:glob: `*/activities/*`
    
    * select **OK**

* select **Save All**
*

![](assets/chlimage_1-6.png)

See also

* [Access Right Management](../../../../6-5/sites/administering/using/user-group-ac-admin.md#access-right-management)
* Troubleshooting section [Modify Operation Exception During Response Processing](#modify-operation-exception-during-response-processing).

### 3. Apache Sling Distribution Transport Credentials - User Credentials based DistributionTransportSecretProvider {#adobegraniteencpasswrd}

**Configure permissions**

Once an authorized user, a member of the **`administrators`**user group, has been created on all publish instances, that authorized user must be identified on author as having permission to sync user data from author to publish.

* **on author**

    * sign in with administrator privileges
    * access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

        * for example, [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr)

    * locate `Apache Sling Distribution Transport Credentials - User Credentials based DistributionTransportSecretProvider`
    * select the existing configuration to open for edit (pencil icon)  
      Verify `property name` : **`socialpubsync-publishUser`**
    
    * set the username and password to the [authorized user](#createauthorizeduser) created on publish in step 2

        * for example, `usersync-admin`

![](assets/chlimage_1-7.png)

### 4. Apache Sling Distribution Agent - Queue Agents Factory {#apache-sling-distribution-agent-queue-agents-factory}

**Enable user sync**

* **on publish** :

    * sign in with administrator privileges
    * access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

        * for example, [http://localhost:4503/system/console/configMgr](http://localhost:4503/system/console/configMgr)

    * locate `Apache Sling Distribution Agent - Queue Agents Factory`

        * select the existing configuration to open for edit (pencil icon)  
          Verify `Name` : `socialpubsync-reverse`
        
        * select the `Enabled` checkbox
        * select `Save`

    * **repeat **for each publish instance

![](assets/chlimage_1-8.png)

### 5. Adobe Social Sync - Diff Observer Factory {#diffobserver}

**Enable group sync**

* **on each publish instance** :

    * sign in with administrator privileges
    * access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

        * for example, [http://localhost:4503/system/console/configMgr](http://localhost:4503/system/console/configMgr)

    * locate **`Adobe Social Sync - Diff Observer Factory`**

        * select the existing configuration to open for edit (pencil icon)  
          Verify `agent name` : `socialpubsync-reverse`
        
        * select the `Enabled` checkbox
        * select `Save`

![](assets/screen-shot_2019-05-24at090809.png)

### 6. Apache Sling Distribution Trigger - Scheduled Triggers Factory {#apache-sling-distribution-trigger-scheduled-triggers-factory}

**(Optional) modify polling interval**

By default, author will poll for changes every 30 seconds. To alter this interval :

* **on author**

    * sign in with administrator privileges
    * access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

        * for example, [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr)

    * locate `Apache Sling Distribution Trigger - Scheduled Triggers Factory`

        * select the existing configuration to open for edit (pencil icon)

            * Verify `Name` : `socialpubsync-scheduled-trigger`

        * set the `Interval in Seconds` to the desired interval
        * select `Save`

![](assets/chlimage_1-9.png)

## Configure for Multiple Publish Instances {#configure-for-multiple-publish-instances}

<!--
Comment Type: remark
Last Modified By: unknown unknown (ims-author-D9FB647253FD17BE0A4C98A6@AdobeID)
Last Modified Date: 2018-01-12T05:19:08.155-0500
<p> <strong> ************ IMPORTANT - PLEASE READ **************</strong></p>
<p>All titles in this section are referenced from diagnostic code by GoURLs.</p>
<p><strong> navigate to : Tools, Operations, Diagnosis, User Sync Diagnostics</strong></p>
<p>If titles are altered, it may affect links to documentation embedded in code.</p>
<p><a href="https://jira.corp.adobe.com/browse/DOC-6923">DOC-6923 Health Checker for user sync</a></p>
<p><a href="https://wiki.corp.adobe.com/display/aemdoc/AEM+GoURLs">AEM GoURLs wiki</a> : look for URLs prefixed with <i>aem6_2_docs_usersync_multpub</i></p>
-->

The default configuration is for a single publish instance. As the reason for enabling user sync is to synchronize multiple publish instances, such as for a publish farm, the additional publish instances will need to be added to the Sync Agents Factory.

### 7. Apache Sling Distribution Agent - Sync Agents Factory {#apache-sling-distribution-agent-sync-agents-factory-1}

**Add Publish Instances :**

* **on author**

    * sign in with administrator privileges
    * access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

        * for example, [http://localhost:4502/system/console/configMgr](http://localhost:4502/system/console/configMgr)

    * locate `Apache Sling Distribution Agent - Sync Agents Factory`

        * select the existing configuration to open for edit (pencil icon)  
          Verify `Name` : `socialpubsync`

![](assets/chlimage_1-10.png)

* **Exporter Endpoints** 
  There should be an exporter endpoint for each publisher. For example, if there are 2 publishers, localhost:4503 and 4504, there should be 2 entries:

    * http://localhost:4503/libs/sling/distribution/services/exporters/socialpubsync-reverse
    * http://localhost:4504/libs/sling/distribution/services/exporters/socialpubsync-reverse

* **Importer Endpoints** 
  There should be an importer endpoint for each publisher. For example, if there are 2 publishers, localhost:4503 and 4504, there should be 2 entries:

    * http://localhost:4503/libs/sling/distribution/services/importers/socialpubsync
    * http://localhost:4504/libs/sling/distribution/services/importers/socialpubsync

* select `Save`

### 8. AEM Communities User Sync Listener {#aem-communities-user-sync-listener}

**(Optional) Sync additional JCR nodes**

If there is custom data that is desired to be synchronized across multiple publish instances, then :

* **on each publish instance** :

    * sign in with administrator privileges
    * access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

        * for example, [http://localhost:4503/system/console/configMgr](http://localhost:4503/system/console/configMgr)

    * locate `AEM Communities User Sync Listener`
    * select the existing configuration to open for edit (pencil icon)  
      Verify `Name` : `socialpubsync-scheduled-trigger`

![](assets/chlimage_1-11.png)

* **Node Types** 
  This is the list of node types that will synchronize. Any node type other than sling:Folder needs to be listed here (sling:folder is handled separately).  
  Default list of node types to synchronize :

    * rep:User
    * nt:unstructured
    * nt:resource

* **Ignorable Properties** 
  This is the list of properties that will be ignored if any change is detected. Changes to these properties might get synchronized as a side effect of other changes (since synchronization is always at the node level), but changes to these properties will not by themselves trigger synchronization.  
  Default property to ignore :

    * cq:lastModified

* **Ignorable Nodes** 
  Subpaths that will be entirely ignored during synchronization. Nothing under these subpaths will be synchronized at any time.  
  Default nodes to ignore :

    * .tokens
    * system

* **Distributed Folders** 
  Most sling:Folders are ignored because synchronization is not necessary. The few exceptions are listed here.  
  Default folders to synchronize

    * segments/scoring
    * social/relationships
    * activities

### 9. Unique Sling ID {#unique-sling-id}

>[!CAUTION]
>
>If the Sling ID matches between two or more publish instances then user group sync will fail.

If the Sling ID is the same for multiple publish instances in a publish farm, then user groups will not be synchronized.

To validate that all Sling ID values differ, on each publish instance :

1. browse to [http://*host:port*/system/console/status-slingsettings](http://localhost:4503/system/console/status-slingsettings)
1. check the value of **Sling ID**

![](assets/chlimage_1-12.png)

If the Sling ID of a publish instance matches the Sling ID of any other publish instance, then :

1. stop one of the publish instances that has a matching Sling ID
1. in the crx-quickstart/launchpad/felix directory

    * search for and delete the file named *sling.id.file*

        * for example, on a Linux system:  
          `rm -i $(find . -type f -name sling.id.file)`
        
        * for example, on a Windows system:  
          `use windows explorer and search for *sling.id.file*`

1. start the publish instance

    * on startup it will be assigned a new Sling ID

1. validate that the **Sling ID** is now unique

Repeat these steps until all publish instances have an unique Sling ID.

## Vault Package Builder Factory {#vault-package-builder-factory}

In order for updates to sync properly, it is necessary to modify the vault package builder for user sync :

* on each AEM publish instance
* access the [Web Console](/6-5/sites/deploying/using/configuring-osgi.md)

    * for example, [http://localhost:4503/system/console/configMgr](http://localhost:4503/system/console/configMgr)

* locate the `Apache Sling Distribution Packaging - Vault Package Builder Factory`

    * `Builder name: socialpubsync-vlt`

* select the edit icon
* add two `Package Node Filters`:

    * `/home/users|-.*/.tokens`
    * `/home/users|-.*/rep:cache`

* policy handling :

    * to overwrite existing rep:policy nodes with new ones, add a third Package Filter :

        * `/home/users|+.*/rep:policy`

    * to prevent policies from being distributed, set

        * `Acl Handling :` `IGNORE`

![Vault Package Builder Factory](assets/vault-package-builder-factory.png)

## What Happens When ... {#what-happens-when}

### User Self-Registers or Edits Profile on Publish {#user-self-registers-or-edits-profile-on-publish}

By design, users and profiles created in the publish environment (self-registration) do not appear in the author environment.

When the topology is a [publish farm](../../../../6-5/sites/deploying/using/recommended-deploys.md#tarmk-farm) and user sync has been correctly configured, the *user *and *user profile* is synchronized across the publish farm using Sling distribution.

### Users or User Groups are Created Using Security Console {#users-or-user-groups-are-created-using-security-console}

By design, user data created in the publish environment does not appear in the author environment and vice versa.

When the [User Administration and Security](../../../../6-5/sites/administering/using/security.md) console is used to add new users in the publish environment, user sync will synchronize the new users and their group membership to other publish instances, if necessary. User sync will also synchronize user groups created through the security console.

## Troubleshooting {#troubleshooting}

### How to Take User Sync Offline {#how-to-take-user-sync-offline}

To take user sync offine, in order to [remove a publisher](#how-to-remove-a-publisher) or [manually sync data](#manually-syncing-users-and-user-groups), the distribution queue must be empty and quiet.

To check the state of the distribution queue :

* on author :

    * using [CRXDE Lite](../../../../6-5/sites/developing/using/developing-with-crxde-lite.md)

        * look for entries in `/var/sling/distribution/packages`

            * folder nodes named with the pattern `distrpackage_*`

    * using [Package Manager](../../../../6-5/sites/administering/using/package-manager.md)

        * look for pending packages (not yet installed)

            * named with the pattern `socialpubsync-vlt*`
            * created by `communities-user-admin`

When the distribution queue is empty, disable user sync :

* on author

    * *uncheck *the `Enabled` checkbox for [Apache Sling Distribution Agent - Sync Agents Factory](#apache-sling-distribution-agent-sync-agents-factory)

Once tasks are completed, to re-enable user sync :

* on author

    * check the `Enabled` checkbox for [Apache Sling Distribution Agent - Sync Agents Factory](#apache-sling-distribution-agent-sync-agents-factory)

### User Sync Diagnostics {#user-sync-diagnostics}

User Sync Diagnostics is a tool that checks the configuration and attempts to identify any problems.

On author, simply navigate from the main console through **Tools, Operations, Diagnosis, User Sync Diagnostics.**

Simply entering the User Sync Diagnostics console will display the results.

This is what is displayed when User Synchronization has not been enabled :

![](assets/chlimage_1-13.png)

#### How To Run Diagnostics for Publishers {#how-to-run-diagnostics-for-publishers}

When the diagnoistic is run from the author environment, the pass/fail results will include an [INFO] section displaying the list of configured publish instances for confirmation.

Included in the list is an URL for each publish instance that will run the diagnostics for that instance. The url param `syncUser` is appended to the diagnostics URL with its value set to the *authorized sync user* created in [Step 2](../../../../6-5/sites/administering/using/sync.md#2createauthorizeduser).

**Note** : before launching the URL, the *authorized sync user* must already be signed into that publish instance.

![](assets/chlimage_1-14.png)

### Configuration Improperly Added {#configuration-improperly-added}

When user sync fails to work, the most common problem is that additional configurations were *added*. Instead, the *existing *default configuration should have been *edited*.

Following are views of how the edited, default configurations should appear in the Web Console. If more than the one instance appears, the added configuration should be removed.

#### (author) One Apache Sling Distribution Agent - Sync Agents Factory {#author-one-apache-sling-distribution-agent-sync-agents-factory}

![](assets/chlimage_1-15.png)

#### (author) One Apache Sling Distribution Transport Credentials - User Credentials based DistributionTransportSecretProvider {#author-one-apache-sling-distribution-transport-credentials-user-credentials-based-distributiontransportsecretprovider}

![](assets/chlimage_1-16.png)

#### (publish) One Apache Sling Distribution Agent - Queue Agents Factory {#publish-one-apache-sling-distribution-agent-queue-agents-factory}

![](assets/chlimage_1-17.png)

#### (publish) One Adobe Social Sync - Diff Observer Factory {#publish-one-adobe-social-sync-diff-observer-factory}

![](assets/chlimage_1-18.png)

#### (author) One Apache Sling Distribution Trigger - Scheduled Triggers Factory {#author-one-apache-sling-distribution-trigger-scheduled-triggers-factory}

![](assets/chlimage_1-19.png)

### Modify Operation Exception During Response Processing {#modify-operation-exception-during-response-processing}

If the following is visible in the log :

`org.apache.sling.servlets.post.impl.operations.ModifyOperation Exception during response processing.`

`java.lang.IllegalStateException: This tree does not exist`

Then verify that the section [2. Create Authorized User](/content/docs/en/aem/6-1/administer/security/security/sync.md#2. create authorized user) was properly followed.

This section describes creating an authorized user, who exists on all publish instances, and identifying them in the 'Secret Provider' OSGi config on author. By default, the user is `admin`.

The authorized user should be made a member of the **`administrators`** user group and permissions for that group should not be altered.

The authorized user should explicitly have the following privileges and restriction on all publish instances :

| **path** |**jcr:all** |**rep:glob** |
|---|---|---|
| /home |X |&#42;/activities/&#42; |
| /home/users |X |&#42;/activities/&#42; |
| /home/groups |X |&#42;/activities/&#42; |

As a member of the `administrators` group, the authorized user should have the following privileges on all publish instances :

| **path** |**jcr:all** |**jcr:read** |**rep:write** |
|---|---|---|---|
| /etc/packages/sling/distribution |  |  |X |
| /libs/sling/distribution |  |X |  |
| /var |  |  |X |
| /var/eventing |  |X |X |
| /var/sling/distribution |  |X |X |

### User Group Sync Failed {#user-group-sync-failed}

If the Sling ID matches between two or more publish instances then user group sync will fail.

See section [9. Unique Sling ID](#unique-sling-id)

### Manually Syncing Users and User Groups {#manually-syncing-users-and-user-groups}

* on publisher on which users and user groups exist :

    * [if enabled, disable user sync](#how-to-take-user-sync-offline)
    * [create a package](../../../../6-5/sites/administering/using/package-manager.md#creating-a-new-package) of `/home`

        * when editing the package

            * Filters tab : Add Filter : Root path: `/home`
            * Advanced tab : AC Handling : `Overwrite`

    * [export the package](../../../../6-5/sites/administering/using/package-manager.md#downloading-packages-to-your-file-system)

* on other publish instances :

    * [import the package](../../../../6-5/sites/administering/using/package-manager.md#installingpackages)

To configure or enable user sync, go to step 1: [Apache Sling Distribution Agent - Sync Agents Factory](#apache-sling-distribution-agent-sync-agents-factory)

### When a Publisher Becomes Unavailable {#when-a-publisher-becomes-unavailable}

When a publish instance becomes unavailable, it should not be removed if it will be back online in the future. Changes will queue up for the publisher, and once it is back online, the changes will be processed.

If the publish instance will never be back online, if it is offline permanently, then it must be removed because the queue buildup will result in noticeable disk space usage in the author environment.

When a publisher is down, the author log will have exceptions similar to :

```
28.01.2016 15:57:48.475 ERROR
 [pool-12-thread-34-org_apache_sling_distribution_queue_socialpubsync_endpoint1
 (org/apache/sling/distribution/queue/socialpubsync/endpoint1)]
 org.apache.sling.distribution.agent.impl.SimpleDistributionAgent [agent][socialpubsync] could not deliver package distrpackage_1454014575838_a2b45ec8-0400-42f3-bed8-ae09b66381cb
 org.apache.sling.distribution.packaging.DistributionPackageImportException: failed in importing package ...
```

### How To Remove a Publisher {#how-to-remove-a-publisher}

To remove a publisher from the [Apache Sling Distribution Agent - Sync Agents Factory](#apache-sling-distribution-agent-sync-agents-factory), the distribution queue must be empty and quiet.

* on author :

    * [Take user sync offline](#how-to-take-user-sync-offline)
    * follow [step 7](#apache-sling-distribution-agent-sync-agents-factory) to remove the publisher from both server lists :

        * `Exporter Endpoints`
        * `Importer Endpoints`

    * re-enable user sync

        * check the `Enabled` checkbox for [Apache Sling Distribution Agent - Sync Agents Factory](#apache-sling-distribution-agent-sync-agents-factory)

