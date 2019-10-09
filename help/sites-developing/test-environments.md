---
title: Which Test Environments are needed?
seo-title: Which Test Environments are needed?
description: Several environments should be considered as part of testing
seo-description: Several environments should be considered as part of testing
uuid: bb725e50-edae-4c20-8107-d1c8df2e60e2
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: testing
content-type: reference
discoiquuid: db528b9b-3407-462d-8254-20b3cc2c3ccf
---

# Which Test Environments will be needed?{#which-test-environments-will-be-needed}

To define which configurations for testing, you should consider the following:

**Development** &ndash; For Unit, and certain Integration tests.

**Testing** &ndash; For the majority of the tests.

**Live** &ndash; For final performance and stress tests. Also for acceptance tests with the customer.

You will also need to decide which instances you will need where (usually at least one of each for all levels of testing):

**Author** &ndash; This instance allows authors to input, and publish, content.

**Publish** &ndash; This instance presents the website in its published form for access from visitors.

Should be tested in conjunction with the Dispatcher.

Finally, the actual hardware must be considered - any performance tests should be made on a system as close in configuration to the final live environment as possible. For this reason, it is also recommended that the Project Launch be split into a:

**Soft Launch** &ndash; Reduced availability; which allows time for performance tests, tuning and optimization under realistic conditions on the production environment.

**Hard Launch** &ndash; Full availability.
