---
title: Extending [!DNL Adobe Experience Manager] 6.5 using Adobe Developer App Builder.
description: Extending [!DNL Adobe Experience Manager] 6.5 using Adobe Developer App Builder.
exl-id: 8221c2db-82d4-43df-ad38-e8e7831541ac
---
# Extending [!DNL Adobe Experience Manager] using Adobe Developer App Builder {#extend-using-app-builder}

## What is App Builder for AEM {#project-appbuilder}

The new Adobe Developer App Builder provides an extensibility framework for a developer to easily extend AEM functionalities. 

App Builder provides a unified third-party extensibility framework for integrating and creating custom experiences that extend Adobe Experience Manager. With this complete extensibility framework, built on Adobe's infrastructure, developers can build custom microservices, extend, and integrate Adobe Experience Manager across Adobe solutions and the rest of the IT stack.

App Builder provides a way for customers to easily extend Adobe Experience Manager in various use cases:

* Middleware Extensibility - Connect external systems with Adobe applications building custom connectors or leverage a suite of pre-built integrations.
* Core Services Extensibility - Extend core application capabilities by extending the default behavior with custom features & business logic.
* User Experience Extensibility - Extend core experience to support business requirements or build customer-specific digital properties, storefronts & back-office apps.

App Builder has been available to enterprise customers and partners via our Developer Preview since Summer 2020. General availability (GA) of App Builder is scheduled for December 2021. We welcome developers to try out App Builder through our [Trial Program](https://adobe.ly/appbuilder-trial).

>[!NOTE]
>
>For AEM as a Cloud Service customers who want to leverage the App Builder, please go to [Extending Adobe Experience Manager as a Cloud Service using Adobe Developer App Builder](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/implementing/configuring-and-extending/app-builder.html).

## Architecture {#architecture}

Instead of an out-of-the-box solution, Adobe Developer App Builder provides a common, consistent, standardized development platform for extending Adobe Cloud solutions such as AEM including:

* Adobe Developer Console — For custom microservice and extension development, letting developers build and manage projects while accessing all the tools and APIs they need to create plugins and integrations. 
* Developer Tools — Open-source tools, SDKs, and libraries to allow developers to easily build custom extensions and integrations. Use  React Spectrum (Adobe’s UI toolkit) to have one common UI for all Adobe apps. 
* Services — I/O Runtime for hosting infrastructure on our serverless platform, and I/O Events for event-based integrations. We also provide out-of-the-box support for storing data and files. 
* Adobe Experience Cloud — Developers can submit extensions and integrations to be published within their Experience Cloud Org. System admins can then review, manage, and approve these extensions. Once published, your custom App Builder extensions and tools can be found alongside other Adobe Experience Cloud apps.

The following diagram illustrates how a standard application built on App Builder leverages these functionalities:

![Architecture](assets/appbuilder-architecture.jpg)

For more details about the App Builder architecture, have a look at [Architecture Overview](https://www.adobe.io/app-builder/docs/guides/).

## Get Started with App Builder {#additional-resources}

To help you get started with App Builder we created a series of documentation to help you start:

* [App Builder Getting Started](https://www.adobe.io/app-builder/docs/getting_started/)

## Continue learning with Documentation {#appbuilder-documentation}

App Builder provides videos and documentation for developers including guides, and reference documentation to help you begin developing your own custom applications:

* [App Builder documentation](https://www.adobe.io/app-builder/docs/overview/)
* [App Builder videos](https://www.youtube.com/playlist?list=PLcVEYUqU7VRfDij-Jbjyw8S8EzW073F_o)

## Try Out One of the Sample Applications {#appbuilder-codesamples}

Ready to start developing? We have lots of sample applications to help you get going quickly:

* [App Builder Code Labs on Adobe Developer Website](https://www.adobe.io/app-builder/docs/resources/)

