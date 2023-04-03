---
title: How to Go Live with Your Headless Application
description: In this part of the AEM Headless Developer Journey, learn how to deploy a headless application live.
exl-id: ec3356ef-9e60-4151-984d-3ebdab593b96
---
# How to Go Live with Your Headless Application {#go-live}

In this part of the [AEM Headless Developer Journey](overview.md), learn how to deploy a headless application live.

## The Story So Far {#story-so-far}

In the previous document of the AEM headless journey, [How to Update Your Content via AEM Assets APIs](update-your-content.md) you learned how to update your existing headless content in AEM via API and you should now:

* Understand the AEM Assets HTTP API.

This article builds on those fundamentals so you understand how to prepare your own AEM headless project to go live.

## Objective {#objective}

This document helps you understand the AEM headless publication pipeline and the performance considerations you must be aware of before you go live with your application.

* Learn about the AEM SDK and the development tooling required
* Set up a local development runtime to simulate your content before going live
* Understand AEM Content Replication and Caching Basics
* Secure and Scale your application before Launch
* Monitor Performance and Debug Issues

## The AEM SDK {#the-aem-sdk}

The AEM SDK is used to build and deploy custom code. It is the main tool that you must develop and test your headless application before going live. It contains the following artifacts:

* The Quickstart jar - an executable jar file that can be used to set up both an author and a publish instance
* Dispatcher tools - the Dispatcher module and its dependencies for Windows and UNIX-based systems
* Java&trade; API Jar - The Java&trade; Jar/Maven Dependency that exposes all allowed Java&trade; APIs that can be used to develop against AEM
* Javadoc jar - the javadocs for the Java&trade; API jar

## Additional Development Tools {#additional-development-tools}

In addition to the AEM SDK, you need additional tooling that facilitates developing and testing your code and content locally:

* Java&trade;
* Git
* Apache Maven
* The Node.js library
* The IDE of your choice

Because AEM is a Java&trade; application, you must install Java&trade; and the Java&trade; SDK to support the development of AEM as a Cloud Service.

Git is what you use to manage source control and to check in the changes to Cloud Manager and then deploy them to a production instance.

AEM uses Apache Maven to build projects generated from the AEM Maven Project archetype. All major IDEs provide integration support for Maven.

Node.js is a JavaScript runtime environment used to work with the front-end assets of an AEM project's `ui.frontend` sub-project. Node.js is distributed with npm, which is the de facto Node.js Package Manager, used to manage JavaScript dependencies.

## Components of an AEM System at a Glance {#components-of-an-aem-system-at-a-glance}

Next, let's look at the constituent parts of an AEM environment.

A full AEM environment is made up of an Author, Publish, and Dispatcher. These same components are made available in the local development runtime to make it easier for you to preview your code and content before going live.

* **The Author service** is where internal users create, manage, and preview content.

* **The Publish service** is considered the "Live" environment and is typically what end users interact with. Content, after being edited and approved on the Author service, is distributed (replicated) to the Publish service. The most common deployment pattern with AEM headless applications is to have the production version of the application connect to an AEM Publish service.

* **The Dispatcher** is a static web server augmented with the AEM Dispatcher module. It caches web pages produced by the publish instance to improve performance.

## The Local Development Workflow {#the-local-development-workflow}

The local development project is built on Apache Maven and is using Git for source control. To update the project, developers can use their preferred integrated development environment, such as Eclipse, Visual Studio Code, or IntelliJ, among others.

To test code or content updates that are ingested by your headless application, deploy the updates to the local AEM runtime. These include local instances of the AEM author and publish services.

Make sure to take note of the distinctions between each component in the local AEM runtime, as it is important to test your updates where they matter the most. For example, test content updates on author or test new code on the publish instance.

In a production system, a Dispatcher and an http Apache server will always sit in front of an AEM publish instance. They provide caching and security services for the AEM system, so it is paramount to test code and content updates against the Dispatcher as well.

## Previewing Your Code and Content Locally with The Local Development Environment {#previewing-your-code-and-content-locally-with-the-local-development-environment}

To prepare your AEM headless project for launch, make sure that all constituent parts of your project are functioning well.

To do that, you must put everything together: code, content, and configuration, and test it in a local development environment for go live readiness.

The local development environment is composed of three main areas:

1. The AEM Project - contains all the custom code, configuration, and content the AEM developers are going to be working on
1. The Local AEM Runtime - local versions of the AEM author and publish services that are used to deploy code from the AEM project
1. The Local Dispatcher Runtime - a local version of the Apache htttpd webserver that includes the Dispatcher module

After the local development environment is set up, you can simulate content serving to the React app by deploying a static Node server locally.

To get a more in-depth look at setting up a local development environment and all dependencies needed for content preview, see [Production Deployment documentation](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/deployments/overview.html?lang=en).

## Prepare your AEM Headless Application for Go-Live {#prepare-your-aem-headless-application-for-golive}

<!-- Start of CDN Review -->

Now, it's time to get your AEM headless application ready for launch, by following the best practices outlined below.

### Secure your Headless Application Before Launch {#secure-and-scale-before-launch}

1. Prepare [Authentication](/help/sites-developing/headless/graphql-api/graphql-authentication-content-fragments.md) for your GraphQL requests

### Model Structure vs GraphQL Output {#structure-vs-output}

* Avoid creating queries that output more than 15 KB of JSON (gzip compressed). Long JSON files are resource intensive for client application to parse.
* Avoid more than five nested levels of fragment hierarchies. Additional levels make it hard for content authors to consider the impact of their changes.
* Use multi-object queries instead of modeling queries with dependency hierarchies within the models. Doing so allows more long-term flexibility to restructure JSON output without having to do many content changes.

### Maximize CDN Cache-Hit Ratio {#maximize-cdn}

* Do not use direct GraphQL queries, unless you are requesting live content from the surface.
  * Use persisted queries whenever possible.
  * Provide CDN TTL above 600 seconds so the CDN can cache them.
  * AEM can calculate the impact of a model change to existing queries.
* Split JSON files/GraphQL queries between low and high content change rate to reduce client traffic to CDN and assign higher TTL. Doing so minimizes the CDN revalidating the JSON with the origin server.
* To actively invalidate content from the CDN, use Soft Purge. Doing so allows the CDN to re-download the content without causing a cache miss.

>[!NOTE]
>
>See [Additional Resources](#additional-resources) for more information about CDN and caching.

### Improve Time to Download Headless Content {#improve-download-time}

* Make sure HTTP clients use HTTP/2.
* Make sure HTTP clients Accept Headers request for gzip.
* Minimize the number of domains used to host JSON and referenced artifacts.
* Use `Last-modified-since` to refresh resources.
* Use `_reference` output in JSON file to start downloading assets without having to parse complete JSON files.

<!-- End of CDN Review -->

## Deploy to Production {#deploy-to-production}

Deploying to Production can depend on whether you have a *traditional* AEM instance that deploys using Maven, or are on Adobe Managed Services (AMS) and therefore using Cloud Manager.

## Deploy to Production using Maven {#deploy-to-production-maven}

For a *traditional* deployment (non-AMS) using Maven, see the [WKND Tutorial](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-wknd-tutorial-develop/project-archetype/project-setup.html?lang=en#build) for an overview.

## Deploy to Production using Cloud Manager {#deploy-to-production-cloud-manager}

If you are an AMS customer using Cloud Manager, after you make sure that everything is tested and working properly, you can push your code updates to a [centralized Git repository in Cloud Manager](https://experienceleague.adobe.com/docs/experience-manager-cloud-manager/content/managing-code/git-integration.html).

After the updates have been uploaded to Cloud Manager, deploy them to AEM using [Cloud Manager's CI/CD pipeline](https://experienceleague.adobe.com/docs/experience-manager-cloud-manager/content/using/code-deployment.html).

<!-- Can't find a parallel link -->
<!--
You can start deploying your code by leveraging the Cloud Manager CI/CD pipeline, which is covered extensively [here](/help/implementing/deploying/overview.md).
-->

## Performance Monitoring {#performance-monitoring}

For users to have the best possible experience when using the AEM headless application, it is important that you monitor key performance metrics, as detailed below:

* Validate preview and production versions of the app
* Verify AEM status pages for current service availability status
* Access performance reports
  * Delivery Performance
    * Origin servers - number of calls, error rates, CPU loads, payload traffic
  * Author Performance
    * Check number of users, requests, and load
* Access App and Space specific performance reports
  * Once the server is up, check whether the general metrics are green/orange/red, then identify specific app issues
  * Open same reports above filtered to app or space (for example Photoshop desktop, paywall)
  * Use Splunk log APIs to access service and application performance
  * Contact Customer Support in case there are other issues.

## Troubleshooting {#troubleshooting}

### Debugging {#debugging}

Follow these best practices as a general approach to debugging:

* Validate functionality and performance with the preview version of the application
* Validate functionality and performance with the production version of the application
* Validate with the JSON preview of the Content Fragment Editor
* To check for the presence of client application or delivery issues, inspect the JSON in the client application
* To check for the presence of issues related to cached content or AEM, inspect the JSON using GraphQL

### Logging a Bug with Support {#logging-a-bug-with-support}

To efficiently log a bug with Support, in case you need further assistance, complete the following steps:

* Take screenshots of the problem, if necessary
* Document a way to reproduce the issue
* Document the content the issue reproduces with
* Log an issue through the AEM Support portal with the appropriate priority

## The Journey Ends - Or Does It? {#journey-ends}

Congratulations! You have completed the AEM Headless Developer Journey! You should now have an understanding of:

* The difference between headless and headful content delivery.
* AEM's headless features.
* How to organize and AEM Headless project.
* How to create headless content in AEM.
* How to retrieve and update headless content in AEM.
* How to go live with an AEM Headless project.
* What to do after the go-live is completed.

You have either already launched your first AEM Headless project or now have all the knowledge to do so. Great job!

### Explore Single Page Applications {#explore-spa}

No need to stop the headless stores in AEM, though. In the [Getting Started part of the journey](getting-started.md#integration-levels), it discussed how AEM not only supports headless delivery and traditional full-stack models, but also supports hybrid models that combine the advantages of both.

If this kind of flexibility is something you need for your project, continue to the optional, additional part of the journey, [How to Create Single Page Applications (SPAs) with AEM.](create-spa.md)

## Additional Resources {#additional-resources}

* [AEM Developing Guide](https://experienceleague.adobe.com/docs/experience-manager-65/developing/introduction/the-basics.html?lang=en)

* [WKND Tutorial](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-wknd-tutorial-develop/overview.html?lang=en)

* [Cloud Manager for AEM](https://experienceleague.adobe.com/docs/experience-manager-cloud-manager/content/introduction.html?lang=en) 

* CDN Cache

  * [Controlling a CDN Cache](https://experienceleague.adobe.com/docs/experience-manager-dispatcher/using/dispatcher.html#controlling-a-cdn-cache)

  * Configuring the [CDN Rewriter](https://experienceleague.adobe.com/docs/experience-manager-65/deploying/configuring/osgi-configuration-settings.html) (*search for CDN Rewriter*)
