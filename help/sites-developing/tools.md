---
title: Testing and Tracking Tools
description: AEM provides a framework for testing component UI and a mechanism for testing and debugging components
uuid: 12abedb5-4ee7-4389-9340-e628adbbc053
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: testing
content-type: reference
discoiquuid: 3cf0fd8d-7fc8-468a-bb1e-1debb68a82a5
docset: aem65
exl-id: bb5d1c7c-56ce-4d1e-a3cb-4e74d6922137
---
# Testing and Tracking Tools{#testing-and-tracking-tools}

## Testing {#testing}

AEM provides:

* [a framework for testing component UI](/help/sites-developing/hobbes.md).
* [a mechanism for testing and debugging components](/help/sites-developing/developer-mode.md).

The following are two Open Source Testing tools:

**Selenium**

Selenium is used for function testing in a browser with one user per activity. It records testing steps (clicks) as either HTML tables or Java&trade; classes.

For more information, see [https://www.selenium.dev/](https://www.selenium.dev/).

**JMeter**

JMeter is used to track requests and can be used for functional, performance, and stress tests.

For more information, see [https://jmeter.apache.org/](https://jmeter.apache.org/).

There are also many proprietary tools for automating tests and managing test plans.

### Tracking {#tracking}

The following tools are easily available. However a key issue in all cases is the availability of the data to all members of the project team - partner and customer.

**Bugzilla**

A bug-tracking system which can be configured to your own requirements.

**Spreadsheets**

Although not specifically a bug-tracking tool, spreadsheets are often *mis*used for this purpose as they are easy to understand and most users have experience of their functionality.

If these spreadsheets are used for tracking, then:

* they should be kept simple.
* the number of individual spreadsheets should be kept to a minimum.
* they must be updated regularly.
* only one primary copy should be maintained and everyone should know where the primary copy is.
* they should be accessible to all project members.
* if security is an issue (often occurs at large companies) and common access is not possible, then copies may be distributed as long as everyone understands that these spreadsheets are copies and cannot be updated.

Again there are many proprietary tools for tracking bugs and feature requirements.
