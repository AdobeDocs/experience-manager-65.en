---
title: Migrate AEM Forms assets and documents
seo-title: Migrate AEM Forms assets and documents
description: The Migration utility allows you to Migrate AEM Forms assets and documents from AEM 6.3 Forms or prior versions to AEM 6.4 Forms.
seo-description: The Migration utility allows you to Migrate AEM Forms assets and documents from AEM 6.3 Forms or prior versions to AEM 6.4 Forms.
uuid: a3fdf940-7fc2-441c-91c8-ad66ba47e5f2
content-type: reference
topic-tags: correspondence-management, installing
geptopics: SG_AEMFORMS/categories/jee
products: SG_EXPERIENCEMANAGER/6.5/FORMS
content-strategy: max-2018
discoiquuid: 39dfef85-d047-4b6d-a0f5-92bd77df103b
docset: aem65

role: Admin
exl-id: 0f9aab7d-8e41-449a-804b-7e1bfa90befd
---
# Migrate AEM Forms assets and documents{#migrate-aem-forms-assets-and-documents}

The Migration utility converts the [Adaptive Forms assets](../../forms/using/introduction-forms-authoring.md), [cloud configrurations](/help/sites-developing/extending-cloud-config.md), and [Correspondence Management assets](/help/forms/using/cm-overview.md) from the format used in the earlier versions to the format used in AEM 6.5 Forms. When you run migration utility, the following are migrated:

* Custom components for adaptive forms
* Adaptive forms and correspondence management Templates
* Cloud configurations
* Correspondence Management and adaptive forms assets

>[!NOTE]
>
>In case of out of place upgrade, for case of Correspondence Management assets, you can run the migration every time you import the assets. For Correspondence Management migration you need to have the Forms Compatibility Package installed.

## Approach to migration {#approach-to-migration}

You can [upgrade](../../forms/using/upgrade.md) to the latest version of AEM Forms 6.5 from AEM Forms 6.4, 6.3, or 6.2 or perform a fresh installation. Depending on whether you upgraded your previous installation or performed a fresh install, you need to do one of the following:

**In case of in-place upgrade**

If you performed an in-place upgrade, the upgraded instance already has the assets and documents. However, before you can use the assets and documents, you will need to install [AEMFD Compatibility package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) (includes Correspondence Management Compatibility package)

Then you need to update the assets and documents by [running the Migration utility](#runningmigrationutility).

**In case of out of place installation**

If it is an out of place (fresh) installation, before you can use the assets and documents, you will need to install [AEMFD Compatibility package](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) (includes the Correspondence Management Compatibility package).

Then you need to import your asset package (zip or cmp) on the new setup and then update the assets and documents by [running the Migration utility](#runningmigrationutility). Adobe recommends creating new assets on the new setup only after running the migration utility.

Due to [backward compatibility-related](/help/sites-deploying/backward-compatibility.md) changes, locations of a few folders in crx-repository are changed. Manually export and import dependencies (custom libraries and assets) from previous setup to fresh environment.

## Read before you proceed with the migration {#prerequisites}

For Correspondence Management assets:

* For the assets that are imported from the previous platform, a property gets added: **fd:version=1.0**.
* Since AEM 6.1 Forms, comments are not available out of the box. The comments that were added previously are available in the assets but are not visible on the interface automatically. You need to customize the extendedProperties property in the AEM Forms user interface to make the comments visible.
* In some of the previous versions such as LiveCycle ES4, text was edited using Flex RichTextEditor, but since AEM 6.1 Forms, HTML editor is used. Due to this rendering and appearance of the fonts, font sizes, and font margins may be different from the previous versions in the Author user interface. However, the letters look the same when rendered.
* Lists in text modules are improved and now render differently. There may be visual differences. We recommend that you render and see the letters where you are using lists in text modules.
* Since image content modules are converted to DAM assets and layouts and fragments are added to forms during migration, the Updated By property for these modules changes to admin.
* The version history of the assets is not migrated and is not available after migration. The subsequent version history post migration is maintained.
* The Ready to Publish state is deprecated since AEM 6.1 Forms, so all the assets in the Ready to Publish state is changed to Modified state.
* Since the user interface is updated in AEM Forms 6.3, the steps to perform the customizations are also different. You need to redo the customization if you are migrating from a version prior to 6.3.
* Layout Fragments move from /content/apps/cm/layouts/fragmentlayouts/1001 to /content/apps/cm/modules/fragmentlayouts. Data Dictionary reference in assets displays path of the Data Dictionary instead of its name.
* Any tab spaces being used for alignment in text modules need to be readjusted. For more information, see [Correspondence Management - Using tab spacing for arranging text](https://helpx.adobe.com/aem-forms/kb/cm-tab-spacing-limitations.html).
* Asset composer configurations changes to Correspondence Management configurations.
* Assets are moved under folders with names such as Existing Text and Existing List.

## Using the Migration utility {#using-the-migration-utility}

### Running the Migration utility {#runningmigrationutility}

Run the Migration utility before making any changes in the assets or creating assets. We recommend that you do not run the utility after making any changes or creating assets. Make sure that the Correspondence Management or Adaptive Forms Assets user interface is not open while the migration process is running.

When you run the Migration Utility for the first time, a log is created with the following path and name: `\[aem-installation-directory]\cq-quickstart\logs\aem-forms-migration.log`. This log keeps getting updated with Correspondence Management and Adaptive Forms migration info, such as moving of assets.

>[!NOTE]
>
>Before running the migration utility, ensure that you have taken a backup of your crx repository.

1. In a browser session, log in to AEM author instance as an Admin.

1. Open the following URL in the browser:

   https://[*hostname*]:[*port*]/[*context_path*]/libs/fd/foundation/gui/content/migration.html

   The browser displays four options:

    * AEM Forms Assets Migration
    * Adaptive Forms Custom Components Migration
    * Adaptive Forms Templates Migration
    * AEM Forms Cloud Configurations Migration

1. Do the following to perform the migration:

    * To migrate **assets**, tap AEM Forms Assets Migration, and in the next screen, tap **Start Migration**. The following get migrated:

        * Adaptive forms
        * Document fragments
        * Themes
        * Letters
        * Data dictionaries

   >[!NOTE]
   >
   >During assets migration, you may find warning messages such as “Conflict found for…”. Such messages indicate that rules for some of the components in adaptive forms could not be migrated. For example, if the component had an event which had both rules and scripts, if rules occur after any script none of the rules for the component are migrated. You can [migrate such rules by opening the rule editor](#migrate-rules) in adaptive form authoring.

    * To migrate adaptive form custom components, tap **Adaptive Forms Custom Components Migration** and in the Custom Components Migration page, tap **Start Migration**. The following get migrated:

        * Custom components written for Adaptive Forms
        * Component overlays, if any.

    * To migrate adaptive form templates, tap **Adaptive Forms Template Migration** and in the Custom Components Migration page, tap **Start Migration**. The following get migrated:

        * Adaptive form templates created under `/apps` or `/conf` using AEM Template Editor.

    * Migrate AEM Forms Cloud Configuration services to leverage the new context-aware cloud service paradigm, which includes the touch enabled UI (under `/conf`). When you migrate AEM Forms Cloud Configuration services, the cloud services in `/etc` are moved to `/conf`. If you do not have any cloud services customizations that depend on the legacy paths (`/etc`), it is recommended that you run the migration utility right after upgrading to 6.5 and use cloud configuration Touch UI for any further work. If you have any existing cloud services customizations, continue using classic UI on upgraded setup until the customizations are updated to align with the migrated paths (`/conf`) and then run the migration utility.

   To migrate **AEM Forms cloud services**, which include the following, tap AEM Forms Cloud Configuration Migration (cloud config migration is independent of AEMFD Compatibility package), tap AEM Forms Cloud Configurations Migration and then on the Configuration Migration page, tap **Start Migration**:

    * Form Data Model cloud services

        * Source path: `/etc/cloudservices/fdm`
        * Target path: `/conf/global/settings/cloudconfigs/fdm`

    * Recaptcha

        * Source path: `/etc/cloudservices/recaptcha`
        * Target path: `/conf/global/settings/cloudconfigs/recaptcha`

    * Adobe Sign

        * Source path: `/etc/cloudservices/echosign`
        * Target path: `/conf/global/settings/cloudconfigs/echosign`

    * Typekit cloud services

        * Source path: `/etc/cloudservices/typekit`
        * Target path: `/conf/global/settings/cloudconfigs/typekit`

   The browser window displays the following as the migration process takes place:

    * When the assets are updated: Assets successfully updated.
    * Once migration is complete: Finished migration for assets.

   When executed, the Migration utility does the following:

    * **Adds the tags to the assets**: Adds the tag “Correspondence Management : Migrated Assets” / “Adaptive Forms : Migrated Assets”. to the migrated assets, so that the users can identify migrated assets. When you run the Migration utility, all the existing assets in the system are marked as Migrated.
    * **Generates tags**: Categories and subcategories present in the previous system are created as tags, and then these tags are associated with the relevant Correspondence Management assets in AEM. For example, a Category (Claims) and a Subcategory (Claims) of a letter template are generated as tags.

1. After the Migration utility finishes running, proceed to the [housekeeping tasks](#housekeepingtasks).

#### Migrate rules using rules editor {#migrate-rules}

These components can be migrated by opening them in Rule Editor in Adaptive Forms editor.

* To migrate rules and scripts (not required if upgrading from 6.3) in custom components, tap Adaptive Forms Custom Components Migration, and in the next screen, tap Start Migration. The following get migrated:
  
  * Rules and Scripts created using rule editor (6.1 FP1 and later)
  
  * Scripts created using the Script tab in the UI of 6.1 and earlier

* To migrate templates (not required if upgrading from 6.3 and 6.4), tap Adaptive Forms Template Migration, and in the next screen, tap Start Migration. The following get migrated:

  * Old templates - the adaptive forms templates created under /apps using AEM 6.1 Forms or earlier. This includes the scripts that were defined in the template components.

  * New templates - Adaptive forms templates created using template editor under /conf. This includes migration of rules and scripts created using the rule editor.

### Housekeeping tasks after running the migration utility {#housekeepingtasks}

After running the Migration utility, take care of the following housekeeping tasks:

1. Ensure that XFA version of layouts and fragment layouts is 3.3 or later. If you are using layouts and fragment layouts of an older version, then there could be issues in rendering the letter. To update version of an older XFA to the latest version, complete the following steps:

    1. [Download the XFA as a zip file](../../forms/using/import-export-forms-templates.md#p-import-and-export-assets-in-correspondence-management-p) from the Forms user interface.
    1. Extract the file.
    1. Open the XFA file in the latest Designer and save it. The version of the XFA gets updated to the latest one.
    1. Upload the XFA in the Forms user interface.

1. Publish all the assets that were published in the previous system before migration. The migration utility updates the assets only on the author instance and to update the assets on the publish instance (s) you need to publish the assets.

1. In AEM Forms 6.4 and 6.5, some of the rights of the forms users groups are changed. If you want any of your users to be able to upload XDPs and Adaptive Forms containing scripts or use code editor, you need to add them to forms-power-users group. Similarly, template-authors can no longer use the code editor in Rule Editor. For users to be able to use code editor, add them to af-template-script-writers group. For instructions on adding users to groups, see [Managing Users and User Groups](/help/communities/users.md).
