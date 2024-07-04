---
title: Configuring caching for Output
description: The Output service caches the form designs, fragments and images. Learn how to configure the caching for output.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_output
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 1015f5c9-6ab8-4656-a5c8-40f82b9938b9
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configuring caching for Output  {#configuring-caching-for-output}

The Output service merges XML form data with a form design created in Designer to create a document output stream in various formats.

The Output page in administration console contains settings that control the way the Output service caches items. You can adjust these settings to optimize the performance of the Output service.

The Output service caches the following items:

* **form designs:** The Output service caches form designs that it retrieves from the repository or from HTTP sources. This caching improves performance because for subsequent render requests, the Output service retrieves the form design from the cache instead of from the repository.
* **fragments and images:** The Output service can cache fragments and images used in form designs. When the Output service caches these objects, it improves performance because the fragments and images are only read from the repository on the first request.

Output stores the cache in two locations:

* **in memory:** Items are stored in memory for quick access. The in-memory cache has a limited size and is deleted when you restart the server.
* **on disk:** Items are stored in the server’s file system. The disk cache has a larger capacity than the in-memory cache and it is retained when you restart the server. The location of the disk cache depends on your application server. For information on changing the location of the disk cache, see [Specify file locations for Output](/help/forms/using/admin-help/specify-file-locations-output.md#specify-file-locations-for-output).

## Specifying the cache mode {#specifying-the-cache-mode}

Output supports two modes of caching:

* unconditional
* using the cache check point

If you switch between cache modes, restart the Output service for the change to take effect. To restart this service, either use Workbench or see [Start or stop the services associated with AEM forms modules](/help/forms/using/admin-help/starting-stopping-services.md#start-or-stop-the-services-associated-with-aem-forms-modules) for instructions.

The cache check point time is reset automatically when you switch between modes.

### Using unconditional caching {#using-unconditional-caching}

In this mode, when the Output service receives a request, it validates the resources (form design and any related assets such as fragments and images) that are required. The Output service compares the timestamp of the resources in the repository to the timestamp of the resources in the cache. If the resource in the cache is older, the Output service updates it.

This cache mode guarantees that the most recent resources are used. However, performance is affected because the Output service validates the cached items against the repository with each request. This cache mode is suitable for development and staging environments where resources are updated frequently and performance is not a primary concern.

**Specify unconditional caching**

1. In administration console, click Services &gt; output.
1. Under Output Cache Control Settings, select Unconditionally and click Save.

### Use the cache check point {#use-the-cache-check-point}

In this mode, the Output service only checks the repository for newer versions of resources when the timestamp of the cached resource is older than the cache check point time. The last cache check point time is displayed on the Output page in Administration Console.

Use this cache mode in high-performance production environments where performance is a concern and changes to resources are infrequent. You can reset the cache check point time when you want to deploy any changes made to the repository resources.

**Specify the use of a cache check point**

1. In Administration Console, click Services &gt; output.
1. Under Output Cache Control Settings, select Only If Their Last Validation Was Done Prior To Cache Check Point Time and click Save.

**Reset the cache check point**

1. In administration console, click Services &gt; output.
1. Under Output Cache Control Settings, click Cache Check Point.

### Reset the cache contents {#reset-the-cache-contents}

You can clear the contents of the cache at any time. After a cache reset, the first request for each form is slower because the Output service performs a complete rendering and creates new cache content.

1. In administration console, click Services &gt; output.
1. Under Output Cache Control Settings, click Reset Cache.

## Configuring cache settings {#configuring-cache-settings}

You can specify settings that Output uses for caching, which can optimize the performance of your AEM forms environment.

To access these settings, in administration console, click Services &gt; output.

>[!NOTE]
>
>Disk requirements for the cache should be equal to the repository.

### Specifying global cache settings {#specifying-global-cache-settings}

The settings in the **Global Cache Settings** area affect all types of caches. If you change either of these settings, restart the Output service for the change to take effect. To restart this service, either use Workbench or see [Start or stop the services associated with AEM forms modules](/help/forms/using/admin-help/starting-stopping-services.md#start-or-stop-the-services-associated-with-aem-forms-modules) for instructions.

**Max Cache Document Size (KB):** The maximum size, in kilobytes, of a form design or other resource that can be stored in any in-memory cache. This is a global setting that applies to all in-memory caches. If resource is larger than this value, it is not cached in memory. The default value is 1024 kilobytes. This setting does not affect the disk cache.

**Form Rendering Cache Enabled:** By default, this option is selected, which means that rendered forms are cached for subsequent retrieval. This setting has little effect on the performance of the Output service because it does not cache non-interactive documents. This option does have an effect when you use the Output service to non-interactive documents that are rendered on the client.

### Caching form designs {#caching-form-designs}

When the Output service receives a render request, it retrieves the form design from the repository or from an HTTP source and caches it. This caching improves performance because for subsequent render requests, the Output service retrieves the form design from the cache instead of from the repository.

The Output service always caches form designs on disk. If form designs are stored on the server, those files are considered the disk cache. The Output service also caches form designs in memory, according to the setting in the **In Memory Template Cache** area. If you change any of these settings, restart the Output service for the change to take effect. To restart this service, either use Workbench or see [Start or stop the services associated with AEM forms modules](/help/forms/using/admin-help/starting-stopping-services.md#start-or-stop-the-services-associated-with-aem-forms-modules) for instructions.

**Template Configuration Cache Size:** The maximum number of template configuration objects to keep in memory. The default value is 100. It is recommended that you set this value greater than or equal to the Template Cache Size value. This setting does not affect the disk cache.

**Template Cache Size:** The maximum number of template content objects to keep in memory. The default value is 100. This setting does not affect the disk cache.

**Enabled:** By default, this check box is selected, meaning that form templates are cached in memory. When this option is not selected, form templates are cached only on disk.

### Caching fragments and images {#caching-fragments-and-images}

The Output service caches fragments and images use in form designs on disk. This improves performance because the fragments and images are only read from the repository on the first request. Then on subsequent requests, the Output service reads fragments and images from the disk cache. Fragments and images are cached only on disk, and not in memory.

You can use the following settings to control the on-disk caching of fragments and images. These settings are in the **Template Resource Cache Settings** area:

**Resource Caching** Select one of the following options from the list:

**Enabled for fragments and images:** The Output service caches fragments and images. This is the default option.

**Enabled for fragments:** The Output service caches fragments, but not images.

**Disabled:** The Output service does not cache fragments or images.

**Cleanup Interval (Seconds):** Specifies how often the Output service removes old invalid cache files. The Output service does not remove valid cache files. If you change the cleanup interval, restart the Output service for the change to take effect. To restart this service, either use Workbench or see Start or stop the services associated with AEM forms modules for instructions.

## Clustering considerations for caches {#clustering-considerations-for-caches}

In a clustered environment, each node maintains its own in-memory and disk cache. The cache contents on each node depends on which forms have been rendered on that node.

The location of the cache must be identical (same disk and path) on each node of the cluster. Do not place the cache on shared storage.

If you use the Output page in administration console to change the cache settings for a particular node, the cache settings on other nodes are updated when a request goes to that node. This behavior also applies to the Reset Cache button. If you click the Reset Cache button for one node, the cache is immediately removed from that node. The cache on other nodes is cleared when a request goes to that node.
