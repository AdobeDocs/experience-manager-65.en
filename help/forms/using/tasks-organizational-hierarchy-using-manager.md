---
title: Managing tasks in an organizational hierarchy using Manager View
description: How managers and organization heads can access and work on the tasks of their direct and indirect reports in the To-do tab in AEM Forms workspace.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
docset: aem65
exl-id: e50974a7-01ac-4a08-bea2-df9cc975c69e
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: Admin, User, Developer
---
# Managing tasks in an organizational hierarchy using Manager View{#managing-tasks-in-an-organizational-hierarchy-using-manager-view}

In AEM Forms workspace, managers can now access the tasks assigned to anyone in their hierarchy—direct or indirect reports—and perform various actions on them. The tasks are available in the To-do tab in the AEM Forms workspace. The actions supported on the tasks of direct reports are:

**Forward** &ndash; Forward a task from direct report to any user.

**Claim** &ndash; Claim a task of a direct report.

**Claim & Open** &ndash; Claim a task of a direct report and automatically open it in the To-do list of the manager.

**Reject** &ndash; Reject a task forwarded to a direct report by some other user. This option is available for the tasks forwarded by other users to a direct report.

AEM Forms restricts a users' access to only those tasks for which the user has access control (ACL). Such a check ensures that a user can fetch only the tasks on which the user has access permissions. Using third-party web-services and implementations to define hierarchy, an organization can customize the definition of manager and direct reports to suit their needs.

1. Create a DSC. For more information, see 'Developing Components for AEM Forms' topic in [Programming with AEM Forms](https://www.adobe.com/go/learn_aemforms_programming_63) guide.
1. In the DSC, define a new SPI for hierarchy management to define direct reports and hierarchy within the AEM Forms users. Following is a sample Java&trade; code snippet.

   ```java
   public class MyHierarchyMgmtService
   {
        /*
       Input : Principal Oid for a livecycle user
       Output : Returns true when the user is either the service invoker OR his direct/indirect report.
       */
       boolean isInHierarchy(String principalOid) {

       }

       /*
       Input : Principal Oid for a livecycle user
       Output : List of principal Oids for direct reports of the livecycle user
       A user may get direct reports only for himself OR his direct/indirect reports.
       So the API is functionally equivalent to -
       isInHierarchy(principalOid) ? <return direct reports> : <return empty list>
       */
       List<String> getDirectReports(String principalOid) {

       }

       /*
       Returns whether a livecycle user has direct reports or not.
       It is functionally equivalent to -
       getDirectReports(principalOid).size()>0
       */
       boolean isManager(String principalOid) {

       }
   }
   ```

1. Create a component.xml file. Ensure that spec-id is the same as shown in code snippet below. The following is a sample code snippet that you can repurpose.

   ```xml
   <component xmlns="https://adobe.com/idp/dsc/component/document">
       <component-id>com.adobe.sample.SampleDSC</component-id>
       <version>1.1</version>
       <supports-export>false</supports-export>
         <descriptor-class>com.adobe.idp.dsc.component.impl.DefaultPOJODescriptorImpl</descriptor-class>
         <services>
           <service name="MyHierarchyMgmtService" title="My hierarchy management service" orchestrateable="false">
           <auto-deploy service-id="MyHierarchyMgmtService" category-id="Sample DSC" major-version="1" minor-version="0" />
           <description>Service for resolving hierarchy management.</description>
            <specifications>
            <specification spec-id="com.adobe.idp.taskmanager.dsc.enterprise.HierarchyManagementProvider"/>
            </specifications>
           <specification-version>1.0</specification-version>
           <implementation-class>com.adobe.sample.hierarchymanagement.MyHierarchyMgmtService</implementation-class>
           <request-processing-strategy>single_instance</request-processing-strategy>
           <supported-connectors>default</supported-connectors>
           <operation-config>
               <operation-name>*</operation-name>
               <transaction-type>Container</transaction-type>
               <transaction-propagation>supports</transaction-propagation>
               <!--transaction-timeout>3000</transaction-timeout-->
           </operation-config>
           <operations>
               <operation anonymous-access="true" name="isInHierarchy" method="isInHierarchy">
                   <input-parameter name="principalOid" type="java.lang.String" />
                   <output-parameter name="result" type="java.lang.Boolean"/>
               </operation>
               <operation anonymous-access="true" name="getDirectReports" method="getDirectReports">
                   <input-parameter name="principalOid" type="java.lang.String" />
                   <output-parameter name="result" type="java.util.List"/>
               </operation>
               <operation anonymous-access="true" name="isManager" method="isManager">
                   <input-parameter name="principalOid" type="java.lang.String" />
                   <output-parameter name="result" type="java.lang.Boolean"/>
               </operation>
               </operations>
               </service>
         </services>
   </component>
   ```

1. Deploy DSC through Workbench. Restart `ProcessManagementTeamTasksService` service.
1. You may have to refresh your browser or logout/login with the user again.

The following screen illustrates accessing the tasks of direct reports and the available actions.

![cu_manager_view](assets/cu_manager_view.png)

Access tasks of direct reports and act on the tasks
