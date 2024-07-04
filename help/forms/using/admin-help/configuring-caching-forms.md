---
title: Configuring caching for Forms
description: Learn how to configure cache settings and how to cluster considerations for caches.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 6b57d00e-5ba0-41ee-8497-49ecfec5b9ed
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configuring caching for Forms{#configuring-caching-for-forms}

The Forms service takes form designs that were created in Designer and renders them in various formats.

The Forms page in administration console contains settings that control the way the Forms service caches items. You can adjust these settings to optimize the performance of the Forms service.

The Forms service caches the following items:

* **form designs:** The Forms service caches form designs that it retrieves from the repository or from HTTP sources. This caching improves performance because for subsequent render requests, the Forms service retrieves the form design from the cache instead of from the repository.
* **fragments and images:** The Forms service can cache fragments and images used in form designs. When the Forms service caches these objects, it improves performance because the fragments and images are only read from the repository on the first request.
* **forms:** The Forms service caches the forms that it renders. This type of caching improves performance because the Forms service does not need to resolve and render the same form in subsequent requests.

Forms stores the cache in two locations:

* **in memory:** Items are stored in memory for quick access. The in-memory cache has a limited size and is deleted when you restart the server.
* **on disk:** Items are stored in the server’s file system. The disk cache has a larger capacity than the in-memory cache and it is retained when you restart the server. The location of the disk cache depends on your application server. For information on changing the location of the disk cache, see [Configuring locations for Forms](/help/forms/using/admin-help/configuring-locations-forms.md#configuring-locations-for-forms).

## Specifying the cache mode {#specifying-the-cache-mode}

Forms supports two modes of caching:

* unconditional
* using the cache check point

If you switch between cache modes, restart the Forms service for the change to take effect. To restart this service, either use Workbench or see [Start or stop the services associated with AEM forms modules](/help/forms/using/admin-help/starting-stopping-services.md#start-or-stop-the-services-associated-with-aem-forms-modules) for instructions.

The cache check point time is reset automatically when you switch between modes.

### Using unconditional caching {#using-unconditional-caching}

In this mode, when the Forms service receives a request, it validates the resources (forms design and any related assets such as fragments and images) that are required. The Forms service compares the timestamp of the resources in the repository to the timestamp of the resources in the cache. If the resource in the cache is older, the Forms service updates it.

This cache mode guarantees that the most recent resources are used. However, performance is affected because the Forms service validates the cached items against the repository with each request. This cache mode is suitable for development and staging environments where resources are updated frequently and performance is not a primary concern.

**Specify unconditional caching**

1. In administration console, click Services &gt; Forms.
1. Under Forms Cache Control Settings, select Unconditionally and click Save.

### Use the cache check point {#use-the-cache-check-point}

In this mode, the Forms service only checks the repository for newer versions of resources when the timestamp of the cached resource is older than the cache check point time. The last cache check point time is displayed on the Forms page in Administration Console.

Use this cache mode in high-performance production environments where performance is a concern and changes to resources are infrequent. You can reset the cache check point time when you want to deploy any changes made to the repository resources.

**Specify the use of a cache check point**

1. In Administration Console, click Services &gt; Forms.
1. Under Forms Cache Control Settings, select Only If Their Last Validation Was Done Prior To Cache Check Point Time and click Save.

**Reset the cache check point**

1. In administration console, click Services &gt; Forms.
1. Under Forms Cache Control Settings, click Cache Check Point.

**Reset the cache contents**

You can clear the contents of the cache at any time. After a cache reset, the first request for each form is slower because the Forms service performs a complete rendering and creates new cache content.

1. In administration console, click Services &gt; Forms.
1. Under Forms Cache Control Settings, click Reset Cache.

## Configuring cache settings {#configuring-cache-settings}

You can specify settings that Forms uses for caching, which can optimize the performance of your AEM forms environment.

To access these settings, in administration console, click Services &gt; Forms.

>[!NOTE]
>
>Disk requirements for the cache should be equal to the repository.

### Specifying global cache settings {#specifying-global-cache-settings}

The settings in the **Global Cache Settings** area affect all types of caches. If you change either of these settings, restart the Forms service for the change to take effect. To restart this service, either use Workbench or see [Start or stop the services associated with AEM forms modules](/help/forms/using/admin-help/starting-stopping-services.md#start-or-stop-the-services-associated-with-aem-forms-modules) for instructions.

**Max Cache Document Size (KB):** The maximum size, in kilobytes, of a form design or other resource that can be stored in any in-memory cache. This is a global setting that applies to all in-memory caches. If a resource is larger than this value, it is not cached in memory. The default value is 1024 kilobytes. This setting does not affect the disk cache.

**Form Rendering Cache Enabled:** By default, this option is selected, which means that rendered forms are cached for subsequent retrieval. This setting improves performance because the Forms service only has to render a particular form once, and then it uses the cached version. This option works with the form design’s caching property. For information about configuring this value in the form design, see Designer Help.

### Caching form designs {#caching-form-designs}

When the Forms service receives a render request, it retrieves the form design from the repository and caches it. This caching improves performance because for subsequent render requests, the Forms service retrieves the form design from the cache instead of from the repository.

The Forms service always caches form designs on disk. If form designs are stored on the server, those files are considered the disk cache. The Forms service also caches form designs in memory, according to the setting in the **In Memory Template Cache** area. If you change any of these settings, restart the Forms service for the change to take effect. To restart this service, either use Workbench or see [Start or stop the services associated with AEM forms modules](/help/forms/using/admin-help/starting-stopping-services.md#start-or-stop-the-services-associated-with-aem-forms-modules) for instructions.

**Template Configuration Cache Size:** The maximum number of template configuration objects to keep in memory. The default value is 100. It is recommended that you set this value greater than or equal to the Template Cache Size value. This setting does not affect the disk cache.

**Template Cache Size:** The maximum number of template content objects to keep in memory. The default value is 100. This setting does not affect the disk cache.

**Enabled:** By default, this check box is selected, meaning that form templates are cached in memory. When this option is not selected, form templates are cached only on disk.

### Caching rendered forms {#caching-rendered-forms}

The Forms service caches rendered forms so that it does not need to resolve and render the same form in subsequent requests. Rendered forms are cached both on disk and in memory.

These settings are in the **In Memory Form Rendering Cache** area. If you change either of these settings, restart the Forms service for the change to take effect. To restart this service, either use Workbench or see [Start or stop the services associated with AEM forms modules](/help/forms/using/admin-help/starting-stopping-services.md#start-or-stop-the-services-associated-with-aem-forms-modules) for instructions.

**Cache Size:** Specifies the maximum number of rendered forms that can reside in the in-memory cache. The default value is 100. This setting does not affect the disk cache.

**Enabled:** By default, this option is selected, meaning that rendered forms are cached in memory. When this option is not selected, rendered forms are cached only on disk.

### Caching fragments and images {#caching-fragments-and-images}

The Forms service caches fragments and images use in form designs on disk. This improves performance because the fragments and images are only read from the repository on the first request. Then on subsequent requests, the Forms service reads fragments and images from the disk cache. Fragments and images are cached only on disk, and not in memory.

You can use the following settings to control the on-disk caching of fragments and images. These settings are in the **Template Resource Cache Settings** area:

**Resource Caching** Select one of the following options from the list:

**Enabled for fragments and images:** The Forms service caches fragments and images. This is the default option.

**Enabled for fragments:** The Forms service caches fragments, but not images.

**Disabled:** The Forms service does not cache fragments or images.

**Cleanup Interval (Seconds):** Specifies how often the Forms service removes old invalid cache files. The Forms service does not remove valid cache files. If you change the cleanup interval, restart the Forms service for the change to take effect. To restart this service, either use Workbench or see Start or stop the services associated with AEM forms modules for instructions. The default value is 600 seconds.

## Clustering considerations for caches {#clustering-considerations-for-caches}

In a clustered environment, each node maintains its own in-memory and disk cache. The cache contents on each node depends on which forms have been rendered on that node.

The location of the cache must be identical (same disk and path) on each node of the cluster. Do not place the cache on shared storage.

If you use the Forms page in administration console to change the cache settings for a particular node, the cache settings on other nodes are updated when a request goes to that node. This behavior also applies to the Reset Cache button. If you click the Reset Cache button for one node, the cache is immediately removed from that node. The cache on other nodes is cleared when a request goes to that node.
