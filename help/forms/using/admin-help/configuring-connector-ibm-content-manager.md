---
title: Configuring Connector for IBM&reg; Content Manager
description: Configure the Connector for IBM&reg; Content Manager to enable communication between AEM forms and IBM&reg; Content Manager.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/connecting_to_a_content_management_system
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 50f0c963-8007-4e2a-aa73-d99b97d9a1aa
solution: Experience Manager, Experience Manager Forms
role: User, Developer
feature: Adaptive Forms
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
# Configuring Connector for IBM&reg; Content Manager{#configuring-connector-for-ibm-content-manager}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

Connector for IBM&reg; Content Manager enables communication between AEM forms and IBM&reg; Content Manager. For additional background information, see "Connectors for ECM" in [Services Reference](https://www.adobe.com/go/learn_aemforms_services_63).

## Configure the IBM&reg; Content Manager connection {#configure-the-ibm-content-manager-connection}

1. In the administration console, click Services &gt; Connector for IBM&reg; Content Manager.
1. In the Datastore Name box, enter the name of the IBM&reg; Content Manager datastore to which you want to connect. If the database is local, enter the name of the database. If the database is remote, enter its alias name.
1. In the User Name box, enter the user ID of a user who is going to connect to the IBM&reg; Content Manager datastore.
1. In the Password box, enter the user's password.
1. (Optional) In the Alias Connection String box, enter additional connection arguments. Usually, this box should be empty. For additional information, see your IBM&reg; documentation.
1. Click Save.

## Validation of service settings {#validation-of-service-settings}

If you enter an incorrect dataStore alias, user name, or password, you get the following results, depending on whether the Content Repository Connector for IBM&reg; Content Manager service is running:

* If the service is stopped, when you save the service configuration information, no error appears. However, the next time you start the service, an exception is thrown and the service does not start.
* If the service is started, when you save the service configuration information, the service attempts to validate the credential information immediately. In this case, an error occurs and the configuration information is not saved.
