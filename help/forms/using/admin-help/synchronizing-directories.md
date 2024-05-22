---
title: Synchronizing directories

description: Learn how to synchronize the User Management database with changes to the source directory servers using manual or scheduled synchronization.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/setting_up_and_managing_domains
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: cb642289-4137-4ba7-8bde-0e458c8c94fe
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Synchronizing directories {#synchronizing-directories}

To synchronize domains, you can choose to do a manual or scheduled synchronization. A *manual synchronization* synchronizes any selected domains. A *scheduled synchronization* synchronizes all domains.

Directory synchronization is used to pull details from the directory servers that you specified in your directory settings into the User Management database. Later, you can also do a manual synchronization if changes or updates occur on the directory servers. For example, you can do a manual synchronization if users and groups are added or changes are made to a user’s account.

You can also set a daily synchronization schedule to automatically synchronize the User Management database with changes or updates to the source directory servers. However, this process uses network and server resources. Choose low-usage time periods and avoid scheduling unnecessary synchronizations that tie up system and network resources. To minimize unnecessary synchronizations, use the immediate synchronize option instead.

You can also specify whether to push user and group information into Adobe LiveCycle Content Services 9 (deprecated) when synchronizing domains.

>[!NOTE]
>
>Do not create multiple local users and groups while an LDAP directory synchronization is in progress. Attempting this process may result in errors.

>[!NOTE]
>
>If the domain synchronization process is interrupted (for example, the application server is shut down during the process), wait awhile before you attempt to synchronize the domain. To evaluate the status of synchronization, look at the state. If User Management acquired a lock before shutdown, wait 10 minutes for the lock to release after server restart. If the synchronization status is "In Progress" but synchronization is interrupted or stalled, User Management retries the synchronization after 3 minutes. After three failed attempts, User Management declares the synchronization a failure and releases the lock.

>[!NOTE]
>
>Adobe® LiveCycle® Content Services ES (Deprecated) is a content management system installed with LiveCycle. It enables users to design, manage, monitor, and optimize human-centric processes. Content Services (Deprecated) support ends on 12/31/2014. See [Adobe product lifecycle document](https://www.adobe.com/support/products/enterprise/eol/eol_matrix.html).

## Enable delta directory synchronization {#enable-delta-directory-synchronization}

Delta directory synchronization improves the efficiency of directory synchronization. When delta directory synchronization is enabled, User Management synchronizes only users and groups that have been added or updated since the last synchronization.

User Management performs the following steps when delta directory synchronization is enabled:

* Fetch all users from the directory servers but update the User Management database with only the users whose timestamp has changed.
* Fetch all groups but update the User Management database with only the groups whose timestamp has changed.
* Fetch group members only for the groups whose timestamps have changed and update the User Management database with that information.

>[!NOTE]
>
>Users and groups who were removed from the directory are not deleted from the User Management database until you perform a full directory synchronization.

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Under Delta Synch, select the check box and click Save.
1. Edit the directory settings for each of the enterprise domains that will use the delta directory synchronization feature. On the User Settings and Group Settings pages, locate the Modify Timestamp setting and enter `modify TimeStamp` as the value. For details about editing enterprise domains, see [Editing and converting existing domains](/help/forms/using/admin-help/editing-converting-existing-domains.md#editing-and-converting-existing-domains).

## Enable or disable detailed logging during synchronization {#enable-or-disable-detailed-logging-during-synchronization}

By default, User Management logs detailed statistics during the synchronization process.

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Configure Advanced System Attributes.
1. Under Synch Statistics Logging, deselect the check box to disable the detailed logging or select it to enable logging, and then click Save.

## Configure the directory synchronization retry option {#configure-the-directory-synchronization-retry-option}

You can configure User Management to periodically check for any failed directory synchronization attempts. User Management then tries to complete the failed synchronizations.

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Configure Advanced System Attributes.
1. Under Synch Finisher Cron Expression, enter a cron expression that represents the interval at which User Management retries failed synchronizations. The cron expression usage is based on the Quartz open source job-scheduling system, version 1.4.0.

   The default is 0 0/13 &ast; ? &ast; , which means the check occurs every 13 minutes.

## Manually synchronize directories {#manually-synchronize-directories}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. (Optional) To push user and group information into Content Services (Deprecated), select the Select This Option For Pushing Users And Groups Into Registered External Principal Storage Providers option. This option also applies when adding new users and groups through the Users and Groups page.
1. Select the check box for each enterprise domain to synchronize and click Sync Now.

   If you select multiple domains, the domain synchronization for all domains can be run at the same time. However, if you select the domains separately, only one domain synchronization can run at a time.

## Schedule directory synchronization {#schedule-directory-synchronization}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Schedule synchronization:

    * To enable automatic synchronization on a daily basis, under Scheduler, select Occurs. Select Daily from the list and type the time in the 24-hour format in the corresponding box. When you save your settings, this value is converted to a cron expression, which is displayed in the Cron Expression box.
    * To schedule synchronization on a particular day of the week or month, or in a particular month, select Cron Expression and type the appropriate expression in the box. For example, synchronize at 1:30 A.M. on the last Friday of the month.

The cron expression usage is based on the Quartz open source job-scheduling system, version 1.4.0.

* To turn off automatic synchronization, select Occurs and select Never from the list.
* (Optional) To push user and group information into Content Services (Deprecated), select the Select This Option For Pushing Users And Groups Into Registered External Principal Storage Providers option. This option also applies when adding new users and groups through the Users and Groups page.
* Click Save.

## Stop all directory synchronizations currently in progress {#stop-all-directory-synchronizations-currently-in-progress}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click Abort. This button is displayed only while a directory synchronization is in progress.
