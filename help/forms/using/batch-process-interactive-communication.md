---
title: Use Batch API to generate multiple interactive communications 
seo-title: Use Batch API to generate multiple interactive communications
description: null
seo-description: null
contentOwner: khsingh
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
uid: 
topic-tags: interactive-communication
discoiquuid: 
---

# Generate multiple interactive communications using Batch API {#use-batch-api-to-generate-multiple-ic}

You can use the Batch API to produce multiple interactive communications from a template. The template is an interactive communication without any data. The Batch API combines data with a template to produce an interactive communication. The API is useful in the mass production of interactive communications. For example, telephone bills, credit card statements for multiple customers.

The Batch API accepts records (data) in JSON format and from a Form Data Model and produces interactive communications. The number of produced interactive communications is equal to the records specified in the input JSON file in the configured Form Data Model. You can use the API to produce both Print and Web output. The PRINT option produces a PDF document and the WEB option produces data in JSON format for each individual record. Data produced in JSON format is used to generate Web output for an interactive communication. You can also use the WEB_AND_PRINT option to generate both Web and Print outputs. The number of interactive communications produced doubles when the WEB_AND_PRINT option is used.

## Using the Batch API {#using-the-batch-api}

The Batch API works in conjunction with Watched Folders. Out of the Box, AEM Forms provide a Watched Folder service. The service generates interactive communications and allows you to configure a template, output type (HTML, PRINT, or Both), locale, prefill service, and name of the generated interactive communications. You can also create custom services as per your requirements. To use the Batch API:

You can use the below-listed methods to specify input data (records) and batch produce interactive communications. You can:

* Specify input data (records) in JSON file format to produce an interactive communication
* Use input data (records) saved in an external data source and accessed via a form data model to produce an interactive communication

### Specify input data (records) in JSON file format to produce an interactive communication{#specify-input-data-in-JSON-file-format}

You combine a record with an interactive communication template to produce an interactive communication. You can create a separate JSON file for each record or create a JSON array to keep all the records in a single file:

**A single record in a JSON file**

```JSON
{
   "employee": {
       "name": "Sara",
       "id": 3,
       "mobileNo": 9871996463,
       "age": 37
   }
}

```

**Multiple records in a JSON file**

```JSON
[{
   "employee": {
       "name": "John",
       "id": 1,
       "mobileNo": 9871996461,
       "age": 39
   }
},{
   "employee": {
       "name": "Jacob",
       "id": 2,
       "mobileNo": 9871996462,
       "age": 38
   }
},{
   "employee": {
       "name": "Sara",
       "id": 3,
       "mobileNo": 9871996463,
       "age": 37
   }
}]

```

To create interactive communication from records saved in a JSON file:

1. Create a Watch folder and configure it to use the Batch API:
    1. Log in to AEM Forms author instance.
    1. Navigate to **[!UICONTROL Tools]** > **[!UICONTROL Forms]** > **[!UICONTROL Configure Watched Folder]**. Tap **[!UICONTROL New]**.
    1. Specify the **[!UICONTROL Name]** and physical **[!UICONTROL Path]** of the folder. For example, `c:\batchprocessing`.
    1. Select the **[!UICONTROL Service]** option in the **[!UICONTROL Process File Using]** field.
    1. Select the **[!UICONTROL com.adobe.fd.ccm.multichannel.batch.impl.service.InteractiveCommunicationBatchServiceImpl]** service in the **[!UICONTROL Service Name]** field.
    1. Specify an **[!UICONTROL Output File Pattern]**. For example, the %F/ [pattern](https://helpx.adobe.com/experience-manager/6-5/forms/using/admin-help/configuring-watched-folder-endpoints.html#about_file_patterns) specifies the Watched Folder can find input files in a sub-folder of the Watched Folder\input folder. 
1. Configure advanced parameters:
    1. Open the **[!UICONTROL Advanced]** tab and add the following custom properties:
            <table>
        <tr>
            <th>Property</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>templatePath </td>
            <td> String</td>
            <td> Specify path of the interactive communication template to use. For example, /content/dam/formsanddocuments/testsample/mediumic</td>
        </tr>
        <tr>
            <td> recordPath</td>
            <td> String</td>
            <td> Value of the recordPath field helps set name of an interactive communication. You can set path of a field of a record as value of the recordPath field. For example, if you specify /employee/Id, the value of id field becomes name for corresponding interactive communication. </td>
        </tr>
        <tr>
            <td>usePrefillService </td>
            <td>Boolean </td>
            <td> Set the value to False. You can use the usePrefillService parameter to prefill interactive communication with data fetched from prefill service configured for corresponding interactive communication.</td>
        </tr>
        <tr>
            <td>batchType </td>
            <td>String </td>
            <td> Set value to PRINT, WEB, or WEB_AND_PRINT.</td>
        </tr>
        <tr>
            <td> locale</td>
            <td>String </td>
            <td> Specify the locale of output interactive communication. The out-of-the-box service does not use the locale option, but you can create a custom service to generate localized interactive communications.</td>
        </tr>
        </table>
    1. Tap **[!UICONTROL Create]** The watched folder is created.
1. Use the watched folder to generate interactive communication:
    1. Open the Watched Folder. Navigate to the input folder.
    1. Create a folder in the input folder and place the JSON file in the newly created folder.
    1. Wait for the Watched Folder to process the file. When the processing starts, the input file and sub-folder containing the file is moved to the staging folder.
    1. Open the output folder to view the output:
        * When you specify the PRINT option in Watched Folder Configuration, PDF output for the interactive communication is generated.
        * When you specify the WEB option in Watched Folder Configuration, a JSON file per record is generated. You can use the JSON file to [pre-fill a web template](#web-template).
        * When you specify both PRINT and WEB options, both PDF documents and a JSON file per record are generated.

### Use input data saved in an external data source and accessed via form data model to produce an interactive communication {#use-fdm-as-data-source}

You combine data (records) saved in an external data source with an interactive communication template to produce an interactive communication. When you create an interactive communication, you connect it to an external data source via a Form Data Model (FDM) to access data. You can configure Watched Folders batch process service to fetch data using the same Form Data Model from an external data source. To [create an interactive communication from records saved in an external data source](https://docs.adobe.com/content/help/en/experience-manager-64/forms/form-data-model/work-with-form-data-model.html):

1. Configure the Form Data Model of the template:
    1. Open the Form Data Model associated to interactive communication template.
    1. Select your TOP LEVEL MODEL OBJECT and tap Edit Properties.
    1. Select your fetch or get service from the Read Service field under Edit Properties pane.
    1. Tap the pencil icon for the read service argument to bind the argument to a Request Attribute and specify the binding value. It binds the service argument to the specified binding attribute or literal value, which is passed to the service as an argument to fetch details associated with the specified value from the data source. 
    
        <br>
        In this example, the id argument takes the value of the id attribute of the user profile and passes it as an argument to the read service. It will read and return values of associated properties from the employee data model object for the specified id. So, if you specify 00250 in the id field in the form, the read service will read details of the employee with 00250 employee id.
        <br>

        ![Configure request attribute](assets/request-attribute.png)
    
    1. Save properties and Form Data Model. 
1. Configure value for Request Attribute:
    1. Create a .json file on your file system and open it for editing.
    1. Create a JSON array and specify the primary attribute to fetch data from Form Data Model. For example, the following JSON requests FDM to send data of records where id is 27126 or 27127: 
    
        ```json
            [
                {
                    "id": 27126
                },
                {
                    "id": 27127
                }
            ]
        ```

    1. Save and close the file.

1. Create a Watch folder and configure it to use the Batch API service:
    1. Log in to AEM Forms author instance.
    1. Navigate to **[!UICONTROL Tools]** > **[!UICONTROL Forms]** > **[!UICONTROL Configure Watched Folder]**. Tap **[!UICONTROL New]**.
    1. Specify the **[!UICONTROL Name]** and physical **[!UICONTROL Path]** of the folder. For example, `c:\batchprocessing`.
    1. Select the **[!UICONTROL Service]** option in the **[!UICONTROL Process File Using]** field.
    1. Select the **[!UICONTROL com.adobe.fd.ccm.multichannel.batch.impl.service.InteractiveCommunicationBatchServiceImpl]** service in the **[!UICONTROL Service Name]** field.
    1. Specify an **[!UICONTROL Output File Pattern]**. For example, the %F/ [pattern](https://helpx.adobe.com/experience-manager/6-5/forms/using/admin-help/configuring-watched-folder-endpoints.html#about_file_patterns) specifies the Watched Folder can find input files in a sub-folder of the Watched Folder\input folder.  
1. Configure advanced parameters:
    1. Open the **[!UICONTROL Advanced]** tab and add the following custom properties:
            <table>
        <tr>
            <th>Property</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>templatePath </td>
            <td> String</td>
            <td> Specify path of the interactive communication template to use. For example, /content/dam/formsanddocuments/testsample/mediumic</td>
        </tr>
        <tr>
            <td> recordPath</td>
            <td> String</td>
            <td> Value of the recordPath field helps set name of an interactive communication. You can set path of a field of a record as value of the recordPath field. For example, if you specify /employee/Id, the value of id field becomes name for corresponding interactive communication. </td>
        </tr>
        <tr>
            <td>usePrefillService </td>
            <td>Boolean </td>
            <td> Set the value to True. When the value is set to true, the Batch API reads data from the configured Form Data Model and fills it to the interactive communication.</td>
        </tr>
        <tr>
            <td>batchType </td>
            <td>String </td>
            <td> Set value to PRINT, WEB, or WEB_AND_PRINT.</td>
        </tr>
        <tr>
            <td> locale</td>
            <td>String </td>
            <td> Specify the locale of output interactive communication. The out-of-the-box service does not use the locale option, but you can create a custom service to generate localized interactive communications.</td>
        </tr>
        </table>
    1. Tap **[!UICONTROL Create]** The watched folder is created.
1. Use the watched folder to generate interactive communication:
    1. Open the Watched Folder. Navigate to the input folder.
    1. Create a folder in the input folder. Place the JSON file created in Step 2 in the newly created folder.  
    1. Wait for the Watched Folder to process the file. When the processing starts, the input file and sub-folder containing the file is moved to the staging folder.
    1. Open the output folder to view the output:
        * When you specify the PRINT option in Watched Folder Configuration, PDF output for the interactive communication is generated.
        * When you specify the WEB option in Watched Folder Configuration, a JSON file per record is generated. You can use the JSON file to [pre-fill a web template](#web-template).
        * When you specify both PRINT and WEB options, both PDF documents and a JSON file per record are generated.

## Pre-fill a web template {#web-template}

When you set the batchType to WEB for the Batch API, the API generates a JSON file for every data record. You can use the following syntax to merge the JSON file with corresponding Web Channel to generate an interactive communication: 

**Syntax**
`http://host:port/<template-path>/jcr:content?channel=web&mode=preview&guideMergedJsonPath=<guide-merged-json-path>` 

**Example**
If your JSON file is at `C:\batch\mergedJsonPath.json` and you use the below interactive communication template: `http://host:port/content/dam/formsanddocuments/testsample/mediumic/jcr:content?channel=web`

Then, the following URL on the publish node displays the Web Channel of the interactive communication 
`http://host:port/<path-to-ic>/jcr:content?channel=web&mode=preview&guideMergedJsonPath=file:///C:/batch/mergedJsonData.json`

Apart from saving the data on file system, you store JSON files in CRX-repository, file system, web server, or can access data via OSGI prefill service. Syntax to merge data using various protocols are: 

* **CRX protocol**
`http://host:port/<path-to-ic>/jcr:content?channel=web&mode=preview&guideMergedJsonPath=crx:///tmp/fd/af/mergedJsonData.json`

* **File protocol**
`http://host:port/<path-to-ic>/jcr:content?channel=web&mode=preview&guideMergedJsonPath=file:///C:/Users/af/mergedJsonData.json`  

* **Prefill Service protocol**
http://host:port/<path-to-ic>/jcr:content?channel=web&mode=preview&guideMergedJsonPath=service://[SERVICE_NAME]/[IDENTIFIER]

    * SERVICE_NAME refers to the name of the OSGI prefill service. Refer Create and run a prefill service.
    * IDENTIFIER refers to any metadata required by the OSGI prefill service to fetch the prefill data. An identifier to the logged-in user is an example of metadata that could be used.

* **HTTP protocol**
http://host:port/<path-to-ic>/jcr:content?channel=web&mode=preview&guideMergedJsonPath=http://localhost:8000/somesamplexmlfile.xml 

>[!NOTE]
> Only CRX protocol is enabled by default. To enable other supported protocols, see [Configuring prefill service using Configuration Manager](https://helpx.adobe.com/experience-manager/6-5/forms/using/prepopulate-adaptive-form-fields.html#ConfiguringprefillserviceusingConfigurationManager).