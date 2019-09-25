---
title: [DO NOT PUBLISH] Implementing Interactive Communication
seo-title: Implementing Interactive Communication
description: Implementing Interactive Communication - from conception of interactive communication to submitting it for post processing
seo-description: Implementing Interactive Communication
page-status-flag: never-activated
uuid: 18dcae73-2cfb-4e96-8efb-700a536cb41f
contentOwner: gtalwar
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: e42c127f-6fdf-4659-97e3-72bf76493c05
index: y
internal: n
snippet: y
---

# [DO NOT PUBLISH] Implementing Interactive Communication{#do-not-publish-implementing-interactive-communication}

## Before you create an interactive communication {#before-you-create-an-interactive-communication}

### Anatomy of an interactive communication {#anatomy-of-an-interactive-communication}

### Form Data Model {#form-data-model}

#### Create sample data {#create-sample-data}

#### Associate an FDM instance with a data source {#associate-an-fdm-instance-with-a-data-source}

### Print and web channel templates {#print-and-web-channel-templates}

#### Theme in web channel {#theme-in-web-channel}

#### Using print as master for web channel {#using-print-as-master-for-web-channel}

#### Using sync functionality to keep print and web channels in sync {#using-sync-functionality-to-keep-print-and-web-channels-in-sync}

#### Adding adaptive form components to an interactive communication template {#adding-adaptive-form-components-to-an-interactive-communication-template}

### Document fragments {#document-fragments}

#### Adding form data model elements in document fragments {#adding-form-data-model-elements-in-document-fragments}

Add Form Data Model (FDM) elements to the following document fragments in your interactive communication to supply recipient-specific data while creating instance of an interactive communication:

* [Text](/forms/using/text-interactive-communications.md) 
* [Condition](/forms/using/condition-interactive-communications.md)

For example, you can use a back end data source, such as Microsoft Dynamics, to insert FDM elements in your interactive communication and populate the following while creating the interactive communication's instance for a recipient:

* Customer name and address in a communication
* Due Amount in the credit card statement
* Premium due amount in an auto insurance renewal letter

To be able to add FDM elements in Text and Condition, you need to specify the FDM while creating a text or condition. The FDM needs to be the same for the document fragments and the interactive communication in which you intend to use the document fragments.

To insert FDM elements While creating or editing a text/condition, do the following:

* Specify the FDM while creating a [condition](/forms/using/condition-interactive-communications.md#createcondition)/ [text](/forms/using/text-interactive-communications.md#createtext). 

* Insert the FDM elements while editing or creating a condition/ [text](/forms/using/text-interactive-communications.md#fdm).

#### Using rules to make interactive communication contextual {#using-rules-to-make-interactive-communication-contextual}

![](assets/appliedruletext.png) ![](assets/ruleeditorfdm-1.png)

You can use rules to make your interactive communications highly contextual. You can use rules to:

* Show/hide parts of text/content in a text document fragment
* Show/hide specific assets in a condition document fragment

Examples:

* In a credit card statement, display the credit card annual fee and credit card image based on the type of customer's credit card.
* In an insurance premium due reminder, display calculations of tax based on the customer's state's taxes.
* Display specific toll free numbers based on the country of the recipient.

#### Using repeat to render dynamic information {#using-repeat-to-render-dynamic-information}

#### Using lists to add patterns of components in interactive communications {#using-lists-to-add-patterns-of-components-in-interactive-communications}

#### Using mathematical expressions to create rules {#using-mathematical-expressions-to-create-rules}

### Upload the required images to your server {#upload-the-required-images-to-your-server}

## Create interactive communication {#create-interactive-communication}

### Create interactive communication {#create-interactive-communication-1}

### Add content to web and print channel of interactive communication {#add-content-to-web-and-print-channel-of-interactive-communication}

#### Adding document fragments to interactive communication {#adding-document-fragments-to-interactive-communication}

#### Adding layout fragments to interactive communication template to render dynamic data in a table {#adding-layout-fragments-to-interactive-communication-template-to-render-dynamic-data-in-a-table}

#### Adding charts and graphs to the interactive communication {#adding-charts-and-graphs-to-the-interactive-communication}

#### Adding attachments to an interactive communication {#adding-attachments-to-an-interactive-communication}

### Preview web and print channels of interactive communication {#preview-web-and-print-channels-of-interactive-communication}

## Create instance of interactive communication in Agent UI {#create-instance-of-interactive-communication-in-agent-ui}

### Make the required changes in the interactive communication instance {#make-the-required-changes-in-the-interactive-communication-instance}

### Submit interactive communication instance {#submit-interactive-communication-instance}

### Post processing {#post-processing}

## Target Integration {#target-integration}

## Sites Integration {#sites-integration}

