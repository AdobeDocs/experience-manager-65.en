---
title: Managing Packages Using Maven
seo-title: Managing Packages Using Maven
description: Use the Content Package Maven plugin to integrate package management tasks into your Maven projects
seo-description: Use the Content Package Maven plugin to integrate package management tasks into your Maven projects
uuid: fa73f0d6-8848-4911-9b96-311c875b45be
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: development-tools
content-type: reference
discoiquuid: 943de371-0149-4307-be3a-b11c590b3451
---

# Managing Packages Using Maven{#managing-packages-using-maven}

Use the Content Package Maven plugin to integrate package management tasks into your Maven projects. The plugin goals and parameters enable you to automate many of the tasks that you would normally perform using the Package Manager page or the FileVault command line:

* Create new packages from files in the file system.
* Install and uninstall packages on the CRX or CQ server.
* Build packages that are already defined on the server.
* Obtain a list of packages that are installed on the server.
* Remove a package from the server.

## Adding the Content Package Maven Plugin to the POM File {#adding-the-content-package-maven-plugin-to-the-pom-file}

To use the Content Package Maven Plugin, add the following plugin element inside the build element of your POM file:

```xml
<plugin>
 <groupId>com.day.jcr.vault</groupId>
 <artifactId>content-package-maven-plugin</artifactId>
 <version>0.0.24</version>
 <configuration>
       <!-- parameters and values common to all goals, as required --> 
 </configuration>
</plugin>
```

To enable Maven to download the plugin, use the profile provided in the [Obtaining the Content Package Maven Plugin](#obtaining-the-content-package-maven-plugin) section on this page.

## Goals of the Content Package Maven Plugin {#goals-of-the-content-package-maven-plugin}

The goals and goal parameters that the Content Package plugin provides are described in the sections that follow. Parameters that are described in the Common Parameters section can be used for most of the goals. Parameters that apply to one goal are described in the section for that goal.

**Plugin Prefix**

The plugin prefix is content-package. Use this prefix to execute a goal from the command line, as in the following example:

```shell
mvn content-package:build 
```

**Parameter Prefix**

Unless otherwise noted, the plugin goals and parameters use the vault prefix, as in the following example:

```shell
mvn content-package:install -Dvault.targetURL="https://192.168.1.100:4502/crx/packmgr/service.jsp"
```

**Proxies**

Goals that use proxies for the CRX or CQ server use the first valid proxy configuration found in the Maven settings. If no proxy configuration is found, no proxy is used. See the useProxy parameter in the Common Settings section.

### Common Parameters {#common-parameters}

The parameters in the following table are common to all goals except when noted in the Goals column.

<table> 
 <tbody> 
  <tr> 
   <th>Name</th> 
   <th>Type</th> 
   <th>Required</th> 
   <th>Default Value</th> 
   <th>Description</th> 
   <th>Goals</th> 
  </tr> 
  <tr> 
   <td>failOnError</td> 
   <td>boolean</td> 
   <td>No</td> 
   <td>false</td> 
   <td>A value of <code>true</code> causes the build to fail when an error occurs. A value of <code>false</code> causes the build to ignore the error.</td> 
   <td>All goals except package.</td> 
  </tr> 
  <tr> 
   <td>name</td> 
   <td>String</td> 
   <td>build: Yes<br /> install: No<br /> rm: Yes</td> 
   <td>Build: No default.<br /> install: The value of the artifactId property of the Maven project.</td> 
   <td>The name of the package to act on.</td> 
   <td>All goals except ls.</td> 
  </tr> 
  <tr> 
   <td>password</td> 
   <td>String</td> 
   <td>Yes</td> 
   <td>admin</td> 
   <td>The password used for authentication with the CRX server.</td> 
   <td>All goals except package.</td> 
  </tr> 
  <tr> 
   <td>serverId</td> 
   <td>String</td> 
   <td>No</td> 
   <td></td> 
   <td>The server ID from which to retrieve the user name and password for authentication.</td> 
   <td>All goals except package.</td> 
  </tr> 
  <tr> 
   <td>targetURL</td> 
   <td>String</td> 
   <td>Yes</td> 
   <td>http://localhost:4502/<br /> crx/packmgr/<br /> service.jsp</td> 
   <td>The URL of the HTTP service API of the CRX package manager.</td> 
   <td>All goals except package.</td> 
  </tr> 
  <tr> 
   <td>timeout</td> 
   <td>int</td> 
   <td>No</td> 
   <td>5</td> 
   <td>The connection timeout for communicating with the package manager service, in seconds.</td> 
   <td>All goals except package.</td> 
  </tr> 
  <tr> 
   <td>useProxy</td> 
   <td>boolean</td> 
   <td>No</td> 
   <td>true</td> 
   <td>Determines whether to use proxy configurations from the Maven settings file. A value of <code>true</code> causes the use of the first active proxy configuration found to proxy requests to the package manager. A value of false causes no proxy to be used.</td> 
   <td>All goals except package.</td> 
  </tr> 
  <tr> 
   <td>userId</td> 
   <td>String</td> 
   <td>Yes</td> 
   <td>admin</td> 
   <td>The user name to authenticate with the CRX server.</td> 
   <td>All goals except package.</td> 
  </tr> 
  <tr> 
   <td>verbose</td> 
   <td>boolean</td> 
   <td>No</td> 
   <td>false</td> 
   <td>Enables or disables verbose logging. A value of <code>true</code> enables verbose logging.</td> 
   <td>All goals except package.</td> 
  </tr> 
 </tbody> 
</table>

### build {#build}

Builds a content package that is already defined on an AEM instance.

>[!NOTE]
>
>This goal does not need to be executed within a Maven project.

#### Parameters {#parameters}

All paramaters for the build goal are described in the [Common Parameters](#common-parameters) section.

#### Example {#example}

The following example builds the workflow-mbean package that is installed on the AEM instance with the IP address 10.36.79.223. The goal is executed using the followng command:

```shell
mvn content-package:build
```

The following POM file is located in the current directory of the command line tool. The POM specifies the package name and the URL of the package service.

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0" 
  xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" 
  xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.adobe.example</groupId>
  <artifactId>example-package</artifactId>
  <version>0.0.1-SNAPSHOT</version>
    <build>
        <plugins>
     <plugin>
  <groupId>com.day.jcr.vault</groupId>
  <artifactId>content-package-maven-plugin</artifactId>
  <version>0.0.24</version>
  <configuration>
   <name>workflow-mbean</name>
   <failOnError>true</failOnError>
   <targetURL>https://10.36.79.223:4502/crx/packmgr/service.jsp</targetURL>
  </configuration>
     </plugin>
 </plugins>
    </build>
</project>
```

### install {#install}

Installs a package in the respository. Execution of this goal does not require a Maven project. The goal is bound to the Install phase of the Maven build lifecycle.

#### Parameters {#parameters-1}

In addition to the following parameters, see the descriptions in the [Common Parameters](#common-parameters) section.

<table> 
 <tbody> 
  <tr> 
   <th>Name</th> 
   <th>Type</th> 
   <th>Required</th> 
   <th>Default Value</th> 
   <th>Description</th> 
  </tr> 
  <tr> 
   <td>artifact</td> 
   <td>String</td> 
   <td>No</td> 
   <td>The value of the artifactId property of the Maven project.</td> 
   <td>A string of the form groupId:artifactId:version[:packaging].</td> 
  </tr> 
  <tr> 
   <td>artifactId</td> 
   <td>String</td> 
   <td>No</td> 
   <td></td> 
   <td>The ID of the artifact to install</td> 
  </tr> 
  <tr> 
   <td>groupId</td> 
   <td>String</td> 
   <td>No</td> 
   <td></td> 
   <td>The groupId of the artifact to install</td> 
  </tr> 
  <tr> 
   <td>install</td> 
   <td>boolean</td> 
   <td>No</td> 
   <td>true</td> 
   <td>Determines whether to unpack the package automatically when it is uploaded. A value of true unpacks the package, and false does not unpack the package.</td> 
  </tr> 
  <tr> 
   <td>localRepository</td> 
   <td>org.apache.maven.<br /> artifact. repository.<br /> ArtifactRepository</td> 
   <td>No</td> 
   <td>The value of the localRepository system variable.</td> 
   <td>The local Maven repository. You cannot configure this paramter using the plugin configuration. The system property is always used.</td> 
  </tr> 
  <tr> 
   <td>packageFile</td> 
   <td>java.io.File</td> 
   <td>No</td> 
   <td>The primary artifact that is defined for the Maven project.</td> 
   <td>The name of the package file to install.</td> 
  </tr> 
  <tr> 
   <td>packaging</td> 
   <td>String</td> 
   <td>No</td> 
   <td>zip</td> 
   <td>The type of packaging of the artifact to install</td> 
  </tr> 
  <tr> 
   <td>pomRemoteRepositories</td> 
   <td>java.util.List</td> 
   <td>Yes</td> 
   <td>The value of the remoteAtifactRepositories property that is defined for the Maven project.</td> 
   <td>This value cannot be configured using the plugin configuration. The value must be specified in the project. </td> 
  </tr> 
  <tr> 
   <td>project</td> 
   <td>org.apache.maven.<br /> project.MavenProject</td> 
   <td>Yes</td> 
   <td>The project for which the plugin is configured.</td> 
   <td>The Maven project. The project is implicit because the project contains the plugin configuration.</td> 
  </tr> 
  <tr> 
   <td>repositoryId <i>(POM)</i><br /> repoID <i>(command line)</i></td> 
   <td>String</td> 
   <td>No</td> 
   <td>temp</td> 
   <td>The ID of the repository from which the artifact is retrieved. In a POM, use repositoryID. In a command line, use repoID.</td> 
  </tr> 
  <tr> 
   <td>repositoryUrl <i>(POM)</i><br /> repoURL <i>(command line)</i></td> 
   <td>String</td> 
   <td>No</td> 
   <td></td> 
   <td>The URL of the repository from which the artifact is retrieved. In a POM, use repositoryURL. In a command line, use repoURL.</td> 
  </tr> 
  <tr> 
   <td>version</td> 
   <td>String</td> 
   <td>No</td> 
   <td></td> 
   <td>The version of the artifact to install.</td> 
  </tr> 
 </tbody> 
</table>

#### Example {#example-1}

The following example creates a package that contains the workflow-mbean OSGi bundle (see the example for the [build](#build) goal) and then installs the package. Because the install goal is bound to the package install phase, the following command executes the install goal:

```shell
mvn install
```

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0" 
    xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 
    https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.adobe.example.myapp</groupId>
  <artifactId>workflow-mbean</artifactId>
  <version>0.0.3-SNAPSHOT</version>

  <build>
    <plugins>
      <plugin>
        <groupId>com.day.jcr.vault</groupId>
        <artifactId>content-package-maven-plugin</artifactId>
        <version>0.0.24</version>
        <configuration>
          <builtContentDirectory>jcr_root</builtContentDirectory>
          <targetURL>https://10.36.79.223:4502/crx/packmgr/service.jsp</targetURL>
        </configuration>
        <executions>
          <execution>
            <goals>
              <goal>package</goal>
            </goals>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
</project>
```

### ls {#ls}

Lists the packages that are deployed to Package Manager.

#### Parameters {#parameters-2}

All parameters of the ls goal are described in the [Common Parameters](#common-parameters) section.

#### Example {#example-2}

The following example lists the packages that are installed on the AEM instance with the IP address 10.36.79.223. The goal is executed using the followng command:

```shell
mvn content-package:ls
```

The following POM file is located in the current directory of the command line tool. The POM specifies the URL of the package service.

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0" 
  xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" 
  xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.adobe.example</groupId>
  <artifactId>example-package</artifactId>
  <version>0.0.1-SNAPSHOT</version>
    <build>
        <plugins>
     <plugin>
  <groupId>com.day.jcr.vault</groupId>
  <artifactId>content-package-maven-plugin</artifactId>
  <version>0.0.24</version>
  <configuration>
      <targetURL>https://10.36.79.223:4502/crx/packmgr/service.jsp</targetURL>
  </configuration>
      </plugin>
   </plugins>
     </build>
</project>
```

### rm {#rm}

Removes a package from Package Manager.

#### Parameters {#parameters-3}

All parameters of the rm goal are described in the [Common Parameters](#common-parameters) section.

#### Example {#example-3}

The following example removes the workfow-mbean package that is installed on the AEM instance with the IP address 10.36.79.223. The goal is executed using the followng command:

```shell
mvn content-package:rm
```

The following POM file is located in the current directory of the command line tool. The POM specifies the URL of the package service and the name of the package.

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0" 
  xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" 
  xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.adobe.example</groupId>
  <artifactId>example-package</artifactId>
  <version>0.0.1-SNAPSHOT</version>
    <build>
        <plugins>
     <plugin>
  <groupId>com.day.jcr.vault</groupId>
  <artifactId>content-package-maven-plugin</artifactId>
  <version>0.0.24</version>
  <configuration>
                    <name>workflow-mbean</name>
      <targetURL>https://10.36.79.223:4502/crx/packmgr/service.jsp</targetURL>
  </configuration>
      </plugin>
   </plugins>
     </build>
</project>
```

### uninstall {#uninstall}

Uninstalls a package. The package remains on the server in the uninstalled state.

#### Parameters {#parameters-4}

All parameters of the uninstall goal are described in the [Common Parameters](#common-parameters) section.

#### Example {#example-4}

The following example uninstalls the workflow-mbean package that is installed on the AEM instance with the IP address 10.36.79.223. The goal is executed using the followng command:

```shell
mvn content-package:uninstall
```

The following POM file is located in the current directory of the command line tool. The POM specifies the package name and the URL of the package service.

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0" 
  xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" 
  xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.adobe.example</groupId>
  <artifactId>workflow-mbean</artifactId>
  <version>0.0.3-SNAPSHOT</version>
    <build>
        <plugins>
     <plugin>
  <groupId>com.day.jcr.vault</groupId>
  <artifactId>content-package-maven-plugin</artifactId>
  <version>0.0.24</version>
  <configuration>
   <name>workflow-mbean</name>
   <failOnError>true</failOnError>
   <targetURL>https://10.36.79.223:4502/crx/packmgr/service.jsp</targetURL>
  </configuration>
     </plugin>
 </plugins>
    </build>
</project>
```

### package {#package}

Creates a content package. The default configuration of the package goal includes the contents of the directory where compiled files are saved. The execution of the package goal requires that the compile build phase has completed. The package goal is bound to the package phase of the Maven build lifecycle.

#### Parameters {#parameters-5}

In addition to the following parameters, see the description of the `name` parameter in the [Common Parameters](#common-parameters) section.

<table> 
 <tbody> 
  <tr> 
   <th>Name</th> 
   <th>Type</th> 
   <th>Required</th> 
   <th>Default Value</th> 
   <th>Description</th> 
  </tr> 
  <tr> 
   <td>archive</td> 
   <td>org.apache.maven.<br /> archiver.<br /> MavenArchiveConfiguration</td> 
   <td>No</td> 
   <td></td> 
   <td>The archive configuration to use. See <a href="https://maven.apache.org/shared/maven-archiver/index.html">the documentation for Maven Archiver</a>.</td> 
  </tr> 
  <tr> 
   <td>builtContentDirectory</td> 
   <td>java.io.File</td> 
   <td>Yes</td> 
   <td>The value of the output directory of the Maven build.</td> 
   <td>The directory that contains the content to include in package.</td> 
  </tr> 
  <tr> 
   <td>dependencies</td> 
   <td>java.util.List</td> 
   <td>No</td> 
   <td></td> 
   <td></td> 
  </tr> 
  <tr> 
   <td>embeddedTarget</td> 
   <td>java.lang.String</td> 
   <td>No</td> 
   <td></td> 
   <td></td> 
  </tr> 
  <tr> 
   <td>embeddeds</td> 
   <td>java.util.List</td> 
   <td>No</td> 
   <td></td> 
   <td></td> 
  </tr> 
  <tr> 
   <td>failOnMissingEmbed</td> 
   <td>boolean</td> 
   <td>Yes</td> 
   <td>false</td> 
   <td>A value of true causes the build to fail when an embedded artifact is not found in the project dependencies. A value offalse causes the build to ignore the error.</td> 
  </tr> 
  <tr> 
   <td>filterSource</td> 
   <td>java.io.File</td> 
   <td>No</td> 
   <td></td> 
   <td>A file that specifies the source of the workspace filter. The filters specified in the configuration and injected via emebeds or subpackages are merged with the file content.</td> 
  </tr> 
  <tr> 
   <td>filters</td> 
   <td>com.day.jcr.<br /> vault.maven.pack.impl.<br /> DefaultWorkspaceFilter</td> 
   <td>No</td> 
   <td></td> 
   <td>Contains filter elements that define the package content. When executed, the filters are included in the filter.xml file. See the Using Filters section below.</td> 
  </tr> 
  <tr> 
   <td>finalName</td> 
   <td>java.lang.String</td> 
   <td>Yes</td> 
   <td>The finalName defined in the Maven project (build phase).</td> 
   <td>The name of the generated package ZIP file, without the .zip file extension.</td> 
  </tr> 
  <tr> 
   <td>group</td> 
   <td>java.lang.String</td> 
   <td>Yes</td> 
   <td>The groupID defined in the Maven project.</td> 
   <td>The groupId of the generated content package. This value is part of the target installation path for the content package.</td> 
  </tr> 
  <tr> 
   <td>outputDirectory</td> 
   <td>java.io.File</td> 
   <td>Yes</td> 
   <td>The build directory defined in the Maven project.</td> 
   <td>The local directory where the content package is saved.</td> 
  </tr> 
  <tr> 
   <td>prefix</td> 
   <td>java.lang.String</td> 
   <td>No</td> 
   <td></td> 
   <td></td> 
  </tr> 
  <tr> 
   <td>project</td> 
   <td>org.apache.maven.<br /> project.MavenProject</td> 
   <td>Yes</td> 
   <td></td> 
   <td>The Maven project.</td> 
  </tr> 
  <tr> 
   <td>properties</td> 
   <td>java.util.Map</td> 
   <td>No</td> 
   <td></td> 
   <td>Additional properties that you can set in the properties.xml file. These properties cannot overwrite the following predefined properties: 
    <ul> 
     <li>group: Use group parameter to set</li> 
     <li>name: Use name parameter to set</li> 
     <li>version: Use version parameter to set</li> 
     <li>description: Set from the project description</li> 
     <li>groupId: groupId of the Maven project descriptor</li> 
     <li>artifactId: artifactId of the Maven project descriptor</li> 
     <li>dependencies: Use dependencies parameter to set</li> 
     <li>createdBy: The value of the user.name system property</li> 
     <li>created: The current system time</li> 
     <li>requiresRoot: Use requiresRoot parameter to set</li> 
     <li>packagePath: Automatically generated from the group and package name</li> 
    </ul> </td> 
  </tr> 
  <tr> 
   <td>requiresRoot</td> 
   <td>boolean</td> 
   <td>Yes</td> 
   <td>false</td> 
   <td>Defines whether the package requires root. This will become the &lt;code&gt;requiresRoot&lt;/code&gt; property of the properties.xml file.</td> 
  </tr> 
  <tr> 
   <td>subPackages</td> 
   <td>java.util.List</td> 
   <td>No</td> 
   <td></td> 
   <td></td> 
  </tr> 
  <tr> 
   <td>version</td> 
   <td>java.lang.String</td> 
   <td>Yes</td> 
   <td>The version defined in the Maven project</td> 
   <td>The version of the content package.</td> 
  </tr> 
  <tr> 
   <td>workDirectory</td> 
   <td>java.io.File</td> 
   <td>Yes</td> 
   <td>The directory defined in the Maven project (build phase).</td> 
   <td>The directory that contains the content to include in the package.</td> 
  </tr> 
 </tbody> 
</table>

#### Using filters {#using-filters}

Use the filters element to define the package content. The filters are added to the workspaceFilter element in the `META-INF/vault/filter.xml` file of the package.

The following filter example shows the XML structure to use:

```xml
<filter>
   <root>/apps/myapp</root>
   <mode>merge</mode> 
       <includes>
              <include>/apps/myapp/install/</include>
              <include>/apps/myapp/components</include>
       </includes>
       <excludes>
              <exclude>/apps/myapp/config/*</exclude>
       </excludes>
</filter>
```

**Import mode**

The `mode` element defines how content is the repository is affected when the package is imported. The following values can be used:

* **Merge:** Content in the package that is not already in the repository is added. Content that is in both the package and the repository is unchanged. No content is removed from the repository. 
* **Replace:** Content in the package that is not in the repository is added to the repository. Content in the repository is replaced with matching content in the package. Content is removed from the repository when it does not exist in the package.
* **Update:** Content in the package that is not in the repository is added to the repository. Content in the repository is replaced with matching content in the package. Existing content gets removed from the repository.

When the filter contains no `mode` element, the default value of `replace` is used.

#### Example {#example-5}

The following example creates a package that contains the workflow-mbean OSGi bundle. The POM file identifies the jcr_root directory as the value of the builtContentDirectory property. The jcr_root directory contains the bundle JAR file in the directory structure that mirrors the repository:

`jcr_root/apps/myapp/install/workflow-mbean-0.03-SNAPSHOT.jar`

Because the goal is bound to the package build phase, the following command executes the package goal:

`mvn package`

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0" 
    xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 
    https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.adobe.example.myapp</groupId>
  <artifactId>workflow-mbean</artifactId>
  <version>0.0.3-SNAPSHOT</version>

  <build>
    <plugins>
      <plugin>
        <groupId>com.day.jcr.vault</groupId>
        <artifactId>content-package-maven-plugin</artifactId>
        <version>0.0.24</version>
        <configuration>
          <builtContentDirectory>jcr_root</builtContentDirectory>
          <targetURL>https://10.36.79.223:4502/crx/packmgr/service.jsp</targetURL>
        </configuration>
        <executions>
          <execution>
            <goals>
              <goal>package</goal>
            </goals>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
</project>
```

Instead of expressing the `package` goal in the plugin `executions` section, you can use `content-package` as the value of the project `packaging` element:

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0" 
    xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 
    https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.adobe.example.myapp</groupId>
  <artifactId>workflow-mbean</artifactId>
  <version>0.0.3-SNAPSHOT</version>
  <packaging>content-package</packaging>
  <build>
    <plugins>
      <plugin>
        <groupId>com.day.jcr.vault</groupId>
        <artifactId>content-package-maven-plugin</artifactId>
        <version>0.0.24</version>
        <configuration>
          <builtContentDirectory>jcr_root</builtContentDirectory>
          <targetURL>https://10.36.79.223:4502/crx/packmgr/service.jsp</targetURL>
        </configuration>
      </plugin>
    </plugins>
  </build>
</project>
```

### help {#help}

#### Parameters {#parameters-6}

| Name |Type |Required |Default Value |Description |
|---|---|---|---|---|
| detail |boolean |No |false |Determines whether to display all settable properties for each goal. A value of true displays all settable properties. |
| goal |String |No | |The name of the goal for which to show help. If no value is specified, help for all goals is displayed. |
| indentSize |int |No |2 |The number of spaces to use for the indentation of each level. If you specify a value, the value should be positive. |
| lineLength |int |No |80 |The maximum length of a display line. If you specify a value, the value should be positive. |

## Obtaining the Content Package Maven Plugin {#obtaining-the-content-package-maven-plugin}

The plugin is available from the public Adobe repository. To download the plugin, add the following Maven profile to your Maven settings file and activate it. When you use a Maven command, the plugin is downloaded to your local repository if needed.

>[!NOTE]
>
>The Adobe Public Releases repository is not browsable, so that navigating to the repository URL using your web browser results in a Not Found error. However, Maven is able to access the repository directories.

```xml
<profile>
    <id>adobe-public</id>
    <activation>
         <activeByDefault>false</activeByDefault>
    </activation>
    <properties>
         <releaseRepository-Id>adobe-public-releases</releaseRepository-Id>
         <releaseRepository-Name>Adobe Public Releases</releaseRepository-Name>
         <releaseRepository-URL>https://repo.adobe.com/nexus/content/groups/public</releaseRepository-URL>
    </properties>
    <repositories>
         <repository>
             <id>adobe-public-releases</id>
             <name>Adobe Basel Public Repository</name>
             <url>https://repo.adobe.com/nexus/content/groups/public</url>
             <releases>
                 <enabled>true</enabled>
                 <updatePolicy>never</updatePolicy>
             </releases>
             <snapshots>
                 <enabled>false</enabled>
             </snapshots>
         </repository>
     </repositories>
     <pluginRepositories>
         <pluginRepository>
             <id>adobe-public-releases</id>
             <name>Adobe Basel Public Repository</name>
             <url>https://repo.adobe.com/nexus/content/groups/public</url>
             <releases>
                 <enabled>true</enabled>
                 <updatePolicy>never</updatePolicy>
             </releases>
             <snapshots>
                 <enabled>false</enabled>
             </snapshots>
         </pluginRepository>
     </pluginRepositories>
</profile>
```

## Embedding OSGi Bundles in a Content Package {#embedding-osgi-bundles-in-a-content-package}

Use the Content Package Maven Plugin to embed OSGi bundles into the content package. To embed the bundle, implement the following configurations:

* The bundle must be declared as a dependency of the Maven project.
* The plugin configuration references the bundle using the desired path of the bundle in the package.

The following example POM creates a package that contains the Apache Sling JCR UserManager bundle. In the package, the bundle JAR is located in the `jcr_root/apps/myapp/install` folder:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" 
             xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="https://maven.apache.org/POM/4.0.0
             https://maven.apache.org/maven-v4_0_0.xsd">
 <modelVersion>4.0.0</modelVersion>
   <groupId>com.adobe.example.myapp</groupId>
 <artifactId>embedded-example</artifactId>
 <packaging>content-package</packaging>
 <version>1.0.0-SNAPSHOT</version>

   <build>
 <plugins>
     <plugin>
        <groupId>com.day.jcr.vault</groupId>
      <artifactId>content-package-maven-plugin</artifactId>
      <version>0.0.24</version>
      <extensions>true</extensions>
      <configuration>
   <filters>
       <filter>
    <root>/apps/myapp</root>
       </filter>
    </filters>
    <embeddeds>
       <embedded>
    <groupId>org.apache.sling</groupId>
    <artifactId>org.apache.sling.jcr.jackrabbit.usermanager</artifactId>
    <target>/apps/myproject/install</target>
        </embedded>
    </embeddeds>
       </configuration>
  </plugin> 
    </plugins>
    </build>
    <dependencies>
 <dependency>
      <groupId>org.apache.sling</groupId>
      <artifactId>org.apache.sling.jcr.jackrabbit.usermanager</artifactId>
      <version>2.2.0</version>
 </dependency>
    </dependencies> 
</project>

```

## Including a Thumbnail Image or Properties File in the Package {#including-a-thumbnail-image-or-properties-file-in-the-package}

Replace the default package configuration files to customize the package properties. For example, include a thumbnail image to distinguish the package in Package Manager and Package Share.

In the package, FileVault-specific files are located in the /META-INF/vault folder. The source files can be located anywhere in your file system. In the POM file, define build resources to copy the source files to the target/vault-work/META-INF for inclusion in the package.

The following POM code adds the files in the META-INF folder of the project source to the package:

```xml
<build>
    <resources>
        <!-- vault META-INF resources (thumbnail etc.) -->
        <resource>
            <directory>${basedir}/src/main/content/META-INF</directory>
            <targetPath>../vault-work/META-INF</targetPath>
        </resource>
    </resources>
</build>
```

The following POM code adds only a thumbnail image to the package. The thumbnail image must be named thumbnail.png, and must be located in the META-INF/vault/definition folder of the package. In this example, the source file is located in the /src/main/content/META-INF/vault/definition folder of the project:

```xml
<build>
    <resources>
        <!-- thumbnail only -->
        <resource>
            <directory>${basedir}/src/main/content/META-INF/vault/definition</directory>
            <targetPath>../vault-work/META-INF/vault/definition</targetPath>
        </resource>
    </resources>
</build>
```

## Using Archetypes To Generate AEM Projects {#using-archetypes-to-generate-aem-projects}

Several Maven archetypes are available for generating AEM projects. Use the archetype that corresponds with your development goals:

* A content package that installs resources for a AEM application: [simple-content-package-archetype](#simple-content-package-archetype)
* A content package that includes third-party artifacts: [simple-content-package-with-embedded-archetype](#simple-content-package-with-embedded-archetype).
* A multi-module application that accomodates the development of Java classes and unit tests: [multimodule-content-package-archetype](#multimodule-content-package-archetype).

>[!NOTE]
>
>The Apache Sling project also offers archetypes useful in AEM development. These are documented at [https://sling.apache.org/site/maven-archetypes.html](https://sling.apache.org/documentation/development/maven-archetypes.html).

Each archetype generates the following items:

* The project folder structure.
* POM files.
* FileVault configuration files.

Archetype artifacts are available from the Adobe public Maven repository. To download and execute an archetype, identify the archetype and the Adobe repository using the parameters of the Maven archetype:generate command:

```shell
mvn archetype:generate -DarchetypeGroupId=com.day.jcr.vault \
-DarchetypeArtifactId={id_of_archetype} -DarchetypeVersion=1.0.2 \
-DarchetypeRepository=adobe-public-releases
```

The Maven archetype plugin uses interactive mode in the shell or command prompt to collect information about your project. The information that you provide is used to configure various project properties, such as folder names and artifact ID's.

**POM files**

The generated POM files include commands for compiling code, creating bundles, and deploying them to AEM in packages. The `groupID`, `artifactId`, `version`, and `name` properties of the Maven project are automatically populated using the values that you provide to the Maven `archetype:generate` interactive prompt.

You may want to change the the following default values in the generated pom.xml file:

* The CQ server name or IP address: The default value is `localhost`. The `crx.host` element below `project/properties` contains this value.

* The port number for the CQ server: The default value is `4502`. The `crx.port` element below `project/properties` contains this value.

* The version of Content Package Maven Plugin: Use the latest version as the content of the `version` element for the plugin with `artifactId` of `content-package-maven-plugin`. The default value is `0.0.24`.

**Using the archetypes**

1. In a shell window or command prompt, enter the Maven `archetype:generate` command. When prompted, provide values for the remaining parameters.

   For information about each parameter, refer to the section for the archetype that you are using.

1. Use a text editor to open the pom.xml file and edit default values according to your requriements.
1. Populate the generated folders with resources.
1. Enter the `mvn clean install` command.

### simple-content-package-archetype {#simple-content-package-archetype}

Creates a maven project that is suitable for installing resources for a simple AEM application. The folder structure is that used below the `/apps` folder of the AEM repository. The POM defines commands for packaging the resources that you place in the folders and installing the packages on the AEM instance.

**Archetype artifact properties:**

* Group ID: `com.day.jcr.vault`
* Artifact ID: `simple-content-package-archetype`
* Version: `1.0.2`
* Repository: `adobe-public-releases`

**Maven command:**

```shell
mvn archetype:generate -DarchetypeGroupId=com.day.jcr.vault \
-DarchetypeArtifactId=simple-content-package-archetype \
-DarchetypeVersion=1.0.2 \
-DarchetypeRepository=adobe-public-releases
```

**Archetype parameters:**

* groupId: The groupId of the content package that Maven generates. The value is autoatically used in the POM file. 
* artifactId: The name of the content package. The value is also used as the name of the project folder.
* version: The version of the content package.
* package: This value is not used for simple-content-package-archetype.
* appsFolderName: The name of the folder below /apps. 
* artifactName: The description of the content package. 
* packageGroup: The name of the content package group. This value configures the group parameter for the Package goal of the Content Package Maven Plugin.

**Folder structure:**

```xml
${artifactId}
   |- pom.xml
   |- README.txt
   |- src
      |- main
         |- content
             |- jcr_root
                 |- apps
                     |- ${appsFolderName}
                            |- components 
                               |- .content.xml
                            |- config
                            |- install
             |- META-INF
                 |- vault
                     |- config.xml
                     |- filter.xml
                     |- nodetypes.cnd
                     |- properties.xml
                     |- definition
                        |- .content.xml
```

### simple-content-package-with-embedded-archetype {#simple-content-package-with-embedded-archetype}

Performs the same tasks as the simple-content-package-archetype, and also downloads and includes an artifact from a public Maven repository.

**Archetype bundle properties:**

* Group ID: `com.day.jcr.vault`
* Artifact ID: `simple-content-package-with-embedded-archetype`
* Version: `1.0.2`
* Repository: `adobe-public-releases`

**Maven command:**

```shell
mvn archetype:generate -DarchetypeGroupId=com.day.jcr.vault \
-DarchetypeArtifactId=simple-content-package-with-embedded-archetype \
-DarchetypeVersion=1.0.2 \
-DarchetypeRepository=adobe-public-releases
```

**Archetype parameters:**

* groupId: The groupId of the content package that Maven generates. The value is autoatically used in the POM file. 
* artifactId: The name of the content package. The value is also used as the name of the project folder.
* version: The version of the content package.
* package: This parameter is not used.
* appsFolderName: The name of the folder below /apps. 
* artifactName: The description of the content package. 
* embeddedArtifactId: The ID of the artifact to embed in the content package.
* embeddedGroupId: The group ID of the artifact to embed.
* embeddedVersion: The version of the artifact to embed.
* packageGroup: The name of the content package group. This value configures the group parameter for the Package goal of the Content Package Maven Plugin.

**Folder structure:**

```xml
${artifactId}
   |- pom.xml
   |- README.txt
   |- src
      |- main
         |- content
             |- jcr_root
                 |- apps
                     |- ${appsFolderName}
                            |- components 
                            |- config
                            |- install
             |- META-INF
                 |- vault
                     |- config.xml
                     |- filter.xml
                     |- nodetypes.cnd
                     |- properties.xml
                     |- definition
```

### multimodule-content-package-archetype {#multimodule-content-package-archetype}

Creates a maven project that includes the folder structure for developing an AEM application and installing resources to the server.

The `bundle` folder contains the folder structure that stores the Java and JUnit source files that you develop. The pom.xml file in this folder creates the OSGi bundle. The following values in the POM identify the artifact and the bundle:

* artifactID: `${artifactID}-bundle`. 
* Bundle-SymbolicName: `${groupId}.${artifactId}-bundle`.

`${artifactID}` and `${groupId}` are the values that you provide for these parameters when executing the archetypes.

The `content` folder contains the resources that are installed to the AEM instance. The value of artifactID is `${artifactID}multimodule-bundle`.

The parent folder contains the parent POM that manages Maven plugins and dependencies.

**Archetype bundle properties:**

* Group ID: `com.day.jcr.vault`
* Artifact ID: `multimodule-content-package-archetype`
* Version: `1.0.2`
* Repository: `adobe-public-releases`

**Maven command:**

```shell
mvn archetype:generate -DarchetypeGroupId=com.day.jcr.vault \
-DarchetypeArtifactId=multimodule-content-package-archetype \
-DarchetypeVersion=1.0.2 \
-DarchetypeRepository=adobe-public-releases
```

**Archetype parameters:**

* groupId: The groupId of the content package that Maven generates. The value is autoatically used in the POM file. 
* artifactId: The name of the content package. The value is also used as the name of the project folder.
* version: The version of the content package.
* package: This value is not used for multimodule-content-package-archetype.
* appsFolderName: The name of the folder below /apps. 
* artifactName: The description of the content package. 
* packageGroup: The name of the content package group. This value configures the group parameter for the Package goal of the Content Package Maven Plugin.

**Folder structure:**

```xml
${artifactId}
   |- pom.xml
   |- bundle
      |- pom.xml
      |- src
         |- main
            |- java
               |- ${groupId}
                  |- SimpleDSComponent.java
         |- test
            |- java
               |- ${groupId}
                  |- SimpleUnitTest.java
   |- content
      |- pom.xml
      |- src
         |- main
            |- content
               |- jcr_root
                  |- apps
                     |- ${appsFolderName} 
                            |- config
                            |- install
                  |- META-INF
                      |- vault
                         |- config.xml
                         |- filter.xml
                         |- nodetypes.cnd
                         |- properties.xml
                         |- definition
                            |- .content.xml
```

