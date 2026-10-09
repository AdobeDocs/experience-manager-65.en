---
title: Request Analysis Script
description: The request analysis script is made to ease the analysis of the access.log files producing a readable report for later processing
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: testing
content-type: reference
exl-id: e14a9cda-890f-46b7-9433-1b52eb91eae3
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
# Request Analysis Script{#request-analysis-script}

## Download {#download}

This script is made to ease the analysis of the `access.log` files producing a readable report for later processing.

[Get File](assets/analyse-access.sh)

## Description {#description}

This script is made to ease the analysis of the `access.log` files producing a readable report for later processing.

It produces the overall requests number, GET vs POST, Request distribution over time and more.

The output is in Markdown syntax therefore it will be easier to convert it to PDFs with tools like pandoc or showing it in a browser with plug-ins like Markdown viewer.

It can analyse a custom path provided on the command line.

Taking from the comment within the file that tells you how to run it:

Analyse CQ `access.log` extrapolating various information and producing a Markdown output on `stdout`.

## Usage {#usage}

`./analyse-access.sh access.log.2013-&ast;`

you can provide additional custom paths to analyse on the command line

`/analyse-access.sh access.log.2013-&ast; /my/custom/path/1 /my/custom/path/2`

you can save the output by a simple piping

`./analyse-access.sh access.log.2013-&ast; | tee yr2013.md`
