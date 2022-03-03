---
title: Upgrade to AEM 6.5 Forms
seo-title: Upgrade to AEM 6.5 Forms
description: You can perform a direct upgrade from AEM 6.1 Forms, AEM 6.2 Forms, and LiveCycle ES4 SP1 to AEM 6.3 Forms.
seo-description: You can perform a direct upgrade from AEM 6.1 Forms, AEM 6.2 Forms, and LiveCycle ES4 SP1 to AEM 6.3 Forms.
uuid: 1435246a-9215-4d88-b52c-59a5c329bb77
content-type: reference
products: SG_EXPERIENCEMANAGER/6.3/FORMS
topic-tags: installing
geptopics: SG_AEMFORMS/categories/jee
discoiquuid: e745033f-8015-4fae-9d82-99d35802c0a6
role: Admin
exl-id: 722e75a0-bcb3-465e-bb74-ea94a3b99fd3
---
# Upgrade to AEM 6.5 Forms on JEE {#upgrade-to-aem-forms-jee}

AEM 6.5.12.0 Forms on JEE provides provides two types of installers: Full installer and Patch installer.

**Full installer**: You can use the full installer to upgrade from AEM 6.3 Forms on JEE or AEM 6.4 on JEE to AEM 6.5.12.0 Forms on JEE. It is also for customers setting up fresh AEM Forms instances and performing out-of-the-place upgrades.

**Patch installer**: Patch installer is for customers already using AEM 6.5.x.x versions. You can use the patch installer to upgrade to the latest version of AEM Forms.

The following table depicts senarios for using full and patch installer.

![](assets/full-and-patch-installer.png)

Perform the following procedure to use the full installer to upgrade existing AEM 6.3 Forms on JEE or AEM 6.4 Forms on JEE to AEM 6.5.12.0 Forms on JEE:

1. Download the AEM 6.5 Forms on JEE installer from the [Software Distribution](https://experience.adobe.com/#/downloads/content/software-distribution/en/aem.html). You require a valid Maintenance & Support contract to use the installer.
1. See [Upgrade checklist and planning](https://www.adobe.com/go/learn_aemforms_upgrade_checklist_65) to learn about the checks to perform to ensure a successful upgrade.
1. See [Prepare to upgrade to AEM Forms](https://www.adobe.com/go/learn_aemforms_prepareupgrade_65) to learn and perform the tasks that ensure the upgrade runs correctly with minimal server downtime.
1. Depending on your existing environment and application server, choose one of the following documents and follow the instructions.

    * [Upgrade from AEM 6.3 or AEM 6.4 Forms to AEM 6.5 Forms for JBoss](http://www.adobe.com/go/learn_aemforms_upgradeJBoss_65)
    * [Upgrade from AEM 6.3 or AEM 6.4 Forms to AEM 6.5 Forms for WebSphere](http://www.adobe.com/go/learn_aemforms_upgradeWebSphere_65)
    * [Upgrade from AEM 6.3 or AEM 6.4 Forms to AEM 6.5 Forms for JBoss Turnkey](http://www.adobe.com/go/learn_aemforms_upgradeTurnkey_65)

Direct upgrade from LiveCycle ES2, LiveCycle ES3, AEM 6.0 Forms, AEM 6.1 Forms, AEM 6.2 Forms to AEM 6.5 Forms is not available. You can perform an intermediate upgrade to one or more versions of LiveCycle or AEM Forms and then upgrade from AEM 6.5 Forms. For the list of intermediate versions and corresponding upgrade instructions, see [Choose an upgrade path](upgrade.md).
