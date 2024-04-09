---
title: Configure the Admin Password on Installation
description: Learn how to change the Admin Password on Adobe Experience Manager Installation.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
exl-id: b55ff9d5-8139-4ecf-ba09-5cf88207c5c4
solution: Experience Manager, Experience Manager Sites
feature: Security
role: Admin
---
# Configure the Admin Password on Installation{#configure-the-admin-password-on-installation}

## Overview {#overview}

Since version 6.3, Adobe Experience Manager (AEM) allows the admin password to be set using the command line when installing a new instance.

With earlier versions of AEM, the password for the admin account, along with the password for various other consoles had to be changed after installation.

This feature adds the facility of setting a new administrator password for the repository and the Servlet Engine during the installation of an AEM instance, thus eliminating the need to do it manually afterwards.

>[!CAUTION]
>
>Feature does not cover the Felix Console, for which the password must be changed manually. For more information, see the relevant [Security Checklist section](/help/sites-administering/security-checklist.md#change-default-passwords-for-the-aem-and-osgi-console-admin-accounts).

## How Do I Use It? {#how-do-i-use-it}

This feature triggers automatically if you choose to install AEM by way of the command line, as opposed to double-clicking the JAR from a filesystem explorer.

The general syntax for running an AEM instance from the command line is:

```shell
java -jar aem6.3.jar
```

After running the instance from the command line, you are presented with the option to change the admin password during the installation process:

![chlimage_1-116](assets/chlimage_1-116a.png)

>[!NOTE]
>
>The prompt to change the admin password only appears during the installation of a new AEM instance.

## Using the -nointeractive Flag {#using-the-nointeractive-flag}

You can also choose to specify the password from a properties file. This is done by using the `-nointeractive` flag combined with the `-Dadmin.password.file` system property.

Below is an example:

```shell
java -Dadmin.password.file =/path/to/passwordfile.properties -jar aem6.3.jar -nointeractive
```

The password inside the `passwordfile.properties` file must have the below format:

```xml
admin.password = 12345678
```

>[!NOTE]
>
>If you simply use the `-nointeractive` parameter without the `-Dadmin.password.file` system property, AEM uses the default admin password without asking you to change it, essentially replicating behavior from earlier versions. This non-interactive mode can be used for automated installations using the command line in an installation script.
