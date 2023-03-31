---
title: Community Site Essentials
seo-title: Community Site Essentials
description: Exporting and deleting community sites and creating custom site templates
seo-description: Exporting and deleting community sites and creating custom site templates
uuid: f0ec0e71-64e9-415a-b14a-939a9b1611c1
contentOwner: msm-service
products: SG_EXPERIENCEMANAGER/6.5/COMMUNITIES
topic-tags: developing
content-type: reference
discoiquuid: dc7a085e-d6de-4bc8-bd7e-6b43f8d172d2
exl-id: 1dc568cd-315c-4944-9a3e-e5d7794e5dc0
---
# Community Site Essentials {#community-site-essentials}

## Custom Site Template {#custom-site-template}

A custom site template may be specified separately for each language copy of a community site.

To do so:

* Create a custom template.
* Overlay the default site template path.
* Add the custom template to the overlay path.
* Specify the custom template by adding a `page-template` property to the `configuration` node.

**Default template**:

`/libs/social/console/components/hbs/sitepage/sitepage.hbs`

**Custom template in overlay path**:

`/apps/social/console/components/hbs/sitepage/template-name.hbs`

**Property**: page-template

**Type**: String

**Value**: `template-name` (no extension)

**Configuration node**:

`/content/community site path/lang/configuration`

For example: `/content/sites/engage/en/configuration`

>[!NOTE]
>
>All nodes in the overlaid path need only be of type `Folder`.

>[!CAUTION]
>
>If the custom template is given the name *sitepage.hbs*, then all community sites will be customized.

### Custom Site Template Example {#custom-site-template-example}

As an example, `vertical-sitepage.hbs` is a site template that results in the placement of menu links vertically down the left side of the page, instead of horizontally below the banner.

[Get File](assets/vertical-sitepage.hbs)
Place the custom site template in the overlay folder:

`/apps/social/console/components/hbs/sitepage/vertical-sitepage.hbs`

Identify the custom template by adding a `page-template` property to the configuration node:

`/content/sites/sample/en/configuration`

![crxde-siteconfiguration](assets/crxde-siteconfiguration.png)

Be sure to **Save All** and replicate custom code to all AEM instances (custom code is not included when the community site content is published from the console).

The recommended practice for replicating custom code is to [create a package](../../help/sites-administering/package-manager.md#creating-a-new-package) and deploy it on all instances.

## Exporting a Community Site {#exporting-a-community-site}

Once a community site is created, it is possible to export the site as an AEM package stored in package manager and available for download and upload.

This is available from the [Communities Sites console](sites-console.md#exporting-the-site).

Note that UGC and custom code is not included in the community site package.

To export UGC, use the [AEM Communities UGC Migration Tool](https://github.com/Adobe-Marketing-Cloud/communities-ugc-migration), an open source migration tool available on GitHub.

## Deleting a Community Site {#deleting-a-community-site}

As of AEM Communities 6.3 Service Pack 1, Delete Site icon appears on hovering over the community site from **[!UICONTROL Communities]** > **[!UICONTROL Sites]** console. During development, if it is desired to delete a community site and start fresh, you can use this functionality. Deleting a community site, removes the following items associated with that site:

* [UGC](#user-generated-content)
* [User groups](#community-user-groups)
* [Database records](#database-records)

### Community Unique Site ID {#community-unique-site-id}

To identify the unique site ID associated with the community site, using CRXDE:

* Navigate to the language root of the site, such as `/content/sites/*<site name>*/en/rep:policy`.

* Find the `allow<#>` node with a `rep:principalName` in this format `rep:principalName = *community-enable-nrh9h-members*`.

* The site ID is the 3rd component of `rep:principalName`
  
  For example, if `rep:principalName = community-enable-nrh9h-members`

  * **site name** = *enable*
  * **site ID** = *nrh9h*
  * **unique site ID** = *enable-nrh9h*

### User Generated Content {#user-generated-content}

Obtain the communities-srp-tools project from Github:

* [https://github.com/Adobe-Marketing-Cloud/communities-srp-tools](https://github.com/Adobe-Marketing-Cloud/communities-srp-tools)

This contains a servlet to delete all UGC from any SRP.

All UGC may be removed or for a specific site, for example:

* `path=/content/usergenerated/asi/mongo/content/sites/engage`

This only removes user generated content (entered on publish) and not authored content (entered on author). Therefore, [shadow nodes](srp.md#shadownodes) are not affected.

### Community User Groups {#community-user-groups}

On all author and publish instances, from the [security console](../../help/sites-administering/security.md), locate and remove the [user groups](users.md) that are:

* Prefixed with `community`
* Followed by [unique site id](#community-unique-site-id)

For example, `community-engage-x0e11-members`.
