---
title: Tutorial - Create your first Interactive Communication

description: Learn to create your first Interactive Communication.


contentOwner: anujkapo
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: interactive-communications, introduction

feature: Interactive Communication
exl-id: b20bb719-5686-466e-8dde-279b8471bfe3
solution: Experience Manager, Experience Manager Forms
role: "Admin, User, Developer"
---
# Tutorial: Create your first Interactive Communication {#tutorial-create-your-first-interactive-communication}

Learn to create your first Interactive Communication.

 ![01-create-first-adaptive-form-hero-image](assets/01-create-first-adaptive-form-hero-image.png)

Interactive Communications centralizes and manages the creation, assembly, and delivery of secure, personalized, and interactive correspondences such as business correspondence, documents, statements, marketing mails, bills, and welcome kits. Interactive Communications can be delivered using two channels: Print and Web. The Print channel is used to create PDFs and paper communications, while the Web channel is used to deliver online experiences.

This tutorial provides an end-to-end framework to create an Interactive Communication. The tutorial is organized into a use case and multiple guides. Each guide helps you to create features that are used as building blocks to create an Interactive Communication.

The following image illustrates the building blocks that are required to create an Interactive Communication.

![workflow](assets/workflow.gif)

At the end of this tutorial, you will be able to:

* Create building blocks (form data model, document fragments, and templates)
* Create an Interactive Communication
* Test and publish an Interactive Communication

## Use case {#use-case}

The journey starts with learning the use case:

A telecom operator sends monthly bills to the customers over the email. The bill is an Interactive Communication. The email includes:

* A password-protected PDF, referred to as Print channel in this tutorial. It includes customer details, bill details, summary of charges, convenient modes of paying the bill, and usage details.
* A link to the web version of bill, referred to as Web channel in this tutorial. The web version of the bill, in addition to the details covered in the PDF version, provides a graphical representation of the usage details and personalized offers based on Adobe Target. The web version also contains an online payment form. It helps to make online payments without leaving the IC.
* A link to value-added services, such as online storage, music subscriptions, and on-demand video subscriptions.

## Prerequisites {#prerequisites}

* Set up an AEM author instance.
* Install [AEM Forms add-on](/help/forms/using/installing-configuring-aem-forms-osgi.md) on author instance
* Set up the MYSQL database
* Obtain JDBC database driver (JAR file) from database provider. Examples in the tutorial are based on MySQL database and use Oracle's [MySQL JDBC database driver](https://dev.mysql.com/downloads/connector/j/5.1.html).

## Step 1: Plan the Interactive Communication {#step-plan-the-interactive-communication}

![07-apply-rules-to-adaptive-form_small](assets/07-apply-rules-to-adaptive-form_small.png)

The first step in planning an Interactive Communication is to finalize the content of the Interactive Communication. After the content is finalized, you must analyze it to identify the various asset types that are required to create the Interactive Communication.

**Goals:**

To create an anatomy for the Interactive Communication with the following modes of data input:

* Static text
* Form data model
* Agent UI
* Conditional data
* Images

    [ ![see-the-guide-sm](assets/see-the-guide-sm.png)](/help/forms/using/planning-interactive-communications.md)

## Step 2: Create form data model {#step-create-form-data-model}

![03-create-adaptive-form-main-image_small](assets/03-create-adaptive-form-main-image_small.png)

A form data model lets you connect an Interactive Communication to disparate data sources. For example, AEM user profile, RESTful web services, SOAP-based web services, OData services, and relational databases. A form data model is a unified data representation schema of business entities and services available in connected data sources. You can use the form data model with an Interactive Communication to retrieve data from connected data sources. For more information about form data model, see [AEM Forms Data Integration](/help/forms/using/data-integration.md).

**Goals:**

* Configure database instance (MySQL database) as a data source
* Create the form data model using MySQL database as a data source
* Add data model objects to form data model
* Configure read and write services for the form data model
* Create associations between the data model objects
* View auto-generated sample data
* Edit sample data
* Test form data model and configured services with test data

    [ ![see-the-guide-sm](assets/see-the-guide-sm.png)](/help/forms/using/create-form-data-model0.md)

## Step 3: Create document fragments {#step-create-document-fragments}

![05-create-form-data-model-main_small](assets/05-create-form-data-model-main_small.png)

Document fragments are reusable components of a correspondence that are used to compose an Interactive Communication. The document fragments are of types: Text, List, and Condition.

**Goals:**

* Create document fragments
* Create variables
* Create and apply rules

    [ ![see-the-guide-sm](assets/see-the-guide-sm.png)](/help/forms/using/create-document-fragments.md)

## Step 4: Create templates {#step-create-templates}

![07-apply-rules-to-adaptive-form_small](assets/07-apply-rules-to-adaptive-form_small.png)

To create an Interactive Communication, you must have templates available on the AEM server for Print and Web Channels.

The templates for the Print channel are created in Adobe Forms Designer and uploaded to the AEM server. These templates are then available for use while creating an Interactive Communication.

The templates for the Web channel are created in AEM. Template authors and administrators can create, edit, and enable web templates. Once created and enabled, these templates are available for use while creating an Interactive Communication.

**Goals:**

* Create XDP templates for Print channel using Adobe Forms Designer
* Upload the XDP templates to the AEM Forms Server
* Create and enable templates for the Web channel

    [ ![see-the-guide-sm](assets/see-the-guide-sm.png)](/help/forms/using/create-templates-print-web.md)

## Step 5: Create an Interactive Communication {#step-create-an-interactive-communication}

![09-style-your-adaptive-form-small](assets/09-style-your-adaptive-form-small.png)

Once you create all the building blocks such as form data model, document fragments, and templates for the web version, you can start creating an Interactive Communication.

Interactive Communications can be delivered through two channels: Print and Web. You can also create an Interactive Communication with Print channel as the master. Print as master option for Web channel ensures the content, inheritance, and data binding of the web channel is derived from the Print channel.

**Goals:**

* Create Interactive Communication for the Print channel
* Create Interactive Communication for the Web channel
* Create Print and Web Interactive Communications with Print as Master
* Create a dynamic table in Web version of Interactive Communication
* Create a chart in Web version of Interactive Communication
* Create hyperlinks in Web version of Interactive Communication

    [ ![see-the-guide-sm](assets/see-the-guide-sm.png)](/help/forms/using/create-interactive-communication0.md)

## Step 6: Publish your Interactive Communication {#step-publish-your-interactive-communication}

![12-publish-your-adaptive-form-_small](assets/12-publish-your-adaptive-form-_small.png)

Once you create and test Interactive Communications using Print and Web channels, you can publish these assets. The use case described in this tutorial focuses on integrating these assets with an email client. The email client serves as a bridge to send the Interactive Communications to multiple email addresses.

**Goals:**

* Integrate Interactive Communications with an email client to be able to send a communication to the customers
* Include a PDF document as an attachment (Interactive Communication created in Print channel)
* Include a link to the Web version of the Interactive Communication
