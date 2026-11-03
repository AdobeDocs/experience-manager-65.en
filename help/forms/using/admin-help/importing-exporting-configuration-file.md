---
title: Importing and exporting the configuration file
description: Learn how to import and export the configuration file to edit server preferences or configure another AEM forms product instance.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 225dbeb5-a21c-4338-98c7-e10c32973721
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Importing and exporting the configuration file {#importing-and-exporting-the-configuration-file}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

Use the Manual Configuration page to download a copy of the configuration settings in XML format. The settings in this file control all server preferences. You can then edit the file and upload it back to the server. You can also use the file to configure another AEM forms product instance.

To avoid security risks, the bind password value for the directory server is not included in an exported configuration file. Update the password in the XML file before you import the file to a new system.

>[!NOTE]
>
>Importing the configuration file reconfigures AEM forms based on the information in the file. Only a system administrator or a professional services consultant who is familiar with the AEM forms product and XML should consider modifying the configuration file. They may need to edit the configuration file, for example, to reconfigure a corrupted setting.

**Export the configuration information**

1. In Administration Console, click Settings &gt; User Management &gt; Configuration &gt; Import And Export Configuration Files.
1. Click Export. If you are using Microsoft Internet Explorer, you are prompted to specify a location to save the file. If you are using Firefox, the file is saved on your desktop.

**Import the configuration information**

1. In Administration Console, click Settings &gt; User Management &gt; Configuration &gt; Import And Export Configuration Files.
1. Click Browse to find the configuration file, click Import, and then click OK.
