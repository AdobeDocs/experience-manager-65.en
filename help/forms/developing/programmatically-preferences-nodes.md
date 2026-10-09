---
title: Programmatically managing the PreferencesNodes
description: Use the Preferences Manager Service API (Java) to programmatically manage the Preferences Nodes.
contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations
role: Developer
exl-id: 108eb249-879b-4e4f-b431-8118b8656e62
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,APIs & Integrations
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 516393bc-fa69-5e74-a04e-f7ec9ffe2c5e
    internal-label: APIs & Integrations
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Programmatically managing the Preferences Nodes {#programmatically-managing-the-preferencesnodes} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

This topic describes how you can use the Preferences Manager Service API (Java) to programmatically manage the Preferences Nodes.

You can manually change configuration settings from Administrator UI. To change the options, navigate to `Home>Settings>User Management> Configuration>Manual Configuration`. Import `config.xml` after making the changes, you would notice that all the changes except changes made at node `/Adobe/Adobe Experience Manager Forms/Config/UM persist` are lost. The preview of User Management Import and export does not support changing configuration settings for other components. Now, these changes can be made using `PreferencesManagerServiceClient` APIs.

**Summary of steps**To programmatically manage the Preferences Nodes, perform the following steps:

1. Include project files.
1. Create an PreferencesManagerService client
1. Invoke the appropriate role or permission operations

**Include project files**

Include necessary files in your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create an PreferencesManagerService client**

Before you can programmatically perform a User Management PreferencesManagerService operation, you must create a PreferencesManagerService client. With the Java API this is accomplished by creating an PreferencesManagerServiceClient object.

**Invoke the appropriate role or permission operations**

Once you have created the service client, you can then invoke the Preferences Manager operations. The service client lets you read and set permissions.
