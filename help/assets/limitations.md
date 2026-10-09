---
title: Dynamic Media limitations
description: Learn about the best practices and enforced limits when you create an Image Set or a Spin Set, or upload a PDF. Also learn about unsupported web browser and operating system combinations for Dynamic Media.
contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/Dynamic-Media-Classic
geptopics: SG_SCENESEVENONDEMAND_PK/categories/ecatalogs
feature: Dynamic Media Classic,Asset Management,Image Sets,Spin Sets,eCatalog
role: User
exl-id: e4d4059e-ac0b-42e7-910c-001310796574
solution: Experience Manager, Experience Manager Assets
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: d09181b5-a36a-43de-ba01-36641440bc43
    internal-label: Experience Manager Assets
feature_v2:
  - id: 7d2b2ec8-499c-5434-9ffd-9218cd71f683
    internal-label: Asset Management
  - id: bd0d2470-932c-4269-8eca-6d939b72d9ef
    internal-label: Dynamic Media
  - id: d4b6216b-4a89-4ff0-8ac0-5a699ba23100
    internal-label: Images and videos
subfeature_v2:
  - id: c12bda38-aa1a-4647-b62e-42cd4537dac6
    internal-label: Dynamic Media Classic
  - id: e2dc1259-9034-40fc-a518-b92a34fe6642
    internal-label: Image sets
  - id: cb008a68-9156-4b10-9c66-391409a53067
    internal-label: Spin Sets
  - id: fb5874db-3110-450a-b647-a5c2ce139bef
    internal-label: eCatalog
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
---
# Dynamic Media Limitations

The following sections describe limitations in Dynamic Media.

This topic includes the following sections: 

* [Best practices and enforced limits by Dynamic Media on asset types](#best-practice-enforced-limits)
* [Unsupported web browser and operating system combinations for Dynamic Media](#unsupported-browser-os)

## Best practices and enforced limits by Dynamic Media on asset types {#best-practice-enforced-limits}

When you create a Spin Set or an Image Set, or upload PDFs for page extraction, Adobe recommends the following best practices and enforces the following limits:

| Asset - Limit type | Best practice | Limit imposed |
| --- | --- | --- |
| **Image** - Number of Smart Crops per image | 5 | 100 |
| **All sets** - Number of duplicate assets per set | No duplicates | 20&Dagger; |
| **All sets** - Maximum number of assets per set | 5-10 images per set  | 1000 |
| **Spin Set** - Maximum number of rows/columns per 2D set | 12-18 images per set | 1000 |
| **PDF** - Maximum number of pages for a PDF to be considered for extraction || 100 (for all PDFs) |

&Dagger; Best practice is to not have duplicate assets in a set. The limit is 20 duplicates for a single asset. If you add another duplicate for that asset&mdash;within that set&mdash;the request either gives an error or ignores the duplicate.
<!-- See also [Dynamic Media limitations](/help/assets/limitations.md). -->

## Unsupported web browser and operating system combinations for Dynamic Media {#unsupported-browser-os}

Dynamic Media does not support the following web browser and operating system combinations.

* Internet Explorer 11 + Windows 7
* Internet Explorer 11 + Windows 8.1
* Internet Explorer 11 + Windows Phone 8.1
* Internet Explorer 11 + Windows Phone 8.1 Update
* Safari 6 + iOS 6.0.1
* Safari 7 + iOS 7.1
* Safari 7 + OS X 10.9 Mavericks
* Safari 8 + iOS 8.4
* Safari 8 + OS X 10.10 Yosemite

## End of support for Secure Socket Layer 2.0 and 3.0 and Transport Layer Security 1.0 and 1.1 {#tls}

<!--
CQDOC-19433 (original ticket)
and CQDOC-19792 (removed as per this ticket December 5, 2022)
-->

Effective April 30, 2024, Adobe Dynamic Media will end support for the following:

* SSL (Secure Socket Layer) 2.0
* SSL 3.0 
* TLS (Transport Layer Security) 1.0 and 1.1
* The following weak ciphers in TLS 1.2:
  * `TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384`
  * `TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA`
  * `TLS_RSA_WITH_AES_256_GCM_SHA384`
  * `TLS_RSA_WITH_AES_256_CBC_SHA256`
  * `TLS_RSA_WITH_AES_256_CBC_SHA`
  * `TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256`
  * `TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA`
  * `TLS_RSA_WITH_AES_128_GCM_SHA256`
  * `TLS_RSA_WITH_AES_128_CBC_SHA256`
  * `TLS_RSA_WITH_AES_128_CBC_SHA`
  * `TLS_RSA_WITH_CAMELLIA_256_CBC_SHA`
  * `TLS_RSA_WITH_CAMELLIA_128_CBC_SHA`
  * `TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA`
  * `TLS_RSA_WITH_SDES_EDE_CBC_SHA`

