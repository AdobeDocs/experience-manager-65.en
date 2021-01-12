---
title: Content Disposition Filter
seo-title: Content Disposition Filter
description: Learn how to use the Content Disposition Filter to prevent XSS attacks.
seo-description: Learn how to use the Content Disposition Filter to prevent XSS attacks.
uuid: 145a88e0-9fa8-42db-b189-eda507c33049
contentOwner: trushton
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: Security
discoiquuid: badfaa18-472e-4777-a7dc-9c28441b38b7
---

# Content Disposition Filter{#content-disposition-filter}

Content disposition filter is a security feature against XSS attacks on SVG files.

Once installed, the filter blocks access to all assets. For example, you could not view a pdf online. This section describes how to configure the filter to your needs.

## Configure Content Disposition Filter {#configure-content-disposition-filter}

You can view the [Apache Sling Content Disposition Filter in GitHub](https://github.com/apache/sling-org-apache-sling-security/blob/master/src/main/java/org/apache/sling/security/impl/ContentDispositionFilterConfiguration.java).

The Content Disposition Filter options provide the following functionality:

* Content Disposition Paths: a list of paths where the filter will be applied followed by a list of mime-types to exclude on that path.This path must be an absolute path and may contain a wildcard ('&ast;') at the end, to match every resource path with the given path prefix. For example: /content/&ast;:image/jpeg,image/svg+xml " will apply the filter to every node in /content except jpg and svg images

* Excluded Resource Paths: a list fo excluded resources, each resource path must be given as absolute and fully qualified path. Prefix matching/wildcards are not supported.

* Enable For All Resource Paths: this flag controls whether to enable this filter for all paths, except for the excluded paths defined by Excluded Resource Paths. Setting this to 'true' leads to ignoring Content Disposition Paths. Independent of the configuration only resource paths are covered which contain a property named 'jcr:data' or 'jcr:content jcr:data'.

