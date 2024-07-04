---
title: Logging in AEM Forms workflows
description: Learn how to debug AEM Forms Workflow issues and enable debug logging for AEM Forms workflows to view the logs.
contentOwner: anujkapo
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: publish
docset: aem65
exl-id: 601c8d95-0d1a-4945-a522-e85d3e9fc4ae
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Logging in AEM Forms workflows{#logging-in-aem-forms-workflows}

Forms Workflow steps provide detailed logs to debug workflow-related issues conveniently. Enable debug logging for AEM Forms workflows to view the logs.

By default, all logging information is available in the **error.log** file at the */crx-repository/logs/* directory.

The debug logs for forms workflows include:

* Entry of each workflow step. For example:  
  `[DEBUG] "Executing Invoke DDX Process step"`

* Exit of each workflow step. For example:  
  `[DEBUG] "Successfully finished Invoke DDX Process step"`  

* Service invocation messages. For example:  
  `[DEBUG] Invoking Adobe Sign Service for creating agreement`

* Service exit messages. For example:  
  `[DEBUG] Agreement created successfully with agreement id <agreement id>`

* Variables read from the metadata map. For example:  
  `[DEBUG] Successfully retrieved variable <variable name> from workflow meta data map`

* Variables written in JCR repository. For example:

  ```verilog
     [DEBUG] Successfully written variable <variable name> into meta data node at <JCR path where meta data is being written>
  ```

* Exception messages with complete stack trace. For example:  
  `[DEBUG] Exception in Adobe Sign Service <complete stack trace>`

* Dynamic step metadata parameters. For example:

  ```verilog
  [DEBUG] Document of Record to be generated for adaptive form <path of adaptive form>
   [DEBUG] Locale to be used for Document of Record is <locale>
  ```

The following example illustrates the logs for the Sign Document step:

```verilog
[DEBUG] Executing sign document step.
[DEBUG] Using adobe sign configuration: <path of adobe sign configuration>
[DEBUG] Invoking Adobe Sign Service for creating agreement
[DEBUG] Agreement created successfully with agreement id <agreement id>
[DEBUG] Exception in Adobe Sign Service <complete stack trace>
[ERROR] Exception in Adobe Sign Service
[DEBUG] Successfully finished sign document step
```

Use the logs to evaluate that:

* You are using a correct Adobe Sign configuration.
* The Adobe Sign Service exits after creating an agreement successfully.  
* The Sign Document step exits with a success message.

If there is an exception, you can view the complete stack trace to evaluate the cause of the error.

## Enable debug logging for AEM Forms workflows {#enable-debug-logging-for-aem-forms-workflows}

Do the following so you can enable debug logging for AEM Forms workflows:

1. Go to AEM web console configuration manager at:

   https://'[server]:[port]'/system/console/configMgr

1. Select **[!UICONTROL Sling]** > **[!UICONTROL Log Support]**.
1. Select **[!UICONTROL Add new Logger.]**
1. Select **[!UICONTROL Debug]** as the **[!UICONTROL Log Level]**.
1. Specify the location of the log file. The default location for the log file is: *logs\error.log*
1. Specify the name of the package as **com.adobe.granite.workflow.core** in the **[!UICONTROL Logger]** column.

   Executing these steps enables storing the debug logs for the **com.adobe.granite.workflow.core** package. Select **[!UICONTROL +]** and add the following package names to the list:

    * com.adobe.fd.workflow
    * com.adobe.fd.workspace
