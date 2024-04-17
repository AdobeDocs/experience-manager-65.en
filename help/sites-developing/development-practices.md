---
title: Development Practices
description: Best practices for developing on Adobe Experience Manager.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
exl-id: 65b2029e-03c9-4df4-8579-2b15dbee1035
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Development Practices{#development-practices}

## Work according to a Definition of Done (DoD) {#work-according-to-a-definition-of-done}

Each team has a different definition of what "done" means, but it is important to have one and ensure that a story meets the defined criteria before being accepted.

Some criteria that are commonly specified by teams include:

* Code reviewed for formatting
* Comments/Javadoc added
* Meets required test coverage levels
* Passes unit and integration tests
* Validated in the QA environment
* Localization implemented

Without a well-defined DoD, it is easy to end up in a situation where many things are halfway done and nothing is truly complete.

### Define and adhere to coding and formatting conventions {#define-and-adhere-to-coding-and-formatting-conventions}

Things like indentation levels and white space may not seem important, but having properly formatted code goes a long way towards readability and maintainability. Conventions should be discussed and agreed to as a team and then followed in the code.

### Aim for high test coverage  {#aim-for-high-test-coverage}

As a project implementation grows in size, so does the amount of time that is required to test it. Without good test coverage, the testing team cannot scale and the developers eventually become buried in bugs.

Developers should practice Test Driven Development (TDD), writing failing unit tests before the production code that fulfills their requirements. QA should create an automated set of acceptance tests to ensure that the system works as expected from a high level.

There are custom frameworks available, such as Jackalope and Prosper, to make mocking of JCR APIs simpler to ensure productivity of developers while writing unit tests.

### Stay Demo Ready {#stay-demo-ready}

The system should be available for demo to the business at the end of each iteration. By keeping the system in a demo-ready state, the team will always be within an iteration of being production ready and technical debt can be kept to a maintainable level.

### Implement a continuous integration environment and use it {#implement-a-continuous-integration-environment-and-use-it}

Implementing a continuous integration environment lets you easily and repeatedly run unit tests and integration tests. It also decouples deployments from the development team, empowering the other parts of the team to be more efficient and making for more stable and predictable deployments.

### Keep the development cycle fast by keeping build times low {#keep-the-development-cycle-fast-by-keeping-build-times-low}

If unit tests take a long time to run, developers will avoid running them and they will lose their value. If it takes a long time to build the code and deploy it, people will do so less often. Making short build times a priority ensures that the time that you have invested into test coverage and CI infrastructure continues to make the team more productive.

### Fine-tune Sonar and other static code analysis tools and act on their reports {#fine-tune-sonar-and-other-static-code-analysis-tools-and-act-on-their-reports}

Code analysis tools can be valuable, but only if their reports lead to action on the part of the development team. Without fine-tuning the analysis that these tools provide, the recommendations that they generate become irrelevant and they lose their value.

### Follow the Boy Scout Rule {#follow-the-boy-scout-rule}

The Boy Scouts have a rule: "Leave it better than you found it." As long as all the members of the development team adhere to this rule and clean something up when they come across a mess, the code will constantly improve.

### Avoid implementing YAGNI features {#avoid-implementing-yagni-features}

YAGNI (You Are Not Gonna Need It) features are things that are implemented when we expect that we will need something in the future, even though we do not need it now. Ideally, we should implement the simplest thing that will work today and use continuous refactoring to ensure that the architecture of the system evolves with the requirements over time. This lets us focus on what matters and prevent code bloat and feature creep.
