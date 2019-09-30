---
title: Configure data sources
seo-title: Configure data sources
description: Learn how to configure different types of data sources and leverage to create form data models.
seo-description: Learn how to configure different types of data sources and leverage to create form data models.
uuid: 12360c8c-b596-4f9b-837a-10a8ff5c7448
topic-tags: integration
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: 9d78a6dc-fc9c-415b-b817-164fe6648b30
docset: aem65

---

# Configure data sources{#configure-data-sources}

 ![](do-not-localize/data-integeration.png)

AEM Forms Data Integration allows you to configure and connect to disparate data sources. The following types are supported out-of-the-box. However, with little customization, you can integrate other data sources as well.

* Relational databases - MySQL, Microsoft SQL Server, IBM DB2, and Oracle RDBMS  
* AEM user profile  
* RESTful web services  
* SOAP-based web services
* OData services

Data integration supports OAuth2.0, Basic Authentication, and API Key authentication types out-of-the-box, and allows implementing custom authentication for accessing web services. While RESTful, SOAP-based, and OData services are configured in AEM Cloud Services, JDBC for relational databases and connector for AEM user profile are configured in AEM web console.

## Configure relational database {#configure-relational-database}

You can configure relational databases using AEM Web Console Configuration. Do the following:

1. Go to AEM web console at http://[server]:[host]/system/console/configMgr.
1. Look for **[!UICONTROL Apache Sling Connection Pooled DataSource]** configuration. Tap to open the configuration in edit mode.
1. In the configuration dialog, specify the details for the database you want to configure, such as:

    * Name of the data source
    * Data source service property that stores the data source name
    * Java class name for the JDBC driver
    * JDBC connection URI
    * Username and password to establish connection with the JDBC driver

   >[!NOTE] {graybox="true"}
   >
   >Ensure that you encrypt sensitive information like passwords before configuring the data source. To encrypt:
   >
   >    
   >    
   >    1. Go to http://[server]:[port]/system/console/crypto.
   >    1. In the **[!UICONTROL Plain Text]** field, specify the password or any string to encrypt and click **[!UICONTROL Protect]**.
   >    
   >    
   >    
   >The encrypted text appears in the Protected Text field that you can specify in the configuration.

1. Enable **[!UICONTROL Test on Borrow]** or **[!UICONTROL Test on Return]** to specify that the objects are validated before being borrowed or returned from and to the pool, respectively.
1. Specify a SQL SELECT query in the **[!UICONTROL Validation Query]** field to validate connections from the pool. The query must return at least one row. Based on your database, specify one of the following:

    * SELECT 1 (MySQL and MS SQL) 
    * SELECT 1 from dual (Oracle)

1. Tap **[!UICONTROL Save]** to save the configuration.

## Configure AEM user profile {#configure-aem-user-profile}

You can configure AEM user profile using User Profile Connector configuration in AEM Web Console. Do the following:

1. Go to AEM web console at http://[server]:[host]/system/console/configMgr.
1. Look for **[!UICONTROL AEM Forms Data Integrations - User Profile Connector Configuration]** and tap to open the configuration in edit mode.
1. In the User Profile Connector Configuration dialog, you can add, remove, or update user profile properties. The specified properties will be available for use in form data model. Use the following format to specify user profile properties:

   `name=[property_name_with_location_in_user_profile],type=[property_type]`

   Examples:

    * `name=profile/phoneNumber,type=string`
    * `name=profile/empLocation/*/city,type=string`

   >[!NOTE] {graybox="true"}
   >
   >The **&#42;** in the above example denotes all nodes under the `profile/empLocation/` node in AEM user profile in CRXDE structure. It means that the form data model can access the `city` property of type `string` present in any node under the `profile/empLocation/` node. However, the nodes that contain the specified property must follow a consistent structure.

1. Tap **[!UICONTROL Save]** to save the configuration.

## Configure folder for cloud service configurations {#cloud-folder}

**Note**: Configuration for cloud services folder is required for configuring cloud services for RESTful, SOAP, and OData services.

All cloud service configurations in AEM are consolidated in the `/conf` folder in AEM repository. By default, the `conf` folder contains the `global` folder where you can create cloud service configurations. However, you need to manually enable it for cloud configurations. You can also create additional folders in `conf` to create and organize cloud service configurations.

To configure the folder for cloud service configurations:

1. Go to **[!UICONTROL Tools > General > Configuration Browser]**.
1. Do the following to enable the global folder for cloud configurations or skip this step to create and configure another folder for cloud service configurations.

    1. In the **[!UICONTROL Configuration Browser]**, select the `global` folder and tap **[!UICONTROL Properties]**.
    
    1. In the **[!UICONTROL Configuration Properties]** dialog, enable **[!UICONTROL Cloud Configurations]**.
    
    1. Tap **[!UICONTROL Save & Close]** to save the configuration and exit the dialog.

1. In the **[!UICONTROL Configuration Browser]**, tap **[!UICONTROL Create]**.
1. In the **[!UICONTROL Create Configuration]** dialog, specify a title for the folder and enable **[!UICONTROL Cloud Configurations]**.
1. Tap **[!UICONTROL Create]** to create the folder enabled for cloud service configurations.

## Configure RESTful web services {#configure-restful-web-services}

RESTful web service can be described using [Swagger specifications](http://swagger.io/specification/) in JSON or YAML format in a Swagger definition file. To configure RESTful web service in AEM cloud services, ensure that you have either the Swagger file on your file system or the URL where the file is hosted.

Do the following to configure RESTful services:

1. Go to **[!UICONTROL Tools > Cloud Services > Data Sources]**. Tap to select the folder where you want to create a cloud configuration.

   See [Configure folder for cloud service configurations](../../forms/using/configure-data-sources.md#cloud-folder) for information about creating and configuring a folder for cloud service configurations.

1. Tap **[!UICONTROL Create]** to open the **[!UICONTROL Create Data Source Configuration wizard]**. Specify a name and optionally a title for the configuration, select **[!UICONTROL RESTful Service]** from the **[!UICONTROL Service Type]** drop-down, optionally browse and select a thumbnail image for the configuration, and tap **[!UICONTROL Next]**.
1. Specify the following details for the RESTful service:

    * Select URL or File from the Swagger Source drop-down, and accordingly specify the Swagger URL to the Swagger definition file or upload the Swagger file from your local file system.
    * Based on the Swagger Source input, the following fields are pre-populated with values:

        * Scheme: The transfer protocols used by the REST API. The number of scheme types that display in the drop-down list depend on the schemes defined in the Swagger source.
        * Host: The domain name or IP address of the host that serves the REST API. It is a mandatory field.
        * Base Path: The URL prefix for all API paths. It is an optional field.  
          If necessary, edit the pre-populated values for these fields.

    * Select the authentication type — None, OAuth2.0, Basic Authentication, API Key, or Custom Authentication — to access the RESTful service, and accordingly provide details for authentication.

1. Tap **[!UICONTROL Create]** to create the cloud configuration for the RESTful service.

## Configure SOAP web services {#configure-soap-web-services}

SOAP-based web services are described using [Web Services Description Language (WSDL) specifications](https://www.w3.org/TR/wsdl). To configure SOAP-based web service in AEM cloud services, ensure that you have the WSDL URL for the web service, and do the following:

1. Go to **[!UICONTROL Tools > Cloud Services > Data Sources]**. Tap to select the folder where you want to create a cloud configuration.

   See [Configure folder for cloud service configurations](../../forms/using/configure-data-sources.md#cloud-folder) for information about creating and configuring a folder for cloud service configurations.

1. Tap **[!UICONTROL Create]** to open the **[!UICONTROL Create Data Source Configuration wizard]**. Specify a name and optionally a title for the configuration, select **[!UICONTROL SOAP Web Service]** from the **[!UICONTROL Service Type]** drop-down, optionally browse and select a thumbnail image for the configuration, and tap **[!UICONTROL Next]**.
1. Specify the following for the SOAP web service:

    * WSDL URL for the web service.
    * Service Endpoint. Specify a value in this field to override the service endpoint mentioned in WSDL.
    * Select the authentication type — None, OAuth2.0, Basic Authentication, or Custom Authentication — to access the SOAP service, and accordingly provide the details for authentication.

1. Tap **[!UICONTROL Create]** to create the cloud configuration for the SOAP web service.

## Configure OData services {#config-odata}

An OData service is identified by its service root URL. To configure an OData service in AEM cloud services, ensure that you have service root URL for the service, and do the following:

>[!NOTE]
>
>For step-by-step guide to configure Microsoft Dynamics 365, online or on-premises, see [Microsoft Dynamics OData Configuration](/help/forms/using/ms-dynamics-odata-configuration.md).

1. Go to **[!UICONTROL Tools > Cloud Services > Data Sources]**. Tap to select the folder where you want to create a cloud configuration.

   See [Configure folder for cloud service configurations](../../forms/using/configure-data-sources.md#cloud-folder) for information about creating and configuring a folder for cloud service configurations.

1. Tap **[!UICONTROL Create]** to open the **[!UICONTROL Create Data Source Configuration wizard]**. Specify a name and optionally a title for the configuration, select **[!UICONTROL OData Service]** from the **[!UICONTROL Service Type]** drop-down, optionally browse and select a thumbnail image for the configuration, and tap **[!UICONTROL Next]**.
1. Specify the following details for the OData service:

    * Service Root URL for the OData service to be configured.
    * Select the authentication type — None, OAuth2.0, Basic Authentication, or Custom Authentication — to access the OData service, and accordingly provide the details for authentication.

   >[!NOTE]
   >
   >You must select OAuth 2.0 authentication type to connect with Microsoft Dynamics services using OData endpoint as the service root.

1. Tap **Create** to create the cloud configuration for the OData service.

## Next steps {#next-steps}

You have configured the data sources. Next you can create a form data model or if you have already created a form data model without a data source, you can associate it with the data sources you just configured. See [Create form data model](/help/forms/using/create-form-data-models.md) for details.
