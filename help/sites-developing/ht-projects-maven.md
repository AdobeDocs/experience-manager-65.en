---
title: How to Build AEM Projects using Apache Maven
seo-title: How to Build AEM Projects using Apache Maven
description: This document describes how to set up an AEM project based on Apache Maven
seo-description: This document describes how to set up an AEM project based on Apache Maven
uuid: 675932d3-dabb-4066-a743-75bdf4f049d7
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: development-tools
content-type: reference
discoiquuid: aee5f5a7-8462-4d42-8d96-8a7eb317770e
---

# How to Build AEM Projects using Apache Maven{#how-to-build-aem-projects-using-apache-maven}

## Overview {#overview}

This document describes how to set up an AEM project based on [Apache Maven](https://maven.apache.org/).

Apache Maven is an open source tool for managing software projects by automating builds and providing quality project information. It is the recommended build management tool for AEM projects.

Building your AEM Project based on Maven offers you several benefits:

* An IDE-agnostic development environment
* Usage of Maven Archetypes and Artifacts provided by Adobe
* Usage of Apache Sling and Apache Felix tool sets for Maven based development setups
* Ease of import into an IDE; for example, Eclipse and/or IntelliJ
* Easy integration with Continuous Integration Systems

## Experience Manager API Dependencies {#experience-manager-api-dependencies}

### What is the UberJar? {#what-is-the-uberjar}

The "UberJar" is the informal name given to a special Java Archive (JAR) file provided by Adobe. This JAR file contains all of the public Java APIs exposed by Adobe Experience Manager. It includes limited external libraries as well, specifically all public APIs available in AEM which come from the Apache Sling, Apache Jackrabbit, Apache Lucene, Google Guava, and two libraries used for image processing (Werner Randelshofer's CYMK JPEG ImageIO library and the TwelveMonkeys image library). The UberJar only contains API interfaces and classes, meaning that it only contains interfaces and classes which are exported by an OSGi bundle in AEM. It also contained a *MANIFEST.MF* file containing the correct package export versions for all of these exported packages, thus ensuring that projects built against the UberJar have the correct package import ranges.

### Why did Adobe create the UberJar? {#why-did-adobe-create-the-uberjar}

In the past, developers had to manage a relatively large number of individual dependencies to different AEM libraries and when each new API was used, one or more individual dependencies had to be added to the project. On one project, the introduction of the UberJar resulted in 30 separate dependencies being removed from the project.

### How to I use the UberJar? {#how-to-i-use-the-uberjar}

If you are using Apache Maven as a build system (which is the case for most AEM Java projects), you will need to add one or two elements to your *pom.xml* file. The first is a *dependency* element adding the actual dependency to your project:

```xml
<dependency>
    <groupId>com.adobe.aem</groupId>
    <artifactId>uber-jar</artifactId>
    <version>6.4.0</version>
    <classifier>apis</classifier>
    <scope>provided</scope>
</dependency>
```

If your company is already using a Maven Repository Manager such as Sonatype Nexus, Apache Archiva, or JFrog Artifactory, add the appropriate configuration to your project to reference this repository manager and add Adobe's Maven repository ([https://repo.adobe.com/nexus/content/groups/public/](https://repo.adobe.com/nexus/content/groups/public/)) to your repository manager.

If you are not using a repository manager, then you will need to add a *repository* element to your *pom.xml* file:

```xml
<repositories>
    <repository>
        <id>adobe-public-releases</id>
        <name>Adobe Public Repository</name>
        <url>https://repo.adobe.com/nexus/content/groups/public/</url>
        <layout>default</layout>
    </repository>
</repositories>
<pluginRepositories>
    <pluginRepository>
        <id>adobe-public-releases</id>
        <name>Adobe Public Repository</name>
        <url>https://repo.adobe.com/nexus/content/groups/public/</url>
        <layout>default</layout>
    </pluginRepository>
</pluginRepositories>
```

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-uberjar-demo project on GitHub](https://github.com/justinedelson/aem-uberjar-demo)
* Download the project as [a ZIP file](https://github.com/justinedelson/aem-uberjar-demo/archive/6.2-unobfuscated.zip)

>[!NOTE]
>
>It is also possible to configure these repositories in your Maven *settings.xml* file.

Users of other build systems (for example, Apache Ant, Gradle) should follow similar steps, adapted to the specific syntax of their chosen tool.

### What can I do with the UberJar? {#what-can-i-do-with-the-uberjar}

With the UberJar, you can compile project code which depends upon AEM APIs (and the APIs used by the projects mentioned above). You can also generate OSGi Service Component Runtime (SCR) and OSGi Metatype information. With some limitations, you can also write and execute unit tests.

### What can't I do with the UberJar? {#what-can-t-i-do-with-the-uberjar}

Because the UberJar contains **only** APIs, it is not executable and cannot be used to **run** Adobe Experience Manager. To run AEM, you need the AEM Quickstart, either Standalone or Web Application Archive (WAR) form.

### You mentioned limitations on unit tests. Please explain further. {#you-mentioned-limitations-on-unit-tests-please-explain-further}

Unit tests generally interact with product APIs in three different ways, each of which is impacted slightly differently by the UberJar.

#### Use Case #1 - Custom Code which calls a API interface {#use-case-custom-code-which-calls-a-api-interface}

This case, which is the most common, involves some custom code which executes methods on a Java interface defined by the AEM API. The implementation of this interface may either be provided directly or be injected using the Dependency Injection pattern. **This use case can be handled with the UberJar.**

An example of the former would be:

```java
public class ClassWhichHasAEMInterfacePassedIn {
    /**
     * Get the first length characters of the page title.
     */
    public String getTrimmedTitle(Page page, int length) {
         String title = page.getTitle();
         return StringUtils.left(title, length);
    }
}
```

An example of the latter would be:

```java
@Component
@Service
public class ComponentWhichHasAEMInterfaceInjected implements TitleTrimmer {
    @Reference
    private PageManagerFactory pageManagerFactory;
  
    /**
     * Get the first length characters of the title of the page containing the provided Resource.
     */
    public String getTrimmedTitle(Resource resource, int length) {
        PageManager pageManager = pageManagerFactory.getPageManager(resource.getResourceResolver());
        Page page = pageManager.getContainingPage(resource);
        if (page == null) {
           return null;
        }
        String title = page.getTitle();
        return StringUtils.left(title, length);
    }
}
```

To unit test either of these methods, a developer would use a mocking framework such as [JMockit](https://jmockit.org/), [Mockito](https://mockito.org/), [JMock](https://www.jmock.org/), or [Easymock](https://easymock.org/) to create a mock object for the AEM API referenced. These samples use JMockit, but for this particular use case, the difference between these frameworks is largely syntatical.

```java
@RunWith(JMockit.class)
public class ClassWhichHasAEMInterfacePassedInTest {
 
    @Tested
    private ClassWhichHasAEMInterfacePassedIn instance;

    @Mocked
    private Page page;

    @Test
    public void test_that_long_string_is_trimmed() {
        new Expectations() {{
            page.getTitle();
            result = "a really really really really really long string";
        }};
        assertEquals("a really", instance.getTrimmedTitle(page, 8));
    }
}
```

```java
@RunWith(JMockit.class)
public class ComponentWhichHasAEMInterfaceInjectedTest {

    @Tested
    private ComponentWhichHasAEMInterfaceInjected instance;

    @Mocked
    private Page page;

    @Mocked
    private PageManager pageManager;

    @Injectable
    private PageManagerFactory pageManagerFactory;

    @Mocked
    private Resource resource;

    @Mocked
    private ResourceResolver resourceResolver;
 
    @Test
    public void test_that_long_string_is_trimmed() {
        new Expectations() {{
            resource.getResourceResolver();
            result = resourceResolver;
            pageManagerFactory.getPageManager(resourceResolver);
            result = pageManager;
            pageManager.getContainingPage(resource);
            result = page;
            page.getTitle();
            result = "a really really really really really long string";
        }};
        assertEquals("a really", instance.getTrimmedTitle(resource, 8));
    }
}
```

#### Use Case #2 - Custom Code which calls an API implementation class {#use-case-custom-code-which-calls-an-api-implementation-class}

This use case involves calling into a static or instance method of an class in the AEM API where you are referencing a concrete class, as opposed an interface as in Use Case #1.

```java
public class ClassWhichUsesAStaticMethodFromAPI {
  
    /**
     * Get a map of asset titles to asset objects.
     *
     * @param resource either an asset resource or a folder containing assets.
     * @return an map of titles to assets. if an asset doesn't have a title, the name is used instead.
     */
    public Map<String, Asset> getAssetTitles(Resource resource) {
        Iterator<Asset> assets = DamUtil.getAssets(resource);
        Map<String, Asset> result = new HashMap<String, Asset>();
        while (assets.hasNext()) {
            Asset asset = assets.next();
            String title = asset.getMetadataValue(DamConstants.DC_TITLE);
            if (title == null) {
                title = asset.getName();
            }
            result.put(title, asset);
        }
        return result;
    }
}
```

```java
public class ClassWhichUsesAnInstanceMethodFromAPI {
  
    /**
     * Count the number of paragraphs in a parsys.
     *
     * @param resource the parsys resource
     * @return the count
     */
    public int countParagraphs(Resource resource) {
        return new ParagraphSystem(resource).paragraphs().size();
    }
}

```

**This use case can be handled with the UberJar**. However, mocking the API where possible is still recommended for performant tests.

```java
@RunWith(JMockit.class)
public class ClassWhichUsesAStaticMethodFromAPITest {

    @Tested
    private ClassWhichUsesAStaticMethodFromAPI instance;

    @Mocked(stubOutClassInitialization = true)
    private DamUtil unusedDamUtil = null;

    @Mocked
    private Resource resource;
 
    @Test
    public void test_that_empty_iterator_produces_empty_map() {
        new Expectations() {
            {
                DamUtil.getAssets(resource);
                result = Collections.<Asset> emptySet().iterator();
            }
        };
        Map<String, Asset> result = new ClassWhichUsesAStaticMethodFromAPI().getAssetTitles(resource);
        assertNotNull(result);
        assertEquals(0, result.size());
    }
    @Test
    public void test_with_reference_search() {
        assertTrue(true);
    }
}
```

```java
@RunWith(JMockit.class)
public class ClassWhichUsesAnInstanceMethodFromAPITest {

    @Tested
    private ClassWhichUsesAnInstanceMethodFromAPI instance;
 
    @Mocked
    private Resource parsys;

    @Mocked
    private Paragraph firstPar;

    @Mocked
    private Paragraph secondPar;

    @Test
    public void test_empty_parsys_returns_zero() {
        new MockUp<ParagraphSystem>() {
            @Mock
            public void $init(Resource resource) {
                assertEquals(parsys, resource);
            }
            @Mock
            public List<Paragraph> paragraphs() {
                return Collections.<Paragraph> emptyList();
            }
        };
        assertEquals(0, instance.countParagraphs(parsys));
    }
}
```

#### Use Case #3 - Custom code which extends a base class from the API {#use-case-custom-code-which-extends-a-base-class-from-the-api}

As with SCR Generation, if your code extends a base class (abstract or concrete) from the AEM API, you **must** use the UberJar in order to test it.

## Common Development Tasks with Maven {#common-development-tasks-with-maven}

### How-To Add Paths to the content Module {#how-to-add-paths-to-the-content-module}

The content module contains a file src/main/content/META-INF/vault/filter.xml which defines the filters for the AEM package that is built by Maven. The file that is created by the Maven archetype looks like this:

#### src/main/content/META-INF/vault/filter.xml {#src-main-content-meta-inf-vault-filter-xml}

```xml
<?xml version="1.0" encoding="UTF-8"?>
<workspaceFilter version="1.0">
    <filter root="/apps/myproject"/>
</workspaceFilter>
```

This file is used in a number of different ways:

* by the `content-package-maven-plugin` to determine which content to include in the package
* by the VLT tool to determine which paths to consider
* if the package is re-built in AEM Package Manager, this also defines which paths to include

Depending on your application's requirements, you may want to add to these paths to include more content, such as:

* Rollout Configurations
* Blueprints
* Workflow Models
* Design Pages
* Sample Content

To add to the paths, add more `<filter>` elements:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<workspaceFilter version="1.0">
    <filter root="/apps/myproject"/>
    <filter root="/etc/msm/rolloutconfigs/myrolloutconfig"/>
    <filter root="/etc/blueprints/mysite/globalsite"/>
    <filter root="/etc/workflow/models/myproject"/>
    <filter root="/etc/designs/myproject"/>
    <filter root="/content/myproject/sample-content"/>
</workspaceFilter>
```

#### Adding Paths to the Package Without Syncing Them {#adding-paths-to-the-package-without-syncing-them}

If you have files that should be added to the package that is built by the content-package-maven-plugin but that should not be synchronized between the file system and the repository, you can use `.vltignore` files. These files have the same syntax as [.gitignore](https://www.kernel.org/pub/software/scm/git/docs/gitignore.html) files.

For example, the archetype uses a `.vltignore` file to prevent the JAR file that is installed as part of the bundle from being synced back to the file system:

#### src/main/content/jcr_root/apps/myproject/install/.vltignore {#src-main-content-jcr-root-apps-myproject-install-vltignore}

```xml
*.jar
```

#### Syncing Paths Without Adding Them to the Package {#syncing-paths-without-adding-them-to-the-package}

In some cases, you may want to keep particular paths synchronized between the file system and the repository, but not have them included in the package that is built to be installed into AEM.

A typical case is the `/libs/foundation` path. For development purposes, you may want to have the contents of this path available in your file system, so that e.g. your IDE can resolve JSP inclusions that include JSPs in `/libs`. However, you don't want to include that part in the package you build, as the `/libs` part contains product code that must not be modified by custom implementations.

To achieve this, you can provide a file `src/main/content/META-INF/vault/filter-vlt.xml`. If this file exists, it will be used by the VLT tool, e.g. when you perform `vlt up` and `vlt ci`, or when you have set `vlt sync` set up. The content-package-maven-plugin will continue to use the file `src/main/content/META-INF/vault/filter.xml` when creating the package.

For example, to make `/libs/foundation` available locally for development, but only include `/apps/myproject` in the package, use the following two files.

#### src/main/content/META-INF/vault/filter.xml {#src-main-content-meta-inf-vault-filter-xml-1}

```xml
<?xml version="1.0" encoding="UTF-8"?>
<workspaceFilter version="1.0">
    <filter root="/apps/myproject"/>
</workspaceFilter>
```

#### src/main/content/META-INF/vault/filter-vlt.xml {#src-main-content-meta-inf-vault-filter-vlt-xml}

```xml
<?xml version="1.0" encoding="UTF-8"?>
<workspaceFilter version="1.0">
    <filter root="/libs/foundation"/>
    <filter root="/apps/myproject"/>
</workspaceFilter>
```

You will also need to reconfigure the maven-resources-plugin to not include these files in the package: the filter.xml file is not applied when the package is installed but only when the package is built again using package manager.

Change the `<resources>` section in the content pom accoringly:

#### src/main/content/pom.xml {#src-main-content-pom-xml}

```xml
<!-- ... -->
<resources>
 <resource>
  <directory>src/main/content/jcr_root</directory>
  <filtering>false</filtering>
  <excludes>
   <exclude>**/.vlt</exclude>
   <exclude>**/.vltignore</exclude>
   <exclude>libs/</exclude>
  </excludes>
 </resource>
</resources>
<!-- ... -->
```

### How-To Work with JSPs {#how-to-work-with-jsps}

The Maven setup described so far creates a content package that can also include components and their corresponding JSPs. However, Maven treats them as any other file that is part of the content package and does not even recognize them as JSPs.

The resulting components work in AEM all the same, but making Maven aware of the JSPs has two major benefits

* it allows Maven to fail if the JSPs contain errors, so that these are surfaced at build time and not when they are first compiled in AEM
* For IDEs that can import Maven projects, this also enables code completion and tag library support in the JSPs

Two things are required to enable this setup:

1. add tag library dependencies
1. compile the JSPs as part of the Maven compile process

#### Adding Tag Library Dependencies {#adding-tag-library-dependencies}

Below dependencies need to be added to the `content` modules's POM.

>[!NOTE]
>
>Unless you are importing the product dependencies as described above, they also need to be added to the parent POM along with the version matching your AEM setup as described above. The comments in each entry below show the package to search for in the Dependency Finder.

>[!NOTE]
>
>The `com.adobe.granite.xssprotection` artifact is not included in the cq-quickstart-product-dependencies POM and requires full Maven coordinates as obtained from the Dependency Finder.

#### Compiling JSPs as part of the Maven Compile Phase {#compiling-jsps-as-part-of-the-maven-compile-phase}

To compile JSPs in Maven's `compile` phase, we use Apache Sling's [Maven JspC Plugin](https://sling.apache.org/documentation/development/jspc.html) as shown below:

* we set up an execution for the `jspc` goal (which by default binds to the `compile` phase, so we don't need to specify the phase explicitly)

* we tell it to compile any JSPs in `${project.build.directory}/jsps-to-compile`
* and output the result to `${project.build.directory}/ignoredjspc` (which translates to `myproject/content/target/ignoredjspc`)

* we set up maven-resources-plugin to copy the JSPs to `${project.build.directory}/jsps-to-compile` in the generate-sources phase and configure it to not copy the `libs/` folder (because that is AEM product code and we neither want to incur the dependencies for compilation for our project, nor do we need to validate that it compiles.

Our primary goal, as stated above, is to validate the JSPs and make sure that the build process fails if they contain errors. This is why we compile them to a separate directory that is ignored (and in fact immediately deleted afterwards, as you will see in a minute).

The result of the Maven JspC Plugin can also be bundled and deployed as part of an OSGi Bundle, but this has other implications and side effects and goes beyond our goal of validating the JSPs.

To achieve deletion of the classes compiled from the JSPs, we set up the Maven Clean Plugin as shown below. If you want to inspect the result of the Maven JspC Plugin, run `mvn compile` in `myproject/content` -- after that, you will find the result in `myproject/content/target/ignoredjspc`).

#### myproject/content/pom.xml {#myproject-content-pom-xml-1}

```xml
<build>
  <!-- ... -->
  <plugins>
    <!-- ... -->
    <plugin>
      <artifactId>maven-resources-plugin</artifactId>
      <executions>
        <execution>
          <id>copy-resources</id>
          <phase>generate-sources</phase>
          <goals>
            <goal>copy-resources</goal>
          </goals>
          <configuration>
            <outputDirectory>${project.build.directory}/jsps-to-compile</outputDirectory>
            <resources>
              <resource>
                <directory>src/main/content/jcr_root</directory>
                <excludes>
                  <exclude>libs/**</exclude>
                </excludes>
              </resource>
            </resources>
          </configuration>
        </execution>
      </executions>
    </plugin>
    <plugin>
      <groupId>org.apache.sling</groupId>
      <artifactId>maven-jspc-plugin</artifactId>
      <version>2.0.6</version>
      <executions>
        <execution>
          <id>compile-jsp</id>
          <goals>
            <goal>jspc</goal>
          </goals>
          <configuration>
            <jasperClassDebugInfo>false</jasperClassDebugInfo>
            <sourceDirectory>${project.build.directory}/jsps-to-compile</sourceDirectory>
            <outputDirectory>${project.build.directory}/ignoredjspc</outputDirectory>
          </configuration>
        </execution>
      </executions>
    </plugin>
    <plugin>
      <artifactId>maven-clean-plugin</artifactId>
      <executions>
        <execution>
          <id>remove-compiled-jsps</id>
          <goals>
            <goal>clean</goal>
          </goals>
          <phase>process-classes</phase>
          <configuration>
            <excludeDefaultDirectories>true</excludeDefaultDirectories>
            <filesets>
              <fileset>
                <directory>${project.build.directory}/jsps-to-compile</directory>
                <directory>${project.build.directory}/ignoredjspc</directory>
              </fileset>
            </filesets>
          </configuration>
        </execution>
      </executions>
    </plugin>
  </plugins>
</build>
```

>[!NOTE]
>
>Depending on whether you actually make use of JSP code in `/libs` (i.e. include JSPs from there), you will need to refine which JSPs are copied for compilation.
>
>E.g. if you include `/libs/foundation/global.jsp`, you can use the following configuration for the `maven-resources-plugin` instead of the configuration above which completely skips over `/libs`.
>```
> <resource>  
>      <directory>src/main/content/jcr_root</directory>  
>      <includes>  
>          <include>apps/**</include>  
>          <include>libs/foundation/global.jsp</include>
>    </includes>  
>  </resource>  
>  ```

### How-To Work with SCM Systems {#how-to-work-with-scm-systems}

When working with Source Configuration Management (SCM), you want to make sure that

* The VCS ignores non-source artifacts in the file system
* VLT ignores artifacts of the VCS and does not check them in to the repository

>[!NOTE]
>
>This description does not cover how to configure Maven to work with your SCM, which is described exhaustively in the [Maven POM reference](https://maven.apache.org/pom.html#SCM) and the [Maven SCM Plugin's documentation](https://maven.apache.org/scm/).

#### Patterns to Exclude from SCM {#patterns-to-exclude-from-scm}

The following is a typical list of patterns to include from SCM. E.g., if you are using git, you can add these to your project's `.gitignore` file.

#### sample .gitignore {#sample-gitignore}

```shell
# Ignore VLT files
.vlt
.vlt-sync.log
.vlt-sync-config.properties

# Ignore Quickstart launches in the source tree
license.properties
crx-quickstart

# Ignore compilation results
target

# Ignore IDE and Operating System artifacts
.idea
.classpath
.metadata
.project
.settings
maven-eclipse.xml
*.iml
*.ipr
*.iws
.DS_Store
```

#### Ignoring SCM control files in VLT {#ignoring-scm-control-files-in-vlt}

In some cases, you may have SCM control files in the content source tree that you do not want to be checked in to the repository.

Think of the following situation:

The archetype already created a .vltignore file to prevent the installed bundle jar file from being synced back to the file system:

#### src/main/content/jcr_root/apps/myproject/install/.vltignore {#src-main-content-jcr-root-apps-myproject-install-vltignore-1}

```shell
*.jar
```

Obviously, you do not want this file in your SCM either, so if e.g. you are using git, you would add a corresponding . `gitignore` file:

#### src/main/content/jcr_root/apps/myproject/install/.gitignore {#src-main-content-jcr-root-apps-myproject-install-gitignore}

```shell
*.jar
```

As the . `gitignore` file should not go into the repository either, the . `vltignore` file needs to be extended to include the . `gitignore` file:

#### src/main/content/jcr_root/apps/myproject/install/.vltignore {#src-main-content-jcr-root-apps-myproject-install-vltignore-2}

```shell
*.jar
.gitignore
```

### How-To Work with Deployment Profiles {#how-to-work-with-deployment-profiles}

If your build process is part of a larger development lifecycle management setup, such as a continous integration process, you often need to deploy to other machines than just the developer's local instance.

For such scenarios, you can easily add new [Maven Build Profiles](https://maven.apache.org/guides/introduction/introduction-to-profiles.html) to the project's POM.

The example below adds a profile `integrationServer`, which redefines the host names and ports for the author and publish instances. You can deploy to these servers by running maven from the project root as shown below.

```shell
# install on integration test author
$ mvn -PautoInstallPackage -PintegrationServer install

# install on integration test publisher
$ mvn -PautoInstallPackagePublish -PintegrationServer install
```

#### myproject/pom.xml {#myproject-pom-xml}

```xml
<profiles>

    <!-- ... -->

    <profile>
        <id>integrationServer</id>
        <properties>
            <crx.host>dev-author.intranet</crx.host>
            <crx.port>5502</crx.port>
            <publish.crx.host>dev-publish.intranet</publish.crx.host>
            <publish.crx.port>5503</publish.crx.port>
        </properties>
    </profile>
</profiles>
```

### How-To Work with AEM Communities {#how-to-work-with-aem-communities}

When licensed for the AEM Communities capability, an additional API jar is necessary.

For details, see [Using Maven for Communities](/help/communities/maven.md)
