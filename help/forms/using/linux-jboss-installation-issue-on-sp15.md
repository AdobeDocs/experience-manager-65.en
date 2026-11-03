---
title: AEM Forms JEE 6.5.15.0 service pack installation issue on JBoss® Linux® environment
description: AEM Forms JEE 6.5.15.0 service pack  is not installed properly on the JBoss® Linux® environment, any patch changes are not applied to the application server. Add the `RUP_BOM.xml` file to the XML directory.
SEO Description: AEM Forms JEE 6.5.15.0 service pack  is not installed properly on the JBoss Linux environment.
exl-id: 96ecbe58-a859-4432-a2d8-3d5dc0eaf989
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,AEM Forms on JEE
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 94663796-0ee7-58b9-84f4-b425ebb69e83
    internal-label: AEM Forms on JEE
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
# AEM Forms 6.5.15.0 JEE Service Pack installation issue on JBoss® environment {#aem-forms-installation-issue-environment}

## Issue {#issue}

AEM Forms JEE 6.5.15.0 service pack is not installed properly on the JBoss® Linux® environment. In `PatchInstallerProcessing[1-9*].log` file the log entry, `[AEM_Forms_JEE_DIR]/patch/AEMForms-6.5.0-0057/xml/RUP_BOM.xml not found! Assuming this component is not in the installation. Skipping Processing`, is logged. This entry indicates that the installation of AEM Forms JEE 6.5.15.0 service pack is not successful.

## Applies to {#applies-to}

This solution applies to:
* JBoss® Linux® Environment 

>[!NOTE]
>
> Ensure that the AEM Forms JEE 6.5.15.0 service pack is installed on the application server at least once before performing the steps of [adding the RUP_BOM.xml file to the XML directory](#solution-solution).

## Solution {#solution}

To fix the installation issue AEM Forms JEE 6.5.15.0 service pack, add the `RUP_BOM.xml` file to the XML directory:
1. Navigate to the folder where you extracted the patch `AEMForms-6.5.0-0057_jboss_linux.tar.gz`.
1. Navigate to `/CDROM_Installers/Linux/Disk1/InstData` location and locate the `Resource1.zip` file.
1. Copy the `Resource1.zip` file at some different location outside the extracted folder and unzip `Resource1.zip` file.
1. Navigate to `/C_/builds/dev_releng/branches/rrt/aem6.5.0_rollup/tier1/install/patch/fileset_dir/xml` and copy the `RUP_BOM.xml` file.
1. Paste the RUP_BOM.xml file at `[aem_forms_jee_installation_dir]/patch/AEMForms-6.5.0-0057/xml`.
1. Reinstall the [AEM Forms JEE 6.5.15.0 service pack](https://experienceleague.adobe.com/docs/experience-manager-release-information/aem-release-updates/forms-updates/aem-forms-releases.html).
