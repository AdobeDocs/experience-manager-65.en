---
title: Notable changes of the Commerce Integration Framework (CIF)
description: Notable changes of the Commerce Integration Framework (CIF) compared to old CIF versions.
exl-id: 5a526960-96a1-421e-9fb0-0825e7df8f32,c136763f-56aa-450e-8796-bc84bf6c205d
---
# Notable Changes to the Commerce Integration Framework (CIF){#notable-changes}

This document highlights the important differences between the  Commerce Integration Framework (CIF) and old CIF versions, mainly known as CIF Classic (Quickstart) and CIF Open-source.

## Installation & Updates

The AEM CIF package gets installed and updated with AEM package manager.

**Previous CIF versions**

* CIF Classic: No installation needed, CIF was part of the Quickstart. CIF updates were part of regular AEM or service pack updates
* CIF Open-source: Installation via GitHub. Updates were part of manual update / maintenance work.

## Endpoint Configuration

The endpoint gets configured via OSGi console.

**Previous CIF versions**

* CIF Classic: Via OSGi configuration in AEM
* CIF Open-source: Via CIF Configuration Browser

## Deployment of CIF Venia Project

Project available on [GitHub AEM Guides - CIF Venia Project](https://github.com/adobe/aem-cif-guides-venia) and deployment done via package AEM manager

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
>For additional documentation on how to use CIF with AEM Managed Service or AEM On-premise, refer to [Commerce Integration Framework](https://www.adobe.io/apis/experiencecloud/commerce-integration-framework/getting-started.html)
