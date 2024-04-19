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
