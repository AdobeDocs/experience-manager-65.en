---
title: Performance tuning of AEM Forms server
description: For AEM Forms to perform optimally, you can fine-tune the cache settings and JVM parameters. Also, using a web server can enhance the performance of AEM Forms deployment.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: Configuration
docset: aem65
role: Admin,User
exl-id: 22926757-9cdb-4f8a-9bd9-16ddbc3f954a
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Performance tuning of AEM Forms Server{#performance-tuning-of-aem-forms-server}

This article discusses strategies and best practices that you can implement to reduce bottlenecks and optimize the performance of your AEM Forms deployment.

## Cache settings {#cache-settings}

You can configure and control the caching strategy for AEM Forms using the **Mobile Forms Configurations** component in the AEM Web Configuration Console at:

* (AEM Forms on OSGi) `https://'[server]:[port]'/system/console/configMgr`
* (AEM Forms on JEE) `https://'[server]:[port]'/lc/system/console/configMgr`

The available options for caching are as follows:

* **None**: Enforces not to cache any artifact. This will, in practice, slows the performance and requires high memory availability due to the absence of cache.
* **Conservative**: Dictates to cache only those intermediate artifacts that are generated before rendering the form, such as a template containing inline fragments and images.
* **Aggressive**: Enforces to cache almost everything that can be cached, including rendered HTML content besides all the artifacts from the Conservative caching level. It results in the best performance but also consumes more memory for storing cached artifacts. Aggressive caching strategy means you get constant time performance in rendering a form as the rendered content is cached.

The default cache settings for AEM Forms may not be good enough to achieve optimal performance. Therefore, it is recommended to use the following settings:

* **Cache Strategy**: Aggressive
* **Cache size** (in terms of number of forms): As required
* **Max Object Size**: As required

![Mobile Forms Configurations](assets/snap.png)

>[!NOTE]
>
>If you use AEM Dispatcher to cache adaptive forms, it also caches adaptive form which contains forms with pre-filled data. If such forms are served from the AEM Dispatcher cache, it may lead to serving pre-filled or stale data to the users. So, use AEM Dispatcher to cache adaptive forms which do not use pre-filled data. Moreover, a Dispatcher cache does not auto-invalidate cached fragments. So, do not use it to cache form fragments. For such forms and fragments, use [Adaptive forms cache](../../forms/using/configure-adaptive-forms-cache.md).

## JVM parameters {#jvm-parameters}

For optimal performance, it is recommended to use the following JVM `init` arguments to configure the `Java heap` and `PermGen`.

```shell
set CQ_JVM_OPTS=%CQ_JVM_OPTS% -Xms8192m
set CQ_JVM_OPTS=%CQ_JVM_OPTS% -Xmx8192m
set CQ_JVM_OPTS=%CQ_JVM_OPTS% -XX:PermSize=256m
set CQ_JVM_OPTS=%CQ_JVM_OPTS% -XX:MaxPermSize=1024m
```

>[!NOTE]
>
>The recommended settings are for Windows 2008 R2 8 Core and Oracle HotSpot 1.7 (64-bit) JDK and should be scaled up or down as per your system configuration.

## Using a web server {#using-a-web-server}

Adaptive forms and HTML5 forms render in HTML5 format. The resultant output could be large depending on factors like the form size and images in the form. To optimize the data transfer, the recommended approach is to compress the HTML response using the web server from which the request is being served. This approach reduces the response size, network traffic, and the time required to stream data between server and client machines.

For example, perform the following steps to enable compression on Apache Web Server 2.0 32-bit with JBoss&reg;:

>[!NOTE]
>
>The following instructions do not apply to any server other than the Apache Web Server 2.0 32-bit. For steps specific to any other server, see the corresponding product documentation.

The following steps demonstrate changes required to enable compression with Apache Web Server

**Obtain the Apache web server software applicable to your operating system**

* Windows: download the Apache web server from the Apache HTTP Server Project site.
* Solaris&trade; 64-bit: download the Apache web server from the Sunfreeware for Solaris&trade; Website.
* Linux&reg;: the Apache web server is preinstalled on a Linux&reg; system.

Apache can communicate to CRX using the HTTP protocol. The configurations are for optimization using HTTP.

1. Uncomment the following module configurations in `APACHE_HOME/conf/httpd.conf` file.

   ```shell
   LoadModule proxy_balancer_module modules/mod_proxy.so
   LoadModule proxy_balancer_module modules/mod_proxy_http.so
   LoadModule deflate_module modules/mod_deflate.so
   ```

   >[!NOTE]
   >
   >For Linux&reg;, the default `APACHE_HOME` is `/etc/httpd/`.

1. Configure the proxy on port 4502 of crx.
   Add following configuration in `APACHE_HOME/conf/httpd.conf` configuration file.

   ```shell
   ProxyPass / https://<server>:4502/
   ProxyPassReverse / https://<server>:4502/
   ```

1. Enable Compression. Add following configuration in `APACHE_HOME/conf/httpd.conf` configuration file.

   **For HTML5 forms**

   ```xml
   <Location /content/xfaforms>
       <IfModule mod_deflate.c>
           SetOutputFilter DEFLATE
           #Do not compress
           SetEnvIfNoCase Request_URI \.(?:gif|jpe?g|png)$ no-gzip dont-vary
           SetEnvIfNoCase Request_URI \.(?:exe|t?gz|zip|bz2|sit|rar)$ no-gzip dont-vary
           #Dealing with proxy servers
               <IfModule mod_headers.c>
                   Header append Vary User-Agent
               </IfModule>
       </IfModule>
   </Location>
   ```

   **For adaptive forms**

   ```xml
   <Location /content/forms/af>
       <IfModule mod_deflate.c>
           SetOutputFilter DEFLATE
           #Do not compress
           SetEnvIfNoCase Request_URI \.(?:gif|jpe?g|png)$ no-gzip dont-vary
           SetEnvIfNoCase Request_URI \.(?:exe|t?gz|zip|bz2|sit|rar)$ no-gzip dont-vary
           #Dealing with proxy servers
               <IfModule mod_headers.c>
                   Header append Vary User-Agent
               </IfModule>
       </IfModule>
   </Location>
   ```

   To access the crx server, use `https://'server':80`, where `server` is the name of the server on which the Apache server is running.

## Using an antivirus on server running AEM Forms {#using-an-antivirus-on-server-running-aem-forms}

You can experience slow performance on the servers running an antivirus software. An always-on antivirus (on-access scanning) software scans all the files of a system. It can slow down the server and the performance of the AEM Forms is impacted.

To improve the performance, you can direct the antivirus software to exclude the following AEM Forms files and folders from always on (on-access) scanning:

* AEM Installation directory. If it is not possible to exclude the complete directory, exclude the following:

    * [AEM installation directory]\crx-repository\temp
    * [AEM installation directory]\crx-repository\repository
    * [AEM installation directory]\crx-repository\launchpad

* Application server temporary directory. The default location is:

    * (JBoss&reg;) [AEM installation directory]\jboss\standalone\tmp
    * (WebLogic) \Oracle\Middleware\user_projects\domains\LCDomain\servers\LCServer1\tmp
    * (WebSphere&reg;) \Program Files\IBM\WebSphere\AppServer\profiles\AppSrv01\temp

* **(AEM Forms on JEE only)** Global Document Storage (GDS) directory. The default location is:

    * (JBoss&reg;) [appserver root]/server/'server'/svcnative/DocumentStorage
    * (WebLogic) [appserverdomain]/'server'/adobe/LiveCycleServer/DocumentStorage
    * (WebSphere&reg;) [appserver root]/installedApps/adobe/'server'/DocumentStorage

* **(AEM Forms on JEE only)** AEM Forms Server logs and temporary directory. The default location is:

    * Server logs - [AEM Forms installation directory]\Adobe\AEM forms\[app-server]\server\all\logs
    * Temp directory - [AEM Forms installation directory]\temp

>[!NOTE]
>
>* If you are using a different location for GDS and temporary directory, open AdminUI at `https://'[server]:[port]'/adminui`, navigate to **Home &gt; Settings &gt; Core System Settings &gt; Core Configurations** to confirm the location in use.
>
>* If the AEM Forms Server performs slow even after excluding the suggested directories, then exclude the Java&trade; executable file (java.exe) also.
>
