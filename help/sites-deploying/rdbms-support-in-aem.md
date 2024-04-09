---
title: RDBMS Support in AEM 6.4
description: Learn about the relational database persistence support in AEM 6.4 and the available configuration options.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: deploying
docset: aem65
feature: Administering
exl-id: 1e34c5ca-9e08-4b2a-901c-ab28aeb4a807
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# RDBMS Support in AEM 6.4{#rdbms-support-in-aem}

## Overview {#overview}

Support for relational database persistence in AEM is implemented using the Document Microkernel. The Document Microkernel is the basis that is also used for implementing MongoDB persistence.

It consists of a Java API that is based on the Mongo Java API. An implementation of a BlobStore API is also provided. By default, blobs are stored in the database.

For more information on the implementation details, see the [RDBDocumentStore](https://jackrabbit.apache.org/oak/docs/apidocs/org/apache/jackrabbit/oak/plugins/document/rdb/RDBDocumentStore.html) and [RDBBlobStore](https://jackrabbit.apache.org/oak/docs/apidocs/org/apache/jackrabbit/oak/plugins/document/rdb/RDBBlobStore.html) documentation.

>[!NOTE]
>
>Support for **PostgreSQL 9.4** is also provided, but only for demo purposes. It will not be available for production environments.

## Supported Databases {#supported-databases}

For more information on the level of Relational Database support in AEM, see the [Technical Requirements page](/help/sites-deploying/technical-requirements.md).

## Configuration Steps {#configuration-steps}

The repository is created by configuring the `DocumentNodeStoreService` OSGi service. It has been extended to support relational database persistence in addition to MongoDB.

In order for it to work, a data source needs to be configured with AEM. This is done via the `org.apache.sling.datasource.DataSourceFactory.config` file. The JDBC drivers for the respective database need to be provided separately as OSGi bundles inside the local configuration.

For steps on creating OSGi bundles for JDBC drivers, see this [documentation](https://sling.apache.org/documentation/bundles/datasource-providers.html#convert-driver-jars-to-bundle) on the Apache Sling website.

Once the bundles are in place, follow the below steps to configure AEM with RDB persistence:

1. Make sure the database daemon is started and that you have an active database for use with AEM.
1. Copy the AEM 6.3 jar into the installation directory.
1. Create a folder called `crx-quickstart\install` in the installation directory.
1. Configure the document node store by creating a configuration file with the following name in the `crx-quickstart\install` directory:

    * `org.apache.jackrabbit.oak.plugins.document.DocumentNodeStoreService.config`

1. Configure the data source and the JDBC parameters by creating another configuration file with the following name in the `crx-quickstart\install` folder:

    * `org.apache.sling.datasource.DataSourceFactory-oak.config`

   >[!NOTE]
   >
   >For detailed information on the data source configuration for each supported database, see [Data Source Configuration Options](/help/sites-deploying/rdbms-support-in-aem.md#data-source-configuration-options).

1. Next, prepare the JDBC OSGi bundles to be used with AEM:

    1. In the `crx-quickstart/install` folder, create a folder named `9`.

    1. Place the JDBC jar in the new folder.

1. Finally, start AEM with the `crx3` and `crx3rdb` runmodes:

   ```java
   java -jar quickstart.jar -r crx3,crx3rdb
   ```

## Data Source Configuration Options {#data-source-configuration-options}

The `org.apache.sling.datasource.DataSourceFactory-oak.config` OSGi configuration is used to configure the parameters needed for communication between AEM and the database persistence layer.

The following configuration options are available:

* `datasource.name:` The data source name. The default is `oak`.

* `url:` The URL string of the database that needs to be used with JDBC. Each database type has its own URL string format. For more info, see [URL String Formats](/help/sites-deploying/rdbms-support-in-aem.md#url-string-formats) below.

* `driverClassName:` The JDBC driver class name. This will differ depending on the database you want to use and subsequently, the driver that is needed to connect to it. Below are the class names for all the databases supported by AEM:

    * `org.postgresql.Driver` for PostgreSQL;
    * `com.ibm.db2.jcc.DB2Driver` for DB2;
    * `oracle.jdbc.OracleDriver` for Oracle;
    * `com.mysql.jdbc.Driver` for MySQL and MariaDB (experimental);
    * c `om.microsoft.sqlserver.jdbc.SQLServerDriver` for Microsoft SQL Server (experimental).

* `username:` The username the database runs under.

* `password:` The database password.

### URL String Formats {#url-string-formats}

A different URL string format is used in the data source configuration depending on the database type that needs to be used. Below is a list of formats for the databases that AEM currently supports:

* `jdbc:postgresql:databasename` for PostgreSQL;
* `jdbc:db2://localhost:port/databasename` for DB2;
* `jdbc:oracle:thin:localhost:port:SID` for Oracle;
* `jdbc:mysql://localhost:3306/databasename` for MySQL and MariaDB (experimental);
* `jdbc:sqlserver://localhost:1453;databaseName=name` for Microsoft SQL Server (experimental).

## Known Limitations {#known-limitations}

While concurrent use of multiple AEM instances with a single database is supported by RDBMS persistence, concurrent installations are not.

In order work around this, make sure you run the installation with a single member first, and add the other ones after the first has finished installing.
