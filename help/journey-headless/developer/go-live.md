---
title: How to Go Live with Your Headless Application
description: In this part of the AEM Headless Developer Journey, learn how to deploy a headless application live by taking your local code in Git and moving it to Cloud Manager Git for the CI/CD pipeline.
exl-id: 81616e31-764b-44b0-94a6-3ae24ce56bf6
---
# How to Go Live with Your Headless Application {#go-live}

In this part of the [AEM Headless Developer Journey](overview.md), learn how to deploy a headless application live by taking your local code in Git and moving it to Cloud Manager Git for the CI/CD pipeline.

## The Story So Far {#story-so-far}

In the previous document of the AEM headless journey, [How to Update Your Content via AEM Assets APIs](update-your-content.md) you learned how to update your existing headless content in AEM via API and you should now:

* Understand the AEM Assets HTTP API.

This article builds on those fundamentals so you understand how to prepare your own AEM headless project to go live.

## Objective {#objective}

This document helps you understand the AEM headless publication pipeline and the performance considerations you need to be aware of before you go live with your application.

* Learn about the AEM SDK and the development tooling required
* Set up a local development runtime to simulate your content before going live
* Understand AEM Content Replication and Caching Basics
* Secure and Scale your application before Launch
* Monitor Performance and Debug Issues

## The AEM SDK {#the-aem-sdk}

The AEM SDK is used to build and deploy custom code. It is the main tool you need in order to develop and test your headless application before going live. It contains the following artifacts:

* The Quickstart jar - an executable jar file that can be used to set up both an author and a publish instance
* Dispatcher tools - the Dispatcher module and its dependencies for Windows and UNIX based systems
* Java API Jar - The Java Jar/Maven Dependency that exposes all allowed Java APIs that can be used to develop against AEM
* Javadoc jar - the javadocs for the Java API jar

## Additional Development Tools {#additional-development-tools}

In addition to the AEM SDK, you will need additional tooling that facilitates developing and testing your code and content locally:

* Java
* Git
* Apache Maven
* The Node.js library
* The IDE of your choice

Because AEM is a Java application, you need to install Java and the Java SDK to support the development of AEM as a Cloud Service.

Git is what you will use to manage source control as well as to check in the changes to Cloud Manager and then deploy them to a production instance.

AEM uses Apache Maven to build projects projects generated from the AEM Maven Project archetype. All major IDEs provide integration support for Maven.

Node.js is a JavaScript runtime environment used to work with the front-end assets of an AEM project’s `ui.frontend` sub-project. Node.js is distributed with npm, is the de facto Node.js package manager, used to manage JavaScript dependencies.

## Components of an AEM System at a Glance {#components-of-an-aem-system-at-a-glance}

Next, let's take a look at the constituent parts of an AEM environment.

A full AEM environment is made up of an Author, Publish, and Dispatcher. These same components will be made available in the local development runtime in order to make it easier for you to preview your code and content before going live.

* **The Author service** is where internal users create, manage, and preview content.

* **The Publish service** is considered the “Live” environment and is typically what end users interact with. Content, after being edited and approved on the Author service, is distributed to the Publish service. The most common deployment pattern with AEM headless applications is to have the production version of the application connect to an AEM Publish service.

* **The Dispatcher** is a static web server augmented with the AEM dispatcher module. It caches web pages produced by the publish instance to improve performance.

## The Local Development Workflow {#the-local-development-workflow}

The local development project is built on Apache Maven and is using Git for source control. In order to update the project, developers can use their preferred integrated development environment, such as Eclipse, Visual Studio Code or or IntelliJ, amongst others.

To test code or content updates that will be ingested by your headless application, you need to deploy the updates to the local AEM runtime, which includes local instances of the AEM author and publish services.

Make sure to take note of the distinctions between each component in the local AEM runtime, as it is important to test your updates where they matter the most. For example, test content updates on author or test new code on the publish instance.

In a production system, a dispatcher and an http Apache server will always sit in front of an AEM publish instance. They provide caching and security services for the AEM system, so it is paramount to test code and content updates against the dispatcher as well.

## Previewing Your Code and Content Locally with The Local Development Environment {#previewing-your-code-and-content-locally-with-the-local-development-environment}

In order to prepare your AEM headless project for launch, you need to make sure all constituent parts of your project are functioning well.

To do that, you need to put everything together: code, content and configuration and test it in a local development environment for go live readiness.

The local development environment is comprised of three main areas:

1. The AEM Project - this will contain all the custom code, configuration and content the AEM developers are going to be working on
1. The Local AEM Runtime - local versions of the AEM author and publish services that will be used to deploy code from the AEM project
1. The Local Dispatcher Runtime - a local version of the Apache htttpd webserver that includes the Dispatcher module

Once the local development environment is set up, you can simulate content serving to the React app by deploying a static Node server locally.

In order to get a more in depth look at setting up a local development environment and all dependencies needed for content preview see [Production Deployment documentation](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/graphql/multi-step/production-deployment.html?lang=en#prerequisites).

## Prepare your AEM Headless Application for Go-Live {#prepare-your-aem-headless-application-for-golive}

Now, it's time to get your AEM headless application ready for launch, by following the best practices outlined below.

### Secure and Scale your Headless Application Before Launch {#secure-and-scale-before-launch}

1. Configure [Token Based Authentication](/help/assets/content-fragments/graphql-authentication-content-fragments.md) with your GraphQL requests
1. Configure [Caching](/help/implementing/dispatcher/caching.md).

### Model Structure vs GraphQL Output {#structure-vs-output}

* Avoid creating queries that output more than 15kb of JSON (gzip compressed). Long JSON files are resource intensive for client application to parse.
* Avoid more than five nested levels of fragment hierarchies. Additional levels make it hard for content authors to consider the impact of their changes.
* Use multi-object queries instead of modeling queries with dependency hierarchies within the models. This allows more long-term flexibility to restructure JSON output without having to do a lot of content changes.

### Maximize CDN Cache-Hit Ratio {#maximize-cdn}

* Do not use direct GraphQL queries, unless you are requesting live content from the surface.
  * Use persisted queries whenever possible.
  * Provide CDN TTL above 600 seconds in order for the CDN to cache them.
  * AEM can calculate the impact of a model change to existing queries.
* Split JSON files/GraphQL queries between low and high content change rate in order to reduce client traffic to CDN and assign higher TTL. This minimizes the CDN revalidating the JSON with the origin server.
* To actively invalidate content from the CDN use Soft Purge. This allows the CDN to re-download the content without causing a cache miss.

### Improve Time to Download Headless Content {#improve-download-time}

* Make sure HTTP clients use HTTP/2.
* Make sure HTTP clients Accept Headers request for gzip.
* Minimize the number of domains used to host JSON and referenced artifacts.
* Leverage `Last-modified-since` to refresh resources.
* Use `_reference` output in JSON file to start downloading assets without having to parse complete JSON files.

## Deploy to Production {#deploy-to-production}

Once you make sure everything has been tested and is working properly, you are ready to push your code updates to a [centralized Git repository in Cloud Manager](https://experienceleague.adobe.com/docs/experience-manager-cloud-manager/using/managing-code/setup-cloud-manager-git-integration.html).

After the updates have been uploaded to Cloud Manager, they can be deployed to AEM as a Cloud Service using [Cloud Manager's CI/CD pipeline](https://experienceleague.adobe.com/docs/experience-manager-cloud-manager/using/how-to-use/deploying-code.html).

You can start deploying your code by leveraging the Cloud Manager CI/CD pipeline, which is covered extensively [here](/help/implementing/deploying/overview.md).

## Performance Monitoring {#performance-monitoring}

In order for users to have the best possible experience when using the AEM headless application, it is important that you monitor key performance metrics, as detailed below:

* Validate preview and production versions of the app
* Verify AEM status pages for current service availability status
* Access performance reports
  * Delivery Performance
    * CDN (Fastly) performance – check number of calls, cache rate, error rates and payload traffic
    * Origin servers - number of calls, error rates, CPU loads, payload traffic
  * Author Performance
    * Check number of users, requests and load
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
* Inspect the JSON in the client application to check for the presence of client application or delivery issues
* Inspect the JSON using GraphQL to check for the presence of issues related to cached content or AEM

### Logging a Bug with Support {#logging-a-bug-with-support}

In order to efficiently log a bug with Support in case you need further assistance, follow the below steps:

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
* What do do after the go-live.

You have either already launched your first AEM Headless project or now have all the knowledge you need to do so. Great job!

### Explore Single Page Applications {#explore-spa}

The headless stores in AEM doesn't need to stop here, though. You might remember in the [Getting Started part of the journey](getting-started.md#integration-levels) we discussed briefly how AEM not only supports headless delivery and traditional full-stack models, but also can support hybrid models that combines the advantages of both.

If this kind of flexibility is something you need for your project, continue on to the optional, additional part of the journey, [How to Create Single Page Applications (SPAs) with AEM.](create-spa.md)

## Additional Resources {#additional-resources}

* [An Overview of Deploying to AEM as a Cloud Service](/help/implementing/deploying/overview.md)
* [The AEM as a Cloud Service SDK](/help/implementing/developing/introduction/aem-as-a-cloud-service-sdk.md)
* [Set Up A Local AEM Environment](https://experienceleague.adobe.com/docs/experience-manager-learn/foundation/development/set-up-a-local-aem-development-environment.html)
* [Use Cloud Manager to Deploy Your Code](https://experienceleague.adobe.com/docs/experience-manager-cloud-manager/using/how-to-use/deploying-code.html)
* [Integrate the Cloud Manager Git Repository with an External Git Repository and Deploy a Project to AEM as a Cloud Service](https://experienceleague.adobe.com/docs/experience-manager-learn/cloud-service/cloud-manager/devops/deploy-code.html)
