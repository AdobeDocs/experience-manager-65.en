---
title: Configure the Admin Password on Installation
seo-title: Configure the Admin Password on Installation
description: Learn how to change the Admin Password on AEM Installation.
seo-description: Learn how to change the Admin Password on AEM Installation.
uuid: 06da9890-ed63-4fb6-88d5-fd0e16bc4ceb
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: Security
content-type: reference
discoiquuid: 00806e6e-3578-4caa-bafa-064f200a871f
---

# Configure the Admin Password on Installation{#configure-the-admin-password-on-installation}

## Overview {#overview}

Since version 6.3, AEM allows the admin password to be set using the command line when installing a new instance.

With earlier versions of AEM, the password for the admin account, along with the password for various other consoles had to be changed after installation.

This feature adds the facility of setting a new administrator password for the repository and the Servlet Engine during the installation of an AEM instance, thus eliminating the need to do it manually afterwards.

>[!CAUTION]
>
>Please note that feature does not cover the Felix Console, for which the password needs to be changed manually. For more information, see the relevant [Security Checklist section](/help/sites-administering/security-checklist.md#change-default-passwords-for-the-aem-and-osgi-console-admin-accounts).

## How Do I Use It? {#how-do-i-use-it}

This feature will trigger automatically if you choose to install AEM via the command line, as opposed to double clicking the JAR from a filesystem explorer.

The general synthax for running an AEM instance from the command line is:

```shell
java -jar aem6.3.jar
```

Upon running the instance from the command line, you will be presented with the option to change the admin password during the installation process:

![chlimage_1-116](assets/chlimage_1-116.png)

>[!NOTE]
>
>The prompt to change the admin password will only appear during the installation of a new AEM instance.

## Using the -nointeractive Flag {#using-the-nointeractive-flag}

You can also choose to specify the password from a properties file. This is done by using the `-nointeractive` flag combined with the the `-Dadmin.password.file` system property.

Below is an example:

```shell
java -Dadmin.password.file =/path/to/passwordfile.properties -jar aem6.3.jar -nointeractive
```

The password inside the `passwordfile.properties` file needs to have the below format:

```xml
admin.password = 12345678
```

>[!NOTE]
>
>If you simply use the `-nointeractive` parameter without the `-Dadmin.password.file` system property, AEM will use the default admin password without asking you to change it, essentially replicating behaviour from earlier versions. This non interactive mode can be used for automated installations using the command line in an installation script.

