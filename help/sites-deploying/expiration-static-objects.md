---
title: Expiration of Static Objects
description: Learn how to configure Adobe Experience Manager so that static objects do not expire (for a reasonable time period).
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: configuring
content-type: reference
feature: Configuring
exl-id: bfd5441c-19cc-4fa8-b597-b1221465f75d
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# Expiration of Static Objects{#expiration-of-static-objects}

Static objects (for example, icons) do not change. Therefore the system should be configured so that they do not expire (for a reasonable time period) and so reduce unnecessary traffic.

This has the following impact:

* Offloads requests from the server infrastructure.
* Increases performance of page loading, as the browser caches objects in the browser cache.

Expirations are specified by the HTTP standard regarding "expiration" of files (for example, see chapter 14.21 of [RFC 2616](https://www.ietf.org/rfc/rfc2616.txt) " Hypertext Transfer Protocol -- HTTP 1.1"). This standard uses the header to allow clients to cache objects until they are considered stale; such objects are cached for the specified amount of time without any status check being made to the originating server.

>[!NOTE]
>
>This configuration is separate from (and will not work for) the Dispatcher.
>
>The purpose of the Dispatcher is to cache data in front of Adobe Experience Manager (AEM).

All files, which are not dynamic and which do not change over time, can and should be cached. The configuration for the Apache HTTPD server could look like one of the following - dependent on the environment:

>[!CAUTION]
>
>Be careful when you define the time period during which an object is considered to be up-to-date. As there is *no check until the specified time period has expired*, the client can end up presenting old content from the cache.

1. **For an Author instance:**

   ```xml
   LoadModule expires_module modules/mod_expires.so
   <Location /libs>
     ExpiresByType text/css "access plus 1 month"
     ExpiresByType text/javascript "access plus 1 month"
     ExpiresByType image/png "access plus 1 month"
     ExpiresByType image/gif "access plus 1 month"
   </Location>
   ```

   This allows the intermediate cache (for example, the browser cache) to store CSS, JavaScript, PNG and GIF files for up to one month, until they expire. This means they do not need to be requested from AEM or the webserver, but can remain in the browser cache.

   Other sections of the site should not be cached on an author instance, as they are subject to change at any time.

1. **For a Publish instance:**

   ```xml
   LoadModule expires_module modules/mod_expires.so
   <Location /content>
     ExpiresByType text/css "access plus 1 day"
     ExpiresByType text/javascript "access plus 1 day"
     ExpiresByType image/png "access plus 1 day"
     ExpiresByType image/gif "access plus 1 day"
   </Location>
   <Location /etc/designs>
     ExpiresByType text/css "access plus 1 day"
     ExpiresByType text/javascript "access plus 1 day"
     ExpiresByType image/png "access plus 1 day"
     ExpiresByType image/gif "access plus 1 day"
   </Location>

   ```

   This allows the intermediate cache (for example, the browser cache) to store CSS, JavaScript, PNG and GIF files for up to one day in client caches. Although this example illustrates global settings for everything below `/content` and `/etc/designs`, you should make it more granular.

   Depending on how often your site is updated, you can also consider caching HTML pages. A reasonable time period would be one hour:

   ```xml
   <Location /content>
     ExpiresByType text/html "access plus 1 hour"
   </Location>
   ```

After you have configured the static objects, scan `request.log`, while selecting pages that hold such objects, to confirm that no (unnecessary) requests are being made for static objects.
