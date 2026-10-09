---
title: Configuring Acrobat Reader DC Extensions for data capture
description: Learn how to configure Acrobat Reader DC Extensions for data capture.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_acrobat_reader_dc_extensions
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 0f8e1e46-4fc5-43f6-abb1-19a3f20e1f1d
solution: Experience Manager, Experience Manager Forms
role: User, Developer
feature: Adaptive Forms,Document Services,Reader Extensions
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 621ad6f8-3769-57bb-838c-1d26cfb18d50
    internal-label: Reader Extensions
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
  - id: f19cff18-c8cc-4a4b-adad-85dd2fa3dbe2
    internal-label: Document Services
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Configuring Acrobat Reader DC Extensions for data capture {#configuring-acrobat-reader-dc-extensions-for-data-capture}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

If users of your AEM forms installation use the data capture functionality of Content Services (Deprecated), it is recommended that you create a role with read-only access for these users.

***Note**: Adobe&reg; LiveCycle&reg; Content Services ES (Deprecated) is a content management system installed with LiveCycle. It enables users to design, manage, monitor, and optimize human-centric processes. Content Services (Deprecated) support ends on 12/31/2014. See [Adobe product lifecycle document](https://helpx.adobe.com/support/programs/eol-matrix.html).*

Data capture requires that you assign a user role to access the SampleReaderExtensionsCredential. You may assign the standard Trust Administrator role. However, consider that this role gives general, non-administrative users administrator privileges that control the PKI Trust settings and manage PKI Credentials, which could compromise the security of your AEM forms installation in a production environment. It is recommended that the AEM forms system administrator create a role that grants only read-only access to the Trust Store, and assign this new role to non-administrator users who use data capture.

## Create a role for data capture users {#create-a-role-for-data-capture-users}

1. In the administration console, click Settings &gt; User Management &gt; Role Management, and then click New Role.
1. Enter the role name (for example, Data Capture User) and description in the appropriate fields, then click Next.
1. On the Role Permissions screen, click Find Permissions, then select Credential Read from the list of available permissions.
1. Click OK, then click Finish.

## Assign the data capture role {#assign-the-data-capture-role}

1. In the administration console, click Settings &gt; User Management &gt; Role Management, and then click Find.
1. Click the data capture user role that you created.
1. On the Role Users/Groups tab, click Find Users/Groups.
1. On the Find Users and Groups screen, click Find, select the users who require the data capture user role, then click OK.
1. On the Edit Role screen, click Save.
