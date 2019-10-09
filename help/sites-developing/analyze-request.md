---
title: Request Analysis Script
seo-title: Request Analysis Script
description: The request analysis script is made to ease the analysis of the access.log files producing a readable report for later processing
seo-description: The request analysis script is made to ease the analysis of the access.log files producing a readable report for later processing
uuid: 24eff3c6-5748-46f3-a30c-4a3a6427ce1d
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: testing
content-type: reference
discoiquuid: 1b5e0ccf-4157-45e3-8caf-1d6739d7d9d2
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

Analyse CQ `access.log` extrapolating various informations and producing a Markdown output on `stdout`.

## Usage {#usage}

`./analyse-access.sh access.log.2013-&ast;`

you can provide additional custom paths to analyse on the command line

`/analyse-access.sh access.log.2013-&ast; /my/custom/path/1 /my/custom/path/2`

you can save the output by a simple piping

`./analyse-access.sh access.log.2013-&ast; | tee yr2013.md`
