---
title: Salesforce integration with AEM Forms using OAuth 2.0 client credentials flow
description: Steps to integrate Salesforce integration with AEM Forms using OAuth 2.0 client credentials flow
exl-id: 4c356aa6-ebd4-40b9-89e3-bc4519e4a7c5
solution: Experience Manager, Experience Manager Forms
feature: Form Data Model
role: Admin, User, Developer
---
# Integration of Salesforce using OAuth 2.0 client credentials flow  {#configure-salesforce-with-ouath-2.0-client-credential}

| Version | Article link |
| -------- | ---------------------------- |
| AEM as a Cloud Service |    [Click here](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/forms/integrate/use-form-data-model/oauth2-client-credentials-flow-for-server-to-server-integration.html)                  |
| AEM 6.5     | This article         |

You can use OAuth 2.0 client credentials to integrate AEM Forms with the Salesforce application. OAuth 2.0 client credentials are a standard and secure method for direct communication without user involvement.  

![Workflow while setting communication between AEM Forms and Salesforce application](/help/forms/using/assets/salesforce-workflow.png)

AEM Forms exchanges the client credentials (consumer key and consumer secret), defined in the Salesforce connected application, to obtain an access token.
 
There are multiple benefits of using OAuth 2.0 client credentials for authentication over Authorization Code Flow authentication:

* OAuth 2.0 client credentials authentication allows more than five connections per user.
* AEM data source configuration continues working on deactivation, access changes, password update for an AEM user.

## Prerequisites {#prerequisites}

Before setting communication between a Salesforce application and an AEM environment:

* Create a [Salesforce connected app with OAuth 2.0 client credential flow](https://help.salesforce.com/s/articleView?id=sf.connected_app_client_credentials_setup.htm&type=5) and an API-only user for your organization and obtain the consumer key and consumer secret for the app.

* Ensure that your Swagger file is appropriately configured to match your organization's APIs. Alternatively, you can opt to [create a Swagger file](https://experienceleague.adobe.com/docs/experience-manager-learn/cloud-service/forms/integrate-with-salesforce/describe-rest-api.html) from the scratch, tailored for utilization in your AEM environment.
>[!NOTE]
>
> AEM 6.5 only supports Swagger 2.0 file specifications.

+++

## Steps to configure Salesforce with Client Credentials flow {#steps-to-create-aem-datasource-configuration}

1. Log in to your Author instance.
1. Go to **[!UICONTROL Tools]** > **[!UICONTROL Cloud Services]** > **[!UICONTROL Data Sources]**.
1. Select the configuration folder.
1. Click **[!UICONTROL Create]** and the **[!UICONTROL Create Data Source Configuration]** appears.
1. Specify the **[!UICONTROL Title]** and select the **[!UICONTROL Service Type]** as **[!UICONTROL RESTful Service]**.
1. Click **[!UICONTROL Next]**.
1. Select the **[!UICONTROL Swagger Source]** as **[!UICONTROL File].** 
    >[!NOTE]
    >
    > As soon as the swagger file is selected, the Scheme, the Host name and the Base path are populated automatically.

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

Now, you can [create the Form Data Model](https://experienceleague.adobe.com/docs/experience-manager-65/forms/form-data-model/create-form-data-models.html?lang=en) to integrate the configured datasource with your Adaptive Forms.
