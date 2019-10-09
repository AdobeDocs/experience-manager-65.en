---
title: DO NOT PUBLISH AEM Forms Error Code Reference (JEE Only)
seo-title: DO NOT PUBLISH AEM Forms Error Code Reference (JEE Only)
description: null
seo-description: null
page-status-flag: never-activated
uuid: 719b8157-58fc-4992-842c-3907c57434e4
topic-tags: developer-reference
discoiquuid: b775f65a-be1d-40e8-aa98-c2a4922f9cb2
---

# DO NOT PUBLISH AEM Forms Error Code Reference (JEE Only)  {#do-not-publish-aem-forms-error-code-reference-jee-only}

## Application and Services Error Codes {#application-and-services-error-codes}

|  Code  | ALC-DCT-002-064 () |
|---|---|
|  Type  |Error |
|  Cause  |Binding of data dictionary element with name "{0}" at path "{1}" contains invalid character "{2}". |
|  Action  |Please ensure that no invalid character exists in the binding. |

|  Code  | ALC-DCT-002-065 () |
|---|---|
|  Type  |Error |
|  Cause  |Binding of data dictionary element with name "{0}" at path "{1}" starts with the invalid root element. |
|  Action  |Please ensure that binding starts with valid root element. |

|  Code  | ALC-DCT-002-066 () |
|---|---|
|  Type  |Error |
|  Cause  |Binding of data dictionary element with name "{0}" at path "{1}" contains invalid value - "{2}". |
|  Action  |Please ensure that binding cotains a valid value. |

|  Code  | ALC-DCT-002-067 () |
|---|---|
|  Type  |Error |
|  Cause  |The values in value set of data dictionary element with name "{0}" at path "{1}" are not compatible with it's data type. |
|  Action  |Please ensure that values are compatible with data type. |

|  Code  | ALC-DCT-003-015 () |
|---|---|
|  Type  |Error |
|  Cause  |Data dictionary with name: {0} is already published. |
|  Action  |A published DD can not be published again. |

|  Code  | ALC-DCT-003-016 () |
|---|---|
|  Type  |Info |
|  Cause  |Data dictionary with name: {0} is already on the last published version. |
|  Action  |There is no change in the data dictionary after last publish operation, so you can not revert this data dictionary. |

|  Code  | ALC-DCT-003-017 () |
|---|---|
|  Type  |Error |
|  Cause  |Error while parsing expression: {0}. |
|  Action  |Please ensure that expression follows correct syntax. |

|  Code  | ALC-DCT-003-020 () |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element passed to the API is non computed. |
|  Action  |Please ensure that only computed Data Dictionary Elements are passed to this API. |

|  Code  | ALC-DCT-005-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in reading localized data stream for Data Dictionary. |
|  Action  |Please contact system administrator. |

|  Code  | ALC-DCT-005-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in writing localized data stream for Data Dictionary. |
|  Action  |Please contact system administrator. |

|  Code  | ALC-DCT-005-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in exporting Localization Information. |
|  Action  |Please contact sytem administrator. |

|  Code  | ALC-DCT-005-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in importing Localization Information. |
|  Action  |Please check the format of zip file. |

|  Code  | ALC-ACM-002-206 () |
|---|---|
|  Type  |Error |
|  Cause  |Repository contains updated version of used Layout or Fragment Layouts with id [{0}]. Fields/TargetAreas have been added/removed. Please reload this letter. |
|  Action  |Please reload this letter. |

|  Code  | ALC-ACM-002-207 () |
|---|---|
|  Type  |Error |
|  Cause  |Repository contains updated version of used DataModule with id [{0}]. Data Dictionary reference in the DataModule has been changed. Please reload this asset. |
|  Action  |Please reload this asset. |

|  Code  | ALC-ACM-002-208 () |
|---|---|
|  Type  |Error |
|  Cause  |Repository contains updated version of used DataModule with id [{0}]. Variables in the DataModule have been added/removed. Please reload this asset. |
|  Action  |Please reload this asset. |

|  Code  | ALC-ACM-002-209 () |
|---|---|
|  Type  |Error |
|  Cause  |Repository contains updated version of this asset. Please reload this asset. |
|  Action  |Please reload this asset. |

|  Code  | ALC-ACM-006-002 () |
|---|---|
|  Type  |Error |
|  Cause  |One or more Data Dictionary Elements have been deleted that are being used in other Templates or Data Modules. |
|  Action  |Please ensure that deleted Data Dictionary Elements are not being used in any asset. |

|  Code  | ALC-ACM-006-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in reading localized data stream for asset. |
|  Action  |Please contact system administrator. |

|  Code  | ALC-ACM-006-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in writing localized data stream for asset. |
|  Action  |Please contact system administrator. |

|  Code  | ALC-ACM-008-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in exporting Localization Information. |
|  Action  |Please contact system administrator. |

|  Code  | ALC-ACM-008-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in importing Localization Information. |
|  Action  |Please check the zip file format. |

|  Code  | ALC-FMG-500-001 () |
|---|---|
|  Type  |Error |
|  Cause  |The shadowNodesRoot either does not exist or is not specified in the call. |
|  Action  |Go to system/console/bundles. Refresh the Forms Manager Core bundle and try again. |

|  Code  | ALC-FMG-500-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid parameter specification |
|  Action  |Specify valid values for the parameter. |

|  Code  | ALC-FMG-500-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to access an object that does not exist in CRX |
|  Action  |If the asset type exists on LC. Trigger Force Sync and try again. |

|  Code  | ALC-FMG-500-004 () |
|---|---|
|  Type  |Error |
|  Cause  |No resource path specified when trying to delete an object |
|  Action  |Choose a valid resource to delete from Forms Manager. |

|  Code  | ALC-FMG-500-005 () |
|---|---|
|  Type  |Error |
|  Cause  |There was some error when FormsManager tried to do some internal tasks using administrative privileges. |
|  Action  |Check the CRX logs for root cause and contact support. |

|  Code  | ALC-FMG-500-006 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to upload to a folder in an application that does not reside on LC. |
|  Action  |If the application does not exist on LC, create the application using Workbench or Admin UI and then try to upload from Forms Manager. |

|  Code  | ALC-FMG-500-007 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to upload to a path where some content of a different type resides in CRX. |
|  Action  |  |

|  Code  | ALC-FMG-500-008 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to access a path where no node exists in CRX |
|  Action  |If the path structure or the resource exists on LC. Trigger Force Sync and try again. |

|  Code  | ALC-FMG-500-009 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to perform a function with unsupported data type for it. e.g - Trying to upload a .txt file |
|  Action  |Please try with a valid resource type. |

|  Code  | ALC-FMG-500-010 () |
|---|---|
|  Type  |Error |
|  Cause  |When a search statement is made with propertyname = null, and the operation is not FULLTEXT |
|  Action  |  |

|  Code  | ALC-FMG-500-011 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to upload an unsupported file which is neither xdp nor zip |
|  Action  |Choose a valid zip or xdp and try again. |

|  Code  | ALC-FMG-500-012 () |
|---|---|
|  Type  |Error |
|  Cause  |The archive that was being uploaded is not a valid archive. |
|  Action  |  |

|  Code  | ALC-FMG-500-013 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to upload a ZIP folder with no supported data types of Forms Manager i.e. xdp or image |
|  Action  |Upload only an archive with valid resources supported by Forms Manager. |

|  Code  | ALC-FMG-500-014 () |
|---|---|
|  Type  |Error |
|  Cause  |FormsManager failed to create a JSON response for the request. |
|  Action  |Check CRX logs for the error cause. |

|  Code  | ALC-FMG-500-015 () |
|---|---|
|  Type  |Error |
|  Cause  |When a Form with no xdp content is uploaded in the FormsManager UI |
|  Action  |Upload a valid form with xdp content. |

|  Code  | ALC-FMG-500-016 () |
|---|---|
|  Type  |Error |
|  Cause  |While trying to edit a form, the XMP instance could not be fetched due to an internal error specified by cause |
|  Action  |  |

|  Code  | ALC-FMG-500-017 () |
|---|---|
|  Type  |Error |
|  Cause  |When a user tries to download an application/folder with no form resources. |
|  Action  |Download only a folder/application with valid resources. |

|  Code  | ALC-FMG-500-018 () |
|---|---|
|  Type  |Error |
|  Cause  |The path structure on LC and CRX are out of sync. Therefore, upload fails. |
|  Action  |Trigger Force Sync and try the operation again. |

|  Code  | ALC-FMG-600-001 () |
|---|---|
|  Type  |Error |
|  Cause  |The JCR session could not be fetched. |
|  Action  |Check if you are logged in to Forms Manager. If not, log in with sufficient permissions and try again. |

|  Code  | ALC-FMG-600-002 () |
|---|---|
|  Type  |Error |
|  Cause  |When a valid asset type is not found at a path intended for it. |
|  Action  |Check whether the asset is visible from Forms Manager? Is the asset visible on LC? If yes, force sync to get it on Forms Manager. Otherwise, try a different path. |

|  Code  | ALC-FMG-600-003 () |
|---|---|
|  Type  |Error |
|  Cause  |The form object has no xdp content |
|  Action  |Upload a valid form with xdp content in it. |

|  Code  | ALC-FMG-600-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to create an object at a path where content is already present. |
|  Action  |  |

|  Code  | ALC-FMG-600-005 () |
|---|---|
|  Type  |Error |
|  Cause  |Some error in retrieving content from CRX. Error specified by error-cause |
|  Action  |  |

|  Code  | ALC-FMG-600-006 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to access a node with no supported asset type of FormsManager i.e Form, Folder, Resource or Application |
|  Action  |Check the node path that might be pointing to a wrong undesired path. |

|  Code  | ALC-FMG-600-007 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid parameter specification. |
|  Action  |Fix the parameter and try again. |

|  Code  | ALC-FMG-600-008 () |
|---|---|
|  Type  |Error |
|  Cause  |The current user context doesn't have enough privileges for invoking/accessing the requested information. |
|  Action  |  |

|  Code  | ALC-FMG-600-009 () |
|---|---|
|  Type  |Error |
|  Cause  |Trying to access a node that does not exist in CRX |
|  Action  |Check the node-path. If an asset exists on LC at the same path structure. Trigger Force Sync and try again. |

|  Code  | ALC-FMG-600-010 () |
|---|---|
|  Type  |Error |
|  Cause  |FormsManager was not able to get the PDF rendering processes because it failed to obtain the configuration for services. |
|  Action  |  |

|  Code  | ALC-FMG-600-011 () |
|---|---|
|  Type  |Error |
|  Cause  |A request was made without any authenticated valid user or the user session no longer exists. |
|  Action  |  |

|  Code  | ALC-FMG-600-012 () |
|---|---|
|  Type  |Error |
|  Cause  |While retrieving processes for PDF rendition,there was an error in getting operations supported by the process. |
|  Action  |  |

|  Code  | ALC-FMG-600-013 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke the service for PDF rendition. |
|  Action  |  |

|  Code  | ALC-FMG-600-014 () |
|---|---|
|  Type  |Error |
|  Cause  |Shadow Node Root points to a path where no node exists in CRX |
|  Action  |Go to system/console/bundles. Refresh Forms Manager Core Bundle. The shadow node will get created in CRX. |

|  Code  | ALC-LCM-050-100 () |
|---|---|
|  Type  |Error |
|  Cause  |Module dependency error |
|  Action  |Identify the modules causing the error from log file. |

|  Code  | ALC-DSS-310-030 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to get credential for alias {0} |
|  Action  |Please check the specified alias existence. There is a mismatch. Check in truststore under credentials if it exists and matches. |

|  Code  | ALC-WKS-005-099 () |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred preparing response to client after a service call. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-100 () |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while retrieving the list users, who are out of office, in the specified date range. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-101 () |
|---|---|
|  Type  |Error |
|  Cause  |A problem occurred while trying to share a list of queue to user {0}. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-102 () |
|---|---|
|  Type  |Error |
|  Cause  |A problem occurred while trying to share a list of queue by user {0}. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-103 () |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while getting list of direct reports from service "{0}". |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-104 () |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while getting current user image URL from service "{0}". |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-105 () |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while asserting direct report from service "{0}". |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-106 () |
|---|---|
|  Type  |Info |
|  Cause  |The user "{0}" could not be verified as a direct report of current user. Cannot perform operation "{1}". |
|  Action  |Check the user reporting. |

|  Code  | ALC-WKS-005-107 () |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while parsing the JSON string for input variable {0} |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-DCT-003-029 () |
|---|---|
|  Type  |Info |
|  Cause  |Publishing Data Dictionary with name "{0}". |
|  Action  |This is an informative message logging the name of the Data Dictionary being published. |

|  Code  | ALC-ACM-002-030 () |
|---|---|
|  Type  |Error |
|  Cause  |Asset {0} is in Modified state, so can not be published. Please mark this asset as ready to publish before publishing. |
|  Action  |Please mark this asset as ready to publish before publishing. |

|  Code  | ALC-DCT-003-030 () |
|---|---|
|  Type  |Error |
|  Cause  |This data dictionary is in Modified state, so can not be published. Please mark this data dictionary as ready to publish before publishing. |
|  Action  |User should ensure that the Data Dictionary is in 'Ready To Publish' state before trying to publish the same. |

|  Code  | ALC-ACM-002-031 () |
|---|---|
|  Type  |Error |
|  Cause  |Error while generating Audit Logs. Invalid Asset Object. |
|  Action  |Please contact support. |

|  Code  | ALC-DCT-003-031 () |
|---|---|
|  Type  |Error |
|  Cause  |Deleted DDE "{0}" is being used inside expression of computed DDE "{1}". |
|  Action  |Update the computed DDE to remove the usage of Deleted DDE from its expression. |

|  Code  | ALC-ACM-002-032 () |
|---|---|
|  Type  |Error |
|  Cause  |Letter {0} has Instances in DRAFT state, so can not be deactivated. |
|  Action  |Please ensure that there is no DRAFT instance before deactivating the Letter. |

|  Code  | ALC-ACM-002-033 () |
|---|---|
|  Type  |Error |
|  Cause  |Letter {0} has never been published, so can not be deactivated. |
|  Action  |Please ensure that Letter should have a Published version in order for it to be successfully deactivated. |

|  Code  | ALC-ACM-002-034 () |
|---|---|
|  Type  |Error |
|  Cause  |Text Module contains DDE variables but does not have a referenced Data Dictionary or Data Dictionary Element. |
|  Action  |Please ensure that Text Module uses DDE elements from referred Data Dictionary only. |

|  Code  | ALC-ACM-002-035 () |
|---|---|
|  Type  |Error |
|  Cause  |Error while generating Audit Log for {0} method |
|  Action  |Please contact support. |

|  Code  | ALC-ACM-002-036 () |
|---|---|
|  Type  |Error |
|  Cause  |Either provided object id is invalid or you do not have access to the object. |
|  Action  |Please contact support in case the object id is valid and user has required access. |

|  Code  | ALC-ACM-002-037 () |
|---|---|
|  Type  |Error |
|  Cause  |Object corresponding to provided id is not an asset object. |
|  Action  |Please contact support. |

|  Code  | ALC-ACM-002-038 () |
|---|---|
|  Type  |Error |
|  Cause  |Input list contains more than one instances of Object with id "{0}". |
|  Action  |Please contact support. |

|  Code  | ALC-ACM-002-039 () |
|---|---|
|  Type  |Error |
|  Cause  |Operation does not support publishing Asset type {0}. |
|  Action  |Please ensure that the correct operation is invoked for publishing the asset. |

|  Code  | ALC-ACM-002-040 () |
|---|---|
|  Type  |Error |
|  Cause  |Provided asset id is invalid. |
|  Action  |An invalid identifier was provided for the asset. Verify that the asset id is valid (not null and not empty). |

|  Code  | ALC-ACM-002-407 () |
|---|---|
|  Type  |Error |
|  Cause  |Content data missing, please provide a valid file for the Content Data Module. |
|  Action  |Please verify that you are passing a valid file for creating the Content Data Module |

|  Code  | ALC-ACM-002-408 () |
|---|---|
|  Type  |Error |
|  Cause  |Content Data Module contains null or blank file name. |
|  Action  |Please assign a valid file name while creating the Content Data Module. |

|  Code  | ALC-ACM-003-205 () |
|---|---|
|  Type  |Error |
|  Cause  |Access denied while attempting to invoke process: {0}. |
|  Action  |Either add the process name in the white list services (in Livecycle Client SDK configurations) or ensure that the user has to access to invoke this process. |

|  Code  | ALC-ACM-004-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Error while verifying user permissions. |
|  Action  |Please contact support. |

|  Code  | ALC-ACM-004-003 () |
|---|---|
|  Type  |Error |
|  Cause  |APP Context not found. |
|  Action  |Please contact support in case this error is encountered. |

|  Code  | ALC-ACM-005-009 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to add attachments to the submitted letter. |
|  Action  |Some internal error happened while rendering PDF with the attachments. Please contact support. |

|  Code  | ALC-ACM-007-008 () |
|---|---|
|  Type  |Error |
|  Cause  |User does not have access for import. Only members of "CM Asset Import" group are allowed to perform this operation. |
|  Action  |Only "Correspondence Management Administrator" role has the access to perform import operation. Please assign this role to the user in case you want him to perform this operation. |

|  Code  | ALC-ACM-007-009 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in importing asset {0}. This asset already exists at a different path. |
|  Action  |Asset with this name already exists on the server. Please compare the name of the asset being imported with the asset that exists on the server in case insensitive manner. |

|  Code  | ALC-ACM-009-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Error delivering letter. |
|  Action  |Some internal error occurred during the Letter instance delivery. Please contact support. |

|  Code  | ALC-ACM-009-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Letter has not been submitted yet. |
|  Action  |Some internal error occurred during the Letter instance delivery. Please contact support. |

|  Code  | ALC-ACM-010-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in creating letter instance. |
|  Action  |Check the application logs for more details and report the error. |

|  Code  | ALC-ACM-010-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in creating letter instance. Input parameter: {0} is null. |
|  Action  |Please verify the value of the input parameter being passed to the API. Null value for this input parameter is not supported. |

|  Code  | ALC-ACM-010-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in retrieving letter instance for id : {0}. |
|  Action  |An invalid identifier was provided for the Letter Instance. Verify that the letter instance id is valid (not null and not empty). |

|  Code  | ALC-ACM-010-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Null letter id. |
|  Action  |An invalid or Null identifier was provided for the Letter Instance. Verify that the letter instance id is valid (not null and not empty). |

|  Code  | ALC-ACM-010-005 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid input data. |
|  Action  |Please ensure that a valid data was assigned to the Letter Instance. |

|  Code  | ALC-ACM-011-001 () |
|---|---|
|  Type  |Error |
|  Cause  |All assets cannot be Published as there are some 'Modified' assets present on the server. Please mark them Ready To Publish and try again. |
|  Action  |This error appears when "Publish All" assets operation is triggered while there are some Modified assets present on the server. Please mark them 'Ready To Publish' before performing this operation. |

|  Code  | ALC-ACM-011-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in processing stimulated operation. Kindly check server logs. |
|  Action  |Some internal error occurred during the invocation of this Batch Operation. Please contact support. |

|  Code  | ALC-ACM-011-003 () |
|---|---|
|  Type  |Error |
|  Cause  |The status of the invoked operation is found to be "In Process". Please try after sometime. |
|  Action  |Two instances of same Batch Operation cannot be triggered at the same time. Please wait for the running process to complete. |

|  Code  | ALC-ACM-011-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Unexpected Error occurred while executing this operation. |
|  Action  |Some internal error occurred during the invocation of this Batch Operation. Please contact support. |

|  Code  | ALC-DSS-203-002 () |
|---|---|
|  Type  |Error |
|  Cause  |The given signature field {0} does not exist in the input PDF. |
|  Action  |Please check that the specified signature field exist in the pdf. |

|  Code  | ALC-DSS-000-001 () |
|---|---|
|  Type  |Info |
|  Cause  |Could not parse Other Revocation data {0} |
|  Action  |unable to parse Revocation data |

|  Code  | ALC-DSS-000-002 () |
|---|---|
|  Type  |Info |
|  Cause  |Could not convert byte array to Certificate Info {0} |
|  Action  |The byte array provided cannot be converted to Certificate. Please check using debug tools. |

|  Code  | ALC-DSS-000-003 () |
|---|---|
|  Type  |Info |
|  Cause  |Could not get DER bytes from RSA cert {0} |
|  Action  |Conversion from RSA certificate to DER byte[] is not possible |

|  Code  | ALC-DSS-100-001 () |
|---|---|
|  Type  |Info |
|  Cause  |Operation {0} started |
|  Action  |None |

|  Code  | ALC-DSS-100-002 () |
|---|---|
|  Type  |Info |
|  Cause  |Operation {0} completed Successfully. |
|  Action  |None |

|  Code  | ALC-DSS-100-003 () |
|---|---|
|  Type  |Info |
|  Cause  |Resetting {0} TrustStore cache as TrustStore has been invalidated |
|  Action  |None, System would itself take care. Just for Information |

|  Code  | ALC-DSS-100-004 () |
|---|---|
|  Type  |Info |
|  Cause  |PDFMM Compatibility interfaces for signatures functionality registered |
|  Action  |None |

|  Code  | ALC-DSS-103-001 () |
|---|---|
|  Type  |Info |
|  Cause  |Using the default Adobe Logo for signature field {0} |
|  Action  |None, Just for information |

|  Code  | ALC-DSS-103-002 () |
|---|---|
|  Type  |Info |
|  Cause  |Could not get default logo {0} |
|  Action  |Please provide default logo, if applicable |

|  Code  | ALC-DSS-103-003 () |
|---|---|
|  Type  |Info |
|  Cause  |Timestamp Extension Version {0} is not supported |
|  Action  |Timestamp Extension Version is not supported |

|  Code  | ALC-DSS-103-004 () |
|---|---|
|  Type  |Info |
|  Cause  |No TSP URL in the Certificate |
|  Action  |None. Try adding TSP URL in the Certificate if the need be. |

|  Code  | ALC-DSS-103-005 () |
|---|---|
|  Type  |Info |
|  Cause  |The version of the input Document is being updated to version because of the operation |
|  Action  |None. Just for information |

|  Code  | ALC-DSS-310-001 () |
|---|---|
|  Type  |Error |
|  Cause  |An exception occured from an internal operation. |
|  Action  |Contact Support |

|  Code  | ALC-DSS-310-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Maximum number of path building sessions exceeded. |
|  Action  |Maximum number of path sessions can be changed using adminui. Default value is 10 in ES4 SP1 and was 5 in earlier versions |

|  Code  | ALC-DSS-310-005 () |
|---|---|
|  Type  |Error |
|  Cause  |Could not convert bytes to {0}. |
|  Action  |Generated because the the currently used certificate or crl's byte[] is malformed and thus cannot be used in the application. To verify please check the certificate or crl again using other available debug tools and use correct certificate or crl. |

|  Code  | ALC-DSS-310-006 () |
|---|---|
|  Type  |Error |
|  Cause  |URL is malformed. |
|  Action  |Ldap or http url being used here is malformed. Try resolving it. |

|  Code  | ALC-DSS-310-007 () |
|---|---|
|  Type  |Error |
|  Cause  |Could not create transport provider. |
|  Action  |We do not support HTTPs/LDAPs in FIPS mode. Please use HTTP or LDAP instead |

|  Code  | ALC-DSS-310-010 () |
|---|---|
|  Type  |Error |
|  Cause  |Could not get {0} bytes. |
|  Action  |Error in converting Certificate byte[] into RSA Certificate or Java Certificate. Please check the supplied certificate file. |

|  Code  | ALC-DSS-310-011 () |
|---|---|
|  Type  |Error |
|  Cause  |Cannot clone {0}. |
|  Action  |Check IssuerName of the crl supplied, though this bug should come in extremely rare situations. |

|  Code  | ALC-DSS-310-012 () |
|---|---|
|  Type  |Error |
|  Cause  |RDN Provided is invalid. |
|  Action  |Exception thrown to indicate that the distributionPointName for this crl cannot be added as a relative distinguished name (RDN) to the issuerName. Check the crl for distributionPointName and IssuerName. |

|  Code  | ALC-DSS-310-013 () |
|---|---|
|  Type  |Error |
|  Cause  |Cannot convert {0} to GeneralName. {0} : {1}. |
|  Action  |Cannot convert url in this crl to GeneralName. Please check and replace with correct crl. |

|  Code  | ALC-DSS-310-015 () |
|---|---|
|  Type  |Error |
|  Cause  |Could not create a valid Path Builder. |
|  Action  |Problems with Path Builder. Please recheck the certificate |

|  Code  | ALC-DSS-310-016 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to get certificate database. |
|  Action  |Contact Support. A rare scenario |

|  Code  | ALC-DSS-310-017 () |
|---|---|
|  Type  |Error |
|  Cause  |Could not build certificate path for certificate. \r{0}. |
|  Action  |Problems with Certificate Path Building. Check that all the certificates in the path or chain are valid and present in truststore or ldap server. |

|  Code  | ALC-DSS-310-028 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid certificate type. |
|  Action  |Rare Scenario. Certificate Type is not amonsgt DER, Java and RSA. Should not happen in the first place. Contact Support |

|  Code  | ALC-DSS-310-029 () |
|---|---|
|  Type  |Error |
|  Cause  |{0} cannot can be null |
|  Action  |The xml of the signature is null. Contact Support |

|  Code  | ALC-DSS-310-031 () |
|---|---|
|  Type  |Error |
|  Cause  |Got an error while making datadigest |
|  Action  |Contact Support |

|  Code  | ALC-DSS-310-032 () |
|---|---|
|  Type  |Error |
|  Cause  |Type does not match with params |
|  Action  |Contact Support |

|  Code  | ALC-DSS-310-033 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid timestamp mime type. |
|  Action  |Rare Scenario. The Mime type in response doesn't match or is null. Check data connection and contact support. |

|  Code  | ALC-DSS-310-034 () |
|---|---|
|  Type  |Error |
|  Cause  |Cannot create {0} |
|  Action  |Probelm in Path Creation. Please check all certificates in chain from CA to p12 are in place and valid. |

|  Code  | ALC-DSS-310-035 () |
|---|---|
|  Type  |Error |
|  Cause  |Cannot validate path. |
|  Action  |Problem in path validation. Please check all certificates in chain from CA to p12 are in place and valid. |

|  Code  | ALC-DSS-310-036 () |
|---|---|
|  Type  |Error |
|  Cause  |{0} is null |
|  Action  |Problem with Certificate path generation and graph building. Rare Scenario. Contact Support |

|  Code  | ALC-DSS-310-037 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in processing certificate |
|  Action  |Check certificate to be valid and contact support. Can come for varied reasons. |

|  Code  | ALC-DSS-310-038 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in processing policy constraints |
|  Action  |Issues while building policy tree. Check all policies contraints and extensions in the certificate or crl. |

|  Code  | ALC-DSS-310-039 () |
|---|---|
|  Type  |Error |
|  Cause  |{0} does not exist |
|  Action  |Node does not exist in policy tree. Check all policies in certificate or crl. Contact Support |

|  Code  | ALC-DSS-310-040 () |
|---|---|
|  Type  |Error |
|  Cause  |Cannot parse crl |
|  Action  |Issues while parsing crl.Please check crl again. |

|  Code  | ALC-DSS-310-041 () |
|---|---|
|  Type  |Error |
|  Cause  |Unrecognized critical crl extension {0} |
|  Action  |CRL Entry Extensions can be of the above 4 types only. Any other critical extensions is an error. Please check crl again |

|  Code  | ALC-DSS-310-042 () |
|---|---|
|  Type  |Error |
|  Cause  |Issuers do not match |
|  Action  |IssuerName for Certificate and Crl don't match. |

|  Code  | ALC-DSS-310-043 () |
|---|---|
|  Type  |Error |
|  Cause  |scope verification failed. |
|  Action  |Directly from RFC3280 1) If the onlyContainsUserCerts boolean is asserted in the IDP CRL extension, verify that the certificate does not include the basic constraints extension with the CA boolean asserted. 2) If the onlyContainsCACerts boolean is asserted in the IDP CRL extension, verify that the certificate includes the basic constraints extension with the CA boolean asserted. |

|  Code  | ALC-DSS-310-044 () |
|---|---|
|  Type  |Error |
|  Cause  |Revocation type not crl |
|  Action  |Rare scenario. Revocation type is not crl, its either ocsp or other. please check |

|  Code  | ALC-DSS-310-046 () |
|---|---|
|  Type  |Error |
|  Cause  |Can not get {0} |
|  Action  |Error in getting the estimated size (in bytes) of signature. |

|  Code  | ALC-DSS-310-048 () |
|---|---|
|  Type  |Error |
|  Cause  |Could not sign {0} |
|  Action  |Problem while signing. Contact Support |

|  Code  | ALC-DSS-310-049 () |
|---|---|
|  Type  |Error |
|  Cause  |{0} not present |
|  Action  |Node (in graph) or signature is not present. Contact Support |

|  Code  | ALC-DSS-310-051 () |
|---|---|
|  Type  |Error |
|  Cause  |Could not verify xml signature. |
|  Action  |Contact Support |

|  Code  | ALC-DSS-310-052 () |
|---|---|
|  Type  |Error |
|  Cause  |Internal error. |
|  Action  |Contact Support |

|  Code  | ALC-DSS-310-053 () |
|---|---|
|  Type  |Error |
|  Cause  |Signer verification failed. |
|  Action  |Probelm with signer's certificate. Please check for its validity |

|  Code  | ALC-DSS-111-001 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSPNoCheck Extension is not allowed |
|  Action  |OCSPNoCheck is set to false in OCSPPreferences. Extension name is id-pkix-ocsp-nocheck in certificate. |

|  Code  | ALC-DSS-111-002 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP CertHash Extension is required |
|  Action  |OCSP CertHash Extension is required |

|  Code  | ALC-DSS-111-003 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP CertHash in the response does not match the request certificate |
|  Action  |OCSP CertHash in the response does not match the request certificate. Please check certificate and OCSP. |

|  Code  | ALC-DSS-111-004 () |
|---|---|
|  Type  |Info |
|  Cause  |Must sign the OCSP request |
|  Action  |Please sign the OCSP request |

|  Code  | ALC-DSS-111-005 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP response signature is invalid |
|  Action  |Please check OCSP response signature |

|  Code  | ALC-DSS-111-006 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP request generation error: {0} |
|  Action  |Contact Support |

|  Code  | ALC-DSS-111-007 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP request was null |
|  Action  |Check OCSP |

|  Code  | ALC-DSS-111-008 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP response parsing error: {0} |
|  Action  |Contact Support |

|  Code  | ALC-DSS-111-009 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP transport error: {0} |
|  Action  |Contact Support |

|  Code  | ALC-DSS-111-010 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP response has expired or is not yet valid |
|  Action  |Please check OCSP. |

|  Code  | ALC-DSS-111-011 () |
|---|---|
|  Type  |Info |
|  Cause  |OCSP response and request nonce does not match |
|  Action  |OCSP response and request nonce does not match |

|  Code  | ALC-DSS-112-001 () |
|---|---|
|  Type  |Info |
|  Cause  |No CRL DPs found. |
|  Action  |No Crls DP foudn in certificate. Please check if this is the expected behaviour. |

|  Code  | ALC-DSS-112-002 () |
|---|---|
|  Type  |Info |
|  Cause  |Unable to process a CRL DP: {0} |
|  Action  |Problem parsing CRL Distribution Point. Please check and change. |

|  Code  | ALC-DSS-112-003 () |
|---|---|
|  Type  |Info |
|  Cause  |Unable to retrieve CRL from: {0} with error: {1} |
|  Action  |please check whether the crl is available on provided url location. |

|  Code  | ALC-DSS-112-004 () |
|---|---|
|  Type  |Info |
|  Cause  |CRL thisUpdate is in the future |
|  Action  |the availble crl update is in future |

|  Code  | ALC-DSS-112-005 () |
|---|---|
|  Type  |Info |
|  Cause  |CRL has expired or is not yet valid |
|  Action  |The certificate expires before the CRL thisUpdate or the CRL nextUpdate before the certificate validity start date |

|  Code  | ALC-DSS-112-006 () |
|---|---|
|  Type  |Info |
|  Cause  |This is a delta CRL. Delta CRLs are not supported in this version. |
|  Action  |None |

|  Code  | ALC-DSS-112-007 () |
|---|---|
|  Type  |Info |
|  Cause  |CRL parsing error: {0} |
|  Action  |Check CRL again. CRL parsing error. |

|  Code  | ALC-DSS-112-008 () |
|---|---|
|  Type  |Info |
|  Cause  |CRL KeyID does not match |
|  Action  |Crl KeyID does not match Certificate KeyID |

|  Code  | ALC-DSS-112-010 () |
|---|---|
|  Type  |Info |
|  Cause  |CRL signature verification with issuer failed |
|  Action  |CRL Signature Verification using Certificate's public key failed. |

|  Code  | ALC-DSS-112-011 () |
|---|---|
|  Type  |Info |
|  Cause  |CRL Verification failure error: {0} |
|  Action  |Contact Support |

|  Code  | ALC-DSS-112-012 () |
|---|---|
|  Type  |Info |
|  Cause  |CRL Issuer does not have a valid key usage |
|  Action  |Please check the crl |

|  Code  | ALC-DSS-112-013 () |
|---|---|
|  Type  |Info |
|  Cause  |No Valid CRL issuer found |
|  Action  |Please check CRL for crl Issuer |

|  Code  | ALC-DSS-112-014 () |
|---|---|
|  Type  |Info |
|  Cause  |CRL or one of its entries contains an unrecognized critical extension |
|  Action  |Please check crl for unrecognized critical extensions. |

|  Code  | ALC-DSS-112-015 () |
|---|---|
|  Type  |Info |
|  Cause  |No Valid CRL found |
|  Action  |Please check the crl. |

|  Code  | ALC-DSS-310-023 () |
|---|---|
|  Type  |Info |
|  Cause  |Invalid or Null Timestamp token |
|  Action  |Contact Support |

|  Code  | ALC-DSS-310-024 () |
|---|---|
|  Type  |Info |
|  Cause  |Timestamp Token verification failed |
|  Action  |Contact Support |

|  Code  | ALC-DSS-310-025 () |
|---|---|
|  Type  |Info |
|  Cause  |Invalid TSA Certificate |
|  Action  |Please check certificate |

|  Code  | ALC-DSS-310-026 () |
|---|---|
|  Type  |Info |
|  Cause  |Timestamping failed with error:- {0}. |
|  Action  |Contact Support |

|  Code  | ALC-FMP-001-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Exception occurred during server side processing. |
|  Action  |Check the server side logs for detailed exception. |

|  Code  | () |
|---|---|
|  Type  |Error |
|  Cause  |  |
|  Action  |  |

|  Code  | ALC-FMP-001-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in writing server response. |
|  Action  |Check server side logs for detailed message. |

|  Code  | ALC-FMP-001-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in json creation. |
|  Action  |Check server side logs for detailed message. |

|  Code  | ALC-FMP-001-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in getting response from remote server. |
|  Action  |Please ensure that remote livecycle server is up and running and there are not network issues. |

|  Code  | ALC-FMP-001-005 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in establishing connection to remote server. |
|  Action  |Please ensure that remote livecycle server is up and running and there are not network issues. |

|  Code  | ALC-FMP-001-006 () |
|---|---|
|  Type  |Error |
|  Cause  |Url Encoding not supported. |
|  Action  |  |

|  Code  | ALC-FMP-002-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Failed to get request parameters from remote server. |
|  Action  |Please ensure that remote livecycle server is up and running and there are not network issues. |

|  Code  | ALC-ACM-002-041 () |
|---|---|
|  Type  |Error |
|  Cause  |Null input parameter {0}. |
|  Action  |Please pass valid input parameter. |

|  Code  | ALC-ACM-003-008 () |
|---|---|
|  Type  |Error |
|  Cause  |A letter rendered using XFA bullets can not be enabled for reload. |
|  Action  |Please ensure that enableReload flag is set to false. |

|  Code  | ALC-ACM-003-009 () |
|---|---|
|  Type  |Error |
|  Cause  |Image module is being used inside a bulleted list. This is not allowed when XFA bullets are enabled. |
|  Action  |Please ensure that list modules do not contain image modules for generating letters with XFA bullets. |

|  Code  | ALC-ACM-003-010 () |
|---|---|
|  Type  |Error |
|  Cause  |Server side data merge is required for rendering a letter with XFA bullets. |
|  Action  |Please ensure that data merge option is set to true for generating letter with XFA bullets. |

|  Code  | ALC-ACM-007-010 () |
|---|---|
|  Type  |Error |
|  Cause  |Package being imported is not supported. The package contains invalid entry {0}. |
|  Action  |Please ensure that package being imported has been exported from CM UI. |

|  Code  | ALC-FMG-500-019 () |
|---|---|
|  Type  |Error |
|  Cause  |Sample data can be uploaded for interactive forms only. |
|  Action  |Please ensure the form for which sample data is being uploaded, is interactive. |

|  Code  | ALC-FMG-500-020 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid value "{0}" for property "{1}". |
|  Action  |Please check the values you have provided to the properties. The values must be valid. |

|  Code  | ALC-FMG-500-021 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid value for allowedRenderFormat property. Only "PDF", "HTML" and "BOTH" are valid values. |
|  Action  |Please check the value selected for "Render Format" property. The value must be one of the three values: "PDF", "HTML" or "BOTH PDF,HTML" |

|  Code  | ALC-FMG-500-022 () |
|---|---|
|  Type  |Error |
|  Cause  |Submit URL can not be set for AcroForms. |
|  Action  |Please ensure the form for which you are updating the submit url, is not AcroForm. |

|  Code  | ALC-FMG-500-023 () |
|---|---|
|  Type  |Error |
|  Cause  |Metadata of this form is not editable. Unable to edit property "{0}". |
|  Action  |Properties like title, description, author and submit url are not editable for signed, encrypted forms. Please ensure you do not update such properties. |

|  Code  | ALC-FMG-500-024 () |
|---|---|
|  Type  |Error |
|  Cause  |Unexpected Error: {0}. |
|  Action  |Kindly check server logs to identify the issue. |

|  Code  | ALC-FMP-001-007 () |
|---|---|
|  Type  |Error |
|  Cause  |Allowed Render Format Property is not set on a form. |
|  Action  |Check for the form with allowedRenderedFormatProperty not set. Run force sync from Forms Manager UI. |

|  Code  | ALC-PMR-500-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Filter is null. |
|  Action  |Define a valid filter. |

|  Code  | ALC-PMR-500-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Id is null. |
|  Action  |Give a valid Id. |

|  Code  | ALC-PMR-500-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Unknown Servlet Action. |
|  Action  |An undefined action was invoked. Check the error logs for details. |

|  Code  | ALC-PMR-500-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Constraint. |
|  Action  |Give a valid constraint for the filter. |

|  Code  | ALC-PMR-500-005 () |
|---|---|
|  Type  |Error |
|  Cause  |Chart Data Service not specified. |
|  Action  |Specify the Chart Data Service to be invoked. |

|  Code  | ALC-PMR-500-006 () |
|---|---|
|  Type  |Error |
|  Cause  |Requested Chart Data Service is unavailable. |
|  Action  |Define and deploy the Chart Data Service before invocation. |

|  Code  | ALC-PMR-500-007 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in generating JSON. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-500-009 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in CSV creation. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-500-010 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in query response creation. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-500-008 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in parsing JSON. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-500-011 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in reading user info. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-500-012 () |
|---|---|
|  Type  |Error |
|  Cause  |Resource resolver is null. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-600-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to login in the repository. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-600-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in accessing repository. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-600-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to get user context through current request. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-600-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in accessing property value: {0} |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-600-005 () |
|---|---|
|  Type  |Error |
|  Cause  |No path exists for property: {0} |
|  Action  |Create the property before accessing. |

|  Code  | ALC-PMR-600-006 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to set Configuration Properties. |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-700-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to parse date: {0} |
|  Action  |Give a valid date. |

|  Code  | ALC-PMR-700-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in accessing object {0} |
|  Action  |Check error log for details. |

|  Code  | ALC-PMR-700-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Error in extracting locale from request. |
|  Action  |Check error log for details. |

|  Code  | ALC-LCM-999-041 () |
|---|---|
|  Type  |Error |
|  Cause  |CRX did not come online. |
|  Action  |Check the logs for detail. |

|  Code  | ALC-LCM-200-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Failed to connect to Content Repository. \nContent Repository may not be started, please retry after sometime. |
|  Action  |Check the logs for detail. |

|  Code  | ALC-CRX-030-000 () |
|---|---|
|  Type  |Error |
|  Cause  |[{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-001 () |
|---|---|
|  Type  |Error |
|  Cause  |Authentication Failed for User : [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-002 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to locate :[{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-003 () |
|---|---|
|  Type  |Error |
|  Cause  |Repository Fault |
|  Action  |  |

|  Code  | ALC-CRX-030-004 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Type [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-005 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to retrieve content from [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-006 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid mimetype [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-007 () |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke webscript url [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-008 () |
|---|---|
|  Type  |Error |
|  Cause  |Not a folder : [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-009 () |
|---|---|
|  Type  |Error |
|  Cause  |Node : [{0}] already exists in repository |
|  Action  |  |

|  Code  | ALC-CRX-030-010 () |
|---|---|
|  Type  |Error |
|  Cause  |Access denied for User : [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-011 () |
|---|---|
|  Type  |Error |
|  Cause  |Failed to issue request to CRX Server. There can be two possible reasons for this. 1. CRX' webdav URL is not configured correctly. Please go to CRXRepositoryServier configuration properties in Admin UI and update CRX Url property. 2. CRX quickstart may not be up. |
|  Action  |  |

|  Code  | ALC-CRX-030-012 () |
|---|---|
|  Type  |Error |
|  Cause  |The name specified is invalid : [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-013 () |
|---|---|
|  Type  |Error |
|  Cause  |The format of date string :[{0}] is incorrect. It has to comply with ISO 8601 "yyyy-MM-dd'T'HH:mm:ss'Z'". |
|  Action  |  |

|  Code  | ALC-CRX-030-014 () |
|---|---|
|  Type  |Error |
|  Cause  |The version label [{0}] is invalid for node. |
|  Action  |  |

|  Code  | ALC-CRX-030-015 () |
|---|---|
|  Type  |Error |
|  Cause  |The node [{0}] is not versioned. |
|  Action  |  |

|  Code  | ALC-CRX-030-016 () |
|---|---|
|  Type  |Error |
|  Cause  |The permission [{0}] is invalid for node. |
|  Action  |  |

|  Code  | ALC-CRX-030-017 () |
|---|---|
|  Type  |Error |
|  Cause  |Null Content Access Permission passed to the access permissions list. |
|  Action  |  |

|  Code  | ALC-CRX-030-018 () |
|---|---|
|  Type  |Error |
|  Cause  |The authority [{0}] does not exist. |
|  Action  |  |

|  Code  | ALC-CRX-030-019 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Node Type: [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-020 () |
|---|---|
|  Type  |Error |
|  Cause  |CIFS Root name for 'Company Home' is not configured. Please provide a valid folder name for '-Dfilesystem.name=<>' JVM argument in App-server startup. Also ensure that filesystem rootPath is configured as /app:company_home in file-servers.xml file. |
|  Action  |  |

|  Code  | ALC-CRX-030-021 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Mixin [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-022 () |
|---|---|
|  Type  |Error |
|  Cause  |Mixin List cannot be empty |
|  Action  |  |

|  Code  | ALC-CRX-030-023 () |
|---|---|
|  Type  |Error |
|  Cause  |Integrity Error. [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-024 () |
|---|---|
|  Type  |Error |
|  Cause  |The node is locked. [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-025 () |
|---|---|
|  Type  |Error |
|  Cause  |Repository root directory deletion not allowed. |
|  Action  |  |

|  Code  | ALC-CRX-030-026 () |
|---|---|
|  Type  |Error |
|  Cause  |Not a content :[{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-027 () |
|---|---|
|  Type  |Error |
|  Cause  |Checkout or Checkin failed for [{0}] Cause :- {1} |
|  Action  |  |

|  Code  | ALC-CRX-030-028 () |
|---|---|
|  Type  |Error |
|  Cause  |Type mismatch |
|  Action  |  |

|  Code  | ALC-CRX-030-029 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid relationship name specified [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-030 () |
|---|---|
|  Type  |Error |
|  Cause  |Node : [{0}] is already checked out. |
|  Action  |  |

|  Code  | ALC-CRX-030-031 () |
|---|---|
|  Type  |Error |
|  Cause  |Source and target nodes are same : - [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-032 () |
|---|---|
|  Type  |Error |
|  Cause  |Node : [{0}] is already checked in. |
|  Action  |  |

|  Code  | ALC-CRX-030-033 () |
|---|---|
|  Type  |Error |
|  Cause  |Node :[{0}] is checked-in and hence is in a read-only state.It should be checked out before performing a modification operation. |
|  Action  |  |

|  Code  | ALC-CRX-030-034 () |
|---|---|
|  Type  |Error |
|  Cause  |The Principal name [{0}] does not exist. |
|  Action  |  |

|  Code  | ALC-CRX-030-035 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid input for parameter [{0}] while invoking [{1}] |
|  Action  |  |

|  Code  | ALC-CRX-030-037 () |
|---|---|
|  Type  |Error |
|  Cause  |[{0}] is only supported with Native protocol. |
|  Action  |  |

|  Code  | ALC-CRX-030-100 () |
|---|---|
|  Type  |Error |
|  Cause  |No Folder specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-101 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid or No workspace specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-102 () |
|---|---|
|  Type  |Error |
|  Cause  |No Node name specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-103 () |
|---|---|
|  Type  |Error |
|  Cause  |No Node type specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-104 () |
|---|---|
|  Type  |Error |
|  Cause  |No Node encoding specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-105 () |
|---|---|
|  Type  |Error |
|  Cause  |No Content(InputStream) present. |
|  Action  |  |

|  Code  | ALC-CRX-030-106 () |
|---|---|
|  Type  |Error |
|  Cause  |No Content type specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-107 () |
|---|---|
|  Type  |Error |
|  Cause  |No Path specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-108 () |
|---|---|
|  Type  |Error |
|  Cause  |No Relationship type specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-109 () |
|---|---|
|  Type  |Error |
|  Cause  |No Child Path specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-110 () |
|---|---|
|  Type  |Error |
|  Cause  |No Parent Path specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-111 () |
|---|---|
|  Type  |Error |
|  Cause  |No Source Path specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-112 () |
|---|---|
|  Type  |Error |
|  Cause  |No Target Path specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-113 () |
|---|---|
|  Type  |Error |
|  Cause  |No Template/Source Folder specified. |
|  Action  |  |

|  Code  | ALC-CRX-030-114 () |
|---|---|
|  Type  |Error |
|  Cause  |No permission specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-115 () |
|---|---|
|  Type  |Error |
|  Cause  |No Query string passed. |
|  Action  |  |

|  Code  | ALC-CRX-030-116 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid value passed for maxSize. |
|  Action  |  |

|  Code  | ALC-CRX-030-117 () |
|---|---|
|  Type  |Error |
|  Cause  |Error creating query, operation [{0}] not allowed for type [{1}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-118 () |
|---|---|
|  Type  |Error |
|  Cause  |Error parsing the query. [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-119 () |
|---|---|
|  Type  |Error |
|  Cause  |Invalid value specified for property [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-120 () |
|---|---|
|  Type  |Error |
|  Cause  |No version Label specified while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-211 () |
|---|---|
|  Type  |Info |
|  Cause  |There is no Document service available for the conversion of [{0}] |
|  Action  |  |

|  Code  | ALC-CRX-030-212 () |
|---|---|
|  Type  |Info |
|  Cause  |No data could be fetched from the provided XML files. |
|  Action  |  |

|  Code  | ALC-CRX-030-213 () |
|---|---|
|  Type  |Info |
|  Cause  |Received no response from while invoking [{0}]. |
|  Action  |  |

|  Code  | ALC-CRX-030-214 () |
|---|---|
|  Type  |Info |
|  Cause  |Map does not contain any XML data. |
|  Action  |  |

|  Code  | ALC-CRX-030-215 () |
|---|---|
|  Type  |Info |
|  Cause  |Desired conversion could not be done.! |
|  Action  |  |

|  Code  | ALC-CRX-030-216 () |
|---|---|
|  Type  |Info |
|  Cause  |Transformation to [{0}] is not supported. |
|  Action  |  |

|  Code  | ALC-CRX-030-217 () |
|---|---|
|  Type  |Info |
|  Cause  |List of InputStreams received after conversion is empty. |
|  Action  |  |

## Assembler Error Codes {#assembler-error-codes}

|  Code  | ALC-ASM-N00-000 (Assembler) |
|---|---|
|  Type  |  |
|  Cause  |Assembler Version: {0} |
|  Action  |An information message displaying the Assembler version number. |

|  Code  | ALC-ASM-N00-001 (Assembler) |
|---|---|
|  Type  |  |
|  Cause  |{0}: {1} {2} |
|  Action  |An information message displayed during normal operations. |

|  Code  | ALC-ASM-S00-001 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |DDX was null. It is required. |
|  Action  |The DDX object passed to the invoke() method was null. It is required. |

|  Code  | ALC-ASM-S00-002 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to execute the DDX - error messages provided. |
|  Action  |DDX Execution error. The error message is provided along with a stack trace if available. Corrective action is based on any messages or warnings present. |

|  Code  | ALC-ASM-S00-003 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Passivating the log document failed. |
|  Action  |An error occurred while attempting to convert the job log to a com.adobe.idp.Document object to return to the client. The exception includes an error message to indicate the root cause. This error may also occur if the document storage partition is full. |

|  Code  | ALC-ASM-S00-004 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot connect to the FontManager. |
|  Action  |The FontManager could not be contacted. Verify that the FontManager is properly installed. Use the JMX console to verify that it is currently running. |

|  Code  | ALC-ASM-S00-005 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to acquire result content for {0} referencing {1}. |
|  Action  |An error occurred while trying to read the content for a result. The content was created, but could not be read from the disk file or input stream. This error occurs during low disk space or low memory conditions. |

|  Code  | ALC-ASM-S00-006 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to passivate document for {0}. |
|  Action  |An error occurred while trying to passivate the content for a result. This error can occur if the global temporary storage directory is full or unavailable. |

|  Code  | ALC-ASM-S00-007 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid result document for {0}; type was {1}. |
|  Action  |There was no result document for a result node in the DDX or its type is unknown. This is an internal logic error; report it to Customer Support. |

|  Code  | ALC-ASM-S00-008 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid PDF source document for {0}. |
|  Action  |The document provided as a PDF source was invalid. Verify that the document is not corrupted or the content is PDF content. |

|  Code  | ALC-ASM-S00-009 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid XDP source document for {0}. |
|  Action  |The document provided as an XDP source was invalid. Verify that the document is not corrupted or the content is an XDP containing a PDF document. |

|  Code  | ALC-ASM-S00-010 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |The document named "{0}" could not be opened. |
|  Action  |The document could not be opened. A chained exception provides details on the cause. The most common causes are a corrupt document, an I/O error, or a security-related error. |

|  Code  | ALC-ASM-S00-011 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |The shared DOM named "{0}" could not be cloned. |
|  Action  |The shared DOM could not be cloned. A chained exception provides details on the cause. |

|  Code  | ALC-ASM-S00-012 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |An error ocurred while closing the document named "{0}". |
|  Action  |An error occurred while saving the specified document. Corrective action depends on the provided cause. The most common causes are a corrupt document, a security error, or an I/O error. Processing continues, but an exception resulting in excess memory consumption or excess file handle consumption. |

|  Code  | ALC-ASM-S00-013 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |The system context could not be obtained from UserManager. |
|  Action  |The system context from UserManager was missing or unavailable. The causing exception is provided indicating an installation problem. |

|  Code  | ALC-ASM-S00-014 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |The DDX does not reference the PDF source as 'inDoc' or the PDF source is missing. |
|  Action  |An error occurred executing AssemblerServiceClient.invokeOneDocument(). The given DDX does not reference the PDF source as "inDoc" or the PDF source is missing. |

|  Code  | ALC-ASM_S00_015 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |The operation was successful, but generated too many documents to return. Use the invokeDDX() method. |
|  Action  |An error occurred executing AssemblerServiceClient.invokeOneDocument(). The given DDX resulted in more than one result Document. |

|  Code  | ALC-ASM-S01-004 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to convert content for {0}. |
|  Action  |An error occurred while trying to convert a document for transfer into or out of this service. The cause is provided. This error occurs during low disk space or low memory conditions or by corrupted document content. |

|  Code  | ALC-ASM-W00-001 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |Invalid log level {0} specified. Using {1} instead. |
|  Action  |An invalid or unknown log level was specified. A default was used instead. |

|  Code  | ALC-ASM-W00-002 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |Log messages are being logged at the "{0}" level, which will impact performance. This setting is not recommended for production - use INFO or greater. |
|  Action  |The logging subsystem generates low-level debugging messages for this job, affecting performance. |

|  Code  | ALC-ASM-W00-003 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |Obsolete. |
|  Action  |Message W00-003 is available for reassignment. |

|  Code  | ALC-ASM-W00-004 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |Obsolete. |
|  Action  |Message W00-004 is available for reassignment. |

|  Code  | ALC-ASM-W00-005 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |The xpath expression {0} could not be evaluated. This entry will not be included in the input map. |
|  Action  |The indicated XPath expression was not found or evaluated within the process context. The corresponding entry is not included in the input map. This failure results in a fatal error if the input was required for DDX execution. If the omission was intentional, ignore this warning. |

|  Code  | ALC-ASM-W00-006 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |The input map key {0} of type {1} is an unknown type and could not be converted to a document. This entry will not be included in the input map. |
|  Action  |The indicated input map object was an unknown class and could not be converted to a com.adobe.idp.Document object. The object is not included in the input map during processing. Verify that the contents of the input map conform to the required inputs. |

|  Code  | ALC-ASM-W00-007 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |Document {0} failed to close. Cause provided. |
|  Action  |The specified document failed to close properly. A cause is provided, investigate and correct. Processing continues but future attempts to use the same document may fail. |

|  Code  | ALC-ASM_W00_008 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |Multiple XPaths : the XPath used is "{0}" from the Process URI "{1}" |
|  Action  |More than one XPath was provided (either to data or as a function). The first function XPath provided in the Query component of the Process URI takes precedence over a data XPath in the Path component. scheme:[//Authority][Path][?Query][#Fragment] process:[//[host:port][/lc-xpath-data] [?lc-xpath-function;prop=val;...][#name] Note: there are no properties identified for Process URIs at this time. |

|  Code  | ALC-ASM_W00_009 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |Invalid URL: {0} |
|  Action  |The URL syntax was invalid and could not be evaluated. The object is not included for processing resulting in a fatal error if the content referenced by the URL is required. Fix the syntax of the URL. |

|  Code  | ALC-ASM_W00_010 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |Server Signature compatibility could not be determined. Default will be used. |
|  Action  |The server signature compatibility could not be determined. The default is used. |

|  Code  | ALC-ASM-S01-001 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |The {0} service failed during the {1} operation. |
|  Action  |// ASM_A01_### DocBuilder An error occurred while calling the indicated external service. A causing exception is provided. Corrective action depends on the chained exception. |

|  Code  | ALC-ASM-S01-002 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |{0} service status: {1} |
|  Action  |An error occurred while calling the indicated external service. A causing exception is provided. Corrective action depends on the chained exception. |

|  Code  | ALC-ASM-S01-003 (Assembler) |
|---|---|
|  Type  |Error |
|  Cause  |The {0} service is not installed. |
|  Action  |An error occurred while calling the indicated external service because it does not appear to be installed. Try installing (or reinstalling) the service, and then retry the job. |

|  Code  | ALC-ASM-W01-001 (Assembler) |
|---|---|
|  Type  |Warning |
|  Cause  |The signature service failed to verify the signature named {0} in document {1}. |
|  Action  |An error occurred while calling the signature service to verify a signature. Check to see if the field was signed using a custom signature handler. |

## Barcoded Forms Error Codes {#barcoded-forms-error-codes}

|  Code  | ALC-BCF-002-001 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |No image iterator for the input document. The input image format is not supported for decoding. |
|  Action  |Provide a TIFF format. |

|  Code  | ALC-BCF-002-003 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |IOException: Unable to read the input document to be decoded. |
|  Action  |Verify that the input is a valid document. |

|  Code  | ALC-BCF-002-004 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |PDFException: The barcode images could not be extracted from the input PDF. |
|  Action  |Verify that the input document is not a dynamic PDF. |

|  Code  | ALC-BCF-002-006 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Exception in conversion to serializable DOM. |
|  Action  |Contact Adobe Technical Support. |

|  Code  | ALC-BCF-005-006 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Error in tokenizer. There is a problem in the data decoded from the barcode. |
|  Action  |Verify that the value encoded in the barcode is properly delimited using different field and line delimiters. Ensure that field value does not contain the delimiters. |

|  Code  | ALC-BCF-010-001 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |There is a problem in the data decoded from the barcode. The data does not contain a tokenizable pair for given delimiters. |
|  Action  |Verify that the value encoded in the barcode is properly delimited using different field and line delimiters. |

|  Code  | ALC-BCF-003-004 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to decompress the data from barcode due to a flate decompressor error. |
|  Action  |Ensure that the data is compressed using flat compression. |

|  Code  | ALC-BCF-001-001 (Barcoded Forms) |
|---|---|
|  Type  |Warning |
|  Cause  |Warning logged whenever there is an unexpected behaviour in Barcoded Forms Service |
|  Action  |Contact the System administrator |

|  Code  | ALC-BCF-003-001 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Exception thrown when unable to decrypt the barcode data |
|  Action  |Verify the input files sent for barcode scanning and decoding to the Barcoded Forms Service |

|  Code  | ALC-BCF-003-002 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Exception thrown when unable to decrypt the barcode data |
|  Action  |Verify the barcodes present in the input files |

|  Code  | ALC-BCF-003-003 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to decrypt the data present in the barcode |
|  Action  |Verify the barcodes present in the input files |

|  Code  | ALC-BCF-003-005 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot load keystore file while decrypting data in a barcode |
|  Action  |Contact the System administrator |

|  Code  | ALC-BCF-004-001 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |The barcode coordinates are out of bound. Must be a decimal between 0.0 and 1.0. |
|  Action  |Contact the System administrator |

|  Code  | ALC-BCF-006-001 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |The Crypto-J JCE Provider is disabled. Unable to decrypt the encrypted barcode data. |
|  Action  |Contact the System administrator. |

|  Code  | ALC-BCF-006-003 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |RC4 decryption failed. Unable to decrypt the encrypted barcode data. |
|  Action  |Contact the System administrator. |

|  Code  | ALC-BCF-006-006 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |RSA decryption failed. Unable to decrypt the encrypted barcode data. |
|  Action  |Contact the System administrator. |

|  Code  | ALC-BCF-007-002 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot find the SHA-1 algorithm. Used for internal processing. |
|  Action  |Contact the System administrator. |

|  Code  | ALC-BCF-009-001 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Problem while xml processing. Application encounters this error when it expects to get XML at some place during processing but gets non-xml content. |
|  Action  |Contact the System administrator |

|  Code  | ALC-BCF-009-002 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to create an xml parser. |
|  Action  |Contact the System administrator |

|  Code  | ALC-BCF-009-003 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |XML parser failed, IO error. Problem in xml processing in the application |
|  Action  |Contact the System administrator |

|  Code  | ALC-BCF-009-004 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |XML parser failed, parser error. |
|  Action  |Check the inputs sent |

|  Code  | ALC-BCF-012-001 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Unsupported character encoding. Exception encountered during some internal processing |
|  Action  |Contact the System administrator |

|  Code  | ALC-BCF-012-002 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Data tokenizer error.Exception encountered during some internal processing |
|  Action  |Contact the System administrator |

|  Code  | ALC-BCF-012-003 (Barcoded Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Dom Parser error.Exception encountered during some internal processing. |
|  Action  |Contact the System administrator |

## Central Migration Bridge service error codes {#central-migration-bridge-service-error-codes}

|  Code  | ALC-CMB-001-001 (Central Migration Bridge service) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Adobe Central Output Server installation directory is not valid or the LiveCycle user do not have appropiate permissions. |
|  Action  |Specify correct Adobe Central Output Server installation directory; where Central executables are present; in the Service Configuration. If Central executables are there at the specified location make sure that user has appropriate rights on the folders in directory path. See server logs and documentation for more details. |

|  Code  | ALC-CMB-001-002 (Central Migration Bridge service) |
|---|---|
|  Type  |Error |
|  Cause  |Central Executable returned with some error code. |
|  Action  |Check that correct input parameters were supplied to the service. See server logs for more details. |

|  Code  | ALC-CMB-001-003 (Central Migration Bridge service) |
|---|---|
|  Type  |Warning |
|  Cause  |Dump of command line parameters used to invoke the central executable. |
|  Action  |Information only; no action required. |

|  Code  | ALC-CMB-001-005 (Central Migration Bridge service) |
|---|---|
|  Type  |Error |
|  Cause  |Service could not find configuration file (.ini or .xci file) at the location specified. |
|  Action  |Check that the configuration files for the central executable are present in the location specified. See server logs for more details. |

|  Code  | ALC-CMB-001-006 (Central Migration Bridge service) |
|---|---|
|  Type  |Warning |
|  Cause  |Information on where the service is looking for the configuration files. |
|  Action  |Information only; no action required. |

|  Code  | ALC-CMB-001-007 (Central Migration Bridge service) |
|---|---|
|  Type  |Error |
|  Cause  |Service could not find configuration file (.ini/.xci) in the default location. |
|  Action  |Check that the configuration file exists at the default location. |

|  Code  | ALC-CMB-001-008 (Central Migration Bridge service) |
|---|---|
|  Type  |Error |
|  Cause  |Exception encountered in invoking central executable. |
|  Action  |Check that the Adobe Central Output Server executables are present in its Installation Directory and the installation is not corrupt. |

|  Code  | ALC-CMB-001-009 (Central Migration Bridge service) |
|---|---|
|  Type  |Error |
|  Cause  |Service encountered exception in running central executable. |
|  Action  |Check that correct input parameters were supplied to the service. See server log for more details. |

|  Code  | ALC-CMB-001-010 (Central Migration Bridge service) |
|---|---|
|  Type  |Error |
|  Cause  |Service execution was interrupted in between. |
|  Action  |See server logs for more details. |

|  Code  | ALC-CMB-001-011 (Central Migration Bridge service) |
|---|---|
|  Type  |Error |
|  Cause  |Service encountered error while logging Adobe Central Output Server logging information |
|  Action  |See server logs for more details. |

|  Code  | ALC-CMB-001-004 (Central Migration Bridge service) |
|---|---|
|  Type  |Info |
|  Cause  |Working directory location |
|  Action  |No action needed |

## Configuration Manager error codes {#configuration-manager-error-codes}

|  Code  | ALC-LCM-000-001 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |JDK version {0} does not meet minimum supported version {1}. \nConfiguration Manager cannot be launched until JDK version requirement is satisfied. |
|  Action  |Set JAVA_HOME to the supported JDK version that is listed in Preparing to Install LiveCycle ES Single Node or Preparing to Install LiveCycle ES Clustering. |

|  Code  | ALC-LCM-000-002 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |JDK version {0} exceeds the maximum supported version {1}. \nConfiguration Manager cannot be launched until JDK version requirement is satisfied. |
|  Action  |Set JAVA_HOME to the supported JDK version that is listed in Preparing to Install LiveCycle Single Node or Preparing to Install LiveCycle Clustering. |

|  Code  | ALC-LCM-000-003 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |JDK version {0} does not meet the supported version {1}. \nConfiguration Manager cannot be launched until JDK version requirement is satisfied. |
|  Action  |Set JAVA_HOME to the supported JDK version that is listed in Preparing to Install LiveCycle Single Node or Preparing to Install LiveCycle Clustering guide. |

|  Code  | ALC-LCM-000-010 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Installation context undeterminable. Installation may be invalid. |
|  Action  |Reinstall the Configuration Manager. |

|  Code  | ALC-LCM-000-011 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Target application server undeterminable or invalid. Installation may be invalid. |
|  Action  |Reinstall LiveCycle. |

|  Code  | ALC-LCM-000-012 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Target operating system undeterminable or invalid. Installation may be invalid. |
|  Action  |Configuration Manager determines the target application server from the OSFileSetIntendedFor property as set in the {INSTALL_ROOT}\licenses\LFS_Foundation.properties. If this value is missing or does not match a supported value, an error occurs. This error does not display in production. Action is to reinstall. |

|  Code  | ALC-LCM-000-013 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Installation context undeterminable. LCM root directory, {0}, does not exist. |
|  Action  |Happens if this directory does not exist. Will not happen in production. |

|  Code  | ALC-LCM-000-020 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to launch Configuration Manager. |
|  Action  |Uninstall and reinstall LiveCycle. |

|  Code  | ALC-LCM-000-030 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load jar into classpath. Jar file {0} does not exist. |
|  Action  |Uninstall and reinstall LiveCycle. |

|  Code  | ALC-LCM-000-100 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load plugin {0}. |
|  Action  |Review the logs for more information. Uninstall and reinstall LiveCycle. |

|  Code  | ALC-LCM-010-100 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to configure core. |
|  Action  |Review the logs for more information. |

|  Code  | ALC-LCM-010-110 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to find credential with alias {0} |
|  Action  |Review the log and application server log for more details. |

|  Code  | ALC-LCM-010-111 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to import credential {0} |
|  Action  |Review the Configuration Manager log and application server log for more details. |

|  Code  | ALC-LCM-010-112 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to import credential {0}. \nInvalid password provided. |
|  Action  |Review the credential password and try retyping the password in Configuration Manager. Review the Configuration Manager log and application server log for more details. |

|  Code  | ALC-LCM-010-120 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to configure. |
|  Action  |Review the Configuration Manager log and application server log for more details. |

|  Code  | ALC-LCM-010-200 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to merge Ears. |
|  Action  |Review the Configuration Manager log files for details. |

|  Code  | ALC-LCM-010-201 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to merge Ears. \nFile does not exist {0}. |
|  Action  |Uninstall and reinstall LiveCycle. |

|  Code  | ALC-LCM-010-300 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to generate license jar. |
|  Action  |Review the Configuration Manager log files for details. |

|  Code  | ALC-LCM-030-101 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy EAR.\nEAR could not be found. LiveCycle must be configured before deployment. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-102 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy EAR.\n{0} does no exist in archive {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-103 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy EAR.\nCould not load application info from EAR: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-110 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy EAR.\nCould not undeploy {0}.\nUndeploy manually using application server administration console then try again. |
|  Action  |Undeploy EAR file manually by using the application server Administration Console and then try again. |

|  Code  | ALC-LCM-030-111 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy EAR.\nCould not stop application {0}.\nUndeploy manually using application server administration console then try again. |
|  Action  |Undeploy EAR file manually by using application server Administration Console and then try again. |

|  Code  | ALC-LCM-030-112 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy EAR.\nCould not deploy {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-113 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy EAR.\nCould not start application {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-200 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy component {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-201 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy component.\nCannot connect to service container. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-202 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy component {0}.\nComponent archive not found on disk. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-203 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy component {0}.\nComponent not found on server. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-204 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy component.\nComponent archives could not be copied to working directory. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-205 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy component.\n{0} does no exist in archive {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-206 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy component.\nCould not load component info from Component: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-207 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy component {0}.\nCluster member clock times may not be synchronized. Check logs and cluster configuration. |
|  Action  |Cluster member clock times not be synchronized. Review the logs and cluster configuration. |

|  Code  | ALC-LCM-030-300 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy LCA {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-301 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy LCA.\nLCA archive {0} not found on disk. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-302 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy LCA.\n{0} does not exist in archive {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-030-303 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to deploy LCA.\nCould not load archive info from EAR: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-035-200 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Component deployment failed validation for {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-035-201 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Component deployment failed validation for {0}.\nComponent archive not found on disk. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-035-202 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Component deployment failed validation for {0}.\nComponent component not found on server. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-035-203 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Component deployment failed validation.\nCannot connect to service container. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-035-300 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |LCA deployment failed validation. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-035-301 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |LCA deployment failed validation.\nLCA {0} is not deployed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-080-100 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to generate version report. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-000 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to perform application server operation. {0} |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-010 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot connect to application server.\nApplication server information, login information may be invalid or the server is not running or accessible. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-011 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot connect to application server.\nApplication server host or port may be invalid. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-012 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot connect to application server.\nAdministrator id or password may be invalid. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-013 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot connect to application server.\nTarget server instance {0} does not exist. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-014 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot connect to application server.\nTarget cluster instance {0} does not exist. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-020 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Operation timed out.\nSoap request timeout may not be configured appropriately. Refer to the WebSphere configuration documentation. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-030 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |SSL not configured properly.\nEnsure that the certificate is accepted by the host computer.\nThis can be fixed using retrieveSigners.sh/bat. |
|  Action  |Ensure the acceptance of the certificate by the host computer. |

|  Code  | ALC-LCM-100-040 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Supported version validation failure. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-041 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Supported version validation failure. \nThe detected version of the target application server is {0} which does not meet the minimum supported version {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-042 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Supported version validation warning. \nThe detected version of the target application server is {0} which exceeds the supported version {1}, as known at the time of release. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-050 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot locate server ports for WC_defaulthost or WC_defaulthost_secure in the available virtual hosts\nfor: {0}\nThis may prevent access to the server. \nRefer to the WebSphere configuration documentation. |
|  Action  |See the WebSphere Application Server configuration documentation. |

|  Code  | ALC-LCM-100-060 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server {0} is an administration server.\nOnly managed servers should be used as LiveCycle servers. |
|  Action  |Only use managed servers as LiveCycle servers. |

|  Code  | ALC-LCM-100-070 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server has pending changes that require a restart. Restart the server and re-run configuration. |
|  Action  |Restart the server and rerun configuration. |

|  Code  | ALC-LCM-101-013 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot connect to application server.\nTarget server instance {0} does not exist. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-101-014 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot connect to application server.\nTarget cluster instance {0} does not exist. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-101-020 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to run JACL scripts.\nCheck logs for further details. |
|  Action  |Review the logs for further details. |

|  Code  | ALC-LCM-101-030 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to parse JACL {0} stream ''{1}'' |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-000 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to configure application server. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-010 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to configure server settings. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-030 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to configure datasource. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-040 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to get server info. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-041 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to get Edit Lock. Check that no edits are occurring through admin console. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-042 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server has Unactivated Changes. Check that no edits are pending through admin console. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-050 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to get version info from application server. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-110 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to de-configure datasource. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-110-150 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to de-configure server settings. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-000 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-001 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nWrong No. of Web Servers {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-002 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nError sending validation request. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-003 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nHost path invalid {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-100 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nJVM settings failed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-101 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nUnexpected Thread Count {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-102 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nUnexpected Socket Reader {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-103 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nUnexpected Thread Max Time {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-104 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nExpected JVM arguments not found. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-105 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nExpected Xmx setting not found. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-106 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nExpected Xms setting not found. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-107 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server configuration failed validation.\nUnexpected JTA timeout {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-300 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Data source settings failed validation. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-301 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Data source settings failed validation.\nFailed to find/lookup datasource {0}. The datasource may not be configured or may have failed to come online. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-302 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Data source settings failed validation.\nFailed to determine database type for datasource {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-303 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Data source settings failed validation.\nFailed to connect to database for datasource {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-304 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Data source settings failed validation.\nFailed to validate datasource {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-120-305 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Data source settings failed validation.\nCould not execute query: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-130-100 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Database settings failed validation. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-130-101 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Database settings failed validation. \nUnsupported database type {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-130-102 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Database settings failed validation. \nDriver class {0} cannot be loaded. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-130-103 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Database settings failed validation. \nSQL error code |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-130-104 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Database settings failed validation. \nCould not execute query: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-130-105 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Database settings failed validation. \nCould not find driver {0} in archive: {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-130-106 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Database settings failed validation. \nCannot locate Schema {0} in database {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-140-100 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to control server. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-140-102 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to start server {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-140-104 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to stop server {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-140-106 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to determine server type. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-200-001 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to connect to LiveCycle service container. \nLiveCycle service container information or login information may be invalid or the server is not running or accessible. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-800-001 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Property file {0} does not exist |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-800-002 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Missing required property {0} for cluster topology |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-800-003 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Property {0} from property file {1} can not be empty |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-800-004 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Missing required property {0} from property file {1} |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-800-010 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Could not retrieve password for property {0} |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-000 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to turnkey deploy. |
|  Action  |Deploy EAR files manually to JBoss by following instructions in Installing and Deploying LiveCycle for JBoss or Upgrading to LiveCycle ES for JBoss document. |

|  Code  | ALC-LCM-999-010 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |The following ports required by {0} are still in use {1}.\nAnother instance may be running or another application may be using some of the required ports. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-020 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Windows turnkey service {0} does not exist. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-021 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Service shutdown failed for: {0}. \nUnexpected service state: {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-022 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Service shutdown failed for: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-031 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Service startup failed for: {0}. \nUnexpected service state: {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-032 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Service startup failed for: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-040 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |JBoss did not come online. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-051 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Soap port missing from properties. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-052 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Server port missing from properties. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-053 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot resolve pop3 path for: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-054 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Cannot resolve driver path for: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-055 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Weblogic domain could not be created for: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-056 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Windows service could not be created for: {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-101 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to create keystore. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-102 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to install keystore to JBoss server {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-999-103 (Configuration Manager) |
|---|---|
|  Type  |  |
|  Cause  |Failed to update server.xml for JBoss server {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-LCM-100-080 (Configuration Manager) |
|---|---|
|  Type  |Error |
|  Cause  |ListenAddress has not been set for server(s): {0} |
|  Action  |To avoid server startup issues, set the ListenAddress and restart the server(s). Refer to the documentation for additional information. |

## Connector for ECM error codes {#connector-for-ecm-error-codes}

|  Code  | ALC-REP-500-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Invalid Uri. The Uri [{0}] should contain a valid Repository name |
|  Action  |Ensure the URI [{0}] contains a valid Repository name. |

|  Code  | ALC-REP-501-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Operation not supported. The Operation [{0}] is not supported by [{1}] Provider. |
|  Action  |Ensure that the operation tried is supported by the respective provider. |

|  Code  | ALC-REP-502-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Operation not supported on Root. The Operation [{0}] is not supported for Root object. |
|  Action  |Select a parent folder and again try the operation. |

|  Code  | ALC-REP-503-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Operation not supported on Repository. The Operation [{0}] is not supported on Repository level objects. |
|  Action  |Ensure that operation is valid for Repository level objects. |

|  Code  | ALC-REP-504-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Operation not supported on Cabinets. The Operation [{0}] is not supported on Cabinet level objects. |
|  Action  |Ensure that operation is supported on Cabinet level objects. |

|  Code  | ALC-REP-505-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value for attribute. The value [{0}] is invalid for attribute [{1}] in Operation [{2}] |
|  Action  |Provide a valid value to the respective attribute and retry the operation. |

|  Code  | ALC-REP-506-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Invalid resource Uris. The repository names should be same in [{0}] and [{1}] for [{2}] operation. |
|  Action  |Select valid resource URIs and retry the operation. |

|  Code  | ALC-REP-507-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Invalid Credentials. Authentication failed for User [{0}]. Verify Username / Password. |
|  Action  |Ensure that credentials provided are valid and retry the operation. |

|  Code  | ALC-REP-508-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Invalid Server Configuration. Access to Documentum connection broker failed with ServerName / IP [{0}] and Port number[{1}] |
|  Action  |Ensure that name of Documentum content server and port number is correct and retry the operation. |

|  Code  | ALC-REP-509-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Repository not available at connection broker. The Documentum connection broker [{0}] could not find a Repository [{1}] |
|  Action  |Ensure that provided repository exists on Documentum content server and retry the operation. |

|  Code  | ALC-REP-510-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Unknown failure has occured while authenticating connection on Username [{0}] / Repository [{1}] |
|  Action  |Ensure that the credentials provided for establishing connection to repository are correct and retry the operation. |

|  Code  | ALC-REP-600-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Invalid resource URI. The supplied value [{0}] is invalid. |
|  Action  |Ensure that provided resource URI is valid and retry the operation. |

|  Code  | ALC-REP-601-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Operation not supported. The Operation [{0}] is not supported by [{1}] Provider. |
|  Action  |Ensure that operation tried is supported by the provider. |

|  Code  | ALC-REP-602-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Filenet Property [{0}] not found on URI [{1}] |
|  Action  |Ensure that FileNet property provided is correct. |

|  Code  | ALC-REP-603-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Not a Current Version. The URI [{0}] doesn't point to current version. |
|  Action  |Ensure that settings are pointing to correct version of FileNet. |

|  Code  | ALC-REP-604-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Operation [{0}] only supported on Current version. The URI [{1}] doesn't point to current version. |
|  Action  |Correct the URI according to current version. |

|  Code  | ALC-REP-605-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Unqualified URI. The URI [{0}] should include a Object store name. |
|  Action  |Include object store in URI. |

|  Code  | ALC-REP-606-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Authentication failure. Username [{0}] or Password [{1}] may be invalid. |
|  Action  |Ensure that Username and Password are correct. |

|  Code  | ALC-REP-607-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Content Engine Configuration invalid. Connect Engine [{0}] or Port [{1}] is wrong. Check the network connectivity to Content Engine. |
|  Action  |Ensure that all content engine settings are correct. |

|  Code  | ALC-REP-608-000 (Connector for ECM) |
|---|---|
|  Type  |  |
|  Cause  |Operation not supported. The operation [{0}] is not supported on object store. |
|  Action  |Ensure that operation tried is supported on object store. |

|  Code  | ALC-REP-650-000 (Connector for ECM) |
|---|---|
|  Type  |Info |
|  Cause  |Work object [{0}] is locked by some other user. |
|  Action  |Information only. No action required. |

## Connector for Microsoft SharePoint error codes {#connector-for-microsoft-sharepoint-error-codes}

|  Code  | ALC-SPC-001-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Parameter [{0}] cannot be null. |
|  Action  |The parameter mentioned in the error-code is a mandatory parameter.It should be removed. |

|  Code  | ALC-SPC-103-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Caught Exception: {0} |
|  Action  |The Action required will depend upon the nature of nested exception mentioned in the cause. |

|  Code  | ALC-SPC-700-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Authentication failed for [{0}] |
|  Action  |Credentials should be verified for the user. |

|  Code  | ALC-SPC-701-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Resource does not exists at the [{0}] location. |
|  Action  |Provide the correct location for the resource/Resource might have been deleted. |

|  Code  | ALC-SPC-702-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |siteUrl [{0}] refers to a non existing host machine. |
|  Action  |Provide the correct URL for share-point server |

|  Code  | ALC-SPC-703-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot connect to [{0}]. Ensure the siteUrl specified is valid and accessible. |
|  Action  |Make sure that sharepoint server and port value is correct. Also make sure that site url is valid. |

|  Code  | ALC-SPC-704-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Either Folder [{0}] does not exists or you have specified an invalid name for child folder [{1}]. |
|  Action  |The parent/child folder names should be verified. |

|  Code  | ALC-SPC-705-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |File [{0}] is currently not checked out. Check out the file and then perform this operation |
|  Action  |Need to check out file before performing this operation. |

|  Code  | ALC-SPC-706-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |File [{0}] is already checked out. |
|  Action  |Action is not permitted when the file is already checked out. |

|  Code  | ALC-SPC-707-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Property update for the following file [{0}] failed. Verify the property names you specified in the Map. Sharepoint Response:- [{1}] |
|  Action  |Property name specified for the file is not a valid. Provide correct property name. |

|  Code  | ALC-SPC-708-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Document Library is required field, if Folder [{0}] is selected. |
|  Action  |The document library for the folder should also be specified. |

|  Code  | ALC-SPC-721-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Site [{0}] does not exist or is not accessible. |
|  Action  |Verify site URL. |

|  Code  | ALC-SPC-722-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Document Library [{0}] does not exist or is not accessible at the following site location [{1}]. |
|  Action  |  |

|  Code  | ALC-SPC-723-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |File [{0}] does not exist or is not accessible at the following Document Library [{1}]. |
|  Action  |  |

|  Code  | ALC-SPC-724-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Folder [{0}] does not exist or is not accessible at the following Document Library [{1}]. |
|  Action  |  |

|  Code  | ALC-SPC-725-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |User [{0}] does not exist for the site [{1}]. Ensure the user is a valid user and is accessible by the site. |
|  Action  |  |

|  Code  | ALC-SPC-726-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Group [{0}] does not exist for the site [{1}]. Ensure the group is a valid user and is accessible by the site. |
|  Action  |  |

|  Code  | ALC-SPC-727-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Role [{0}] does not exist for the site [{1}]. Ensure the user is a valid user and is accessible by the site. |
|  Action  |  |

|  Code  | ALC-SPC-728-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |No permissions exist for the user [{0}] at site [{1}]. Ensure the user is a valid user and has permission on the site. |
|  Action  |  |

|  Code  | ALC-SPC-729-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |No permissions exist for the user [{0}] at document library [{1}]. Ensure the user is a valid user and has permission on the Document library. |
|  Action  |  |

|  Code  | ALC-SPC-730-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |No permissions exist for the group [{0}] at site [{1}]. Ensure the group is a valid group and has permission on the site. |
|  Action  |  |

|  Code  | ALC-SPC-731-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |No permissions exist for the group [{0}] at document library [{1}]. Ensure the group is a valid group and has permission on the Document library. |
|  Action  |  |

|  Code  | ALC-SPC-732-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |No permissions exist for the role [{0}] at site [{1}]. Ensure the role is a valid role and has permission on the site. |
|  Action  |  |

|  Code  | ALC-SPC-733-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |No permissions exist for the role [{0}] at document library [{1}]. Ensure the role is a valid role and has permission on the document library. |
|  Action  |  |

|  Code  | ALC-SPC-734-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |File/Folder with given name [{0}] does not exist in Document Library [{1}] |
|  Action  |  |

|  Code  | ALC-SPC-741-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Operation failed. |
|  Action  |  |

|  Code  | ALC-SPC-742-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Operation failed with the following error code [{0}] and error message [{1}]. Verify there doesn't exist any extra "/" in the url displayed in error message field. |
|  Action  |  |

|  Code  | ALC-SPC-743-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Operation failed with the following error code [{0}] and error message [{1}]. Verify the values of following [{2}:{3}] |
|  Action  |Verify the values of parameters mentioned in the error message |

|  Code  | ALC-SPC-744-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Operation failed with the following error code [{0}] and error message [{1}]. Verify the values of following [{2}:{3}], [{4}:{5}], [{6}:{7}] |
|  Action  |Verify document library URL,document folder URL, and fileName URL |

|  Code  | ALC-SPC-745-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Operation failed with the following error code [{0}] and error message [{1}]. Verify for any faulty input parameters. |
|  Action  |  |

|  Code  | ALC-SPC-751-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |A soap fault exception has occured. Either of input parameters specified are bad. |
|  Action  |  |

|  Code  | ALC-SPC-752-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |A soap fault exception has occured. Verify the values of following [{0}:{1}] . |
|  Action  |Verify the site URL |

|  Code  | ALC-SPC-753-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Reserved error code. |
|  Action  |Reserved error code. |

|  Code  | ALC-SPC-754-000 (Connector for Microsoft SharePoint) |
|---|---|
|  Type  |Error |
|  Cause  |Reserved Error code. |
|  Action  |Reserved error code. |

## Content Services error codes {#content-services-error-codes}

|  Code  | ALC-CSV-030-000 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |{0} |
|  Action  |A generic Content Services exception. |

|  Code  | ALC-CSV-030-001 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Authentication Failed for User: {0}. |
|  Action  |Verify the user/password combination. |

|  Code  | ALC-CSV-030-002 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to locate: {0} in repository. |
|  Action  |Verify the path/id of the document. |

|  Code  | ALC-CSV-030-003 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Repository Fault. |
|  Action  |There was a problem accessing the repository. Review the logs for associated errors. |

|  Code  | ALC-CSV-030-004 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Update Version Type attribute {0}. |
|  Action  |Check the value of Update Version Type enumeration constant you are using. |

|  Code  | ALC-CSV-030-005 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to retrieve content from {0}. |
|  Action  |There was a problem retrieving the content from the Content Services repository. Review the logs for associated errors. |

|  Code  | ALC-CSV-030-006 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid MIME type {0}. |
|  Action  |Verify that the MIME type you are using. |

|  Code  | ALC-CSV-030-007 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke webscript URL {0}. |
|  Action  |The web script URL is invalid. Verify your system configuration. |

|  Code  | ALC-CSV-030-008 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Not a folder: {0}. |
|  Action  |Verify the given path/id. |

|  Code  | ALC-CSV-030-009 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Node: {0} already exists in repository. |
|  Action  |Verify that the path/id exists. |

|  Code  | ALC-CSV-030-010 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Access denied for User: {0}. |
|  Action  |User does not have permissions to perform this operation. Switch to a different user, or change the permissions for the specified user. |

|  Code  | ALC-CSV-030-100 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Space specified while invoking {0}. |
|  Action  |You have not specified a space while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-101 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Store specified while invoking {0}. |
|  Action  |You have not specified a store while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-102 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Node name specified while invoking {0}. |
|  Action  |You have not specified a node name while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-103 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Node type specified while invoking {0}. |
|  Action  |You have not specified a node type while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-104 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Node encoding specified while invoking {0}. |
|  Action  |You have not specified a node encoding while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-105 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Content(InputStream) present while invoking {0}. |
|  Action  |You have not passed the content stream while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-106 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Content type specified while invoking {0}. |
|  Action  |You have not specified a content type while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-107 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Node ID or Path specified while invoking {0}. |
|  Action  |You have not specified a node path/id while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-108 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Relationship type specified while invoking {0}. |
|  Action  |You have not specified a relation type while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-109 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Child Node ID or Path specified while invoking {0}. |
|  Action  |You have not specified a child node id/path while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-110 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Parent Node ID or Path specified while invoking {0}. |
|  Action  |You have not specified a parent node id/path while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-111 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Source Node ID or Path specified while invoking {0}. |
|  Action  |You have not specified a source node id/path while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-112 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Target Node ID or Path specified while invoking {0}. |
|  Action  |You have not specified a target node id/path while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-113 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Template/Source Folder specified. |
|  Action  |You have not specified a Template/Source folder while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-030-211 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |There is no LiveCycle service available for the conversion of {0}. |
|  Action  |The LiveCycle server required to perform the conversion is not available. Verify that the service is active and has been deployed on the server. If the problem persists, contact your system administrator. |

|  Code  | ALC-CSV-030-212 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No data could be retrieved from the provided XML files. |
|  Action  |The LiveCycle transformation module is corrupted. Ensure that Content Services is deployed properly. |

|  Code  | ALC-CSV-030-213 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Received no response from LiveCycle while invoking {0}. |
|  Action  |There was problem invoking the given LiveCycle service component. Ensure that the component service is deployed and active. |

|  Code  | ALC-CSV-030-214 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Map does not contain any XML data. |
|  Action  |The LiveCycle transformation mapping XML is empty. Verify that Content Services is deployed properly. |

|  Code  | ALC-CSV-030-215 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Desired conversion could not be performed. |
|  Action  |There was problem while doing the conversion. Review the logs for more information. |

|  Code  | ALC-CSV-030-216 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Transformation to {0} is not supported. |
|  Action  |The transformation to given target format is not supported by Content Services. |

|  Code  | ALC-CSV-030-217 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |List of input streams received after conversion is empty. It is likely that there was a problem retrieving the result of the transformation. |
|  Action  |Review the logs for any associated errors. |

|  Code  | ALC-CSV-030-011 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to issue a request to Content Services ES. |
|  Action  |Verify that the Content Services webscripts are configured for the correct port. Update the Contents Services HttpPort property using Administration Console. |

|  Code  | ALC-CSV-030-012 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |The value for QName cannot be null or empty. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-CSV-030-013 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |The format of date string:{0} is incorrect. |
|  Action  |Ensure that the date string conforms to the ISO 8601 standard "yyyy-MM-dd'T'HH:mm:ss'Z'". |

|  Code  | ALC-CSV-030-014 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |The version label {0} is invalid for node. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-CSV-030-015 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |The node {0} is not versioned. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-CSV-030-016 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |The permission [{0}] is invalid for node. |
|  Action  |User does not have rights to update permissions on the node. |

|  Code  | ALC-CSV-030-017 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Null Content Access Permission passed to the access permissions list. |
|  Action  |Pass a valid (non-blank) Content Access Permission to the access permission list. |

|  Code  | ALC-CSV-030-018 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |The authority [{0}] does not exist. |
|  Action  |Pass a valid authority in the operation. |

|  Code  | ALC-CSV-030-019 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |CIFS not enabled for this LC instance. Provide '-Dcifs.enabled=true' as JVM argument in App-server startup script/service params. |
|  Action  |Address the issue identified in the Cause section of the log message |

|  Code  | ALC-CSV-030-020 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |CIFS Root name for 'Company Home' is not configured. Provide a valid folder name for '-Dfilesystem.name=<>' JVM argument in App-server startup. Also ensure that filesystem rootPath is configured as /app:company_home in file-servers.xml file. |
|  Action  |Address the issue identified in the Cause section of the log message |

|  Code  | ALC-CSV-030-021 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Aspect [{0}] |
|  Action  |Provide a valid aspect name. |

|  Code  | ALC-CSV-030-022 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Aspect List cannot be empty |
|  Action  |Provide a non-Empty aspect list. |

|  Code  | ALC-CSV-030-023 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Integrity Error. [{0}] |
|  Action  |Address the issue identified in the Cause section of the log message |

|  Code  | ALC-CSV-030-024 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |The node is locked. [{0}] |
|  Action  |Address the issue identified in the Cause section of the log message |

|  Code  | ALC-CSV-030-114 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No permission specified while invoking [{0}]. |
|  Action  |Provide valid permission. |

|  Code  | ALC-CSV-030-115 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Query object passed. |
|  Action  |Pass a query object in the search operation. |

|  Code  | ALC-CSV-030-116 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid value passed for maxSize. |
|  Action  |Pass a valid integer value for maximum number of records to return in search operation. |

|  Code  | ALC-CSV-030-117 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error creating query, operation [{0}] not allowed for type [{1}]. |
|  Action  |Create a valid query statement, operator is not allowed for the attribute. |

|  Code  | ALC-CSV-030-118 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error parsing the query. |
|  Action  |Specify a valid query statement in the search operation. |

|  Code  | ALC-CSV-030-119 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid value specified for property [{0}]. |
|  Action  |Pass a valid value for the property. |

|  Code  | ALC-CSV-040-100 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Document content specified while invoking [{0}]. |
|  Action  |You have not specified a content type while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-040-101 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Review Server path not specified while invoking [{0}]. |
|  Action  |You have not specified Review Server path while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-040-102 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Review initiator not specified while invoking [{0}]. |
|  Action  |You have not specified Review initiator while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-040-103 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Mandatory reviewers not specified while invoking [{0}]. |
|  Action  |You have not specified Mandatory reviewers while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-040-104 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Reviewer email ID not specified while invoking [{0}]. |
|  Action  |You have not specified Reviewer email ID while performing the given operation. Verify the parameters. |

|  Code  | ALC-CSV-040-105 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot start review on [{0}]. The document is Reader Extended. |
|  Action  |Either pass a non-RE document or pass raiseExcpOnREPDF argument=false in the operation. |

|  Code  | ALC-CSV-040-200 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot authenticate against Review Server. Exception : [{0}]. |
|  Action  |Verify the user credentials for accessing review server. |

|  Code  | ALC-CSV-040-201 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot access location on Review Server. Exception : [{0}]. |
|  Action  |Verify the path/id of the document/Space on review server. |

|  Code  | ALC-CSV-040-202 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Content Services Review Server exception : [{0}]. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-CSV-040-203 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |File System Review Server exception : [{0}] |
|  Action  |Address the issue identified in the Cause section of the log message |

|  Code  | ALC-CSV-040-204 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Review Server path in Content Services : [{0}]. Must be inside '/Company Home'. |
|  Action  |Provide the valid path inside /Company Home. |

|  Code  | ALC-CSV-040-205 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |IO exception encountered : [{0}]. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-CSV-040-300 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |XML Exception encountered : [{0}]. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-CSV-040-301 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |PDF Exception encountered : [{0}]. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-CSV-040-302 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Review deadline not specified in document : [{0}]. Cannot terminate review. |
|  Action  |Correct the initiator annotation XML to have deadline tag. |

|  Code  | ALC-CSV-040-303 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Review ID not specified in document : [{0}]. |
|  Action  |  |

|  Code  | ALC-CSV-001-000 (Content Services) |
|---|---|
|  Type  |Error |
|  Cause  |Just in case we miss on the string in properties file. we log it under ALC-CSV-001-000 |
|  Action  |Appropriate Action would either be available in the error being displayed or in the logs as this is a generic exception which would come up only in case of some unforseable scenario. |

## Convert PDF service error codes {#convert-pdf-service-error-codes}

|  Code  | ALC-CNP-001-002 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid option value. |
|  Action  |Verify option value. |

|  Code  | ALC-CNP-001-104 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Error while loading options. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-CNP-001-201 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Zip document. |
|  Action  |Verify the ZIP format of the document. |

|  Code  | ALC-CNP-001-202 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Error creating directory. |
|  Action  |Verify the ZIP format of the document. |

|  Code  | ALC-CNP-001-305 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Convert PDF does not support PDF Package (Portable Collection). |
|  Action  |Verify that the document is not a PDF Package (Portable Collection). |

|  Code  | ALC-CNP-001-306 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |An IO Exception occurred while obtaining the PDF document. |
|  Action  |Verify that the location of PDF is valid and then retry the operation. If the problem persists, contact the system administrator. |

|  Code  | ALC-CNP-001-308 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Required input parameter missing. |
|  Action  |Enter all the required input parameters. Review the logs for details. |

|  Code  | ALC-CNP-001-401 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot convert PDF file to image. |
|  Action  |Verify the input PDF document format. Review the logs for details. |

|  Code  | ALC-CNP-001-402 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |MultipageTiff,IncludeComments, ImageSizeWidth, ImageSizeHeight, and PageRange options are not functional in the deprecated toImage API, to use these options use toImage2 API. |
|  Action  |Verify that valid options are supplied. Supported image formats are: - JPEG - JPEG2K - PNG - TIFF If you are sending MultipageTiff, IncludeComments, ImageSizeWidth, ImageSizeHeight, and PageRange options, use the "toImage2 API". |

|  Code  | ALC-CNP-001-301 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot convert PDF file to PostScript. |
|  Action  |Verify that the input PDF is valid flat PDF. Verify that the options sent are valid or set the option LegacyToSimplePSFlag in ToPSOptionsSpec to true to convert interactive documents to PostScript. |

|  Code  | ALC-CNP-001-302 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Document is not a valid PDF document. |
|  Action  |Verify that the document is a valid PDF document which could be converted to image/ps. The document must meet the following conditions: - It is not a portable collection (PDF Package) - It is flattened (non-interactive) or set the option LegacyToSimplePSFlag in ToPSOptionsSpec to true to convert interactive documents to PostScript. - It is not encrypted |

|  Code  | ALC-CNP-001-304 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |Input document is not a non-interactive PDF document. |
|  Action  |Verify that the input document is a non-interactive PDF document or set the option LegacyToSimplePSFlag in ToPSOptionsSpec to true to convert interactive documents to PostScript. |

|  Code  | ALC-CNP-001-307 (Convert PDF service) |
|---|---|
|  Type  |Error |
|  Cause  |PDF exception. |
|  Action  |Verify that the document is a valid PDF document which can be converted to image/ps. The document must meet the following conditions: - It is not a portable collection (PDF Package) - It is flattened (non-interactive) - It is not encrypted Or set the optionLegacyToSimplePSFlag in ToPSOptionsSpec to true to convert interactive documents to PostScript. |

## Core error codes {#core-error-codes}

|  Code  | ALC-DSC-504-000 (Core) |
|---|---|
|  Type  |Error |
|  Cause  |Data Type not found |
|  Action  |  |

|  Code  | ALC-DSC-217-00 (Core) |
|---|---|
|  Type  |Error |
|  Cause  |Could not create/start dispatcher class ... |
|  Action  |Usually it's class loading issue since it cannot load the dispatcher class. Make sure packaging is correct, and all required libs are in classpath. Or it could also be endpointURI that causes the failure of dispatcher's constructor. |

## Core - DSC error codes {#core-dsc-error-codes}

|  Code  | com.mysql.jdbc.exceptions.jdbc4.MySQLNonTransientConnectionException: Can't call rollback when autocommit=true (Core - DSC) |
|---|---|
|  Type  |Warning |
|  Cause  |Compatibility issue between JBoss 4.2 and JBoss 5.1. |
|  Action  |Do nothing. Warning is harmless. |

## DB2 error codes {#db-error-codes}

|  Code  | ALC-DSC-000-000 (DB2) |
|---|---|
|  Type  |Error |
|  Cause  |com.ibm.db2.jcc.b.nm: The character "_" following "IC(19,0) NOT NULL ," is not valid.. SQLCODE=-7, SQLSTATE=42601, DRIVER=3.50.152 |
|  Action  |Do not create process variable name start with “_” character when creating long-lived process on DB2 platform. Work around for process generated by archive wizard. If a long-lived process is required then the long-lived process could call a short-lived subprocess. The archive wizard can be used to generate steps on that short-lived process. |

### Data Manager error codes {#data-manager-error-codes}

|  Code  | ALC-DMR-001-001 (Data Manager) |
|---|---|
|  Type  |Error |
|  Cause  |The proposed global document storage directory {0} does not exist or does not contain either a backup nor a restore directory. The {1} file must specify a new location of a previously used Global Document Storage directory. |
|  Action  |  |

|  Code  | ALC-DMR-001-002 (Data Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Deleting Global Document Storage Root Directory redirection file {0} failed. Delete it manually. Otherwise any other method of changing the GDS root directory will fail. |
|  Action  |  |

|  Code  | ALC-DMR-001-003 (Data Manager) |
|---|---|
|  Type  |Error |
|  Cause  |An IOException was encountered while trying to reset the global document storage directory to {0} with redirect file {1}. |
|  Action  |  |

|  Code  | ALC-DMR-001-101" (Data Manager) |
|---|---|
|  Type  |Warning |
|  Cause  |The Global Document Storage Root Directory has been changed to {0}. |
|  Action  |  |

## Data Services error codes {#data-services-error-codes}

|  Code  | 10155 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |No property named property name exists in class Java Class. |
|  Action  |  |

|  Code  | 10156 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A one-to-many or many-to-many relation must reference a java.util.Collection type (error in destination destination name). |
|  Action  |  |

|  Code  | 10150 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to access UserTransaction in DataService. |
|  Action  |  |

|  Code  | 10151 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Association relations must be one-to-many, many-to-many, many-to-one, or one-to-one. |
|  Action  |  |

|  Code  | 10152 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to access identity field field name of an instance, check the identity configuration for destination destination name. |
|  Action  |  |

|  Code  | 10153 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Client sent no sequence id, cannot retrieve page. |
|  Action  |  |

|  Code  | 10154 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Pages for sequence id sequence id have expired in destination destination name. |
|  Action  |  |

|  Code  | 10157 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The destination destination name has no identity property. Data Service destinations must have at least one identity property configured in the metadata section of the destination properties. |
|  Action  |  |

|  Code  | 10158 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred on DataService destination destination name while processing transactional operations: the transaction could not be rolled back or committed. |
|  Action  |  |

|  Code  | 10159 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Identity property names should be individual properties property name. Use more than one identity tag when you want to specify multiple id properties. |
|  Action  |  |

|  Code  | 10160 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Page request made for items in a lazily loaded property failed to retrieve the parent item. Parent destination = destination name, id=property id. |
|  Action  |  |

|  Code  | 10161 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Page request made for item with id = ''{0}''. The item was not in the cache and the adapter''s get method failed to return the item for destination = destination name that is expected to be in the requested page. |
|  Action  |  |

|  Code  | 10162 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred completing a transaction. |
|  Action  |  |

|  Code  | 10164 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |MessageBroker with server id server id does not contain a service with class flex.data.DataService |
|  Action  |  |

|  Code  | 10165 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Attempt to begin a DataServiceTransaction when an existing transaction was already in place. |
|  Action  |  |

|  Code  | 10166 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Page requested does not exist in the specified sequence ''{0}'' for destination ''{1}''. |
|  Action  |  |

|  Code  | 10167 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The destination destination name has identity properties that do not have defined types. Identity types must be defined for all properties or for no properties; not a partial set. |
|  Action  |  |

|  Code  | 10168 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |There is no current message broker to return. |
|  Action  |  |

|  Code  | 10170 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid reconnect fetch value. Valid options are valid options list |
|  Action  |  |

|  Code  | 10171 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |You are specifying a strongly-typed object ''{0}'' on the client using RemoteClass metadata and a strongly typed object ''{1}'' on the server using item-class. If you wish to have strongly typed objects on both client and server, you must specify RemoteClass(alias='server.Object') where 'server.Object' is the target item type on the server. Otherwise, remove one of the designations to specify client or server-only. |
|  Action  |  |

|  Code  | 10171 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |You are specifying a strongly-typed object client side object name on the client using RemoteClass metadata and a strongly typed object server side object name on the server using item-class. If you wish to have strongly typed objects on both client and server, you must specify RemoteClass(alias='server.Object') where 'server.Object' is the target item type on the server. Otherwise, remove one of the designations to specify client or server-only. |
|  Action  |  |

|  Code  | 10172 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Attempt to request a page with sequence id: sequence Id for destination name destination name which the client is not subscribed to. |
|  Action  |  |

|  Code  | 10173 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Value for extends attribute must be a comma separated list of valid destination names. Destination destination name refers to destination names referred which is not recognized as a data destination name. |
|  Action  |  |

|  Code  | 10174 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Identity properties for all destinations in the same extends hierarchy must match. Destination destination name has id properties but extends a destination with name of Id. |
|  Action  |  |

|  Code  | 10175 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Destination destination name extends another destination but does not specify item-class so we can tell which instances go with which destination. |
|  Action  |  |

|  Code  | 10176 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The extends value for destination destination name should be a comma separated list of destination names. Found destination name(s) found. |
|  Action  |  |

|  Code  | 10177 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Encountered an instance for destination with class: class name of destination that is not a sub-type of the item-class: class name of item. |
|  Action  |  |

|  Code  | 10178 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Destination destination name has two sub-types which inherit from each other but the destinations do not extend from each other. Destination (class: class name of destination) is a super or sub type of destination name of parent destination (class: class name of parent destination). |
|  Action  |  |

|  Code  | 10179 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Destination destination name extends from these destinations: list of parent destinations which directly or indirectly extend from it. |
|  Action  |  |

|  Code  | 10180 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Destination destination name defined an association: name of association that refers to non-existent destination name of non-existent definition |
|  Action  |  |

|  Code  | 10181 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Destination destination name received invalid message: name of invalid message |
|  Action  |  |

|  Code  | 10182 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Destination destination name received request for an association property that is not defined on the server server name. |
|  Action  |  |

|  Code  | 10183 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Updating collection property name of property did not return a valid collection: name of collection. |
|  Action  |  |

|  Code  | 10184 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Attempt to modify collection property without a corresponding association: name of property does not have an association named name of association. |
|  Action  |  |

|  Code  | 10185 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A destination can only extend from a single destination. Destination destination name has extends list of destinations being extended. |
|  Action  |  |

|  Code  | 10186 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Single valued associations do not support paging - page size must be 0 for destination destination name on association name of association. |
|  Action  |  |

|  Code  | 10187 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Page requested does not exist in the specified collection: name of collection for destination destination name. |
|  Action  |  |

|  Code  | 10188 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred requesting page for the specified collection: name of collection for destination destination name. |
|  Action  |  |

|  Code  | 10189 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |No destination with id id of destination is registered with the DataService. |
|  Action  |  |

|  Code  | 10190 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Assembler returned multiple items with the same id, name of Id, in a fill response for fill with the following parameters, list of parameters, for destination destination name. |
|  Action  |  |

|  Code  | 10500 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Could not invoke sync method on data adapter for destination destination name due to the following error: error message. |
|  Action  |  |

|  Code  | 10501 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to locate a sync method for destination destination name. |
|  Action  |  |

|  Code  | 10502 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to instantiate object assembler class class name of assembler. |
|  Action  |  |

|  Code  | 10503 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |No identity sent with delete operation. |
|  Action  |  |

|  Code  | 10504 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unsupported DataMessage operation name of operation. |
|  Action  |  |

|  Code  | 10505 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |No identity sent with update operation. |
|  Action  |  |

|  Code  | 10506 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |ObjectAdapter class class name of object adapter could not be found. |
|  Action  |  |

|  Code  | 10507 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Could not create ObjectAdapter class class name of ObjectAdapter. |
|  Action  |  |

|  Code  | 10508 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to locate a count method for destination destination name which matches the following parameters: list of parameters. |
|  Action  |  |

|  Code  | 10509 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke a count operation on destination destination name due to the following error: error message stating the cause. |
|  Action  |  |

|  Code  | 10510 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to locate a fill method for destination destination name which matches the following parameters: list of parameters. |
|  Action  |  |

|  Code  | 10511 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke a fill operation on destination destination name due to the following error: error message. |
|  Action  |  |

|  Code  | 10512 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to locate a get method for destination destination name. |
|  Action  |  |

|  Code  | 10513 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke a get operation on destination destination name due to the following error: error message. |
|  Action  |  |

|  Code  | 10514 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |More than one destination name method is configured with the same argument types for destination: destination name, which is not permitted. |
|  Action  |  |

|  Code  | 10515 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |While generating methods for a data adapter, could not find parameter class class name of parameter. |
|  Action  |  |

|  Code  | 10516 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data adapter could not locate method name of method with parameters list of parameters on class class name. |
|  Action  |  |

|  Code  | 10517 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data adapter could not find sync method name of method on class class name. |
|  Action  |  |

|  Code  | 10518 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |An association tag is missing a value for either the property or destination attributes. You have configured property=name of property, association destination=destination name. |
|  Action  |  |

|  Code  | 10519 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Hibernate destination destination name has an association to destination destination name which is not a Hibernate destination. |
|  Action  |  |

|  Code  | 10520 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The fill method with parameters list of parameters and destination destination name returned null. |
|  Action  |  |

|  Code  | 10521 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |No parameters passed to fill method for the Hibernate assembler on destination destination name and there is no fill-method defined for zero args. |
|  Action  |  |

|  Code  | 10522 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |An HQL expression contained a named or positional parameter token, but no parameters were provided to the fill operation. |
|  Action  |  |

|  Code  | 10523 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |No Hibernate mapping was found for entity name name of entity to be persisted configured in destination destination name. Verify that your destination configuration specifies a valid item-class/, or that the destination id is a hibernate entity name in your hibernate.cfg.xml file. |
|  Action  |  |

|  Code  | 10524 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The PROPERTY conflict mode is not useful for the delete-conflict-mode setting, specify NONE or OBJECT instead for destination Name of destination. |
|  Action  |  |

|  Code  | 10525 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to inspect fields when evaluating a query in the ASObjectAdapter |
|  Action  |  |

|  Code  | 10526 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The ASObject Data Adapter has no back end, so when clustered it cannot be configured to share a back end |
|  Action  |  |

|  Code  | 10527 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The ASObject Data Adapter can accept only a single parameter, in the form a selector expression, in its fill operation |
|  Action  |  |

|  Code  | 10528 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unique id must be specified. Identity properties specified are not found on specified object instance. |
|  Action  |  |

|  Code  | 10529 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to access the field Name of field of a strongly-typed Java object Name of java object which was passed into the ASObjectAdapter. |
|  Action  |  |

|  Code  | 10530 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Attempt to create an item in data destination Name of destination with an identity which already exists. Identities must be unique. |
|  Action  |  |

|  Code  | 10531 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A fill with an HQL query was attempted but no query expression was provided as the second parameter to fill for destination Name of destination. |
|  Action  |  |

|  Code  | 10532 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A fill with an HQL query was attempted but the wrong number of arguments were supplied. We expect the args to be: fill("flex:hql", hqlExpressionString,hqlPositionalOrMapParameters). Destination is: Name of destination. |
|  Action  |  |

|  Code  | 10533 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data adapter could not locate fill-contains-method Name of method on class Class name with parameters 'Object[] fillParams, Object value'. |
|  Action  |  |

|  Code  | 10534 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data adapter has a fill-contains-method tag which is missing a name tag for fill method name of method on class Class name. |
|  Action  |  |

|  Code  | 10535 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The fill-contains-method for class Class name did not return a boolean result - class Wrong class name was found instead. |
|  Action  |  |

|  Code  | 10536 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The fill-contains-method for class Class name returned an error: Error message. |
|  Action  |  |

|  Code  | 10537 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data adapter has a fill-contains-method tag which is missing a name sub-tag for fill method Name of fill method on assembler class Name of assembler class |
|  Action  |  |

|  Code  | 10538 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data adapter has more than one sync-method which is not allowed. methods: List of declared sync method names. |
|  Action  |  |

|  Code  | 10539 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data destination Name of destination has property Name of property configured more than once which is not allowed. |
|  Action  |  |

|  Code  | 10540 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data adapter could not find init method Name of method on class Class name. |
|  Action  |  |

|  Code  | 10541 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Data adapter has more than one init-method which is not allowed. methods: List of methods. |
|  Action  |  |

|  Code  | 10542 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke a init method on destination Name of destination due to the following error: Error message. |
|  Action  |  |

|  Code  | 10543 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The auto-refresh can be false only if fill-contains-method does not exist for fill method Name of fill method on assembler class Assembler class name. |
|  Action  |  |

|  Code  | 10544 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A fill for a named Hibernate query was attempted but the wrong number of arguments was supplied. We expect two fill arguments - the name of the query and the parameters as the second argument either as an Object or an Array. Destination: Name of destination. |
|  Action  |  |

|  Code  | 10545 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A fill for a Hibernate query was attempted with invalid parameter types. The first arg should be a string to identify the query. For HQL, the second arg is the string HQL expression, followed by parameters. For named queries parameters are the second arg. Parameters are either an array for position params, or an Object for named params. Destination: Name of destination. |
|  Action  |  |

|  Code  | 10546 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke a get method for destination Name of destination because the identity property Name of identity property was not provided. |
|  Action  |  |

|  Code  | 10547 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to invoke a get method for destination Name of destination because the identity type(s) did not match. Received List of identity types sent. Expected Correct list of identity types. |
|  Action  |  |

|  Code  | 10548 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot load type Name of type for identity property Name of identity property. |
|  Action  |  |

|  Code  | 10549 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Ambiguous fill method encountered. Incoming arguments List of incoming arguments match both fill-method: Name of first fill method and fill-method: Name of second fill method. |
|  Action  |  |

|  Code  | 10750 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the requested keystore type, Name of keystore type, is not available. |
|  Action  |  |

|  Code  | 10751 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the keystore file could not be found, is unreadable or the supplied password is incorrect. |
|  Action  |  |

|  Code  | 10752 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the algorithm used to test keystore integrity can not be found. |
|  Action  |  |

|  Code  | 10753 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because not all certificates in the keystore could be loaded. |
|  Action  |  |

|  Code  | 10754 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the algorithm, Name of algorithm, is not available. |
|  Action  |  |

|  Code  | 10755 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the keystore password is incorrect. |
|  Action  |  |

|  Code  | 10756 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the keystore manager factory could not initialize. |
|  Action  |  |

|  Code  | 10757 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the truststore manager factory could not initialize. |
|  Action  |  |

|  Code  | 10758 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the protocol, Name of protocol, is not available. |
|  Action  |  |

|  Code  | 10759 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the keystore password file, password file, can not be found. |
|  Action  |  |

|  Code  | 10760 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS failed to initialize because the keystore password file, password file, can not be read. |
|  Action  |  |

|  Code  | 10761 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS could not initialize because the keystore-file/ configuration element was not provided. |
|  Action  |  |

|  Code  | 10762 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |RTMPS could not initialize because neither the keystore-password/ nor the keystore-password-file/ configuration element was provided. |
|  Action  |  |

|  Code  | 10850 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The RTMP server has encountered a fatal exception starting up: Exception Message. |
|  Action  |  |

|  Code  | 10851 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The RTMP server has encountered a fatal exception establishing its socket to accept client connections: Exception Message |
|  Action  |  |

|  Code  | 11150 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |An invalid license key was entered. To enable a Developer license remove the invalid license key from license.properties. |
|  Action  |  |

|  Code  | 11151 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Beta expired. |
|  Action  |  |

|  Code  | 11152 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |MessageBroker Name of MessageBroker rejected connection from address Name of 'from' address; Developer mode addresses already in use: List of allowed addresses. |
|  Action  |  |

|  Code  | 11153 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Maximum number of IP addresses exceeded for Developer licensed server. |
|  Action  |  |

|  Code  | 11200 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The item of type, Name of item class, passed to the assembler does not match the assembler''s configured entity type, Name of entity class. To convert ''flex.messaging.io.amf.ASObject'' to a strong type automatically, set the item-class in the destination. |
|  Action  |  |

|  Code  | 11201 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Hibernate HQL queries are not allowed for destination Name of destination. |
|  Action  |  |

|  Code  | 11202 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The fill method is not defined for destination Name of destination which matches fill parameters: List of parameters |
|  Action  |  |

|  Code  | 11203 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The fill method which returns a page of items is not defined for destination Name of destination but useFillPage for fill parameters: Provided fill parameters returned true. |
|  Action  |  |

|  Code  | 11204 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Type Class name of identity property for identity property name of identity property must implement the equals method. |
|  Action  |  |

|  Code  | 11205 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Type Class name of identity property for identity property name of identity property must implement the hashCode method. |
|  Action  |  |

|  Code  | 11206 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Hibernate destination Name of destination was created automatically and is not exposed to clients for queries. If you intend to expose these queries, add an explicit destination declaration in data-management-config.xml. |
|  Action  |  |

|  Code  | 11207 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A fill method returned object type which is not a collection. destination Name of destination params: List of parameters. |
|  Action  |  |

|  Code  | 11207 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A fill method returned object type which is not a collection. destination Name of destination params: List of parameters provided. |
|  Action  |  |

|  Code  | 11208 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A findItem method returned object type which is a collection. destination Name of destination params: List of parameters provided. |
|  Action  |  |

|  Code  | 11209 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |When using runtime configuration, the destination id on the assembler must be set. |
|  Action  |  |

|  Code  | 11250 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The driver-class, Name of driver class, could not be found. Specify a valid driver-class in the configuration file. |
|  Action  |  |

|  Code  | 11251 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The datasource, Name of data source, could not be found. Specify a valid datasource in the configuration file. |
|  Action  |  |

|  Code  | 11252 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Database connection information for destination Name of destination must be specified in the configuration file." |
|  Action  |  |

|  Code  | 11253 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Only one of datasource or driver-class may be set for destination Name of destination. |
|  Action  |  |

|  Code  | 11254 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Must specify one of datasource or driver class for destination Name of destination. |
|  Action  |  |

|  Code  | 11255 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The database connection information must specify a url for destination Name of destination. |
|  Action  |  |

|  Code  | 11256 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |An error executing SQL caused the operation to fail. If debug level logging is enabled for the SQL Assembler, details are logged on the server. |
|  Action  |  |

|  Code  | 11257 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The named query Name of query is undefined for the Name of method method on the destination Name of destination. |
|  Action  |  |

|  Code  | 11258 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Missing SQL for Name of destination. Add to the configuration for destination. |
|  Action  |  |

|  Code  | 11259 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Only one of sql or procedure may be set for Operation for which sql is being generated in destination Name of destination. |
|  Action  |  |

|  Code  | 11260 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error in SQL for Operation used to display clear error messages in destination Name of destination. SQL must not contain ''?'' use parameter replacement tokens instead (example: #paramName# where paramName is the property of the object). |
|  Action  |  |

|  Code  | 11260 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error in SQL for Name of operation in destination Name of destination. SQL must not contain ''?'' use parameter replacement tokens instead (example: #paramName# where paramName is the property of the object). |
|  Action  |  |

|  Code  | 11261 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error in SQL for Name of operation in destination . Matching pair of # tokens not found" |
|  Action  |  |

|  Code  | 11262 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Only one of java-class or actionscript-class may be set for destination Name of destination. |
|  Action  |  |

|  Code  | 11263 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The name for Name of operation for fill/count in destination Name of destination must be defined. |
|  Action  |  |

|  Code  | 11264 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The name attribute on the procedure tag for Name of procedure in destination Name of destination must be defined. |
|  Action  |  |

|  Code  | 11265 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The procedure-type for the Name of the property of the ActionScript object that is used as the parameter value property of the Name of the procedure which uses this parameter procedure on the Name of destination destination must be one of IN, OUT, or INOUT. |
|  Action  |  |

|  Code  | 11266 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A property-value must be specified for each procedure-param in the Name of operation for which the sql is being generated procedure, Name of procedure. |
|  Action  |  |

|  Code  | 11267 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |No parameters passed to Name of fill/count method-method for the SQL assembler on destination Name of destination and there is no Name of fill/count method-method defined for zero args. |
|  Action  |  |

|  Code  | 11268 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The following association relations specified by the destination Name of destination are not allowed as SQL assembler does not support associations: Type of associations. |
|  Action  |  |

|  Code  | 11300 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Operation Name of operation not supported by endpoint Name of defined endpoint. |
|  Action  |  |

|  Code  | 11301 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Name of remoting point specified is not a valid Remoting endpoint. |
|  Action  |  |

|  Code  | 11302 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Name of endpoint has no associated active components. |
|  Action  |  |

|  Code  | 11303 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Operation Name of operation is long lived and must be invoked asynchronously. |
|  Action  |  |

|  Code  | 11304 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Operation Name of operation does not have a parameter called Name of parameter. |
|  Action  |  |

|  Code  | 11305 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The specified document URL is malformed. |
|  Action  |  |

|  Code  | 11306 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Class Class name should not have a fieldName Field name specified. |
|  Action  |  |

|  Code  | 11307 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |All non remotely-mapped parameters must have at least one set property. |
|  Action  |  |

|  Code  | 11308 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Class Name of class could not be loaded by any available classloader |
|  Action  |  |

|  Code  | 11309 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Operation not supported by JobManager service. |
|  Action  |  |

|  Code  | 11310 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |strong RemotingJobID class not found. |
|  Action  |  |

|  Code  | 11311 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Do not define any security roles in flex configuration files. All authentication and authorization is handled by Live Cycle. |
|  Action  |  |

|  Code  | 11312 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Operation Name of operation does not expect an array input parameter. |
|  Action  |  |

|  Code  | 11313 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Array members do not match expected array type, Type of array, for operation Name of operation. |
|  Action  |  |

|  Code  | 11314 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Read operations are not allowed on this destination. |
|  Action  |  |

|  Code  | 11315 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Create operations are not allowed on this destination. |
|  Action  |  |

|  Code  | 11316 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Update operations are not allowed on this destination. |
|  Action  |  |

|  Code  | 11317 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Delete operations are not allowed on this destination. |
|  Action  |  |

|  Code  | 11318 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Count operations are not allowed on this destination. |
|  Action  |  |

|  Code  | 11319 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Problem marshalling instance returned by Assembler into XML: Exception Message. |
|  Action  |  |

|  Code  | 11320 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Problem unmarshalling XML passed in by orchestration into a strong type: Exception Message. |
|  Action  |  |

|  Code  | 11321 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Configuration parameter Name of the parameter may not be updated at this time. Revert changes. |
|  Action  |  |

|  Code  | 11323 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error parsing passed in XML - Name of XML does not have a Name of element element. |
|  Action  |  |

|  Code  | 11323 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error parsing passed in XML - XML does not have a Name of element element. |
|  Action  |  |

|  Code  | 11324 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Returned item has complex property Name of property and cannot be retrieved as XML. You may use a strong typed method instead. |
|  Action  |  |

|  Code  | 11325 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |DocumentReference cannot be converted because the reference type is invalid. Set the reference type on your DocumentReference object. |
|  Action  |  |

|  Code  | 11326 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error encountered encoding DocumentReference using charset Charsets being used. |
|  Action  |  |

|  Code  | 11327 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |DocumentReference type is set to INLINE but content passed in was empty. |
|  Action  |  |

|  Code  | 11328 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Endpoint Name of endpoint is disabled. |
|  Action  |  |

|  Code  | 11329 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Operation Name of operation does not support the Remoting connector. |
|  Action  |  |

|  Code  | 11330 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Service version string must have a major and minor version separated by a period. |
|  Action  |  |

|  Code  | 11331 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Either the major or the minor version specified in the service version string is not an integer. |
|  Action  |  |

|  Code  | 11332 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The service version argument must be a string. |
|  Action  |  |

|  Code  | 11333 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |User must be authenticated before documents may be uploaded. |
|  Action  |Attempting to upload a document without the correct permissions to the Remoting file upload service results in the error: User must be authenticated before uploading documents. Users have two options: 1) Go to the admin UI at HOME -> Settings -> Core System -> Core Configurations and check the "Allow non secured document uploaded from Flex applications" check box. or 2) Add the user trying to complete this operation to the "Document Upload Application Users" role or give them the "Document Upload" permission. |

|  Code  | 11333 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |User must be authenticated before documents may be uploaded. |
|  Action  |  |

|  Code  | 11334 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |LC.FileUploadAuthenticator only supports the \"getFileUploadToken\" operation. |
|  Action  |  |

|  Code  | 11350 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Problem locating Name of JSP page JSP: Error message. |
|  Action  |  |

|  Code  | 11351 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Processing problem in Name of JSP page JSP: Error message. |
|  Action  |  |

|  Code  | 11352 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Note: read-only preferences are not editable. |
|  Action  |  |

|  Code  | 11353 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Interact with this Flex application in View mode and edit its preferences in Edit mode. |
|  Action  |  |

|  Code  | 12000 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to delete existing file: File name. |
|  Action  |  |

|  Code  | 12001 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |XFA datasets must use ''xfa'' as the prefix for the qualified element name. |
|  Action  |  |

|  Code  | 12002 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to convert xfa:dataset Document to a String. |
|  Action  |  |

|  Code  | 12003 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to obtain UTF-8 bytes from a String representation of the xfa:dataset. |
|  Action  |  |

|  Code  | 12004 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Your current license is not sufficient for the PDF generation feature. |
|  Action  |  |

|  Code  | 13500 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because no KeyStore file was defined, or the supplied KeyStore file path could not be resolved. |
|  Action  |  |

|  Code  | 13501 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the KeyStore password file, Name of password file, can not be found. |
|  Action  |  |

|  Code  | 13502 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the KeyStore password file, password file, can not be read. |
|  Action  |  |

|  Code  | 13503 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because neither a KeyStore password nor password file was defined. |
|  Action  |  |

|  Code  | 13504 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because a password deobfuscator must be available to process obfuscated passwords. |
|  Action  |  |

|  Code  | 13505 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the requested KeyStore type, Name of keystore type, is not available. |
|  Action  |  |

|  Code  | 13506 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the KeyStore file could not be found, is unreadable, or the supplied password is incorrect. |
|  Action  |  |

|  Code  | 13507 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the algorithm used to test KeyStore integrity can not be found. |
|  Action  |  |

|  Code  | 13508 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because not all certificates in the KeyStore could be loaded. |
|  Action  |  |

|  Code  | 13509 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the algorithm, , is not available. |
|  Action  |  |

|  Code  | 13510 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the KeyStore password is incorrect. |
|  Action  |  |

|  Code  | 13511 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because a KeyManagerFactory could not be initialized. |
|  Action  |  |

|  Code  | 13512 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the requested TrustStore type, Type of truststore, is not available. |
|  Action  |  |

|  Code  | 13513 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the TrustStore file could not be found, is unreadable or the supplied password is incorrect. |
|  Action  |  |

|  Code  | 13514 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the algorithm used to test TrustStore integrity can not be found. |
|  Action  |  |

|  Code  | 13515 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because not all certificates in the TrustStore could be loaded. |
|  Action  |  |

|  Code  | 13516 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the TrustManagerFactory could not be initialized. |
|  Action  |  |

|  Code  | 13517 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because the protocol, Name of protocol, is not available. |
|  Action  |  |

|  Code  | 13518 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Initializing the SSLContext after construction failed due to a key management problem. |
|  Action  |  |

|  Code  | 13519 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid certificate alias Name of certificate alias has been specified. No match was found in the keystore. |
|  Action  |  |

|  Code  | 13550 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |SocketServer Id of the server cannot open a Selector for accepting new connections. |
|  Action  |  |

|  Code  | 13551 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |SocketServer Id of the server cannot bind to accept client connections on port Port number because another process has already bound the port. Ensure that multiple endpoints across all applications are not configured to use this same port. |
|  Action  |  |

|  Code  | 13552 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The acceptor for SocketServer Id of the server has failed. Refer to this exception''s root cause for the underlying problem. |
|  Action  |  |

|  Code  | 13553 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The Name of property property for a SocketServer component cannot be null. |
|  Action  |  |

|  Code  | 13554 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The Name of property property for a SocketServer must be assigned before the server is started. |
|  Action  |  |

|  Code  | 13555 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The acceptor for SocketServer Id of the server was interrupted waiting for its accept thread to start. |
|  Action  |  |

|  Code  | 13556 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |SocketServer Id of the server cannot open a Selector for managing accepted connections. |
|  Action  |  |

|  Code  | 13557 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The reactor, Id of the reactor, for SocketServer Id of the server has failed. Refer to this exception''s root cause for the underlying problem. |
|  Action  |  |

|  Code  | 13558 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The reactor, Id of the reactor, for SocketServer Id of the server was interrupted waiting for its thread to start. |
|  Action  |  |

|  Code  | 13559 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |SocketServer Id of the server failed to start because the required class Name of Class could not be found and instantiated. Ensure the class is on your classpath. |
|  Action  |  |

|  Code  | 13560 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Creating SocketServer Id of the server failed because the required class Name of Class could not be found and instantiated. Ensure the class is on your classpath. |
|  Action  |  |

|  Code  | 13561 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |BindSocketAddress assignment conflict for SocketServer . The value being assigned, Value being assigned, conflicts with the existing assigned value, Existing value. |
|  Action  |  |

|  Code  | 13562 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid connection buffer type Type of buffer cannot be assigned to the Supported buffer type; specify a supported value. |
|  Action  |  |

|  Code  | 13563 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |SocketServer Id of the server failed to start because a specified cipher suite, Name of cipher suite, is not supported. |
|  Action  |  |

|  Code  | 13650 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The endpoint, Name of endpoint, depends upon a SocketServer but a referenced SocketServer id was not defined and no dedicated SocketServer settings were defined. |
|  Action  |  |

|  Code  | 13651 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The endpoint, Name of endpoint, is attempting to use port Port number of SocketServer Id of the server but uses a protocol that cannot be handled appropriately alongside the other endpoint(s) that have also registered to use this port. Configure this endpoint to use a different server and port. |
|  Action  |  |

|  Code  | 13652 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The endpoint, Name of endpoint, must create an internal ProtocolHandlerFactory for use in handling data on its connections. |
|  Action  |  |

|  Code  | 13653 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The endpoint, Name of endpoint, is using a referenced SocketServer with a protocol handler factory that does not extend DefaultProtocolHandlerFactory. |
|  Action  |  |

|  Code  | 13654 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |No endpoint is defined to service a client socket connection to port . |
|  Action  |  |

|  Code  | 13655 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The endpoint, Name of endpoint, failed to register a bind address/port with its referenced SocketServer Server address:Server port number |
|  Action  |  |

|  Code  | 13700 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Client Client Id is unsubscribed because the max-queue-size limit Maximum size of message queue has been reached due to the message Message Id. |
|  Action  |  |

|  Code  | 13750 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Service does not support reliability operation: Name of operation. |
|  Action  |  |

|  Code  | 13751 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Received a reliable message but no reliable message sequence for the client has been negotiated. |
|  Action  |  |

|  Code  | 13752 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Client sent an unreliable message to a reliable destination. |
|  Action  |  |

|  Code  | 13753 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Reliable messaging is only available to clients that connect to an NIO endpoint (RTMP/AMF/HTTP). The endpoint Name of endpoint the client has connected to does not support reliable messaging. |
|  Action  |  |

|  Code  | 13800 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Gateway service Gateway service Id must define at least one gateway endpoint. |
|  Action  |  |

|  Code  | 13801 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Gateway endpoint for gateway service gateway service Id must define at least one url. |
|  Action  |  |

|  Code  | 13801 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Gateway endpoint for gateway service gateway service Id must define at least one url. |
|  Action  |  |

|  Code  | 13802 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Gateway service Gateway service Id cannot connect to its configured gateway endpoint which is required for startup; make sure the endpoint is accessible from the service or set require-for-startup to false. |
|  Action  |  |

|  Code  | 13804 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Gateway endpoint Name of endpoint is misconfigured to use a load-calculator that does not extend flex.messaging.endpoints.LoadCalculator. |
|  Action  |  |

|  Code  | 13805 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Gateway service Gateway service Id requires an authenticated client. Login before interacting with any gateway service destinations. |
|  Action  |  |

|  Code  | 13806 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Gateway endpoint Name of endpoint cannot create gateway session; acceptGatewaySessions property is set to false. |
|  Action  |  |

|  Code  | 13807 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Gateway connection closed. |
|  Action  |  |

|  Code  | 50100 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The Hibernate Type class generation failed because the class, Class name, already exists. |
|  Action  |  |

|  Code  | 50101 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unknown failure while generating the Hibernate Type class, Class name. |
|  Action  |  |

|  Code  | 50102 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred while generating equals method of Hibernate Type, Class name, for Entity, Entity name. The generated method cannot be compiled. |
|  Action  |  |

|  Code  | 50103 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred while generating hashCode method of Hibernate Type, Class name, for Entity, Entity name. The generated method cannot be compiled. |
|  Action  |  |

|  Code  | 50104 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred while generating getter method for property, Property name, of Hibernate Type, Class name, for Entity, Entity name. The generated method cannot be compiled. |
|  Action  |  |

|  Code  | 50105 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred while generating setter method for property, Property name, of Hibernate Type, Class name, for Entity, Entity name. The generated method cannot be compiled. |
|  Action  |  |

|  Code  | 50106 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred while generating field for property, Property name, of Hibernate Type, Class name, for Entity, Entity name. The generated method cannot be compiled. |
|  Action  |  |

|  Code  | 50107 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred while generating field for property, Property name, of Hibernate Type, Class name, for Entity, Entity name. Type not found, Property type. |
|  Action  |  |

|  Code  | 50108 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unknown failure while generating the Hibernate Type class, Class name, for Entity, Entity name. The class cannot be compiled. |
|  Action  |  |

|  Code  | 50109 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error occurred while generating bean info class, for Entity, Entity name. The getPropertyDescriptors method cannot be compiled. |
|  Action  |  |

|  Code  | 50300 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error: Unable to deploy model ''{0}'': Model already exists. |
|  Action  |  |

|  Code  | 50301 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error loading model Model name: Exception message. |
|  Action  |  |

|  Code  | 50302 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error count error(s) found while reading model Model name:\nMessages. |
|  Action  |  |

|  Code  | 50303 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to deploy model Model name: Messages |
|  Action  |  |

|  Code  | 50304 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error creating and starting destinations while deploying model Model name: Exception message. |
|  Action  |  |

|  Code  | 50305 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error: Unable to undeploy model Model name: Model is not deployed. |
|  Action  |  |

|  Code  | 50306 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error: Unable to perform getDDL operation for model Model name: Model is not deployed. |
|  Action  |  |

|  Code  | 50307 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error: Unable to perform getDDL operation for model Model name: Exception message. |
|  Action  |  |

|  Code  | 50308 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error: Unable to perform getDDL operation for model Model name: Cannot find hibernate manager with the same name as the model. |
|  Action  |  |

|  Code  | 50309 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error: Empty or missing model name |
|  Action  |  |

|  Code  | 50310 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Warning: Exception removing destinations for model Model name : Exception message. |
|  Action  |  |

|  Code  | 50311 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Warning: Unable to remove model Model name from persistent storage. |
|  Action  |  |

|  Code  | 50312 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error: Incorrect id Service Id used for the ModelDeploymentService, it must be configured with the id Correct Service Id. |
|  Action  |  |

|  Code  | 50313 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to deploy model Model name: Error: Error message - the annotation "hibernate.dialect" may need to be set on the model. |
|  Action  |  |

|  Code  | 50400 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The entity Entity name depends on the following non-persistent entities: List of entities. |
|  Action  |  |

|  Code  | 50401 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The entity Entity name depends on the following non-LCDS entities: List of entities. |
|  Action  |  |

|  Code  | 50402 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The entity Entity name can not be managed by Data Services as it is not a persistent entity |
|  Action  |  |

|  Code  | 50403 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The entity Entity name has a property Property name of type opaque, which is not supported |
|  Action  |  |

|  Code  | 50404 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The annotation "datasource" must be set on the model for deployment. |
|  Action  |  |

|  Code  | 50405 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |The annotation "hibernate.dialect" must be set on the model. |
|  Action  |  |

|  Code  | 50500 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error creating item for entity Entity name: the following constraints failed: constraints. |
|  Action  |  |

|  Code  | 50501 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Error updating item for entity Entity name: the following constraints failed: constraints. |
|  Action  |  |

|  Code  | 50502 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Could not find argument Parameter passed in parameters for fill Query, the required arguments are: Arguments. |
|  Action  |  |

|  Code  | 50503 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Wrong number of parameters number of parameters passed to fill named query which requires expected number of arguments parameters. |
|  Action  |  |

|  Code  | 50504 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A fill for the entity Entity name was attempted but the wrong number of arguments number of arguments passed was supplied. We expect two fill arguments - the name of a filter (or an implicit filter such as getAll or getBypropertyName) and the parameters as the second argument either as an Object or an Array. |
|  Action  |  |

|  Code  | 50505 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |A fill for the entity Entity name was attempted with invalid parameter types. The first argument should be a string to identify the filter. The parameters are the second argument. Parameters are either an array for position parameters, or an Object for named parameters. |
|  Action  |  |

|  Code  | 50506 (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |There were no parameters passed to fill named query which requires an Object parameter with the following entries: required parameters. |
|  Action  |  |

|  Code  | 214: 11320=Problem unmarshalling XML passed in by orchestration into a strong type: {0} (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Problem unmarshalling XML passed in by orchestration into a strong type: Exception Message. |
|  Action  |  |

|  Code  | DataServices (Data Services) |
|---|---|
|  Type  |Error |
|  Cause  |Building an SSLContext failed because a password deobfuscator must be available to process obfuscated passwords. |
|  Action  |  |

## Database error codes {#database-error-codes}

|  Code  | java.net.SocketException MESSAGE: Software caused connection abort: socket write error (Database) |
|---|---|
|  Type  |  |
|  Cause  |Extended periods of server inactivity when using the JBoss Application Server configured with MySQL (the JBoss turnkey). Exception is raised by background processing during internal database management. Its presence is expected: Idle connection with the database times out and causes the TCP/IP connection to close. Exceptions typically occur after 8 hours or more of inactivity in LiveCycle ES. [Exception seen on JBoss/MySQL and start with: java.sql.SQLException:No operations allowed after connection closed. Connection was implicitly closed due to underlying exception/error: &ast;&ast;BEGIN NESTED EXCEPTION &ast;&ast;com.mysql.jdbc.CommunicationsException MESSAGE:Communications link failure due to underlying exception: &ast;&ast;java.net.SocketException MESSAGE:Software]. |
|  Action  |This exception does not impact LiveCycle server processing and may be ignored. |

|  Code  | ORA-00910: specified length too long for its datatype (Database) |
|---|---|
|  Type  |  |
|  Cause  |Variable exceeds the maximum string length 4000 limit on Oracle database. |
|  Action  |Create the variable with length -1. |

## Doc Component error code {#doc-component-error-code}

## Document Security error codes {#document-security-error-codes}

|  Code  | ALC-DSS-300-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |An exception occurred from an internal operation. |
|  Action  |Review the logs for more information, and contact Adobe Technical Support. |

|  Code  | ALC-DSS-300-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Problem in processing the input PDF. |
|  Action  |Review the logs for more information, and contact Adobe Technical Support. |

|  Code  | ALC-DSS-300-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Insufficient {0} permissions in the input PDF for performing the operation {1} on Signature Field {2}. |
|  Action  |Verify that the PDF contains the permissions for the operation. |

|  Code  | ALC-DSS-300-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |PDF security handler does not allow the operation. |
|  Action  |The PDF is encrypted with a handler that does not provide the specific permissions for the operation. |

|  Code  | ALC-DSS-300-005 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified page number {0} does not exist in/cannot be accessed from the input PDF (Total number of pages:{1}). |
|  Action  |In the operation call addSignatureField, ensure that the page number are between 1 and the total number of pages, as specified in the error message. |

|  Code  | ALC-DSS-300-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The input PDF is encrypted using {0} and could not be opened, hence the operation {1} cannot be performed on Signature Field {2}. |
|  Action  |Provide a document to the operation which is decrypted or if encrypted, is unlocked in a process. |

|  Code  | ALC-DSS-300-007 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Addition of Signature Fields is not supported for Dynamic XFA PDFs. Documentation for more details. |
|  Action  |Addition of Signature Fields is not supported for Dynamic XFA PDFs. To certify the signature field, try a direct certify operation with an auto generated invisible signature field name. To create a visible signature field on this dynamic form or sign the created field, consider modifying the original template used to generate PDF. See Signatures service documentation for more details. |

|  Code  | ALC-DSS-300-008 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The operation {0} is not supported for Shell PDFs. A Shell PDF is a special type of static or dynamic XFA Form PDF, which contains XFA streams that are not in synchronization with the rendering available in the PDF version. See Signatures Service Documentation for more details. |
|  Action  |Provide a non-shell document to the operation. |

|  Code  | ALC-DSS-300-009 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The operation {0} is not supported for Dynamic PDFs. See Signatures Service Documentation for more details. |
|  Action  |Provide a static document to the operation. |

|  Code  | ALC-DSS-300-010 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not extract archive revocation information from certificate. |
|  Action  |Verify that the signer certificate has a valid extension for archiving revocation information in the PDF, while signing. |

|  Code  | ALC-DSS-300-011 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to convert from a PDF Document to Document. |
|  Action  |Verify that the document is a PDF document, and can be propagated in the workflow. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-DSS-300-012 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to read the input document. |
|  Action  |Verify the permissions of the input document and the configuration of the server with respect to document handling and disposal timeouts. |

|  Code  | ALC-DSS-300-013 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The document has been Reader Extended and has Insufficient {0} permissions for performing the operation {1} on Signature Field {2}. |
|  Action  |Provide a non Reader Extended document to the operation or a Reader Extended document carrying the necessary permission. |

|  Code  | ALC-DSS-300-014 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Certification of Dynamic Shell XFA Form PDFs is supported only for invisible signature fields. A Shell PDF is a special type of static or dynamic form XFA streams that are not in synchronization with the rendering available in the PDF version. |
|  Action  |Try one of the following actions: - Certify this document with an existing invisible signature field. - Do not specify any name, so that a default invisible signature field is created. NOTE: An invisible certification signature created in this manner does not include a snapshot of the document. For more information, see the Signature service documentation. |

|  Code  | ALC-DSS-300-015 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot determine SlotListIndex corresponding to SlotInfo {0} of Type {1}. |
|  Action  |Ensure that the Token Name or the Slot ID given in the HSMProfile added to the truststore references the actual slot with a token. |

|  Code  | ALC-DSS-300-016 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to create PKCS11 provider config file {0} for provider {1} due to {2}. |
|  Action  |Ensure that the Local Temp directory has available memory. Review the memory allocation through Administration Console: 1. Navigate to the Administration Console URL. 2. Navigate to Settings>Core System>Core Configurations. |

|  Code  | ALC-DSS-300-017 (Document Security) |
|---|---|
|  Type  |  |
|  Cause  |Certification of Static Shell XFA Form PDFs is not supported. A Shell PDF is a special type of static or dynamic XFA Form PDF, which contains XFA streams that are not in synchronization with the rendering available in the PDF version. See Signatures Service Documentation for more details. |
|  Action  |Certification of Static Shell XFA Form PDFs is not supported. A Shell PDF is a special type of static or dynamic XFA Form PDF. The PDF contains XFA streams that are not in synchronization with the rendering available in the PDF version. See Signatures service documentation for more details |

|  Code  | ALC-DSS-300-018 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Internal Error. PKCS11 Provider {0} removed bypassing the removal API. PKCS#11 JCE providers created by the Signature Service to enable signing/certifying using a private key on an HSM device are visible to all applications running in the same JVM and can be removed from outside the Security Service which is the case here. |
|  Action  |Ensure that another application not adding or removing JCE PKCS#11 providers for the same PKCS#11 library used by the Signature service. A conflict occurs if both applications are running in the same JVM as the LiveCycle server. |

|  Code  | ALC-DSS-300-019 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Modification of Signature Fields is not supported for {0} XFA PDFs. |
|  Action  |Modify the input PDF so that it is supported in the modifySignatureField API. |

|  Code  | ALC-DSS-300-020 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |An exception occurred while certifying the form. The form cannot be certified if any of the following are true: - Script-based changes are saved automatically in the PDF in an unsecured fashion. In this case, modify the form in Designer ES and set the option File>Form Properties> Defaults> Scripting> Manually, to allow certification on this form. - The form contains an empty Submit URL. - The form uses a Forms ES state packet. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-DSS-301-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The argument {0} (of type {1}) is invalid. |
|  Action  |Provide a valid value to the operation for the type mentioned in the error message. |

|  Code  | ALC-DSS-301-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The value {0} for argument {1} (of type {2}) is invalid. |
|  Action  |Provide a valid value to the operation for the type mentioned in the error message. |

|  Code  | ALC-DSS-301-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The sub-member {0} of the argument {1} (of type {2}) is invalid. |
|  Action  |Provide a valid value for the member field of the argument to the operation as mentioned in the error message. |

|  Code  | ALC-DSS-301-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The value {0} for sub-member {1} of the argument {2} (of type {3}) is invalid. |
|  Action  |Provide a valid value for the member field of the argument to the operation as mentioned in the error message. |

|  Code  | ALC-DSS-301-005 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The certificate encoding is null. The encoding of the Archive Revocation Information extension in the signer certificate is incorrect. |
|  Action  |Modify the Signer Certificate so that it contains the proper extension value. |

|  Code  | ALC-DSS-301-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The value {0} of {1} is incompatible with the defined type {2}.For example if an HSMProfile in truststore is created with SlotListIndex which is an integer value given as "aaa". |
|  Action  |Ensure that value {0} provided to the operation is of the desired type {2}. |

|  Code  | ALC-DSS-301-007 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The value {0} of type {1} is out of range. For example for a HSM with two slots, an HSMProfile is defined with SlotListIndex = 3. |
|  Action  |Verify that the value {0} supplied to the operation for type {1} is within desired range. |

|  Code  | ALC-DSS-302-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not add Signature Field {0}. |
|  Action  |Verify that the input PDF is valid and has permissions to allow the addition of a signature field. |

|  Code  | ALC-DSS-302-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not remove Signature Field {0}. |
|  Action  |Verify that the input PDF is Valid and has permissions to allow the removal of a signature field. |

|  Code  | ALC-DSS-302-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not clear Signature Field {0}. |
|  Action  |Verify that the input PDF is valid and has permissions required for clearing (or unsigning) of a signature field. |

|  Code  | ALC-DSS-302-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not get the signature field list from the input PDF file. |
|  Action  |Validate the input PDF is decrypted, and that it has the permissions required for retrieval of signature field lists and information. |

|  Code  | ALC-DSS-302-005 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not get the signed version of the document for signature field {0}. |
|  Action  |Validate the input PDF to verify that it is signed and is decrypted. |

|  Code  | ALC-DSS-302-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not get the certifying signature field from the input PDF file. |
|  Action  |Validate the input PDF to verify that it is certified and is decrypted. |

|  Code  | ALC-DSS-302-007 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not get the signature data for signature field {0}. |
|  Action  |Validate the input PDF and the field to verify that it is signed and is decrypted. |

|  Code  | ALC-DSS-302-008 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not get the legal attestation. |
|  Action  |Validate the input PDF to verify that it is certified with a legal attestation and is decrypted. |

|  Code  | ALC-DSS-302-009 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Signature Field {0} does not exist. |
|  Action  |Provide a valid signature field name to the operation. |

|  Code  | ALC-DSS-302-010 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified field {0} already exists in the PDF. Specify a different name. |
|  Action  |Specify a different name for the SignatureField. |

|  Code  | ALC-DSS-302-011 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Signature Field {0} can't be modified. |
|  Action  |Validate the input PDF to verify that it is decrypted (not certified), and whether it has the permissions required for signature field modification. |

|  Code  | ALC-DSS-303-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not sign Signature Field {0}. |
|  Action  |Verify that the PDF is valid and has permissions required for signing. |

|  Code  | ALC-DSS-303-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not certify Signature Field {0}. |
|  Action  |Verify that the PDF is valid and has permissions required for certification. |

|  Code  | ALC-DSS-303-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Signature Field {0} is already signed. |
|  Action  |The operation cannot be done on a signed field. Either clear the signature or mention a different SignatureField name. |

|  Code  | ALC-DSS-303-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Signature Field {0} cannot be certified because it is not the first signed field in the document |
|  Action  |The document input for certification already has a signed SignatureField. Either clear the previous signature or provide a different unsigned document. |

|  Code  | ALC-DSS-303-005 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Signature Field {0} cannot be signed/certified as it breaks existing signatures on other fields. |
|  Action  |Specify a different field to sign, or modify the PDF to have permissions for signing the field. |

|  Code  | ALC-DSS-303-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The credential being used for the alias {0} is not time valid. |
|  Action  |Check the notBefore and notAfter values in the certificate associated with the private key to ensure that the private key can be used for signing. |

|  Code  | ALC-DSS-303-007 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The PrivateKeyUsagePeriod of the credential being used for the alias {0} is expired or in the future. |
|  Action  |Obtain a valid credential for signing. |

|  Code  | ALC-DSS-303-008 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Error while extracting PrivateKeyUsagePeriod extension from the certificate for the credential alias: {0}. |
|  Action  |Validate the credential used for signing or to obtain a valid credential. |

|  Code  | ALC-DSS-303-009 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot use CA certificate for signing. A CA certificate cannot be used for signing documents. |
|  Action  |Use a credential that does not have the CA bit set to true. |

|  Code  | ALC-DSS-303-010 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The credential being used for the alias {0} does not have digital signature or non repudiation key usage set. |
|  Action  |Use a private key with the corresponding certificate having either no key usage extension or having one of digitalSignature or nonRepudiation key usage. |

|  Code  | ALC-DSS-303-011 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The dimensions {0} of the position rectangle for the signature field to be added are invalid. They lie completely outside the crop box of the page on which the signature field is to be added. |
|  Action  |Provide the correct bounds of the rectangle. |

|  Code  | ALC-DSS-303-012 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |No certifying signature exists in the document. |
|  Action  |Provide a PDF document with a certifying signature field. |

|  Code  | ALC-DSS-303-013 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The signature field {0} is not signed. |
|  Action  |Provide the correct field name, that is signed. |

|  Code  | ALC-DSS-303-014 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Subject Name or Subject Alt Name extension in the signer's certificate is not present. |
|  Action  |Provide a correct signer credential with either of these values present. |

|  Code  | ALC-DSS-303-015 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Subject Name missing is not present and Subject Alt Name extension in the signer's certificate is not marked critical. |
|  Action  |Provide a correct signer credential with either of these values present in the correct form. |

|  Code  | ALC-DSS-303-016 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Credential Alias {0} not found. |
|  Action  |Import a credential in TrustStore with the alias {0}. |

|  Code  | ALC-DSS-303-017 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not create an invisible signature field for certifying, when no name for the sigfield was specified in the API. Cannot create an on-the-fly field for signing. |
|  Action  |Verify the validity of the PDF. If the problem persists contact Adobe Technical Support. |

|  Code  | ALC-DSS-303-018 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not set the given Logo for signature field {0}. Verify that the input is valid and decrypted for opening. |
|  Action  |Verify that the input logo PDF is valid and decrypted for opening. |

|  Code  | ALC-DSS-303-019 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not set the given Image for signature field {0}. Verify that the input is valid and decrypted for opening. |
|  Action  |Verify that the input graphic PDF is valid and decrypted for opening. |

|  Code  | ALC-DSS-303-020 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Credential Alias {0} cannot be used for signing/certification. It is not trusted as a "Document Signing Credential" in Trust Store. |
|  Action  |Review the following Administration Console Help topic: Home> Settings > Trust Store Management > Local Credentials> {0} > Credential Trust Settings. View the "Document Signing Credential" for the alias name. |

|  Code  | ALC-DSS-303-021 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Signature Field {0} cannot be signed/certified as it is a read only field. |
|  Action  |Modify the PDF to make the field read-only or specify a valid input PDF. |

|  Code  | ALC-DSS-304-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not verify Signature Field {0}. |
|  Action  |Provide the PDF to Adobe Technical Support for analysis. |

|  Code  | ALC-DSS-304-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified filter type {0} is not supported. |
|  Action  |Provide an input PDF only with the supported Filter types (Adobe.PPKLite). |

|  Code  | ALC-DSS-304-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified sub-filter type {0} is not supported. |
|  Action  |Provide the PDF signed only with the Adobe supported subfilters. |

|  Code  | ALC-DSS-304-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Error validating XML signature. |
|  Action  |Provide a valid XML signature value as the input, or provide the input to Adobe Technical support for validation. |

|  Code  | ALC-DSS-304-005 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Signature does not contain signing time. |
|  Action  |Signature need to contain signing time for proper validation. Correct the input file. |

|  Code  | ALC-DSS-304-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |PreRelease signature is not supported. |
|  Action  |The signature is marked as PreRelease signed. Provide a non-PreRelease marked signature for validation. |

|  Code  | ALC-DSS-304-007 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Signature Validation cannot occur at a time in the future. Verification Time: {0} Current Time: {1} Signing Time: {2}. |
|  Action  |Ensure that the validation time is not in the future, and that the time settings of the server are correct. Alternatively, provide a different input PDF. |

|  Code  | ALC-DSS-304-008 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The certificate for signing is an Identrust Issued certificate but does not comply with Identrust signing requirements. (May not have proper key usage). |
|  Action  |Provide a non-identrust certificate (for the private key used for signing) or a valid identrust one. |

|  Code  | ALC-DSS-305-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Seed value constraints for the PDF were not satisfied {0}. |
|  Action  |Provide the proper input, as specified in {0}, so that seed values in the PDF can be enforced. |

|  Code  | ALC-DSS-305-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Seed value specifies that signature field can only be certified. Call certify instead. |
|  Action  |Certify the field instead of signing, as Seed Values mandate it. |

|  Code  | ALC-DSS-305-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |SubFilter not present in seed value. |
|  Action  |Subfilter mandated in the SeedValue is not compatible with support subfilter values. |

|  Code  | ALC-DSS-305-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Seed value constraints not satisfied. |
|  Action  |SeedValue constraints are not compatible with input values. Correct the input values or modify the seed value constraints. |

|  Code  | ALC-DSS-305-005 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Unsupported filter in seed value |
|  Action  |Filter mandated in the SeedValue is not compatible with supported filter values. Correct the filter values in the Seed Values of the signature field in the PDF. |

|  Code  | ALC-DSS-305-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Unsupported sub filter in seed values. |
|  Action  |Subfilter mandated in the SeedValue is not compatible with supported subfilter values. Correct the subfilter values in the Seed Values of the signature field in the PDF. |

|  Code  | ALC-DSS-305-007 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Reason for signing does not exist in seed value. |
|  Action  |Correct the reason for signing in the Input PDF Seed Values. |

|  Code  | ALC-DSS-305-008 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Subject certificates in seed value do not contain signing certificate. |
|  Action  |Provide the correct credential for signing which contains the signer's certificate in the Seed Value subject certificates list. |

|  Code  | ALC-DSS-305-009 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid policy bytes in seed value. |
|  Action  |Invalid Policies in the Signer Certificate or Seed Value. Correct the input signer certificate or PDF seed values. |

|  Code  | ALC-DSS-305-010 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Policy OID in seed value. |
|  Action  |Unable to match Policy OIDs in Certificate with Seed Value. Modify the Seed Value in the PDF or provide a valid signer credential. |

|  Code  | ALC-DSS-305-011 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Exception occurred while encoding the certificate. |
|  Action  |Unable to parse Certificates from Seed Value for SV validation. Modify the seed values with the correct certificates. |

|  Code  | ALC-DSS-305-012 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Issuer certificates not validated. |
|  Action  |The issuer certificates in the Seed Value do not match with the signer's issuer certificate. Provide the correct signing credential or modify the seed value. |

|  Code  | ALC-DSS-305-013 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Filter not present in seed value. |
|  Action  |SV Filter flag is set to "required" while there is no Filter. Correct the Seed Values in the PDF. |

|  Code  | ALC-DSS-305-014 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |LegalAttestation missing in seed value. |
|  Action  |LegalAttestation constraint is required in seed value, but no Legal Attestation value exists in the Seed Value. Modify the PDF to have corrected Seed Values. |

|  Code  | ALC-DSS-305-015 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Legal Attestations Seed Value enforcement failed. |
|  Action  |Legal Attestation strings as an Input do not match with the Seed Value. Modify the input or PDF. |

|  Code  | ALC-DSS-305-016 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Subjects missing in seed value. |
|  Action  |Subject constraint is enforced in Seed Value while no Subject values are provided. Correct the Seed Values in the PDF. |

|  Code  | ALC-DSS-305-017 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Issuers missing in seed value. |
|  Action  |Issuers constraint was enforced in Seed Value while no Issuer certificates are present. Correct the seed values in input PDF. |

|  Code  | ALC-DSS-305-018 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |OID not present in the seed value. |
|  Action  |OID constraint is enforced in Seed Value while no OIDs are present. Correct the Input PDF with proper seed values. |

|  Code  | ALC-DSS-305-019 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Insufficient {0} permissions in the input PDF for performing the operation {1} on Signature Field {2}. |
|  Action  |Unlock or decrypt the input PDF so that the permissions are present for the operation. |

|  Code  | ALC-DSS-305-020 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |SubFilter present in seed value is not supported. |
|  Action  |Subfilter is not supported as specified in Seed Value. Modify the PDF with correct Subfilter seed values. |

|  Code  | ALC-DSS-305-021 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |No URL specified for time stamp server. |
|  Action  |Timestamp Seed Value does not contain any URL. Correct the input PDF seed values. |

|  Code  | ALC-DSS-305-022 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Unsupported Seed Value version. |
|  Action  |Seed Value version is not supported. Correct the Input PDF Seed Values. |

|  Code  | ALC-DSS-305-023 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Archiving of Revocation Info is required as per Seed Value. |
|  Action  |Revocation information could not be archived as per constraint in Seed Value. Ensure that the signer and its chain have revocation fetching information and revocation responders are available. |

|  Code  | ALC-DSS-305-024 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Unsupported Digest Methods in seed Value. |
|  Action  |Digest Methods enforced in Seed Value are not supported. Correct the Input PDF Seed Values. |

|  Code  | ALC-DSS-305-025 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |ASSP Credential URLType is unsupported, but required in Seed Value. |
|  Action  |Remove the URLType ASSP entry from the Seed Value in the PDF. |

|  Code  | ALC-DSS-305-026 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Subject DN of signed does not match with any of the ones specified in Seed Value. |
|  Action  |Add the Subject DN of the signer in the Seed Value, or modify the signer credential. |

|  Code  | ALC-DSS-305-027 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |KeyUsage of signer does not match as per Seed Value. |
|  Action  |Modify the Signer credential or the Seed Value to match the Key Usages. |

|  Code  | ALC-DSS-305-028 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Subfilter does not support archiving of revocation info as required by Seed Value |
|  Action  |Mismatch between archiving and subfilter constraint. Modify the Seed Value so that they do not clash. |

|  Code  | ALC-DSS-305-029 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot parse the certificates in certificate seed value. |
|  Action  |Verify that the certificates embedded in seed value for errors. |

|  Code  | ALC-DSS-305-030 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Timestamp required as per Seed Value Constraints. |
|  Action  |Timestamp could not be retrieved as enforced in SV. Verify that the timestamp server is online and functioning. |

|  Code  | ALC-DSS-305-031 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Subfilter does not support addition of Timestamp which is required as per Seed Value. |
|  Action  |Mismatch between subfilter and timestamp constraints in Seed Value. Modify the seed value to avoid this mismatch. |

|  Code  | ALC-DSS-306-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The algorithm {0} is not available. |
|  Action  |Modify the input algorithm. |

|  Code  | ALC-DSS-306-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |There was an error computing the {0} signature. |
|  Action  |Contact Adobe Technical Support with the signer credential and PDF. |

|  Code  | ALC-DSS-306-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot calculate the size of the {0} signature. |
|  Action  |Contact Adobe Technical Support with the signer credential and PDF. |

|  Code  | ALC-DSS-306-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Exception when initializing the PKCS1 verifier. {0} |
|  Action  |Contact Adobe Technical Support with the signer credential and PDF. |

|  Code  | ALC-DSS-306-005 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Exception when validating PKCS1 signature. {0} |
|  Action  |Contact Adobe Technical Support with the signer credential and PDF. |

|  Code  | ALC-DSS-306-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Problem encountered when DER encoding the {0} attribute. |
|  Action  |Contact Adobe Technical Support with the signer credential and PDF. |

|  Code  | ALC-DSS-306-007 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Error retrieving {0} before signing. |
|  Action  |Contact Adobe Technical Support with the signer credential, PDF, and input parameters. |

|  Code  | ALC-DSS-306-008 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Exception when validating PKCS7 signature. {0} |
|  Action  |Contact Adobe Technical Support with the signer credential, PDF, and input parameters. |

|  Code  | ALC-DSS-306-009 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot get public key of the credential. |
|  Action  |Contact Adobe Technical Support with the signer credential, PDF, and input parameters. |

|  Code  | ALC-DSS-306-010 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot create the message digester. |
|  Action  |Contact Adobe Technical Support with the signer credential, PDF, and input parameters. |

|  Code  | ALC-DSS-306-011 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Exception in creating keystore of type {0} due to {1}. |
|  Action  |Contact Adobe Technical Support with the signer credential, PDF, and input parameters. |

|  Code  | ALC-DSS-306-012 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Exception in construction of HSM Provider. |
|  Action  |The provider seems to be created from outside the application. Ensure that some other application in the same JVM is not working with the same HSM slot as the LiveCycle server. |

|  Code  | ALC-DSS-306-013 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Illegal State Exception. Error in releasing lock after operation. |
|  Action  |Review the logs for more detailed error messages and contact Adobe Technical Support. |

|  Code  | ALC-DSS-306-014 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Null keystore. |
|  Action  |Review the logs for more detailed error messages and Contact Adobe Technical Support. |

|  Code  | ALC-DSS-306-015 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Internal Error. Unable to generate {0} thumbprints of certificates for matching. |
|  Action  |Verify that the JVM has a JCE provider capable of calculating hash value according to the cryptographic hash function mentioned in the error message. Alternatively, use the certificate instead of certificate SHA1 in the HSM Profile. |

|  Code  | ALC-DSS-309-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Digest Algorithm {0} is not FIPS compliant. |
|  Action  |Provide a FIPS-compliant algorithm or turn off the FIPS mode. |

|  Code  | ALC-DSS-309-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Encryption key {0} with keylength {1} is not FIPS compliant. |
|  Action  |Provide an FIPS-compliant algorithm/keylength or turn off the FIPS mode. |

|  Code  | ALC-DSS-309-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Encryption key could not be checked for FIPS compliance. |
|  Action  |Provide a FIPS-compliant key or turn off the FIPS mode. |

|  Code  | ALC-DSS-309-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Signature Algorithm {0} is not FIPS compliant. |
|  Action  |Provide a FIPS-compliant algorithm or turn off the FIPS mode. |

|  Code  | ALC-DSS-311-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot recover SlotListIndex from given SlotId. The operation requires "suppressAccessChecks" Reflection in the java policy file on IBM JVM. |
|  Action  |Create the PKCS#11 JCE provider on IBM JVM using the slot ID. LiveCycle requires the permission java.lang.reflect.ReflectPermission "suppressAccessChecks". This permission can be set in two places. Set the permission in the java.policy file used by the application server to set the policies. Or set the permission in the slot list index of the slot be used in the HSM Profile instead of Slot ID. |

|  Code  | ALC-DSS-311-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Exception thrown from PKCS11 implementation when recovering SlotListIndex from SlotInfo {0} of Type {1}. |
|  Action  |Ensure that LiveCycle can connect to the HSM device through the network. |

|  Code  | ALC-DSS-311-003 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The HSM device is in an Inconsistent state with respect to the Application Server.(Could be a result of abrupt termination of open sessions due to device restart). |
|  Action  |Restart LiveCycle and try the operation again. If still the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-DSS-311-004 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Incorrect PIN for HSM device. |
|  Action  |Check the pin of the HSM partition (slot) and correct it in the HSM Profile. |

|  Code  | ALC-DSS-300-021 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The input PDF is encrypted using {0} and could not be opened, hence the operation {1} cannot be performed on the document. |
|  Action  |Provide a document to the operation which is decrypted or if encrypted, is unlocked in a process. |

|  Code  | ALC-DSS-303-022 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The specified Credential Alias {0} cannot be used for signing/certification as it is a Reader Extensions credential |
|  Action  |Ensure that the credential used for signing is marked for "Document Signature" in Trust Store. |

|  Code  | ALC-DSS-303-023 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Script Modification is not allowed during signature operations |
|  Action  |Remove script modifying scripts in the document to enable signing. Note: If a document contains certain scripts that modify themselves or other scripts, then any changes during signing cannot be audited in the signed document. Hence, signing is disabled on any such documents. |

|  Code  | ALC-DSS-304-009 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Could not verify document. |
|  Action  |Document could not be verified due to an unknown reason. Contact technical support with full stack trace. |

|  Code  | ALC-DSS-311-005 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |HSM support in LC requires "suppressAccessChecks" Reflection Permission in the java policy file on Sun JVM. |
|  Action  |Update the Java policy file with the permission for suppressAccessChecks added. |

|  Code  | ALC-DSS-311-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid PKCS11 Library. |
|  Action  |Verify the library path and type on the server. Ensure that it is compatible with the JVM on which LC is being run (32-bit or 64-bit). |

|  Code  | ALC-DSS-311-007 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Unknown Error caused by {0}. |
|  Action  |Contact technical support with the error message and stack trace. Also provide the server logs with FINEST level logging. |

|  Code  | ALC-DSS-311-008 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Unsupported PKCS11 JCE Provider version. |
|  Action  |Provide a compatible PKCS#11 JCE Provider in the LC JVM. |

|  Code  | ALC-DSS-311-009 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |PKCS11 JCE Provider not present. |
|  Action  |Provide a PCKCS#11 JCE provider in the LiveCycle JRE. |

|  Code  | ALC-DSS-311-010 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |PKCS11 lib {0} unable to connect to HSM due to {1}. |
|  Action  |The LiveCycle system is not configured properly to connect to the HSM. Check the status of the HSM profile in the Trust Store HSM page. |

|  Code  | ALC-DSS-311-011 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |PKCS11 Object {0} not found on HSM. |
|  Action  |The object specified cannot be found on the HSM. Check the status of the HSM profile in the Trust Store HSM page. |

|  Code  | ALC-DSS-311-012 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Detected Deletion of Objects on HSM. LIveCycle ES2 is not in sync with HSM Device. Delete the HSM Profiles from Truststore mapped to now stale HSM Objects. |
|  Action  |Re-evaluate the HSM Profiles. Ensure that the profiles are present in both the LiveCycle system and on the HSM. |

|  Code  | ALC-DSS-304-010 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Error during Addition of Validation Info to the specified Signature Field. |
|  Action  |  |

|  Code  | ALC-DSS-304-011 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |VRI is being added to a signature signed using a self signed certificate. |
|  Action  |Since VRI cannot be added for self signed certificate signatures, such signatures are not a candidate for this operation |

|  Code  | ALC-DSS-304-012 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The signature for which the validation information is being added is not a PKCS#7 signature. |
|  Action  |Non PKCS#7 signatures are not candidates for long-term revocation information addition. |

|  Code  | ALC-DSS-304-013 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The author signature on the document mandates no changes to it. Addition of validation information would thus, break the signature. |
|  Action  |Certified Documents with DocMDP stated to NoChanges are not candidates for validation information addition. |

|  Code  | ALC-DSS-304-014 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |The signature for which the validation information is to be added is not valid currently. Since adding validation information would only be helpful if the signature is valid at current time, the operation is terminating. |
|  Action  |Ensure that the signature is valid at the current time. |

|  Code  | ALC-DSS-304-015 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Another signature in the document has locked the document to prevent any changes. Addition of validation information would break that signature. Similar to ALC-DSS-304-013 except here it is due to another recipient signature (FieldMDP). |
|  Action  |Make sure that there is not another signature field that has locked the document. |

|  Code  | ALC-DSS-304-016 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Revocation Information to be added could not be retrieved or evaluated to invalid. |
|  Action  |Run the operation under trace logging. Also make sure that the LiveCycle server can connect to the OCSPResponders and the CRL distribution points. Finally make sure that the trust settings for the concerned trust anchors are correct in the truststore. |

|  Code  | ALC-DSS-305-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Seed value specifies that signature field can only be certified. Call certify instead. |
|  Action  |Certify the field instead of signing, as Seed Values mandate it. |

|  Code  | ALC-DSS-304-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |PreRelease signature is not supported. |
|  Action  |The signature is marked as PreRelease signed. Provide a non-PreRelease marked signature for validation. |

|  Code  | ALC-DSS-304-006 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |PreRelease signature is not supported. |
|  Action  |The signature is marked as PreRelease signed. Provide a non-PreRelease marked signature for validation. |

|  Code  | ALC-DSS-203-003 (Document Security) |
|---|---|
|  Type  |Warning |
|  Cause  |Opacity provided for logo pdf for creating Signature field appearance is invalid. |
|  Action  |Provide value between 0 and 1. |

|  Code  | ALC-DSS-203-006 (Document Security) |
|---|---|
|  Type  |Warning |
|  Cause  |Problem in signature validation |
|  Action  |Contact Support |

|  Code  | ALC-DSS-203-007 (Document Security) |
|---|---|
|  Type  |Warning |
|  Cause  |Problem in validating signer's identity |
|  Action  |Contact Support |

|  Code  | ALC-DSS-203-009 (Document Security) |
|---|---|
|  Type  |Warning |
|  Cause  |Error in parsing signature PKCS#7 Blob |
|  Action  |Contact Support |

|  Code  | ALC-DSS-203-012 (Document Security) |
|---|---|
|  Type  |  |
|  Cause  |Signature PKCS#7 blob is invalid |
|  Action  |Contact Support |

|  Code  | ALC-DSS-203-014 (Document Security) |
|---|---|
|  Type  |Warning |
|  Cause  |Timestamp in the signature is not trusted. |
|  Action  |Make sure that the Timestamp Authority CA is trusted in Trusstore |

|  Code  | ALC-DSS-203-015 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Timestamp token returned from the Timestamp server is longer than the length supplied in the timestamp preferences in the Signatures Admin page |
|  Action  |Provide a longer value for the Timestamp size in the Signature Admin page |

|  Code  | ALC-DSS-203-016 (Document Security) |
|---|---|
|  Type  |  |
|  Cause  |Adding/Modifying the signature field with provided seed value options is not possible since that requires a full document save and that would break the existing signatures in the document |
|  Action  |Change field values as supported in input document pdf version |

|  Code  | ALC-DSS-210-001 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Error in fetching data from LC Truststore |
|  Action  |Contact support |

|  Code  | ALC-DSS-210-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |LiveCycle needs to contact an external resource over the network but the instance wide/ operation specific preferences forbid it to do so. |
|  Action  |Uncheck the Transport Disabled option in the Signatures Admin UI or pass the enabled flag in the operation API |

|  Code  | ALC-DSS-300-000 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Undocumented Error |
|  Action  |Contact support |

|  Code  | ALC-DSS-305-032 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |LiveCycle does not support AppearanceFilter seed value |
|  Action  |Modify the unsupported signature field seed value |

|  Code  | ALC-DSS-310-002 (Document Security) |
|---|---|
|  Type  |Error |
|  Cause  |Exception in contacting an external resource |
|  Action  |contact support |

|  Code  | ALC-DSS-310-&ast;&ast;&ast; (Document Security) |
|---|---|
|  Type  |Warning |
|  Cause  |Internal PKI Errors |
|  Action  |Contact Support |

|  Code  | ALC-ENC-1&ast;&ast;-&ast;&ast;&ast; (Document Security) |
|---|---|
|  Type  |  |
|  Cause  |Trace Message to be provided for debugging. Not visible when operating in production mode. |
|  Action  |Contact System Support |

|  Code  | ALC-DSS-203-001 (Document Security) |
|---|---|
|  Type  |Warning |
|  Cause  |Signature Field to be added is bigger than available area. It will be automatically trimmed |
|  Action  |Provide a smaller width,height for the input PositionRectangle |

## Encryption error codes {#encryption-error-codes}

|  Code  | ALC-ENC-100-002 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Private key used for Decryption is invalid. |
|  Action  |Provide the private key corresponding to the public key(certificate) used for encryption. |

|  Code  | ALC-ENC-100-003 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Certificate format is not correct. Acceptable certificates formats are X509 and PEM certs. |
|  Action  |Provide a valid certificate format supported by the service. |

|  Code  | ALC-ENC-100-004 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Input value to the EncryptionService is invalid. |
|  Action  |Provider a valid value for the input mentioned in the error message. |

|  Code  | ALC-ENC-100-005 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Input document to the EncryptionService is signed, hence can not be encrypted. |
|  Action  |Provide unsigned documents for encryption or clear signature fields in the provided signed document before changing security settings of the document. |

|  Code  | ALC-ENC-100-006 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Input document is already encrypted. |
|  Action  |Provide a decrypted document for encryption or unlock the encrypted document first before trying to re-encrypt. For the latter technique, ensure that the recipient of the encrypted document has the permission to change the security settings. These permissions are granted at the time of initial encryption. |

|  Code  | ALC-ENC-100-007 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Certificate to be used for encryption not found in the certificate store (LDAP, truststore, or document). |
|  Action  |If using truststore, ensure the certificate with the input alias is present. If using LDAP, ensure that the certificates exist on the LDAP for the input LDAP URI. If using com.adobe.idp.Document, ensure that the document is initialized with a proper certificate file. |

|  Code  | ALC-ENC-100-008 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |FIPS Compliance failure. FIPS compliance check is on and the operation is not FIPS compliant for the given inputs. |
|  Action  |Verify that ACRO_6 compatibility is not being used for certificate encryption when FIPS compatibility is desired. Also, verify that the certificate being used for encryption is using RSA algorithm. The keysize of this algorithm is greater than or equal to 1024 bits and less than or equal to 4096 bits. |

|  Code  | ALC-ENC-100-009 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The certificate being used for document encryption is already expired at the time of the operation call as per the system time of the server machine. |
|  Action  |Provide a valid non-expired certificate as per the notAfter field in the certificate. |

|  Code  | ALC-ENC-100-010 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The certificate being used for document encryption is not yet valid at the time of the operation call as per the system time of the server machine. |
|  Action  |Provide a certificate which is valid at the current date and time as per the notBefore field in it. |

|  Code  | ALC-ENC-100-011 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The certificate used for document encryption does not have the correct key usage. Key Usages required are keyEncipherment or dataEncipherment. |
|  Action  |Provide a certificate with the correct key usage. |

|  Code  | ALC-ENC-100-012 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The document being decrypted is not encrypted in the corresponding fashion. For e.g. if the document is certificate encrypted and the decryption is carried out using a password, then an exception with this error code is generated. |
|  Action  |Verify that the certificate (password) secure document is not being unlocked using a password(private key). |

|  Code  | ALC-ENC-100-013 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The credential(private key) to be used for document decryption could not be retrieved from the truststore alias provided to the decryption operation. |
|  Action  |Verify that the alias provided to the EncryptionService for document decryption exists in truststore. |

|  Code  | ALC-ENC-100-014 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Internal error. |
|  Action  |Review the logs for more detailed errors, and contact Adobe Technical Support. |

|  Code  | ALC-ENC-100-015 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The document input to the encryption operation is reader extended and can not be encrypted. |
|  Action  |Provide a non-reader extended document to the EncryptionService. |

|  Code  | ALC-ENC-100-016 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The operation invoked can not succeed due to insufficient privilege. For e.g. removal of encryption by a recipient not authorised to remove encryption as per permissions granted at the time of encryption. |
|  Action  |Ensure that the recipient has the permission to perform the operation on the encrypted document. |

|  Code  | ALC-ENC-100-017 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The recipient object input to the operation encryptPDFUsingCertificates has been instantiated with multiple sources of certificate retrieval. Only one is allowed, either Truststore or an LDAP server or a certificate document. |
|  Action  |Do not set multiple sources for certificates in the Recipient object. Instead, multiple Recipient objects can be used. |

|  Code  | ALC-ENC-100-018 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The recipient object input to the operation encryptPDFUsingCertificates has been instantiated with no source of certificate retrieval. |
|  Action  |Provide one source of certificates in the Recipient object. It could be either com.adobe.idp.Document, or an LDAP URL or a truststore certificate alias. |

|  Code  | ALC-ENC-100-019 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |ACRO_9 compatibility while document encryption uses 256 bit AES encryption, which requires JCE unlimited strength jurisdiction policy files to be installed on the JVM. |
|  Action  |Install the JCE unlimited strength jurisdiction policy files for your JVM. The files can be downloaded from the vendor internet site. |

|  Code  | ALC-ENC-100-020 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The service has been called in the FIPS compliant mode while the certificate being used for document encryption is not FIPS complaint since its encryption algorithm is not FIPS compliant. |
|  Action  |Use a different certificate from the same entity with algorithm and key size FIPS compliant or call the operation in non-FIPS compliant mode. |

|  Code  | ALC-ENC-100-021 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |The service has been called in the FIPS compliant mode while the certificate being used for document encryption is not FIPS complaint since its key size is not FIPS compliant. |
|  Action  |Use a different certificate from the same entity with algorithm and key size FIPS compliant or call the operation in non-FIPS compliant mode. |

|  Code  | ALC-ENC-100-022 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Password Based Encryption is not FIPS compliant. |
|  Action  |Make sure that password encryption operations are called only when the FIPS mode is off. |

|  Code  | ALC-ENC-100-023 (Encryption) |
|---|---|
|  Type  |  |
|  Cause  |Remove PDF Security has been called on an unlocked document. This works only for documents that have been unlocked using the corresponding unlock operations. |
|  Action  |Either call the unlock operation before (works only for IN_VM endpoint) or use the removePasswordSecurity or removeCertificateSecurity operations. |

|  Code  | ALC-ENC-100-024 (Encryption) |
|---|---|
|  Type  |Error |
|  Cause  |Target XML Node meant to be encrypted not found in the input XML document |
|  Action  |Check the XPath supplied to XML Encryption against the input XML. |

|  Code  | ALC-ENC-100-025 (Encryption) |
|---|---|
|  Type  |Warning |
|  Cause  |Multiple XML Nodes match the XPath supplied for XML Encryption. Only the first matching node is used for Encryption |
|  Action  |If a repeating XML Node is required to be encrypted, the way to go is to encrypt the common ancestor node. |

|  Code  | ALC-ENC-100-026 (Encryption) |
|---|---|
|  Type  |Error |
|  Cause  |XPath supplied to identify encryption target xml node does not resolve to an element node. |
|  Action  |Check the supplied XPath against the supplied input XML. |

|  Code  | ALC-ENC-100-027 (Encryption) |
|---|---|
|  Type  |Error |
|  Cause  |Either the input XML is malformed or the input XML already contains an encrypted section with id attribute equal to the id attribute supplied for fresh encryption |
|  Action  |Make sure that the xml input is well formed. In case of xml encryption also check that the id supplied is not already present in any encrypted section of the input xml. |

|  Code  | ALC-ENC-100-028 (Encryption) |
|---|---|
|  Type  |Error |
|  Cause  |Two recipients supplied to XML Encryption are trying to encrypt xml nodes where one is ancestor of another. This is unsupported functionality. This is since this makes it difficult to understand how to deal with intermediate nodes b/w ancestor and child. |
|  Action  |If the use case requires encrypting two nodes for different recipient where one is ancestor of another, the customer can try to encrypt the ancestor node for both recipients. |

## FDI error codes {#fdi-error-codes}

|  Code  | ALC-FDI-001-301 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Input document is not a valid PDF. |
|  Action  |Ensure that input Document is a valid PDF. |

|  Code  | ALC-FDI-001-302 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Input document is not a PDF form. |
|  Action  |Ensure that input document is a PDF form. |

|  Code  | ALC-FDI-001-303 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Input data is either null or in a format that is not supported. |
|  Action  |Ensure that input data is not null and is in the correct format. |

|  Code  | ALC-FDI-001-304 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Input data is not in XDP format. |
|  Action  |Ensure that input data is in XDP format. |

|  Code  | ALC-FDI-001-305 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Failed to merge data with PDF form. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-FDI-001-306 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Failed to merge the data descriptions. |
|  Action  |Contact system administrator. |

|  Code  | ALC-FDI-001-309 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Unable to import data to the input PDF document as it either has a certifying signature that does not permit any changes or it does not allow filling of form fields. |
|  Action  |Form changes are not allowed in the certified PDF form. Use a different form. |

|  Code  | ALC-FDI-001-307 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Processing importData operation on source document. |
|  Action  |No action is required; a DEBUG level entry. |

|  Code  | ALC-FDI-001-308 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Processing exportData operation on source document. |
|  Action  |No action is required; a DEBUG level entry. |

|  Code  | ALC-FDI-001-310 (FDI) |
|---|---|
|  Type  |  |
|  Cause  |Input is a flat PDF with no data. |
|  Action  |Emsire that your input is not a flat PDF. |

## File Provider error codes {#file-provider-error-codes}

|  Code  | FILEPROVIDER.5023 (File Provider) |
|---|---|
|  Type  |  |
|  Cause  |While configuring a watched folder endpoint in Applications and Services in LiveCycle Administration Console, if the specified URL is already in use by a service, this error is logged: FILEPROVIDER.5023: com.adobe.idp.dsc.service.file.impl.FileProviderRuntimeException: This folder is already in use by . |
|  Action  |Use a different URL, or remove the existing watched folder endpoint in that URL for service. |

|  Code  | [FileResultHandlerImpl] Failed to write---------Failure Time----Tue Mar (File Provider) |
|---|---|
|  Type  |  |
|  Cause  |The following error is written to the application server log when a watch folder is set up in a location where the application server does not have proper permissions to read/write/delete from: 10:59:42,453 INFO [FileResultHandlerImpl] Failed to write---------Failure Time----Tue Mar 20 10:59:42 CST 2007 Job id id ---- null source location ---- null Reasons for failure are ----File Provider Failure null to the failure folder. |
|  Action  |Ensure that the watch folders are located in a place where the application server has read/write/delete (including create directory) permissions. |

## File Utilities error codes {#file-utilities-error-codes}

|  Code  | ALC-FUT-001-001 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |The target file cannot be overwrote. |
|  Action  |Check the permission of the target file and make sure that it is writable. |

|  Code  | ALC-FUT-001-002 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |The target file cannot be deleted. |
|  Action  |Check the target file and make sure that it can be deleted. |

|  Code  | ALC-FUT-001-003 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |The target directory cannot be created. |
|  Action  |Check the parent directory and make sure a sub directory can be created. |

|  Code  | ALC-FUT-001-004 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to create parent directories for the target directory. |
|  Action  |Check the permissions related to the parent directory of the directories that cannot be created |

|  Code  | ALC-FUT-001-005 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to rename file {0} to {1}. |
|  Action  |Make sure that the old file is not in use and the new name is valid. |

|  Code  | ALC-FUT-001-006 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to set file {0} to read only. |
|  Action  |Check the permission of the file and make sure that its attribute can be changed. |

|  Code  | ALC-FUT-001-007 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Syntax error in the regular expression {0}. |
|  Action  |Correct the syntax error in the regular expression. |

|  Code  | ALC-FUT-001-008 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to read document {0}. |
|  Action  |Check the Caused By section of the error message. |

|  Code  | ALC-FUT-001-009 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to read Xml document {0}. |
|  Action  |Check the Caused By section of the error message. |

|  Code  | ALC-FUT-001-010 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to read String document {0}. |
|  Action  |Check the Caused By section of the error message. |

|  Code  | ALC-FUT-001-011 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |File {0} does not exist. |
|  Action  |Create the file. |

|  Code  | ALC-FUT-001-012 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to list contents of directory {0}. |
|  Action  |Check the Caused By section of the error message. |

|  Code  | ALC-FUT-001-013 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to write document {0}. |
|  Action  |Check the Caused By section of the error message. |

|  Code  | ALC-FUT-001-014 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to write Xml document {0}. |
|  Action  |Check the Caused By section of the error message. |

|  Code  | ALC-FUT-001-015 (File Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to write String document {0}. |
|  Action  |Check the Caused By section of the error message. |

## Forms error codes {#forms-error-codes}

|  Code  | ALC-CMN-001-801 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Forms Config EJB could not be initialized. |
|  Action  |Contact your system administrator. |

|  Code  | ALC-FRM-001-001 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The parameter is missing. |
|  Action  |Specify the parameter. |

|  Code  | ALC-FRM-001-002 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The transformation ID cannot be determined based on the provided inputs. The useragent string may be the cause; it may not be recognized/supported. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-FRM-001-003 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The format of the useragent string is invalid. |
|  Action  |Verify the useragent value. |

|  Code  | ALC-FRM-001-004 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Failed to look up the XMLForm service or Font Manager service. |
|  Action  |Verify that these services have started properly. |

|  Code  | ALC-FRM-001-005 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |FDF or XFDF (alone) has been passed in with incompatible clientCache option pass. |
|  Action  |Verify that the data is in the correct format. |

|  Code  | ALC-FRM-001-006 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load template from the specified URI. |
|  Action  |Verify that contentRootURI and formQuery API parameters are correct. |

|  Code  | ALC-FRM-001-010 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Format of XDP data is invalid. |
|  Action  |Verify the format of data. |

|  Code  | ALC-FRM-001-011 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The options format does not comply with Form ES expected format. |
|  Action  |Update the option. |

|  Code  | ALC-FRM-001-012 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value specified for option. |
|  Action  |Verify the option value. |

|  Code  | ALC-FRM-001-013 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |XMLForm failed to render the form. |
|  Action  |Verify the format of template. |

|  Code  | ALC-FRM-001-014 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Forms ES invoked XMLForm but received a failure in response. |
|  Action  |Review the log for more details. |

|  Code  | ALC-FRM-001-015 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Content type of submitted data is not supported. |
|  Action  |Verify that data is getting submitted in correct format. |

|  Code  | ALC-FRM-001-016 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |A parse error has been encountered while processing internal XML data. Invalid data may have been passed to the API. |
|  Action  |Verify any XML data passed in is well-formed. |

|  Code  | ALC-FRM-001-018 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The specified file is not available. |
|  Action  |Update the file path or verify the API parameter values such as the ContentRootURI value. |

|  Code  | ALC-FRM-001-019 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An invalid URL is specified. |
|  Action  |Update the URL and verify the API parameter values, such as BaseURL. |

|  Code  | ALC-FRM-001-020 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The data is not matched with the data type or corrupted. |
|  Action  |Verify and validate the data. |

|  Code  | ALC-FRM-001-021 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An invalid URI is specified. |
|  Action  |Update the URI. |

|  Code  | ALC-FRM-001-022 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An unexpected exception has occurred. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-FRM-001-023 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The specified transformation is not supported. |
|  Action  |Verify the value of the API parameterformPerference. |

|  Code  | ALC-FRM-001-024 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The environment buffer passed to the API is not correct. |
|  Action  |Verify that the environment buffer value is not null. |

|  Code  | ALC-FRM-001-025 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The request buffer passed to the API is not correct. |
|  Action  |Verify that the request buffer value is not null. |

|  Code  | ALC-FRM-001-026 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The cache directory configuration is not correct. |
|  Action  |The cache directory is based on data specified by the Form configuration. Verify the cache configuration. |

|  Code  | ALC-FRM-001-027 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Failed to lookup the Forms service configuration EJB. |
|  Action  |The Forms service configuration EJB is deployed as part of LiveCycle archive. Verify that all components of the archive deploy successfully. |

|  Code  | ALC-FRM-001-028 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Caching has been disabled because of unexpected error. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-FRM-001-032 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load XCI file. |
|  Action  |Verify that correct XCI URL is specified in options API parameter. |

|  Code  | ALC-FRM-001-033 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The options specified are not compatible. |
|  Action  |Adjust the options parameter. |

|  Code  | ALC-FRM-001-034 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Failed to initialize the default values of options. |
|  Action  |Verify that Forms configuration EJB is initialized properly. |

|  Code  | ALC-FRM-001-035 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Failed to retrieve the template contents. |
|  Action  |Verify that FormsQuery and ContentRootURI are specified correctly. |

|  Code  | ALC-FRM-001-036 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load updated version of Template. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-FRM-001-037 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load updated version of Template. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-FRM-001-040 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Your service is not initialized properly. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-FRM-001-041 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The Forms service does not support PDF/A transformation. |
|  Action  |Use Output service for generating PDF/A transformations. |

|  Code  | ALC-FRM-001-042 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The Reader Extensions service is not deployed. |
|  Action  |To add usage rights to a form, the Reader Extension service is required. Ensure that Reader Extensions service is deployed. |

|  Code  | ALC-FRM-001-043 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The format of supplied PDF form is unsupported. |
|  Action  |Ensure that the supplied PDF is an XFA form or a form created in Acrobat. |

|  Code  | ALC-FRM-001-045 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The Acrobat version passed in the options is not supported. |
|  Action  |Ensure that correct Acrobat version is passed in options. |

|  Code  | ALC-FRM-001-046 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Value of the specified input parameter is null. |
|  Action  |Pass a blank value of the specified parameter. |

|  Code  | ALC-FRM-001-048 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Forms with usage rights cannot be linearized. |
|  Action  |Ensure that Linearized option is not enabled if the form has usage rights applied. |

|  Code  | ALC-FRM-001-008 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An attempt was made to translate the layout of a PDF or Image. |
|  Action  |Review the LiveCycle logs for more details. |

|  Code  | ALC-FRM-001-017 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Forms failed to render the form. |
|  Action  |Review the log for more details. |

|  Code  | ALC-FRM-001-029 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An unexpected problem has happened. |
|  Action  |Review the log files and contact the system administrator. |

|  Code  | ALC-FRM-001-049 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Multiple attachments with the same file name exist. |
|  Action  |Ensure that multiple attachments with the same name do not exist. |

|  Code  | ALC-FRM-001-050 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |A null response was received from Forms when trying to render the form. |
|  Action  |Verify the format of the form design, and see the logs for more details. |

|  Code  | ALC-FRM-001-051 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while creating credential array. |
|  Action  |Review the User Credentials set. |

|  Code  | ALC-FRM-001-052 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while extracting request information from callback invocation. |
|  Action  |Verify that valid request information, for example Form Query, Content Root URI, and Timestamp are being sent. |

|  Code  | ALC-FRM-001-053 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Unable to make changes to the input PDF document as it either has a certifying signature that does not permit any changes or it does not allow filling of form fields. |
|  Action  |Verify that the PDF has a certifying signature that does not permit any changes. |

|  Code  | ALC-FRM-001-054 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The document supplied as input is not a PDF form capable of supporting data merge. |
|  Action  |Input a PDF form capable of supporting data merge. |

|  Code  | ALC-FRM-001-055 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |A [PDFSecurity] exception thrown while unlocking the encrypted document. |
|  Action  |Verify that the PDF is password protected. Forms cannot render a password protected PDF. |

|  Code  | ALC-FRM-001-056 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |A [PDFSecurity) exception thrown while getting the document's interactive form (Acroform) dictionary. |
|  Action  |Verify that the PDF is password protected. Forms cannot render a password protected PDF. |

|  Code  | ALC-FRM-001-104 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while loading options. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-FRM-001-701 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |The ServiceUtil service is already initialized with service: FormsService. Aborting Cache re-initialization. |
|  Action  |The cache cannot be reinitialized for the service. Contact the system administrator. |

|  Code  | ALC-FRM-001-702 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value for Max Document size in cache, so the default value will be used. |
|  Action  |Verify if a valid integer value has been configured for the Max Document size in cache. |

|  Code  | ALC-FRM-001-703 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while initializing the cache from startup. |
|  Action  |Review the log for more details. |

|  Code  | ALC-FRM-001-704 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while closing the cache. |
|  Action  |Review the log for more details. |

|  Code  | ALC-FRM-001-705 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while reading cache config stream. |
|  Action  |Review the log for more details. |

|  Code  | ALC-FRM-001-706 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while creating cache config stream. |
|  Action  |Review the log for more details. |

|  Code  | ALC-FRM-001-801 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Forms Config EJB could not be initialized. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-FRM-001-501 (Forms) |
|---|---|
|  Type  |Info |
|  Cause  |This error code is used for logging context specific messages. The messages are self explanatory. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-502 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Generated snap-in name. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-503 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |This error message returns the number of bytes returned. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-504 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |This error message is used for logging the XDC name. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-505 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |This error message is used for logging the context name. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-508 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |This error message is used for logging the PDF version of the rendered PDF. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-511 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |This error message is used for logging the method entered while processing. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-512 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |This error message is used for logging the method exited while processing. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-513 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |This error message indicates that the Merge/Calculate will not be performed. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-514 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Forms should have removed the Overlay Data. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-515 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Incompatible Form model: Form may render incorrectly. Form has some server side scripts which may not be executed as the value of FormModel is set to Client. |
|  Action  |Verify that the form has server-side scripts which may not be executed. |

|  Code  | ALC-FRM-001-707 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Starting LiveCycle Forms ES. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-708 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Stopping LiveCycle Forms ES. |
|  Action  |No action needed. |

|  Code  | ALC-FRM-001-058 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |A valid path component cannot be retrieved from the [repositoryURI]. The path component retrieved is null or empty. When Content Root URI refers to a repository location then it should conform to the format: repository://authority/form location. For example if Form to Render is set as formName, and Content Root URI is set as repository:/a/b/, then authority is null and form path is resolved as /a/b/formName. Similarly, if Content Root URI is set as repository:///a/b/, then authority is empty and form path is /a/b/formName. If Form to Render is set as /formName and Content Root URI is set as repository: //a/b, then authority is a and form path is /b/formName. |
|  Action  |Ensure the [repositoryURI] value is not null or empty. |

|  Code  | ALC-FRM-001-059 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred when trying to read a resource from repository with an invalid URI. |
|  Action  |Verify that the repository content root URI begins with repository: |

|  Code  | ALC-FRM-001-068 (Forms) |
|---|---|
|  Type  |  |
|  Cause  |Exception in resolving assetURI : {0} to a full repository path. This assetURI will be used as it is. |
|  Action  |The asset URI you have specified is used as a disk path. |

|  Code  | FSC001 (Forms) |
|---|---|
|  Type  |Info |
|  Cause  |The forms configuration property has been changed |
|  Action  |No action needed. This is just a information log for forms configuration changes done using forms administration. |

|  Code  | FSC003 (Forms) |
|---|---|
|  Type  |Info |
|  Cause  |Starting Form Server MBean Service |
|  Action  |No action needed |

|  Code  | FSC004 (Forms) |
|---|---|
|  Type  |Info |
|  Cause  |Stopping Form Server MBean Service |
|  Action  |no action needed |

|  Code  | FSC006 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to commit the forms configuration property to the database |
|  Action  |Contact the System Administrator |

|  Code  | FSC008 (Forms) |
|---|---|
|  Type  |Info |
|  Cause  |Using the database to access and persist configuration properties. |
|  Action  |no action needed |

|  Code  | FSC009 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |No database was found, configuration properties will not be persisted. |
|  Action  |Contact the system administrator |

|  Code  | FSC010 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to start mbean. |
|  Action  |Contact the system administrator |

|  Code  | FSC012 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to increment Admin Version in cluster cache. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-FRM-001-057 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot render the input PDF since it is secured and could not be unlocked. The input PDF might be password protected or policy protected. |
|  Action  |Check if the input pdf is password protected or policy protected |

|  Code  | ALC-FRM-001-060 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to read cache file after validating it. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-FRM-001-061 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Cache may be in inconsistent state. Unable to read cached file. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-FRM-001-062 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to remove empty Acroform element. |
|  Action  |Verify the input form or contact the System Administrator |

|  Code  | ALC-FRM-001-063 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to retrieve the resource |
|  Action  |Check the resource URI |

|  Code  | ALC-FRM-001-064 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Ignoring the external entity reference since external entity resolution is turned off. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-FRM-001-065 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to reset Cache |
|  Action  |Contact the System Administrator |

|  Code  | ALC-FRM-001-066 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |No resource type exists for the given resource type name |
|  Action  |Contact the System Administrator |

|  Code  | ALC-FRM-001-067 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |No permission exists for the given Permission Name and Resource Type |
|  Action  |Contact the System Administrator |

|  Code  | ALC-FRM-901-001 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Potentially it is due to an error in running of server side scripts. |
|  Action  |Configure the logger and check for the error in the error.log file. If it is due to connection timeout, check the connectivity to the server, otherwise contact System Admin. |

|  Code  | ALC-FRM-901-002 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Potentially it is due to an error in running of client side script. |
|  Action  |Check the logs and see which script is responsible for this error. Modify that script based on the error. |

|  Code  | ALC-FRM-901-003 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |This error is caused when xfa fails to initialize. |
|  Action  |Contact system admin. |

|  Code  | ALC-FRM-901-004 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |This error is is caused when Output received from server at the time of initialization is incorrect. |
|  Action  |Contact system admin |

|  Code  | ALC-FRM-901-005 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |This error is caused due to compiler time error during parsing of client side script. |
|  Action  |Look into the form script and change it based on the error coming in logs. |

|  Code  | ALC-FRM-901-006 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |This error is caused when user script tries to modify a property which is read Only. |
|  Action  |Look into your form script and change that operation which is modifying the read Only property. |

|  Code  | ALC-FRM-901-007 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |This error is caused when Output received from the server after the execution of scripts is incorrect. |
|  Action  |Contact system admin. |

|  Code  | ALC-FRM-901-008 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |When the server is down then execution of scripts will be a timeout. |
|  Action  |Check the connectivity to the server. |

|  Code  | ALC-FRM-901-009 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Message Box with Yes/No are not supported and converted to Ok/Cancel message box but the return values are correct i.e for Yes/No |
|  Action  |In this version it it not supported. |

|  Code  | ALC-FRM-901-010 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Message Box with 3 buttons are not supported |
|  Action  |In this version it it not supported. |

|  Code  | ALC-FRM-901-011 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Geo Location not supported by your browser. |
|  Action  |Upgrade to higher( preferably latest) version of browser. |

|  Code  | ALC-FRM-901-012 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |This error is potentially caused if two different types of Fields like numeric and text fields are bound to same data node. |
|  Action  |In this version it it not supported. If possible, try to bound fields of the same type. |

|  Code  | ALC-FRM-901-013 (Forms) |
|---|---|
|  Type  |Error |
|  Cause  |Calculation scripts failed after adding or removing an instance of a subform. |
|  Action  |Check which calculate scripts have failed by enabling the logs and change the script accordingly. |

## Foundation error codes {#foundation-error-codes}

|  Code  | ALC-TTN-001-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |An exception occured in the server-side bootstrap code: [{0}]. |
|  Action  |Review the application server logs for errors. If necessary, take corrective action and retry the database initialization task in Configuration Manager. |

|  Code  | ALC-TTN-006-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |A SQLException was detected: [{0}]. |
|  Action  |Review the server logs for errors, apply corrections if possible, and try again. |

|  Code  | ALC-TTN-007-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |No bootstrapper name was supplied for the manual bootstrap operation. |
|  Action  |Issue a bootstrap command with a valid bootstrap name. If the error persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-008-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |An unregistered bootstrapper name [{0}] was supplied for manual bootstrap. |
|  Action  |Issue a bootstrap command with a valid bootstrap name. If the error persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-009-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |A RemoteException was detected: [{0}]. |
|  Action  |Review the application server logs for specific errors. If necessary, take corrective action and retry the database initialization task in Configuration Manager. |

|  Code  | ALC-TTN-010-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |A bootstrapper instance for key [{0}] was not found in the cache of bootstrappers. |
|  Action  |Internal error. Contact Adobe Technical Support. |

|  Code  | ALC-TTN-011-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Bootstrapping failed for platform component [{0}]. The wrapped exception message reads: \n{1}. |
|  Action  |Review the server logs for specific errors. If necessary, take corrective action and retry the database initialization task in Configuration Manager. |

|  Code  | ALC-TTN-012-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to lookup UserTransaction object; caused by [{0}]. |
|  Action  |Review the application server logs for specific errors. If necessary, take corrective action and retry the database initialization task in Configuration Manager. |

|  Code  | ALC-TTN-013-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |An exception occured while starting, committing, or rolling back a transaction; caused by [{0}]. There may be a problem with the application server configuration, or the bootstrap operation might have taken too long to complete, causing the transaction to time out. |
|  Action  |Review the application server logs for specific errors. Take the corresponding corrective action if possible, then retry the database initialization task in Configuration Manager. If the error persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-017-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to create a new InitialContext; caused by [{0}]. |
|  Action  |Review the application server logs for specific error. Take the corresponding corrective action if possible, and then retry the database initialization task in Configuration Manager. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-022-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Invalid task [{0}. |
|  Action  |Get a newer Configuration Manager. |

|  Code  | ALC-TTN-023-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Invalid step [{0}] for task [{1}}. |
|  Action  |Review the application server data source configuration and data source database server. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-024-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to connect to database; caused by [{0}]. |
|  Action  |Review the application server data source configuration and the database server. If the error is related to permissions, verify the credentials of the data source. Also verify that the specified database user has the necessary database roles or permissions. |

|  Code  | ALC-TTN-025-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Lookup failed for JNDI name [{0}]; caused by [{1}]. A likely cause of this error is that a particular bootstrapper's backing implementation is not deployed, meaning the implementation is missing from the LiveCycle EAR. In this scenario, it is likely that the EAR file contents have been manually tweaked, instead of using Configuration Manager. |
|  Action  |Review the application server logs for specific errors. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-026-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Narrow operation failed on object retreived using JNDI name [{0}]; caused by [{1}]. |
|  Action  |Review the application server logs for specific errors. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-027-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to create an EJB instance from an EJB home; caused by [{0}]. |
|  Action  |Review the application server logs for specific errors. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-100-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |An exception occured in the client-side bootstrap code: [{0}]. |
|  Action  |Internal error. Review the application server logs for specific errors. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-101-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to connect to server: Host [{0}] not found. |
|  Action  |Review your host name input and verify that the host name can be resolved (pinged) from the client. |

|  Code  | ALC-TTN-102-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Bootstrap URL is invalid: [{0}]. |
|  Action  |Review your host name and port input. |

|  Code  | ALC-TTN-103-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Bootstrapping request failed on server. Message from server: \n\n{0}\n\n. |
|  Action  |Review the application server log for cause of the error. The Administration Console log may not contain the complete cause exception's trace. |

|  Code  | ALC-TTN-104-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to connect to bootstrap servlet; the requested URL was not found on the server. |
|  Action  |Ensure that LiveCycle is deployed. |

|  Code  | ALC-TTN-105-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to connect to bootstrap servlet: port [{0}] may be invalid. |
|  Action  |Review the port number. Ensure that the application server is running. |

|  Code  | ALC-TTN-106-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |A problem with the request has occurred: [{0}{1}]. This error indicates that a 400-class HTTP error code was returned by the application server or a LiveCycle server bootstrapper component. |
|  Action  |The error message contains the details to enable more specific diagnosis. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-107-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to establish a valid secure connection to server. Port [{0}] may not be SSL-enabled or certificates may not be valid. |
|  Action  |If an https connection is required, review the application server's HTTPs/SSL configuration. Otherwise, deselect Use the secure connection (https) and try again. |

|  Code  | ALC-TTN-109-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to establish a valid connection to server: [{0}]. Configuration Manager is having difficulty establishing a TCP connection to the application server. |
|  Action  |Review the Configuration Manager log for details. |

|  Code  | ALC-TTN-110-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |The server returned a response indicating an internal server error. |
|  Action  |Review the application server logs for specific errors. If necessary, take corrective action and retry the database initialization task in Configuration Manager. |

|  Code  | ALC-TTN-111-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Unexpected URLConnection subtype instance: [{0}]. This is a client-side internal error. |
|  Action  |Review the Configuration Manager log file for details, take corrective action if possible, and then run Configuration Manager again. If corrective action is not possible based on the log file message, contact the Configuration Manager log file). |

|  Code  | ALC-TTN-112-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |The BootstrapServlet returned 200, but the first line of the response body did not contain an expected status string. Expected values are [{0}]. The received value was [{1}]. |
|  Action  |Internal error. Review the application server logs for specific errors. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-TTN-116-000 (Foundation) |
|---|---|
|  Type  |  |
|  Cause  |Failed to retreive bootstrapping tasks from the server: [{0}]. |
|  Action  |Your version of Configuration Manager is recent, but the server you are calling is old and does not support bootstrap task retrieval. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-BMC-001-001 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Unexpected exception while {0} |
|  Action  |  |

|  Code  | ALC-BMC-001-002 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Cannot create temporary directory. |
|  Action  |  |

|  Code  | ALC-BMC-001-003 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Cannot convert executable path to canonical. Path is {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-004 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service{0}: Cannot access the path for the native process. Path is {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-005 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Error starting native process {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-006 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Cannot add execute permission on file {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-008 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Datamanager cannot create temp dir {0} |
|  Action  |  |

|  Code  | ALC-BMC-001-007 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Cannot find service {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-009 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Datamanager cannot remove directory {0} |
|  Action  |  |

|  Code  | ALC-BMC-001-010 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |File {0} does not exist (in manageTempFile) |
|  Action  |  |

|  Code  | ALC-BMC-001-011 (Foundation) |
|---|---|
|  Type  |Warning |
|  Cause  |Invalid argument {0}={1} in CORBA call {2} |
|  Action  |  |

|  Code  | ALC-BMC-001-012 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Datamanager cannot read file {0} |
|  Action  |  |

|  Code  | ALC-BMC-001-013 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Transaction prepare failed for {0} |
|  Action  |  |

|  Code  | ALC-BMC-001-014 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Transaction commit failed for {0} |
|  Action  |  |

|  Code  | ALC-BMC-001-015 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Transaction rollback failed for {0} |
|  Action  |  |

|  Code  | ALC-BMC-001-016 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Error expanding files {0} in directory {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-017 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Error expanding files |
|  Action  |  |

|  Code  | ALC-BMC-001-018 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Cannot locate deploy file |
|  Action  |  |

|  Code  | ALC-BMC-001-019 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Missing initialization properties {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-020 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Cannot find global dir |
|  Action  |  |

|  Code  | ALC-BMC-001-021 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Can not find keystore file {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-022 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Can not find keys in keystore |
|  Action  |  |

|  Code  | ALC-BMC-001-023 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: IIOP Service not working (ORB Initialization problem) |
|  Action  |  |

|  Code  | ALC-BMC-001-024 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |"Service {0}: Process {1} terminated abnormally with error code {3} |
|  Action  |  |

|  Code  | ALC-BMC-001-025 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Can not copy keystore file to {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-026 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Error starting impersonated process: {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-027 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Error obtaining credential for starting impersonated process. Verify your ALC-BMC-001- pool size is not greater than the number of credentials supplied. |
|  Action  |  |

|  Code  | ALC-BMC-001-028 (Foundation) |
|---|---|
|  Type  |Warning |
|  Cause  |Service {0}: Reducing maximum pool size from {1} to {2} to match number of impersonation credentials. |
|  Action  |  |

|  Code  | ALC-BMC-001-029 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |Service {0}: Rejecting additional impersonation credential '{1}' as pool size has already been fixed. |
|  Action  |  |

|  Code  | ALC-BMC-001-030 (Foundation) |
|---|---|
|  Type  |Warning |
|  Cause  |Service {0}: Cannot accept impersonation credentials because there may already be running instance(s). |
|  Action  |  |

|  Code  | ALC-BMC-001-501 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Changed {0} logging level to {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-502 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Starting In Debug Mode. Run managed process in the debugger. |
|  Action  |  |

|  Code  | ALC-BMC-001-503 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service{0}: IOR has been written to file: {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-504 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service{0}: Use debug command: {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-505 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Starting native process with command line {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-506 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Native process {1} stopping |
|  Action  |  |

|  Code  | ALC-BMC-001-507 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Native process {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-508 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Native process PID = {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-509 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Version: {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-510 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Version not found |
|  Action  |  |

|  Code  | ALC-BMC-001-511 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Native files expanded in {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-512 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Starting |
|  Action  |  |

|  Code  | ALC-BMC-001-513 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Started |
|  Action  |  |

|  Code  | ALC-BMC-001-514 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Stopping |
|  Action  |  |

|  Code  | ALC-BMC-001-515 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Stopped |
|  Action  |  |

|  Code  | ALC-BMC-001-517 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Process {1} retired after {2} uses |
|  Action  |  |

|  Code  | ALC-BMC-001-518 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Registered MBean {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-519 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Cannot delete {0} |
|  Action  |  |

|  Code  | ALC-BMC-001-520 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Native process {1} destroying |
|  Action  |  |

|  Code  | ALC-BMC-001-521 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Command line {1} has been written to file: {2} |
|  Action  |  |

|  Code  | ALC-BMC-001-522 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Accepting new password for user {1} |
|  Action  |  |

|  Code  | ALC-BMC-001-516 (Foundation) |
|---|---|
|  Type  |Info |
|  Cause  |Service {0}: Disabling |
|  Action  |  |

|  Code  | ALC-BMC-001-031 (Foundation) |
|---|---|
|  Type  |Error |
|  Cause  |An Unexpected Corba Exception occured while {0} |
|  Action  |  |

## Guides error codes {#guides-error-codes}

|  Code  | ALC_GUI_001_001 (Guides) |
|---|---|
|  Type  |  |
|  Cause  |Guide catalog not present. |
|  Action  |Indicates that the file is either not a Guide or has been corrupted; determine which is the problem and correct it. |

|  Code  | ALC-GUI-042-001 (Guides) |
|---|---|
|  Type  |Error |
|  Cause  |GuideBuilder could not find the translation resources for the Guide. |
|  Action  |Make sure that you have exported translation resources (an XLIFF file) from your Guide before trying to preview it in a different locale. |

|  Code  | ALC-GUI-042-002 (Guides) |
|---|---|
|  Type  |Error |
|  Cause  |An XLIFF error was reported while translating the Guide resources for preview. |
|  Action  |Consult the documentation for the ALC-XLF error which was reported. |

|  Code  | ALC-GUI-042-003 (Guides) |
|---|---|
|  Type  |Error |
|  Cause  |An XLIFF error was encountered while translating a specific resource from the Guide. |
|  Action  |Consult the documentation for the ALC-XLF error which was reported. |

|  Code  | ALC-GUI-001-001 (Guides) |
|---|---|
|  Type  |Error |
|  Cause  |The .guide file is corrupted |
|  Action  |Create a new .guide file |

## JBoss error codes {#jboss-error-codes}

|  Code  | WARN [org.jboss.deployment.MainDeployer] Found non-jar deployer for (JBoss) |
|---|---|
|  Type  |  |
|  Cause  |Caused by certain LiveCycle JAR files being listed in the class path of the MANIFEST.MF file. |
|  Action  |Exception does not affect LiveCycle server processing and can be ignored. |

|  Code  | 09:03:54,843 ERROR [UNICAST] (JBoss) |
|---|---|
|  Type  |  |
|  Cause  |The following errors occur on startup off JBoss in a cluster: 09:03:54,843 ERROR [UNICAST] window_size is deprecated and will be ignored; 09:03:54,843 ERROR [UNICAST] min_threshold is deprecated and will be ignored. |
|  Action  |Exception does not affect LiveCycle server processing and can ignored. |

|  Code  | errorCode:8193 errorCodeHEX:0x2001 (JBoss) |
|---|---|
|  Type  |  |
|  Cause  |This error is seen on JBoss startup when the quartz.jar version has not been updated correctly: initialize chainedException:java.lang.IllegalArgumentException: Job class must implement the Job interface.chainedExceptionMessage:Job class must implement the Job interface. chainedException trace:java.lang.IllegalArgumentException: Job class must implement the Job interface. at org.quartz.JobDetail.setJobClass(JobDetail.java:262) at org.quartz.JobDetail.(JobDetail.java:139) at com.adobe.idp.um.util.UMSchedulerUtil.initialize(UMSchedulerUtil.java:254) at com.adobe.idp.um.scheduler.IDPScheduler.initializeScheduler(IDPScheduler.java:101) at com.adobe.idp.um.scheduler.IDPScheduler.onStartService(IDPScheduler.java:70) at com.adobe.service.Service.start(Service.java:145) |
|  Action  |Review the JBoss guide and ensure that quartz.jar and commons-collections.jar have been updated properly in your JBoss environment. |

## Job Manager error codes {#job-manager-error-codes}

|  Code  | 8193 (Job Manager) |
|---|---|
|  Type  |  |
|  Cause  |This excerpt indicates what you may see in the error log: JobManager:getServiceClientFactory():exception: | [com.adobe.idp.um.api.UMLocalUtils] errorCode:8193 errorCodeHEX:0x2001 message:Exception in getting SystemContext at com.adobe.idp.um.api.UMLocalUtils.setSystemContext(UMLocalUtils.java:108) at com.adobe.idp.um.api.UMLocalUtils.getSystemContext(UMLocalUtils.java:66) at com.adobe.idp.jobmanager.ejb.JobManagerBean.getServiceClientFactory(JobManagerBean.java:1245) at com.adobe.idp.jobmanager.ejb.JobManagerBean.doOnMessage(JobManagerBean.java:866) at com.adobe.idp.jobmanager.ejb.JobManagerBean.onMessage(JobManagerBean.java:817) [Remainder of stack trace deleted-very lengthy]. |
|  Action  |No action required. When the application server is shut down any jobs currently in process by the Job Manager, the server attempts reprocess them on startup. If the Job Manager starts before User Manager, exceptions are thrown as the server attempts reprocess the job. However, Job Manager will try again after 60 seconds and processes the messages appropriately once User Manager starts. |

|  Code  | SEVERE: JobManagerBean:onMessage:unable to acquire a ServiceClientFactory and/or contact the ServiceRegistry -- job processing will be temporarily hal (Job Manager) |
|---|---|
|  Type  |  |
|  Cause  |JobManager attempts to recover jobs on startup of the application server that were in process during an unexpected shutdown. When this occurs, this message may appear because all of the necessary components to complete the job did not properly start. |
|  Action  |No action is required. The jobs will try again in 60 seconds, at which point the necessary components should have begun and the job will finish as usual. |

## Output error codes {#output-error-codes}

|  Code  | ALC-OUT-001-001 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The parameter is missing. |
|  Action  |Specify the parameter. |

|  Code  | ALC-OUT-001-002 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The transformation ID cannot be determined based on the provided inputs. |
|  Action  |Review the useragent string to ensure that it is recognized or supported. |

|  Code  | ALC-OUT-001-003 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The format of the useragent string is invalid. |
|  Action  |Verify the useragent value. |

|  Code  | ALC-OUT-001-004 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to lookup XMLForm or Font Manager service. |
|  Action  |Verify that these services started properly. |

|  Code  | ALC-OUT-001-005 (Output) |
|---|---|
|  Type  |  |
|  Cause  |FDF or XFDF (alone) has been passed in with incompatible clientCache option. |
|  Action  |Pass the data in correct format. |

|  Code  | ALC-OUT-001-006 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load template from the specified URI. |
|  Action  |Verify that contentRootURI and formQuery API parameters are correct. |

|  Code  | ALC-OUT-001-010 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Format of XDP data is invalid. |
|  Action  |Verify the format of data. |

|  Code  | ALC-OUT-001-011 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The options format does not comply with Forms ES expected format. |
|  Action  |Update the option. |

|  Code  | ALC-OUT-001-012 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value specified for option. |
|  Action  |Verify the option value. |

|  Code  | ALC-OUT-001-013 (Output) |
|---|---|
|  Type  |  |
|  Cause  |XMLForm is failed to render the form. |
|  Action  |Verify the format of template. |

|  Code  | ALC-OUT-001-014 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Forms server has invoked XMLForm but received a failure in response. |
|  Action  |Review the log for more details. |

|  Code  | ALC-OUT-001-015 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Content type of submitted data is not supported. |
|  Action  |Verify that data is being submitted in the correct format. |

|  Code  | ALC-OUT-001-016 (Output) |
|---|---|
|  Type  |  |
|  Cause  |A parse error has been encountered while processing internal XML data. |
|  Action  |Cuased by invalid data being passed into the API. Verify that any XML data passed is well-formed. |

|  Code  | ALC-OUT-001-018 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The specified file is not available. |
|  Action  |Update the file path or verify the API parameter values, such as ContentRootURI. |

|  Code  | ALC-OUT-001-019 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An invalid URL is specified. |
|  Action  |Update the URL; verify the API parameter values, such as the BaseURL. |

|  Code  | ALC-OUT-001-020 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Either the data is not matched with the data type or it is corrupted. |
|  Action  |Verify and validate the data. |

|  Code  | ALC-OUT-001-021 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An invalid URI is specified. |
|  Action  |Update the URI. |

|  Code  | ALC-OUT-001-022 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An unexpected exception has occurred. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-023 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The specified transformation is not supported. |
|  Action  |Verify the value of the API parameter formPreference. |

|  Code  | ALC-OUT-001-024 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The environment buffer passed to the API is not correct. |
|  Action  |Verify that it is not null. |

|  Code  | ALC-OUT-001-025 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The request buffer passed to the API is not correct. |
|  Action  |Verify that it is not null. |

|  Code  | ALC-OUT-001-026 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The cache directory configuration is not correct. |
|  Action  |The cache directory is based on data specified by the Forms configuration. Verify the cache configuration. |

|  Code  | ALC-OUT-001-028 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Caching is disabled because of unexpected error. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-032 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load XCI file. |
|  Action  |Verify that correct XCI URL is specified in options API parameter. |

|  Code  | ALC-OUT-001-103 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the options required to create property editor. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-104 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the options (because of parsing error) required to create property editor. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-105 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the options (because of IO error) required to create property editor. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-106 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the options (because of parser configuration error) required to create property editor. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-201 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Input document is a already flat PDF document. |
|  Action  |Ensure that input document is not already flattened. |

|  Code  | ALC-OUT-001-202 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Document is not a valid PDF Document |
|  Action  |Ensure that input document is a valid PDF. |

|  Code  | ALC-OUT-001-203 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Security issue(s) processing PDF document. |
|  Action  |Verify that input is not a secured document. |

|  Code  | ALC-OUT-001-204 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to transform the input PDF to non-interactive PDF. |
|  Action  |Review the log files for details. |

|  Code  | ALC-OUT-001-205 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Specified input parameter is null. |
|  Action  |Verify that the specified input parameter is not null. |

|  Code  | ALC-OUT-001-206 (Output) |
|---|---|
|  Type  |  |
|  Cause  |XFAService failed to get the XDP stream from PDFDocuent. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-208 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid input PDF for PDFA transformation. Only XFA PDF with no rights, signature, or certification is allowed. |
|  Action  |Verify that the input PDF document is XFA PDF with no rights, signature, or certification. |

|  Code  | ALC-OUT-001-209 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Input PDF is not supported for Transformation. Only XFA and Acrobat Form PDF are supported. |
|  Action  |Verify that the input PDF is XFA or Acrobat Form. |

|  Code  | ALC-OUT-001-210 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Specified input parameter is required. |
|  Action  |Verify that the specified input parameter is provided. |

|  Code  | ALC-OUT-001-211 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid PDF/A revision number. |
|  Action  |Verify that the PDF/A Revision number is: 1. |

|  Code  | ALC-OUT-001-212 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid PDF/A conformance. |
|  Action  |Verify that the PDF/A Conformance is A or B. |

|  Code  | ALC-OUT-001-601 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the template that corresponds to the data record as indicated by the sniff rule. |
|  Action  |Verify that the default form design and all other form templates specified in the sniff rules are valid. |

|  Code  | ALC-OUT-001-603 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to extract multiple stream output with non-self-contained files. |
|  Action  |If files are generated in fragments, then request that a single output stream gets a concatenated output stream. |

|  Code  | ALC-OUT-001-604 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the metadata specification file properly. |
|  Action  |Verify that metadata file exists and that it is well-formed XML. |

|  Code  | ALC-OUT-001-605 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the metadata specification file properly. |
|  Action  |Verify that metadata file exists and that it is well-formed XML. |

|  Code  | ALC-OUT-001-606 (Output) |
|---|---|
|  Type  |  |
|  Cause  |No system level meta attributes are defined in the metadata specification. Defaults would be used. |
|  Action  |Verify that metadata file exists and that it is well-formed XML. |

|  Code  | ALC-OUT-001-607 (Output) |
|---|---|
|  Type  |  |
|  Cause  |No user level meta attributes are defined in the metadata specification. Only system metadata would be generated. |
|  Action  |Verify that metadata file exists and that it is well-formed XML. |

|  Code  | ALC-OUT-001-608 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The record depth in the data file does not match with the record level or record name. |
|  Action  |Verify that record level or record name is given in accordance with the input data file. |

|  Code  | ALC-OUT-001-301 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to process the input XFAF template. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-302 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to process the input XFAF template. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-303 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to extract XFA definition from XFA PDF. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-304 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Input XFAF document is null. |
|  Action  |Ensure that a non-null input document is passed. |

|  Code  | ALC-OUT-001-305 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to process the input XFAF template. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-306 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to process the input XFAF template. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-402 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to connect to given queue name. |
|  Action  |Verify that it is a valid queue name. |

|  Code  | ALC-OUT-001-403 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to connect to given server name. |
|  Action  |Verify that it is a valid and reachable server. |

|  Code  | ALC-OUT-001-401 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Metadata is not generated when the destination file URI is not provided. |
|  Action  |Provide the destination file URI for generating metadata. |

|  Code  | ALC-OUT-001-034 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Metadata will not be generated, because the file URI is not provided. |
|  Action  |Provide a valid URI location for metadata specified file. |

|  Code  | ALC-OUT-001-035 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the PDF from the given location. |
|  Action  |Provide a valid location for the PDF form. |

|  Code  | ALC-OUT-001-207 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value for the transformation input parameter. |
|  Action  |Review the value of the transformation input format. |

|  Code  | ALC-OUT-001-404 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Unknown error while printing. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-405 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Malformed URI. |
|  Action  |Review the Printer URI. |

|  Code  | ALC-OUT-001-406 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Required parameters missing. |
|  Action  |Verify that all the required parameters for printing are sent. |

|  Code  | ALC-OUT-001-407 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Access denied by the printer. |
|  Action  |Verify that the user has printer access. |

|  Code  | ALC-OUT-001-408 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The connection not accepted by the Printer Server. |
|  Action  |Verify that the printer does not have too many active connections. |

|  Code  | ALC-OUT-001-409 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Could not find printer resource for the UNC path provided. |
|  Action  |Review the printer configuration. |

|  Code  | ALC-OUT-001-701 (Output) |
|---|---|
|  Type  |  |
|  Cause  |ServiceUtil already initialized with service. Aborting cache re-initilaization. |
|  Action  |Cache cannot be reinitialized for the service. Contact the system administrator. |

|  Code  | ALC-OUT-001-702 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value for Max Document size in cache, default value will be used. |
|  Action  |Verify that a valid integer value is used for max document size. |

|  Code  | ALC-OUT-001-703 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Exception while initializing cache from startup. |
|  Action  |Examine the logs for details. |

|  Code  | ALC-OUT-001-704 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Exception while closing cache. |
|  Action  |Examine the logs for more details |

|  Code  | ALC-OUT-001-705 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Exception while reading cache configuration stream. |
|  Action  |Examine the logs for more details. |

|  Code  | ALC-OUT-001-706 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Exception while creating cache configuration stream. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-002-001 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The parameter is missing. |
|  Action  |Specify the parameter. |

|  Code  | ALC-OUT-002-005 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An FDF or XFDF (alone) has been passed with incompatible clientCache option Pass. |
|  Action  |Change the clientCache option to a compatible option. |

|  Code  | ALC-OUT-002-006 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load template from the specified URI. |
|  Action  |Verify that contentRootURI and formQuery API parameters are correct. |

|  Code  | ALC-OUT-002-010 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The format of XDP data is invalid. |
|  Action  |Verify the format of data. |

|  Code  | ALC-OUT-002-011 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The format of the option does not comply with the expected Forms format. |
|  Action  |Change the format of the option. |

|  Code  | ALC-OUT-002-012 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value specified for option. |
|  Action  |Verify the value of the option. |

|  Code  | ALC-OUT-002-013 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Forms Service failed to render the form. |
|  Action  |Verify the format of form design. |

|  Code  | ALC-OUT-002-014 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Forms ES has received an invocation failure response. |
|  Action  |Review the log file for more details. |

|  Code  | ALC-OUT-002-016 (Output) |
|---|---|
|  Type  |  |
|  Cause  |A parse error has been encountered while processing internal XML data. This could be due to invalid data being passed into the API. |
|  Action  |Verify any xylem-data passed in is well-formed. |

|  Code  | ALC-OUT-002-018 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The specified file is not available. |
|  Action  |Update the file path or verify the API parameter values such as the ContentRootURI value. |

|  Code  | ALC-OUT-002-019 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An invalid URL is specified. |
|  Action  |Update the URL, verify the API parameter values such as the BaseURL value. |

|  Code  | ALC-OUT-002-020 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The data is corrupt, or does not match the data type. |
|  Action  |Verify and validate the data. |

|  Code  | ALC-OUT-002-021 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An invalid URI is specified. |
|  Action  |Update the URI. |

|  Code  | ALC-OUT-002-022 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An unexpected exception has occurred. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-002-023 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The specified transformation is not supported. |
|  Action  |Verify the value of formPreference API parameter. |

|  Code  | ALC-OUT-002-025 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The request buffer passed to the API is not correct. |
|  Action  |Verify that the request buffer is not null. |

|  Code  | ALC-OUT-002-026 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The cache directory configuration is not correct. The cache directory is based on data specified by the Forms ES configuration. |
|  Action  |Verify the cache configuration. |

|  Code  | ALC-OUT-002-028 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Caching has been disabled because of unexpected error. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-002-032 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Unable to load the XCI file. |
|  Action  |Verify that correct XCI URL is specified in options API parameter. |

|  Code  | ALC-OUT-002-033 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The options specified are not compatible. |
|  Action  |Adjust the options parameter. |

|  Code  | ALC-OUT-002-034 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to initialize the default values of options. |
|  Action  |Verify that the Forms configuration EJB is initialized properly. |

|  Code  | ALC-OUT-002-035 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Could not retrieve the form design contents. |
|  Action  |Verify that FormsQuery and ContentRootURI are specified correctly. |

|  Code  | ALC-OUT-002-036 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load updated version of form design. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-002-037 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Failed to load the updated version of the form design. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-002-040 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Forms ES service is not initialized properly. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-002-042 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Reader Extensions ES service is not deployed. |
|  Action  |To add Usage rights to a form, Reader Extension is required. Ensure that Reader Extension is deployed. |

|  Code  | ALC-OUT-002-043 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The format of the supplied PDF form is unsupported. |
|  Action  |Ensure that the supplied PDF is an XDP form or an Acrobat form. |

|  Code  | ALC-OUT-002-045 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The version of Acrobat specified in the options parameter is not supported. |
|  Action  |Ensure that correct Acrobat version is passed in the options parameter. |

|  Code  | ALC-OUT-002-046 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Value of the specified input parameter is null. |
|  Action  |Ensure that the input parameter is not a null value. |

|  Code  | ALC-OUT-002-048 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Forms with rights cannot be linearized. |
|  Action  |Ensure that Linearized option is not enabled if the form has usage rights applied. |

|  Code  | ALC-OUT-002-008 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An invalid attempt to translate the layout of a PDF or Image. |
|  Action  |Review the logs for more details. |

|  Code  | ALC-OUT-002-017 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Forms ES Service failed to render the form. |
|  Action  |Review the logs for more details. |

|  Code  | ALC-OUT-002-029 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An unexpected problem occurred. |
|  Action  |Review the log files, and contact the system administrator. |

|  Code  | ALC-OUT-002-049 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An existing attachment uses the same file name as the attachment currently being added. The original attachment will be overwritten. |
|  Action  |Rename one of the attachments so that they use different filenames. |

|  Code  | ALC-OUT-002-050 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Null response from Forms ES when trying to render the XFA form. |
|  Action  |Verify the format of the form design, and see the logs for more details. |

|  Code  | ALC-OUT-002-051 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while creating credential array. |
|  Action  |Review the User Credentials set. |

|  Code  | ALC-OUT-002-052 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while extracting request information from a callback invocation. |
|  Action  |Verify that valid request information, such as Form Query, Content Root URI, and Timestamp, are being sent. |

|  Code  | ALC-OUT-002-053 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Unable to make changes to the input PDF document as it has a certifying signature that does not permit any changes |
|  Action  |Verify that the PDF has a certifying signature that does not permit any changes. |

|  Code  | ALC-OUT-002-054 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The document supplied as input is not a PDF form capable of supporting data merge. |
|  Action  |Transmit a PDF form capable of supporting data merge. |

|  Code  | ALC-OUT-002-055 (Output) |
|---|---|
|  Type  |  |
|  Cause  |A PDF security exception is thrown while unlocking the encrypted document. |
|  Action  |Verify that the PDF is not password protected. Forms cannot render a password protected PDF. |

|  Code  | ALC-OUT-002-056 (Output) |
|---|---|
|  Type  |  |
|  Cause  |A PDF security exception is thrown while getting the interactive form (Acroform) dictionary for the document. |
|  Action  |Verify that the PDF is not password protected. Forms cannot render a password protected PDF. |

|  Code  | ALC-OUT-002-104 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while loading options. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-801 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The Forms ES configuration EJB could not be initialized. |
|  Action  |Contact the system administrator. |

|  Code  | ALC-OUT-001-033 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Unable to extract the XDP from PDF, proceeding with PDF only (Re-render will not occurr). |
|  Action  |No action needed. |

|  Code  | ALC-OUT-001-036 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Generic log message. |
|  Action  |No action needed. |

|  Code  | ALC-OUT-001-707 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Starting Livecycle Output ES. |
|  Action  |No action needed. |

|  Code  | ALC-OUT-001-708 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Stopping Livecycle Output ES. |
|  Action  |No action needed. |

|  Code  | ALC-OUT-001-914 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Used for logging. |
|  Action  |No action needed. |

|  Code  | ALC-OUT-002-058 (Output) |
|---|---|
|  Type  |  |
|  Cause  |A valid path component cannot be retrieved from the repository URI.The path component retrieved is null or empty. |
|  Action  |When Content Root URI references a repository location, ensure that the location is in the form: repository://authority/form location For example, if Form is formName and Content Root URI is repository:/a/b/, then authority is null and form path resolves to /a/b/formName. Similarly, if Content Root URI is set as repository:///a/b/, then authority is empty, and form path is /a/b/formName. If Form is /formName, and Content Root URI is set as repository://a/b, then authority is null and form path is /b/formName. |

|  Code  | ALC-OUT-002-059 (Output) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while trying to read a resource from repository due to an invalid URI. |
|  Action  |Verify that the repository content root URI begins with repository. |

|  Code  | ALC-OUT-001-042 (Output) |
|---|---|
|  Type  |  |
|  Cause  |The data file is not XML. |
|  Action  |Ensure that the input data is a proper XML. |

|  Code  | ALC-OUT-001-043 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Only one data file must be provided. |
|  Action  |You have specified multiple data to the operation. |

|  Code  | ALC-OUT-001-044 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Print request successful. |
|  Action  |No action required. |

|  Code  | ALC-OUT-001-045 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |The request has been queued for processing. |
|  Action  |No action required. |

|  Code  | ALC-OUT-001-046 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Print request successful. Since there was no data passed so only Form Template Printed. |
|  Action  |No action required. |

|  Code  | ALC-OUT-001-047 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Print request successful. No output generated as recordLevel or recordName does not matches with the data file. |
|  Action  |No action required. |

|  Code  | ALC-OUT-001-048 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |A spec file must be specified. |
|  Action  |No action required. |

|  Code  | ALC-OUT-001-049 (Output) |
|---|---|
|  Type  |  |
|  Cause  |{0} must be a positive integer |
|  Action  |Ensure that the specified parameter is a positive integer. |

|  Code  | ALC-OUT-001-050 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid data substitution syntax: {0} |
|  Action  |Correct the specified data substitution syntax. |

|  Code  | ALC-OUT-001-051 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Only one of the following options may be specified. {0} |
|  Action  |Ensure that only one of the mentioned options is specified. |

|  Code  | ALC-OUT-001-052 (Output) |
|---|---|
|  Type  |  |
|  Cause  |At least one of the following options must be specified. {0} |
|  Action  |Specify at least one of the mentioned options. |

|  Code  | ALC-OUT-001-053 (Output) |
|---|---|
|  Type  |  |
|  Cause  |{0} is not a valid Internet address. {1}. |
|  Action  |  |

|  Code  | ALC-OUT-001-054 (Output) |
|---|---|
|  Type  |  |
|  Cause  |OutputStream {0} is not valid. Use "multiple" or "single" or "single_with_return_data". |
|  Action  |  |

|  Code  | ALC-OUT-001-055 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Request ID is empty. |
|  Action  |  |

|  Code  | ALC-OUT-001-056 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Result for request ID, {0}, not found. |
|  Action  |  |

|  Code  | ALC-OUT-001-057 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Save failed: PrintResult is null. |
|  Action  |  |

|  Code  | ALC-OUT-001-058 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Unable to create / open file {0}. |
|  Action  |  |

|  Code  | ALC-OUT-001-609 (Output) |
|---|---|
|  Type  |  |
|  Cause  |{0} is not a valid MetaData spec file. |
|  Action  |  |

|  Code  | ALC-OUT-001-610 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Invalid Meta spec, record Level Meta data cannot be generated with single output stream. |
|  Action  |  |

|  Code  | ALC-OUT-001-611 (Output) |
|---|---|
|  Type  |  |
|  Cause  |SniffRule[{0}] requires both the pattern and the form design name. |
|  Action  |Check that both the pattern and form design name are specified in the sniff rule. |

|  Code  | ALC-OUT-001-612 (Output) |
|---|---|
|  Type  |  |
|  Cause  |No form name could be determined using the sniff rules and no default form name was specified. |
|  Action  |Check that at least one form is specified either through the sniff rules or through the operation interface. |

|  Code  | ALC-OUT-001-613 (Output) |
|---|---|
|  Type  |  |
|  Cause  |Printed all {0} records successfully. |
|  Action  |No action required. |

|  Code  | ALC-OUT-001-037 (Output) |
|---|---|
|  Type  |Error |
|  Cause  |Problem when extracting the XFA stream from the PDF Form |
|  Action  |Check if the input pdf form is a valid XFA PDF Form. If so then contact the System Administrator. |

|  Code  | ALC-OUT-001-038 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |For PDFVersion less than 1.7, Output Service removes all signatures. So will would not be able to retain appearance for signed fields. |
|  Action  |No action needed. This is a message for information purpose. |

|  Code  | ALC-OUT-001-039 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Signed signature fields cannot be retained in signed edited dynamic XFA PDF forms. So retaining only unsigned signature fields. |
|  Action  |No action needed. |

|  Code  | ALC-OUT-001-040 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Signed signature fields cannot be retained in signed edited dynamic XFA PDF forms. |
|  Action  |No action needed |

|  Code  | ALC-OUT-001-041 (Output) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to reset Cache |
|  Action  |Contact the System Administrator |

|  Code  | ALC-OUT-001-713 (Output) |
|---|---|
|  Type  |Warning |
|  Cause  |Transaction type set to invalid value.Default value of "required" will be used. |
|  Action  |Contact the system administrator. |

|  Code  | FSC001 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Information log to indicate that a forms configuration parameter has been updated |
|  Action  |no action needed |

|  Code  | FSC003 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Information log message to indicate that Output MBean Service is getting started |
|  Action  |no action needed |

|  Code  | FSC004 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Information log message to indicate that Output MBean is getting stopped |
|  Action  |no action needed |

|  Code  | FSC006 (Output) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to commit a configuration change to the database |
|  Action  |Contact the system administrator |

|  Code  | FSC008 (Output) |
|---|---|
|  Type  |Info |
|  Cause  |Using the database to access and persist configuration properties. |
|  Action  |no action needed |

|  Code  | FSC009 (Output) |
|---|---|
|  Type  |Error |
|  Cause  |No database was found, configuration properties will not be persisted. |
|  Action  |Contact the system administrator |

|  Code  | FSC010 (Output) |
|---|---|
|  Type  |Error |
|  Cause  |failed to start the output mbean |
|  Action  |Contact the system administrator |

|  Code  | FSC012 (Output) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to assert Admin Version. This can happen due to the failure to increment Admin Version in cluster cache. |
|  Action  |Contact the system administrator |

## PDF Generator error codes {#pdf-generator-error-codes}

|  Code  | ALC-PDG-080-000 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Internal exception. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-080-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to look up job configuration. |
|  Action  |Ensure that the correct job option name exists in the PDF Generator database. |

|  Code  | ALC-PDG-080-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Missing extension in file name. Input filenames should have correct extensions indicating the file type. |
|  Action  |Correct the missing filename extension and try the operation again. |

|  Code  | ALC-PDG-080-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An attempt has been made to convert a native document using ExportPDF API for conversion. |
|  Action  |For conversion of native documents to PDF, use createPDF. |

|  Code  | ALC-PDG-080-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An attempt has been made to convert a PDF document using the CreatePDF API. |
|  Action  |For conversion of PDF documents to other formats, use exportPDF. |

|  Code  | ALC-PDG-080-005 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Conversion failure. Converted document not found. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-080-006 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Trying to attach source file to a PDFA compatible PDF. |
|  Action  |Deselect attach source option or create non PDFA-compliant PDF. |

|  Code  | ALC-PDG-080-007 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Trying to apply security to PDF/A, PDF/X1a:2003 or PDF/X3:2003 compliant PDFs. |
|  Action  |Create PDF/A, PDF/X1a:2003 or PDF/X3:2003 compliant PDFs without security options. |

|  Code  | ALC-PDG-080-008 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PDF version of security exceeds PDF version of job options. |
|  Action  |Use appropriate job options and security settings so that PDF versions match. |

|  Code  | ALC-PDG-080-009 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PDF open password and the PDF change passwords are identical. |
|  Action  |Select different PDF open and change passwords. |

|  Code  | ALC-PDG-080-010 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Trying to embed job-options in PDF/A, PDF/X1a:2003 or PDF/X3:2003 compliant PDFs. |
|  Action  |Deselect the option to embed job-options in PDF/A, PDF/X1a:2003 or PDF/X3:2003 compliant PDFs. |

|  Code  | ALC-PDG-080-011 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The format type being requested for PDF export is not supported. |
|  Action  |Use a supported format type. |

|  Code  | ALC-PDG-080-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An operation called without corresponding service being installed. |
|  Action  |Install appropriate service. |

|  Code  | ALC-PDG-080-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid settings file for HTML to PDF operation. |
|  Action  |Add HTML2PDF section to settings file being used for conversion. |

|  Code  | ALC-PDG-080-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |HTML to PDF conversion failed because of an exception. |
|  Action  |Review the log files and contact the system administrator. If problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-080-015 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The caller does not have sufficient permission(s) for invoking the operation. |
|  Action  |Ask administrator for permissions. |

|  Code  | ALC-PDG-080-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert encrypted files. |
|  Action  |Do not give encrypted files for conversion. |

|  Code  | ALC-PDG-080-017 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Image to PDF conversion failure. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-080-018 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Problem with license, see log for details. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-080-019 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |HTML to PDF failure. Input ZIP file does not contain the index HTML file. |
|  Action  |Provide an index HTML file as a starting point in the input ZIP file. |

|  Code  | ALC-PDG-080-020 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Input file type is not supported in HTML to PDF conversion. |
|  Action  |HTML to PDF supports .htm or .html files. Provide appropriate inputs only. |

|  Code  | ALC-PDG-080-021 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error while deflating ZIP file. |
|  Action  |Ensure that the ZIP file is not corrupt. |

|  Code  | ALC-PDG-080-022 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to build a valid trusted certificate path to requested secure URL. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-001-000 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Conversion failed because of an exception. |
|  Action  |Run the System Readiness Tool (found under \pdfg_srt) to check if the LiveCycle server environment is configured properly for PDFG Service to function correctly. If the SRT (System Readiness Tool) does not report an issue, view the log files and then contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-001-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job configuration cannot be obtained or is invalid. |
|  Action  |Provide a valid job configuration. If providing a job configuration name, ensure that it exists in the database. |

|  Code  | ALC-PDG-001-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |There was an error in validating and writing the configuration job-options. |
|  Action  |Ensure that job-options are correct. |

|  Code  | ALC-PDG-001-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error while creating temporary directories. |
|  Action  |Ensure that the application server user has valid permissions on the file system. |

|  Code  | ALC-PDG-001-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PDF Generator ES configuration service lookup failed. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-001-005 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while determining the PDF Generator ES product type. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-001-006 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |You do not have PDF Generator ES Professional version installed, which supports these formats. |
|  Action  |Contact the administrator for PDF Generator Professional installation. |

|  Code  | ALC-PDG-001-007 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while determining the product license. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-001-008 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while transforming the application configuration. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-001-009 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The service to convert the document could not be looked up. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-001-010 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while applying watermark to the document. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-001-011 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The BMC reported failure in converting the document. |
|  Action  |Ensure that file is not corrupt and is convertible to PDF using standalone Acrobat. |

|  Code  | ALC-PDG-001-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job options in the configuration could not be parsed. |
|  Action  |Provide valid job-options. |

|  Code  | ALC-PDG-001-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while linearizing and attaching job options to the document. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-001-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while linearizing the document. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-001-015 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |This file type is not supported. |
|  Action  |Obtain a list of supported file types from Adobe Technical Support. |

|  Code  | ALC-PDG-001-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PDF Settings are not correct. |
|  Action  |Verify that the PDF Settings are correct. |

|  Code  | ALC-PDG-001-017 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Security settings cannot be applied with the Adobe PDF Settings you selected. |
|  Action  |Check the compatibilities, or remove password security. |

|  Code  | ALC-PDG-001-018 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Submitted a PDF file for conversion without enabling OCR in file-type settings. This operation is invalid. |
|  Action  |Select OCR option in file-type settings or do not use PDF as input file type in CreatePDF API. |

|  Code  | ALC-PDG-001-019 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while launching AutoCAD. |
|  Action  |Verify whether AutoCAD is installed on the server. |

|  Code  | ALC-PDG-001-020 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while launching Microsoft Excel. |
|  Action  |Verify whether Microsoft Excel is installed on the server. |

|  Code  | ALC-PDG-001-021 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while launching Microsoft PowerPoint. |
|  Action  |Verify whether Microsoft PowerPoint is installed on the server. |

|  Code  | ALC-PDG-001-022 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while launching Microsoft Project. |
|  Action  |Verify whether Microsoft Project is installed on the server. |

|  Code  | ALC-PDG-001-023 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while launching Microsoft Visio. |
|  Action  |Verify whether Microsoft Visio is installed on the server. |

|  Code  | ALC-PDG-001-024 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while launching Microsoft Word. |
|  Action  |Verify whether Microsoft Word is installed on the server. |

|  Code  | ALC-PDG-001-025 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Conversion failed because of an exception. |
|  Action  |If exception message does not provide assistance,contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-001-026 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Environment variable DISPLAY is not set on the server. |
|  Action  |Set the DISPLAY environment variable to point to a valid XServer and restart application server. |

|  Code  | ALC-PDG-001-027 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Job configuration does not have file settings. |
|  Action  |Use a valid job configuration with file type settings corresponding to requested conversion. |

|  Code  | ALC-PDG-001-028 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid transport protocol requested. |
|  Action  |Only http and https are supported. Do not use any other protocol. |

|  Code  | ALC-PDG-001-029 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No job configuration specified. |
|  Action  |Specify a valid job configuration. |

|  Code  | ALC-PDG-001-030 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The HTTP request property Content-Length value must be larger than 0. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-001-031 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Document size is zero. |
|  Action  |Document size must be larger than zero. |

|  Code  | ALC-PDG-001-032 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid input. |
|  Action  |Error message self explanatory. |

|  Code  | ALC-PDG-001-033 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid input. |
|  Action  |Error message self explanatory. |

|  Code  | ALC-PDG-001-034 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Required HTTP header missing. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-001-035 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Could not connect to PDF Generator ES service. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-001-036 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PDF Generator ES permission(s) have not been initialized |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-001-037 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PDF Generator ES resource(s) have not been initialized. |
|  Action  |Contact system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-001-038 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while launching Microsoft Publisher. |
|  Action  |Verify whether Microsoft Publisher is installed on the server. |

|  Code  | ALC-PDG-001-039 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Microsoft Office was not able to open the document that was submitted for conversion. |
|  Action  |Verify that the document is not corrupt. |

|  Code  | ALC-PDG-009-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Could not find path to the application |
|  Action  |Verify that the application is installed and _PATH environment variable is set. |

|  Code  | ALC-PDG-009-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Could not find path to the application. |
|  Action  |Verify that the application is installed and _PATH environment variable is set. |

|  Code  | ALC-PDG-010-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An unexpected internal error occurred. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-010-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Trying to use same password for documentChange and documentOpen. |
|  Action  |Use separate passwords for document open and change. |

|  Code  | ALC-PDG-010-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Restricted Security requires a documentChange password which is not supplied. |
|  Action  |Provide a document change password. |

|  Code  | ALC-PDG-010-005 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to obtain the Conversion COM interface from PDFMaker. |
|  Action  |Verify Acrobat is properly installed on the LiveCycle ES server. If problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-010-006 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The security configuration provided was null. |
|  Action  |Provide a valid entry for the security configuration. |

|  Code  | ALC-PDG-010-007 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to convert file because there is a pre-existing Acrobat.exe process. |
|  Action  |Cancel the Acrobat.exe processes on LiveCycle ES server. |

|  Code  | ALC-PDG-010-008 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to obtain the Security COM interface from PDFMaker. |
|  Action  |Verify Acrobat is properly installed on the LiveCycle server. If problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-010-009 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The security configuration provided was null. |
|  Action  |Provide a valid entry for the security configuration. |

|  Code  | ALC-PDG-010-010 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The conversion has timed out. |
|  Action  |Increase conversion timeout parameter and retry. |

|  Code  | ALC-PDG-010-011 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to contact PDFMaker. Ensure Acrobat is installed and PDFMaker.dll is registered. |
|  Action  |Verify Acrobat is properly installed on the LiveCycle ES server. If problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-010-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PDFMaker reported an error while printing the document. |
|  Action  |Verify Acrobat standalone can convert the input file. If so, contact Adobe Technical Support. |

|  Code  | ALC-PDG-010-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The JVM reported lack of sufficient privileges while converting the document to PDF. |
|  Action  |Contact the system administrator. Provide sufficient privilages to the appserver user. |

|  Code  | ALC-PDG-010-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The underlying method for converting document to PDF was not found at runtime. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-010-015 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The conversion operation timed out before it could be completed. |
|  Action  |Increase the timeout parameter and retry. |

|  Code  | ALC-PDG-010-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to create temp file for stdin. |
|  Action  |Verify that the application server user has sufficient permissions to create files on server. Contact the system administrator. |

|  Code  | ALC-PDG-011-011 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system encountered an unexpected error while processing this request. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-011-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |There was an error looking up a dependent component or a service. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-011-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to submit job for conversion. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-011-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The chosen security settings are not compatible with the chosen job options. |
|  Action  |Use compatible job options and security settings for conversions. |

|  Code  | ALC-PDG-011-015 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The specified settings were not found. |
|  Action  |Use the Administration Console to import the conversion settings. |

|  Code  | ALC-PDG-011-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error was encountered while processing the configuration settings. |
|  Action  |Review the log files and contact the system administrator. If problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-011-017 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The specified credentials are not authorized to perform the specified action. |
|  Action  |Contact the system administrator to obtain sufficient permissions. |

|  Code  | ALC-PDG-011-018 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An invalid job ID was provided. |
|  Action  |Ensure that you provide valid job-ID. If it is valid, contact the system administrator. |

|  Code  | ALC-PDG-011-019 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The source file you submitted is invalid. |
|  Action  |Verify that the file is not corrupt and is a supported format. |

|  Code  | ALC-PDG-011-020 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The source file you submitted is not supported by this version of PDF Generator. |
|  Action  |Get the supported list of file formats from Adobe Technical Support. |

|  Code  | ALC-PDG-011-021 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |WebCapture is not supported by this version of PDF Generator. |
|  Action  |Contact the system administrator to purchase valid licenses. |

|  Code  | ALC-PDG-011-022 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The local file for the SOAP attachment cannot be found. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-011-023 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The specified job was not found. It may have been deleted. |
|  Action  |Contact the system administrator to ensure that the job was not deleted. |

|  Code  | ALC-PDG-011-024 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The source type you specified is invalid. |
|  Action  |Get a list of supported formats from Adobe Technical Support. |

|  Code  | ALC-PDG-011-025 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No document has been provided for conversion. |
|  Action  |Provide a valid (non-blank) input document. |

|  Code  | ALC-PDG-011-026 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while doing OCR on the document. |
|  Action  |Verify that the document is not corrupt. Try and convert the file using standalone Acrobat. |

|  Code  | ALC-PDG-011-027 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error while converting an OpenOffice document. |
|  Action  |Verify that the document is not corrupt. Try converting the file using standalone OpenOffice. |

|  Code  | ALC-PDG-011-028 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while converting image to PDF. |
|  Action  |Verify that the image is not corrupt. If not, report to Adobe Technical Support. |

|  Code  | ALC-PDG-011-030 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Could not convert document as unable to launch OpenOffice. |
|  Action  |Verify that OpenOffice is installed on the server and environment variable OpenOffice_PATH is set. |

|  Code  | ALC-PDG-011-031 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred while exporting to the selected format. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-011-032 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Input PDF is password protected. |
|  Action  |Do not give password protected inputs. |

|  Code  | ALC-PDG-011-033 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to find the working directory for the current request. |
|  Action  |Verify that the application server user has permissions to create files. Report to the system administrator. |

|  Code  | ALC-PDG-011-034 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to find PDFGen.api plugin in file in the Acrobat plugins folder. |
|  Action  |Copy PDFGen.api file from PDF Generator installation to the Acrobat plug-ins folder on server. |

|  Code  | ALC-PDG-011-035 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |ExportPDF functionality is only supported on the windows platform. |
|  Action  |No action. Cannot use ExportPDF functionality on non-windows platform. |

|  Code  | ALC-PDG-011-036 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Acrobat encountered a problem in processing the input file. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-011-037 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error while converting the input file to PDF using Acrobat. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-012-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |This file could not be converted to PDF. |
|  Action  |Verify that the input file is a supported format. Contact the system administrator and report the issue to Adobe Technical Support. |

|  Code  | ALC-PDG-012-011 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The supplied PostScript has errors. |
|  Action  |Use a valid PostScript file. |

|  Code  | ALC-PDG-012-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PostScript interpreter ran out of memory. |
|  Action  |Contact the system administrator and get memory increased on server. |

|  Code  | ALC-PDG-012-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PostScript interpreter ran out of disk space. |
|  Action  |Contact the system administrator and get disk space increased on server. |

|  Code  | ALC-PDG-012-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |There was an internal PostScript interpreter error. |
|  Action  |Review the log file and contact the system administrator. If the problem persists, contact Adobe Technical support. |

|  Code  | ALC-PDG-012-015 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PostScript conversion was canceled. |
|  Action  |No action. |

|  Code  | ALC-PDG-012-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The conversion has timed out. |
|  Action  |Increase timeout parameter for conversions. |

|  Code  | ALC-PDG-012-017 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Cannot embed job-options inside PDF/A:Draft compliant PDF documents. |
|  Action  |Deselect the option to embed job-options for PDF/A:Draft compliant PDF documents. |

|  Code  | ALC-PDG-012-018 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PDF open password and the PDF change passwords are identical. |
|  Action  |Use different PDF open password and the PDF change passwords. |

|  Code  | ALC-PDG-012-019 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Trying to apply password-based encryption to PDF/A:Draft compliant PDF documents. |
|  Action  |Do not apply password-based encryption to PDF/A:Draft compliant PDF documents. |

|  Code  | ALC-PDG-012-020 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The filename is invalid since it does not have an extension. |
|  Action  |Include the extension on the filename to indicate the file type. |

|  Code  | ALC-PDG-012-021 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The filename extension is neither PS or EPS. |
|  Action  |Use .ps or .eps files for Distiller service. |

|  Code  | ALC-PDG-012-501 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Runtime error while converting this file. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-012-511 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job data could not be retrieved. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-012-512 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job options could not be retrieved. |
|  Action  |Verify that the job-option name exists. |

|  Code  | ALC-PDG-012-513 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Could not save error message to a file. |
|  Action  |Verify that the application server user has appropriate permissions to write files on server. |

|  Code  | ALC-PDG-012-514 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unknown runtime error. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-012-515 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The lookup for a dependent service failed. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-012-516 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A network communication error was encountered. |
|  Action  |Ensure that network was not broken during conversions. Contact the system administrator and report the issue to Adobe Technical Support. |

|  Code  | ALC-PDG-012-517 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An input/output error was encountered. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-012-518 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to create a data buffer from a file. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Cannot convert file--Acrobat Professional trial version has expired. |
|  Action  |Contact the system administrator and get valid Acrobat license. |

|  Code  | ALC-PDG-015-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Cannot convert file--the system clock has been moved backwards farther than the Acrobat Professional trial license allows. |
|  Action  |Review the log files and contact the system administrator. If problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot open the file. |
|  Action  |Submit your file again or contact the system administrator. |

|  Code  | ALC-PDG-015-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The application cannot open the file and needed to repair it and caused significant modifications to the file. |
|  Action  |File is corrupt. Supply a valid file. |

|  Code  | ALC-PDG-015-005 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |There was an error processing a page of the document. |
|  Action  |Verify that the file is not corrupt and submit file again. |

|  Code  | ALC-PDG-015-006 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |One or more files uploaded for collation is protected. |
|  Action  |Remove security permissions and try again. |

|  Code  | ALC-PDG-015-007 (PDF Generator) |
|---|---|
|  Type  |Info |
|  Cause  |A document cannot be inserted into itself. |
|  Action  |No action. |

|  Code  | ALC-PDG-015-008 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot save the document. |
|  Action  |Verify that the application server user has sufficient file write permissions. |

|  Code  | ALC-PDG-015-009 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Protocol not supported. |
|  Action  |Contact Adobe Technical Support to get a list of supported protocols. |

|  Code  | ALC-PDG-015-010 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An invalid URL was submitted. |
|  Action  |Submit valid URLs. |

|  Code  | ALC-PDG-015-011 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An empty document cannot be created. |
|  Action  |No action. |

|  Code  | ALC-PDG-015-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot apply Acrobat Security as the Open and Change Security Passwords for the document are unique. |
|  Action  |Use different Open and Change security passwords. |

|  Code  | ALC-PDG-015-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Acrobat cannot open the file, it may be either corrupt or an unsupported type. |
|  Action  |Use a valid input file. |

|  Code  | ALC-PDG-015-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |File size not supported. |
|  Action  |The system cannot convert file with page width or height that is beyond the supported maximum of 200 inches. Reduce the dimensions and submit your file again. |

|  Code  | ALC-PDG-015-015 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid file plot area. |
|  Action  |The system cannot convert file with this plot area. Change the plot area to Layout or Extents and submit your file again. |

|  Code  | ALC-PDG-015-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot create a PDF file with bookmarks, links, or Tagged PDF for Chart placed as Worksheets, Macro Sheets, or Dialog Sheets. |
|  Action  |Edit and submit your file again. |

|  Code  | ALC-PDG-015-017 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot create a PDF file with bookmarks, links, or Tagged PDF when document is a shared workbook. |
|  Action  |Edit and submit your file again. |

|  Code  | ALC-PDG-015-018 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that is blank. |
|  Action  |Edit and submit your file again. |

|  Code  | ALC-PDG-015-019 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot create a PDF file with bookmarks, links, or Tagged PDF when document contains protected worksheets. |
|  Action  |Remove protection on the worksheets in the Tools menu, and submit your file again. |

|  Code  | ALC-PDG-015-020 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot create a PDF file with bookmarks, links, or Tagged PDF when document is a protected workbook. |
|  Action  |Remove protection on the workbook in the Tools menu, and submit your file again. |

|  Code  | ALC-PDG-015-021 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains setting of Fit to x Pages Wide by y Pages Tall. |
|  Action  |Edit in Page Setup dialog and submit your file again. |

|  Code  | ALC-PDG-015-022 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains worksheets with more than one Print Area. |
|  Action  |Clear Print Area and submit your file again. |

|  Code  | ALC-PDG-015-023 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains worksheets with Print Titles. |
|  Action  |Clear Print Titles in Page Setup dialog and submit your file again. |

|  Code  | ALC-PDG-015-024 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot create a PDF file with bookmarks, links, or Tagged PDF that contain worksheets with Header/Footer size greater than Top and Bottom margins. |
|  Action  |Reduce the Header/Footer size in the Page Setup dialog and submit your file again. |

|  Code  | ALC-PDG-015-025 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains worksheets with different Print Quality settings. |
|  Action  |Edit in Page Set up dialog to ensure that worksheets don't have different Print Quality Settings and submit your file again. |

|  Code  | ALC-PDG-015-026 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that application has encountered a problem. |
|  Action  |Submit your file again. If problem persists, contact the system administrator and report the issue to Adobe Technical Support. |

|  Code  | ALC-PDG-015-027 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains no printable data. |
|  Action  |Edit the file to include some printable area and submit your file again. |

|  Code  | ALC-PDG-015-028 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported the directory name is invalid. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-029 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that the application finds the file format invalid. |
|  Action  |Proivde the input file in one of the supported formats. You can get a list of supported formats from Adobe Technical Support. |

|  Code  | ALC-PDG-015-030 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A resource error has occurred, there is not enough memory or disk space on the system. |
|  Action  |Review the log files and contact the system administrator. If problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-031 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains links to other folders not accessible. |
|  Action  |Verify that the links in input file are valid and accessible. |

|  Code  | ALC-PDG-015-032 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An error occurred during Tagged PDF file generation. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-033 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |File appears to be corrupted. |
|  Action  |Correct and submit your file again. |

|  Code  | ALC-PDG-015-034 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains macros. |
|  Action  |Remove all macros and submit your file again. |

|  Code  | ALC-PDG-015-035 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot read the file. |
|  Action  |Verify that the input file is not corrupt. |

|  Code  | ALC-PDG-015-036 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A table in the file has become corrupted. |
|  Action  |Select the table and choose Convert Table To Text from the Table menu and submit your file again. |

|  Code  | ALC-PDG-015-037 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that Excel cannot find or read the file. |
|  Action  |Verify that the input file is not corrupt. |

|  Code  | ALC-PDG-015-038 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that Word cannot find or read the file. |
|  Action  |Verify that the input file is not corrupt. |

|  Code  | ALC-PDG-015-039 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert password protected or read only files. |
|  Action  |Verify that the input file is not password protected or read only. |

|  Code  | ALC-PDG-015-040 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A system error has occurred. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-041 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |There was an error receiving data from a URL. |
|  Action  |Verify that the input URL is valid and accessible. |

|  Code  | ALC-PDG-015-042 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains Visual Basic project references. |
|  Action  |Remove Visual Basic project references from file and submit again. |

|  Code  | ALC-PDG-015-043 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An encoding type is needed when opening the file by Microsoft Word. |
|  Action  |Use an input file with supported encoding which can open in Microsoft Word. |

|  Code  | ALC-PDG-015-044 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |HTML Import Errors: There are missing files. |
|  Action  |Verify the URL/input HTML file is correct and accessible. |

|  Code  | ALC-PDG-015-045 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |CRASH: A system error has occurred. File caused program to exit. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-046 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Publication contains links to data source files created by external applications or mail client not found on our system. |
|  Action  |Edit file to remove inaccessible links and submit again. |

|  Code  | ALC-PDG-015-047 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains links to external database files. |
|  Action  |Edit file to remove links to external database files and submit again. |

|  Code  | ALC-PDG-015-048 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that contains links to external references. |
|  Action  |Edit file to remove external references and submit again. |

|  Code  | ALC-PDG-015-049 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot create a PDF file with bookmarks, links, or Tagged PDF when Highlight changes in printed document is selected. |
|  Action  |Edit file and submit again. |

|  Code  | ALC-PDG-015-050 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot create a PDF file with bookmarks, links, or Tagged PDF. |
|  Action  |Use valid settings and submit file again. |

|  Code  | ALC-PDG-015-051 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file that is protected for editing. |
|  Action  |Verify that the file is not protected or read-only. |

|  Code  | ALC-PDG-015-052 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Adobe PDF printer has failed to create a PDF file. |
|  Action  |Create PDF using standalone Acrobat. If problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-053 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot open the file. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-054 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |There was an error found when printing the document. |
|  Action  |Try submitting file again. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-055 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |CRASH: Program generated errors. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-056 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |CRASH: A system error has occurred during the PDF generation. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-057 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot locate fonts because they are unavailable or missing. |
|  Action  |Contact the system administrator. It is likely that there is an issue with the PDF Generator installation. |

|  Code  | ALC-PDG-015-058 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot export a PDF file that does not allow text extraction. |
|  Action  |Provide an input PDF that allows text extraction. |

|  Code  | ALC-PDG-015-059 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system reported errors that the image path could not be created and thus images will not be generated. |
|  Action  |Change the permissions, and submit your file again. |

|  Code  | ALC-PDG-015-060 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert password protected files which do not allow modifications. |
|  Action  |Remove password protection and submit file again. |

|  Code  | ALC-PDG-015-061 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot export untagged PDF file. |
|  Action  |Verify that the input PDF file is tagged. |

|  Code  | ALC-PDG-015-062 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot resolve tags in this document and thus cannot export it. |
|  Action  |Verify that the input PDF file is tagged. |

|  Code  | ALC-PDG-015-063 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot export password protected files. |
|  Action  |Remove password protection, and submit file again. |

|  Code  | ALC-PDG-015-064 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |CRASH: Application is unable to continue because of a hardware or system error. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-065 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that PowerPoint cannot read the file. |
|  Action  |Verify that the input file is not corrupt. |

|  Code  | ALC-PDG-015-066 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert the file due to an error. |
|  Action  |Submit the file again. If the problem persists, contact the system administrator and report the issue to Adobe Technical Support. |

|  Code  | ALC-PDG-015-067 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that PowerPoint cannot open the file. |
|  Action  |Verify that the input file is not corrupt. |

|  Code  | ALC-PDG-015-068 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that PowerPoint has insufficient memory to process the file. |
|  Action  |Contact the system administrator and get memory increased on LiveCycle ES server. |

|  Code  | ALC-PDG-015-069 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that PowerPoint received an error during conversion. |
|  Action  |Verify that the input file is not corrupt. Contact the system administrator and report the issue to Adobe Technical Support. |

|  Code  | ALC-PDG-015-070 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot create a PDF file with bookmarks, links, or Tagged PDF when the current view does not contain any tasks or resources. |
|  Action  |Edit file to create a valid view and submit again. |

|  Code  | ALC-PDG-015-071 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot print views or reports which have no tasks or resources displayed. |
|  Action  |Edit file and submit again. |

|  Code  | ALC-PDG-015-072 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PageMaker cannot convert the file when one or more previous version publications are found in the book list. |
|  Action  |Convert all publications to PageMaker 7 and update the book list. Submit file again. |

|  Code  | ALC-PDG-015-073 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system has reported that Word has insufficient memory or disk space to process the file. |
|  Action  |Contact the system administrator to get memory/disk space increased on the server. |

|  Code  | ALC-PDG-015-074 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system could not load the configuration files for the application window monitoring system. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-075 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system could not parse the configuration files for the application window monitoring system. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-076 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot open the file because the application is incompatible. |
|  Action  |Verify that the input file can be opened in a compatible application version. |

|  Code  | ALC-PDG-015-077 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |FrameMaker reports that this document has been damaged. |
|  Action  |Verify that the input document is not corrupt. |

|  Code  | ALC-PDG-015-078 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system could not proceed with the step. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-079 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |One or more OPI image references within an EPS could not be resolved. |
|  Action  |Use a valid input EPS file. |

|  Code  | ALC-PDG-015-080 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Cannot convert PageMaker file from a format prior to version 4.0. |
|  Action  |Use a later version PageMaker file. |

|  Code  | ALC-PDG-015-081 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PageMaker cannot process publication's links. |
|  Action  |Use a valid input PageMaker file. |

|  Code  | ALC-PDG-015-082 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The system cannot convert file because the application found bad table index in the file. |
|  Action  |Edit file to make a valid table index and submit again. |

|  Code  | ALC-PDG-015-083 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PageMaker reports that the file cannot be translated to PC and converted to new version at the same time. |
|  Action  |Use a valid input PageMaker file. |

|  Code  | ALC-PDG-015-084 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Acrobat was unable to process the page because the Paper Capture recognition service unexpectedly terminated. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-085 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Adobe product is not registered or activated. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-015-086 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The filename has characters outside the system language. |
|  Action  |Rename the input file to contain valid characters and submit again. |

|  Code  | ALC-PDG-015-087 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Acrobat was unable to process the file because of insufficient permissions for image extraction. |
|  Action  |Remove security from input file and submit again. |

|  Code  | ALC-PDG-015-088 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |This document cannot be converted because it contains a read-only embedded font. |
|  Action  |Replace the font and submit your file again. If problem persists, contact the system administrator. |

|  Code  | ALC-PDG-015-089 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PowerPoint cannot read the outline from this file. No text converter is installed for this file type. |
|  Action  |Install a proper PowerPoint text converter on server and submit again. |

|  Code  | ALC-PDG-015-090 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |FrameMaker was not able to open the document. |
|  Action  |Verify that the input file is not corrupt. |

|  Code  | ALC-PDG-016-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An invalid file path was specified for PDF post-processing. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-016-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An input/output error occurred while post-processing the PDF document. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-016-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An unknown/unexpected error occurred during PDF post-processing. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-016-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error occurred during native application invocation. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred in the Element's server |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A configuration related error has occurred. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job queue could not be located. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PDF Generator ES server statistics bean could not be looked up. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-005 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The settings are not supported for this product type. |
|  Action  |Use compatible settings only. |

|  Code  | ALC-PDG-019-006 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while loading the configuration. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-007 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |An exception occurred while committing the configuration. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-008 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The configuration file is locked for updating. |
|  Action  |Try again. |

|  Code  | ALC-PDG-019-009 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The configuration file could not be parsed. |
|  Action  |Use a valid configuration file. |

|  Code  | ALC-PDG-019-010 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The configuration file has been modified since the last load. |
|  Action  |Reload the configuration file. |

|  Code  | ALC-PDG-019-011 (PDF Generator) |
|---|---|
|  Type  |Info |
|  Cause  |The setting is being used by a defined job source. |
|  Action  |No Action. |

|  Code  | ALC-PDG-019-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A new configuration settings could not be created. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A read only configuration settings can not be changed. |
|  Action  |Create a new setting. |

|  Code  | ALC-PDG-019-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Both passwords in the security settings are same |
|  Action  |Use different passwords in security settings. |

|  Code  | ALC-PDG-019-015 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A setting set as default can not be deleted |
|  Action  |Set a different setting as default and then delete. |

|  Code  | ALC-PDG-019-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No name for the setting has been specified |
|  Action  |Specify a name for the setting. |

|  Code  | ALC-PDG-019-017 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The name of the setting cannot contain special characters. |
|  Action  |Remove special characters from name and save again. |

|  Code  | ALC-PDG-019-018 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Some extensions occur for more than one file type. |
|  Action  |Verify that the extension occurs for only one filetype in file-type settings. |

|  Code  | ALC-PDG-019-019 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The configuration setting can not be found. |
|  Action  |Verify that the setting exists in the PDF Generator database. |

|  Code  | ALC-PDG-019-020 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job options are invalid and not well formed. |
|  Action  |Use valid job options. |

|  Code  | ALC-PDG-019-021 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The settings with this name already exist. |
|  Action  |Use a different name for the setting. |

|  Code  | ALC-PDG-019-022 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job options could not be parsed due to invalid structure. |
|  Action  |Edit job option and correct the structure. |

|  Code  | ALC-PDG-019-023 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job options could not pass the validation check. |
|  Action  |Verify that the job options are valid. |

|  Code  | ALC-PDG-019-024 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job options could not be written to configuration. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-025 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The configuration XML is invalid. |
|  Action  |Edit the configuration XML and ensure that it conforms to schema. |

|  Code  | ALC-PDG-019-026 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The security settings and job options to be applied are incompatible. |
|  Action  |Use compatible security and job option settings. |

|  Code  | ALC-PDG-019-027 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The job options to be applied are not proper. |
|  Action  |Verify that the job options conform to schema. |

|  Code  | ALC-PDG-019-028 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The URL does not point to a valid Adobe PDF document. |
|  Action  |Check the URL target and ensure that it is a valid PDF. |

|  Code  | ALC-PDG-019-029 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The URL returned a Page not found 404 error. |
|  Action  |Verify that the URL is accessible. |

|  Code  | ALC-PDG-019-030 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value found corresponding to the key. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-031 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid character found - expected - <. |
|  Action  |Use only valid characters in input files. |

|  Code  | ALC-PDG-019-032 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid character found - expected - >. |
|  Action  |Use only valid characters in input files. |

|  Code  | ALC-PDG-019-033 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Illegal location for dictionary. |
|  Action  |PDF file seems to be corrupt. Use a valid file. |

|  Code  | ALC-PDG-019-034 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unexpected dictionary end, no start. |
|  Action  |PDF file seems to be corrupt. Use a valid file. |

|  Code  | ALC-PDG-019-035 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Illegal location for array. |
|  Action  |PDF file seems to be corrupt. Use a valid file. |

|  Code  | ALC-PDG-019-036 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unexpected array end, no start. |
|  Action  |PDF file seems to be corrupt. Use a valid file. |

|  Code  | ALC-PDG-019-037 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unknown character. |
|  Action  |Input file is corrupt. Use a valid file. |

|  Code  | ALC-PDG-019-038 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Illegal location for the data, expected dictionary. |
|  Action  |PDF file seems to be corrupt. Use a valid file. |

|  Code  | ALC-PDG-019-039 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unknown literal found. |
|  Action  |PDF file seems to be corrupt. Use a valid file. |

|  Code  | ALC-PDG-019-040 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unknown failure. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-041 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Runtime error. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-042 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The specified value is not valid. |
|  Action  |Correct the specified value as given in error message. |

|  Code  | ALC-PDG-019-043 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The specified value is not valid. |
|  Action  |Correct the specified value as given in error message. |

|  Code  | ALC-PDG-019-044 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Integer value required. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-045 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No job options map specified. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-046 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No Distiller Params map found. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-047 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No PageParams map found. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-048 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unknown data class found. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-049 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The configuration is not loaded for editing. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-050 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value for change permissions. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-051 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid value for print permissions. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-052 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error in validating security settings changes. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-053 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |New job option settings could not be created. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-054 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error in validating initial view setting changes. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-055 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |JobOption settings not found. |
|  Action  |Verify that the setting exists in PDFG database. |

|  Code  | ALC-PDG-019-056 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Security settings not found. |
|  Action  |Verify that the setting exists in PDF Generator database. |

|  Code  | ALC-PDG-019-057 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Filetype setting not found. |
|  Action  |Verify that the setting exists in PDF Generator database. |

|  Code  | ALC-PDG-019-058 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error in validating filetype setting changes. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-059 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |PDFExport is not supported in PostScript version of the product. |
|  Action  |Contact system administrator and get a valid PDF Generator license to support PDFExport. |

|  Code  | ALC-PDG-019-060 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Encountered error while importing the XMP file. |
|  Action  |Verify that the XMP file is valid XMP format. |

|  Code  | ALC-PDG-019-061 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Failed to obtain password from the cipher. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-020-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Corrupt GIF file. |
|  Action  |Use a valid GIF file and try again. |

|  Code  | ALC-PDG-020-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No imageIO readers available. |
|  Action  |This image file is currently not convertible. If you are running LiveCycle on Windows platform, try the Acrobat conversion route. |

|  Code  | ALC-PDG-020-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Corrupt image file. |
|  Action  |Try a different image file which is not corrupt. |

|  Code  | ALC-PDG-020-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The TIFF image header contains a value of the Photometric Interpretation field that is not allowed. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-005 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |ycbcr color space not supported yet. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if LiveCycle server running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-006 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Transparency mask not supported yet. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-007 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Incomplete color map in the image. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-008 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |LZW with predictor not supported. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-009 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |JPEG 2000 not supported. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-010 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Cannot handle extra samples in compressed data. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-011 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Cannot handle 16 bit compressed data. We need to down sample data as it is not handled properly otherwise. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Extra samples are only supported for 8 and 16 bit images. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Only single strip compressed data can be handled. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Compressed tiled format is not supported. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-015 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unsupported bits per component. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unsupported planar configuration. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-017 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Required field number is absent. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-018 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unexpected header found in the specified TIFF image. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is server running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-019 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid TIFF. Root type and value types differ for some field node |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-020 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid index. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-021 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid type. Cannot convert to int. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-022 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid type. Cannot convert to int array. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-023 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid type. Not an ascii type. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-024 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid type. Not a rational type. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-025 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unsupported frame components. Support only 1 or 3. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-020-026 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No Marker Sequence found. |
|  Action  |Alternate route automatically tried. Use Acrobat to convert file if the LiveCycle server is running on Windows, try using Acrobat conversion route. |

|  Code  | ALC-PDG-021-501 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unknown runtime error. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-PDG-040-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Host name is not set. |
|  Action  |Specify the host name. |

|  Code  | ALC-PDG-040-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Email user name is not set. |
|  Action  |Specify the email ID for the use. |

|  Code  | ALC-PDG-040-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Email address is not set. |
|  Action  |Specify the email ID for the use. |

|  Code  | ALC-PDG-040-004 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |SMTP authentication failed. |
|  Action  |Verify that the SMTP server is responding and proper credentials have been set. |

|  Code  | ALC-PDG-040-005 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |provider.email_sendmail_service service is not installed. |
|  Action  |Contact system administrator to install the SendMail service. |

|  Code  | ALC-PDG-080-023 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Acrobat_PATH environment variable not set or is invalid. |
|  Action  |Set this variable to point to acrobat.exe in Acrobat version 9 or above and restart the application server. |

|  Code  | ALC-PDG-080-024 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Target PDF version specified for OptimizePDF operation is not supported. |
|  Action  |Refer documentation to get a list of supported target PDF versions for OptimizePDF operation |

|  Code  | ALC-PDG-080-025 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Filetype settings specified do not have the Optimizer settings section. |
|  Action  |For optimizePDF operation, filetype settings contain the Optimizer settings. Provide valid settings for conversion |

|  Code  | ALC-PDG-080-026 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Illegal characters are present in the user name while doing Export PDF or Optimize PDF using Acrobat. |
|  Action  |Ensure that user running the PDFG does not contain any character in his/her name as mentioned in GeneratePDF Service configuration. |

|  Code  | ALC-PDG-080-027 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Regular Expression specified in the service configuration of GeneratePDF Service is incorrect. |
|  Action  |Specify valid regular expression. |

|  Code  | ALC-PDG-080-028 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Primary conversion route failed. |
|  Action  |Depends on the actual error message which follows this code. |

|  Code  | ALC-PDG-080-029 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Fallback conversion route failed |
|  Action  |Depends on the actual error message present after the code. |

|  Code  | ALC-PDG-080-030 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Either the 'sudo' utility has not been installed on the server , or it is not included in the system PATH. |
|  Action  |Install 'sudo' utility and make sure that it is present in system path. |

|  Code  | ALC-PDG-015-091 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Input file uses additional WordPerfect project files. Such files are not supported. |
|  Action  |Provide valid input files. |

|  Code  | ALC-PDG-015-092 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The server registry policy settings blocks the opening of files created in earlier version of Microsoft Office. |
|  Action  |Follow Microsoft office documentation and enable opening of previous version files. |

|  Code  | ALC-PDG-017-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The submitted input file is either password protected or not a valid OpenOffice file. |
|  Action  |Provide valid non-password protected input files. |

|  Code  | ALC-PDG-017-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Unable to change the permission of the directory : |
|  Action  |Contact system administrator. Ensure that user has sufficient privileges. |

|  Code  | ALC-PDG-040-006 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Some setting name provided during PDFG Network Printer setting does not exist. |
|  Action  |Enter valid values while configuring PDFG Network Printer. |

|  Code  | ALC-PDG-040-007 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The Operation specified for the process does not exist on server. |
|  Action  |Enter a valid operation name that exists on server. |

|  Code  | ALC-PDG-040-008 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The input parameter name specified is not of type com.adobe.idp.Document. |
|  Action  |Only operations which have input parameter of type Document are supported. |

|  Code  | ALC-PDG-040-009 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The PDFG network printer settings could not be retrieved from the server. |
|  Action  |Contact system administrator. |

|  Code  | ALC-PDG-052-012 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The Html Converter ran out of memory. |
|  Action  |Contact system administrator to get more memory allocated. |

|  Code  | ALC-PDG-052-013 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The Html Converter ran out of disk space. |
|  Action  |Create some free space on the server both in server and temp locations. |

|  Code  | ALC-PDG-052-014 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |There was an unexpected error while converting HTML content to PDF. |
|  Action  |Contact system administrator. |

|  Code  | ALC-PDG-052-015 (PDF Generator) |
|---|---|
|  Type  |Info |
|  Cause  |The HTML conversion was canceled. |
|  Action  |No action. |

|  Code  | ALC-PDG-052-016 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |The conversion has timed out. |
|  Action  |Increase conversion timeout. Contact documentation to get information on how to do it. |

|  Code  | ALC-PDG-052-017 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Internal Parsing Error(URL cannot be parsed). |
|  Action  |Make sure that the URL is valid and accessible. |

|  Code  | ALC-PDG-052-018 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Connection to host cannot be resolved(URL does not exist). |
|  Action  |Provide a valid accessible URL. |

|  Code  | ALC-PDG-052-020 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |HTML Converter could not convert the given file or URL. |
|  Action  |Contact system administrator. |

|  Code  | ALC-PDG-052-021 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Invalid extension for input file for HTML to PDF operation. |
|  Action  |The filename extension must be either HTM or HTML. |

|  Code  | ALC-PDG-052-022 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |There was an unexpected error while converting HTML content to PDF. |
|  Action  |Contact system administrator. |

|  Code  | ALC-PDG-080-031 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |LiveCycle PDF Generator was unable to determine the type of the file submitted for conversion. |
|  Action  |Specify the correct extension of the input file. |

|  Code  | ALC-PDG-080-032 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error occurred while saving the user account information for user. |
|  Action  |Contact the system administrator. Check for issue with TrustStore installation. |

|  Code  | ALC-PDG-080-033 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error occurred while deleting the user account information for user |
|  Action  |Contact the system administrator. Check for issue with TrustStore installation.. |

|  Code  | ALC-PDG-080-034 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error occurred while retrieving the user accounts information. |
|  Action  |Contact the system administrator. Check for issue with TrustStore installation. |

|  Code  | ALC-PDG-030-001 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error occured while retrieving the user accounts information |
|  Action  |Contact the System Administrator. |

|  Code  | ALC-PDG-030-002 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |A user account with the specified username has already been added. |
|  Action  |Provide unique username. |

|  Code  | ALC-PDG-030-003 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |User account information for user is not valid for the machine . |
|  Action  |Ensure that exists on the mentioned and correct credentials are submitted. |

|  Code  | ALC-PDG-011-038 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |No Target PDF Version was specified for Optimize PDF operation. |
|  Action  |Specify the target PDF version for Optimize PDF operation. |

|  Code  | ALC-PDG-011-039 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Optimize PDF operation is supported only for MS-Windows platforms |
|  Action  |Optimize PDF operation is supported only for MS-Windows platforms. |

|  Code  | ALC-PDG-011-040 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error occurred while optimizing the PDF document. See logs for details. |
|  Action  |Review the log file and contact the System Administrator. If the problem persists contact Adobe Technical Support. |

|  Code  | ALC-PDG-019-062 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Initialization of PDFG cluster cache failed. |
|  Action  |Contact the System Administrator. |

|  Code  | ALC-PDG-019-063 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Store operation to PDFG cluster cache failed. |
|  Action  |Contact the System Administrator. |

|  Code  | ALC-PDG-019-064 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Exception occurred while fetching the data from PDFG cache. |
|  Action  |Contact System Administrator. |

|  Code  | ALC-PDG-019-065 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Exception occurred while removing the entry from PDFG cache. |
|  Action  |Contact the System Administrator. |

|  Code  | ALC-PDG-011-029 (PDF Generator) |
|---|---|
|  Type  |  |
|  Cause  |Error occurred while converting the input native file. |
|  Action  |Review the log files and contact the system administrator. If the problem persists, contact Adobe Technical Support. |

## Process Management error codes {#process-management-error-codes}

## Reader Extensions error codes {#reader-extensions-error-codes}

|  Code  | ALC-RES-001-002 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |No credential found with the given alias. |
|  Action  |Verify in the "Trust Store Management" in Administration Console, if there is a Reader Extensions credential for the given alias. |

|  Code  | ALC-RES-001-004 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The format of the credential specified with the given alias is not supported. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-005 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to create a local instance of a Document Service Factory. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-006 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to create or access the Credential Service. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-007 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The Credential Service did not find the requested credential. |
|  Action  |Contact the system administrator |

|  Code  | ALC-RES-001-008 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to apply the requested usage rights to the given document. |
|  Action  |Check the server logs for the possible causes as this can happen due to invalid inputs, or contact the system administrator |

|  Code  | ALC-RES-001-009 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while trying to access the usage rights of the document. |
|  Action  |Contact the system administrator |

|  Code  | ALC-RES-001-010 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while trying to remove the usage rights of the document. |
|  Action  |  |

|  Code  | ALC-RES-001-011 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while trying to access a shared PDF document. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-014 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while trying to access the usage rights of the document. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-015 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The requested usage right is not allowed by the credential |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-017 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The permissions of the document do not allow usage rights to be applied. |
|  Action  |Check the inputs sent. |

|  Code  | ALC-RES-001-018 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |An error occurred while trying to access the permissions allowed by the document. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-019 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The input document is not a valid document type for this operation. |
|  Action  |Check the input document sent |

|  Code  | ALC-RES-001-020 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The ReaderExtensionsOptions is not correctly specified. |
|  Action  |Check the inputs sent to the Apply Usage Rights API |

|  Code  | ALC-RES-001-021 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The UsageRights are not specified. |
|  Action  |Specify the usage rights to be applied to the input document |

|  Code  | ALC-RES-001-022 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The input PDF document is encrypted and needs to be unlocked for this operation. |
|  Action  |Unlock the input pdf document before calling Reader Extensions Service. |

|  Code  | ALC-RES-001-023 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The credential alias is not specified. |
|  Action  |Specify the credential alias |

|  Code  | ALC-RES-001-024 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The input PDF document is not specified. |
|  Action  |Send an input pdf document |

|  Code  | ALC-RES-001-025 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The credential specified is not a valid Reader Extensions credential. |
|  Action  |Specify a valid reader extensions credential or contact the system administrator if the problem persists. |

|  Code  | ALC-RES-001-026 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |The Reader Extensions credential specified caused an exception while accessing it. |
|  Action  |Contact the system administrator |

|  Code  | ALC-RES-001-027 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to apply the requested usage rights because the credential specified has expired |
|  Action  |Send a valid reader extensions credential |

|  Code  | ALC-RES-001-028 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to access the use count of the credential specified |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-029 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |Usage for the input credential could not be incremented. |
|  Action  |Contact the System Administrator |

|  Code  | ALC-RES-001-030 (Reader Extensions) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to access the usage rights credential specified |
|  Action  |Contact the System Administrator |

## Repository error codes {#repository-error-codes}

|  Code  | ALC-REP-001-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Parameter [paramName] cannot be null. |
|  Action  |Ensure the parameter is not blank and retry the call. |

|  Code  | ALC-REP-002-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Array elements of parameter [paramName] cannot be null. |
|  Action  |Ensure that there are no null elements in the array and retry the call. |

|  Code  | ALC-REP-010-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resourceURI] is a Category and may not be categorized. Categories may not be categorized in other categories. |
|  Action  |Create a category are created by calling writeResource(aCategory). |

|  Code  | ALC-REP-011-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resourceURI] is not a Category and may not categorize other resources. |
|  Action  |  |

|  Code  | ALC-REP-012-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Value [value] is reserved for future use for property [propertyName]. Consult the list. |
|  Action  |This value is within the reserved values list for this attribute. Resubmit the request with a non-reserved value. See ALC-REP-030. |

|  Code  | ALC-REP-013-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Value [value] is not valid for parameter [paramName]. |
|  Action  |A method received a parameter value that did not meet the pre-conditions defined in the API documentation. |

|  Code  | ALC-REP-014-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |A resource named [name] is already categorized in this Category. The target category contains a resource with the same name as the resource submitted for categorization. |
|  Action  |Rename the resource and retry the operation. |

|  Code  | ALC-REP-015-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |A resource exists at URI [resourceURI]. The target URI of a move or copy operation is already in use by another resource. |
|  Action  |Use a different name or remove the resource at the target URI. |

|  Code  | ALC-REP-016-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resourceURI] is locked by user [ownerUserId]. The resource is exclusively locked by another user. |
|  Action  |Request that the other user unlocks the resource before this operation can proceed. |

|  Code  | ALC-REP-017-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |No lock token submitted for locked resource [resourceRI]. The resource is locked by the current user, but no lock tokens matching the lock were submitted with the call. |
|  Action  |Submit the correct lock token and retry the call. |

|  Code  | ALC-REP-018-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resourceURI] does not exist or you do not have sufficient rights to access it. The requested resource could not be retrieved, either because [resourceURI] does not exist, or the user requesting the resource does not have the sufficient rights to access the resource. |
|  Action  |  |

|  Code  | ALC-REP-019-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Property [propertyName] is immutable. The attribute named [attributeName] cannot be modified by clients. |
|  Action  |Informational text only. No action required. |

|  Code  | ALC-REP-020-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Failed to increment major version because version [majorVersion.0] already exists. |
|  Action  |Failed to update the resource version identified by the id-based identifier passed to updateResource(…). Use a different resource version or do not try to update the major version. |

|  Code  | ALC-REP-021-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Failed to increment minor version because version [majorVersion.minorVersion] already exists. |
|  Action  |Failed to update the resource version identified by the ID-based identifier passed to updateResource(…). Use a different resource version or try updating the major version. |

|  Code  | ALC-REP-022-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Failed to update resource because a version already exists with ownerVersion [ownerVersion]. |
|  Action  |A version of the same logical resource already has its ownerVersion attribute set to the value of the ownerVersion attribute in the object submitted for update. Change the ownerVersion attribute and resubmit the resource for update. |

|  Code  | ALC-REP-023-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resourceURI] is not an application instance. |
|  Action  |The method expected the [applicationURI] parameter to resolve to a Application. Ensure that the submitted URI resolves to an application and retry the operation. |

|  Code  | ALC-REP-024-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Relationships of type Relation.TYPE_MEMBER_OF must be manipulated through calls to removeResource(...) and writeResource(...). |
|  Action  |Relation.TYPE_MEMBER_OF is a relationship type managed by the repository and the client cannot manipulate directly (only indirectly through writeResource, moveResource, and removeResource). This exception is thrown when Relation.TYPE_MEMBER_OF is passed to a relationship manipulation API (createRelationship, selectVersion, or removeRelationship). Use one of the following APIs instead: writeResource updateResource moveResource copyResource removeResource |

|  Code  | ALC-REP-025-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Relationships of type Relation.TYPE_CATEGORIZED_BY must be manipulated through calls to categorize(...) and uncategorize(...). |
|  Action  |Relation.TYPE_MEMBER_OF is a relationship type managed by the repository and clients cannot manipulate directly (only indirectly through writeResource, moveResource, and removeResource). This exception is thrown when Relation.TYPE_MEMBER_OF is passed to a relationship manipulation API (createRelationship, selectVersion, or removeRelationship). Use one of the following APIs instead: writeResource updateResource moveResource copyResource removeResource |

|  Code  | ALC-REP-026-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |A category may only be written to the /Categories resource collection or one of its child resource collections. The supplied path was [resourcePath]. |
|  Action  |Change the path to a /Categories resource collection or one of its child resource collections. |

|  Code  | ALC-REP-027-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |A non-category may not be written to the /Categories resource collection or any of its child resource collections. The supplied path was [resourcePath]. |
|  Action  |Change the path to a /Categories resource collection or one of its child resource collections. |

|  Code  | ALC-REP-028-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Invalid major.minor version combination: [majorVersion.minorVersion]. |
|  Action  |A new resource must respect one of the following rules: Major and minor version attributes are unspecified. Major version must be zero and minor version must be greater than zero. Major version must be greater than zero and minor version must be greater or equal to zero. |

|  Code  | ALC-REP-030-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Values [low-hi] are reserved for future use for property [propertyName]. The supplied value [value] falls in this range. |
|  Action  |This value is within the reserved values list for this attribute. Consult the list and resubmit the request with a non-reserved value. See ALC-REP-012-xxx. |

|  Code  | ALC-REP-031-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Invalid lock scope value [value]. Lock scope may only be Lock.SCOPE_EXCLUSIVE or Lock.SCOPE_SHARED. |
|  Action  |A client supplied a lock scope value that is invalid. |

|  Code  | ALC-REP-032-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Invalid lock depth value [value]. Lock depth may only be Lock.DEPTH_ZERO. |
|  Action  |A client supplied a lock depth value that is invalid. |

|  Code  | ALC-REP-033-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Failed to locate a lock for resource [resource URI]. Either you do not own the lock, did not supply the proper lock token or are not unlocking the top level resource for the lock. |
|  Action  |Obtain the lock for [resource URI] or unlock its parent resource collection. |

|  Code  | ALC-REP-034-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource object [resource URI] is not an instance of BOIObject. |
|  Action  |  |

|  Code  | ALC-REP-035-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Initialization failed due to [error message] |
|  Action  |Retry initialize with all required data. |

|  Code  | ALC-REP-036-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The object status cannot be changed to updated when there is only one version of the resource. |
|  Action  |Call updateResource to update the resource or use a custom status. |

|  Code  | ALC-REP-037-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The object status cannot be changed to updated when there is only one version of the resource. |
|  Action  |Change the status to latest or use a custom status. |

|  Code  | ALC-REP-038-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The object status cannot be changed to latest when the resource is not the most recent version. |
|  Action  |Call updateResource to update the resource to latest or use a custom status. |

|  Code  | ALC-REP-039-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The object status cannot be changed to latest when the resource is not the most recent version. |
|  Action  |Call updateResource to update the resource and make it the latest version. |

|  Code  | ALC-REP-040-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Either a relation with source URI [source resource URI], target URI [target resource URI], and a type of [relation type] does not exist or you do not have sufficient rights to access it. |
|  Action  |Verify that the values are correct and that you have access rights to the relation. |

|  Code  | ALC-REP-041-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The [path] is not a category path. Category paths must start with /Categories. |
|  Action  |  |

|  Code  | ALC-REP-042-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resource URI] is share-locked by user [owner userId]. |
|  Action  |Obtain a shared lock on the resource. |

|  Code  | ALC-REP-043-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resource URI] is exclusive-locked by user [owner userId]. |
|  Action  |Request that the user who has the lock release the lock. |

|  Code  | ALC-REP-044-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Two versions of the same resource cannot be made to relate in this manner. |
|  Action  |Verify the resource ID to ensure that the related resources are not versions of the same resource. |

|  Code  | ALC-REP-045-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resource path] cannot be moved into the category hierarchy. |
|  Action  |  |

|  Code  | ALC-REP-046-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource [resource path] cannot be moved out of the category hierarchy. |
|  Action  |  |

|  Code  | ALC-REP-047-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The supplied resource name contains the following invalid characters: [character list] |
|  Action  |Ensure that the name does not contain the characters reported in the error message. If the problem persists, contact Adobe Technical Support. |

|  Code  | ALC-REP-048-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Property [property name] in namespace [property namespace] is immutable. |
|  Action  |Do not try to update immutable properties. |

|  Code  | ALC-REP-049-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Property [property name] in namespace [property namespace] cannot be made null or removed. |
|  Action  |Set [property name] to a valid value. |

|  Code  | ALC-REP-050-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Resource URI [resource URI] must be a path. |
|  Action  |Use the correct path for the [resource URI]. |

|  Code  | ALC-REP-051-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |[resource URI] is a system object and cannot be deleted. |
|  Action  |Do not try to delete system paths. |

|  Code  | ALC-REP-052-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Property [property name] cannot be added to reserved namespace [property namespace]. |
|  Action  |You cannot add the property to the reserved namespace. |

|  Code  | ALC-REP-053-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The path [resource path] does not identify a resource or resource collection. |
|  Action  |  |

|  Code  | ALC-REP-054-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Invalid depth value [value]. Depth may only be DEPTH_ZERO. |
|  Action  |Use a valid lock depth. |

|  Code  | ALC-REP-055-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The destination [resource URI] is not a resource collection. Resources can only be moved or copied into resource collections. |
|  Action  |Verify that the [resource URI] destination paths references a resource collection. |

|  Code  | ALC-REP-056-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The [resource URI] is a system object and cannot be updated. |
|  Action  |You cannot update system objects. |

|  Code  | ALC-REP-057-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |A type mismatch exists: A resource must be updated with a resource of the same type. |
|  Action  |Update resource with resource of same object type. |

|  Code  | ALC-REP-058-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |User Manager permissions not loaded [error message]. This error is thrown when a USer Manager ResourceType does not contain the expected number of permissions. This indicates a major system malfunction that cannot be recovered. |
|  Action  |Indicates a major system malfunction that cannot be recovered. Contact Adobe Technical Support. |

|  Code  | ALC-REP-059-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |User access to resource [resource URI] not allowed for permission request [permission type] on resource [resource URI]. An operation was requested on a resource to which the current user does not have sufficient privileges. |
|  Action  |Grant the user sufficient privileges for the operation, or switch to an operation that the user does have sufficient privileges to request. |

|  Code  | ALC-REP-060-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The format of the value of URL parameter [URLl] is incorrect. The supplied value is [supplied URL]; expected [major.minor]. |
|  Action  |Use a version string in the correct format" [major.minor]. |

|  Code  | ALC-REP-061-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Context deserialization failed and returned a null user context. |
|  Action  |  |

|  Code  | ALC-REP-062-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The specified source URI is a system resource collection. |
|  Action  |You can move or copy system paths. |

|  Code  | ALC-REP-063-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |The specified resource ID [resource Id] is not a version of the resource selected for update. |
|  Action  |Use a version of the resource that you want to update. It cannot be a different logical resource. |

|  Code  | ALC-REP-100-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Caught POFException due to [error message]. |
|  Action  |Review the wrapped exception for details. |

|  Code  | ALC-REP-101-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Caught UMException due to [error message]. |
|  Action  |Review the wrapped exception for details. |

|  Code  | ALC-REP-102-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Caught RemoteException due to [error message]. |
|  Action  |Review the wrapped exception for details. |

|  Code  | ALC-REP-103-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Caught Exception due to [error message]. |
|  Action  |Review the wrapped exception for details. |

|  Code  | ALC-REP-104-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Caught ResourceManagerException due to [error message]. |
|  Action  |Review the wrapped exception for details. |

|  Code  | ALC-REP-105-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Caught IOException due to [error message]. |
|  Action  |Review the wrapped exception for details. |

|  Code  | ALC-REP-106-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Caught DSCException due to [error message]. |
|  Action  |Review the wrapped exception for details. |

|  Code  | ALC-REP-107-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Caught CacheException due to [error message]. |
|  Action  |Review the wrapped exception for details. |

|  Code  | ALC-REP-200-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |No metadata extraction capabilities available for [mimeType]. |
|  Action  |  |

|  Code  | ALC-REP-201-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Failed to instantiate metadata extractor for [mimeType]. |
|  Action  |Verify that the MIME type is correct and that it is supported. |

|  Code  | ALC-REP-202-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Failed to extract metadata. |
|  Action  |Verify that the metadata in the resource is valid and matches the MIME type. |

|  Code  | ALC-REP-203-xxx (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Failed to parse XMP in data stream. |
|  Action  |Verify that the metadata in the resource is valid and matches the MIME type. |

|  Code  | The type XappstoreUrlDataProviderBean is deprecated (Repository) |
|---|---|
|  Type  |  |
|  Cause  |Two warnings are logged in the application server log: A warning is issued from the EJBDeploy program: ejbModule/com/adobe/url/EJSLocalStatelessXappstoreUrlDataProvider_b1f718de.java(30): The type XappstoreUrlDataProviderBean is deprecated [severity 1] ejbModule/com/adobe/url/EJSLocalStatelessXappstoreUrlDataProvider_b1f718de.java(31): The method getInputStream(String, byte[], StringBuffer) from the type XappstoreUrlDataProviderBean is deprecated [severity 1] These warnings indicate that the XappstoreUrlDataProviderBean class and the getInputStream(String, byte[], StringBuffer) method are depricated. |
|  Action  |You can ignore these warnings. |

|  Code  | ALC-REP-014-000 (Repository) |
|---|---|
|  Type  |Error |
|  Cause  |A resource name is already categorized in this category. |
|  Action  |  |

|  Code  | ALC-REP-015-000 (Repository) |
|---|---|
|  Type  |Error |
|  Cause  |A resource exists at URI |
|  Action  |  |

|  Code  | ALC-REP-016-000 (Repository) |
|---|---|
|  Type  |Error |
|  Cause  |A resource is locked buy user |
|  Action  |  |

|  Code  | ALC-REP-018-000 (Repository) |
|---|---|
|  Type  |Error |
|  Cause  |The resource does not exist or you do not have sufficient rights to access it |
|  Action  |  |

|  Code  | ALC-REP-020-000 (Repository) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to increment major version because version already exists |
|  Action  |  |

## Rights Management error codes {#rights-management-error-codes}

|  Code  | 1 (0x1) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Generic error. |
|  Action  |Examine the application server log. Client-application developers can also call the getErrorMessage() or getServerMessage() methods on the exception object for more details. The strings returned from these methods can be printed to an application’s log file or to the user console. |

|  Code  | 259 (0x103) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Error in Microsafe operation or in other client-side task. |
|  Action  |Review the application server log for details. Verify that client installation was successful. Client-application developers can also call the getErrorMessage() or getServerMessage() methods on the exception object for more details. The strings returned from these methods can be printed to an application’s log file or to the user console. |

|  Code  | 513 (0x201) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Authentication failed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 514 (0x202) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Authentication was cancelled by the user. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 515 (0x203) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Invalid authentication token. |
|  Action  |The authentication token has expired and requires reauthentication. This error can also occur if a cluster is improperly configured and cache invalidation is not occurring or if somehow the token was corrupted/tampered with. |

|  Code  | 516 (0x204) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Client version is missing. Generally should not occur. |
|  Action  |Ensure that an unsupported client is not being used. |

|  Code  | 517 (0x205) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Client version mismatch. |
|  Action  |A server that is incompatible with the client. |

|  Code  | 518 (0x206) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |The user account is locked. |
|  Action  |Generally occurs when after too many invalid login attempts |

|  Code  | 769 (0x301) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Document was revoked. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 770 (0x302) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |User does not have permission to view the content. The policy does not grant access to the user. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 771 (0x303) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |The user does not have permission to revoke the content. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 772 (0x304) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |User does not have permission to view audit information on the content. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 773 (0x305) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |User does not have permission to view the document because access to it has expired |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 774 (0x306) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |A constant indicating that the client has outdated information and must synchronize with the server or open the document while online before opening the document offline. |
|  Action  |Resynchronize with the server or open the document while online before attempting to open the document offline. |

|  Code  | 775 (0x307) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Indicates that the request has been denied because the associated permission has not been granted. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 776 (0x308) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Invalid revocation reason. The provided revocation reason is invalid |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 777 (0x309) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Must open online before viewing offline. The offline lease has expired, and the document must be opened while online before it can be opened offline. |
|  Action  |Open the document while online. Ensure that offline access is still grated on the secured document. |

|  Code  | 1025 (0x401) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Failed to connect to server. The client could not establish a connection with the server. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1026 (0x402) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Failed to communicate with server. Indicates an error occurred while communicating with the server. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1027 (0x403) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Offline synchronization failed. The client failed to complete synchronization with the server for offline access. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1028 (0x404) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Initial synchronization required to view offline. The client must synchronize for offline access before viewing the document offline. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1029 (0x405) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |No offline permission. The user does not have permission to view the content offline. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1030 (0x406) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Mus syncronize for offline. The user has not performed a recent offline synchronization. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1031 (0x407) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Corrupted security information. Security information in a file is corrupted. This could be as the result of intentional tampering or simple file corruption. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1032 (0x408) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Internal server error. Indicates that there was a database or other internal problem that is not expected to occur. |
|  Action  |Examine the server log to get more detail on the error. |

|  Code  | 1033 (0x409) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Duplicate entry failure. Attempting to add a duplicate of a unique entry. For example, trying to create 2 policies with exactly the same name in the same policy set. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1280 (0x501) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Invalid Aagument . An invalid parameter was provided, generally in an API call. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1282 (0x502) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Bad PDRL format. A PDRL policy was provided that does not comply with the schema. |
|  Action  |Review the server log for more details. |

|  Code  | 1283 (0x503) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Privacy notification refused. The client refused the privacy notification and thus cannot proceed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1284 (0x504) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Invalid policy. The provided policy was invalid |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1285 (0x505) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Bad policy setting. Attempting to change a policy setting in a way that was not allowed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1286 (0x506) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Document already revoked. A user is attempting to revoke a document that has already been revoked. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1287 (0x507) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Document already unrevoked. A user is attempting to un-revoke (reinstate) a document that is not revoked. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1289 (0x509) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |No permission administrator role. An administrator is trying to access functionality that they are not permitted to access. Some end-user functionality, such as the end-user console is not not permitted for administrators for security reasons. |
|  Action  |Attempt the operation as a non-administrator. |

|  Code  | 1290 (0x50A) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |No Such ID. An ID has been provided that does not exist (for example, a policy or license ID). This may be happen if a system has been re-bootstrapped since a document was secured. In that case the document/license id no longer exists in the Database. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1291 (0x50B) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Mismatched policy encryption settings. The policy encrytion settings are invalid. For example, trying to switch a policy on a document from one that does encrypt metadata to one that doesn't. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1292 (0x50C) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |No such license ID. The license ID for a document does not exist. This would likely occur if the server had been re-bootstrapped since the file was secured. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1293 (0x50D) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Attempting to register a hidden user. External users cannot be registered because they were deleted or hidden by an administrator. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1294 (0x50E) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Mismatched anonymous settings. A non-anonymous policy has been updated to become anonymous. This is not is not allowed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1296 (0x510) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Not authorized. A request has been denied because the user is not authorized. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1297 (0x511) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Invalid policy XML. The XML used to represent a policy is not valid. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1298 (0x512) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Invalid license XML. The XML used to represent a license is not valid. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1299 (0x513) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Registration disable. The external user registration service is disabled. |
|  Action  |Enable it in the Rights Management administration web application. |

|  Code  | 1300 (0x514) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Admin duplicate entry. Attempting to insert a value that already exists. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1301 (0x515) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Registration blacklist . The user who is trying to be registered belongs to the registration blacklist. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1302 (0x516) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Policy switch not allowed. Switching the policy is not permitted. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1303 (0x517) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Policy already deleted. User is attempting to delete a policy that has already been deleted. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 1304 (0x518) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |HTTPS URL is required. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 2100 (0x834) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Service is disabled. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 2101 (0x835) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Invalid policy ownership change. Attempting to change the policy owner that is not allowed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | 519 (0x207) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |A particular version of the client was not allowed to connect to the server because the system administrator has configured the server to disallow that version of the client. |
|  Action  |Compare the client-supplied application information against Denials settings in the Rights Management XML configuration file. Some possible actions: Update the client software to the most recent version. Determine whether your client software requires a different installation of Rights Management. |

|  Code  | 1040 (0x410) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Attempting to add the same user as a coordinator of a policy set multiple times. |
|  Action  |You cannot add the same user as a coordinator of a policy set if the user is already a coordinator for that policy set. |

|  Code  | 1041 (0x411) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Attempting to add the same user as a document publisher for a policy set multiple times. |
|  Action  |You cannot add a user as a document publisher for a policy set if that user is already a document publisher for that policy set. |

|  Code  | 1305 (0x519) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Attempting to invoke an API with the maximum requested results set to zero or less. |
|  Action  |Ensure that the maximum results requested is greater than zero. |

|  Code  | 520 (0x208) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Network communication between the CSDK and the RM Server is being accidentally or maliciously altered. |
|  Action  |Determine if one of the following is occurring: &ast; A proxy server or firewall is manipulating http message contents &ast; A virus or client-side debugger is manipulating message contents &ast; A node on the network is attempting a main-in-the-middle exploit |

|  Code  | 1313 (0x521) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Document is not yet revoked. This happens when user tries to un-revoke a document which has never been revoked. |
|  Action  |User cannot unrevoke a document which has never been revoked. |

|  Code  | 1318 (0x526) (Rights Management) |
|---|---|
|  Type  |  |
|  Cause  |Deleting events process is currently in progress. Try again later. This happens when user try to delete events while a deleting events process is in progress. |
|  Action  |User cannot delete events while a deleting events process is in progress. |

## Solutions - Asset Composer error codes {#solutions-asset-composer-error-codes}

|  Code  | ALC-ACM-002-001 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide valid object identifier for the {0}. |
|  Action  |An invalid object identifier was given. Verify that the object identifier is valid (not null and not empty). |

|  Code  | ALC-ACM-002-002 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |{0} has dependencies and cannot be deleted! |
|  Action  |The asset is used by another asset and hence cannot be deleted. Delete the dependent assets before deleting this asset. |

|  Code  | ALC-ACM-002-003 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |No {0} exists by the name: {1} |
|  Action  |An asset with the given name does not exist. Verify that an asset with the given name exists in the system. |

|  Code  | ALC-ACM-002-004 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid {0} name: {1} |
|  Action  |An invalid name was given. Verify that the given name is valid (not null and not empty). |

|  Code  | ALC-ACM-002-005 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |A {0} already exists by name: {1} |
|  Action  |An asset with the given name already exist. Change the name of the existing asset or specify another name for the asset you are creating. |

|  Code  | ALC-ACM-002-006 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide a valid Category for the {0}. |
|  Action  |An invalid Category was given. Verify that a valid Category is given and that the Category exists in the system. |

|  Code  | ALC-ACM-002-007 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide a valid SubCategory for the {0}. |
|  Action  |An invalid SubCategory was given. Verify that a valid SubCategory is given and that the SubCategory exists in the system. |

|  Code  | ALC-ACM-002-008 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |A {0} in Inactive state already exists by name: {1} |
|  Action  |An asset with the given name already exist in the Inactive state. Change the name of the existing asset or specify another name for the inactive asset you are creating. |

|  Code  | ALC-ACM-002-009 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |No {0} exists in Inactive state by name: {1} |
|  Action  |No asset with the given name exists in the Inactive state. Verify that an asset with the given name exists in the Inactive state. |

|  Code  | ALC-ACM-002-010 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid asset type : {0} |
|  Action  |Unknown asset type. Verify that the given asset type exists in the system. |

|  Code  | ALC-ACM-002-011 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid asset state : {0} |
|  Action  |Unknown asset state. Verify that the given asset state is a valid state in the system. |

|  Code  | ALC-ACM-002-013 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Unexpected error |
|  Action  |General unexpected error. Usually occurs if there is a Runtime error. Check the application logs for more details and report the error. |

|  Code  | ALC-ACM-002-014 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary used in the new Content is not same as that of the old Content! |
|  Action  |The updated Content uses a different Data Dictionary. Verify that the Data Dictionary used in the updated content is the same as that of the earlier Content. |

|  Code  | ALC-ACM-002-015 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Updated Content has incompatible Data References in it! |
|  Action  |The updated Content contains incompatible Data References. Verify that none of the earlier Data References have been removed or modified. |

|  Code  | ALC-ACM-002-016 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Updated Layout has incompatible targets in it! |
|  Action  |The updated layout contains incompatible targets (target areas or fields). Verify that none of the earlier target areas or fields have been removed or modified from the layout. |

|  Code  | ALC-ACM-002-101 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide a valid category type. |
|  Action  |An invalid Category type was given. Verify that the correct Category type was given. |

|  Code  | ALC-ACM-002-102 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot change the category name as it has dependencies. |
|  Action  |Category name cannot be updated since it is used by other assets. Remove the Category dependencies from the assets and then update the Category name |

|  Code  | ALC-ACM-002-201 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide a valid Layout template for the Letter! |
|  Action  |An invalid Layout was specified for the Letter. Verify that a non-null Layout was chosen for the Letter. |

|  Code  | ALC-ACM-002-202 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Letter name cannot be same as Layout name. |
|  Action  |Verify that a Layout does not exist by the same name as the Letter. |

|  Code  | ALC-ACM-002-203 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide valid test data for the Letter. |
|  Action  |Verify that a valid sample data XML is provided for the Letter |

|  Code  | ALC-ACM-002-204 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |{1} uses an inactive {0}. Activate the {0} before activating the {1}. |
|  Action  |The Asset being activated uses inactive assets. The dependent assets must be actived before this asset is activated. |

|  Code  | ALC-ACM-002-301 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |XDP file name or XDP file contents missing, provide valid layout template\! |
|  Action  |Empty or null XDP provided for the Layout. Verify that a valid XDP is provided for the Layout. |

|  Code  | ALC-ACM-002-401 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Picture file name or contents missing, provide valid Picture data\! |
|  Action  |Empty or null image bytes provided for the Picture. Verify that a valid image data is provided. |

|  Code  | ALC-ACM-002-402 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Content type! |
|  Action  |Invalid Content type provided. Verify that the Content type exists in the system. |

|  Code  | ALC-ACM-002-403 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide valid data for the {0}\! |
|  Action  |Verify that valid or non-empty data is provided. |

|  Code  | ALC-ACM-002-404 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Data Reference {0} in {1}! |
|  Action  |Verify that a valid or non-empty Data Reference is provided. Verify that the Data Reference syntax is correct. |

|  Code  | ALC-ACM-002-501 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Folder for the Portfolio. |
|  Action  |Verify that a valid Folder is provided for the Portfolio. |

|  Code  | ALC-ACM-002-502 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Portfolio does not contain any source documents. |
|  Action  |Verify that the Portfolio has one or more source documents in it. |

|  Code  | ALC-ACM-002-601 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide a valid document. |
|  Action  |Verify that a valid, non-null Document is provided. |

|  Code  | ALC-ACM-003-001 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error resolving data module content |
|  Action  |There was a problem resolving the data for the Content. Cause will be provided. Verify that all necessary/dependent data items are provided to resolve the Content. |

|  Code  | ALC-ACM-003-002 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Rendered PDF was null. |
|  Action  |An empty or null PDF document was rendered for the Letter. There may have been an error rendering the document. Cause will be provided. |

|  Code  | ALC-ACM-003-003 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error rendering {0} : |
|  Action  |Generic error while rendering. Cause will be provided. |

|  Code  | ALC-ACM-003-004 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |No data XML to render the {0} |
|  Action  |Verify that a non-empty, non-null data XML was provided for rendering. |

|  Code  | ALC-ACM-003-005 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid data XML for the {0} |
|  Action  |Verify that a valid XML data was provided for rendering. |

|  Code  | ALC-ACM-003-006 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid value for Field [{0}] |
|  Action  |Verify that the value for the Layout's Field is valid. |

|  Code  | ALC-ACM-003-007 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |{0} uses an invalid Data Dictionary |
|  Action  |Verify that a valid Data Dictionary is used and that the Data Dictionary exists in the system. |

|  Code  | ALC-ACM-003-101 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error evaluating expression: {0} |
|  Action  |Error occurred while evaluating an expression. Cause is provided. |

|  Code  | ALC-ACM-003-201 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error fetching services: |
|  Action  |Error occurred while fetching post-processing services. Cause is provided. |

|  Code  | ALC-ACM-003-202 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error invoking LC service: {0} |
|  Action  |Error occurred while invoking the post-processing service. Cause is provided. |

|  Code  | ALC-ACM-003-203 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error fetching configuration for LC service : {0} |
|  Action  |Error occurred while fetching configuration details for the post-processing service. Cause is provided. |

|  Code  | ALC-ACM-003-204 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |No operation {0} found for LC service: {1} |
|  Action  |Verify that the given post-process operation exists on the post-processing service. |

|  Code  | ALC-ACM-004-001 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error loading configuration file. |
|  Action  |Error loading the application's configuration file(s). Cause is provided. |

|  Code  | ALC-ACM-005-001 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error submitting the {0} |
|  Action  |Error occurred while submitting the given Letter. Cause is provided. |

|  Code  | ALC-ACM-005-002 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Submit invoked with missing {0} ID. |
|  Action  |Verify that a Letter identifier was provided for submitting the Letter. |

|  Code  | ALC-ACM-002-012 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid asset version : {0} |
|  Action  |Unknown asset version. Verify that the given asset version exists in the system. |

|  Code  | ALC-ACM-002-017 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |A {0} already exists by name: {1}, state: {2} and version: {3} |
|  Action  |Verify if an asset already exists by the given name, state and version. If it does, provide a unique combination of the same. |

|  Code  | ALC-ACM-002-018 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Circular dependency detected for {0} : {1} |
|  Action  |Check that there is no circular dependency (reference) among the given assets. |

|  Code  | ALC-ACM-002-019 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot create Inactive version of a {0} that is in {1} state |
|  Action  |Check the state of the asset whose inactive version is being created. |

|  Code  | ALC-ACM-002-020 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot activate {0} version of a {1} |
|  Action  |Verify that the asset is in Inactive state. Only inactive assets can be activated. |

|  Code  | ALC-ACM-002-021 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot copy {0} version of a {1} |
|  Action  |Verify the state of the asset being copied. |

|  Code  | ALC-ACM-002-022 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |It is not allowed to use Data Dictionary Elements from two different collections which do not have a parent child relation in a single repeat tag. |
|  Action  |Verify the hierarchy of Data Dictionary Elements used within the repeatable items. |

|  Code  | ALC-ACM-002-023 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Repeatable content must have at least one collection or repeatable variable. |
|  Action  |Verify that the repeatable item has a collection element within it. |

|  Code  | ALC-ACM-002-024 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Updated Content has incompatible variables in it! Adding placeholder variables is not allowed after content is referred in letter by variable or field. |
|  Action  |Verify that the content is not being referred by a variable in a Letter. |

|  Code  | ALC-ACM-002-025 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Expression : {0} |
|  Action  |Verify the expression syntax. |

|  Code  | ALC-ACM-002-302 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide valid XDP for the Layout. |
|  Action  |Verify that the given XDP is valid. |

|  Code  | ALC-ACM-002-351 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Provide details of all the additional configured columns. |
|  Action  |Provide details of all the additional configured columns. |

|  Code  | ALC-ACM-002-352 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |You can not decrease row or column count at the time of table configuration step. |
|  Action  |Verify the row and column count of the given table. |

|  Code  | ALC-ACM-002-353 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |There is a mismatch in number of configured columns and size of the list containing corresponding details. |
|  Action  |Verify the number of configured columns and the size of the list containing corresponding details. |

|  Code  | ALC-ACM-002-354 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Dynamic tables can not contain more than one row. |
|  Action  |Verify the structure of the given dynamic table. |

|  Code  | ALC-ACM-002-355 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Table row does not contain draw element. For extending a table from single cell each of the header, body and footer rows should contain a single draw element. |
|  Action  |Verify the structure of the given Table. |

|  Code  | ALC-ACM-002-356 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Dynamic table's fields can be bound to only data dictionary elements. |
|  Action  |Verify the binding of the Field in the Dynamic Table. |

|  Code  | ALC-ACM-002-357 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Dynamic table can contain only fields in body row. |
|  Action  |Verify the structure of the Dynamic Table. |

|  Code  | ALC-ACM-002-358 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |XDP file name or XDP file contents missing; please provide valid fragment layout template! |
|  Action  |Verify that the given fragment layout XDP is valid. |

|  Code  | ALC-ACM-002-405 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Compound Numbering is only applicable with Numbering style. |
|  Action  |Verify that compound numbering is being used within a List of style Numbering. |

|  Code  | ALC-ACM-002-406 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |{0} Type '{1}' is invalid for Style '{2}'. |
|  Action  |Verify the given Style and Type combination. |

|  Code  | ALC-ACM-002-701 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Indentation level cannot be negative. |
|  Action  |Verify the given indentation level. |

|  Code  | ALC-ACM-002-801 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error in reading ACM Extension Configuration File. |
|  Action  |Verify that the ACM extensions config file exists. |

|  Code  | ALC-ACM-002-702 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Compound Numbering can only be applied on a target {0}. |
|  Action  |Verify that Compound Numbering is only being applied on a target List or Condition. |

|  Code  | ALC-ACM-002-703 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Ignore List Style can only be applied on a target {0}. |
|  Action  |Verify that Ignore List Style is being applied on a target List or Condition. |

|  Code  | ALC-ACM-005-003 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error resolving data URL : {0} |
|  Action  |Verify the connection to the given data URL. |

|  Code  | ALC-ACM-005-004 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Could not evaluate URL : {0} |
|  Action  |Verify that the given URL evaluates to a valid data stream. |

|  Code  | ALC-ACM-005-005 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Cannot resolve URL : {0}, becasue it is a directory reference |
|  Action  |Verify whether the given URL is a directory reference. |

|  Code  | ALC-ACM-005-006 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |File does not exists at URL : {0} |
|  Action  |Verify that the file exists at the given URL. |

|  Code  | ALC-ACM-005-007 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Submit invoked with missing XML data. |
|  Action  |Verify that there is XML data specified with the correspondence submission. |

|  Code  | ALC-ACM-005-008 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Submitting new {0} using latest assets is not allowed. |
|  Action  |Verify if the correspondence is being loaded with latest assets. If yes, submit is not allowed. |

|  Code  | ALC-ACM-001-001 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |You are not authorized to perform this action |
|  Action  |Ensure that you have required permissions to perform this operation. |

|  Code  | ALC-ACM-002-026 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |This {0} is not in Modified state, so can not be marked as ReadyToPublish. |
|  Action  |Ensure that the asset is in Modified state. |

|  Code  | ALC-ACM-002-027 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Unpublished assets having dependent assets can not be reverted. |
|  Action  |Ensure that the asset has no dependency. |

|  Code  | ALC-ACM-002-028 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |An asset in Published state can not be published again. |
|  Action  |Ensure that the asset is not in Published state. |

|  Code  | ALC-ACM-002-029 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Some of the related assets are in Modified state. An asset can be published only if all the related assets are in Published or ReadyToPublish state. |
|  Action  |Ensure that all the parent and child assets are in ReadyToPublish or Published state. |

|  Code  | ALC-ACM-002-359 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid value for container width attribute: {0} |
|  Action  |Provide valid value for width attribute of target area where fragment layout is being mapped. |

|  Code  | ALC-ACM-006-001 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary cannot be deleted because it is being used by other Templates or Data Modules. |
|  Action  |Ensure that Data Dictionary has no dependendencies. |

|  Code  | ALC-ACM-007-001 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error in exporting {0} , asset not published. |
|  Action  |Ensure that asset is in ReadyToPublish or Published state. |

|  Code  | ALC-ACM-007-002 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error in exporting {0}. Related asset {1} not published. |
|  Action  |Ensure that all the related assets are in ReadyToPublish or Published state. |

|  Code  | ALC-ACM-007-003 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error in importing : {0} |
|  Action  |Generic error. Usually occurs if package being imported is not correct. Check the application logs for more details and report the error. |

|  Code  | ALC-ACM-007-004 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error in exporting : {0} |
|  Action  |Generic error. Check the application logs for more details and report the error. |

|  Code  | ALC-ACM-007-005 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error in importing. Could not find content. |
|  Action  |Could not find related assets while importing. Usually occurs if package being imported is not correct. Check the application logs for more details and report the error. |

|  Code  | ALC-ACM-007-007 (Solutions - Asset Composer) |
|---|---|
|  Type  |Error |
|  Cause  |Error in exporting {0} , data dictionary not published. |
|  Action  |Ensure that data dictionary is in ReadyToPublish or Published state. |

## Solutions - Data Dictionary error codes {#solutions-data-dictionary-error-codes}

|  Code  | ALC-DCT-002-001 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary object is null. Pass a valid Data Dictionary Object. |
|  Action  |An invalid object was given. Pass in a valid Data Dictionary Object. |

|  Code  | ALC-DCT-002-002 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary name is null. Pass a valid Data Dictionary name. |
|  Action  |Data Dictionary name cannot be null or empty. Pass a not null, not empty data dictionary name. |

|  Code  | ALC-DCT-002-003 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary with name: {0} already exists. |
|  Action  |Data Dictionary names must be unique within the system. You must provide a different name for data dictionary, since a one with the same name is already in the system. |

|  Code  | ALC-DCT-002-004 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary creation unsuccessful. |
|  Action  |The data dictionary persistence in the back end is unsuccessful. Check the credentials and other detais of the persistence layer. |

|  Code  | ALC-DCT-002-005 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary id is null. Pass a valid Data Dictionary id. |
|  Action  |You must provide a valid data dictionary identifier as parameter to the API. |

|  Code  | ALC-DCT-002-006 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary update unsuccessful. |
|  Action  |Check the persistence layer for issues related to object update. Some credentials might by missing or the server might not be running. |

|  Code  | ALC-DCT-002-007 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary fetch unsuccessful. Check the values of the passed in parameters. |
|  Action  |The data dictionary object cannot be fetched from the back end persistence layer. The user must check the persistence layer credentials or so for the same. |

|  Code  | ALC-DCT-002-008 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary delete unsuccessful. Check the value of the passed in data dictionary id. |
|  Action  |Pass in a valid data dictionary identifier and check the crendtials in the persistence layer. |

|  Code  | ALC-DCT-002-009 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element name field is null. Check the values of the passed in parameters. |
|  Action  |Provide a valid, not-null name for the data dictionary element as a parameter to the API. |

|  Code  | ALC-DCT-002-010 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Supplied Fiber Model for the Data Dictionary is not valid. |
|  Action  |Pass a valid fiber model corresponding to the data dictionary. |

|  Code  | ALC-DCT-002-011 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |This API only supports Fiber Models containing Data Dictionary annotations. Use getDataDictionaryFromFML2() API to create Data Dictionary from this Fiber Model. |
|  Action  |The fiber model passed to the API should be created from the export of an already created data dictionary. Generic fiber model import is not supported. |

|  Code  | ALC-DCT-002-012 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to create Data Dictionary. The input XML Schema is not valid |
|  Action  |The data dictionary can be created only from a valid XSD. Check the XSD for syntactical errors. |

|  Code  | ALC-DCT-002-013 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Error in parsing passed in XML. |
|  Action  |Check the XML for syntactical errors and ensure it is well formed. |

|  Code  | ALC-DCT-002-014 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Fiber Model Generation error while trying to export Data Dictionary with name: {0}. |
|  Action  |The data dictionary cannot be exported into a valid fiber model. Check the data dictionary for errors. |

|  Code  | ALC-DCT-002-015 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Null or Empty element name was provided. Invalid parameter passed to the function. |
|  Action  |A valid name (not null and not empty) must be provided to the API. |

|  Code  | ALC-DCT-002-016 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |The element name was not found. Invalid parameter passed to the function. |
|  Action  |Invalid non-existing element name cannot be accepted by the API. |

|  Code  | ALC-DCT-002-017 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Value of required Data Dictionary Element: {0} not found. |
|  Action  |The values for all the required Data Dictionary Elements must be present for instance data creation. |

|  Code  | ALC-DCT-002-018 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Generation of SWF for Data Dictionary Expression set: {0} unsuccessful. |
|  Action  |Check the expressions in data dictionary for syntactical errors. |

|  Code  | ALC-DCT-002-019 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data type for value of Data Dictionary Element: {0} is not compatible in passed XML. |
|  Action  |The element instance data type must be compatible with the design-time data dictionary element. |

|  Code  | ALC-DCT-002-020 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary cannot be created. Only Composite Data Dictionary Element Type is allowed for top level element in Data Dictionary. |
|  Action  |The top element selected for the data dictionary must be a composite element. |

|  Code  | ALC-DCT-002-021 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |The created Data Dictionary Instance is invalid. |
|  Action  |The instance data created for data dictionary is invalid. Correct input must be provided for the instance data creation. |

|  Code  | ALC-DCT-002-022 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |The name of top-level Data Dictionary Element is empty. |
|  Action  |Provide a valid name for top level Data Dictionary Element in the Data Dictionary. |

|  Code  | ALC-DCT-002-023 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary tree does not have a top-level Data Dictionary Element as root. |
|  Action  |The reason for this exception is that either the Data Dictionary does not have any child Data Dictionary Element or it has more that one Data Dictionary Elements. Only one Data Dictionary Element is allowed at the root level in Data Dictionary. |

|  Code  | ALC-DCT-002-024 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary name contains invalid characters. Only alphanumeric characters are allowed. |
|  Action  |Data Dictionary name needs to be corrected. |

|  Code  | ALC-DCT-002-025 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Element Type field of Data Dictionary Element with name "{0}" is null. |
|  Action  |Provide a valid element type for the Data Dictionary Element. |

|  Code  | ALC-DCT-002-026 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Display Name field of Data Dictionary Element with name "{0}" is null or empty. |
|  Action  |Provide a valid display name for the Data Dictionary Element. |

|  Code  | ALC-DCT-002-027 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element with name "{0}" at path "{1}" is both Computed and Required. A Data Dictionary Element cannot be both computed and required at the same time. |
|  Action  |Provide a valid Data Dictionary Element. A Data Dictionary Element cannot be both computed and required at the same time. |

|  Code  | ALC-DCT-002-028 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Display Name field of Data Dictionary Element with name "{0}" at path "{1}" is not unique within the Data Dictionary. |
|  Action  |Provide a unique display name for the Data Dictionary Element. |

|  Code  | ALC-DCT-002-029 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element with name "{0}" at path "{1}" contains an invalid Sub Type "ENUM". It is only supported for Data Dictionary Elements of Type String and Number. |
|  Action  |Provide a valid Sub Type for the Data Dictionary Element. |

|  Code  | ALC-DCT-002-030 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element with name "{0}" at path "{1}" is Computed but contains a null or empty Expression. All Computed Data Dictionary Elements must contain a valid expression. |
|  Action  |Provide a valid expression for the computed Data Dictionary Element. |

|  Code  | ALC-DCT-002-031 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element with name "{0}" at path "{1}" is Computed. Data Dictionary Elements of type Composite and Collection cannot be marked Computed. |
|  Action  |Provide valid Data Dictionary Element. Data Dictionary Elements of type Composite and Collection cannot be marked Computed. |

|  Code  | ALC-DCT-002-032 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid/Incomplete Data Dictionary structure. Data Dictionary Element with name "{0}" at path "{1}" cannot occur at leaf level as it is a Collection or Composite element. |
|  Action  |Provide a valid Data Dictionary Elements at the leaf level. Collection or Composite type elements cannot occur at leaf level. |

|  Code  | ALC-DCT-002-033 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element with name "{0}" at path "{1}" contains empty or null XMLBinding. XMLBinding is required for all non computed Simple and Collection type Elements. |
|  Action  |Provide not null XMLBinding for the Data Dictionary Element. |

|  Code  | ALC-DCT-002-034 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Display Name field of Data Dictionary Element with name "{0}" at path "{1}" contains invalid characters. Only underscore and alphanumeric characters are allowed. |
|  Action  |Provide valid display name for the Data Dictionary Element. |

|  Code  | ALC-DCT-002-035 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary is not valid as it contains no child elements. |
|  Action  |Provide a valid Data Dictionary. |

|  Code  | ALC-DCT-002-036 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary is not valid as it contains more than one top level Data Dictionary Elements. |
|  Action  |Provide a valid data Dictionary. Only one child Element is allowed (at the top level) in Data Dictionary. |

|  Code  | ALC-DCT-002-037 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Name field of Data Dictionary Element with name "{0}" at path "{1}" contains invalid characters. Only underscore and alphanumeric characters are allowed. |
|  Action  |Provide a valid name for the Data Dictionary Element. |

|  Code  | ALC-DCT-002-038 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element denoting Type of Collection Element with name "{0}" cannot be Computed or Required. |
|  Action  |Provide a valid Data Dictionary Element. Data Dictionary Element denoting Type of Collection Element cannot be Computed or Required. |

|  Code  | ALC-DCT-002-039 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element with name "{0}" at path "{1}" contains empty or null value set. All Elements with sub type ENUM should have not null value set. |
|  Action  |Provide a not null value set for the Data Dictionary Element with sub type ENUM. |

|  Code  | ALC-DCT-002-040 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element with name "{0}" at path "{1}" contains XML Binding and is Computed. Computed elements should not have XML Binding. |
|  Action  |Provide valid computed Data Dictionary Element. Computed Data Dictionary elements should not have XML Binding. |

|  Code  | ALC-DCT-002-045 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid XML Binding for: "{0}". Attributes can not be mapped to Collection DDE. |
|  Action  |Provide valid XML Binding for Collection Data Dictionary Element. |

|  Code  | ALC-DCT-002-046 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid XML Binding for: "{0}". Wrong Value "@" for element name. |
|  Action  |Provide valid XML Binding for Data Dictionary Element. |

|  Code  | ALC-DCT-002-047 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Error creating sample XML for Data Dictionary: "{0}". Cause: {1}. |
|  Action  |Try and fix the cause of the issue. |

|  Code  | ALC-DCT-004-001 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |No Data Dictionaries found. |
|  Action  |Migration Module found no Data Dictionaries. It's an information level message and no action is required. |

|  Code  | ALC-DCT-004-002 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary Migration Started. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-004-003 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Migration Failed. Cause: {0}. |
|  Action  |Try and fix the cause for Data Dictionary migration failure. |

|  Code  | ALC-DCT-004-004 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary Migration Completed. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-004-005 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Migrating Data Dictionary with name: "{0}". |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-004-006 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Migration failed for Data Dictionary with name: "{0}". |
|  Action  |Migration of Data Dictionary failed because of an exception faced while updation the same. |

|  Code  | ALC-DCT-003-001 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary -id: {0} is ignored in createDataDictionary api call. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-002 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Updating Data Dictionary with data dictionary -id: {0}. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-003 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Fetching Data Dictionaries based on passed-in DataDictionarySearchFilter. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-004 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Fetching Complete Data Dictionary object graph. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-005 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary not found. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-006 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Deleting Data Dictionary with -id: {0}. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-007 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |None of the filters in the passed-in DataDictionarySearchFilter were set. Returning all data dictionaries present in the System. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-008 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Warning |
|  Cause  |Validation error- Value for ENUM does not exist in input data. |
|  Action  |It's a warning level message specifying that the value of Data Dictionary Element with sub type Enum is not present in the input XML. |

|  Code  | ALC-DCT-003-009 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Validation error- Simple top-level data dictionary element encountered. |
|  Action  |Error faced while navigating over the Data Dictionary. |

|  Code  | ALC-DCT-003-010 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Entity name auto-generated -name: {0}. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-011 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |The passed-in Fiber Model has more than one root. Check the passed-in parameters. |
|  Action  |Provide a valid input Fiber Model file. Only one root element should be present. |

|  Code  | ALC-DCT-003-012 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to set Data Dictionary property: {0}. |
|  Action  |Error occured while setting a property of Data Dictionary. |

|  Code  | ALC-DCT-003-013 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to set Data Dictionary Element property: {0}. |
|  Action  |Error occured while setting a property of Data Dictionary Element. |

|  Code  | ALC-DCT-003-014 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Warning |
|  Cause  |Value for ENUM does not exist in input data. |
|  Action  |It's a warning level message specifying that the value of Data Dictionary Element with sub type Enum is not present in the input XML. |

|  Code  | ALC-DCT-003-018 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Error in evaluating expression: {0}. |
|  Action  |Expression evaluation failed. See the server logs to find the reason for failure. |

|  Code  | ALC-DCT-003-019 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Warning |
|  Cause  |Unresolved VARIABLE: {0} in the expression. |
|  Action  |This is a warning stating that expression contains unresolved variables. |

|  Code  | ALC-DCT-003-023 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary checksum generation failed during Fiber Model import. |
|  Action  |See the server logs to find the real cause for failure. |

|  Code  | ALC-DCT-003-024 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary with name "{0}" created successfully. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-025 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary with name "{0}" updated successfully. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-026 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary with id "{0}" deleted successfully. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-002-041 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Element with name "{0}" at path "{1}" contains two children with the same name "{2}" |
|  Action  |Provide unique names for children of data dictionary element. |

|  Code  | ALC-DCT-002-043 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid input parameter "{0}". Ensure that the input to the API should not be null. |
|  Action  |Provide non null input to the API. |

|  Code  | ALC-DCT-002-044 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid path "{0}". Root element with the name "{1}" was not found. |
|  Action  |Correct the path of the data dictionary element. |

|  Code  | ALC-DCT-002-048 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid XML Binding for: "{0}". The Binding of this Data Dictionary Element cannot map to the root node of XML. |
|  Action  |Provide valid XML Binding for Data Dictionary Element. |

|  Code  | ALC-DCT-002-049 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Could not invoke LCDS remoting service as the "{0}" is not specified in the Data Dictionary. |
|  Action  |Provide the remoting service info for data dictionary. |

|  Code  | ALC-DCT-002-050 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Service with name "{0}" is not found in the input FML file. |
|  Action  |Provide a valid service name that exists in the input FML. |

|  Code  | ALC-DCT-002-051 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Operation with name "{0}" is not found in Service "{1}". |
|  Action  |Provide a valid operation name corresponding to the service that exists in the input FML. |

|  Code  | ALC-DCT-002-052 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |LCDS Remoting Invocation failed: {0} |
|  Action  |Try and fix the cause of the issue and verify the remoting service info in data dictionary. |

|  Code  | ALC-DCT-002-053 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Top Level Entity with name "{0}" is not found in Fiber Model. |
|  Action  |Provide a valid top level entity name that exists in the input FML. |

|  Code  | ALC-DCT-002-054 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Reference Name field of Data Dictionary Element with name "{0}" at path "{1}" is null or empty. |
|  Action  |Provide the reference name for data dictionary element. |

|  Code  | ALC-DCT-002-055 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Reference Name field of Data Dictionary Element with name "{0}" at path "{1}" is not unique within the Data Dictionary. |
|  Action  |Change the reference name of data dictionary element to make it unique within data dictionary. |

|  Code  | ALC-DCT-002-056 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Reference Name field of Data Dictionary Element with name "{0}" at path "{1}" contains invalid characters. Only underscore and alphanumeric characters are allowed. |
|  Action  |Remove the invalid characters that are not allowed in reference name. |

|  Code  | ALC-DCT-002-057 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Data Dictionary Instance contains null or invalid Data Dictionary object. |
|  Action  |Provide a valid data dictionary instance object. The data dictionary object inside data dictionary instance is invalid |

|  Code  | ALC-DCT-002-058 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid reference name "{0}". No DDE exists with this reference name. |
|  Action  |The reference name is incorrect and no element exists with this reference name . Provide a valid reference name for data dictionary element. |

|  Code  | ALC-DCT-002-059 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Reference name to path map is null in the input Data Dictionary Object. |
|  Action  |The reference name to path map is null. Provide a valid Data Dictionary object. |

|  Code  | ALC-DCT-002-060 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Extended Properties field of Data Dictionary with name "{0}" contains null or empty key(s). |
|  Action  |Provide a valid non Empty key for extended property. |

|  Code  | ALC-DCT-002-061 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Extended Properties field of Data Dictionary Element with name "{0}" at path "{1}" contains null or empty key(s). |
|  Action  |Provide a valid non Empty key for extended property. |

|  Code  | ALC-DCT-002-062 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to publish Data Dictionary with name "{0}" |
|  Action  |Pease try and fix the cause of the issue. |

|  Code  | ALC-DCT-002-063 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Error |
|  Cause  |Failed to revert Data Dictionary with name "{0}" |
|  Action  |Pease try and fix the cause of the issue. |

|  Code  | ALC-DCT-003-027 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary with name "{0}" published successfully. |
|  Action  |It's an information level message and no action is required. |

|  Code  | ALC-DCT-003-028 (Solutions - Data Dictionary) |
|---|---|
|  Type  |Info |
|  Cause  |Data Dictionary with name: "{0}" reverted successfully. |
|  Action  |It's an information level message and no action is required. |

## Solutions - Expression Manager error codes {#solutions-expression-manager-error-codes}

|  Code  | ALC-EXP-001-003 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |ERROR in evaluating expression. |
|  Action  |1. Verify the expression syntax. 2. Check system log for Exceptions. |

|  Code  | ALC-EXP-001-004 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |The expression contains unresolved variables. |
|  Action  |Ensure that all the variables used in the expression are being passed in the input parameter map. |

|  Code  | ALC-EXP-001-005 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Function used in expression is not found in the utility class. |
|  Action  |Ensure that the function name is correct and the utility class contains a definition of this function. |

|  Code  | ALC-EXP-001-006 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Could not create variable resolver. |
|  Action  |Ensure that the specified class of variable resolver exist in the classpath. |

|  Code  | ALC-EXP-001-007 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Return type of expression is not serializable. |
|  Action  |Ensure that the expression returns a serializable type. |

|  Code  | ALC-EXP-001-008 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Invalid Expression. |
|  Action  |Check the syntax of the expression. |

|  Code  | ALC-EXP-001-009 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Null Expression. |
|  Action  |Provide a valid expression. |

|  Code  | ALC-EXP-001-010 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Expression map is null or empty. |
|  Action  |Provide a non null expression map containing at least one expression. |

|  Code  | ASA-EXM-020-002-001 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |A variable in an expression cannot be resolved. |
|  Action  |Ensure that if an expression containing variables is passed to the expression manager, then the variable resolver configured for the expression manager must return valid values for these variables. |

|  Code  | ASA-EXM-020-003-001 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |The function mapper could not resolve a given scope and local-name to a function. |
|  Action  |For local functions, ensure that the scope and local-name map to a valid method on an ActionScript class which is available in the current ApplicationDomain. |

|  Code  | ASA-EXM-020-002-005 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |The expression manager has not been configured with a variable resolver. |
|  Action  |Ensure that a valid variable resolver has been set on the expression manager instance. |

|  Code  | ASA-EXM-020-001-001 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |The given expression is syntactically invalid. |
|  Action  |Ensure that the expression passed to the expression manager is a syntactically valid JSP-EL expression. |

|  Code  | ALC-EXP-001-011 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Input data provided for expression evaluation is inconsistent. |
|  Action  |You are trying to evaluate expression over collection input variables and there is some inconsistency in the input data. Ensure that input data is correct. |

|  Code  | ALC-EXP-001-012 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Repeating variables used in expression {0}, are not in valid hierarchy. |
|  Action  |Ensure that all the collection variables being used for expression evaluation are part of the single hierarchy. Compute a path from root element to the deepest collection variable and ensure that all collection variables fall on this path. For non-repeating variables there is no such restriction. |

|  Code  | ALC-EXP-001-013 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Expression contains repeating variables. To evaluate this type of expressions, VariableResolver must implement VariableValidator interface. |
|  Action  |Ensure that variable resolver implements the VariableValidator interface. |

|  Code  | ALC-EXP-001-014 (Solutions - Expression Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Input variables are not serializable. |
|  Action  |Ensure that all the input variables are serializable. |

## Trust Store error codes {#trust-store-error-codes}

|  Code  | com.ibm.db2.jcc.b.SqlException (only WAS/ DB2/ AIX, Linux) (Trust Store) |
|---|---|
|  Type  |Error |
|  Cause  |Stack Dump = com.ibm.db2.jcc.b.SqlException: The value of a host variable in the EXECUTE or OPEN statement is too large for its corresponding use. at java.lang.Throwable.(Throwable.java:57) at java.sql.SQLException.(SQLException.java:113) at com.ibm.db2.jcc.b.SqlException.(SqlException.java:71) at com.ibm.db2.jcc.b.zc.e(zc.java:1606) at com.ibm.db2.jcc.b.zc.a(zc.java:1227) at com.ibm.db2.jcc.a.db.o(db.java:605) at com.ibm.db2.jcc.a.db.j(db.java:270) at com.ibm.db2.jcc.a.db.c(db.java:57) at com.ibm.db2.jcc.a.r.c(r.java:42) at com.ibm.db2.jcc.a.sb.h(sb.java:169) at com.ibm.db2.jcc.b.zc.p(zc.java:1223) at com.ibm.db2.jcc.b.ad.d(ad.java:2246) at com.ibm.db2.jcc.b.ad.U(ad.java:489) at com.ibm.db2.jcc.b.ad.executeQuery(ad.java:472) at com.ibm.ws.rsadapter.jdbc.WSJdbcPreparedStatement.pmiExecuteQuery(WSJdbcPreparedStatement.java:878) at com.ibm.ws.rsadapter.jdbc.WSJdbcPreparedStatement.executeQuery(WSJdbcPreparedStatement.java:559) at com.adobe.pof.adapter.JDBCAdapter.retrieveObjectSet(JDBCAdapter.java:4882) at com.adobe.pof.omapi.POFObjectManagerImpl.retrieveObjectSet(POFObjectManagerImpl.java:147) at com.adobe.pof.omapi.POFObjectManagerRemoteBean.retrieveObjectSet(POFObjectManagerRemoteBean.java:228) at com.adobe.pof.omapi.EJSLocalStatelessadobe_POFObjectManagerLocalEJB_168e3f94.retrieveObjectSet(Unknown Source) at com.adobe.pof.omapi.POFObjectManagerLocalEJBAdapter.retrieveObjectSet(POFObjectManagerLocalEJBAdapter.java:115) at com.adobe.pof.omapi.POFObjectManagerAbstractAdapter.retrieveObjectSet(POFObjectManagerAbstractAdapter.java:481) at com.adobe.pof.omapi.POFObjectManagerAbstractAdapter.retrieveObjects(POFObjectManagerAbstractAdapter.java:396) at com.adobe.truststore.provider.db.POFHelper.getValues(POFHelper.java:478) at com.adobe.truststore.provider.db.CRLSearchHelper.findCRLsByAlias(CRLSearchHelper.java:136) at com.adobe.truststore.provider.db.CRLSearchHelper.aliasKeyCRLSearchFilter(CRLSearchHelper.java:67) at com.adobe.truststore.provider.db.DatabaseTrustStoreProvider.findCRLs(DatabaseTrustStoreProvider.java:838) at com.adobe.truststore.businesslogic.impl.CRLManagerImpl.findCRLByAlias(CRLManagerImpl.java:125) at com.adobe.truststore.dsc.CRLServiceImpl.findCRLByAlias(CRLServiceImpl.java:342) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:64) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:615) at com.adobe.idp.dsc.component.impl.DefaultPOJOInvokerImpl.invoke(DefaultPOJOInvokerImpl.java:181) at com.adobe.idp.dsc.interceptor.impl.InvocationInterceptor.intercept(InvocationInterceptor.java:134) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.transaction.interceptor.TransactionInterceptor$1.doInTransaction(TransactionInterceptor.java:74) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EjbTransactionCMTAdapterBean.execute(EjbTransactionCMTAdapterBean.java:336) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EjbTransactionCMTAdapterBean.doSupports(EjbTransactionCMTAdapterBean.java:212) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EJSLocalStatelessEjbTransactionCMTAdapter_caf58c4f.doSupports(Unknown Source) at com.adobe.idp.dsc.transaction.impl.ejb.EjbTransactionProvider.execute(EjbTransactionProvider.java:104) at com.adobe.idp.dsc.transaction.interceptor.TransactionInterceptor.intercept(TransactionInterceptor.java:72) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.interceptor.impl.InvalidStateInterceptor.intercept(InvalidStateInterceptor.java:37) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.interceptor.impl.AuthorizationInterceptor.intercept(AuthorizationInterceptor.java:93) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.engine.impl.ServiceEngineImpl.invoke(ServiceEngineImpl.java:113) at com.adobe.idp.dsc.routing.Router.routeRequest(Router.java:102) at com.adobe.idp.dsc.provider.impl.base.AbstractMessageReceiver.routeMessage(AbstractMessageReceiver.java:88) at com.adobe.idp.dsc.provider.impl.vm.VMMessageDispatcher.doSend(VMMessageDispatcher.java:210) at com.adobe.idp.dsc.provider.impl.base.AbstractMessageDispatcher.send(AbstractMessageDispatcher.java:57) at com.adobe.idp.dsc.clientsdk.ServiceClient.invoke(ServiceClient.java:208) at com.adobe.truststore.client.CRLServiceClient.findCRLByAlias(CRLServiceClient.java:298) at com.adobe.livecycle.signatures.pki.revocation.crl.CRLDBEnumerator.obtainByURI(CRLDBEnumerator.java:81) at com.adobe.livecycle.signatures.pki.revocation.crl.CRLCache.obtainByURI(CRLCache.java:189) at com.adobe.livecycle.signatures.pki.revocation.crl.CRLCache.obtainByDN(CRLCache.java:226) at com.adobe.livecycle.signatures.pki.revocation.crl.CRLRevChecker.getCRLsFromAD(CRLRevChecker.java:397) at com.adobe.livecycle.signatures.pki.revocation.crl.CRLRevChecker.checkRevocation(CRLRevChecker.java:192) at com.adobe.livecycle.signatures.pki.revocation.RevocationChecker.checkRevocation(RevocationChecker.java:90) at com.adobe.livecycle.signatures.pki.impl.PKISession.verifyCertificate(PKISession.java:198) at com.adobe.livecycle.signatures.pki.revocation.crl.CRLRevChecker.validateCRLIssuer(CRLRevChecker.java:571) at com.adobe.livecycle.signatures.pki.revocation.crl.CRLRevChecker.checkRevocation(CRLRevChecker.java:275) at com.adobe.livecycle.signatures.pki.revocation.RevocationChecker.checkRevocation(RevocationChecker.java:90) at com.adobe.livecycle.signatures.pki.impl.PKISession.verifyCertificate(PKISession.java:198) at com.adobe.livecycle.signatures.pki.impl.PKIOperations.verifyCertificate(PKIOperations.java:242) at com.adobe.livecycle.signatures.service.impl.SignCertifyImpl.prepareForSignOrCertify(SignCertifyImpl.java:1550) at com.adobe.livecycle.signatures.service.impl.SignCertifyImpl.sign(SignCertifyImpl.java:387) at com.adobe.livecycle.signatures.service.impl.DocumentSecurityService.sign(DocumentSecurityService.java:1124) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:64) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:615) at com.adobe.idp.dsc.component.impl.DefaultPOJOInvokerImpl.invoke(DefaultPOJOInvokerImpl.java:181) at com.adobe.idp.dsc.interceptor.impl.InvocationInterceptor.intercept(InvocationInterceptor.java:134) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.transaction.interceptor.TransactionInterceptor$1.doInTransaction(TransactionInterceptor.java:74) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EjbTransactionCMTAdapterBean.execute(EjbTransactionCMTAdapterBean.java:336) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EjbTransactionCMTAdapterBean.doSupports(EjbTransactionCMTAdapterBean.java:212) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EJSLocalStatelessEjbTransactionCMTAdapter_caf58c4f.doSupports(Unknown Source) at com.adobe.idp.dsc.transaction.impl.ejb.EjbTransactionProvider.execute(EjbTransactionProvider.java:104) at com.adobe.idp.dsc.transaction.interceptor.TransactionInterceptor.intercept(TransactionInterceptor.java:72) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.interceptor.impl.InvalidStateInterceptor.intercept(InvalidStateInterceptor.java:37) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.interceptor.impl.AuthorizationInterceptor.intercept(AuthorizationInterceptor.java:93) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.engine.impl.ServiceEngineImpl.invoke(ServiceEngineImpl.java:113) at com.adobe.idp.dsc.routing.Router.routeRequest(Router.java:102) at com.adobe.idp.dsc.provider.impl.base.AbstractMessageReceiver.routeMessage(AbstractMessageReceiver.java:88) at com.adobe.idp.dsc.provider.impl.vm.VMMessageDispatcher.doSend(VMMessageDispatcher.java:210) at com.adobe.idp.dsc.provider.impl.base.AbstractMessageDispatcher.send(AbstractMessageDispatcher.java:57) at com.adobe.idp.dsc.clientsdk.ServiceClient.invoke(ServiceClient.java:208) at com.adobe.workflow.engine.PEUtil.invokeAction(PEUtil.java:553) at com.adobe.idp.workflow.dsc.invoker.WorkflowDSCInvoker.transientInvoke(WorkflowDSCInvoker.java:261) at com.adobe.idp.workflow.dsc.invoker.WorkflowDSCInvoker.invoke(WorkflowDSCInvoker.java:98) at com.adobe.idp.dsc.interceptor.impl.InvocationInterceptor.intercept(InvocationInterceptor.java:134) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.transaction.interceptor.TransactionInterceptor$1.doInTransaction(TransactionInterceptor.java:74) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EjbTransactionCMTAdapterBean.execute(EjbTransactionCMTAdapterBean.java:336) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EjbTransactionCMTAdapterBean.doRequiresNew(EjbTransactionCMTAdapterBean.java:282) at com.adobe.idp.dsc.transaction.impl.ejb.adapter.EJSLocalStatelessEjbTransactionCMTAdapter_caf58c4f.doRequiresNew(Unknown Source) at com.adobe.idp.dsc.transaction.impl.ejb.EjbTransactionProvider.execute(EjbTransactionProvider.java:143) at com.adobe.idp.dsc.transaction.interceptor.TransactionInterceptor.intercept(TransactionInterceptor.java:72) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.interceptor.impl.InvalidStateInterceptor.intercept(InvalidStateInterceptor.java:37) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.interceptor.impl.AuthorizationInterceptor.intercept(AuthorizationInterceptor.java:93) at com.adobe.idp.dsc.interceptor.impl.RequestInterceptorChainImpl.proceed(RequestInterceptorChainImpl.java:44) at com.adobe.idp.dsc.engine.impl.ServiceEngineImpl.invoke(ServiceEngineImpl.java:113) at com.adobe.idp.dsc.routing.Router.routeRequest(Router.java:102) at com.adobe.idp.dsc.provider.impl.base.AbstractMessageReceiver.invoke(AbstractMessageReceiver.java:298) at com.adobe.idp.dsc.provider.impl.ejb.receiver.EjbReceiverBean.invoke(EjbReceiverBean.java:151) at com.adobe.idp.dsc.provider.impl.ejb.receiver.EJSRemoteStatelessInvocation_b542628e.invoke(Unknown Source) at com.adobe.idp.dsc.provider.impl.ejb.receiver._EJSRemoteStatelessInvocation_b542628e_Tie.invoke(_EJSRemoteStatelessInvocation_b542628e_Tie.java:161) at com.adobe.idp.dsc.provider.impl.ejb.receiver._EJSRemoteStatelessInvocation_b542628e_Tie._invoke(_EJSRemoteStatelessInvocation_b542628e_Tie.java:88) at com.ibm.CORBA.iiop.ServerDelegate.dispatchInvokeHandler(ServerDelegate.java:613) at com.ibm.CORBA.iiop.ServerDelegate.dispatch(ServerDelegate.java:466) at com.ibm.rmi.iiop.ORB.process(ORB.java:503) at com.ibm.CORBA.iiop.ORB.process(ORB.java:1552) at com.ibm.rmi.iiop.Connection.respondTo(Connection.java:2673) at com.ibm.rmi.iiop.Connection.doWork(Connection.java:2551) at com.ibm.rmi.iiop.WorkUnitImpl.doWork(WorkUnitImpl.java:62) at com.ibm.ejs.oa.pool.PooledThread.run(ThreadPool.java:118) at com.ibm.ws.util.ThreadPool$Worker.run(ThreadPool.java:1469) |
|  Action  |Bug #: 1576562 Title: Readme - The 1st Sign atomic orchestration on WAS/DB2/AIX and WAS/DB2/Linux will fail with "The XAResource for a transaction participant could not be recreated and transaction recovery may not be able to complete properly." |

## User Manager error codes {#user-manager-error-codes}

|  Code  | 0x4001 (16385) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Generally not used. |
|  Action  |Review stack trace in logs. |

|  Code  | 0x4002 (16386) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Authenticate call failure over component. This error is also thrown if context is not authorized with permission (historical context usage). |
|  Action  |Verify the authorization status. |

|  Code  | 0x4003 (16387) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |No such domain exists (historical context usage). |
|  Action  |Verify that such a domain exists (historical context usage). |

|  Code  | 0x4004 (16388) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |A duplicate domain being created. |
|  Action  |Change domain specifics like domainname, or domaincommonname. |

|  Code  | 0x4005 (16389) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Non-existent domain. |
|  Action  |Ensure that the domain specified exists. |

|  Code  | 0x4006 (16390) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Thrown if null details are passed for domain being created (historical usage) or isUserInRole(roleId) is called without a valid user context. |
|  Action  |Review the logs and database. |

|  Code  | 0x4008 (16392) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Raised while bootstrap operations, and with create and update operations on Principal, Domain, Role if done with attributes which already preexist in database (like caninocalName, domainName, userId, RoleName) |
|  Action  |Other than Bootstrap, try with different set of Data for unique Combination Attributes (like canonicalName, domainName, userId, RoleName). |

|  Code  | 0x400A (16394) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Invalid reliant application passed as arguments. |
|  Action  |Review the arguments. |

|  Code  | 0x400B (16395) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Relapp with the name pre-exists. |
|  Action  |Change the name of relapp. |

|  Code  | 0x400C (16396) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Null relapp name passed. |
|  Action  |Pass a valid name name (non-blank). |

|  Code  | 0x400D (16397) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |The id or Name passed for Resource does not exists. |
|  Action  |Check for the resourcetype name argument. |

|  Code  | 0x400E (16398) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Resourcetype with same attribute preexists. |
|  Action  |Verify the preexisting resource type. |

|  Code  | 0x400F (16399) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Resourcetype with different attribute preexists. |
|  Action  |Verify the preexisting resource type. |

|  Code  | 0x4010 (16400) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Null permission arguments have been passed. |
|  Action  |Verify whether Null permission arguments have been passed. |

|  Code  | 0x4011 (16401) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Created permission preexists. |
|  Action  |Verify that the created permission preexists. |

|  Code  | 0x4013 (16403) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Role already exists with same Role Name. |
|  Action  |Verify that the role name and its mutable status. |

|  Code  | 0x4014 (16404) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Role Already prexists in database with diffrent mutable status. |
|  Action  |Use different role ID for role creation. |

|  Code  | 0x4016 (16406) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |A null role is passed. |
|  Action  |Verify that the role argument passed is not null. |

|  Code  | 0x4017 (16407) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Trying to delete and Immutable role. |
|  Action  |Immutable Role cannot be deleted. |

|  Code  | 0x4019 (16409) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Passed role does not exist |
|  Action  |Verify the role name passed. |

|  Code  | 0x401B (16411) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |The permission name passed does not exist. |
|  Action  |Verify the permission id/name passed. |

|  Code  | 0x401C (16412) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |The arguments passed are either invalid or incomplete or null. |
|  Action  |Verify the arguments passed are not null and are not invalid that is they exist in User Management |

|  Code  | 0x401D (16413) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Unable to create Group for the specified resource type. |
|  Action  |Verify that you have permission to create group. |

|  Code  | 0x401E (16414) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Passed Permission is not the part of the specified Role Definition. |
|  Action  |Verify that permission belongs to the specified role. |

|  Code  | 0x401F (16415) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Trying to modify an Immutable Role. |
|  Action  |Immutable Role cannot be modified. |

|  Code  | 0x4020 (16416) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Role Entry could not be deleted. |
|  Action  |Verify that you have permissions for role operations. |

|  Code  | 0x4021 (16421) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Role Assignment does not exist. |
|  Action  |Verify that the principal has this role assigned. |

|  Code  | 0x4022 (16418) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |domain is not local |
|  Action  |Verify that the domain is of type Local. |

|  Code  | 0x4023 (16419) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |The Certificate Mapping Already Exists. |
|  Action  |Verify that the Certificate Mapping if it exists then use different mapping. |

|  Code  | 0x4024 (16420) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Authentication Failure |
|  Action  |Verify that credentials are right, or switch to debug level logs for actual cause of Authentication Failure. |

|  Code  | 0x4025 (16421) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |The SAML Token passed is invalid. |
|  Action  |Re authenticate and issue a new SAML Token. |

|  Code  | 0x4026 (16422) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Not Authorized to perform this particular operation. |
|  Action  |Verify that you have required permission for the current operation. |

|  Code  | 0x4027 (16423) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Certificate Authentication Failed. |
|  Action  |Verify that the certificate is valid or it is uploaded in Trust Store or the mapping is correct. Switch to debug level logs for more details. |

|  Code  | 0x4028 (16424) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |The principal could not be found. |
|  Action  |Check the arguments passed for searching principal. |

|  Code  | 0X4033 (16435) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |The assertion renewal count exceeded configured limit. |
|  Action  |Create a context for use with the assertion ID. |

|  Code  | 0X4034 (16436) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |The assertion id passed is invalid or assertion corresponding to that id has expired. |
|  Action  |Ensure that the assertion ID is valid and has not expired, or pass another valid assertion ID for the context. |

|  Code  | 0x4029 (16425) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Principal Already Exists. |
|  Action  |Try creating principal with different attributes. For example, canonicalName, userId. |

|  Code  | 0x402A (16426) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Attempt to remove a system Instance. |
|  Action  |System Instance, for example, DefaultDom, Super Administrator cannot be removed from the system. |

|  Code  | 0x402B (16427) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Attempting an Operation i.e. addition or removal of group members, that is illegal for Dynamic Groups. |
|  Action  |Members cannot be added or removed from the Dynamic Groups. |

|  Code  | 0x4030 (16432) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Kerberos result cannot be split into userName and domainName |
|  Action  |Check your client Kerberos settings. |

|  Code  | 0x4031 (16433) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Trying to delete the last Role Assignment of Special Role. |
|  Action  |Last Assignment of Special Roles. For example, Super Administrator, Admin Console cannot be deleted. |

|  Code  | 0x4032 (16434) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Invalid Authentication Token is passed. |
|  Action  |Check that the Authentication Scheme trying to Authenticate is supported in LiveCycle. |

|  Code  | 0x340D (13325) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Trying to remove a inherited principal from the group membership. |
|  Action  |Verify that the principal has direct membership to this group. |

|  Code  | 0x340E (13326) (User Manager) |
|---|---|
|  Type  |  |
|  Cause  |Trying to remove a inherited Role from the principal. |
|  Action  |Verify that the Role is assigned directly to the prinicpal not by inheritance. |

|  Code  | 0x4035 (User Manager) |
|---|---|
|  Type  |Error |
|  Cause  |Unable to create a Domain with Domain name containing non ASCII characters |
|  Action  |Only use ASCII characters in the Domain name. |

## Utilities error codes {#utilities-error-codes}

|  Code  | ALC-UTIL-001-001 (Utilities) |
|---|---|
|  Type  |Error |
|  Cause  |Unexpected exception while {0} |
|  Action  |  |

|  Code  | ALC-UTIL-001-002 (Utilities) |
|---|---|
|  Type  |Info |
|  Cause  |Thread apparently hung: {0} |
|  Action  |  |

## Web Services error codes {#web-services-error-codes}

|  Code  | log4j:WARN (Web Services) |
|---|---|
|  Type  |  |
|  Cause  |When running tests using the method Axis WSDL2Java outlined in the invoking guide a warning is presented regarding the logger: e.g. (Solaris/WebLogic) log4j:WARN No appenders could be found for logger (org.apache.axis.i18n.ProjectResourceBundle). log4j:WARN Initialize the log4j system properly. |
|  Action  |These errors occur on JBoss, WebSphere, and WebLogic and can be safely ignored. |

## WebSphere error codes {#websphere-error-codes}

|  Code  | 00000013 jdbc E Error while registering Oracle JDBC Diagnosability MBean (WebSphere) |
|---|---|
|  Type  |  |
|  Cause  |WebSphere fails to register Oracle's DataSource MBean on server start resulting in a DataManagerService error. |
|  Action  |Several blogs suggested downloading the latest Oracle 11g JDBC driver could fix the problem. Go to this link to download: https://www.oracle.com/technology/software/tech/java/sqlj_jdbc/htdocs/jdbc_111060.html |

## Workspace error codes {#workspace-error-codes}

|  Code  | ALC-WKS-007-000 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred during the operation. Try again or contact your system administrator for assistance. |
|  Action  |Examine the log for the server error message which caused the problem. This error occurs when the login operation fails. |

|  Code  | ALC-WKS-007-001 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Invalid user name or password |
|  Action  |One or both of the user name and password provided for a login attempt is incorrect. Type them in again and retry the login. |

|  Code  | ALC-WKS-007-002 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your login session has expired. Login again to continue. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-003 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your task has successfully been completed. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-004 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your attempt to complete the task has failed. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-036 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred trying to lock task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-005 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your form data has been saved. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-006 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your attempt to save the form data has failed |
|  Action  |Retry the operation. If the problem persists, then contact the server administrator to analyze any server-side information from the logs. |

|  Code  | ALC-WKS-007-007 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Endpoint with endpointId {0} is not found. |
|  Action  |Examine the log for the server error message which caused the problem retrieving the endpoint with the specified ID. Usually occurs during development when an endpoint is deleted. Refresh the browser session to force a reload of the current endpoints. |

|  Code  | ALC-WKS-007-008 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Task {0} is not available to you. The task may have already been completed or someone else may own it. If this message was a result of selecting the link in a forwarded email, contact the sender and have them use Workspace ES to forward the task to you. |
|  Action  |The task is complete or owned by someone else. If this message was a result of selecting the link via email, contact the sender request they use Workspace to forward the task. |

|  Code  | ALC-WKS-007-010 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: You have uploaded attachment '{0}'. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-011 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while uploading attachment {0}. |
|  Action  |Examine the log for the server error message which caused the problem uploading the attachment. |

|  Code  | ALC-WKS-007-012 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: You have added the note titled '{0}'. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-013 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred adding a note entitled {0}. |
|  Action  |Examine the log for the server error message which caused the problem adding the note. |

|  Code  | ALC-WKS-007-014 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: You have forwarded task {1} to '{0}'. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-015 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: You have consulted with '{1}' on task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-016 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: You have shared task {0} with {1}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-017 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: A communication error occurred during the operation: {0} |
|  Action  |Examine the log for the server error message which caused the problem with the connection. It is likely that the exception occurred as a result of the channel being disconnected. Refresh the browser and connect again. |

|  Code  | ALC-WKS-007-019 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your attempt to consult task {0} has failed. |
|  Action  |Examine the log for the server error message which caused the problem with consulting for the task with this taskID. |

|  Code  | ALC-WKS-007-020 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your attempt to share task {0} has failed. |
|  Action  |Examine the log for the server error message which caused the problem with sharing for the task with this taskID. |

|  Code  | ALC-WKS-007-021 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your attempt to forward task {0} has failed. |
|  Action  |The forward task operation has failed to complete. Verify the server log file for more detailed information. |

|  Code  | ALC-WKS-007-022 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Are you sure you want to leave this form? You may have unsaved changes. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-023 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Review highlighted form input fields for errors. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-025 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving information from the server. |
|  Action  |An error has occurred with the Workspace Data Services fill operation. Examine the log for the server error message which caused the client to receive this error. |

|  Code  | ALC-WKS-007-026 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred during logout. Your session to the server may still be valid. Close all browser windows to ensure that your session cannot be recovered. |
|  Action  |Examine the log for the server error message which caused the problem when logging out. |

|  Code  | ALC-WKS-007-027 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred during the operation (endpoint id {0}). |
|  Action  |Examine the log for the server error message which caused the problem starting the endpoint. |

|  Code  | ALC-WKS-007-030 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving categories. |
|  Action  |Examine the log for the server error message which caused the problem with the data services fill operation for categories. |

|  Code  | ALC-WKS-007-032 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving tasks. |
|  Action  |Examine the log for the server error message which caused the problem with the data services fill operation for tasks. |

|  Code  | ALC-WKS-007-033 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving queues. |
|  Action  |Examine the log for the server error message which caused the problem with the data services fill operation for queues. |

|  Code  | ALC-WKS-007-034 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving search templates. |
|  Action  |Examine the log for the server error message which caused the problem with the data services fill operation for search templates. |

|  Code  | ALC-WKS-007-035 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving users. |
|  Action  |Examine the log for the server error message which caused the problem with the data services fill operation for users. |

|  Code  | ALC-WKS-007-037 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while retrieving attachments and notes. |
|  Action  |Examine the log for the server error message which caused the problem with the data services fill operation for attachments. |

|  Code  | ALC-WKS-007-039 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred during the search. |
|  Action  |Examine the log for the server error message which caused the client to receive this error. |

|  Code  | ALC-WKS-007-040 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred creating the form (task {0}, form {1}). |
|  Action  |Examine the log for the server error message to indicate if there are any problems with the render service. |

|  Code  | ALC-WKS-007-041 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving form data (task {0}, form {1}). |
|  Action  |Examine the log for the server error message. This error is typcally seen when using Flex forms. |

|  Code  | ALC-WKS-007-042 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred saving form data (task {0}, form {1}). |
|  Action  |Examine the log for the server error message. This error only occurs when a user is saving draft data. |

|  Code  | ALC-WKS-007-043 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred submitting the form (task {0}, form {1}). |
|  Action  |Examine the server log to provide info as to why the submit service failed. Verify that the LiveCycle server is running. |

|  Code  | ALC-WKS-007-044 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving process instances (process {0}). |
|  Action  |Examine the log for the server error message which caused the client to receive this error. |

|  Code  | ALC-WKS-007-045 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving a search template (id {0}). |
|  Action  |Examine the log for the server error message. Also verify the Administration Console where the search template is defined. |

|  Code  | ALC-WKS-007-046 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred saving preference changes to the server. |
|  Action  |Examine the server log to provide info as to why the submit service failed. Verify that the LiveCycle server is running. |

|  Code  | ALC-WKS-007-049 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while initializing Workspace. |
|  Action  |This error likely occurred after a successful login but before all the initialization steps were complete. Refresh the browser to retry the connection attempt and examine the server log if the problem persists. |

|  Code  | ALC-WKS-007-050 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: A communication error occurred while adding an attachment (task {0}): {1} |
|  Action  |Verify that the file still exists on the filesystem. |

|  Code  | ALC-WKS-007-051 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: A security error occurred while adding an attachment (task {0}): {1} |
|  Action  |Verify the security permissions of the file you are trying to upload. |

|  Code  | ALC-WKS-007-052 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while adding a note entitled {0}. |
|  Action  |Examine the log for the server error message which caused the client to receive this error. |

|  Code  | ALC-WKS-007-053 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while retrieving processes. |
|  Action  |Examine the log for the server error message which caused the client to receive this error. |

|  Code  | ALC-WKS-007-054 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving tasks for process instance (process instance {0}). |
|  Action  |Examine the log for the server error message which caused the client to receive this error. |

|  Code  | ALC-WKS-007-055 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving the assignments for task (task {0}). |
|  Action  |Examine the log for the server error message which caused the client to receive this error. |

|  Code  | ALC-WKS-007-056 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while deleting attachment or note for task {0}. |
|  Action  |Examine the log for the server error message. Verify that the server permissions have not changed. |

|  Code  | ALC-WKS-007-057 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have deleted attachment {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-060 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have deleted the note titled '{0}'. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-061 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: An error occurred while deleting a note entitled {0}. |
|  Action  |Informational message only. No action is required. |

|  Code  | ALC-WKS-007-062 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while retrieving attachment document {0}. |
|  Action  |Verify that the user has access to the attachment or that the document is still available. |

|  Code  | ALC-WKS-007-065 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have saved attachment '{0}'. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-066 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while saving attachment {0}. |
|  Action  |Review the log file for error messages related to the permissions on the Task. |

|  Code  | ALC-WKS-007-067 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: A communication error occurred while updating an attachment (task {0}): {1} |
|  Action  |Verify that your server connection is still valid. The request to update the attachment is trying to connect to a servlet to perform the POST with the new data. The servlet name is "update-task-attachment". |

|  Code  | ALC-WKS-007-068 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: A security error occurred while updating an attachment (task {0}): {1} |
|  Action  |You do not have permission to update the attachment. Review the log to verify the user's access to the Task or its attachments. |

|  Code  | ALC-WKS-007-069 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your attempt to remove task {0} from your To Do list has failed. |
|  Action  |Verify that the log does not contain permission errors for the Task. It is possible that the user does not have access to the Task. |

|  Code  | ALC-WKS-007-070 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have successfully removed task {0} from your To Do list. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-071 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have submitted task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-072 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Task {0} has failed to submit. |
|  Action  |Verify that it is not a network issue. Otherwise, a change is required to the process definition. Examine the server log file to see the cause of the error. |

|  Code  | ALC-WKS-007-073 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have completed task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-074 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: An error occurred submitting the form. |
|  Action  |Review the server logs to see if there were issues within the submit service. |

|  Code  | ALC-WKS-007-075 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: The attempt to claim task {0} has failed. |
|  Action  |Verify that the Task is not locked by another process. |

|  Code  | ALC-WKS-007-076 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have claimed task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-077 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have added {0} to favorites. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-078 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have removed {0} from favorites. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-079 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while retrieving an extended note entitled {0}. |
|  Action  |Examine the log for the server error message which caused the client to receive this error. This operation is executed via a Data Service call, ensure that the server is still communicating with the client. |

|  Code  | ALC-WKS-007-080 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to unlock task {0}. |
|  Action  |Ensure that the server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-081 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have released task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-082 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to lock task {0}. |
|  Action  |Examine the log for the server error message which caused the client to receive this error. This operation is executed via a Data Service call, verify that the server is still communicating with the client. |

|  Code  | ALC-WKS-007-083 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have locked task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-084 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: An error occurred while trying to return task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-085 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have returned task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-091 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: A error occurred trying to retrieve the members in group id {0}. |
|  Action  |Ensure that the group id is valid. Review server log for a more detailed message. |

|  Code  | ALC-WKS-007-092 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: A error occurred trying to retrieve the group name for id {0}. |
|  Action  |Ensure that the group id is valid. Review the server log for a more detailed message. |

|  Code  | ALC-WKS-007-093 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Welcome {0} you have successfully logged in. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-094 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: At least one item must be selected. |
|  Action  |Select an item before proceeding with the action. |

|  Code  | ALC-WKS-007-096 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while retrieving process variables for process {0}. |
|  Action  |Ensure that the process is still active, if so, ensure that server is still active and review the server logs for a more detailed message |

|  Code  | ALC-WKS-007-097 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: List view layout {0} has been created. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-098 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: List view layout {0} has been updated. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-100 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have saved task {0} to Drafts in the To Do view. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-101 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while saving task {0} to Drafts. |
|  Action  |Ensure that the server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-102 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to abandon task {0}. |
|  Action  |Ensure that the server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-103 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have abandoned task {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-104 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while retrieving process variables for task {0}. |
|  Action  |Verify that the process is still active, and ensure that the server is still active. Review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-107 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: List view layout {0} has been deleted. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-108 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Your session has expired. Login again to continue. |
|  Action  |Informational text. User must log in again to continue |

|  Code  | ALC-WKS-007-109 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: The form associated with task {0} has multiple submit buttons so the Workspace Complete button will be disabled. Click the appropriate button on theform to submit it. |
|  Action  |Informational text. Follow instructions. |

|  Code  | ALC-WKS-007-110 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: The form associated with task {0} has no submit buttons and cannot be submitted. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-111 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: You have updated attachment '{0}'. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-112 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while updating attachment {0}. |
|  Action  |Ensure that the server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-113 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Task {0} has been added to the {1} queue. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-114 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while either sending data to or receiving data from the server. |
|  Action  |Ensure that the server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-115 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Queue access for {0} has been granted. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-116 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Queue access for {0} has been revoked. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-117 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while modifying access to your queue for user {0}. |
|  Action  |Ensure that the user is valid, and ensure the server is still active. Review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-118 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Queue access for {0} has been requested. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-119 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Queue access to {0} has been removed. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-120 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving endpoints from a list of endpoint IDs. |
|  Action  |Ensure that all requested endpoints are valid and ensure that the server is still active. Review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-121 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred retrieving group information. |
|  Action  |Ensure that the requested group is valid and ensure that the server is still active. Review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-122 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while removing your access to user {0}'s queue. |
|  Action  |Ensure that the server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-123 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while revoking user {0}'s access to your queue. |
|  Action  |Ensure that the user is valid and ensure that server is still active. Review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-124 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while requesting your access to user {0}'s queue. |
|  Action  |Ensure that the user is valid, and ensure that the server is still active. Review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-125 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: A specified condition is missing a value. |
|  Action  |Ensure that all conditions defined in the query have an associated value. |

|  Code  | ALC-WKS-007-126 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while retrieving email settings for user {0}. |
|  Action  |Ensure that the user is valid, and ensure that server is still active. Review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-127 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to retrieve the out of office settings. |
|  Action  |Ensure that server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-128 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to save the out of office settings. |
|  Action  |Ensure that all conditions defined in the query have an associated value. Ensure that server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-129 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while import business calendar: {0}. |
|  Action  |Ensure that server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-130 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An security error occurred while import business calendar: {0}. |
|  Action  |Verify that the user has rights to import business calendars. Ensure that server is still active and check the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-131 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while export business calendar: {0}. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-132 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while import business calendar, bad file name: {0}. |
|  Action  |Correct the filename described by {0} and try again. |

|  Code  | ALC-WKS-007-133 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while import business calendar: file is invalid. |
|  Action  |Verify that the user has rights to import business calendars. Ensure that the server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-134 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Business calendars have been successfully exported to: {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-135 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client; Business calendars have been successfully imported from: {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-136 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to get the default business calendar: {0}. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-137 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to set the default business calendar: {0}. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-138 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to get a business calendar: {0}. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-139 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to get all the business calendars: {0}. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-140 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to get the business calendar names: {0}. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-141 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to update a business calendar: {0}. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-142 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to call the data service task.getItem call. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-143 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to get business calendar mappings. |
|  Action  |Ensure that server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-144 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to update business calendar mappings. |
|  Action  |Ensure that the server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-145 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to get list of unique user keys for business calendars. |
|  Action  |Ensure that the server is still active and view the server logs for a more detailed message. |

|  Code  | ALC-WKS-005-001 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Authentication error: a problem occurred authenticating user "{0}" (error {1}). |
|  Action  |Verify that the user described in {0} is valid. Examine the Cause clause in the error described in {1}. |

|  Code  | ALC-WKS-005-002 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Authentication error: a problem occurred creating the default queue for user "{0}". |
|  Action  |Ensure the user described by {0} is still valid and examine any exceptions that precede this error message in the server log. |

|  Code  | ALC-WKS-005-003 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Server: Using connection properties from {0}. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-004 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Server: Using default connection properties (protocol={0}, server type={1}, endpoint={2}). |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-005 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Server: Could not determine the application server type. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-006 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred retrieving the category list. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-007 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Incorrect number of parameters supplied to a fill method ({0} provided, {1} expected). |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-008 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Security exception: the user specified in the fill parameters (oid={0}) did not match the authenticated user (oid={1}). |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-009 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred retrieving endpoints for category "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-010 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: The "{0}" config property was not set. |
|  Action  |Perform the bootstrapping step before using this product. |

|  Code  | ALC-WKS-005-011 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: The copy buffer size (configured in the {0} config property, numeric value is {1}) was not greater than zero. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-012 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: The requested resource {0} was not found in the repository; HTTP error 404 returned. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-013 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Server: The requested resource {0} was successfully returned (content type was {1}). |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-014 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred retrieving preferences for user "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-015 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred updating preferences for user "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-016 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred retrieving properties for user {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-017 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred updating properties for user {0} (property {1}). |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-018 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Server: The content-type for the document was unknown. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-019 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred retrieving favorites for user "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-020 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred adding favorites for user "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-021 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred deleting favorites for user {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-022 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Failed to forward task {0} to {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-023 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Failed to consult task {0} to {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-024 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Failed to share task {0} to {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-025 (Workspace) |
|---|---|
|  Type  |Error |
|  Cause  |Server: Task {0} could not be located. Events may not propagate correctly to the next user. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-026 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Access denied: access permission not assigned to user "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-027 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred attempting to verify permission for user "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-028 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred in the Render Service. |
|  Action  |Review the render orchestration for this process and apply a change that fixes the specified problem that occurs in the logs with this message. |

|  Code  | ALC-WKS-005-029 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred in the Submit Service. |
|  Action  |Review the submit orchestration for this process and apply a change that fixes the specified problem that occurs in the logs with this message. |

|  Code  | ALC-WKS-005-030 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while searching for users with a common name of "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-031 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while getting form data for task "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-032 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving attachments and notes for task {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-033 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred trying to set the task visibility for task "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-034 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred trying to claim task {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-037 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred trying to reject task {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-038 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Task manager callRenderService failed to produce a document for task {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-039 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred retrieving additional information about task {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-041 (Workspace) |
|---|---|
|  Type  |Error |
|  Cause  |Server: A problem occurred trying to retrieve the members in group id {0} with the name {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-042 (Workspace) |
|---|---|
|  Type  |Error |
|  Cause  |Server: A problem occurred trying to retrieve the name of the group for id {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-043 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while searching for groups with a common name of "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-044 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred trying to abandon task {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-045 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred trying to share queueid {0} with userid {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-046 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred trying to unshare queueid {0} with userid {1}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-047 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred when invoking the Queue Sharing process on behalf of {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-048 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while adding an attachment. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-049 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while adding a note entitled {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-050 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving an attachment or note for task {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-051 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while updating a note entitled {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-052 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while deleting attachment {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-053 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while deleting a note entitled {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-054 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving process variables for process {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-055 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving endpoints based on a collection of endpoint IDs. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-056 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving active process list for user with userid {0}. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-057 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while searching for groups with a common name of "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-058 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving the list of processes from the TypeTaskManagerQueryService. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-059 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving the list of process instances for process "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-060 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving the list of tasks for process instance with id "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-061 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving the list of active tasks for process instance with id "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-062 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving the list of assignments for task with id "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-063 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: No form data-mapping found when rendering the form for task with id "{0}". |
|  Action  |Review your orchestration. |

|  Code  | ALC-WKS-005-064 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Single-sign-on (SSO) failed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-065 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Single-sign-on failed. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-066 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred creating a calendar named "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-067 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred updating a calendar named "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-068 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred deleting a calendar named "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-069 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred getting all calendars. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-070 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred getting all calendar names. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-071 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred getting a calendar named "{0}". |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-072 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred getting the default calendar. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-073 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred setting the default calendar. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-074 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred getting the list of unique user keys. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-075 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred importing calendars |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-076 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred extracting calendars. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-077 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred exporting calendars. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-078 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred getting the list of task notification templates. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-079 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred saving the list of task notification templates. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-080 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred getting the list of administrative notification templates. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-081 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred saving the list of administrative notification templates. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-082 (Workspace) |
|---|---|
|  Type  |Error |
|  Cause  |Server: An error occurred while retrieving the out of office settings for user "{0}". |
|  Action  |Ensure that the user identified in {0} is valid, and check the server logs for a more detailed message. |

|  Code  | ALC-WKS-005-083 (Workspace) |
|---|---|
|  Type  |Error |
|  Cause  |Server: An error occurred while saving the out of office settings for user "{0}". |
|  Action  |Ensure that the user identified in {0} is valid, and check the server logs for a more detailed message. |

|  Code  | ALC-WKS-005-084 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while importing and parsing a business calendar file. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-085 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while importing and transforming a business calendar file. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-007-148 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to invokeEndpointFromStartTask for Task {0}. |
|  Action  |Make sure that the task identified by {0} is valid and check the server logs for a more detailed message |

|  Code  | ALC-WKS-007-149 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: credential check: credentials not found. login is required. |
|  Action  |Reauthenticate by logging back in. |

|  Code  | ALC-WKS-007-150 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to create a new business calendar: {0}. |
|  Action  |Ensure that the server is still active and check the server logs for a more detailed message |

|  Code  | ALC-WKS-007-151 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to delete a business calendar: {0}. |
|  Action  |Ensure that the server is still active and check the server logs for a more detailed message |

|  Code  | ALC-WKS-007-152 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while trying to get business calendar mapping type: {0}. |
|  Action  |Ensure that the server is still active and check the server logs for a more detailed message |

|  Code  | ALC-WKS-007-153 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while attempting to create a business calendar: {0}. |
|  Action  |Enusre that the server is still active and check the server logs for a more detailed message |

|  Code  | ALC-WKS-007-154 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Description change for task {0} was successful. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-007-155 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Client: Your attempt to change the description for task {0} was unsuccessful. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-086 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving a list of business calendar mappings. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-087 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while updating business calendar mappings. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-088 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while retrieving the resolution type for business calendar mappings. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-089 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while updating the resolution type for business calendar mappings. |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-090 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred while trying to re-initiate a new Task from Task "{0}". |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-091 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Server: The associated process is no longer available. You are unable to re-initiate a new Task from the selected Task "{0}". |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-092 (Workspace) |
|---|---|
|  Type  |Info |
|  Cause  |Server: A problem occurred when calling the submit service to perform a server-side calculate. The task id could not be found. |
|  Action  |Informational text only. No action is required. |

|  Code  | ALC-WKS-005-093 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: A problem occurred when calling the submit service to perform a server-side calculate. |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-WKS-005-094 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred changing the description for task with id "{0}". |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-095 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: Using the server locale [{0}] because the Accept-Language header was not set. |
|  Action  |The browser did not send an Accept-Language header, so the server locale was used by default. |

|  Code  | ALC-WKS-007-156 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: The task is null and must be set before using this method. |
|  Action  |Programming error. Ensure that a task is bound to SwfConnector object in a form build using Flash Builder. |

|  Code  | ALC-WKS-007-157 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: The submission format was not recognized. |
|  Action  |Programming error. The direct submit feature of Adobe Acrobat 9.1 is being used but an invalid submission format was provided. |

|  Code  | ALC-WKS-007-158 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Security restrictions prohibit submission to the target URL for task {0}. |
|  Action  |Programming error. The direct submit feature of Adobe Acrobat 9.1 is being used and Acrobat is rejecting the submission url. Likely needs a cross-domain entry if not being submitted directly back to the LiveCycle server. |

|  Code  | ALC-WKS-007-159 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: This PDF submission for task {0} requires Adobe reader extension save rights to be applied. |
|  Action  |Contact the owner of the process being used and report the problem. Update the process to have the document reader extended. |

|  Code  | ALC-WKS-007-160 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: An error occurred while retrieving collateral required to load the Form Guide. |
|  Action  |Contact the owner of the process being used and report the problem. Update the process. |

|  Code  | ALC-WKS-007-161 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: The form associated with task {0} cannot be submitted. You must upgrade your Adobe Reader version to 9.1 or greater. |
|  Action  |Upgrade the Adobe Reader version to 9.1 or greater. |

|  Code  | ALC-WKS-007-162 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your attempt to add a completion comment for task {0} was unsuccessful. |
|  Action  |Refresh the browser and retry the operation. If the problem persists, ensure that the server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-007-163 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Client: Your attempt to get the completion comment(s) for task {0} was unsuccessful. |
|  Action  |Refresh the browser and retry the operation. If the problem persists, ensure that the server is still active and review the server logs for a more detailed message. |

|  Code  | ALC-WKS-005-096 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: This document cannot be rendered. Ensure that your submit button has been configured to submit the correct data format. |
|  Action  |Check the form design and User Service settings to ensure that your submit button has been configured to submit the correct data format. |

|  Code  | ALC-WKS-005-097 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred getting the completion comment for task with id "{0}". |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

|  Code  | ALC-WKS-005-098 (Workspace) |
|---|---|
|  Type  |  |
|  Cause  |Server: An error occurred changing the completion comment for task with id "{0}". |
|  Action  |Examine the exceptions that immediately precede this error message in the server log. |

## XLIFF Tooling error codes {#xliff-tooling-error-codes}

|  Code  | ALC-XLF-000-001 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |XLIFF harvester was called with unknown command-line arguments. |
|  Action  |Use the -u option to list the known arguments. |

|  Code  | ALC-XLF-000-002 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The output file specified for the XLIFF harvester alreadys exists and could not be deleted. |
|  Action  |Remove the read-only bit on the output file. |

|  Code  | ALC-XLF-000-003 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The output file already exists. |
|  Action  |Use the -r option to replace it. |

|  Code  | ALC-XLF-000-004 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The source file specified does not exist. |
|  Action  |Make sure the source file path points to a file. |

|  Code  | ALC-XLF-000-005 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The XLIFF output document could not be written. |
|  Action  |Make sure the directory is writeable. |

|  Code  | ALC-XLF-000-006 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The integer argument provided was not an integer. |
|  Action  |Use the -u option to list the usage. |

|  Code  | ALC-XLF-000-007 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |Not enough arguments supplied to XLIFF harvest command. |
|  Action  |Use the -u option to list the usage. |

|  Code  | ALC-XLF-000-008 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The long argument was not a long. |
|  Action  |Use the -u option to list the usage. |

|  Code  | ALC-XLF-000-009 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The double argument was not a double. |
|  Action  |Use the -u option to list the usage. |

|  Code  | ALC-XLF-000-010 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The float argument was not a float. |
|  Action  |Use the -u option to list the usage. |

|  Code  | ALC-XLF-000-011 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The command-line option was not recognized. |
|  Action  |Use the -u option to list the usage. |

|  Code  | ALC-XLF-000-012 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |An argument was not supplied to a parameter which requires one. |
|  Action  |Use the -u option to list the usage. |

|  Code  | ALC-XLF-001-001 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The XLIFF harvester didn't have a harvester installed which understands the source file. |
|  Action  |Make sure all your source files are of types that are supported by your XLIFF harvester. It is also possible that one of your source files was corrupt and so was not recognized. |

|  Code  | ALC-XLF-001-002 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |An exception was thrown while harvesting. |
|  Action  |  |

|  Code  | ALC-XLF-001-003 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |Usually the result of a parser configuration error. |
|  Action  |  |

|  Code  | ALC-XLF-001-004 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |Attempted to harvest a file with parent paths, or to write the results to a location with parent paths. |
|  Action  |File paths are not allowed to have parent paths ("..") in them. |

|  Code  | ALC-XLF-002-001 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |XLIFF translation document couldn't be read. |
|  Action  |  |

|  Code  | ALC-XLF-002-002 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |The XLIFF translator didn't have a string replacer installed which understands the file to be translated. |
|  Action  |Make sure all your target files are of types that are supported by your XLIFF translator. It is also possible that one of your target files was corrupt and so was not recognized. |

|  Code  | ALC-XLF-002-003 (XLIFF Tooling) |
|---|---|
|  Type  |Error |
|  Cause  |An exception was thrown while translating. |
|  Action  |  |

## XML Form service error codes {#xml-form-service-error-codes}

|  Code  | ALC-XTG-102 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |error occurs with 5 simultaneous users rendering forms through the XMLForm Java API: 00000062 XMLFormServic W com.adobe.service.ProcessResource$ManagerImpl log ALC-XTG-102 -001: [6694] Script failed (language is javascript; context is xfa[0].form[0].form1[0].purchaseOrder[0].header[0].ordere dByAddress[0]) script=// Concatenate the address information. this.rawValue = $record.header.txtOrderedByCompanyName.value + '\u000a' + $record.header.txtOrderedByAddress.value + '\u000a' + $record.header.txtOrderedByCity.value + ', ' + $record.header.txtOrderedByStateProv.value + ', ' + $record.header.txtOrderedByZipCode.value + '\u000a' + $record.header.txtOrderedByCountry.value; [12/18/08 13:38:02:599 GMT-05:00] 00000061 XMLFormServic W com.adobe.service.ProcessResource$ManagerImpl log ALC-XTG-102 [12/18/08 13:38:02:863 GMT-05:00] 0000005c XMLFormServic W com.adobe.service.ProcessResource$ManagerImpl log ALC-XTG-102 -001: [6659] Error: Timeout |
|  Action  |(Bug #: 2251209) |

|  Code  | ALC-XTG-100-000 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Debug/Trace "XMLFormService.onStartService(), XMLFormService started" "XMLFormService.onStopService(), XMLFormService stopped" "setReportTimingInformation: %ls" "setDebug: %ls" "setPoolMax: %ls" "setMaximumReuseCount: %ls" "getMaximumReuseCount "setCT_AdditionalFontsCacheFile: %ls" "setCT_CommonFontsCacheFile: %ls" "getFontDirectories() getting directories" "FontManager exception" "Finished FontManager interaction" "setXCIProperty. propName: %ls" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-100-001 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Warning "Could not set XCI path. Reason: %ls" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-100-002 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal "Invalid file name." |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-100-003 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal "Error in call to FontManager. Exception: %ls" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-100-004 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal "Failed to load xci config properties, errorMsg : %ls" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-100-005 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal "Could not load XCI file. Reason: %ls" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-100-006 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal "Could not load XCI file %ls file does not exist or is empty", |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-100-007 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal "File not found: %ls" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-100-008 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal "Could not save XCI file" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-101-001 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Warning "Required locale could not be detected. Ensure the required locale %ls is installed on the system." |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-101-000 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Debug/Trace "Created a controller" "Entering runController" "==========================================================================" "=============== XMLForm Module Startup ===============" "=============== XTG Version %ls ================" "=============== Process Id %ls ================" "==========================================================================" "XMLFormServer: Doing STD redirection to file: %ls" "XMLFormServer: Failed to redirect handle: `%ls'" "XMLFormServer: Failed to open the redirection file: `%ls'" "Getting CT_AdditionalFontsCacheFile" "Getting CT_CommonFontsCacheFile" "Getting CT_SystemCacheFile" "Getting CT_TmpDirectory" "Getting CT_AllowSystemFonts" "XMLFormServer CT AdditionalFontsCacheFile: %ls" "XMLFormServer CT CommonFontsCacheFile: %ls" "XMLFormServer CT SystemCacheFile: %ls" "XMLFormServer CT TmpDirectory: %ls" "XMLFormServer: CT AllowSystemFonts is %ls" "XMLFormServer CommonDir: %ls" "XMLFormServer UnicodeDir: %ls" "XMLFormServer AdditionalDir: %ls" "XMLFormServer::XMLFormServer called CoreTechLib on thread %ls" "XMLFormServer: Instantiate protocol objects" "XMLFormServer::XMLFormServer returning" "XMLForm Module Terminating process %ls" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-101-000 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Info "Failed Getting CT_AllowSystemFonts" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-101-002 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal -------------------------- XTG resource |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-101-003 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Info "XMLFormServer: No TraceLevel Property" "XMLFormServer: No ReportTimingInformation Property" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-101-003 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Warning "XMLFormServer: Failed to resolve CommonDir property. Check your font location settings." "XMLFormServer: Failed to resolve UnicodeDir property. Check your font location settings." "XMLFormServer: Failed to retrieve AdditionalDir property. Check your font location settings." "XMLFormServer: Failed to resolve FontDB property. Check your font location settings." |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-101-003 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Debug/Trace "XMLFormServer::newRequestHandler: Get ConfigXML Property" "XMLFormServer::newRequestHandler: No ConfigXML Property" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-101-004 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Fatal XTG resource "The following font settings were used: CTAdditionalFontsCacheFile=\"%ls\" CTAdditionalFontsDirectory=\"%ls\" CTAllowSystemFonts=\"%ls\" CTCommonFontsCacheFile=\"%ls\" CTCommonFontsDirectory=\"%ls\" CTFntNamesDBFile=\"%ls\" CTSysemCacheFile=\"%ls\" CTTmpDirectory=\"%ls\" CTUnicodeDirectory=\"%ls\"" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-102-000 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Debug/Trace messages "DataManager::CreateFileDataBuffer(api::DataBuffer) entered" "DataManager::CreateFileDataBuffer(api::DataBuffer) returning" "DataManager::CreateFileDataBuffer(wchar_t &ast;) entered" "DataManager::CreateFileDataBuffer() : Calling AdobeServer::createFileDataBuffer()" "DataManager::CreateFileDataBuffer() : Calling DataManagerService::createFileDataBuffer()" "DataManager::CreateFileDataBuffer() : CORBA::SystemException received" "DataManager::CreateFileDataBuffer() : std::exception received" "DataManager::CreateFileDataBuffer() : Unhandled exception received" "DataManager::CreateFileDataBuffer(wchar_t &ast;) returning" "DataManager::GetDefaultMaxInlineSize() entered" "DataManager::GetDefaultMaxInlineSize() : Calling DataManagerService::getDefaultMaxInlineSize()" "DataManager::GetDefaultMaxInlineSize() : CORBA::SystemException received" "DataManager::GetDefaultMaxInlineSize() : std::exception received" "DataManager::GetDefaultMaxInlineSize() : Unhandled exception received" "DataManager::GetDefaultMaxInlineSize() returning" "DataManager::ManageTempFile() entered" "DataManager::ManageTempFile() : Calling DataManagerService::manageTempFile()" "DataManager::ManageTempFile() : CORBA::SystemException received" "DataManager::ManageTempFile() : std::exception received" "DataManager::ManageTempFile() : Unhandled exception received" "DataManager::ManageTempFile() returning" "DataManager::GetTempFileName() entered" "DataManager::GetTempFileName() : Calling AdobeServer::getTempFileName()" "DataManager::GetTempFileName() : Calling DataManagerService::getTempFileName()" "DataManager::GetTempFileName() : CORBA::SystemException received" "DataManager::GetTempFileName() : std::exception received" "DataManager::GetTempFileName() : Unhandled exception received" "DataManager::GetTempFileName() returning" "DataManager::getCorbaObject() entered" "DataManager::getCorbaObject() got resource object" "DataManager::getCorbaObject() failed to narrow DataManager resource" "DataManager::getCorbaObject() narrowed DataManager resource" "DataManager::getCorbaObject() throwing RenderException" "DataManager::getCorbaObject() returning" "DataManager::Initialize() entered" "DataManager::Initialize() returning" "XMLFormAgent::setConfigValue: entered" "XMLFormAgent::setConfigValue: InvalidSOMExpressionException" "XMLFormAgent::setConfigValue: InvalidConfigurationException" "XMLFormAgent::setConfigValue: returning" "XMLFormAgent::setConfigValues: entered" "XMLFormAgent::setConfigValue: InvalidSOMExpressionException" "XMLFormAgent::setConfigValue: InvalidConfigurationException" "XMLFormAgent::setConfigValues: returning" "XMLFormAgent::getConfigValue: entered" "XMLFormAgent::getConfigValue: InvalidSOMExpressionException" "XMLFormAgent::getConfigValue: returning" "XMLFormAgent::render: entered" "XMLFormAgent::render: NoTemplateException" "XMLFormAgent::render: InvalidTemplateException" "XMLFormAgent::render: RenderException" "XMLFormAgent::render: InvalidXDCException" "XMLFormAgent::render: returning" "XMLFormAgent::renderAs: entered" "XMLFormAgent::renderAs: Format: %ls" "XMLFormAgent::renderAs: NoTemplateException" "XMLFormAgent::renderAs: InvalidTemplateException" "XMLFormAgent::renderAs: RenderException" "XMLFormAgent::renderAs: InvalidXDCException" "XMLFormAgent::renderAs: returning" "XMLFormAgent::getPageCount: entered" "XMLFormAgent::getPageCount: returning" "XMLFormAgent::importPackets: entered" "XMLFormAgent::importPackets: returning" "XMLFormAgent::importPacketsWorker File Name: %ls" "XMLFormAgent::importPacketsWorker Packet List: %ls" "XMLFormAgent::importPacketsWorker Packet List: NULL" "XMLFormAgent::importPacketsWorker bReplace: TRUE" "XMLFormAgent::importPacketsWorker bReplace: FALSE" "XMLFormAgent::importPacketsWorker: calling reloadPackets" "XMLFormAgent::importPacketsWorker: calling importPackets" "XMLFormAgent::exportXDP: entered" "XMLFormAgent::exportXDP Packet List: %ls" "XMLFormAgent::exportXDP Packet List: NULL" "XMLFormAgent::exportXDP: returning" "XMLFormAgent::exportXML: entered" "XMLFormAgent::exportXML Packet: %ls", "XMLFormAgent::exportXML: returning" "XMLFormAgent::getPacketList: entered" "XMLFormAgent::getPacketList: returning" "XMLFormAgent::isPacketPresent: entered" "XMLFormAgent::isPacketPresent Packet: %ls", "XMLFormAgent::isPacketPresent: returning" "XMLFormAgent::getMessages: entered" "XMLFormAgent::getMessages: returning" "XMLFormAgent::clearMessages: entered" "XMLFormAgent::clearMessages: returning" "XMLFormFactory::XMLFormFactory entered" "XMLFormFactory::XMLFormFactory CONSTRUCTOR - calling impl::XMLFormAgentFactory" "XMLFormFactory::XMLFormFactory CONSTRUCTOR - have new impl" "XMLFormFactory::XMLFormFactory - returning" "XMLFormFactory::create entered" "XMLFormFactory::create InvalidXDPException" "XMLFormFactory::create InvalidPacketNameException" "XMLFormFactory::create returning" "XMLFormFactory::createDefault entered" "XMLFormFactory::createDefault returning" "XMLFormFactory::PAexecute82 - entered" "XMLFormFactory::PAexecute82 options.reGeneratePDF is TRUE" "XMLFormFactory::PAexecute82 - invoking mpoFormAgentFactory->PAexecute" "XMLFormFactory::PAexecute82 mpoFormAgentFactory->PAexecute returned" "XMLFormFactory::PAexecute82: InvalidTemplateException" "XMLFormFactory::PAexecute82: InvalidXDCException" "XMLFormFactory::PAexecute82: RenderException" "XMLFormFactory::PAexecute82 - returning" "XMLFormFactory::renderBatchForPrint - entered" "XMLFormFactory::renderBatchForPrint - invoking mpoFormAgentFactory->renderBatchForPrint" "XMLFormFActory::renderBatchForPrint - mpoFormAgentFactory->renderBatchForPrint returned" "XMLFormFactory::renderBatchForPrint: InvalidTemplateException" "XMLFormFactory::renderBatchForPrint: InvalidXDCException" "XMLFormFactory::renderBatchForPrint: RenderException" "XMLFormFactory::renderBatchForPrint - returning" "XMLFormFactory::renderBatchForPrintReuseLayout - entered" "XMLFormFactory::renderBatchForPrintReuseLayout - returning" "XMLFormFactory::renderBatchForPrint82 - entered" "XMLFormFactory::renderBatchForPrint82 - returning" "XMLFormFactory::renderBatchForPrintReuseLayout - invoking mpoFormAgentFactory->renderBatchForPrint" "XMLFormFactory::renderBatchForPrint82 - invoking mpoFormAgentFactory->renderBatchForPrint" "XMLFormFActory::renderBatchForPrintReuseLayout - mpoFormAgentFactory->renderBatchForPrint returned" "XMLFormFActory::renderBatchForPrint82 - mpoFormAgentFactory->renderBatchForPrint returned" "XMLFormFactory::renderBatchForPrintReuseLayout: InvalidTemplateException" "XMLFormFactory::renderBatchForPrint82: InvalidTemplateException" "XMLFormFactory::renderBatchForPrintReuseLayout: InvalidXDCException" "XMLFormFactory::renderBatchForPrint82: InvalidXDCException" "XMLFormFactory::renderBatchForPrintReuseLayout: RenderException" "XMLFormFactory::renderBatchForPrint82: RenderException" "XMLFormFactory::toSimplePS - entered" "XMLFormFactory::toSimplePS mpoFormAgentFactory->toSimplePS threw an exception" "XMLFormFactory::toSimplePS - returning" "XMLFormFactory::renderAll - entered" "XMLFormFactory::renderAll - invoking mpoFormAgentFactory->renderAll" "XMLFormFactory::renderAll mpoFormAgentFactory->renderAll returned" "XMLFormFactory::renderAll: InvalidTemplateException" "XMLFormFactory::renderAll: InvalidXDCException" "XMLFormFactory::renderAll: RenderException" "XMLFormFactory::renderAll - returning" "XMLFormFactory::renderBatch - entered" "XMLFormFactory::renderBatch - invoking mpoFormAgentFactory->renderBatch" "XMLFormFactory::renderBatch mpoFormAgentFactory->renderBatch returned" "XMLFormFactory::renderBatch: InvalidTemplateException" "XMLFormFactory::renderBatch: InvalidXDCException" "XMLFormFactory::renderBatch: RenderException" "XMLFormFactory::renderBatch - returning" "XMLFormFactory::PAexecuteNoDataInProcInfo - entered" "XMLFormFactory::PAexecute - entered" "XMLFormFactory::PAexecute - invoking mpoFormAgentFactory->PAexecute" "XMLFormFactory::PAexecute mpoFormAgentFactory->PAexecute returned" "XMLFormFactory::PAexecute exception: have processing info" "XMLFormFactory::PAexecute exception: empty processing info" "XMLFormFactory::PAexecute exception: have processing info" "XMLFormFactory::PAexecute exception: empty processing info" "XMLFormFactory::PAexecute - returning" "XMLFormFactory::PAexecuteInlined - entered" "XMLFormFactory::PAexecuteInlined - invoking mpoFormAgentFactory->PAexecute" "XMLFormFactory::PAexecuteInlined mpoFormAgentFactory->PAexecute returned" "XMLFormFactory::PAexecuteInlined exception: have processing info" "XMLFormFactory::PAexecuteInlined exception: empty processing info" "XMLFormFactory::PAexecuteInlined mpoFormAgentFactory->PAexecute threw an exception" "XMLFormFactory::PAexecuteInlined exception: have processing info" "XMLFormFactory::PAexecuteInlined exception: empty processing info" "XMLFormFactory::PAexecuteInlined - returning" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-102-000 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Error messages "[%ls] %ls threw CORBA SystemException: \"%ls\"." "[%ls] %ls threw standard system exception: \"%ls\"." "[%ls] %ls threw unknown exception." |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-102-002 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} fatal message ---------------------------------- error retrieved from XTG resources |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-102-003 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0}; fatal message ----------------------------------- "XMLFormFactory::PAexecuteInlined mpoFormAgentFactory->PAexecute threw a system exception: %ls" "XMLFormFactory::PAexecute mpoFormAgentFactory->PAexecute threw a system exception: %ls" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-102-004 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} fatal message "XMLFormFactory::PAexecute mpoFormAgentFactory->PAexecute threw an unhandled exception" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-104-000 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Debug/Trace "XAppStoreProtocol::XAppStoreProtocol()" "::Get() url entered" "::Get() have dmResource" "::Get() createFileDataBufferFromUrl URL=%ls" "XAppStoreProtocol::Get() createFileDataBufferFromUrl returned successfully" "XAppStoreProtocol::Get() createFileDataBufferFromUrl Threw InvalidSourceException" "XAppStoreProtocol::Get() createFileDataBufferFromUrl Threw CORBA::SystemException" "XAppStoreProtocol::Get() createFileDataBufferFromUrl Threw Unknown exception" "::Get url returning" "::Get Memory entered" "::Get Memory returning" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-104-000 (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Error -------------------------- "::Get() dmResource is nil" |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-%03i-%03i (XML Form service) |
|---|---|
|  Type  |  |
|  Cause  |{0} Info/Warning/Error XTG resource |
|  Action  |Address the issue identified in the Cause section of the log message. |

|  Code  | ALC-XTG-001-361 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |Invalid PDF extension level (0). The extension level will be ignored. |
|  Action  |  |

|  Code  | ALC-XTG-032-303 (XML Form service) |
|---|---|
|  Type  |Error |
|  Cause  |[29487] "XMLForm, renderAll : 29487, Invalid version: The current version of the XFA template model exceeds the capability of Acrobat / Adobe Reader 7."} [29487] "XMLForm, renderAll : 29487, Invalid version: The current version of the XFA template model exceeds the capability of Acrobat / Adobe Reader 7.0.5."} [29487] "XMLForm, renderAll : 29487, Invalid version: The current version of the XFA template model exceeds the capability of Acrobat / Adobe Reader 8."} [29487] "XMLForm, renderAll : 29487, Invalid version: The current version of the XFA template model exceeds the capability of Acrobat / Adobe Reader 9.0."} [29487] "XMLForm, renderAll : 29487, Invalid version: The current version of the XFA template model exceeds the capability of Acrobat / Adobe Reader 9.1."} [29487] "XMLForm, reloadPackets : 29487, Invalid version: The current version of the XFA template model exceeds the capability of XFAPresentationAgent."} LogManage |
|  Action  |  |

|  Code  | ALC-XTG-032-305 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |[29489] "Updated the output version to Acrobat / Adobe Reader 7.0.5 to support current version of the XFA template model."} [29489] "Updated the output version to Acrobat / Adobe Reader 8 to support current version of the XFA template model."} [29489] "Updated the output version to Acrobat / Adobe Reader 8.1 to support current version of the XFA [29489] "Updated the output version to Acrobat / Adobe Reader 9.1 to support current version of the XFA template model."} |
|  Action  |  |

|  Code  | ALC-XTG-032-299 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |[29483] "Invalid version: breakAfter is not a valid child element of subform for the target version of the document." [29483] "Invalid version: script is not a valid child element of breakAfter for the target version of the document." |
|  Action  |  |

|  Code  | ALC-XTG-032-300 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |[29484] "Invalid version: locale is not a valid attribute of draw for the target version of the document." [29484] "Invalid version: commitOn is not a valid attribute of choiceList for the target version of the document." |
|  Action  |  |

|  Code  | ALC-XTG-032-304 (XML Form service) |
|---|---|
|  Type  |Error |
|  Cause  |[29488] "Invalid version: field does not have property or function 'length' for the current version of the document." [29488] "Invalid version: field does not have property or function 'getDisplayItem' for the current version of the document." [29488] "Invalid version: dataGroup does not have property or function 'spouse' for the current version of the document." [29488] "Invalid version: dataGroup does not have property or function 'holdings' for the current version of the document." [29488] "Invalid version: dataGroup does not have property or function 'owner' for the current version of the document." |
|  Action  |  |

|  Code  | ALC-XTG-032-316 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |[29500] "Unrecognized namespace XFA {99.0}, defaulting to XFA 3.1 |
|  Action  |  |

|  Code  | ALC-XTG-032-042 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |[29226] "commitOn is not a valid attribute of choiceList, Attribute not loaded. Line {220}. |
|  Action  |  |

|  Code  | ALC-XTG-032-108 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |[29292] "Script failed (language is formcalc; context is xfa[0].form[0].form1[0].#subform[0].FormCalc_Client[0].NumericField1[0]) script=this.rawValue = "hello""}{ALC-XTG-032-275 [29459] "Error: Illegal value: cannot assign {'hello'} to xfa[0].form[0].form1[0].#subform[0].FormCalc_Client[0].NumericField1[0].#value[0].#float[0]."} LogManager |
|  Action  |  |

|  Code  | ALC-XTG-034-200 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |XMLForm, importPackets : 30408, XSLT parsing error 31: bad element content |
|  Action  |Ensure that the XSLT snippet being parsed is well-formed and that it is available at the specified location. |

|  Code  | ALC-XTG-012-580 (XML Form service) |
|---|---|
|  Type  |Warning |
|  Cause  |The signablePrintPDF element is only supported in PDF version 1.7 |
|  Action  |This warning is reported for Acrobat versions earlier than 9. To prevent it from appearing, either set Acrobat Version to Adobe Acrobat 9 Or Later or set the value of the RetainSignatureField for the generatePDFOutput(2) service to None. |

## Miscellaneous Errors {#miscellaneous-errors}

These types of errors are typically caused by one of these issues:

* Running out of threads
* Threads and memory allocation

Many different types of threads are available; however, they fall into two categories: Java threads and native threads. All threads that are running within a Java™ virtual machine (JVM™) are Java threads ( java.lang.Thread class inside Java). The native code (C++/C) creates native threads that are scheduled and managed by the operating system. Here are the key differences between the two types:

* Operating system tools (such as perfmon or Task Manager) knows only about native threads.
* Java threads are created and managed by LiveCycle ES4 code, application server, or the JVM itself.

Because the operating system has no visibility into Java threads, when you monitor threads by using operating system tools such as perfmon , you are monitoring only native threads. The only way to get details into Java threads is to get a Java thread dump . The process about how to get a Java thread dump varies, depending on your application server and JVM. Refer to the manufacturer's documentation.

Incidentally, the implementation of the JVM is done in C/C++ code and that JVM code maps Java threads to native threads. This mapping can be either 1:1 (1 Java thread to 1 native thread) or N:1 (multiple Java threads to 1 native thread). The details of how this mapping works will be specific to the JVM vendor; however, 1:1 mapping is a typical default. This means that each Java thread will have a corresponding native thread. The number of Java threads has no definite limit; however, because 1:1 mapping is typical and the number of native threads has definite limits, you can run out of Java threads as well. This limit applies per process (JVM being a single process) and varies on each operating system. You can assume that the limit will be in the thousands (but less than 10,000). Regardless of this number, having several hundreds of threads is a performance problem because the operating system has to schedule up to that many threads.

Another common issue for threads pertains to memory allocations. When a new Java thread is allocated, a fixed amount of memory is required for the thread's stack. This thread stack space is a tunable parameter ( -Xss option for JVM) and the default is ~512 KB . Therefore, if you have 1000 threads, 500 MB of memory will be required just for the thread's stacks. This memory will compete with all the other memory allocations being done in the JVM (for example, what LiveCycle ES4 allocates) and will create memory allocation issues.

In practice, when the JVM cannot allocate memory or create threads, it throws an OutOfMemory exception back to the caller. Along with this exception will be a stack trace and a reason for throwing the exception. This reason is very important to take notice of; it will give you further clues to what the problem may be.

The following code is an example of a message that displays two errors and their associated reason codes:*"unable to create new native thread: java.lang.OutOfMemoryError: unable to create new native thread java.lang.OutOfMemoryError: Java heap space"*

These errors mean that the JVM could not create more threads for one of these reasons:

* The per-process thread limit is reached.
* The thread stack could not be allocated.

To determine the exact cause, you need to get a thread dump (also known as Java jump ). Thread dump will generally be called javacore.xxxx.txt and reside under an application server's log directories. Much information will be inside the thread dump, but you can quickly determine the number of threads by counting the occurrences of the TID: token on the list. A typical entry will look like this example:

"Thread-1227" (TID:0x106948F0, sys_thread_t:0x78996DA0, state:R, native ID:0x191C) prio=54XESTACKTRACE at java.net.SocketInputStream.socketRead0(Native Method)4XESTACKTRACE at java.net.SocketInputStream.read(SocketInputStream.java(Compiled Code))4XESTACKTRACE at java.io.BufferedInputStream.fill(BufferedInputStream.java(Compiled Code))4XESTACKTRACE at java.io.BufferedInputStream.read1(BufferedInputStream.java(Compiled Code))4XESTACKTRACE at java.io.BufferedInputStream.read(BufferedInputStream.java(Compiled Code))4XESTACKTRACE at com.sun.jndi.ldap.Connection.run(Connection.java(Compiled Code))4XESTACKTRACE at java.lang.Thread.run(Thread.java:567)

If you find thousands of threads, you are probably running out of threads. Developers should be able to identify obvious culprits by scanning the stack traces of these threads.

>[!NOTE]
>
>Thread dumps are typically intrusive and require that you restart the application server afterward.

If the thread count is in the hundreds, the reason for the java.lang.OutOfMemory error is not the thread limit. Reduce the thread stack size ( -Xss option mentioned above), rerun LiveCycle ES4, and check whether the problem disappears.

### 404 File not found {#file-not-found}

>[!NOTE]
>
>If you see this error, perform these checks:
>
>* Confirm the problem in the browser's access log.
>* Confirm that the EAR file deployed properly and that the application initialized.
>* If the URL is intended for the HTTP server, check that the file exists. Look in the error_log file or error.log file for the full file name that the web server is looking for.
>* (JBoss) Make sure the URL uses the correct case (it is case-sensitive).
>* (JBoss) Check whether the web application context root (first part of the URL) exist in the uriworkermap.properties file of the JK plug-in configuration.
>* (JBoss) If the file is a JSP, does the file exist in the EAR? This option will be confirmed by the absence of an entry in the HTTP server's error log file.
>

### Class not found {#class-not-found}

>[!NOTE]
>
>If you see this error, check whether any of these problems exist:
>
>* The class path setting is invalid or missing.
>* The JAR file is obsolete.
>* A compilation problem exists in the class.
>

### JNDI name not found {#jndi-name-not-found}

If the symptom is an exception stack trace showing javax.naming.NameNotFoundException: jdbc/ , check whether the expected name is spelled correctly; if it is not, fix the code.

1. Check the JNDI tree on the LiveCycle ES4 application server. Does the name used appear in the tree?

    * If yes, it is most likely that your code has not properly set up the InitialContext object being used for the look-up, and the look-up is being done on a JNDI tree that is not the one the resource is listed in. For the property values to use, see the Installing and Deploying LiveCycle ES4 document for your application server.
    * If no, continue to step 2.

1. Check whether the resource appears in the JNDI tree under a name other than the name that is listed in the look-up?

    * If yes, you are using the incorrect look-up name. Provide the correct name.
    * If no, continue to step 3.

1. Review the application server logs during startup. If the application server is configured to make this resource available but it is not working properly, an exception appears here. Did an exception appear?

    * If yes, review the exception and stack trace. If the NameNotFoundException is a symptom of another problem based on your investigation of the server logs, go to the troubleshooting steps for that problem.
    * If no, continue to step 4.

1. If the resource is not listed in the JNDI tree and no exception appears at startup to explain why it is not available, the most probable issue is that the application server is not configured properly to make that resource available. Review the application server configuration. Is it configured to make this resource available?

    * If no, refer to the Installing and Deploying LiveCycle ES4 document for your application server.
    * If yes, this problem is not one of the common ones that cause this issue. Contact Adobe Support.

## Log Files {#log-files}

### Using LiveCycle ES4 and Application Server Log Files {#using-livecycle-es-and-application-server-log-files}

Log files are useful for LiveCycle ES4 and application server failure analysis and may be required when dealing with Adobe Enterprise Support.

This section lists the common log files that you can use to diagnose LiveCycle ES4 problems. It also describes some of the most common errors that may be included in the LiveCycle ES4 log file.

#### LiveCycle ES4 Log files {#livecycle-es-log-files}

You can use log files to troubleshoot problems with LiveCycle ES4 installation or operation:

* LiveCycle ES4 log file: By default, the LiveCycle ES4 log file is located in the [LiveCycleES4 root] directory and named log.txt.
* LiveCycle Configuration Manager log file: By default, the LiveCycle Administration Console log file is in [LiveCycleES4 root] /ConfigurationManager/log and is named lcm.0.log or similar (the higher the number, the more recent the logs). The log files are useful for LiveCycle Configuration Manager failure analysis.

#### Application server log files {#application-server-log-files}

The application server log files are useful for application server and LiveCycle ES4 bootstrapping failure analysis. The default log files are in the following location for your application server:

JBoss: [LiveCycleES4 root] /jboss/server/all/log or [JBoss root] /server/all/log and named boot.log and server.log

WebLogic: /var/log/httpd/error_log

WebSphere: [WebSphere root] /logs/server1/trace.log

If the log file does not provide enough information to help you troubleshoot problems, you can specify the level of tracing in the log file to increase logging details. (See "Troubleshooting" in LiveCycle ES4 Administration Help .)
