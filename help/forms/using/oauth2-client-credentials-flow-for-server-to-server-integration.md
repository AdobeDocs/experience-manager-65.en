---
title: OAuth 2.0 Client Credentials Flow for Server-to-Server Integration
seo-title: OAuth 2.0 Client Credentials Flow for Server-to-Server Integration
description: Steps for OAuth 2.0 Client Credentials Flow for Server-to-Server Integration (Salesforce with AEM instance)
seo-description: Steps for OAuth 2.0 Client Credentials Flow for Server-to-Server Integration (Salesforce with AEM instance)
---

# OAuth 2.0 Client Credentials Flow Authorization {#ouath-2.0-client-credential}

OAuth 2.0 client credentials flow is a standardized and secure method for application authentication and authorization, specifically designed for scenarios where direct communication between applications is required without user involvement. In this flow, the client application (Salesforce) exchanges the client credentials, which are defined in the connected application, to obtain an access token. The required client credentials include the consumer key and consumer secret.

## Adavantages of OAuth 2.0 Client Credentials Flow {#advantages-of-oauth2-client-credential}

Apart from the OAuth 2.0 client credentials flow, different authentication and authorization mechanisms can also be used. The applications authenticate each other by providing user credentials or using a unique API key. However, these methods have some limitations:

* Maximum 5 connections are allowed
* In case, a user updates a password, an AEM cloud service datasource configuration stops working.

The OAuth 2.0 client credentials flow eliminates the listed limitaions and shares information directly between two applications without explicit user interaction

## Prerequisites {#prerequisites}

Integration between Salesforce and AEM environments requires certain prerequisites before proceeding further:

+++ **Set up a connected app with client credentials flow and an API-only user**

It is mandatory to create a connected app with OAuth 2.0 client credentials flow and an API-only user for your organization. For detailed steps, refer to the article [OAuth 2.0 Client Credentials Flow for Server-to-Server Integration](https://help.salesforce.com/s/articleView?id=sf.remoteaccess_oauth_client_credentials_flow.htm&type=5).

>[!NOTE]
>
> Make sure to note down the consumer key and consumer secret as they are required while creating an AEM cloud service data source configuration.

+++

+++ **Create a Swagger file**

Swagger is an open source set of rules, specifications and tools to develop and describe RESTful APIs. [Create a swagger file](https://experienceleague.adobe.com/docs/experience-manager-learn/cloud-service/forms/integrate-with-salesforce/describe-rest-api.html) before integarting Salesforce with your AEM instance.   

+++

## Steps to create an AEM cloud service datasource configuration {steps-to-create-aem-cloud-service-datasource-configuration}

1. Login to your Author instance.
1. go to tools -> cloud service -> data sources
create
enter title and select restful service
next
upload swagger file,
select OAuth 2.0
select grant type client credentials.

enter Client Id and Client Secret from the App.
enter token URL in format 
https://MyDomainName.my.salesforce.com/services/oauth2/token

click test connection.

click create
