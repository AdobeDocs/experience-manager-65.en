---
title: Upgrade JBoss EAP from 7.4.10 to 7.4.23 for AEM Forms on JEE
description: Steps to upgrade JBoss EAP from 7.4.10 to 7.4.23 for AEM Forms on JEE standalone environments.
SEO Description: Upgrade JBoss EAP from 7.4.10 to 7.4.23 for AEM Forms on JEE standalone environments.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: installing
geptopics: SG_AEMFORMS/categories/jee
exl-id: 8f4c2a91-6b3d-4e7f-9c12-5d8e1f0a2b34
solution: Experience Manager, Experience Manager Forms
feature: AEM Forms Upgrade,AEM Forms on JEE
role: User, Developer
---
# Upgrade JBoss EAP from 7.4.10 to 7.4.23 for AEM Forms on JEE {#upgrade-jboss-eap-from-7-4-10-to-7-4-23}

## Overview {#overview}

Upgrade JBoss EAP from version 7.4.10 to 7.4.23 on an AEM Forms on JEE standalone environment. The upgrade requires migrating configuration files, database credentials, and the CRX repository to the new JBoss installation, and running Configuration Manager to complete the setup.

## Applies to {#applies-to}

This article applies to:

* AEM Forms on JEE running on JBoss EAP 7.4.10 in a standalone environment
* Turnkey and partial turnkey installation modes on Windows and Linux 

## Prerequisites {#prerequisites}

Before you begin:

* Download the JBoss 7.4.23 package from the [Adobe Software Distribution Portal](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html).
* Ensure that you have administrative access to the target environment.
* Take a complete backup of the existing JBoss installation.

## Steps {#steps}

To upgrade JBoss EAP from 7.4.10 to 7.4.23, perform the following steps:

### Download and extract JBoss {#download-and-extract-jboss}

1. Download the JBoss 7.4.23 ZIP package from the Adobe Software Distribution Portal.
1. Extract the ZIP file to a local directory.
1. Rename the extracted JBoss folder to match the exact name of the existing JBoss installation directory.

### Back up the existing installation {#back-up-the-existing-installation}

1. Create a full backup of the current JBoss installation directory.
1. Verify that the backup includes all configuration files and customizations.

### Configure database files {#configure-database-files}

1. Navigate to the configuration directory:

   * Windows: `<JBoss_Home>\standalone\configuration`
   * Linux: `<JBoss_Home>/standalone/configuration`

1. Configure the database files based on your installation mode:

   **Turnkey mode:**

   1. Rename `lc_mysql.xml` to `lc_turnkey.xml`.
   1. Delete the following files:

      * `lc_oracle.xml`
      * `lc_mssql.xml`

   **Partial turnkey mode:**

   1. Keep only the `lc_db.xml` file that corresponds to your database engine.
   1. Delete the other two `lc_db.xml` configuration files.

### Update database credentials {#update-database-credentials}

1. Open the `lc_turnkey.xml` file from the backed-up JBoss installation.
1. Copy the following values:

   * Datasource URL
   * Database username
   * Database password

1. Update the corresponding entries in the new `lc_turnkey.xml` file.

### Migrate CRX repository {#migrate-crx-repository}

1. Navigate to the following directory in the old JBoss installation:

   `<old_jboss>\bin\`

1. Copy the `crx-quickstart` folder.
1. Paste the folder into:

   `<new_jboss>\bin\`

### Run Configuration Manager {#run-configuration-manager}

1. Start the upgraded JBoss environment.
1. Launch LiveCycle Configuration Manager (LCM).
1. Execute the complete end-to-end Configuration Manager workflow.
1. Verify that all configuration tasks complete successfully.

### Post-upgrade validation {#post-upgrade-validation}

After the upgrade, confirm the following:

* All services start successfully.
* Database connectivity is verified.
* Application functionality is validated.
