---
title: Configuring Connector for IBM Content Manager
seo-title: Configuring Connector for IBM Content Manager
description: Configure the Connector for IBM Content Manager to enable communication between AEM forms and IBM Content Manager.
seo-description: Configure the Connector for IBM Content Manager to enable communication between AEM forms and IBM Content Manager.
uuid: 3d55169d-93e3-4d4e-b18b-2a3394e1de3b
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/connecting_to_a_content_management_system
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 3094b178-3b1a-46b3-8fbd-c20388afa3a7
---

# Configuring Connector for IBM Content Manager{#configuring-connector-for-ibm-content-manager}

Connector for IBM Content Manager enables communication between AEM forms and IBM Content Manager. For additional background information, see "Connectors for ECM" in [Services Reference](https://www.adobe.com/go/learn_aemforms_services_63).

## Configure the IBM Content Manager connection {#configure-the-ibm-content-manager-connection}

1. In administration console, click Services &gt; Connector for IBM Content Manager. 
1. In the Datastore Name box, enter the name of the IBM Content Manager datastore to which you want to connect. If the database is local, enter the name of the database. If the database is remote, enter its alias name.
1. In the User Name box, enter the user ID of a user who will connect to the IBM Content Manager datastore.
1. In the Password box, enter the user’s password.
1. (Optional) In the Alias Connection String box, enter additional connection arguments. In most cases, this box should be empty. For additional information, see your IBM documentation. 
1. Click Save.

## Validation of service settings {#validation-of-service-settings}

If you enter an incorrect dataStore alias, user name or password, you will get the following results, depending on whether the Content Repository Connector for IBM Content Manager service is currently running:

* If the service is stopped, when you save the service configuration information, no error appears. However, the next time you start the service, an exception will be thrown and the service will not start.
* If the service is started, when you save the service configuration information, the service attempts to validate the credential information immediately. In this case, an error occurs and the configuration information is not saved.

