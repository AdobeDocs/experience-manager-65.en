---
title: Content Disposition Filter
description: Learn how to use the Content Disposition Filter to prevent XSS attacks.
contentOwner: trushton
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: Security
exl-id: 1c3d0d48-5c31-42a8-8698-922d7c2127e9
solution: Experience Manager, Experience Manager Sites
feature: Security
role: Admin
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: b1210526-416b-4ef6-bcc0-1692e99f30e9
    internal-label: Administration and security
subfeature_v2:
  - id: c35bc059-fd80-4a01-91a6-e48da3c76758
    internal-label: Security practices
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
---
# Content Disposition Filter {#content-disposition-filter}

Content disposition filter is a security feature against XSS attacks on SVG files.

Once installed, the filter blocks access to all assets. For example, you could not view a PDF online. This section describes how to configure the filter to your needs.

## Configure Content Disposition Filter {#configure-content-disposition-filter}

You can view the [Apache Sling Content Disposition Filter in GitHub](https://github.com/apache/sling-org-apache-sling-security/blob/master/src/main/java/org/apache/sling/security/impl/ContentDispositionFilterConfiguration.java).

The Content Disposition Filter options provide the following functionality:

* **Content Disposition Paths:** A list of paths where the filter is applied followed by a list of mime-types to exclude on that path. This path must be an absolute path and may contain a wildcard (`*`) at the end, to match every resource path with the given path prefix. For example: `/content/*:image/jpeg,image/svg+xml` applies the filter to every node in `/content?` except JPG and SVG images.

* **Excluded Resource Paths:** A list of excluded resources, each resource path must be given as absolute and fully qualified path. Prefix matching/wildcards are not supported.

* **Enable For All Resource Paths:** This flag controls whether to enable this filter for all paths, except for the excluded paths defined by Excluded Resource Paths. Setting this flag to 'true' leads to ignoring Content Disposition Paths. Independent of the configuration, only resource paths are covered which contain a property named `jcr:data` or `jcr:content/jcr:data`.
