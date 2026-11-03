---
title: AEM Repo Tool
description: The AEM Repo Tool is a simple solution to transfer JCR content between your local filesystem and the AEM server by way of the command line comparable to FTP. The AEM Repo Tool is similar to the Jackrabbit FileVault tool, but is faster, has minimal dependencies, and is a simple bash script.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: development-tools
content-type: reference
exl-id: c46c9f0c-b0d2-4f2f-b95c-90fd3ced32a9
solution: Experience Manager, Experience Manager Sites
feature: Developing,Developer Tools
role: Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: c5d917df-d8bd-5e97-a117-6dde1e9f7103
    internal-label: Developing
  - id: f2d27a5f-0d67-4d85-8a24-86a8d8a3574b
    internal-label: Developer tools
role_v2:
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# AEM Repo Tool{#aem-repo-tool}

The AEM Repo Tool is a simple solution to transfer JCR content between your local filesystem and the AEM server via the command line comparable to FTP. The AEM Repo Tool is similar to the [Jackrabbit FileVault tool](/help/sites-developing/ht-vlttool.md), but is faster, has minimal dependencies, and is a simple bash script.

This tool simplifies the transfer of files for the developer and can also be integrated into IntelliJ and Eclipse to make development even more efficient.

## Overview {#overview}

For a given path inside a `jcr_root` filevault structure on the filesystem, AEM Repo Tool creates a package with a single filter for the entire subtree and pushes that to the server (similar to FTP `put`), fetches it from the server ( `get`) or compares the differences ( `status` and `diff`).

The tool does not support multiple filter paths or FileVault's `filter.xml`.

>[!CAUTION]
>
>The AEM Repo Tool always overwrites the entire file or directory specified.

## Download and Documentation {#download-and-documentation}

The [AEM Repo Tool is available on GitHub via this link](https://github.com/Adobe-Marketing-Cloud/tools/tree/master/repo) along with detailed installation and usage instructions.

If you want to download the source of the AEM Repo Tool, see the GitHub project linked below.

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open tools project on GitHub](https://github.com/Adobe-Marketing-Cloud/tools)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/tools/archive/master.zip)
