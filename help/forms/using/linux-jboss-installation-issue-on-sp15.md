---
title: AEM Forms JEE 6.5.15.0 service pack installation issue on JBoss Linux environment
description: AEM Forms JEE 6.5.15.0 service pack  is not installed properly on the JBoss Linux environment, any new patch changes are not applied to the application server.
SEO Description: AEM Forms JEE 6.5.15.0 service pack  is not installed properly on the JBoss Linux environment, any new patch changes are not applied to the application server.
---

# AEM Forms 6.5.15.0 JEE Service Pack installation issue on JBoss environment {#aem-forms-installation-issue-environment}

## Issue {#issue}

In some intermittent cases, AEM Forms JEE 6.5.15.0 service pack is not installed properly on the JBoss environment. In `PatchInstallerProcessing[1-9*].log` file the log entry as `[AEM_Forms_JEE_DIR]/patch/AEMForms-6.5.0-0057/xml/RUP_BOM.xml not found! Assuming this component isn't in the installation. Skipping Processing` is logged. This entry indicates that the installation of of AEM Forms JEE 6.5.15.0 service pack is not successful. 

## Applies to {#applies-to}

This solution applies to:
* AEM Forms on JBoss JEE servers 

## Solution {#solution}

To fix the installation issue AEM Forms JEE 6.5.15.0 service pack, add the `RUP_BOM.xml` file to the log directory:
1. Download and extract the AEM Forms 6.5.15.0 service pack folder as `AEMForms-6.5.0-0057_jboss_linux.tar.gz`.
1. Navigate to `/CDROM_Installers/Linux/Disk1/InstData` location and locate the `Resource1.zip` file.
1. Copy the `Resource1.zip` file at some different location outside the extracted folder and unzip `Resource1.zip` file.
1. Navigate to `/C_/builds/dev_releng/branches/rrt/aem6.5.0_rollup/tier1/install/patch/fileset_dir/xml` and copy the `RUP_BOM.xml` file.
1. Paste the `RUP_BOM.xml` file at `/opt/adobe/adobe_experience_manager_Forms/patch/AEMForms-6.5.0-0057/xml`.
1. Reinstall the [AEM Forms JEE 6.5.15.0 service pack](https://experienceleague.adobe.com/docs/experience-manager-65/release-notes/release-notes.html). 