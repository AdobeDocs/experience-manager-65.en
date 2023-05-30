---
title: Connecting to SQL Databases
seo-title: Connecting to SQL Databases
description: Access an external SQL database to so that your AEM applications can interact with the data
seo-description: Access an external SQL database to so that your AEM applications can interact with the data
uuid: 0af0ed08-9487-4c37-87ce-049c9b4c1ea2
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: 11a11803-bce4-4099-9b50-92327608f37b
exl-id: 1082b2d7-2d1b-4c8c-a31d-effa403b21b2
---
# Connecting to SQL Databases{#connecting-to-sql-databases}

Access an external SQL database to so that your CQ applications can interact with the data:

1. [Create or obtain an OSGi bundle that that exports the JDBC driver package](#bundling-the-jdbc-database-driver).
1. [Configure a JDBC data source pool provider](#configuring-the-jdbc-connection-pool-service).
1. [Obtain a data source object and create the connection in your code](#connecting-to-the-database).

## Bundling the JDBC Database Driver {#bundling-the-jdbc-database-driver}

Some database vendors provide JDBC drivers in an OSGi bundle, for example [MySQL](https://dev.mysql.com/downloads/connector/j/). If the JDBC driver for your database is not available as an OSGi bundle, obtain the driver JAR and wrap it in an OSGi bundle. The bundle must export the packages that are required for interacting with the database server. The bundle must also import the packages that it references.

The following example uses the [Bundle plug-in for Maven](https://felix.apache.org/documentation/subprojects/apache-felix-maven-bundle-plugin-bnd.html) to wrap the HSQLDB driver in an OSGi bundle. The POM instructs the plugin to embed the hsqldb.jar file that is identified as a dependency. All org.hsqldb packages are exported.

The plugin automatically determines which packages to import and lists them in the MANIFEST.MF file of the bundle. If any of the packages are not available on the CQ server, the bundle does not start on installation. Two possible solutions are as follows:

* Indicate in the POM that the packages are optional. Use this solution when the JDBC connection does not actually require the package members. Use the Import-Package element to indicate optional packages as in the following example:

  `<Import-Package>org.jboss.*;resolution:=optional,*</Import-Package>`
* Wrap the JAR files that contain the packages in an OSGi bundle that exports the packages, and deploy the bundle. Use this solution when the package members are required during code execution.

Knowledge of the source code enables you to decide which solution to use. You can also try either solution and perform testing to validate the solution.

### POM that bundles hsqldb.jar {#pom-that-bundles-hsqldb-jar}

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0"
  xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.adobe.example.myapp</groupId>
  <artifactId>hsqldb-jdbc-driver-bundle</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <name>wrapper-bundle-hsqldb-driver</name>
  <url>www.adobe.com</url>
  <description>Exports the HSQL JDBC driver</description>
  <packaging>bundle</packaging>
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.felix</groupId>
        <artifactId>maven-bundle-plugin</artifactId>
        <version>1.4.3</version>
        <extensions>true</extensions>
        <configuration>
         <instructions>
            <Embed-Dependency>*</Embed-Dependency>
            <_exportcontents>org.hsqldb.*</_exportcontents>
          </instructions>
        </configuration>
      </plugin>
    </plugins>
  </build>
  <dependencies>
    <dependency>
      <groupId>hsqldb</groupId>
      <artifactId>hsqldb</artifactId>
      <version>2.2.9</version>
    </dependency>
  </dependencies>
</project>
```

The following links open the download pages for some popular database products:

* [Microsoft&reg; SQL Server](https://www.microsoft.com/en-us/download/details.aspx?displaylang=en&id=11774)
* [Oracle](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)
* [IBM&reg; DB2&reg;](https://www.ibm.com/support/pages/download-db2-fix-packs-version-db2-linux-unix-and-windows)

### Configuring the JDBC Connection Pool Service {#configuring-the-jdbc-connection-pool-service}

Add a configuration for the JDBC Connections Pool service that uses the JDBC driver to create data source objects. Your application code uses this service to obtain the object and connect to the database.

JDBC Connections Pool ( `com.day.commons.datasource.jdbcpool.JdbcPoolService`) is a factory service. If you require connections that use different properties, for example read-only or read/write access, create multiple configurations.

When working with CQ, there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details.

The following properties are available to configure a pooled connection service. The property names are listed as they appear in the Web Console. The corresponding name for a `sling:OsgiConfig` node appears in parentheses. Example values are shown for an HSQLDB server and a database that has an alias of `mydb`:

* JDBC Driver Class ( `jdbc.driver.class`): The Java&trade; class to use that implements the java.sql.Driver interface, for example `org.hsqldb.jdbc.JDBCDriver`. The data type is `String`.

* JDBC Connection URI ( `jdbc.connection.uri`): The URL of the database to use to create the connection, for example `jdbc:hsqldb:hsql//10.36.79.223:9001/mydb`. The format of the URL must be valid for use with the getConnection method of the java.sql.DriverManager class. The data type is `String`.

* Username ( `jdbc.username`): The user name to use to authenticate with the database server. The data type is `String`.

* Password ( `jdbc.password`): The password to use for authentication of the user. The data type is `String`.

* Validation Query ( `jdbc.validation.query`): The SQL statement to use to verify that the connection is successful, for example `select 1 from INFORMATION_SCHEMA.SYSTEM_USERS`. The data type is `String`.

* Readonly By Default (default.readonly): Select this option when you want the connection to provide read-only access. The data type is `Boolean`.
* Autocommit By Default ( `default.autocommit`): Select this option to create separate transactions for each SQL command that is sent to the database, and each transaction is automatically committed. Do not select this option when you are committing transactions explicitly in your code. The data type is `Boolean`.

* Pool Size ( `pool.size`): The number of simultaneous connections to be made available to the database. The data type is `Long`.

* Pool wait ( `pool.max.wait.msec`): The amount of time before a connection request times out. The data type is `Long`.

* Datasource Name ( `datasource.name`): The name of this data source. The data type is `String`.

* Additional Service Properties ( `datasource.svc.properties`): A set of name/value pairs that you want to append to the connection URL. The data type is `String[]`.

The JDBC Connections Pool service is a factory. Therefore, if you use a `sling:OsgiConfig` node to configure the connection service, the name of the node must include the factory service PID followed by *`-alias`*. The alias that you use must be unique for all configuration nodes for that PID. An example node name is `com.day.commons.datasource.jdbcpool.JdbcPoolService-myhsqldbpool`.

![chlimage_1-7](assets/chlimage_1-7a.png)

### Connecting to the Database {#connecting-to-the-database}

In your Java&trade; code, use the DataSourcePool service to obtain a `javax.sql.DataSource` object for the configuration that you created. The DataSourcePool service provides the `getDataSource` method that returns a `DataSource` object for a given data source name. As the method argument, use the value of the Datasource Name (or `datasource.name`) property that you specified for the JDBC Connections Pool configuration.

The following example JSP code obtains an instance of the hsqldbds data source, executes a simple SQL query, and displays the number of results that are returned.

#### JSP that performs a database lookup {#jsp-that-performs-a-database-lookup}

```java
<%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false"%><%
%><%@ page import="com.day.commons.datasource.poolservice.DataSourcePool" %><%
%><%@ page import="javax.sql.DataSource" %><%
%><%@ page import="java.sql.Connection" %><%
%><%@ page import="java.sql.SQLException" %><%
%><%@ page import="java.sql.Statement" %><%
%><%@ page import="java.sql.ResultSet"%><%
%><html>
<cq:include script="head.jsp"/>
<body>
<%DataSourcePool dspService = sling.getService(DataSourcePool.class);
  try {
     DataSource ds = (DataSource) dspService.getDataSource("hsqldbds");
     if(ds != null) {
         %><p>Obtained the datasource!</p><%
         %><%final Connection connection = ds.getConnection();
          final Statement statement = connection.createStatement();
          final ResultSet resultSet = statement.executeQuery("SELECT * from INFORMATION_SCHEMA.SYSTEM_USERS");
          int r=0;
          while(resultSet.next()){
             r=r+1;
          }
          resultSet.close();
          %><p>Number of results: <%=r%></p><%
      }
   }catch (Exception e) {
        %><p>error! <%=e.getMessage()%></p><%
    }
%></body>
</html>
```

>[!NOTE]
>
>If the getDataSource method throws an exception because the datasource is not found, make sure that the Connections Pool service configuration is correct. Verify the property names, values, and data types.
>

<!-- Link below redirects to the "Get started with AEM Sites - WKND tutorial"
>[!NOTE]
>
>To learn how to inject a DataSourcePool into an OSGi bundle, see [Injecting a DataSourcePool Service into an Adobe Experience Manager OSGi bundle](https://helpx.adobe.com/experience-manager/using/datasourcepool.html). -->
