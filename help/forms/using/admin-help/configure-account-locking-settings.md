---
title: Configure account-locking settings
description: Use the Enable Account Locking option to lock user accounts after a specified number of consecutive authentication failures.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/setting_up_and_managing_domains
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: eb8c748d-51d9-4684-97c5-e982ad84ba9f
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configure account-locking settings {#configure-account-locking-settings}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

When you add a domain, specify whether to enable account locking. When the Enable Account Locking option is selected, user accounts are locked after a specified number of consecutive authentication failures. After a specified length of time, the user can attempt to authenticate again. This feature prevents users from trying various credential combinations to access the system.

Use settings on the Domain Management page to specify the maximum number of authentication failures and the length of time that accounts are locked. These settings apply to all domains that have account locking enabled.

1. In administration console, click **[!UICONTROL Settings > User Management > Domain Management]**.
1. In the Maximum Consecutive Authentication Failures box, enter the number of consecutive times a user can unsuccessfully attempt to log in before their account is locked. The default value is 20.
1. In the Unlock The Account After (Minutes) box, enter the number of minutes that the user account is locked. After the specified number of minutes, the user can attempt to log in again. The default value is 30.
1. Click **[!UICONTROL Save]**.
