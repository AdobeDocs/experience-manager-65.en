---
title: Starting and stopping services
description: Learn how to start and stop services associated with AEM Forms modules and the application server and database.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_services
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 55bf5196-22c6-4286-8c92-ff44d81dde49
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
# Starting and stopping services {#starting-and-stopping-services}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

There are two types of services that are part of AEM forms:

* Services that control the AEM forms application server and database.
* Services that control AEM forms modules

## Start or stop the services associated with AEM forms modules {#start-or-stop-the-services-associated-with-aem-forms-modules}

AEM forms modules (for example, Forms, Rights Management, Output) operate as services. At times, you may need to stop or start the services for these AEM forms modules. For example, you must stop and then restart an AEM forms service after you change a setting for the service.

>[!NOTE]
>
> It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

1. In administration console click **Services** &gt; **Applications and Services** &gt; **Service Management**.
1. On the Service Management page, select the check box beside the service to stop or start and click Stop or Start.

## Start or stop services for the application server and database {#start-or-stop-services-for-the-application-server-and-database}

A complete implementation of AEM forms includes an application server and database services:

* *`[application server]`* for AEM forms
* *`[database]`* for AEM forms

On Windows, these services are accessible through the **Administrative Tools** &gt; **Services panel**. For example, if you installed AEM forms on JBoss by using the turnkey method, the following services are available on your system:

* JBoss for Adobe Experience Manager forms
* MySQL for Adobe Experience Manager forms

Start or stop these services by selecting them from the list on the Services panel and then clicking the appropriate action button on the panel.

On UNIX&reg; or Linux, enter the following text from a command line, where *`[service name]`* is the name of the service you are verifying:

```java
     ps -A | grep [service name]
```
