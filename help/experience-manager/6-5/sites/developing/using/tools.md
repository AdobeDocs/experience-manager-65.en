---
title: Testing and Tracking Tools
seo-title: Testing and Tracking Tools
description: AEM provides a framework for testing component UI and a mechanism for testing and debugging components
seo-description: AEM provides a framework for testing component UI and a mechanism for testing and debugging components
uuid: a156dcd8-cee0-48f9-a1dc-e78f0c8f1a3f
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: testing
content-type: reference
discoiquuid: ec8677b4-775f-4698-91f8-dafce56e846a
index: y
internal: n
snippet: y
---

# Testing and Tracking Tools{#testing-and-tracking-tools}

#### Testing {#testing}

AEM provides:

* a [framework for testing component UI](../../../../6-5/sites/developing/using/hobbes.md). 
* [a mechanism for testing and debugging components](../../../../6-5/sites/developing/using/developer-mode.md).

The following are two Open Source Testing tools:

**Selenium**

Selenium is used for function testing in a browser with one user per activity. It records testing steps (clicks) as either HTML tables or Java classes.

For more information see [http://www.seleniumhq.org/](http://www.seleniumhq.org/).

**JMeter**

JMeter is used to track requests and can be used for functional, performance and stress tests.

For more information see [http://jakarta.apache.org/jmeter/](http://jakarta.apache.org/jmeter).

There are also many proprietary tools for automating tests and managing test plans.

#### Tracking {#tracking}

The following tools are easily available. However a key issue in all cases is the availability of the data to all members of the project team - partner and customer.

**Bugzilla**

A bug-tracking system which can be configured to your own requirements.

**Spreadsheets**

Although not specifically a bug-tracking tool, spreadsheets are often *mis*used for this purpose as they are easy to understand and most users have experience of their functionality.

If these are used for tracking then:

* they should be kept simple.
* the number of individual spreadsheets should be kept to a minimum.
* they must be updated regularly.
* only one master copy should be maintained and everyone should know where the master copy is.
* they should be accessible to all project members.
* if security is an issue (often occurs at large companies) and common access is not possible, then copies may be distributed as long as everyone understands that these are copies and cannot be updated.

Again there are many proprietary tools for tracking bugs and feature requirements.
