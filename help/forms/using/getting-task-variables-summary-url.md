---
title: Getting Task Variables in Summary URL
description: How-to reuse the information about a task and generate a Summary URL to summarize or describe a task.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
exl-id: b5e27b54-d141-48dd-a4ed-dd0a691319a5
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Getting Task Variables in Summary URL {#getting-task-variables-in-summary-url}

The summary page displays task-related information. This article describes how you can reuse task-related information in the summary page.

In this sample orchestration, an employee submits a leave application form. The application form then goes to the employee's manager for approval.

1. Create a sample HTML renderer (html.esp) for resourseType **Employees/PtoApplication**.

   The renderer assumes the following properties to be set on the node:

    * ename
    * empid
    * reason
    * duration

   >[!NOTE]
   >
   >This renderer is the summary page template.  

   The following sample code for this renderer is contained in:

   `apps/Employees/PtoApplication/html.esp`

   ```html
   <html>
     <body>
       <table>
       <tbody>
       <tr>
           <td>
               <h3>Employee Name: <%= currentNode.ename %></h3>
               <h3>Employee ID: <%= currentNode.eid %></h3>
               <h3>Leave duration: <%= currentNode.duration %> days</h3>
               <h3>Reason: <%= currentNode.reason %></h3>
           </td>
       </tr>
       </tbody>
       </table>
     </body>
   </html>
   ```

1. Modify the orchestration to extract the four properties from the submitted form data. After this create a node in CRX of type **Employees/PtoApplication**, with the properties populated.

    1. Create a process **create PTO summary** and use this as a subprocess before the **Assign Task** operation in your orchestration.
    1. Define **employeeName**, **employeeID**, **ptoReason**, **totalDays**, and **nodeName** as input variables in your new process. These variables will be passed as submitted form data.

       Also define an output variable **ptoNodePath** which is used while setting the summary Url.

    1. In the **create PTO summary** process, use the **set value** component to set the input details in a **nodeProperty**(**nodeProps**) map.

       The keys in this map should be the same as the keys defined in your HTML renderer in the previous step.

       Also, add a **sling:resourceType** key with value **Employees/PtoApplication** in the map.

    1. Use the subprocess **storeContent** from the **ContentRepositoryConnector** service in the **create PTO summary** process. This subprocess creates a CRX node.

       It takes three input variables:

        * **Folder Path**: The path where the new CRX node is created. Set the path as **/content**.
        * **Node name**: Assign the input variable nodeName to this field. This is a unique node name string.
        * **Node Type**: Define the type as **nt:unstructured**. The output of this process is nodePath. The nodePath is the CRX path of the newly created node. The ndoePath would be the final output of the **create PTO** summary process.

    1. Pass the submitted form data (**employeeName**, **employeeID**, **ptoReason**, and **totalDays**) as input to the new process **create PTO summary**. Take the output as **ptoSummaryNodePath**.

1. Define the summary Url as an XPath expression containing the server details along with **ptoSummaryNodePath**.

   XPath: `concat('https://[*server*]:[*port*]/lc',/process_data/@ptoSummaryNodePath,'.html')`.

In AEM Forms workspace, when you open a task, the summary Url accesses the CRX node, and the HTML renderer displays the summary.

The summary layout can be changed without modifying the process. The HTML renderer displays the summary appropriately.
