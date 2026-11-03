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
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
role_v2:
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
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
