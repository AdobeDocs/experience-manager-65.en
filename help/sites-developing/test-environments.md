---
title: Which Test Environments are needed?
description: Several environments should be considered as part of testing
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: testing
content-type: reference

exl-id: 05f7a513-5ee7-4870-a691-4a0602e0cbb2
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Which Test Environments are needed?{#which-test-environments-will-be-needed}

To define which configurations for testing, you should consider the following:

**Development** &ndash; For Unit, and certain Integration tests.

**Testing** &ndash; For most of the tests.

**Live** &ndash; For final performance and stress tests. Also for acceptance tests with the customer.

Decide which instances you need and where (usually at least one of each for all levels of testing):

**Author** &ndash; This instance allows authors to input, and publish, content.

**Publish** &ndash; This instance presents the website in its published form for access from visitors.

Tested with the Dispatcher.

Finally, the actual hardware must be considered - any performance tests should be made on a system as close in configuration to the final live environment as possible. For this reason, it is also recommended that the Project Launch be split into a:

**Soft Launch** &ndash; Reduced availability; which allows time for performance tests, tuning, and optimization under realistic conditions on the production environment.

**Hard Launch** &ndash; Full availability.
