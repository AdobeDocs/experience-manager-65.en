---
title: Notable changes of the Commerce Integration Framework (CIF) add-on
description: Notable changes of the Commerce Integration Framework  (CIF) add-on compared to old CIF versions.
exl-id: 41dee21a-9ae2-4067-a32a-2d4633323fc4
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: eadea719-cf89-469b-a6fd-a236a7138047
    internal-label: Commerce
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Notable Changes to the Commerce Integration Framework (CIF) add-on{#notable-changes}

This document highlights the important differences between the Commerce Integration Framework (CIF) add-on and old CIF versions, mainly known as CIF Classic (Quickstart) and CIF Open-source.

## Installation & Updates

The AEM CIF add-on package gets installed and updated with AEM Package Manager.

**Previous CIF versions**

* CIF Classic: No installation needed, CIF was part of the Quickstart. CIF updates were part of regular AEM or service pack updates
* CIF Open-source: Installation via GitHub. Updates were part of manual update / maintenance work.

## Endpoint Configuration

The endpoint gets configured via OSGi console.

**Previous CIF versions**

* CIF Classic: Via OSGi configuration in AEM
* CIF Open-source: Via CIF Configuration Browser

## Deployment of CIF Venia Project

Project available on [GitHub AEM Guides - CIF Venia Project](https://github.com/adobe/aem-cif-guides-venia) and deployment done via AEM Package Manager.

**Previous CIF versions**

* CIF Classic: Via AEM package install

## Product Catalog Data

Product catalog data get requested on-demand via real-time calls to an external endpoint that support the required GraphQL APIs. These APIs support access to live or staged data at any given date. No replication needed.

**Previous CIF versions**

* CIF Classic: Live and staged product data gets imported and persisted in JCR on AEM Author via full or delta product import. Live product data gets replicated to AEM Publish.

## Product catalog experiences with AEM rendering

AEM renders product catalog experiences on-the-fly using AEM catalog templates that have been assigned to products and categories. No replication needed.

**Previous CIF versions**

* CIF Classic: AEM Author creates an AEM page for every category / product using the catalog blueprint tool. These pages get replicated to AEM Publish.

>[!NOTE]
>
>For additional documentation on how to use CIF with AEM Managed Service or AEM On-Premise, see [Commerce Integration Framework](https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/getting-started.html)
