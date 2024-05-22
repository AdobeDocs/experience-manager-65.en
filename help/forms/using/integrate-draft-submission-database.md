---
title: Sample for integrating drafts & submissions component with database
description: Reference implementation of customized data and metadata services to integrate drafts and submissions component with a database.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: publish
exl-id: 2e4f8f51-df02-4bbb-99bb-30181facd1e0
solution: Experience Manager, Experience Manager Forms
feature: Forms Portal
role: Admin, User, Developer
---
# Sample for integrating drafts & submissions component with database {#sample-for-integrating-drafts-submissions-component-with-database}

## Sample overview {#sample-overview}

AEM Forms portal drafts and submissions component allows users to save their forms as drafts and submit later from any device. Also, users can view their submitted forms on portal. To enable this functionality, AEM Forms provides data and metadata services to store the data filled in by a user in the form and the form metadata associated with drafts and submitted forms. This data is stored in the CRX repository, by default. However, as users interact with forms through AEM publish instance, which is generally outside the enterprise firewall, organizations may want to customize data storage for it to be more secure and reliable.

The sample, discussed in this document, is a reference implementation of customized data and metadata services to integrate drafts and submissions component with a database. The database used in the sample implementation is **MySQL 5.6.24**. However, you can integrate the drafts and submissions component with any database of your choice.

>[!NOTE]
>
>* The examples and configurations explained in this document are according to MySQL 5.6.24 and you must substitute them appropriately for your database system.
>* Ensure that you have installed latest version of AEM Forms add-on package. For the list of available packages, see the [AEM Forms releases](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) article.
>* The sample package works only with Adaptive Forms submit actions.

## Set up and configure the sample {#set-up-and-configure-the-sample}

Perform the following steps, on all the author and publish instances, to install and configure the sample :

1. Download the following **aem-fp-db-integration-sample-pkg-6.1.2.zip** package to your file system.

   Sample package for database integration

   [Get File](assets/aem-fp-db-integration-sample-pkg-6.1.2.zip)

1. Go to AEM package manager at https://[*host*]:[*port*]/crx/packmgr/.
1. Click **[!UICONTROL Upload Package]**.

1. Browse to select the **aem-fp-db-integration-sample-pkg-6.1.2.zip** package and click **[!UICONTROL OK]**.
1. Click **[!UICONTROL Install]** to next to the package to install the package.
1. Go to **[!UICONTROL AEM Web Console Configuration]**
 page at https://[*host*]:[*port*]/system/console/configMgr.
1. Click to open **[!UICONTROL Forms Portal Draft and Submission Configuration]** in edit mode.

1. Specify the values for properties as described in the following table:

   | **Property** |**Description** |**Value** |
   |---|---|---|
   | Forms Portal Draft Data Service |Identifier for draft data service |formsportal.sampledataservice |
   | Forms Portal Draft Metadata Service |Identifier for draft metadata service  |formsportal.samplemetadataservice |
   | Forms Portal Submit Data Service |Identifier for submit data service  |formsportal.sampledataservice |
   | Forms Portal Submit Metadata Service |Identifier for submit metadata service  |formsportal.samplemetadataservice |
   | Forms Portal Pending Sign Data Service |Identifier for Pending Sign data service  |formsportal.sampledataservice |
   | Forms Portal Pending Sign Metadata Service |Identifier for Pending Sign metadata service  |formsportal.samplemetadataservice |

   >[!NOTE]
   >
   >The services are resolved by their names mentioned as value for the `aem.formsportal.impl.prop` key as follows:

   ```java
   @Service(value = {SubmitDataService.class, DraftDataService.class})
   @Property(name = "aem.formsportal.impl.prop", value = "formsportal.sampledataservice")
   @Service(value = { SubmitMetadataService.class, DraftMetadataService.class })
   @Property(name = "aem.formsportal.impl.prop", value = "formsportal.samplemetadataservice")
   ```

   You can change names of the data and metadata tables.

   To provide a different name for the metadata table:

    * In the Web Console Configuration, find and click Forms Portal Metadata Service Sample Implementation. You can change the values of data source, metadata/additional metadata table name.

   To provide a different name for the data table:

    * In the Web Console Configuration, find and click Forms Portal Data Service Sample Implementation. You can change the values of data source and data table name.

    >[!NOTE]
    >
    >If you change the table names, provide them in the Form Portal configuration.   

1. Leave other configurations as is and click **[!UICONTROL Save]**.

1. The database connection can be done via Apache Sling Connection Pooled Data Source.
1. For Apache Sling connection, find and click to open **[!UICONTROL Apache Sling Connection Pooled DataSource]** in edit mode in the Web Console Configuration. Specify the values for properties as described in the following table:

<table>
 <tbody>
  <tr>
   <td><strong>Property</strong></td>
   <td><strong>Value</strong></td>
  </tr>
  <tr>
   <td>Datasource name</td>
   <td><p>A datasource name for filtering drivers from the data source pool</p> <p><strong>Note: </strong><em>The sample implementation uses FormsPortal as the datasource name.</em></p> </td>
  </tr>
  <tr>
   <td>JDBC driver class</td>
   <td>com.mysql.jdbc.Driver</td>
  </tr>
  <tr>
   <td>JDBC connection URI<br /> </td>
   <td>jdbc:mysql://[<em>host</em>]:[<em>port</em>]/[<em>schema_name</em>]</td>
  </tr>
  <tr>
   <td>Username</td>
   <td>A username to authenticate and perform actions on database tables</td>
  </tr>
  <tr>
   <td>Password</td>
   <td>Password associated with the username</td>
  </tr>
  <tr>
   <td>Transaction Isolation</td>
   <td>READ_COMMITTED</td>
  </tr>
  <tr>
   <td>Max Active Connections</td>
   <td>1000</td>
  </tr>
  <tr>
   <td>Max Idle Connections</td>
   <td>100</td>
  </tr>
  <tr>
   <td>Min Idle Connections</td>
   <td>10</td>
  </tr>
  <tr>
   <td>Initial Size</td>
   <td>10</td>
  </tr>
  <tr>
   <td>Max Wait</td>
   <td>100000</td>
  </tr>
  <tr>
   <td>Test on Borrow</td>
   <td>Checked</td>
  </tr>
  <tr>
   <td>Test while Idle</td>
   <td>Checked</td>
  </tr>
  <tr>
   <td>Validation Query</td>
   <td>Example values are SELECT 1(mysql), select 1 from dual(oracle), SELECT 1(MS Sql Server) (validationQuery)</td>
  </tr>
  <tr>
   <td>Validation Query timeout</td>
   <td>10000</td>
  </tr>
 </tbody>
</table>

   >[!NOTE]
   >
   >* The JDBC driver for MySQL is not provided with the sample. Ensure that you have provisioned for it and provide the required information to configure the JDBC connection pool.
   >* Point your author and publish instances to use same database. Value of the JDBC connection URI field must be same for all the author and publish instances.

1. Leave other configurations as is and click **[!UICONTROL Save]**.

1. If you already have a table in the database schema, skip to the next step.

   Otherwise, if you do not already have a table in the database schema, execute the following SQL statements to create separate tables for data, metadata, and additional metadata in the database schema:

   >[!NOTE]
   >
   >You do not require different databases for author and publish instances. Use same database on all the author and publish instances.

   **SQL statement for data table**

   ```sql
   CREATE TABLE `data` (
   `owner` varchar(255) DEFAULT NULL,
   `data` longblob,
   `metadataId` varchar(45) DEFAULT NULL,
   `id` varchar(45) NOT NULL,
   PRIMARY KEY (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   ```

   **SQL statement for metadata table**

   ```sql
   CREATE TABLE `metadata` (
   `formPath` varchar(1000) DEFAULT NULL,
   `formType` varchar(100) DEFAULT NULL,
   `description` text,
   `formName` varchar(255) DEFAULT NULL,
   `owner` varchar(255) DEFAULT NULL,
   `enableAnonymousSave` varchar(45) DEFAULT NULL,
   `renderPath` varchar(1000) DEFAULT NULL,
   `nodeType` varchar(45) DEFAULT NULL,
   `charset` varchar(45) DEFAULT NULL,
   `userdataID` varchar(45) DEFAULT NULL,
   `status` varchar(45) DEFAULT NULL,
   `formmodel` varchar(45) DEFAULT NULL,
   `markedForDeletion` varchar(45) DEFAULT NULL,
   `showDorClass` varchar(255) DEFAULT NULL,
   `sling:resourceType` varchar(1000) DEFAULT NULL,
   `attachmentList` longtext,
   `draftID` varchar(45) DEFAULT NULL,
   `submitID` varchar(45) DEFAULT NULL,
   `id` varchar(60) NOT NULL,
   `profile` varchar(255) DEFAULT NULL,
   `submitUrl` varchar(1000) DEFAULT NULL,
   `xdpRef` varchar(1000) DEFAULT NULL,
   `agreementId` varchar(255) DEFAULT NULL,
   `nextSigners` varchar(255) DEFAULT NULL,
   `eSignStatus` varchar(45) DEFAULT NULL,
   `pendingSignID` varchar(45) DEFAULT NULL,
   `agreementDataId` varchar(255) DEFAULT NULL,
   `enablePortalSubmit` varchar(45) DEFAULT NULL,
   `submitType` varchar(45) DEFAULT NULL,
   `dataType` varchar(45) DEFAULT NULL,
   `jcr:lastModified` varchar(45) DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `ID_UNIQUE` (`id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

   ```

   **SQL statement for additionalmetadatatable**

   ```sql
   CREATE TABLE `additionalmetadatatable` (
   `value` text,
   `key` varchar(255) NOT NULL,
   `id` varchar(60) NOT NULL,
   PRIMARY KEY (`id`,`key`),
   CONSTRAINT 'additionalmetadatatable_fk' FOREIGN KEY (`id`) REFERENCES `metadata` (`id`) ON DELETE CASCADE
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   ```

   **SQL statement for comment table**

   ```sql
   CREATE TABLE `commenttable` (
   `commentId` varchar(255) DEFAULT NULL,
   `comment` text DEFAULT NULL,
   `ID` varchar(255) DEFAULT NULL,
   `commentowner` varchar(255) DEFAULT NULL,
   `time` varchar(255) DEFAULT NULL);
   ```

1. If you already have the tables (data, metadata, and additionalmetadatatable) in the database schema, execute the following alter table queries:

   **SQL statement for altering the data table**

   ```sql
   ALTER TABLE `data` CHANGE `owner` `owner` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
   ```

   **SQL statement for altering the metadata table**

   ```sql
   ALTER TABLE metadata add markedForDeletion varchar(45) DEFAULT NULL
   ```

   >[!NOTE]
   >
   >The ALTER TABLE metadata add query fails if you have already run it and the markedforDeletion column is present in the table.

   ```sql
   ALTER TABLE metadata add agreementId varchar(255) DEFAULT NULL,
   add nextSigners varchar(255) DEFAULT NULL,
   add eSignStatus varchar(45) DEFAULT NULL,
   add pendingSignID varchar(45) DEFAULT NULL,
   add agreementDataId varchar(255) DEFAULT NULL,
   add enablePortalSubmit varchar(45) DEFAULT NULL,
   add submitType varchar(45) DEFAULT NULL,
   add dataType varchar(45) DEFAULT NULL;

   ```

   ```sql
   ALTER TABLE `metadata` CHANGE `formPath` `formPath` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `formType` `formType` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `description` `description` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `formName` `formName` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `owner` `owner` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `renderPath` `renderPath` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `showDorClass` `showDorClass` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `sling:resourceType` `sling:resourceType` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `profile` `profile` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `submitUrl` `submitUrl` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   CHANGE `xdpRef` `xdpRef` VARCHAR(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;
   ```

   **SQL statement for altering the additionalmetadatatable table**

   ```sql
   ALTER TABLE `additionalmetadatatable` CHANGE `value` `value` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, CHANGE `key` `key` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
   ```

The sample implementation is now configured, which you can use to list your drafts and submissions while storing all data and metadata in a database. Let's now see how data and metadata services are configured in the sample.

## Install mysql-connector-java-5.1.39-bin.jar file {#install-mysql-connector-java-bin-jar-file}

Perform the following steps,on all the author and publish instances, to install the mysql-connector-java-5.1.39-bin.jar file:

1. Navigate to `https://'[server]:[port]'/system/console/depfinder` and search for com.mysql.jdbc package.
1. In the Exported by column, check if the package is exported by any bundle.

   Proceed if the package is not exported by any bundle.

1. Navigate to `https://'[server]:[port]'/system/console/bundles` and click **[!UICONTROL Install/Update]**.
1. Click **[!UICONTROL Choose File]** and browse to select the mysql-connector-java-5.1.39-bin.jar file. Also, select **[!UICONTROL Start Bundle]** and **[!UICONTROL Refresh Packages]** checkboxes.
1. Click **[!UICONTROL Install or Update]**. Once complete, restart the server.
1. (*Windows only*) Turn off the system firewall for your operating system.

>[!NOTE]
>
> It is recommended to use the 'Ctrl + C' command to restart the SDK. Restarting the AEM SDK using alternative methods, for example, stopping Java processes, may lead to inconsistencies in the AEM development environment.

## Sample code for forms portal data and metadata service {#sample-code-for-forms-portal-data-and-metadata-service}

The following zip contains `FormsPortalSampleDataServiceImpl` and `FormsPortalSampleMetadataServiceImpl` (implementation classes) for data and metadata service interfaces. Additionally, it contains all the classes required for compilation of above mentioned implementation classes.

[Get File](assets/sample_package.zip)

## Verify length of the file name  {#verify-length-of-the-file-name}

Database implementation of Forms Portal uses additional metadata table. The table has a composite primary key based on Key and id columns of the table. MySQL allows primary keys up to the length of 255 characters. You can use the following client-side validation script to verify the length of filename attached to the file widget. The validation is run when a file is attached. The script provided in the following procedure displays a message, when the filename is larger than 150 (including extension). You can modify the script to check it for a different number of characters.

Perform the following steps to create [a client library](/help/sites-developing/clientlibs.md) and use the script:

1. Log in to CRXDE and navigate to /etc/clientlibs/
1. Create a node of type **cq:ClientLibraryFolder** and provide name of the node. For example, `validation`.

   Click **[!UICONTROL Save All]**.

1. Right-click the node, click **[!UICONTROL create new file]**, and create a file with extension .txt. For example, `js.txt`Add the following code to the newly created .txt file and click **[!UICONTROL Save All]**.

   ```javascript
   #base=util
    util.js
   ```

   In the above code, `util` is the name of the folder and `util.js` name of the file in the `util` folder. The `util` folder and `util.js` file are created in suceeeding steps.

1. Right-click the `cq:ClientLibraryFolder` node created in step 2, select Create > Create Folder. Create a folder named `util`. Click **[!UICONTROL Save All]**. Right-click the `util` folder, select Create > Create File. Create a file named `util.js`. Click **[!UICONTROL Save All]**.

1. Add the following code to util.js file and click **[!UICONTROL Save All]**. The code validate length of the file name.

   ```javascript
   /*
    * ADOBE CONFIDENTIAL
    * ___________________
    *
    * Copyright 2016 Adobe Systems Incorporated
    * All Rights Reserved.
    *
    * NOTICE:  All information contained herein is, and remains
    * the property of Adobe Systems Incorporated and its suppliers,
    * if any.  The intellectual and technical concepts contained
    * herein are proprietary to Adobe Systems Incorporated and its
    * suppliers and may be covered by U.S. and Foreign Patents,
    * patents in process, and are protected by trade secret or copyright law.
    * Dissemination of this information or reproduction of this material
    * is strictly forbidden unless prior written permission is obtained
    * from Adobe Systems Incorporated.
    *
    */
   (function () {
       var connectWithGuideBridge = function (gb) {
           gb.connect(function () {
               //For first time load
               window.guideBridge.on("elementValueChanged" , function(event, payload) {
           var component = payload.target; // Field whose value has changed
                   if(component.name == 'fileAttachment' && component.parent) {
                       var fileItems = $('#'+payload.target.parent.id).find(".guide-fu-fileItem");
                       for (i = 0;i<fileItems.length;i++) {
                           var filename = $(fileItems[i]).find(".guide-fu-fileName").text();
                           //check whether it is previously attached file or a newly  attached one
                           if(filename.length > 150 && filename.indexOf("fp.attach.jsp") < 0) {
                               window.alert("filename is larger than 150 : "+filename);
                                $(fileItems[i]).find(".guide-fu-fileClose.close").click();
                           }
                       }
                   }

      });
           });
       };

       if (window.guideBridge) {
           connectWithGuideBridge(window.guideBridge);
       } else {
           window.addEventListener("bridgeInitializeStart", function (event) {
               connectWithGuideBridge(event.detail.guideBridge);
           });
       }
   })();

   ```

   >[!NOTE]
   >
   >The script is for out-of-the-box attachment widget component. If you have customized the out-of-the-box attachment widget then change the above script to incorporate respective changes.

1. Add the following property to the folder created in step 2 and click **[!UICONTROL Save All]**.

    * **[!UICONTROL Name:]** categories

    * **[!UICONTROL Type:]** String

    * **[!UICONTROL Value:]** fp.validation

    * **[!UICONTROL multi option:]** Enabled

1. Navigate to `/libs/fd/af/runtime/clientlibs/guideRuntime`and append the `fp.validation` value to the embed property.

1. Navigate to /libs/fd/af/runtime/clientlibs/guideRuntimeWithXFA and append the `fp.validation` value to embed property.

   >[!NOTE]
   >
   >If you are using custom client libraries instead of of the guideRuntime and guideRuntimeWithXfa client libraries, use the category name to embed the client library created in this procedure to your custom libraries loaded at runtime.

1. Click **[!UICONTROL Save All.]** Now, when the filename is larger than 150 (including extension) characters a message is displayed.
