---
title: Invoking Human-Centric Long-Lived Processes

description: Programmatically invoke human-centric long-lived processes created in Workbench using a Java web-based client application that uses the Invocation API, an ASP.NET application that uses web services, and a client application built with Flex that uses Remoting.


contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: coding

role: Developer
exl-id: c9ebad8b-b631-492d-99a3-094e892b2ddb
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms, API"
---
# Invoking Human-Centric Long-Lived Processes {#invoking-human-centric-long-lived-processes}

You can programmatically invoke human-centric long-lived processes that were created in Workbench using these client applications:

* A Java web-based client application that uses the Invocation API. (See [Invoking AEM Forms using the Java API](/help/forms/developing/invoking-aem-forms-using-java.md)(/help/forms/developing/invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api).)
* An ASP.NET application that uses web services. (See [Invoking AEM Forms Using Web Services](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-web-services).)
* A client application built with Flex that uses Remoting. (See [Invoking AEM Forms using (Deprecated for AEM forms) AEM Forms Remoting](/help/forms/developing/invoking-aem-forms-using-remoting.md#invoking-aem-forms-using-remoting).)

The long-lived process that is invoked is named *FirstAppSolution/PreLoanProcess*. You can create this process by following the tutorial specified in [Creating Your First AEM Forms Application](https://www.adobe.com/go/learn_aemforms_firstapp_ds_63).

A human-centric process involves a task that a user can respond to by using Workspace. For example, using Workbench, you can create a process that lets a bank manager approve or deny a loan application. The following illustration shows the process *FirstAppSolution/PreLoanProcess*.

The *FirstAppSolution/PreLoanProcess* process accepts an input parameter named *formData* whose data type is XML. The XML data is merged with a form design named *PreLoanForm.xdp*. The following illustration shows a form that represents a task assigned to a user to approve or deny a loan application. The user approves or denies the application by using Workspace. The Workspace user can approve the loan request by clicking the Approve button shown in the following illustration. Likewise, the user can deny the loan request by clicking the deny button.

A long-lived process is invoked asynchronously and cannot be invoked synchronously due to the following factors:

* A process can span a significant amount of time.
* A process can span organizational boundaries.
* A process needs external input in order for it to finish. For example, consider a situation where a form is sent to a manager, who is out of the office. In this situation, the process is not complete until the manager returns and fills out the form.

When a long-lived process is invoked, AEM Forms creates an invocation identifier value as part of creating a record. The record tracks the status of the long-lived process and is stored in the AEM Forms database. Using the invocation identifier value, you can track the status of the long-lived process. In addition, you can use the process invocation identifier value to perform Process Manager operations such as terminating a running process instance.

>[!NOTE]
>
>AEM Forms does not create an invocation identifier value or a record when a short-lived process is invoked.

The `FirstAppSolution/PreLoanProcess` process is invoked when an applicant submits an application, which is represented as XML data. The name of the input process variable is `formData` and its data type is XML. For the purposes of this discussion, assume that the following XML data is used as input to the `FirstAppSolution/PreLoanProcess` process.

```xml
 <?xml version="1.0" encoding="UTF-8"?>
 <LoanApp>
 <Name>Sam White</Name>
 <LoanAmount>250000</LoanAmount>
 <PhoneOrEmail>(555)555-5555</PhoneOrEmail>
 <ApprovalStatus>PENDING APPROVAL</ApprovalStatus>
 </LoanApp>
```

XML data passed to a process must match the fields in the form used in the process. Otherwise, data is not displayed within the form. All applications that invoke the `FirstAppSolution/PreLoanProcess` process must pass this XML data source. The applications created in *Invoking Human-Centric Long-Lived Processes* dynamically create the XML data source from values that a user entered into a web client.

Using a client application, you can send the *FirstAppSolution/PreLoanProcess* process the required XML data. A long-lived process returns an invocation identifier value as its return value. The following illustration shows client applications invoking the*FirstAppSolution/PreLoanProcess long-lived process. The client applications send XML data and get back a string value that represents the invocation identifier value.

**See also**

[Creating a Java web application that invokes a human-centric long-lived process](invoking-human-centric-long-lived.md#creating-a-java-web-application-that-invokes-a-human-centric-long-lived-process)

[Creating an ASP.NET web application that invokes a human-centric long-lived process](invoking-human-centric-long-lived.md#creating-an-asp-net-web-application-that-invokes-a-human-centric-long-lived-process)

[Creating a client application built with Flex that invokes a human-centric long-lived process](invoking-human-centric-long-lived.md#creating-a-client-application-built-with-flex-that-invokes-a-human-centric-long-lived-process)

## Creating a Java web application that invokes a human-centric long-lived process {#creating-a-java-web-application-that-invokes-a-human-centric-long-lived-process}

You can create a web-based application that uses a Java servlet to invoke the `FirstAppSolution/PreLoanProcess` process. To invoke this process from a Java servlet, use the Invocation API within the Java servlet. (See [Invoking AEM Forms using the Java API](/help/forms/developing/invoking-aem-forms-using-java.md#invoking-aem-forms-using-the-java-api).)

The following illustration shows a web-based client application that posts name, phone (or email), and amount values. These values are sent to the Java servlet when the user clicks the Submit Application button.

The Java servlet performs the following tasks:

* Retrieves the values posted from the HTML page to the Java servlet.
* Dynamically creates an XML data source to pass to the *FirstAppSolution/PreLoanProcess* process. The name, phone (or email), and amount values are specified in the XML data source.
* Invokes the *FirstAppSolution/PreLoanProcess* process by using the AEM Forms Invocation API.
* Returns the invocation identifier value to the client web browser.

### Summary of steps {#summary-of-steps}

To create a Java web-based application that invokes the `FirstAppSolution/PreLoanProcess` process, perform the following steps:

1. [Create a web project](invoking-human-centric-long-lived.md#create-a-web-project).
1. [Create Java application logic for the servlet](invoking-human-centric-long-lived.md#create-java-application-logic-for-the-servlet).
1. [Create the web page for the web application](invoking-human-centric-long-lived.md#create-the-web-page-for-the-web-application)
1. [Package the web application to a WAR file](invoking-human-centric-long-lived.md#package-the-web-application-to-a-war-file).
1. [Deploy the WAR file to the J2EE application server hosting AEM Forms](invoking-human-centric-long-lived.md#deploy-the-war-file-to-the-j2ee-application-server-hosting-aem-forms).
1. [Test your web application](invoking-human-centric-long-lived.md#test-your-web-application).

>[!NOTE]
>
>Some of these steps depend on the J2EE application on which AEM Forms is deployed. For example, the method you use to deploy a WAR file depends on the J2EE application server that you are using. It is assumed that AEM Forms is deployed on JBoss®.

### Create a web project {#create-a-web-project}

The first step to create a web application is to create a web project. The Java IDE that this document is based on is Eclipse 3.3. Using the Eclipse IDE, create a web project and add the required JAR files to your project. Add an HTML page named *index.html*  and a Java servlet to your project.

The following list specifies the JAR files to include in your web project:

* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* J2EE.jar

For the location of these JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

>[!NOTE]
>
>The J2EE.jar file defines data types used by a Java servlet. You can obtain this JAR file from the J2EE application server on which AEM Forms is deployed.

**Create a web project**

1. Start Eclipse and click **File** &gt;  **New Project**.
1. In the **New Project** dialog box, select **Web** &gt; **Dynamic Web Project**.
1. Type `InvokePreLoanProcess` for the name of your project and then click **Finish**.

**Add required JAR files to your project**

1. From the Project Explorer window, right-click the `InvokePreLoanProcess` project and select **Properties**.
1. Click **Java build path** and then click the **Libraries** tab.
1. Click the **Add External JARs** button and browse to the JAR files to include.

**Add a Java servlet to your project**

1. From the Project Explorer window, right-click the `InvokePreLoanProcess` project and select **New** &gt;  **Other**.
1. Expand the **Web** folder, select **Servlet**, and then click **Next**.
1. In the Create Servlet dialog box, type `SubmitXML` for the name of the servlet and then click **Finish**.

**Add an HTML page to your project**

1. From the Project Explorer window, right-click the `InvokePreLoanProcess` project and select **New** &gt; **Other**.
1. Expand the **Web** folder, select **HTML**, and click **Next**.
1. In the New HTML dialog box, type `index.html` for the filename and then click **Finish**.

>[!NOTE]
>
>For information about creating HTML content that invokes the SubmitXML Java servlet, see [Create the web page for the web application](invoking-human-centric-long-lived.md#create-the-web-page-for-the-web-application).

### Create Java application logic for the servlet {#create-java-application-logic-for-the-servlet}

Create Java application logic that invokes the `FirstAppSolution/PreLoanProcess` process from within the Java servlet. The following code shows the syntax of the `SubmitXML` Java Servlet:

```java
     public class SubmitXML extends HttpServlet implements Servlet {
         public void doGet(HttpServletRequest req, HttpServletResponse resp
         throws ServletException, IOException {
         doPost(req,resp);
 
         }
         public void doPost(HttpServletRequest req, HttpServletResponse resp
         throws ServletException, IOException {
             //Add code here to invoke the FirstAppSolution/PreLoanProcess process
             }
```

Normally, you would not place client code within a Java servlet’s `doGet` or `doPost` method. A better programming practice is to place this code within a separate class. Then instantiate the class from within the `doPost` method (or `doGet` method), and call the appropriate methods. However, for code brevity, code examples are kept to a minimum and are placed in the `doPost` method.

To invoke the `FirstAppSolution/PreLoanProcess` process using the Invocation API, perform the following tasks:

1. Include client JAR files, such as adobe-livecycle-client.jar, in your Java project’s class path. For information about the location of these files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).
1. Retrieve the name, phone, and amount values that is submitted from the HTML page. Use these values to dynamically create an XML data source that is sent to the `FirstAppSolution/PreLoanProcess` process. You can use `org.w3c.dom` classes to create the XML data source (this application logic is shown in the following code example).
1. Create a `ServiceClientFactory` object that contains connection properties. (See [Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties).)
1. Create a `ServiceClient` object by using its constructor and passing the `ServiceClientFactory` object. A `ServiceClient` object lets you invoke a service operation. It handles tasks such as locating, dispatching, and routing invocation requests.
1. Create a `java.util.HashMap` object by using its constructor.
1. Invoke the `java.util.HashMap` object’s `put` method for each input parameter to pass to the long-lived process. Ensure that you specify the name of the process’s input parameters. Because the `FirstAppSolution/PreLoanProcess` process requires one input parameter of type `XML` (named `formData`), you only have to invoke the `put` method once.

   ```java
    //Get the XML to pass to the FirstAppSolution/PreLoanProcess process
    org.w3c.dom.Document inXML = GetDataSource(name,phone,amount);
    
    //Create a Map object to store the parameter value
    Map params = new HashMap();
    params.put("formData", inXML);
   ```

1. Create an `InvocationRequest` object by invoking the `ServiceClientFactory` object’s `createInvocationRequest` method and passing the following values:

    * A string value that specifies the name of the long-lived process to invoke. To invoke the `FirstAppSolution/PreLoanProcess` process, specify `FirstAppSolution/PreLoanProcess`.
    * A string value that represents the process operation name. The name of the long-lived process operation is `invoke`.
    * The `java.util.HashMap` object that contains the parameter values that the service operation requires.
    * A Boolean value that specifies `false`, which creates an asynchronous request (this value is applicable to invoke a long-lived process).

   >[!NOTE]
   >
   >*A short-lived process can be invoked by passing the value true as the fourth parameter of the createInvocationRequest method. Passing the value true creates a synchronous request.*

1. Send the invocation request to AEM Forms by invoking the `ServiceClient` object’s `invoke` method and passing the `InvocationRequest` object. The `invoke` method returns an `InvocationReponse` object.
1. A long-lived process returns a string value that represents an invocation identification value. Retrieve this value by invoking the `InvocationReponse` object’s `getInvocationId` method.

   ```java
    //Send the invocation request to the long-lived process and
    //get back an invocation response object
    InvocationResponse lcResponse = myServiceClient.invoke(lcRequest);
    String invocationId = lcResponse.getInvocationId();
   ```

1. Write the invocation identification value to the client web browser. You can use a `java.io.PrintWriter` instance to write this value to the client web browser.

### Quick Start: Invoking a long-lived process using the Invocation API {#quick-start-invoking-a-long-lived-process-using-the-invocation-api}

The following Java code example represents the Java servlet that invokes the `FirstAppSolution/PreLoanProcess` process.

```java
 /*
     * This Java Quick Start uses the following JAR files
     * 1. adobe-livecycle-client.jar
     * 2. adobe-usermanager-client.jar
     *
     * (Because this  quick start is implemented as a Java servlet, it is
     * not necessary to include J2EE specific JAR files - the Java project
     * that contains this quick start is exported as a WAR file which
     * is deployed to the J2EE application server)
     *
     * These JAR files are in the following path:
     * <install directory>/sdk/client-libs/common
     *
     * For complete details about the location of these JAR files,
     * see "Including AEM Forms library files" in Programming with AEM forms
     * */
 import java.io.ByteArrayOutputStream;
 import java.io.File;
 import java.io.IOException;
 import java.io.PrintWriter;
 
 import javax.servlet.ServletException;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import java.util.*;
 import com.adobe.idp.dsc.clientsdk.ServiceClientFactory;
 import com.adobe.idp.dsc.clientsdk.ServiceClientFactoryProperties;
 import javax.xml.parsers.DocumentBuilder;
 import javax.xml.parsers.DocumentBuilderFactory;
 import javax.xml.transform.Transformer;
 import javax.xml.transform.TransformerFactory;
 import javax.xml.transform.dom.DOMSource;
 import javax.xml.transform.stream.StreamResult;
 
 import com.adobe.idp.dsc.InvocationRequest;
 import com.adobe.idp.dsc.InvocationResponse;
 import com.adobe.idp.dsc.clientsdk.ServiceClient;
 import org.w3c.dom.Element;
 
     public class SubmitXML extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
       static final long serialVersionUID = 1L;
 
        public SubmitXML() {
         super();
     }
 
 
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // TODO Auto-generated method stub
         doPost(request,response);
     }
 
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
         try{
             //Set connection properties required to invoke AEM Forms
             Properties connectionProps = new Properties();
             connectionProps.setProperty(ServiceClientFactoryProperties.DSC_DEFAULT_EJB_ENDPOINT, "jnp://localhost:1099");
             connectionProps.setProperty(ServiceClientFactoryProperties.DSC_TRANSPORT_PROTOCOL,ServiceClientFactoryProperties.DSC_EJB_PROTOCOL);
             connectionProps.setProperty(ServiceClientFactoryProperties.DSC_SERVER_TYPE, "JBoss");
             connectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_USERNAME, "administrator");
             connectionProps.setProperty(ServiceClientFactoryProperties.DSC_CREDENTIAL_PASSWORD, "password");
 
             //Create a ServiceClientFactory object
             ServiceClientFactory myFactory = ServiceClientFactory.createInstance(connectionProps);
 
             //Create a ServiceClient object
             ServiceClient myServiceClient = myFactory.getServiceClient();
 
             //Get the values that are passed from the Loan HTML page
             String name = (String)request.getParameter("name");
             String phone = (String)request.getParameter("phone");
             String amount = (String)request.getParameter("amount");
 
             //Create XML to pass to the FirstAppSolution/PreLoanProcess process
             org.w3c.dom.Document inXML = GetDataSource(name,phone,amount);
 
             //Create a Map object to store the XML input parameter value
             Map params = new HashMap();
             params.put("formData", inXML);
 
             //Create an InvocationRequest object
             InvocationRequest lcRequest =  myFactory.createInvocationRequest(
                 "FirstAppSolution/PreLoanProcess", //Specify the long-lived process name
                     "invoke",           //Specify the operation name
                     params,               //Specify input values
                     false);               //Create an asynchronous request
 
             //Send the invocation request to the long-lived process and
             //get back an invocation response object
             InvocationResponse lcResponse = myServiceClient.invoke(lcRequest);
             String invocationId = lcResponse.getInvocationId();
 
             //Create a PrintWriter instance
             PrintWriter pp = response.getWriter();
 
             //Write the invocation identifier value back to the client web browser
             pp.println("The job status identifier value is: " +invocationId);
 
         }catch (Exception e) {
              System.out.println("The following exception occurred: "+e.getMessage());
       }
     }
 
 
      //Create XML data to pass to the long-lived process
      private static org.w3c.dom.Document GetDataSource(String name, String phone, String amount)
      {
             org.w3c.dom.Document document = null;
 
             try
             {
                 //Create DocumentBuilderFactory and DocumentBuilder objects
                 DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                 DocumentBuilder builder = factory.newDocumentBuilder();
 
                 //Create a Document object
                 document = builder.newDocument();
 
                 //Create MortgageApp - the root element in the XML
                 Element root = (Element)document.createElement("LoanApp");
                 document.appendChild(root);
 
                 //Create an XML element for Name
                 Element nameElement = (Element)document.createElement("Name");
                 nameElement.appendChild(document.createTextNode(name));
                 root.appendChild(nameElement);
 
                 //Create an XML element for Phone
                 Element phoneElement = (Element)document.createElement("PhoneOrEmail");
                 phoneElement.appendChild(document.createTextNode(phone));
                 root.appendChild(phoneElement);
 
                 //Create an XML element for amount
                 Element loanElement = (Element)document.createElement("LoanAmount");
                 loanElement.appendChild(document.createTextNode(amount));
                 root.appendChild(loanElement);
 
                 //Create an XML element for ApprovalStatus
                 Element approveElement = (Element)document.createElement("ApprovalStatus");
                 approveElement.appendChild(document.createTextNode("PENDING APPROVAL"));
                 root.appendChild(approveElement);
 
               }
          catch (Exception e) {
                   System.out.println("The following exception occurred: "+e.getMessage());
                }
         return document;
          }
         }
```

### Create the web page for the web application {#create-the-web-page-for-the-web-application}

The *index.html* web page provides an entry point to the Java servlet that invokes the `FirstAppSolution/PreLoanProcess` process. This web page is a basic HTML form that contains an HTML form and a submit button. When the user clicks the submit button, form data is posted to the `SubmitXML` Java servlet.

The Java servlet captures the data that is posted from the HTML page by using the following Java code:

```java
 //Get the values that are passed from the Loan HTML page
 String name = request.getParameter("name");
 String phone = request.getParameter("phone");
 String amount = request.getParameter("amount");
```

The following HTML code represents the index.html file that was created during setup of the development environment. (See [Create a web project](invoking-human-centric-long-lived.md#create-a-web-project).)

```xml
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Insert title here</title>
 </head>
 <body>
 <table>
     <TBODY>
         <TR>
             <td><img src="financeCorpLogo.jpg" width="172" height="62"></TD>
             <td><FONT size="+2"><strong>Java Loan Application Page</strong></FONT></TD>
             <td> </TD>
             <td> </TD>
         </TR>
 
     </TBODY>
 </TABLE>
     <FORM action="https://hiro-xp:8080/PreLoanProcess/SubmitXML" method="post">
        <table>
          <TBODY>
                <TR>
                      <td><LABEL for="name">Name: </LABEL></TD>
                  <td><INPUT type="text" name="name"></TD>
                  <td><input type="submit" value="Submit Application"></TD>
                  </TR>
            <TR>
                  <td> <LABEL for="phone">Phone/Email: </LABEL></TD>
              <td><INPUT type="text" name="phone"></TD>
                  <td></TD>
              </TR>
 
            <TR>
                  <td><LABEL for="amount">Amount: </LABEL></TD>
              <td><INPUT type="text" name="amount"></TD>
                 <td></TD>
             </TR>
          </TBODY>
 </TABLE>
       </FORM>
 </body>
 </html>
```

### Package the web application to a WAR file {#package-the-web-application-to-a-war-file}

To deploy the Java servlet that invokes the `FirstAppSolution/PreLoanProcess` process, package your web application to a WAR file. Ensure that external JAR files that the component’s business logic depends on, such as adobe-livecycle-client.jar and adobe-usermanager-client.jar, are also included in the WAR file.

The following illustration shows the Eclipse project’s content, which is packaged to a WAR file.

>[!NOTE]
>
>In the previous illustration, the JPG file can be replaced by any JPG image file.

**Package a web application to a WAR file:**

1. From the **Project Explorer** window, right-click the `InvokePreLoanProcess` project and select **Export** &gt; **WAR file**.
1. In the **Web module** text box, type `InvokePreLoanProcess` for the name of the Java project.
1. In the **Destination** text box, type `PreLoanProcess.war`**for the**filename, specify the location for your WAR file, and then click Finish.

### Deploy the WAR file to the J2EE application server hosting AEM Forms {#deploy-the-war-file-to-the-j2ee-application-server-hosting-aem-forms}

Deploy the WAR file to the J2EE application server on which AEM Forms is deployed. To deploy the WAR file to the J2EE application server, copy the WAR file from the export path to `[AEM Forms Install]\Adobe\Adobe Experience Manager Forms\jboss\server\lc_turnkey\deploy`.

>[!NOTE]
>
>if AEM Forms is not deployed on JBoss, then you must deploy the WAR file in compliance with the J2EE application server hosting AEM Forms.

### Test your web application {#test-your-web-application}

After you deploy the web application, you can test it by using a web browser. Assuming that you are using the same computer that is hosting AEM Forms, you can specify the following URL:

* http://localhost:8080/PreLoanProcess/index.html

  Enter values into the HTML form fields and click the Submit Application button. If problems occur, see the J2EE application server’s log file.

>[!NOTE]
>
>To confirm that the Java application invoked the process, start Workspace and accept the loan.

## Creating an ASP.NET web application that invokes a human-centric long-lived process {#creating-an-asp-net-web-application-that-invokes-a-human-centric-long-lived-process}

You can create an ASP.NET application that invokes the `FirstAppSolution/PreLoanProcess` process. To invoke this process from an ASP.NET application, use web services. (See [Invoking AEM Forms using Web Services](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-web-services).)

The following illustration shows an ASP.NET client application obtaining data from an end user. The data is placed into an XML data source and sent to the `FirstAppSolution/PreLoanProcess` process when the user clicks the Submit Application button.

Notice after the process is invoked, an invocation identifier value is displayed. An invocation identifier value is created as part of a record that tracks the status of the long-lived process.

The ASP.NET application performs the following tasks:

* Retrieves the values that the user entered into the web page.
* Dynamically creates an XML data source that is passed to the* FirstAppSolution/PreLoanProcess *process. The three values are specified in the XML data source.
* Invokes the* FirstAppSolution/PreLoanProcess *process by using the web services.
* Returns the invocation identifier value and the status of the long-lived operation to the client web browser.

### Summary of steps {#summary_of_steps-1}

To create an ASP.NET application that is able to invoke the FirstAppSolution/PreLoanProcess process, perform the following steps:

1. [Create an ASP.NET web application](invoking-human-centric-long-lived.md#create-an-asp-net-web-application).
1. [Create an ASP page that invokes FirstAppSolution/PreLoanProcess](invoking-human-centric-long-lived.md#create-an-asp-page-that-invokes-firstappsolution-preloanprocess).
1. [Run the ASP.NET application](invoking-human-centric-long-lived.md#run-the-asp-net-application).

### Create an ASP.NET web application {#create-an-asp-net-web-application}

Create a Microsoft .NET C# ASP.NET Web application. The following illustration shows the contents of the ASP.NET project named *InvokePreLoanProcess*.

Notice under Service References, there are two items. The first item is named* JobManager*. This reference enables the ASP.NET application to invoke the Job Manager service. This service returns information about the status of a long-lived process. For example, if the process is currently running, then this service returns a numeric value that specifies the process is currently running. The second reference is named*PreLoanProcess*. This service reference represents the reference to the* FirstAppSolution/PreLoanProcess *process. After you create a Service Reference, data types associated with the AEM Forms service are available for use within your .NET project.

**Create a ASP.NET project:**

1. Start Microsoft Visual Studio 2008.
1. From the **File** menu, select **New**, **Web Site**.
1. In the **Templates** list, select **ASP.NET Web Site**.
1. In the **Location** box, select a location for your project. Name your project *InvokePreLoanProcess*.
1. In the **Language** box, select Visual C#
1. Click OK.

**Add service references:**

1. In the Project menu, select **Add Service Reference**.
1. In the **Address** dialog box, specify the WSDL to the Job Manager service.

   ```java
    https://hiro-xp:8080/soap/services/JobManager?WSDL&lc_version=9.0.1
   ```

1. In the Namespace field, type `JobManager`.
1. Click **Go **and then click** OK**.
1. In the **Project** menu, select **Add Service Reference**.
1. In the **Address** dialog box, specify the WSDL to the FirstAppSolution/PreLoanProcess process.

   ```java
    https://hiro-xp:8080/soap/services/FirstAppSolution/PreLoanProcess?WSDL&lc_version=9.0.1
   ```

1. In the Namespace field, type `PreLoanProcess`.
1. Click **Go **and then click** OK**.

>[!NOTE]
>
>Replace `hiro-xp` with the IP address of the J2EE application server hosting AEM Forms. The `lc_version` option ensures that AEM Forms functionality, such as MTOM, is available. Without specifying the `lc_version`option, you cannot invoke AEM Forms using MTOM. (See [Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom).)

### Create an ASP page that invokes FirstAppSolution/PreLoanProcess {#create-an-asp-page-that-invokes-firstappsolution-preloanprocess}

Within the ASP.NET project, add a web form (an ASPX file) that is responsible for displaying an HTML page to the loan applicant. The web form is based on a class that is derived from `System.Web.UI.Page`. The C# application logic that invokes `FirstAppSolution/PreLoanProcess` is in the `Button1_Click` method (this button represents the Submit Application button).

The following illustration shows the ASP.NET application

The following table lists the controls that are part of this ASP.NET application.

<table>
 <thead>
  <tr>
   <th><p>Control name</p></th>
   <th><p>Description</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p>TextBoxName</p></td>
   <td><p>Specifies the customer’s first and last name. </p></td>
  </tr>
  <tr>
   <td><p>TextBoxPhone</p></td>
   <td><p>Specifies the customer’s phone or email address. </p></td>
  </tr>
  <tr>
   <td><p>TextBoxAmount</p></td>
   <td><p>Specifies the loan amount.</p></td>
  </tr>
  <tr>
   <td><p>Button1</p></td>
   <td><p>Represents the Submit Application button.</p></td>
  </tr>
  <tr>
   <td><p>LabelJobID</p></td>
   <td><p>A Label control that specifies the value of the invocation identifier value.</p></td>
  </tr>
  <tr>
   <td><p>LabelStatus</p></td>
   <td><p>A Label control that specifies the value of the job status. This value is retrieved by invoking the Job Manager service. </p></td>
  </tr>
 </tbody>
</table>

The application logic that is part of the ASP.NET application must dynamically create an XML data source to pass to the `FirstAppSolution/PreLoanProcess` process. The values that the applicant entered into the HTML page must be specified within the XML data source. These data values are merged into the form when the form is viewed in Workspace. The classes in the `System.Xml` namespace are used to create the XML data source.

When invoking a process that requires XML data from an ASP.NET application, an XML data type is available for you to use. That is, you cannot pass a `System.Xml.XmlDocument` instance to the process. The fully qualified name of this XML instance to pass to the process is `InvokePreLoanProcess.PreLoanProcess.XML`. Convert the `System.Xml.XmlDocument` instance to `InvokePreLoanProcess.PreLoanProcess.XML`. You can perform this task by using the following code.

```java
 //Create the XML to pass to the FirstAppSolution/PreLoanProcess process
 XmlDocument myXML = CreateXML(userName, phone, amount);
 
 //Convert the XML to a InvokePreLoanProcess.PreLoanProcess.XML instance
 StringWriter sw = new StringWriter();
 XmlTextWriter xw = new XmlTextWriter(sw);
 myXML.WriteTo(xw);
 
 InvokePreLoanProcess.PreLoanProcess.XML inXML = new XML();
 inXML.document = sw.ToString();
```

To create an ASP page that invokes the `FirstAppSolution/PreLoanProcess` process, perform the following tasks in the `Button1_Click` method:

1. Create a `FirstAppSolution_PreLoanProcessClient` object by using its default constructor.
1. Create a `FirstAppSolution_PreLoanProcessClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service and the encoding type:

   ```java
    https://hiro-xp:8080/soap/services/FirstAppSolution/PreLoanProcess?blob=mtom
   ```

   You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference. However, ensure that you specify `?blob=mtom`.

   >[!NOTE]
   >
   >Replace `hiro-xp`* with the IP address of the J2EE application server hosting AEM Forms. *

1. Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `FirstAppSolution_PreLoanProcessClient.Endpoint.Binding` data member. Cast the return value to `BasicHttpBinding`.
1. Set the `System.ServiceModel.BasicHttpBinding` object’s `MessageEncoding` data member to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
1. Enable basic HTTP authentication by performing the following tasks:

    * Assign the AEM forms user name to the data member `FirstAppSolution_PreLoanProcessClient.ClientCredentials.UserName.UserName`.
    * Assign the corresponding password value to the data member `FirstAppSolution_PreLoanProcessClient.ClientCredentials.UserName.Password`.
    * Assign the constant value `HttpClientCredentialType.Basic` to the data member `BasicHttpBindingSecurity.Transport.ClientCredentialType`.
    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the data member `BasicHttpBindingSecurity.Security.Mode`.

   The following code example shows these tasks.

   ```as3
    //Enable BASIC HTTP authentication
    BasicHttpBinding b = (BasicHttpBinding)mortgageClient.Endpoint.Binding;
    b.MessageEncoding = WSMessageEncoding.Mtom;
    mortgageClient.ClientCredentials.UserName.UserName = "administrator";
    mortgageClient.ClientCredentials.UserName.Password = "password";
    b.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
    b.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
    b.MaxReceivedMessageSize = 2000000;
    b.MaxBufferSize = 2000000;
    b.ReaderQuotas.MaxArrayLength = 2000000;
   ```

1. Retrieve the name, phone, and amount values that the user entered into the web page. Use these values to dynamically create an XML data source that is sent to the `FirstAppSolution/PreLoanProcess` process. Create a `System.Xml.XmlDocument` that represents the XML data source to pass to the process (this application logic is shown in the following code example).
1. Convert the `System.Xml.XmlDocument` instance to `InvokePreLoanProcess.PreLoanProcess.XML` (this application logic is shown in the following code example).
1. Invoke the `FirstAppSolution/PreLoanProcess` process by invoking the `FirstAppSolution_PreLoanProcessClient` object’s `invoke_Async` method. This method returns a string value that represents the invocation identifier value of the long-lived process.
1. Create a `JobManagerClient` by using is constructor. (Ensure that you have set a service reference to the Job Manager service.)
1. Repeat steps 1-5. Specify the following URL for step 2: `https://hiro-xp:8080/soap/services/JobManager?blob=mtom`.
1. Create a `JobId` object by using its constructor.
1. Set the `JobId` object's `id` data member with the return value of the `FirstAppSolution_PreLoanProcessClient` object’s `invoke_Async` method.
1. Assign the `value` true to the `JobId` object's `persistent` data member.
1. Create a `JobStatus` object by invoking the `JobManagerService` object 's `getStatus` method and passing the `JobId` object.
1. Get the status value by retrieving the value of the `JobStatus` object's `statusCode` data member.
1. Assign the invocation identifier value to the `LabelJobID.Text` field.
1. Assign the status value to the `LabelStatus.Text` field.

### Quick Start: Invoking a long-lived process using the web service API {#quick-start-invoking-a-long-lived-process-using-the-web-service-api}

The following C# code example invokes the `FirstAppSolution/PreLoanProcess`process.

```csharp
 ???/**
     * Ensure that you create a .NET project that uses
     * MS Visual Studio 2008 and version 3.5 of the .NET
     * framework. This is required to invoke a
     * AEM Forms service using MTOM.
 
 
 using System;
 using System.Collections;
 using System.Configuration;
 using System.Data;
 using System.Linq;
 using System.Web;
 using System.ServiceModel;
 using System.Web.Security;
 using System.Web.UI;
 using System.Web.UI.HtmlControls;
 using System.Web.UI.WebControls;
 using System.Web.UI.WebControls.WebParts;
 using System.Xml.Linq;
 using System.Xml;
 using System.IO;
 
 //A reference to FirstAppSolution/PreLoanProcess
 using InvokePreLoanProcess.PreLoanProcess;
 
 //A reference to JobManager service
 using InvokePreLoanProcess.JobManager;
 
 
 namespace InvokePreLoanProcess
 {
        public partial class _Default : System.Web.UI.Page
        {
            //This method is called when the Submit Application button is
            //Clicked
            protected void Button1_Click(object sender, EventArgs e)
            {
                //Create a FirstAppSolution_PreLoanProcessClient object
                FirstAppSolution_PreLoanProcessClient mortgageClient = new FirstAppSolution_PreLoanProcessClient();
                mortgageClient.Endpoint.Address = new System.ServiceModel.EndpointAddress("https://hiro-xp:8080/soap/services/FirstAppSolution/PreLoanProcess?blob=mtom");
 
                //Enable BASIC HTTP authentication
                BasicHttpBinding b = (BasicHttpBinding)mortgageClient.Endpoint.Binding;
                b.MessageEncoding = WSMessageEncoding.Mtom;
                mortgageClient.ClientCredentials.UserName.UserName = "administrator";
                mortgageClient.ClientCredentials.UserName.Password = "password";
                b.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
                b.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
                b.MaxReceivedMessageSize = 2000000;
                b.MaxBufferSize = 2000000;
                b.ReaderQuotas.MaxArrayLength = 2000000;
 
                //Retrieve values that user entered into the web page
                String userName = TextBoxName.Text;
                String phone = TextBoxPhone.Text;
                String amount = TextBoxAmount.Text;
 
                //Create the XML to pass to the FirstAppSolution/PreLoanProcess process
                XmlDocument myXML = CreateXML(userName, phone, amount);
 
                StringWriter sw = new StringWriter();
                XmlTextWriter xw = new XmlTextWriter(sw);
                myXML.WriteTo(xw);
 
                InvokePreLoanProcess.PreLoanProcess.XML inXML = new XML();
                inXML.document = sw.ToString();
 
                //INvoke the FirstAppSolution/PreLoanProcess process
                String invocationID =  mortgageClient.invoke_Async(inXML);
 
                //Create a JobManagerClient object to obtain the status of the long-lived operation
                JobManagerClient jobManager = new JobManagerClient();
                jobManager.Endpoint.Address = new System.ServiceModel.EndpointAddress("https://hiro-xp:8080/soap/services/JobManager?blob=mtom");
 
                //Enable BASIC HTTP authentication
                BasicHttpBinding b1 = (BasicHttpBinding)jobManager.Endpoint.Binding;
                b1.MessageEncoding = WSMessageEncoding.Mtom;
                jobManager.ClientCredentials.UserName.UserName = "administrator";
                jobManager.ClientCredentials.UserName.Password = "password";
                b1.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;
                b1.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
                b1.MaxReceivedMessageSize = 2000000;
                b1.MaxBufferSize = 2000000;
                b1.ReaderQuotas.MaxArrayLength = 2000000;
 
 
                //Create a JobID object that represents the status of the
                //long-lived operation
                JobId jobId = new JobId();
                jobId.id = invocationID;
                jobId.persistent = true;
                JobStatus jobStatus = jobManager.getStatus(jobId);
                System.Int16 val2 = jobStatus.statusCode;
                LabelJobID.Text = "The job status identifier value is " + invocationID;
                LabelStatus.Text = "The status of the long-lived operation is " + getJobDescription(val2);
 
            }
 
            private static XmlDocument CreateXML(String name, String phone, String amount)
            {
                //This method dynamically creates a DDX document
                //to pass to the FirstAppSolution/PreLoanProcess process
                XmlDocument xmlDoc = new XmlDocument();
 
                //Create the root element and append it to the XML DOM
                System.Xml.XmlElement root = xmlDoc.CreateElement("LoanApp");
                xmlDoc.AppendChild(root);
 
                //Create the Name element
                XmlElement nameElement = xmlDoc.CreateElement("Name");
                nameElement.AppendChild(xmlDoc.CreateTextNode(name));
                root.AppendChild(nameElement);
 
                //Create the LoanAmount element
                XmlElement LoanAmount = xmlDoc.CreateElement("LoanAmount");
                LoanAmount.AppendChild(xmlDoc.CreateTextNode(amount));
                root.AppendChild(LoanAmount);
 
                //Create the PhoneOrEmail element
                XmlElement PhoneOrEmail = xmlDoc.CreateElement("PhoneOrEmail");
                PhoneOrEmail.AppendChild(xmlDoc.CreateTextNode(phone));
                root.AppendChild(PhoneOrEmail);
 
                //Create the ApprovalStatus element
                XmlElement ApprovalStatus = xmlDoc.CreateElement("ApprovalStatus");
                ApprovalStatus.AppendChild(xmlDoc.CreateTextNode("PENDING APPROVAL"));
                root.AppendChild(ApprovalStatus);
 
                //Return the XmlElement instance
                return xmlDoc;
            }
 
 
            //Returns the String value of the Job Manager status code
            private String getJobDescription(int val)
            {
                switch(val)
                {
                    case 0:
                        return "JOB_STATUS_UNKNOWN";
 
                    case 1:
                        return "JOB_STATUS_QUEUED";
 
                    case 2:
                        return "JOB_STATUS_RUNNING";
 
                    case 3:
                        return "JOB_STATUS_COMPLETED";
 
                    case 4:
                        return "JOB_STATUS_FAILED";
 
                     case 5:
                        return "JOB_STATUS_COMPLETED";
 
                    case 6:
                        return "JOB_STATUS_SUSPENDED";
 
                    case 7:
                        return "JOB_STATUS_COMPLETE_REQUESTED";
 
                    case 8:
                        return "JOB_STATUS_TERMINATE_REQUESTED";
 
                     case 9:
                        return "JOB_STATUS_SUSPEND_REQUESTED";
 
                       case 10:
                        return "JOB_STATUS_RESUME_REQUESTED";
                }
 
                return "";
            }
       }
 }
 
```

>[!NOTE]
>
>The values in the getJobDescription user-defined method correspond to values returned by the Job Manager service.

### Run the ASP.NET application {#run-the-asp-net-application}

After you compile and deploy your ASP.NET application, you can execute it using a web browser. Assuming the name of the ASP.NET project is *InvokePreLoanProcess*, specify the following URL within a web browser:

*http://localhost:1629/InvokePreLoanProcess/*Default.aspx

where localhost is the name of the web server hosting the ASP.NET project and 1629 is the port number. When you compile and build your ASP.NET application, Microsoft Visual Studio, automatically deploys it.

>[!NOTE]
>
>To confirm that the ASP.NET application invoked the process, start Workspace and accept the loan.

## Creating a client application built with Flex that invokes a human-centric long-lived process {#creating-a-client-application-built-with-flex-that-invokes-a-human-centric-long-lived-process}

You can create a client application built with Flex to invoke the *FirstAppSolution/PreLoanProcess* process. This application uses Remoting to invoke the *FirstAppSolution/PreLoanProcess* process. (See [Invoking AEM Forms using (Deprecated for AEM forms) AEM Forms Remoting](/help/forms/developing/invoking-aem-forms-using-remoting.md#invoking-aem-forms-using-remoting).)

The following illustration shows a client application built with Flex collecting data from an end user. The data is placed into an XML data source and sent to the process.

Notice after the process is invoked, an invocation identifier value is displayed. An invocation identifier value is created as part of a record that tracks the status of the long-lived process.

The client application built with Flex performs the following tasks:

* Retrieves the values that the user entered into the web page.
* Dynamically creates an XML data source that is passed to the *FirstAppSolution/PreLoanProcess* process. The three values are specified in the XML data source.
* Invokes the *FirstAppSolution/PreLoanProcess* process by using Remoting.
* Returns the invocation identifier value of the long-lived process.

### Summary of steps {#summary_of_steps-2}

To create a client application built with Flex that is able to invoke the FirstAppSolution/PreLoanProcess process, perform the following steps:

1. Start a new Flex project.
1. Include the adobe-remoting-provider.swc file in your project’s class path. (See [Including the AEM Forms Flex library file](/help/forms/developing/invoking-aem-forms-using-remoting.md#including-the-aem-forms-flex-library-file).)
1. Create a `mx:RemoteObject` instance through either ActionScript or MXML. (See [Creating a mx:RemoteObject instance](/help/forms/developing/invoking-aem-forms-using-remoting.md))
1. Set up a `ChannelSet` instance to communicate with AEM Forms, and associate it with the `mx:RemoteObject` instance. (See [Create a Channel to AEM Forms](/help/forms/developing/invoking-aem-forms-using-remoting.md).)
1. Call the ChannelSet’s `login` method or the service’s `setCredentials` method to specify the user identifier value and password. (See [Using single sign-on](/help/forms/developing/invoking-aem-forms-using-remoting.md#using-single-sign-on).)
1. Create the XML data source to pass to the `FirstAppSolution/PreLoanProcess` process by creating an XML instance. (This application logic is shown in the following code example.)
1. Create an object of type Object by using its constructor. Assign the XML to the object by specifying the name of the process’s input parameter, as shown in the following code:

   ```csharp
    //Get the XML data to pass to the AEM Forms process
    var xml:XML = createXML();
    var params:Object = new Object();
    params["formData"]=xml;
   ```

1. Invoke the `FirstAppSolution/PreLoanProcess` process by calling the `mx:RemoteObject` instance’s `invoke_Async` method. Pass the `Object` that contains the input parameter. (See [Passing input values](/help/forms/developing/invoking-aem-forms-using-remoting.md).)
1. Retrieve the invocation identification value that is returned from a long-lived process, as shown in the following code:

   ```csharp
    // Handles async call that invokes the long-lived process
    private function resultHandler(event:ResultEvent):void
    {
    ji = event.result as JobId;
    jobStatusDisplay.text = "Job Status ID: " + ji.jobId as String;
    }
   ```

### Invoking a long-lived process using Remoting {#invoking-a-long-lived-process-using-remoting}

The following Flex code example invokes the `FirstAppSolution/PreLoanProcess` process.

```java
 <?xml version="1.0" encoding="utf-8"?>
 
 <mx:Application  xmlns="*" backgroundColor="#FFFFFF"
      creationComplete="initializeChannelSet();">
 
 <mx:Script>
          <![CDATA[
 
             import mx.controls.Alert;
             import mx.rpc.events.FaultEvent;
             import mx.rpc.events.ResultEvent;
             import flash.net.navigateToURL;
             import mx.messaging.ChannelSet;
             import mx.messaging.channels.AMFChannel;
             import mx.collections.ArrayCollection;
             import mx.rpc.livecycle.JobId;
             import mx.rpc.livecycle.JobStatus;
             import mx.rpc.livecycle.DocumentReference;
             import mx.formatters.NumberFormatter;
 
             // Holds the job ID returned by LC.JobManager
             private var ji:JobId;
 
             private function initializeChannelSet():void
              {
              var cs:ChannelSet= new ChannelSet();
         cs.addChannel(new AMFChannel("remoting-amf", "https://hiro-xp:8080/remoting/messagebroker/amf"));
         LC_MortgageApp.setCredentials("tblue", "password");
         LC_MortgageApp.channelSet = cs;
              }
 
            private function submitApplication():void
             {
             //Get the XML data to pass to the AEM Forms process
             var xml:XML = createXML();
             var params:Object = new Object();
             params["formData"]=xml;
             LC_MortgageApp.invoke_Async(params);
             }
 
             // Handles async call that invokes the long-lived process
             private function resultHandler(event:ResultEvent):void
             {
                ji = event.result as JobId;
                jobStatusDisplay.text = "Job Status ID: " + ji.jobId as String;
             }
 
             private function createXML():XML
             {
                //Calculate the Mortgage value to place in the XML data
                var propertyPrice:String = txtAmount.text ;
                var name:String = txtName.text ;
                var phone:String = txtPhone.text ;;
 
                var model:XML =
 
                  <LoanApp>
                           <Name>{name}</Name>
                           <LoanAmount>{propertyPrice}</LoanAmount>
                           <PhoneOrEmail>{phone}</PhoneOrEmail>
                           <ApprovalStatus>PENDING APPROVAL</ApprovalStatus>
                  </LoanApp>
 
              return model;
             }
 
 
          ]]>
       </mx:Script>
 
       <!-- Declare the RemoteObject and set its destination to the mortgage-app remoting endpoint defined in AEM Forms. -->
       <mx:RemoteObject id="LC_MortgageApp" destination="FirstAppSolution/PreLoanProcess" result="resultHandler(event);">
          <mx:method name="invoke_Async" result="resultHandler(event)"/>
      </mx:RemoteObject>
 
 
     <mx:Grid x="229" y="186">
         <mx:GridRow width="100%" height="100%">
             <mx:GridItem width="100%" height="100%">
                 <mx:Image>
                     <mx:source>file:///D|/LiveCycle_9/FirstApp/financeCorpLogo.jpg</mx:source>
                 </mx:Image>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
                 <mx:Label text="Flex Loan Application Page" fontSize="20"/>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
             </mx:GridItem>
         </mx:GridRow>
         <mx:GridRow width="100%" height="100%">
             <mx:GridItem width="100%" height="100%">
                 <mx:Label text="Name:" fontSize="12" fontWeight="bold"/>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
                 <mx:TextInput id="txtName"/>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
                 <mx:Button label="Submit Application" click="submitApplication()"/>
             </mx:GridItem>
         </mx:GridRow>
         <mx:GridRow width="100%" height="100%">
             <mx:GridItem width="100%" height="100%">
                 <mx:Label text="Phone/Email:" fontSize="12" fontWeight="bold"/>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
                 <mx:TextInput id="txtPhone"/>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
             </mx:GridItem>
         </mx:GridRow>
         <mx:GridRow width="100%" height="100%">
             <mx:GridItem width="100%" height="100%">
                 <mx:Label text="Amount:" fontSize="12" fontWeight="bold"/>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
                 <mx:TextInput id="txtAmount"/>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
             </mx:GridItem>
         </mx:GridRow>
         <mx:GridRow width="100%" height="100%">
             <mx:GridItem width="100%" height="100%">
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
                 <mx:Label text="Label" id="jobStatusDisplay" enabled="true" fontSize="12" fontWeight="bold"/>
             </mx:GridItem>
             <mx:GridItem width="100%" height="100%">
             </mx:GridItem>
         </mx:GridRow>
     </mx:Grid>
 
 </mx:Application>
 
```
