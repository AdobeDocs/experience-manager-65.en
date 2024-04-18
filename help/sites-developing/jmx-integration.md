---
title: Integrating Services with the JMX Console
description: Expose service attributes and operations to enable administration tasks to be performed by creating and deploying MBeans to manage services using the JMX Console
topic-tags: extending-aem
content-type: reference
exl-id: fe727406-09cb-4516-8278-806fd78cfc12
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Integrating Services with the JMX Console{#integrating-services-with-the-jmx-console}

Create and deploy MBeans to manage services using the JMX Console. Expose service attributes and operations to enable administration tasks to be performed.

For information about using the JMX Console, see [Monitoring Server Resources Using the JMX Console](/help/sites-administering/jmx-console.md).

## The JMX Framework in Felix and CQ5 {#the-jmx-framework-in-felix-and-cq}

On the Apache Felix platform, you deploy MBeans as OSGi services. When an MBean service is registered in the OSGi Service Registry, the Aries JMX Whiteboard module automatically registers the MBean with the MBean Server. The MBean is then available to the JMX Console which exposes the public attributes and operations.

![jmxwhiteboard](assets/jmxwhiteboard.png)

## Creating MBeans for CQ5 and CRX {#creating-mbeans-for-cq-and-crx}

MBeans that you create for managing CQ5 or CRX resources are based on the javax.management.DynamicMBean interface. To create them you follow the usual design patterns as outlined in the JMX specification:

* Create the management interface, including get, set, and is methods to define attributes, and other methods to define operations.
* Create the implementation class. The class must implement DynamicMBean, or extend an implementation class of DynamicMBean.
* Follow the standard naming convention so that the name of the implementation class is the interface name with the MBean suffix.

In addition to defining the management interface, the interface also defines the OSGi service interface. The implementation class implements the OSGi service.

### Using Annotations to Provide MBean Information {#using-annotations-to-provide-mbean-information}

The [com.adobe.granite.jmx.annotation](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/jmx/annotation/package-summary.html) package provides several annotations and classes for easily providing MBean metadata to the JMX console. Use these annotations and classes instead of adding information to the MBean's MBeanInfo object directly.

**Annotations**

Add annotations to the management interface to specify MBean metadata. The information appears in the JMX console for each implementation class that is deployed. The following annotations are available (for complete information, see the [com.adobe.granite.jmx.annotation JavaDocs](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/jmx/annotation/package-summary.html)):

* **Description:** Provides a description of the MBean class or method. When used on the class declaration, the desctiption appears on the JMX Console page for the MBean. When used on a method, the desctiption appears as hover text for the corresponding attribute or operation.
* **Impact:** The impact of a method. Valid parameter values are the fields defined by [javax.management.MBeanOperationInfo](https://docs.oracle.com/javase/1.5.0/docs/api/javax/management/MBeanOperationInfo.html).

* **Name:** Specifies the name to display for an operation parameter. Use this annotation to override the actual name of the method parameter that is used in the interface.
* **OpenTypeInfo:** Specifies the class to use for representing composite data or tabular data in the JMX Console. For use with Open MBeans
* **TabularTypeInfo:** Used to annotate the class that is used to represent tabular data.

**Classes**

Classes are provided for creating Dynamic MBeans that consume the annotations that you add to their interfaces:

* **AnnotatedStandardMBean:** A subclass of the javax.management.StandardMBean class that automatically provides the JMX Console with the annotation metadata.
* **OpenAnnotatedStandardMBean:** A subclass of the AnnotatedStandardMBean class for creating Open Mbeans that consume the OpenTypeInfo annoatation..

### Developing MBeans {#developing-mbeans}

Typically, your MBean is a reflection on the OSGi service that you want to manage. On the Felix platform, you create the MBean as you would for deployment on other Java server platforms. A primary difference is that you can use annotations to specify MBean information:

* Management interface: Defines attributes using getter, setter, and is methods. Defines operations using any other public method. Uses annotations to provide metadata for the BeanInfo object.
* MBean class: Implements the management interface. Extends the AnnotatedStandardMBean class so that it processes the annotations on the interface.

The following example MBean provides information about the CRX repository. The interface uses the Description annotation to provide information to the JMX console.

#### Management Interface {#management-interface}

```java
package com.adobe.example.myapp;

import com.adobe.granite.jmx.annotation.Description;

@Description("Example MBean that exposes repository properties.")
public interface ExampleMBean {

    @Description("The name of the repository.")
    String getRepositoryName();

    @Description("The vendor of the repository.")
    String   getRepositoryVendor();

    @Description("The URL of repository vendor.")
    String getVendorUrl();
}
```

The implementation class uses the SlingRepository service to retrieve information about the CRX repository.

#### MBean Implementation Class {#mbean-implementation-class}

```java
package com.adobe.example.myapp;

import org.apache.felix.scr.annotations.*;
import org.apache.sling.jcr.api.SlingRepository;

import com.adobe.granite.jmx.annotation.AnnotatedStandardMBean;

import javax.management.*;

public class ExampleMBeanImpl extends AnnotatedStandardMBean implements ExampleMBean {

    @Reference(cardinality = ReferenceCardinality.OPTIONAL_UNARY)
    private SlingRepository repository;

    public ExampleMBeanImpl() throws NotCompliantMBeanException {
        super(ExampleMBean.class);
    }

    public String getRepositoryName() {
        return repository.getDescriptor("jcr.repository.name");
    }

    public String getRepositoryVendor() {
        return repository.getDescriptor("jcr.repository.vendor");
    }

    public String getVendorUrl() {
        return repository.getDescriptor("jcr.repository.vendor.url");
    }
}
```

The following graphic shows the page for this MBean in the JMX Console.

![jmxdescription](assets/jmxdescription.png)

### Registering MBeans {#registering-mbeans}

When you register MBeans as an OSGi service, they are automatically registered with the MBean Server. To install an MBean on CQ5, include it in a bundle and export the MBean service as you would any other OSGi service.

In addition to the OSGi-related metadata, you must also provide metadata that the Aries JMX Whiteboard module requires for registering the MBean with the MBean Server:

* **The name of the DynamicMBean interface:** Declare that the MBean service implements the `javax.management.DynamicMBea`n interface. This declaration notifies the Aries JMX Whiteboard module that the service is an MBean service.

* **The MBean domain and key properties:** On Felix, you provide this information as a property of the MBean's OSGi service. This is the same information that you ordinarily provide to the MBean Server in a `javax.management.ObjectName` object.

When your MBean is a reflection of a singular service, only a single instance of the MBean service is required. In this case, if you use the Felix SCR Maven plugin, you can use the Apache Felix Service Component Runtime (SCR) annotations on the MBean implementation class to specify the JMX-related metatdata. To instantiate several MBean instances, you could create another class that performs that registration of the MBean's OSGi service. In this case, the JMX-related metadata is generated at runtime.

**Single MBean**

MBeans for which you can define all the attributes and operations at design time can be deployed using SCR annotations in the MBean implementation class. In the following example, the `value` attribute of the `Service` annotation declares that the service implements the `DynamicMBean` interface. The `name` attribute of the `Property` annotation specifies the JMX domain and key properties.

#### MBean Implementation Class with SCR Annotations {#mbean-implementation-class-with-scr-annotations}

```java
package com.adobe.example.myapp;

import org.apache.felix.scr.annotations.*;
import org.apache.sling.jcr.api.SlingRepository;

import com.adobe.granite.jmx.annotation.AnnotatedStandardMBean;

import javax.management.*;

@Component(immediate = true)
@Property(name = "jmx.objectname", value="com.adobe.example:type=CRX")
@Service(value = DynamicMBean.class)
public class ExampleMBeanImpl extends AnnotatedStandardMBean implements ExampleMBean {

    @Reference(cardinality = ReferenceCardinality.OPTIONAL_UNARY)
    private SlingRepository repository;

    public ExampleMBeanImpl() throws NotCompliantMBeanException {
        super(ExampleMBean.class);
    }

    public String getRepositoryName() {
        return repository.getDescriptor("jcr.repository.name");
    }

    public String getRepositoryVendor() {
        return repository.getDescriptor("jcr.repository.vendor");
    }

    public String getVendorUrl() {
        return repository.getDescriptor("jcr.repository.vendor.url");
    }
}
```

**Multiple MBean Service Instances**

To manage multiple instances of a managed service, you create multiple instances of the corresponding MBean service. Furthermore, MBean service instances should be created or removed when managed instances are started or stopped. You can create an MBean manager class to instantiate MBean services at runtime, and manage the service lifecycle.

Use the BundleContext to register the MBean as an OSGi service. Include the JMX-related information in the Dictionary object that you use as an argument of the BundleContext.registerService method.

In the following code example, the ExampleMBean service is registered programmatically. The componentContext object is the ComponentContext, which provides access to BundleContext.

#### Code Snippet: Programmatic MBean Service Registration {#code-snippet-programmatic-mbean-service-registration}

```java
Dictionary mbeanProps = new Hashtable();
mbeanProps.put("jmx.objectname", "com.adobe.example:type=CRX");
ExampleMBeanImpl mbean = new ExampleMBeanImpl();
ServiceRegistration serviceregistration =
            componentContext.getBundleContext().registerService(DynamicMBean.class.getName(), mbean, mbeanProps);
```

The example MBean in the next section provides more details.

An MBean service manager is useful when service configurations are stored in the repository. The manager can retrieve service information and use it to configure and create the corresponding MBean. The manager class can also listen for repository change events and update MBean services accordingly.

## Example: Monitoring Workflow Models Using JMX {#example-monitoring-workflow-models-using-jmx}

The MBean in this example provides information about the CQ5 Workflow models that are stored in the repository. An MBean manager class creates MBeans based on Workflow models that are stored in the repository and registers their OSGi service at runtime. This example consists of a single bundle containing the following members:

* WorkflowMBean: The management interface.
* WorkflowMBeanImpl: The MBean implementation class.
* WorkflowMBeanManager: The interface of the MBean manager class.
* WorkflowMBeanManagerImpl: The implementation class of the MBean manager.

**Note:** For simplicity, the code in this example does not perform logging or react to thrown exceptions.

WorkflowMBeanManagerImpl includes a component activation method. When the component is activated, the method performs the following tasks:

* Obtains a BundleContext for the bundle.
* Queries the repository to obtain the paths of the existing Workflow models.
* Creates MBeans for each Workflow model.
* Registers the MBeans with the OSGi service registry.

The MBean metadata appears in the JMX Console with the com.adobe.example domain, the workflow_model type, and Properties is the path of the workflow model condfiguration node.

![jmxworkflowmbean](assets/jmxworkflowmbean.png)

### The Example MBean {#the-example-mbean}

This example requires an MBean interface and implementation that is a reflection on the `com.day.cq.workflow.model.WorkflowModel` interface. The MBean is very simple so that the example can focus on the configuration and deployment aspects of the design. The MBean exposes a single attribute, the model name.

#### WorkflowMBean Interface {#workflowmbean-interface}

```java
package com.adobe.example.myapp.api;

import com.adobe.granite.jmx.annotation.Description;

@Description("Example MBean that exposes Workflow model properties.")
public interface WorkflowMBean {

 @Description("The name of the Workflow model.")
 String getModelName();
}
```

#### WorkflowMBeanImpl {#workflowmbeanimpl}

```java
package com.adobe.example.myapp.impl;

import javax.management.NotCompliantMBeanException;

import com.day.cq.workflow.model.WorkflowModel;
import com.adobe.example.myapp.api.WorkflowMBean;
import com.adobe.granite.jmx.annotation.AnnotatedStandardMBean;

public class WorkflowMBeanImpl extends AnnotatedStandardMBean implements WorkflowMBean {

 WorkflowModel model;

 protected WorkflowMBeanImpl(WorkflowModel inmodel)
   throws NotCompliantMBeanException {
  super(WorkflowMBean.class);
  model=inmodel;
 }

 public String getModelName() {
  return model.getTitle();
 }
}
```

### The Example MBean Manager {#the-example-mbean-manager}

The WorkflowMBeanManager service includes the component activation method that creates WorkflowMBean services. The service implmentation includes the following methods:

* activate: The componet activator. Creates the JCR session for reading WorkflowModel configuration nodes. The root node where model configurations are stored is defined in a static field. The name of the configuration node is also defined in a static field. This method calls other methods that obtain the node model paths and create the model WorkflowMBeans.
* getModelIds: Traverses the repository below the root node and retrieves the path of each model node.
* makeMBean: Uses the model path to create a WorkflowModel object, creates a WorkflowMBean for it, and registers its OSGi service.

>[!NOTE]
>
>The WorkflowMBeanManager implementation only creates MBean services for model configurations that exist when the component is activated. A more robust implementation listens for repository events regarding new model configurations and changes or deletions of existing model configuration. When a change occurs, the manager can create, modify, or remove the corresponding WorkflowMBean service.
>

#### WorkflowMBeanManager Interface {#workflowmbeanmanager-interface}

```java
package com.adobe.example.myapp.api;

public interface WorkflowMBeanManager {

}
```

#### WorkflowMBeanManagerImpl {#workflowmbeanmanagerimpl}

```java
package com.adobe.example.myapp.impl;

import java.util.*;

import org.apache.felix.scr.annotations.*;

import javax.jcr.Session;
import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.jcr.RepositoryException;
import javax.management.ObjectName;

import org.apache.sling.jcr.api.SlingRepository;
import org.osgi.framework.ServiceRegistration;
import org.osgi.service.component.ComponentContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.cq.workflow.WorkflowService;
import com.day.cq.workflow.WorkflowSession;
import com.adobe.example.myapp.api.WorkflowMBean;
import com.adobe.example.myapp.api.WorkflowMBeanManager;

/**Instantiates and registers WorkflowMBean services */
@Component(immediate=true)
@Service(value=WorkflowMBeanManager.class)
public class WorkflowMBeanManagerImpl implements WorkflowMBeanManager {
 //The ComponentContext provides access to the BundleContext
 private ComponentContext componentContext;

 //Use the SlingRepository service to read model nodes
 @Reference
        private SlingRepository repository = null;

 //Use the WorkflowService service to create WorkflowModel objects
 @Reference
 private WorkflowService workflowservice = null;

  private Session session;

         //Details about model nodes
  private static final String MODEL_ROOT ="/etc/workflow/models";
  private static final String MODEL_NODE = "model";

  private Set<String> modelIds = new HashSet<String>();

        //Storage for ServiceRegistrations for MBean services
  private Collection<ServiceRegistration> mbeanRegistrations= new Vector<ServiceRegistration>(0,1);

 @Activate
        protected void activate(ComponentContext ctx) {
             //Traverse the repository and load the model nodes
             try {
                   session = repository.loginAdministrative(null);
                   // load and store model node paths
                   if (session.nodeExists(MODEL_ROOT)) {
                          getModelIds(session.getNode(MODEL_ROOT));
                   }
                   //Create MBeans for each model
                   for(String modid: modelIds){
                    makeMBean(modid);
                    }
             }catch(Exception e){ }
          }

        /**
         * Add JMX domain and key properties to a collection
         * Instantiate a WorkflowModel and its WorkflowMBeanImpl object
         * Register the MBean OSGi service
         */
 private void makeMBean(String modelId) {
             // create MBean for the model
             try {
                 Dictionary<String, String> mbeanProps = new Hashtable<String, String>();
                 //These properties appear on the JMX Console home page
                 mbeanProps.put("jmx.objectname", "com.adobe.example:type=workflow_model,id=" + ObjectName.quote(modelId));
                 WorkflowSession wfsession = workflowservice.getWorkflowSession(session);
                 WorkflowMBeanImpl mbean = new WorkflowMBeanImpl(wfsession.getModel(modelId));

                ServiceRegistration serviceregistration = componentContext.getBundleContext().registerService(WorkflowMBean.class.getName(), mbean, mbeanProps);
                //Store the ServiceRegistration objects for deactivation
                mbeanRegistrations.add(serviceregistration);
             } catch (Throwable t) {}
         }

        /**
         * Traverses the repository branch below a given Node. Stores the path of each model node.
         */
 private void getModelIds(Node node) throws RepositoryException {
  try{
                     NodeIterator iter = node.getNodes();
                     while (iter.hasNext()) {
                           Node n = iter.nextNode();
                           //Look for "jcr:content" nodes
                           if (n.getName().equals("jcr:content")) {
                                //get the path of the model node and save it
                                if(n.hasNode(MODEL_NODE)){
                                      modelIds.add(n.getNode(MODEL_NODE).getPath());
                                 }
                           } else{
                                   //Scan child nodes
                                   getModelIds(n);
                           }
                       }
  }catch(Exception e){ }
       }

        /**
         * Log out of the JCR session and unregister WorkflowMBean services
         */
        @Deactivate
        protected void deactivate() {
          session.logout();
          session=null;
          for(ServiceRegistration sr:mbeanRegistrations){
         sr.unregister();
          }
        }
}

```

### The POM file for the Example MBean {#the-pom-file-for-the-example-mbean}

For your convenience, you can copy and paste the following XML code into your project pom.xml file for building the component bundle. The POM references several required plugins and dependencies.

**Plugins:**

* Apache Maven Compiler Plugin: Compiles Java classes from source code.
* Apache Felix Maven Bundle Plugin: Creates the bundle and the manifest
* Apache Felix Maven SCR Plugin: Creates the component descriptor file and configures the service-component manifest header.

**Note:** At the time of writing, the maven scr plugin is not compatible with the m2e plugin for Eclipse. (See [Felix bug 3170](https://issues.apache.org/jira/browse/FELIX-3170).) To use the Eclipse IDE, install Maven and use the command line interface to perform builds.

#### Example POM file {#example-pom-file}

```xml
<project xmlns="https://maven.apache.org/POM/4.0.0"
  xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.adobe.example.myapp</groupId>
  <artifactId>workflow-mbean</artifactId>
  <version>0.0.2-SNAPSHOT</version>
  <name>mbean-simple</name>
  <url>www.adobe.com</url>
  <description>A simple MBean</description>
  <packaging>bundle</packaging>
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>
    <build>
        <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <configuration>
                <source>1.5</source>
                <target>1.5</target>
            </configuration>
        </plugin>
            <plugin>
                <groupId>org.apache.felix</groupId>
                <artifactId>maven-scr-plugin</artifactId>
                <version>1.7.2</version>
                <executions>
                    <execution>
                        <id>generate-scr-scrdescriptor</id>
              <goals>
                 <goal>scr</goal>
              </goals>
            </execution>
         </executions>
            </plugin>
             <plugin>
            <groupId>org.apache.felix</groupId>
            <artifactId>maven-bundle-plugin</artifactId>
            <version>1.4.3</version>
            <extensions>true</extensions>
            <configuration>
                <instructions>
                    <Export-Package>com.adobe.example.myapp.*;version=${project.version}</Export-Package>
                </instructions>
            </configuration>
        </plugin>
        </plugins>
    </build>
    <dependencies>
        <dependency>
            <groupId>org.apache.felix</groupId>
            <artifactId>org.apache.felix.scr.annotations</artifactId>
            <version>1.6.0</version>
            <scope>provided</scope>
        </dependency>
         <dependency>
            <groupId>org.apache.sling</groupId>
            <artifactId>org.apache.sling.api</artifactId>
            <version>2.0.8</version>
            <scope>provided</scope>
        </dependency>
         <dependency>
            <groupId>org.apache.felix</groupId>
            <artifactId>org.apache.felix.scr</artifactId>
            <version>1.6.1-R1236132</version>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>org.apache.sling</groupId>
            <artifactId>org.apache.sling.jcr.api</artifactId>
            <version>2.0.4</version>
        </dependency>
        <dependency>
            <groupId>com.adobe.granite</groupId>
            <artifactId>com.adobe.granite.jmx</artifactId>
            <version>0.1.6</version>
            <scope>provided</scope>
        </dependency>
        <dependency>
       <groupId>com.day.cq.wcm</groupId>
       <artifactId>cq-wcm-mobile-api</artifactId>
       <version>5.5.2</version>
       <scope>provided</scope>
      </dependency>
      <dependency>
       <groupId>com.day.cq.workflow</groupId>
       <artifactId>cq-workflow-api</artifactId>
       <version>5.5.0</version>
       <scope>provided</scope>
      </dependency>
      <dependency>
       <groupId>javax.jcr</groupId>
       <artifactId>jcr</artifactId>
       <version>2.0</version>
       <scope>provided</scope>
      </dependency>
      <dependency>
                <groupId>org.slf4j</groupId>
  <artifactId>slf4j-api</artifactId>
  <version>1.6.4</version>
  <scope>provided</scope>
 </dependency>
    </dependencies>
</project>
```

Add the following profile to your maven settings file to use the public Adobe repository.

#### Maven Profile {#maven-profile}

```xml
<profile>
    <id>adobe-public</id>
    <activation>
         <activeByDefault>false</activeByDefault>
    </activation>
    <properties>
         <releaseRepository-Id>adobe-public-releases</releaseRepository-Id>
         <releaseRepository-Name>Adobe Public Releases</releaseRepository-Name>
         <releaseRepository-URL>https://repo1.maven.org/maven2/com/adobe/</releaseRepository-URL>
    </properties>
    <repositories>
         <repository>
             <id>adobe-public-releases</id>
             <name>Adobe  Public Repository</name>
             <url>https://repo1.maven.org/maven2/com/adobe/</url>
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
             <name>Adobe Public Repository</name>
             <url>https://repo1.maven.org/maven2/com/adobe/</url>
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
