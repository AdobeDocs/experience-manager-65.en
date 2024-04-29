---
title: Forms Repository Restructuring in AEM 6.5
description: Learn how to make the necessary changes to migrate to the new repository structure in AEM 6.5 for Forms.
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: repo_restructuring
feature: Upgrading
exl-id: d555422e-dc97-4d45-9525-4299d22315e2
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Forms Repository Restructuring in AEM 6.5{#forms-repository-restructuring-in-aem}

As described on the parent [Repository Restructuring in AEM 6.5](/help/sites-deploying/repository-restructuring.md) page, customers upgrading to AEM 6.5 should use this page to assess the work effort associated with repository changes impacting the AEM Forms Solution. Some changes require work effort during the AEM 6.5 upgrade process, while others can be deferred until a future upgrade.

**With 6.5 Upgrade**

* [Misc](/help/sites-deploying/forms-repository-restructuring-in-aem-6-5.md#misc)

**Before Future Upgrade**

* [Echosign Cloud Service Configuration](/help/sites-deploying/forms-repository-restructuring-in-aem-6-5.md#echosign-cloud-service-configuration)
* [Recaptcha Cloud Service Configurations](/help/sites-deploying/forms-repository-restructuring-in-aem-6-5.md#recaptcha-cloud-service-configurations)
* [Typekit Cloud Service Configurations](/help/sites-deploying/forms-repository-restructuring-in-aem-6-5.md#typekit-cloud-service-configurations)
* [Misc](/help/sites-deploying/forms-repository-restructuring-in-aem-6-5.md#misc)

## With 6.5 Upgrade {#with-upgrade}

### Misc {#misc}

| **Previous location** | `/etc/clientlibs/fd/fp` |
|---|---|
| **New location** | `/libs/fd/fp/components` |
| **Restructuring guidance** |Any explicit references in custom code to the Legacy location must be updated to the New location. |
| **Notes** |These client libraries should not be edited or extended. |

| **Previous location** | `/etc/clientlibs/fd/rte` |
|---|---|
| **New location** | `/libs/fd/rte` |
| **Restructuring guidance** |For the resources in the client libs that can be referred by absolute paths, you must use newer paths in fresh assets. |
| **Notes** |N/A |

| **Previous location** | `/etc/clientlibs/fd/af` |
|---|---|
| **New location** | `/libs/fd/af/authoring/clientlibs` |
| **Restructuring guidance** |For the resources in the client libs that can be referred by absolute paths, you must use newer paths in fresh assets. |
| **Notes** |N/A |

| **Previous location** | `/etc/clientlibs/fd/xfaforms` |
|---|---|
| **New location** | `/libs/fd/xfaforms/clientlibs/` |
| **Restructuring guidance** |For the resources in the client libs that can be referred by absolute paths, you must use newer paths in fresh assets. |
| **Notes** |N/A |

| **Previous location** | `/etc/clientlibs/fd/af` |
|---|---|
| **New location** | `/libs/fd/af/runtime/clientlibs` |
| **Restructuring guidance** |For the resources in the client libs that can be referred by absolute paths, you must use newer paths in fresh assets. |
| **Notes** |N/A |

| **Previous location** | `/etc/clientlibs/fd/af` |
|---|---|
| **New location** | `/libs/fd/af/runtime/clientlibs` |
| **Restructuring guidance** |For the resources in the client libs that can be referred by absolute paths, you must use newer paths in fresh assets. |
| **Notes** |N/A |

| **Previous location** | `/etc/clientlibs/fd/expeditor` |
|---|---|
| **New location** | `/libs/fd/expeditor/clientlibs` |
| **Restructuring guidance** |For the resources in the client libs that can be referred by absolute paths, you must use newer paths in fresh assets. |
| **Notes** |N/A |

| **Previous location** | `/etc/clientlibs/fd/fmaddon` |
|---|---|
| **New location** | `/libs/fd/fmaddon` |
| **Restructuring guidance** |Changing these clientlibs was never recommended or supported. If modifications have been made to these clientlibs, they should be rolled back to use the AEM-provided code. |
| **Notes** |N/A |

| **Previous location** | `/etc/aep` |
|---|---|
| **New location** | `/var/fd/content/annotations` |
| **Restructuring guidance** |Changing these clientlibs was never recommended or supported. If modifications have been made to these clientlibs, they should be rolled back to use the AEM-provided code. |
| **Notes** |N/A |

## Before Future Upgrade {#prior-to-upgrade}

### Echosign Cloud Service Configuration {#echosign-cloud-service-configuration}

| **Previous location** | `/etc/cloudservices/echosign` |
|---|---|
| **New location** | `/conf/<tenant>/settings/cloudconfigs/echosign` |
| **Restructuring guidance** |The [Lazy Content Migration](/help/sites-deploying/lazy-content-migration.md) utility to be triggered from Forms Migration UI. |
| **Notes** |N/A |

### Recaptcha Cloud Service Configurations {#recaptcha-cloud-service-configurations}

| **Previous location** | `/etc/cloudservices/recaptcha` |
|---|---|
| **New location** | `/conf/<tenant>/settings/cloudconfigs/recaptcha` |
| **Restructuring guidance** |The [Lazy Content Migration](/help/sites-deploying/lazy-content-migration.md) utility to be triggered from Forms Migration UI. |
| **Notes** |N/A |

### Typekit Cloud Service Configurations {#typekit-cloud-service-configurations}

| **Previous location** | `/etc/cloudservices/typekit` |
|---|---|
| **New location** | `/conf/<tenant>/settings/cloudconfigs/typekit` |
| **Restructuring guidance** |The [Lazy Content Migration](/help/sites-deploying/lazy-content-migration.md) utility to be triggered from Forms Migration UI. |
| **Notes** |N/A |

### Misc {#misc-1}

| **Previous location** | `/etc/cloudservices/fdm` |
|---|---|
| **New location** | `/conf/<tenant>/settings/cloudconfigs/fdm` |
| **Restructuring guidance** |The [Lazy Content Migration](/help/sites-deploying/lazy-content-migration.md) utility to be triggered from Forms Migration UI. |
| **Notes** |N/A |

| **Previous location** | `/etc/designs/fd/fp` |
|---|---|
| **New location** | `/libs/fd/fp` |
| **Restructuring guidance** |Update any references to the /etc templates to point to their `/libs` counterparts. |
| **Notes** |N/A |
