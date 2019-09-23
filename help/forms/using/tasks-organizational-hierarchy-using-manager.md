---
title: Managing tasks in an organizational hierarchy using Manager View
seo-title: Managing tasks in an organizational hierarchy using Manager View
description: How managers and organization heads can access and work on the tasks of their direct and indirect reports in the To-do tab in AEM Forms workspace.
seo-description: How managers and organization heads can access and work on the tasks of their direct and indirect reports in the To-do tab in AEM Forms workspace.
uuid: 85c55e0f-834d-4c2e-b068-6c29cd4dfc11
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
discoiquuid: 33548fb4-eeff-493c-ba04-f557f43ffb78
index: y
internal: n
snippet: y
---

# Managing tasks in an organizational hierarchy using Manager View{#managing-tasks-in-an-organizational-hierarchy-using-manager-view}

In AEM Forms workspace, managers can now access the tasks assigned to anyone in their hierarchy—direct or indirect reports—and perform various actions on them. The tasks are available in the To-do tab in the AEM Forms workspace. The actions supported on the tasks of direct reports are:

**Forward** Forward a task from direct report to any user.

**Claim** Claim a task of a direct report.

**Claim & Open** Claim a task of a direct report and automatically open it in the To-do list of the manager.

**Reject** Reject a task forwarded to a direct report by some other user. This option is available for the tasks forwarded by other users to a direct report.

AEM Forms restricts a users' access to only those tasks for which the user has access control (ACL). Such a check ensures that a user can fetch only the tasks on which the user has access permissions. Using third-party web-services and implementations to define hierarchy, an organization can customize the definition of manager and direct reports to suit their needs.

1. Create a DSC. For more information, see 'Developing Components for AEM Forms' topic in [Programming with AEM Forms](http://www.adobe.com/go/learn_aemforms_programming_63) guide.
1. In the DSC, define a new SPI for hierarchy management to define direct reports and hierarchy within the AEM Forms users. Following is a sample Java™ code snippet.

   ```as3
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
       It's functionally equivalent to -
       getDirectReports(principalOid).size()>0
       */
       boolean isManager(String principalOid) {
   
       }  
   }
   ```

1. Create a component.xml file. Please ensure that spec-id must be same as shown in code snippet below. Following is a sample code snippet that you can repurpose.

   ```as3
   <component xmlns="http://adobe.com/idp/dsc/component/document"> 
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

![](assets/cu_manager_view.png)

Access tasks of direct reports and act on the tasks

[**Contact Support**](https://www.adobe.com/account/sign-in.supportportal.html)

<!--
<related-links>
<a href="../../forms/using/introduction-customizing-html-workspace.md">Introduction to Customizing AEM Forms workspace</a>
<a href="../../forms/using/generic-steps-html-workspace-customization.md">Generic steps for AEM Forms workspace customization</a>
<a href="../../forms/using/tasks-organizational-hierarchy-using-manager.md">Managing tasks in an organizational hierarchy using Manager View</a>
<a href="../../forms/using/integrating-correspondence-management-html-workspace.md">Integrating Correspondence Management in AEM Forms workspace</a>
<a href="/forms/using/single-sign-timeout-handlers.md">Single Sign On and timeout handlers</a>
<a href="/forms/using/displaying-user-avatar.md">Displaying the user avatar</a>
<a href="/forms/using/displaying-information-task-summary-pane.md">Displaying information in the Task Summary pane</a>
<a href="/forms/using/changing-organization-logo-branding.md">Changing the organization logo</a>
<a href="/forms/using/changing-color-scheme-interface.md">Changing the color scheme of the interface</a>
<a href="../../forms/using/changing-font-interface.md">Changing the font on the interface</a>
<a href="../../forms/using/changing-locale-user-interface.md">Changing the locale of the user interface</a>
<a href="/forms/using/customizing-error-dialogs.md">Customizing error dialogs</a>
<a href="/forms/using/customizing-tabs-task.md">Customizing tabs for a task</a>
<a href="/forms/using/customizing-task-actions.md">Customizing Task Actions</a>
<a href="/forms/using/customizing-listing-process-instances.md">Customizing the listing of process instances</a>
<a href="/forms/using/customizing-task-details-page.md">Customizing the task Details page</a>
<a href="../../forms/using/display-additional-data-in-todo-list.md">Displaying additional data in ToDo list</a>
<a href="/forms/using/getting-task-variables-summary-url.md">Getting Task Variables in Summary URL</a>
<a href="/forms/using/images-route-actions.md">Images for Route Actions</a>
<a href="../../forms/using/creating-new-login-screen.md">Creating a new login screen</a>
<a href="/forms/using/minification-javascript-files.md">Minification of the JavaScript files</a>
<a href="/forms/using/sorting-tracking-tables-add-columns.md">Sorting of Tracking tables and adding more columns</a>
<a href="/forms/using/updating-link-help-documentation.md">Updating the link to the documentation</a>
<a href="/forms/using/two-html-workspace-instances-one.md">Hosting two AEM Forms workspace instances on one server</a>
</related-links>
-->

