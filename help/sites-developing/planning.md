---
title: Planning
description: Learn what you need to know to plan for your testing of Adobe Experience Manager.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: testing
content-type: reference
exl-id: ed662279-0679-4ba3-b744-6649fb8dda17
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Planning{#planning}

This document describes what you need to know to plan for your test. In addition you should answer these questions before conducting your tests:

* [Which Test Environments will be needed?](/help/sites-developing/test-environments.md)
* [Defining your Test Cases](/help/sites-developing/test-cases.md)
* [Testing - when and with whom?](/help/sites-developing/when-who.md)

## Before You Start {#before-you-start}

Before you start with the actual analysis and definition of tests review the following information:

**AEM Architecture** - See Basic Concepts to introduce yourself to the architecture and basic principles of AEM.

**Documentation** - See any of the documentation sections, or How To articles, for further information.

**Basic Principles of Testing** - You should be aware of the basic principles of Software Testing and Quality Assurance. Preferably you should have experience of testing projects.

There are many websites, books and courses which deal with such principles and so they will not be dealt with in detail in this document.

**Assumptions to Avoid** - The biggest assumption is that your website must service millions of requests every day. In certain circumstances this may be true, but it cannot be assumed.

Although future numbers cannot be predicted with 100% accuracy, observing your existing site and the traffic experienced will give a good indication. You can then make estimates dependent on the factor by which you expect / hope the traffic will increase.

**Commitment to Quality** - It is of paramount importance that anyone who tests remains neutral and simply reports the results of tests made.

It is the responsibility of the Project Manager to decide on and initiate action(s) dependent upon the results.

**Become Involved** - Although it is the responsibility of the Project Manager to ensure that all parties are fully involved at any meetings (status, workshops, and so on) you should also try to become involved as early as possible in the project cycle, including the information collection and requirement analysis processes.

**Involve the Customer** - On a similar theme, try to involve the customer (where possible) when defining your test cases and plan.

## Types of Tests {#types-of-tests}

There are various standard classifications of tests which are appropriate for use when testing a AEM project. You should be familiar with these to decide which you will use:

>[!NOTE]
>
>These are listed in their chronological order of application.

**Units Tests** - Tests (usually) made by the development team to ensure that the individual elements behave correctly - albeit in isolation.

**Integration Tests** - Tests modules when combined. These tests are made after Unit Testing, but before System Testing.

**Smoke Tests** - These are quick-and-dirty tests used to prove that the software is running and high-level functionality is available. The details are not tested.

**Functional Tests** - These are used to test the functionality of the software. A series of tests will be designed to cover all functional details, with both expected and unexpected and/or erroneous input.

Black-box tests are functional tests of a complete unit / component / module, performed without knowledge of the internal workings of the element in question.

**System Tests** - These test the entire system once it has been fully integrated and installed on a suitable platform.

They test the functionality on a black-box basis.

**Performance Tests** - Performance tests are crucial when testing AEM.

They are used to illustrate the performance under differing conditions:

* Normal

  Conditions which the site will experience for say 90% of the time. For example, when only a proportion of the authors are using the system.

* Peak

  Conditions which will be experienced for a proportionally short time due to special circumstances; for example, when all authors use the system concurrently or when new content is published and a increased number of visitors view your site.

* Extreme

  Can be used to emulate the performance forecast when new, extremely interesting content is published on your website. Then an extreme peak may be seen - though this may not always be fully predictable.

  These circumstances are sometimes seen when tickets for specific events are made available, or a much-awaited website is published for the first time.

The results are then used to tune the application.

**Stress Tests** - Stress tests are made to confirm how a component or application behaves under extreme conditions. In particular these tests are used to show how behavior deteriorates, when the element will fail - and how.

**Regression Tests** - Regression tests are used to confirm that functionality already proven in a previous release of the software is still operating correctly.

Regression Tests are good candidates for automation (if possible) to ensure they can be repeated quickly and consistently.

**Acceptance Tests** - Acceptance Tests are a special category as they are used to indicate the customer's acceptance of the project.

The list of acceptance tests may contain a combination of tests from the various categories above, and are selected to verify that the project fulfils the customer's requirements

See [Acceptance and Sign-Off](/help/sites-developing/acceptance-signoff.md) for more details.

## Getting Started {#getting-started}

Before starting on your detailed Test Cases and Test Plan you can:

**Define the goals** - Define your high-level goals to act as a starting point for fine-tuning as testing proceeds. You will want to:

* Test the functionality according to the Detailed Requirement Specification.
* Test Performance according to the [Target Metrics](/help/managing/best-practices-further-reference.md#key-performance-indicators-and-target-metrics).

among others.

**Collect traffic statistics from the existing website** - This information can be extracted from the log files - see Performance Monitoring for more details.

These figures will give an indication of current traffic (volume and spread) on the existing website and can be used in forming a base point for the new website.

**Collect traffic statistics from external websites** - If possible you can try to collect traffic statistics from other websites for comparison, but these figures are not always published.

**Confirm Target Metrics** - Metrics are used to define quantitative measurements for the quality of the website, as they represent the performance goals to be achieved.

They should be defined at the start of the project, together with the customer. See [Target Metrics](/help/sites-developing/planning.md) for more information.
