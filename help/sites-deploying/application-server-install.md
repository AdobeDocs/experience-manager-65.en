---
title: Application Server Install
description: Learn how to install Adobe Experience Manager with an application server.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: deploying
exl-id: 3a90f1d2-e53f-4cc4-8122-024ad6500de0
solution: Experience Manager, Experience Manager Sites
feature: Deploying
role: Admin
---
# Application Server Install{#application-server-install}

>[!NOTE]
>
>`JAR` and `WAR` are the file types Adobe Experience Manager (AEM) is released in. These formats are undergoing quality assurance to accommodate the support levels Adobe has committed to.
>

This section tells you how to install Adobe Experience Manager (AEM) with an application server. Consult the [Supported Platforms](/help/sites-deploying/technical-requirements.md#servlet-engines-application-servers) section to read about the specific support levels provided for the individual application servers.

The installation steps of the following Application Servers are described:

* [WebSphere&reg; 8.5](#websphere)
* [JBoss&reg; EAP 6.3.0/6.4.0](#jboss-eap)
* [Oracle WebLogic 12.1.3/12.2](#oracle-weblogic)
* [Tomcat 8/8.5](#tomcat)

Consult the appropriate application server documentation for more information on installing web applications, server configurations and how to start and stop the server.

>[!NOTE]
>
>If you are using Dynamic Media in a WAR deployment, see [Dynamic Media documentation](/help/assets/config-dynamic.md#enabling-dynamic-media).

## General Description {#general-description}

### Default behavior when installing AEM in an Application Server {#default-behaviour-when-installing-aem-in-an-application-server}

AEM comes as a single war file to deploy.

If deployed, the following happens by default:

* the run mode is `author`
* the instance (Repository, Felix OSGI environment, bundles, and so on) is installed in `${user.dir}/crx-quickstart`where `${user.dir}` is the current working directory, this path to crx-quickstart is called `sling.home`

* the context root is the war file name for example,  `aem-6`

#### Configuration {#configuration}

You can change the default behavior in the following way:

* run mode : configure the `sling.run.modes` parameter in the `WEB-INF/web.xml` file of the AEM war file before deployment

* sling.home: configure the `sling.home` parameter in the `WEB-INF/web.xml`file of the AEM war file before deployment

* context root: rename the AEM war file

#### Publish installation {#publish-installation}

To get a publish instance deployed, you need to set the run mode to publish:

* Unpack the WEB-INF/web.xml from the AEM war file
* Change sling.run.modes parameter to publish
* Repack web.xml file into AEM war file
* Deploy AEM war file

#### Installation check {#installation-check}

To check if all is installed, you can:

* tail the `error.log`file to see that all content is installed
* look in `/system/console` that all bundles are installed

#### Two Instances on the same Application Server {#two-instances-on-the-same-application-server}

For demonstration purposes, it can be appropriate to install author and publish instance in one application server. For that do the following:

1. Change sling.home variable and sling.run.modes variables of the publish instance.
1. Unpack WEB-INF/web.xml file from the AEM war file.
1. Change sling.home parameter to a different path (absolute and relative paths are possible).
1. Change sling.run.modes to publish for the publish instance.
1. Repack the web.xml file.
1. Rename the war files, so they have different names. For example, one rename to aemauthor.war and the other to aempublish.war.
1. Use higher memory settings. For example, default AEM instances use `-Xmx3072m`
1. Deploy the two web applications.
1. After Deployment stop the two web applications.
1. In both author and publish instances assure that in the sling.properties files the property felix.service.urlhandlers=false is set to false (default is that it is set to true).
1. Start the two web applications again.

## Application Servers Installation Procedures {#application-servers-installation-procedures}

### WebSphere&reg; 8.5 {#websphere}

Before a deployment read the [General Description](#general-description) above.

**Server Preparation**

* Let Basic Auth Headers pass through:

  * One way to let AEM to authenticate a user is to disable the global administrative security of the WebSphere&reg; server, to do so: go to Security > Global Security and uncheck the Enable administrative security checkbox, save, and restart the server.

* set `"JAVA_OPTS= -Xmx2048m"`
* If you want to install AEM using context root = /, change the context root of the existing Default web application.

**Deploy AEM web application**

* Download AEM war file
* Make your configurations In web.xml if needed (see above in the General Description)

  * Unpack WEB-INF/web.xml file
  * change sling.run.modes parameter to publish
  * uncomment sling.home initial parameter and set this path as you need
  * Repack web.xml file

* Deploy AEM war file

  * Choose a context root (if you want to set the sling run modes you need to select the detailed steps of the deploy wizard, then specify it in step 6 of the wizard)

* Start AEM web application

#### JBoss&reg; EAP 6.3.0/6.4.0 {#jboss-eap}

Before a deployment read the [General Description](#general-description) above.

**Prepare JBoss&reg; server**

Set Memory arguments in your conf file (for example, `standalone.conf`)

* JAVA_OPTS="-Xms64m -Xmx2048m"

If you use the deployment-scanner to install the AEM web application, it might be good to increase the `deployment-timeout,` for that set a `deployment-timeout` attribute in the xml file of your instance (for example, `configuration/standalone.xml)`:

```xml
<subsystem xmlns="urn:jboss:domain:deployment-scanner:1.1">
            <deployment-scanner path="deployments" relative-to="jboss.server.base.dir" scan-interval="5000" deployment-timeout="1000"/>
</subsystem>
```

**Deploy AEM web application**

* Upload the AEM web application in your JBoss&reg; Administration Console.

* Enable the AEM web application.

#### Oracle WebLogic 12.1.3/12.2 {#oracle-weblogic}

Before a deployment read the [General Description](#general-description) above.

This uses a simple Server Layout with only an Admin Server.

**WebLogic Server Preparation**

* In `${myDomain}/config/config.xml`add to the security-configuration section:

  * `<enforce-valid-basic-auth-credentials>false</enforce-valid-basic-auth-credentials>` see on [https://xmlns.oracle.com/weblogic/domain/1.0/domain.xsd](https://xmlns.oracle.com/weblogic/domain/1.0/domain.xsd) for the correct position (per default to position it at the end of the section is ok)

* Increase VM Memory settings:

  * open `${myDomain}/bin/setDomainEnv.cmd` (resp .sh) search for WLS_MEM_ARGS, set, for example, set `WLS_MEM_ARGS_64BIT=-Xms256m -Xmx2048m`
  * restart WebLogic Server

* Create in `${myDomain}` a packages folder and inside a cq folder and in it a Plan folder

**Deploy AEM web application**

* Download AEM war file
* Put the AEM war file into the ${myDomain}/packages/cq folder
* Make your configurations In `WEB-INF/web.xml` if needed (see above in the General Description)

  * Unpack `WEB-INF/web.xml`file
  * change sling.run.modes parameter to publish
  * uncomment sling.home initial parameter and set this path as you need (see General Description)
  * Repack web.xml file

* Deploy AEM war file as an Application (for the other settings, use the default settings)
* The installation can take time...
* Check that the installation has finished as mentioned above in the General Description (for example, tailing the error.log)
* You can change the context root in the Configuration tab of the web application in the WebLogic `/console`

#### Tomcat 8/8.5 {#tomcat}

Before a deployment read the [General Description](#general-description) above.

* **Prepare Tomcat Server**

  * Increase VM memory settings:

    * In `bin/catalina.bat` (resp `catalina.sh` on UNIX&reg;) add the following setting:
    * `set "JAVA_OPTS= -Xmx2048m`

  * Tomcat enables not admin or manager access at installation. Therefore, you have to manually edit `tomcat-users.xml` to allow access for these accounts:

    * Edit `tomcat-users.xml` to include access for admin and manager. The configuration should look similar to the following example:

      ```xml
      <?xml version='1.0' encoding='utf-8'?>
      <tomcat-users>
      role rolename="manager"/>
      role rolename="tomcat"/>
      <role rolename="admin"/>
      <role rolename="role1"/>
      <role rolename="manager-gui"/>
      <user username="both" password="tomcat" roles="tomcat,role1"/>
      <user username="tomcat" password="tomcat" roles="tomcat"/>
      <user username="admin" password="admin" roles="admin,manager-gui"/>
      <user username="role1" password="tomcat" roles="role1"/>
      </tomcat-users>
      ```

  * If you like to deploy AEM with context root "/", then you have to change context root of the existing ROOT webapp:

    * Stop and undeploy ROOT webapp
    * Rename ROOT.war folder in tomcat's webapps folder
    * Start webapp again

  * If you install the AEM web application using the manager-gui then you need to increase the maximal size of an uploaded file, as the default only allows 50MB upload size. For that open the web.xml of the manager web application,

      `webapps/manager/WEB-INF/web.xml`

      and increase the max-file-size and max-request-size to at least 500MB, see the following `multipart-config` example of such a `web.xml` file.

      ```xml
      <multipart-config>
      <!-- 500MB max -->
      <max-file-size>524288000</max-file-size>
      <max-request-size>524288000</max-request-size>
      <file-size-threshold>0</file-size-threshold>
      </multipart-config>
      ```

* **Deploy AEM web application**

  * Download AEM war file.
  * Make your configurations In web.xml if needed (see above in the General Description).

    * Unpack WEB-INF/web.xml file.
    * Change sling.run.modes parameter to publish.
    * Uncomment sling.home initial parameter and set this path as you need.
    * Repack web.xml file.

  * Rename AEM war file to ROOT.war if you want to deploy it as root webapp. Rename it to aemauthor.war if you want to have aemauthor as context root.
  * Copy it into tomcat's webapps folder.
  * Wait until AEM is installed.

## Troubleshooting {#troubleshooting}

For information on dealing with issues that may come up during installation, see:

* [Troubleshooting](/help/sites-deploying/troubleshooting.md)
