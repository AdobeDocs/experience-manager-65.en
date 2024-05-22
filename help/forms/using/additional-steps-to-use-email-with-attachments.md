---
title: Additional Steps to get Email with Attachments
description: Learn how to fix the error when you are unable to retrieve Email with Attachments for AEM Forms on JEE Platforms.
exl-id: 0d0713fb-d95a-4a95-91ef-9cdaea30e343
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms, Troubleshooting"
role: "User, Developer"
---
# Unable to get Email with Attachments for AEM Forms on JEE Platforms{#unable-to-get-email-with-attachments}

The issue applies to the following version:

* Experience Manager 6.5 Forms

## Issue {#issue}

User is not able to perform operations such as Send PDF via Email or Include Attachments with Submission configuration.

## Solution {#solution}

1. Download jar as [java.mail-1.0.jar](/help/forms/using/java.mail-1.0.jar) and unzip the downloaded jar file to obtain the manifest file.

1. Use the manifest file of `java.mail-1.0.jar` retrieved from Step 1 to create a custom jar file say as `java.mail-1.5.jar`.

1. Open the manifest file and replace all the occurrences of `1.5.0` with `1.5.6` and `Bundle-Version: 1.0` with `Bundle-Version:1.5`

1. Create a custom jar (`java.mail-1.5.jar`) file by using following command in `C:\Adobe\Adobe_Experience_Manager_Forms\java\jdk\bin` folder as:
    `jar -cfm java.mail-1.5.jar manifest.mf`

    In the above command, *manifest.mf* is the name of the manifest file and *java.mail-1.5.jar* is the name of the file that would be created after executing the above command.         

1. Download [javax.mail-1.5.6.redhat-1.jar](https://mvnrepository.com/artifact/com.sun.mail/javax.mail/1.5.6.redhat-1).

1. Navigate to `http://<server name>:<port>/lc/system/console/bundles`and delete the bundle with a name as `JavaMail API (com.sun.mail.javax.mail) version 1.6.2`. 

1. Install `java.mail-1.5.jar` obtained from step 3. This step restarts the sling properties of the JEE deployment. Wait for the installed bundles at `http://<server name>:<port>/lc/system/console/bundles` to show Status as **Active**. 

    >In case the status is still **InActive**, restart   **JBoss&reg;** from the **Services Console**.


1. Install `javax.mail-1.5.6.redhat-1.jar`file downloaded using step 5.

1. Stop **JBoss&reg;** from the **Services Console** and append the following properties to **Sling.properties** file:
    * `org.osgi.framework.system.packages.extra=javax.activation; version\=1.2.0`
    * `sling.bootdelegation.activation=javax.activation.*`

1. Restart **JBoss&reg;**.

>[!NOTE]
>
> It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.
