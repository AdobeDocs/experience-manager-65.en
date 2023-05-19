---
title: OAuth 2.0 Client Credentials Flow for Server-to-Server Integration
seo-title: OAuth 2.0 Client Credentials Flow for Server-to-Server Integration
description: Steps for OAuth 2.0 Client Credentials Flow for Server-to-Server Integration (Salesforce with AEM instance)
seo-description: Steps for OAuth 2.0 Client Credentials Flow for Server-to-Server Integration (Salesforce with AEM instance)
---

# OAuth 2.0 Client Credentials Flow Authorization {#ouath-2.0-client-credential}

OAuth 2.0 client credentials flow is a standardized and secure method for application authentication and authorization, designed for scenarios where direct communication between applications is required without user involvement. In this flow, the client application (Salesforce) exchanges the client credentials, which are defined in the connected application, to obtain an access token. The required client credentials include the consumer key and consumer secret.

## Advantages of OAuth 2.0 Client Credentials Flow {#advantages-of-oauth2-client-credential}

Apart from the OAuth 2.0 client credentials flow, different authentication and authorization mechanisms can also be used. The applications authenticate each other by providing user credentials or using a unique API key. However, these methods have some limitations:

* Maximum five connections are allowed
* In case, a user updates a password, an AEM data source configuration stops working.

The OAuth 2.0 client credentials flow eliminates the listed limitations and shares information directly between two applications without explicit user interaction.

## Prerequisites {#prerequisites}

To retrieve and fetch data between Salesforce and AEM environments requires certain prerequisites before proceeding further:

+++ **Set-up a connected app with client credentials flow and an API-only user**

It is mandatory to create a connected app with OAuth 2.0 client credentials flow and an API-only user for your organization. For detailed steps, refer to the article [OAuth 2.0 Client Credentials Flow for Server-to-Server Integration](https://help.salesforce.com/s/articleView?id=sf.remoteaccess_oauth_client_credentials_flow.htm&type=5). These steps help you obtain the consumer key and consumer secret.

>[!NOTE]
>
> Make sure to note down a consumer key and consumer secret as they are required while creating an AEM data source configuration.

+++

+++ **Create a Swagger file**

Swagger is an open-source set of rules, specifications, and tools to develop and describe RESTful APIs. [Create a swagger file](https://experienceleague.adobe.com/docs/experience-manager-learn/cloud-service/forms/integrate-with-salesforce/describe-rest-api.html) before integrating Salesforce with your AEM instance.   

+++

## Steps to create an AEM datasource configuration {#steps-to-create-aem-datasource-configuration}

1. Log in to your Author instance.
1. Go to **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Data Sources]**.
1. Select the configuration.
1. Click **[!UICONTROL Create]** and the **[!UICONTROL Create Data Source Configuration]** appears.
1. Specify the **[!UICONTROL Title]** and select the **[!UICONTROL Service Type]** as **[!UICONTROL RESTful Service]**.
1. Click **[!UICONTROL Next]**.
1. Select the **[!UICONTROL Swagger Source]** as **[!UICONTROL File]** 
1. Upload the created swagger file from your local machine by clicking **[!UICONTROL Browse]**.
1. Select the **[!UICONTROL Authentication Type]** as **[!UICONTROL OAuth 2.0]** and the **[!UICONTROL Authentication Settings]** panel appears.
1. Select the **[!UICONTROL Grant Type]** as **[!UICONTROL Client Credentials]**.
1. Specify the **[!UICONTROL Client Id]** and **[!UICONTROL Client Secret]** obtained from the Salesforce connected app.
1. Specify the **[!UICONTROL Access Token URL]** in format 
`https://[MyDomainName].my.salesforce.com/services/oauth2/token`.

    >[!NOTE]
    >
    > Each organization has its own specific domain name. 

1. Click **[!UICONTROL Test Connection]**.
1. If the connection succeeds, click the **[!UICONTROL Create]** button.

Now, you can [create the Form Data Model](https://experienceleague.adobe.com/docs/experience-manager-65/forms/form-data-model/create-form-data-models.html?lang=en) to integrate the configured datasource with your Adaptive Form.

To integrate Salesforce connected app and your AEM instance to fetch and retrieve data using an OAuth 2.0 Client Credentials Flow, follow the video:

>[VIDEO](/help/forms/using/assets/integratingsalesforceandaem.mp4)
