---
title: Defining your Test Cases
seo-title: Defining your Test Cases
description: Your test cases should be based upon the use cases and the detailed requirements specification
seo-description: Your test cases should be based upon the use cases and the detailed requirements specification
uuid: 82dff825-da58-49a2-bf35-f5bb905e523d
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: testing
content-type: reference
discoiquuid: 87a1f27a-765e-4882-9c06-5909e1610e1d
---

# Defining your Test Cases{#defining-your-test-cases}

Your test cases should be based upon the:

**Use Cases**

* These define required functionality in terms of the interaction between Actors (roles which initiate certain actions) and the system.
* The Use Cases should be defined by the customer.

**Detailed Requirements Specification**

* All functional and performance requirements should be tested.

The tests should clearly define:

* Prerequisites; these may cover specific systems, configurations or tester experience.
* Steps to be followed; at an appropriate level of detail.
* Expected results.
* Clear criteria for pass or fail.

The prospect of automating test cases is obviously attractive as it can eliminate repetitive tasks.

## Manual versus Automated Tests {#manual-versus-automated-tests}

However, automating test cases is a significant investment, so certain aspects should be considered:

* Require time, effort and experience to setup and configure.
* If browser based, there is an increased risk of problems when browser updates are installed; requiring further time to correct.
* Only really feasible for big projects.
* Good when multiple releases are being generated either for testing or in the long term release plan.

## Testing specific aspects {#testing-specific-aspects}

When testing AEM a few specific details are of particular interest:

Author and Publish Environments

Although, covered in [Environments](/help/sites-developing/the-basics.md#environments) it is worth highlighting a deciding factor of AEM with regard to testing.

You must consider AEM as two applications:

* the **Author** environment
  This instance allows authors to input, and publish, content.
  This has a small(er), predictable set of users, for whom specific functionality and performance is crucial.
* the **Publish** environment
  This instance presents the website in its published form for access from visitors.
  This usually has a larger set of users, where the volume of traffic is not always 100% predictable. Performance is still crucial - when responding to requests. Caching and load-balancing must also be considered.

Although the same software as such, they:

* serve different purposes
* have different requirements with regard to functionality and performance
* are configured differently
* are tuned separately
* will each have their own set of acceptance tests

In other words they must be tested separately and with different test cases.

**Personalization**

When testing personalization each individual use case should be repeated using multiple user accounts to prove behavior.

Caching must also be checked for correct behavior.

**The Dispatcher**

Most projects will install the Dispatcher for caching and load balancing.

Testing is difficult (caching occurs at various levels and in various locations) and must be made on a black-box basis. Key aspects to test for are:

* **Accuracy**; ensure that content updates are seen by the website visitor.
* **Continuity**; ensure that the website is still available when one server is shut down.
* **Clusters** Clusters are used to provide:
    * **Failover**
  If one server fails, then other servers in the cluster will take over processing.
    * **Performance**
  Load balancing with full failover increases the performance of a cluster.

When used for a customer project the cluster must be tested to confirm correct operation of the configuration.

## Testing third-party software {#testing-third-party-software}

Any third-party software interfaced to AEM will be referenced in the Detailed Requirement Specifications.

Any tests required (dependent on the defined scope) must be analyzed and clean test obtained.
