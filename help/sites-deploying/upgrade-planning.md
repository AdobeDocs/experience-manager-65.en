---
title: Planning Your Upgrade
description: This article helps establish clear goals, phases, and deliverables when planning the AEM upgrade.
contentOwner: sarchiz
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: upgrading
docset: aem65
feature: Upgrading
exl-id: 0dea2b3e-fd7c-4811-a04a-6852ffc1e6d6
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Planning Your Upgrade{#planning-your-upgrade}

## AEM Project Overview {#aem-project-overview}

AEM is often used in high impact deployments that might serve millions of users. Usually, there are custom applications that are deployed on the instances, which add to the complexity. Any effort to upgrade such a deployment needs to be handled methodically.

This guide helps with establishing clear goals, phases, and deliverables when planning your upgrade. It focuses on the overall project execution and guidelines. While it provides an overview of the actual upgrade steps, it refers to available technical resources where suitable. It should be used with the available technical resources referred to in the document.

The AEM Upgrade process needs carefully handled planning, analysis, and execution phases with key deliverables defined for each phase.

It is possible to upgrade directly from AEM versions 6.0 and up to 6.5. Customers running 5.6.x and below need to upgrade first to version 6.0 or above, with 6.0(SP3) being recommended. Also, the new Oak Segment Tar format is used now for the Segment Node Store since 6.3, and repository migration to this new format is mandatory even for 6.0, 6.1 and 6.2.

>[!CAUTION]
>
>If you are upgrading from AEM 6.2 to 6.3, you should EITHER upgrade from versions (**6.2-SP1-CFP1 - -6.2SP1-CFP12.1**) or **6.2SP1-CFP15** onwards. Otherwise, if you are upgrading from **6.2SP1-CFP13/6.2SP1CFP14** to AEM 6.3, you must also upgrade to at least version **6.3.2.2**. Otherwise, AEM Sites would fail after upgrading.

## Upgrade Scope and Requirements {#upgrade-scope-requirements}

Below you will find a list of areas that are impacted in a typical AEM Upgrade project:

<table>
 <tbody>
  <tr>
   <td><strong>Component</strong></td>
   <td><strong>Impact</strong></td>
   <td><strong>Description</strong></td>
  </tr>
  <tr>
   <td>Operating System</td>
   <td>Uncertain, but subtle effects</td>
   <td>At the time of the AEM upgrade, it may be time to upgrade the operating system as well and this might have some impact.</td>
  </tr>
  <tr>
   <td>Java&trade; Runtime</td>
   <td>Moderate Impact</td>
   <td>AEM 6.3 requires JRE 1.7.x (64 bit) or later. JRE 1.8 is the only version currently supported by Oracle.</td>
  </tr>
  <tr>
   <td>Hardware</td>
   <td>Moderate Impact</td>
   <td>Online Revision Cleanup requires free<br /> disk space equal to 25% of the repository's size and 15% free heap space<br /> to complete successfully. You may need to upgrade your hardware to<br /> ensure sufficient resources for Online Revision Cleanup to fully<br /> run. Also, if upgrading from a version prior to AEM 6, there<br /> may be additional storage requirements.</td>
  </tr>
  <tr>
   <td>Content Repository (CRX or Oak)</td>
   <td>High Impact</td>
   <td>Starting from version 6.1, AEM does not support CRX2, so a migration to<br /> Oak (CRX3) is required if upgrading from an older version. AEM 6.3 has<br /> implemented a new Segment Node Store that also requires a migration. The<br /> crx2oak tool is used for this purpose.</td>
  </tr>
  <tr>
   <td>AEM Components/Content</td>
   <td>Moderate Impact</td>
   <td><code>/libs</code> and <code>/apps</code> are easily handled through the upgrade, but <code>/etc</code> usually requires some manual reapplication of customizations.</td>
  </tr>
  <tr>
   <td>AEM Services</td>
   <td>Low Impact</td>
   <td>Most AEM core services are tested for upgrade. This is an area of low impact.</td>
  </tr>
  <tr>
   <td>Custom Application Services</td>
   <td>Low to High Impact</td>
   <td>Depending on the application and customization, there may be<br /> dependencies on JVM, operating system versions, and some indexing related<br /> changes, as indexes are not generated automatically in Oak.</td>
  </tr>
  <tr>
   <td>Custom Application Content</td>
   <td>Low to High Impact</td>
   <td>Content that will not be handled through the upgrade can be backed up<br /> before the upgrade takes place and then moved back into the repository.<br /> Most content can be handled through the migration tool.</td>
  </tr>
 </tbody>
</table>

It is important to ensure that you are running a supported operating system, Java&trade; runtime, httpd, and Dispatcher version. For more information, see the [AEM 6.5 Technical Requirements page](/help/sites-deploying/technical-requirements.md). Upgrading these components must be accounted for in your project plan and should take place before upgrading AEM.

## Project Phases {#project-phases}

Much work goes into planning and running an AEM upgrade. To clarify the different efforts that go into this process, Adobe has broken down the planning and execution exercises into separate phases. In the sections below, each phase results in a deliverable that is often used by a future phase of the project.

### Planning for Author Training {#planning-for-author-training}

With any new release, there are potential changes to the UI and user workflows that may be introduced. Also, new releases introduce new features that may be beneficial for the business to use. Adobe recommends reviewing the functional changes that have been introduced and organizing a plan to train your users on using them effectively.

![unu_cropped](assets/unu_cropped.png)

New features in AEM 6.5 can be found in [the AEM section of adobe.com](/help/release-notes/release-notes.md). Make sure to note any changes to UIs or product features that are commonly used in your organization. As you look through the new features, also take note of any that can be of value to your organization. After looking through what has changed in AEM 6.5, develop a training plan for your authors. This could involve using freely available resources like the help feature videos or formal training offered through [Adobe Digital Learning Services](https://learning.adobe.com/).

### Creating a Test Plan {#creating-a-test-plan}

Each customer's implementation of AEM is unique and has been customized to meet their business requirements. As a result, it is important to determine all the customizations that have been made to the system so that they can be included in a test plan. This test plan will power the QA process that Adobe performs on the upgraded instance.

![test-plan](assets/test-plan.png)

The exact production environment needs to be duplicated and testing should be performed on it after the upgrade to make sure all applications and custom code still run as desired. Regress all your customization and run performance, load, and security testing. When organizing your test plan, make sure to cover all customizations that have been made to the system in addition to out of the box UIs and workflows that are used in your day to day operations. These can include custom OSGI services and servlets, integrations to the Adobe Experience Cloud, integrations with third parties through AEM connectors, custom third-party integrations, custom components and templates, custom UI overlays in AEM, and custom workflows. For customers migrating from a version prior to AEM 6, any custom queries should be analyzed as these may need to be indexed. For customers who are already on an AEM 6.x version, these queries should still be tested to ensure that their indexes are continuing to work effectively after upgrading.

### Determining Architectural and Infrastructure Changes Needed {#determining-architectural-and-infrastructure-changes-needed}

When upgrading, it is possible that you may also need to upgrade other components in your technical stack such as the operating system or JVM. Also, it is possible that due to changes in the repository makeup that additional hardware may be required. This only comes up for customers migrating from pre 6.x instances but is important to consider. Finally, there may be changes needed to your operational practices including monitoring, maintenance, and backup and disaster recovery processes.

![doi_cropped](assets/doi_cropped.png)

Review the Technical Requirements for AEM 6.5 and ensure that your current hardware and software will be sufficient. For potential changes to your operational processes, see the following documents:

**Monitoring and Maintenance:**

[Operations Dashboard](/help/sites-administering/operations-dashboard.md)

[Assets Monitoring Best Practices](/help/assets/assets-monitoring-best-practices.md)

[Monitoring Server Resources Using the JMX Console](/help/sites-administering/jmx-console.md)

[Revision Cleanup](/help/sites-deploying/revision-cleanup.md)

**Backup/Restore and Disaster Recovery:**

[Backup and Restore](/help/sites-administering/backup-and-restore.md)

[Performance & Scalability](/help/sites-deploying/performance.md)

[How to Run AEM with TarMK Cold Standby](/help/sites-deploying/tarmk-cold-standby.md)

#### Content Restructuring Considerations {#content-restructuring-considerations}

AEM has introduced changes to the repository structure that will help in making upgrades more seamless. The changes involve moving content out of the /etc folder to folders including /libs, /apps, and /content, based on whether Adobe or a customer owns the content, thus limiting the chances of overwriting content during releases. The repository restructuring has been done in such a way that it should not require code changes at the time of 6.5 upgrade, although it is recommended to review the details at [Repository Restructuring in AEM](/help/sites-deploying/repository-restructuring.md) while planning an upgrade.

### Assessing Upgrade Complexity {#assessing-upgrade-complexity}

Due to the wide variety in the amount and nature of customizations that Adobe customers apply to their AEM environments, it is important to spend some time up front to determine the overall level of effort that should be expected in your upgrade.

There are two approaches that you can take to assessing the complexity of the upgrade, a preliminary phase can use the newly introduced Pattern Detector which is available to be run on your AEM 6.1, 6.2 and 6.3 instances. The pattern detector is the easiest way to assess the overall complexity of the upgrade to be expected using reported patterns. The pattern detector report includes patterns for identifying unavailable APIs that are in use by the custom codebase(this was done using pre-upgrade compatibility checks in 6.3).

After the initial assessment, a more comprehensive next step could be to perform an upgrade on a test instance and perform some basic smoke testing. Adobe also provides some . Also, the list of [Deprecated and Removed Features](/help/release-notes/deprecated-removed-features.md) should be reviewed not only for the version that you are upgrading to, but also for any versions between your source and target versions. For example, if upgrading from AEM 6.2 to 6.5, it is important to review the AEM 6.3 deprecated and removed features in addition to those for AEM 6.5.

![trei_cropped](assets/trei_cropped.png)

The Pattern Detector introduced in recently should give you a fairly accurate estimate of what to expect during an upgrade for most cases. However, for more complex customizations and deployments where you have incompatible changes you can upgrade a development instance to AEM 6.5 according to the instructions in [Performing an In-Place Upgrade](/help/sites-deploying/in-place-upgrade.md). Once complete, perform some high-level smoke testing on this environment. The goal of this exercise is not to exhaustively complete the test case inventory and produce a formal inventory of defects but to give us a rough estimate of the amount of work that will be required to upgrade the code for 6.5 compatibility. When combined with the [Pattern Detection](/help/sites-deploying/pattern-detector.md) and the architectural changes that were determined in the previous section, a rough estimate can be provided to the project management team for planning the upgrade.

### Building the Upgrade and Rollback Runbook {#building-the-upgrade-and-rollback-runbook}

While Adobe has documented the process for upgrading an AEM instance, each customer's network layout, deployment architecture, and customizations require fine-tuning and tailoring of this approach. For this reason, Adobe encourages you to review all the provided documentation and use it to inform a project-specific runbook that outlines the specific upgrade and rollback procedures that you will be following in your environment. If upgrading from CRX2, make sure to evaluate how long the content migration will take when moving from CRX2 to Oak. For large repositories, it could be substantial.

![runbook-diagram](assets/runbook-diagram.png)

Adobe has provided upgrade and rollback procedures in [Upgrade Procedure](/help/sites-deploying/upgrade-procedure.md) and step-by-step instructions for applying the upgrade in Performing an [In-Place Upgrade](/help/sites-deploying/in-place-upgrade.md). These instructions should be reviewed and considered with your system architecture, customizations, and downtime tolerance to determine the appropriate switch-over and rollback procedures that you will be executing during the upgrade. Any changes to architecture or server sizes should be included when drafting your customized runbook. It is important to note that this should be treated as a first draft. As your team completes their QA and development cycles and deploys the upgrade to the staging environment, it is likely that the need for some additional steps may be required. Ideally, this document should contain enough information such that if it were handed to a member of your operations staff, they would be able to complete the upgrade completely from the information contained within.

### Developing a Project Plan {#developing-a-project-plan}

The output from the previous exercises can be used to build a project plan covering the expected timelines for your test or development efforts, training, and actual upgrade execution.

![develop-project-plan](assets/develop-project-plan.png)

A comprehensive project plan should include:

* Finalization of development and test plans
* Upgrading development and QA environments
* Updating the custom code base for AEM 6.5
* A QA test and fix cycle
* Upgrading the staging environment
* Integration, performance, and load testing
* Environment certification
* Go live

### Performing Development and QA {#performing-development-and-qa}

Adobe has provided procedures for [Upgrading Code and Customizations](/help/sites-deploying/upgrading-code-and-customizations.md) to be compatible with AEM 6.5. As this iterative process is run, changes should be made to the runbook as needed. Also see [Backward Compatibility in AEM 6.5](/help/sites-deploying/backward-compatibility.md) on information on how your customizations can stay backward compatible usually without requiring development immediately after upgrade.

![patru_cropped](assets/patru_cropped.png)

The development and testing process is usually an iterative one. Due to customizations, changes made during the upgrade could potentially make an entire section of the product unusable. Once developers have addressed the root cause of the issue and the testing team has access to test these features, there is potential for discovering additional problems. As issues are discovered that require adjustments to the upgrade process, make sure to add them to your custom upgrade runbook. After several iterations of testing and fixing, the code base should be fully validated and ready for deployment to the staging environment.

### Final Testing {#final-testing}

Adobe recommends a final round of testing after the codebase has been certified by your organization's QA team. This round of testing will involve validating your runbook on a staging environment followed by rounds of user acceptance, performance, and security testing.

![cinci_cropped](assets/cinci_cropped.png)

This step is vital as it is the only time that you are able to validate the steps in the runbook against a production-like environment. Once the environment has been upgraded, it is important to allow end users some time to log in and go through the activities they do when using the system in their day-to-day activities. It is not uncommon for users to be using a part of the system that was not previously considered. Finding and correcting issues in these areas before go-live can help to prevent costly production outages. As a new version of AEM contains significant changes to the underlying platform, it is also important to perform performance, load, and security tests on the system as if you were launching it for the first time.

### Performing the Upgrade {#performing-the-upgrade}

Once final sign-off has been received from all stakeholders, it is time to execute on the defined runbook procedures. Adobe has provided steps for upgrade and rollback in [Upgrade Procedure](/help/sites-deploying/upgrade-procedure.md) and installation steps in Performing an [In-Place Upgrade](/help/sites-deploying/in-place-upgrade.md) as a reference point.

![perform-upgrade](assets/perform-upgrade.png)

Adobe has provided some steps in the upgrade instructions for environment validation. These include basic checks like scanning the upgrade logs and verifying that all OSGi bundles have properly started, but Adobe recommends also validating with your own test cases based on your business processes. Adobe also recommends checking the schedule of AEM's Online Revision Cleanup and related routines to ensure that they will be occurring during a quiet time for your company. These routines are essential to the long-term performance of AEM.
