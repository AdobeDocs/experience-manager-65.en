---
title: Configure advanced system attributes
description: Use the Configure Advanced System Attributes page to modify certain settings in the configuration file without the need to export, edit, and import the file.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 809af2c0-6f5c-4dd4-af48-dbf476c9ea45
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configure advanced system attributes {#configure-advanced-system-attributes}

Use the Configure Advanced System Attributes page to modify certain settings in the configuration file without the need to export, edit, and import the file. (See [Importing and exporting the configuration file](/help/forms/using/admin-help/importing-exporting-configuration-file.md#importing-and-exporting-the-configuration-file).)

1. In administration console, click **[!UICONTROL Settings > User Management > Configuration > Configure Advanced System Attributes]**.
1. (Optional) Change any of the following session attributes:

   **Session Timeout Limit (Minutes):** The amount of time, in minutes, before a user is automatically logged out of the system. By default, AEM forms components such as Workbench time out after two hours, regardless of activity or inactivity, and the user must log in again. Valid values are `1` to `1440`. The default value is `120` (2 hours). This setting updates the `SAML/Producer/assertionValidityInMinutes` entry key in the configuration file.

   >[!NOTE]
   >
   >You should not set Session Timeout Limit below 10 minutes as the system may not behave correctly. The recommended value is 10-120 (minutes).

   **Assertion Threshold (Seconds):** A buffer time to offset delays due to system time differences between AEM forms application server s in a cluster. AEM forms backdates a user's login time by the amount of time (in seconds) specified in this property. Valid values are `0` to `3600`. The default value is `60`. This setting updates the `SAML/Producer/assertionThresholdInSeconds` entry key in the configuration file.

   **Maximum Allowed Renewals of an Assertion:** The maximum number of times a user's session can be transparently renewed without requiring a login. Valid values are `0` to `9999`. A value of `0` means that assertions are not renewed. The default value is 10. This setting updates the `SAML/Producer/maxAssertionRenewalCount` entry key in the configuration file.

1. (Optional) Change any of the following directory synchronization attributes:

   **Synch Statistics Logging:** Specifies whether User Management logs detailed statistics during the synchronization process. (See [Enable or disable detailed logging during synchronization](/help/forms/using/admin-help/synchronizing-directories.md#enable-or-disable-detailed-logging-during-synchronization).)

   **Synch Finisher Cron Expression:** The interval at which User Management retries failed synchronizations. (See [Configure the directory synchronization retry option](/help/forms/using/admin-help/synchronizing-directories.md#configure-the-directory-synchronization-retry-option).)

   **Cluster Job Lock Timeout In Minutes:** Used in clustered environments. If the synchronization on one node fails and the cluster lock is not released, this value specifies the number of minutes that another node waits before forcibly acquiring the lock. The default value is `15` minutes. Valid values are `1` to `1440` minutes.

1. (Optional) Change the following attributes and then click **[!UICONTROL OK]**:

   **User Manager Event Auditing:** Select this option to enable auditing of directory synchronization events and of authentication events such as success, failure, and lockout. By default, this option is not selected unless you installed a component that requires auditing, such as Rights Management. This setting updates the `APSAuditService` entry key in the configuration file.

   **Auto Creation of Dynamic Group:** Enables the automatic creation of dynamic groups based on email domains. (See [Create a dynamic group](/help/forms/using/admin-help/creating-configuring-groups.md#create-a-dynamic-group).)

You can also revert to the original User Management settings by clicking Reload.
