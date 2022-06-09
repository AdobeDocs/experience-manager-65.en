---
title: Best Practices for Performance Testing
seo-title: Best Practices for Performance Testing
description: This article outlines the overall strategies and methodologies used for performance testing as well as some of the tools that are available to assist in the process.
seo-description: This article outlines the overall strategies and methodologies used for performance testing as well as some of the tools that are available to assist in the process.
uuid: ab8720d6-b864-4d00-9e07-2e1699cfe7db
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
discoiquuid: 669018a0-f6ef-42b2-9c6f-83d7dd5a7095
exl-id: fcac75e1-15c1-4a37-8d43-93c95267b903
---
# Best Practices for Performance Testing{#best-practices-for-performance-testing}

## Introduction {#introduction}

Performance testing is an important part of any AEM deployment. Depending on customer requirements, performance testing may be performed on the publish instances, author instances, or both.

This documentation will outline overall strategies and methodologies of performing performance tests as well as some of the tools that are made available by Adobe to assist in the process. Finally, we will analyze some of the tools that are available in AEM 6 to assist with performance tuning, both from a code analysis and system configuration perspective.

### Simulating Reality {#simulating-reality}

What is most important when performing performance tests is making sure that you mimic a production environment as closely as possible. While this can often be difficult, it is imperative to ensure the accuracy of these tests. When working on designing performance tests, it is important to take the following points into consideration:

* Production-like content

Many performance measurements in AEM, such as query response time, can be impacted by the size of the content on the system. It is important to make sure that the test environment has as close of a copy of the production data as possible.

* Production code

The AEM version and hotfixes deployed in production should be the same in the test environment. It is also important to test on the version of the code that is deployed to production.

* Production-like hardware and network configuration

The tests will be meaningless without an environment that resembles the production one as closely as possible. Ideally, the hardware specifications, network interfaces, load balancers and CDN should be identical to production in the test environment.

* Production load

Many performance issues are not seen until the system is under heavy load. Good performance tests should simulate the load that the production systems will be under at their peak.

### Setting Goals {#setting-goals}

Before starting on performance testing, it is necessary to set non functional requirements to specify load and response times. If you are migrating from an existing system, make sure that response time are similar to your current production values. For load, it is best to take the current peak load and double it. This will ensure that the website can continue to perform well as it grows.

### Tools {#tools}

There are many commercially available performance testing tools on the market. When running a load generating tool, it is important to ensure that the computers which are performing the tests have sufficient network bandwidth. Otherwise, once the test machine reaches the limits of its connection, no additional load will be generated on the environment under test.

#### Testing Tools {#testing-tools}

* Adobe’s **Tough Day** tool can be used to generate load on AEM instances and collect performance data. Adobe’s AEM engineering team actually uses the tool to do load testing of the AEM product itself. The scripts executed in Tough Day are configured via property files and JMX XML files. For more information, see the [Tough Day documentation](/help/sites-developing/tough-day.md).

* AEM provides out of the box tools to quickly see problematic queries, requests and error messages. For more information, see the [Diagnosis Tools](/help/sites-administering/operations-dashboard.md#diagnosis-tools) section of the Operations Dashboard documentation.
* Apache provides a product called **JMeter** that can be used for performance and load testing as well as functional behavior. It is open source software and free to use, but has a smaller feature set than enterprise products and a steeper learning curve. JMeter can be found on Apache’s website at [https://jmeter.apache.org/](https://jmeter.apache.org/)

* **Load Runner** is an enterprise grade load testing product. A free evaluation version is available. More information can be found at [https://www.microfocus.com/en-us/products/loadrunner-load-testing/overview](https://www.microfocus.com/en-us/products/loadrunner-load-testing/overview)

* Cloud based load testing tools like [Neustar](https://www.neustar.biz/services/web-performance/load-testing) can also be used.
* When it comes to testing mobile or responsive websites, a separate set of tools need to be used. They work by throttling network bandwidth, simulating slower mobile connections like 3G or EDGE. Among the more widely used tools are:

    * **[Network Link Conditioner](https://nshipster.com/network-link-conditioner/)** - it provides an easy to use UI and works at a fairly low level on the networking stack. It includes versions for OS X and iOS;
    * [**Charles**](https://www.charlesproxy.com/) - a web debugging proxy application that in addition to several other uses, provides network throttling. Versions are provided for Windows, OS X and Linux.

#### Optimization Tools {#optimization-tools}

**Monitoring**

The [Monitoring Performance](/help/sites-deploying/monitoring-and-maintaining.md#monitoring-performance) documentation is a good resource for tools and methods that can be used to diagnose issue and pinpoint areas for tuning.

**Developer Mode in Touch UI**

One of the new features in AEM 6’s touch UI is the Developer Mode. Just as authors can switch between edit and preview modes, developers can switch to developer mode in the author UI to see the render time for each of the components on the page and to see stack traces of any errors. For more information on developer mode, see this [CQ Gems presentation](https://docs.adobe.com/content/ddc/en/gems/aem-6-0-developer-mode.html).

**Using the rlog.jar to read the request logs**

For a more comprehensive analysis of the request logs on an AEM system, `rlog.jar` can be used to search through and sort the `request.log` files that AEM generates. This jar file is included with an AEM installation in the `/crx-quickstart/opt/helpers` folder. For more information on rlog tool and the request log in general, see the [Monitoring and Maintaining](/help/sites-deploying/monitoring-and-maintaining.md) documentation.

**The Explain Query Tool**

The [Explain Query tool](/help/sites-administering/operations-dashboard.md#explain-query) in ACS AEM Tools can be used to view the indexes that are used when running a query. This can be very useful when optimizing slow running queries.

**PageSpeed Tools**

Google’s PageSpeed tools offer site analysis for adherence to best practices for page performance as well as a plugin that can be installed alongside the dispatcher on an Apache instance for additional optimizations. For more information, see the [PageSpeed Tools Website](https://developers.google.com/speed/pagespeed/).

## Author Environment {#author-environment}

### Performing Tests {#performing-tests}

In order to conduct performance testing on the author environment it is necessary that you simulate the experience of production authors. This means that the author installations must contain all the components, OSGi bundles, UI customization, custom indexes and any other additions you have in place for the production author instances.

There are many automation frameworks available that are designed for performance and load testing. Custom scripts can be recorded in these tools and then played back to simulate a peak number of authors performing similar content creation and activation activities simultaneously. It is recommended you use the Tough Day tool to simulate activities like uploading thousands of assets or activating large numbers of pages.

For the types of environments that have requirements of heavy asset loading or page authoring it is imperative to use tools like Tough Day in order to ensure that the environment will operate efficiently under peak load. [WebDAV](/help/sites-administering/webdav-access.md) is a tool that does not require scripting and can also be used to load large amounts of assets.

#### MongoDB Specific Steps {#mongodb-specific-steps}

On systems with MongoDB backends, AEM provides several [JMX](/help/sites-administering/jmx-console.md) MBeans that need to be monitored when performing load or performance tests:

* The **Consolidated Cache Statistics** MBean. It can be accessed directly by going to:

`https://server:port/system/console/jmx/org.apache.jackrabbit.oak%3Aid%3D6%2Cname%3D%22Consolidated+Cache+statistics%22%2Ctype%3D%22ConsolidatedCacheStats%22`

For the cache named **Document-Diff**, the hit rate should be over `.90`. If the hit rate falls below 90%, it is likely that you will need to modify your `DocumentNodeStoreService` configuration. Adobe product support can recommend optimal settings for your environment.

* The **Oak Repository Statistics** Mbean. It can be accessed directly by going to:

`https://server:port/system/console/jmx/org.apache.jackrabbit.oak%3Aid%3D16%2Cname%3D%22Oak+Repository+Statistics%22%2Ctype%3D%22RepositoryStats%22`

The **ObservationQueueMaxLength** section will show the number of events in Oak’s observation queue over the last hours, minutes, seconds and weeks. Find the largest number of events in the "per hour" section. This number needs to be compared to the `oak.observation.queue-length` setting. If the highest number shown for the observation queue exceeds the `queue-length` setting:

1. Create a file named: `com.adobe.granite.repository.impl.SlingRepositoryManager.cfg` containing the parameter `oak.observation.queue‐length=50000`
1. Place it under the /crx-­‐quickstart/install folder. 

>[!NOTE]
>See also the KB article on [AEM 6.x | Performance Tuning Tips](https://helpx.adobe.com/experience-manager/kb/performance-tuning-tips.html)

The default setting is 10,000, but most deployments usually need to raise it to 20,000 or 50,000.

## Publish Environment {#publish-environment}

### Performing Tests {#performing-tests-1}

The most important part of a deployment that needs to be subjected to load tests is the end user facing publish or dispatcher environment.

Third party automated testing tools can be used to test the performance of the website. These tools will allow you to record steps that users will go through on the site and run many of these sessions at the same time to simulate the load that is typical of a production website.

Most production websites have optimizations in place like dispatcher caching and a content delivery network in place. When testing, you need to make sure that these optimizations are available for the test environment as well. In addition to monitoring response times for the end users, you also need to monitor system metrics on the publish servers and dispatchers to ensure that the system is not constrained by hardware resources.

On a system that does not require a high level of personalization, the dispatcher should cache most requests. As a result, the load on the publish instance should remain relatively flat. If a high level of personalization is required, it is recommended to use technologies such as iFrames or AJAX requests for the personalized content so as to allow as much dispatcher caching as possible.

For basic tests, Apache Bench can be used to measure web server response times and help to create load for measuring things like memory leaks. For more see the example in the [Monitoring documentation](/help/sites-deploying/monitoring-and-maintaining.md#apache-bench).

## Troubleshooting Performance Issues {#troubleshooting-performance-issues}

After running performance tests on the author instance, any issues will need to be investigated, diagnosed and addressed. You can use several tools and techniques when performing analysis and addressing issues:

* You can inspect the [Request Performance log](/help/sites-administering/operations-dashboard.md#request-performance) in the Operations Dashboard. This tool can be used to identify slow page requests
* Analyze slow running queries with the [Query Performance tool](/help/sites-administering/operations-dashboard.md#query-performance)

* Watch the error lof for errors or warnings. For more information, see [Logging](/help/sites-deploying/configure-logging.md)
* Monitor system hardware resources such as memory and CPU utilization, disk I/O or network I/O. These resources are often the causes of performance bottlenecks
* Optimize the architecture of the pages and how they are addressed to minimize the usage of URL parameters to allow for as much caching as possible
* Follow the [Performance Optimization](/help/sites-deploying/configuring-performance.md) and [Performance tuning tips](https://helpx.adobe.com/experience-manager/kb/performance-tuning-tips.html) documentation

* If issues are present with editing certain pages or components on author instances, use the TouchUI Developer Mode to inspect the page in question. This will provide a breakdown of each content area on the page as well as its load time
* Minify all JS and CSS on the site. For more information on how to do this, see this [blog post](https://blogs.adobe.com/foxes/enable-js-and-css-minification/).
* Eliminate embedded CSS and JS from the components. They should be included and minified with the client-side libraries to minimize the number of requests required to render the page
* Use browser tools like Chrome’s Network tab to inspect the server requests and see which are taking the longest.

Once problem areas are identified, application code can be inspected for performance optimizations. Any out of the box AEM features that are not performing properly can be addressed with Adobe Support.
