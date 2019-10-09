---
title: Use metadata in an email notification 
seo-title: Use metadata in an email notification 
description: Use metadata to populate information in a forms workflow email notification
seo-description: Use metadata to populate information in a forms workflow email notification
uuid: 17e018c9-6bf8-4042-bba9-4ebe449304ac
topic-tags: publish
discoiquuid: bdf13893-630a-43cd-aaeb-c7c16bf4f8a6
---

# Use metadata in an email notification  {#use-metadata-in-an-email-notification}

Use metadata to populate information in a forms workflow email notification

You can use the Assign Task step to create and assign tasks to a user or group. When a task is assigned to a user or group, an email notification is sent to the defined user or to each member of the defined group. A typical [email notification](/help/forms/using/use-custom-email-template-assign-task-step.md) contains link of the assigned task and information related to the task.

You can use metadata in an email template to dynamically populate information in an email notification. For example, the value of the title, description, due date, priority, workflow, and last date in the following email notification is selected dynamically at the runtime (when an email notification is generated). 

![default-email-template](assets/default-email-template.png)

Metadata is stored in key-value pairs. You can specify the key in the email template and the key is replaced with a value at the runtime (when an email notification is generated). For example, in the below code sample, "$ {workitem_title} " is a key. It is replaced with value “Loan-Request” at the runtime.

```xml
subject=Task Assigned - ${workitem_title}

message=<html><body>\n\
 <table>\n\
  <tbody>\n\
   <tr>\n\
    <td>\n\
      Sample Company\n\
    </td>\n\
   </tr>\n\
   <tr>\n\
    <td>\n\
     <pre style="font-size: 13px; font-family: Helvetica, Arial, sans-serif;  font-weight: normal; color: #323232;"> Hello ${workitem_assignee},\n\
 The following task has been assigned to you:</pre>\n\
    </td>\n\
   </tr>\n\
   <tr>\n\
    <td>\n\
     <table>\n\
      <tbody>\n\
       <tr style="border-bottom: solid 2px #FFFCF9;">\n\
        <td> TITLE</td>\n\
        <td>\n\
         <p>${workitem_title}</p>\n\
        </td>\n\
       </tr>\n\
                            <tr style="border-bottom: solid 2px #FFFCF9;">\n\
        <td> DESCRIPTION</td>\n\
        <td>\n\
         <p>${workitem_description}</p>\n\
        </td>\n\
       </tr>\n\
       <tr style="border-bottom: solid 2px #FFFCF9;">\n\
        <td> DUE DATE</td>\n\
        <td>\n\
         <p>${workitem_due_date}</p>\n\
        </td>\n\
       </tr>\n\
       <tr style="border-bottom: solid 2px #FFFCF9;">\n\
        <td> PRIORITY</td>\n\
        <td>\n\
         <p>${workitem_priority}</p>\n\
        </td>\n\
       </tr>\n\
       <tr>\n\
        <td> WORKFLOW</td>\n\
        <td>\n\
         <p>${workitem_workflow}</p>\n\
        </td>\n\
       </tr>\n\
      </tbody>\n\
     </table>\n\
    </td>\n\
   </tr>\n\
   <tr style = "text-align: center; vertical-align: middle;">\n\
    <td> \n\
     <a href="${workitem_url}" target="_blank" style="background-color: #1EBBBB; font-size: 18px; line-height: 25px; font-weight: bold; color: #FFFFFF; text-decoration: none; padding: 15px 15px 15px 15px;">Open Task</a>\n\
    </td>\n\
   </tr>\n\
   <tr>\n\
    <td>\n\
     <p><span style="font-size: 12px; font-weight: normal; font-style: italic; color: #919191;">This is an automatically generated email. Please do not reply to this email.</span></p>\n\
    </td>\n\
   </tr>\n\
  </tbody>\n\
 </table>\n\
</body>\n\
</html>\n\
```

## Using system generated metadata in an email notification {#using-system-generated-metadata-in-an-email-notification}

An AEM Forms application provides several metadata variables (key-value pairs) out of the box. You can use these variables in an email template. The value of the variable is based on the associated forms application. The following table lists all the metadata variables available out of the box:

<table> 
 <tbody> 
  <tr> 
   <td>Key</td> 
   <td>Description</td> 
  </tr> 
  <tr> 
   <td>workitem_title</td> 
   <td>Title of the associated forms application.</td> 
  </tr> 
  <tr> 
   <td>workitem_url</td> 
   <td>URL to access the associated forms application.</td> 
  </tr> 
  <tr> 
   <td>workitem_description</td> 
   <td>Description of the associated forms application.</td> 
  </tr> 
  <tr> 
   <td>workitem_priority</td> 
   <td>Priority specified for the associated forms application.</td> 
  </tr> 
  <tr> 
   <td>workitem_due_date</td> 
   <td>Last date to act on the associated forms application.</td> 
  </tr> 
  <tr> 
   <td>workitem_workflow</td> 
   <td>Name of the workflow associated with the forms application.</td> 
  </tr> 
  <tr> 
   <td>workitem_assign_timestamp</td> 
   <td>Date and time when the workflow item was assigned to the present assignee.</td> 
  </tr> 
  <tr> 
   <td>workitem_assignee</td> 
   <td>Name of the present assignee.</td> 
  </tr> 
  <tr> 
   <td>host_prefix</td> 
   <td>URL of the author server. For example, https://10.41.42.66:4502<br /> </td> 
  </tr> 
  <tr> 
   <td>publish_prefix</td> 
   <td>URL of the publish server. For example, https://10.41.42.66:4503</td> 
  </tr> 
 </tbody> 
</table>

## Using custom metadata in an email notification {#using-custom-metadata-in-an-email-notification}

You can also use custom metadata in an email notification. Custom metadata contains information in addition to system-generated metadata. For example, policy details retrieved from a database. You can use an ECMAScript or OSGi bundle to add custom metadata in crx-repository:

### Use ECMAScript to add custom metadata  {#use-ecmascript-to-add-custom-metadata}

[ECMAScript](https://en.wikipedia.org/wiki/ECMAScript) is a scripting language. It is used for client-side scripting and server applications. Perform the following steps to use ECMAScript to add custom metadata for an email template:

1. Log in to CRX DE with an administrative account. The URL is `https://[server]:[port]/crx/de/index.jsp`

1. Navigate to /apps/fd/dashboard/scripts/metadataScripts. Create a file with extension .ecma. For example, usermetadata.ecma

   If the above-mentioned path does not exist, create it. 

1. Add code to the .ecma file that has the logic to generate custom metadata in key-value pairs. For example, the following ECMAScript code generates custom metadata for an insurance policy:

   ```
   function getUserMetaData()  {
       //Commented lines below provide an overview on how to set user metadata in map and return it.
       var HashMap = Packages.java.util.HashMap;
       var valuesMap = new HashMap();
       valuesMap.put("policyNumber", "2017568972695");
       valuesMap.put("policyHolder", "Adobe Systems");
   
       return valuesMap;
   }
   
   ```

1. Click Save All. Now, the script is available for selection in AEM workflow model.

   ![assigntask-metadata](assets/assigntask-metadata.png)

1. (Optional) Specify the title of the script:

   If you do not specify the title, the Custom Metadata field displays the complete path of the ECMAScript file. Perform the following steps to specify a meaningful title for the script:

    1. Expand the script node, right-click the **[!UICONTROL jcr:content]** node, and click **[!UICONTROL Mixins]**.
    1. Type mix:title in Edit Mixins dialog and click **+**.
    1. Add a property with the following values.

       | Name |jcr:title |
       |---|---|
       | Type |String |
       | Value |Specify the title of the script. For example, custom metadata for the policy holder. The specified value is displayed in the assign task step. |

### Use an OSGi bundle and Java interface to add custom metadata {#use-an-osgi-bundle-and-java-interface-to-add-custom-metadata}

You can use the WorkitemUserMetadataService Java interface to add custom metadata for email templates. You can create an OSGi bundle that uses the WorkitemUserMetadataService Java interface and deploy it to the AEM Forms server. It makes the metadata available for selection in the Assign Task step.

To create an OSGi bundle with Java interface, add [AEM Forms Client SDK](https://helpx.adobe.com/aem-forms/kb/aem-forms-releases.html) jar and [granite jar](https://repo.adobe.com/nexus/content/groups/public/com/adobe/granite/com.adobe.granite.workflow.api/1.0.2/) files as external dependencies to the OSGi bundle project. You can use any Java IDE to create an OSGi bundle. The following procedure provides steps to use Eclipse to create an OSGi bundle:

1. Open Eclipse IDE. Navigate to File &gt; New Project.  

1. On the Select a wizard screen, select Maven Project, and click Next.  

1. On the New Maven project, keep defaults, and click Next. Select an archetype and click Next. For example, maven-archetype-quickstart. Specify Group Id, Artifact Id, version, and package for the project, and click Finish. The project is created.  

1. Open the pom.xml file for editing and replace all the contents of the file with the following:

   ```
   
   ```

1. Add source code that uses WorkitemUserMetadataService Java interface to add custom metadata for email templates. A sample code is listed below:

   ```java
   package com.aem.impl;
   
   import com.adobe.fd.workspace.service.external.WorkitemUserMetadataService;
   import org.apache.felix.scr.annotations.Component;
   import org.apache.felix.scr.annotations.Properties;
   import org.apache.felix.scr.annotations.Property;
   import org.apache.felix.scr.annotations.Service;
   import org.osgi.framework.Constants;
   
   import java.util.HashMap;
   import java.util.Map;
   
   @Component
   @Service
   @Properties({
           @Property(name = Constants.SERVICE_DESCRIPTION, value = "A sample implementation of a user metadata service."),
           @Property(name = WorkitemUserMetadataService.SERVICE_PROPERTY_LABEL, value = "Default User Metadata Service")})
   
   public class WorkitemUserMetadataServiceImpl
     implements WorkitemUserMetadataService
   {
     public WorkitemUserMetadataServiceImpl() {}
     
     public Map<String, String> getUserMetadataMap()
     {
       HashMap<String, String> metadataMap = null;
       metadataMap = new HashMap();
       metadataMap.put("test_metadata", "tested-interface implementation");
       return metadataMap;
     }
   }
   ```

1. Open a command prompt and navigate to the directory containing the OSGi bundle project. Use the following command to create the OSGi bundle:

   `mvn clean install`

1. Upload the bundle to an AEM Forms server. You can use AEM Package Manager to import the bundle to AEM Forms server.

After the bundle is imported, you can select the metadata in the Assign Task step and use it an email template. 
