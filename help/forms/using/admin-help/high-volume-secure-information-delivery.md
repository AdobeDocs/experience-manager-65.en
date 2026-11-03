---
title: High-volume secure information delivery
description: Document security supports the association of licenses to users, rather than to the documents in mass production environments.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS
feature: Document Security
exl-id: 616e8821-ca96-4471-9120-0e1076a06178
solution: Experience Manager, Experience Manager Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: 50158d81-1c06-57f7-8bd7-e8ff76a93f85
    internal-label: Document Security
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# High-volume secure information delivery {#high-volume-secure-information-delivery}

In a mass production environment, such as one that generates secured monthly invoices for a telecom company, creating licenses that are specific to each document can become a resource-intensive process. In such cases, document security supports the association of licenses to users, rather than to the documents. The license generated for a user is used for all documents that are protected for that user.

One advantage of this approach is that the document security database size does not grow linearly with the documents, rather with the number of users. Also, because you need to create the license only once for a user, subsequent protection of documents through these policies becomes faster. Features such as offline access, document expiration, and revocation are supported for all such documents.

Document security also supports Abstract Policies. Abstract policies are policy templates that contain all policy attributes such as document security settings and usage rights, but do not contain a list of principals. Administrators can create any number of policies from the abstract policy with different principals who should have access to the documents. Changes made to the abstract policy do not affect the actual policies that are generated from the abstract policies.

If there is a monthly invoice generation for a telecom company, you create an abstract policy, create users, and then generate unique licenses for each user. The licenses are later applied to documents for each user.

Creation of an abstract policy is supported only through document security Java SDK. You can, however, administer the policies that you create from the abstract policy from the document security web pages. Policies that are created using this method are identical in behavior to those created from document security web pages.

See [Programming with AEM forms](https://www.adobe.com/go/learn_aemforms_programming_63) for more information.
