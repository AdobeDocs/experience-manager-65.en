---
title: Forms JEE workflows | Handling user data
description: Learn how to use AEM Forms JEE workflows to design, create, and manage business processes.
topic-tags: grdp
products: SG_EXPERIENCEMANAGER/6.5/FORMS
role: "Admin,User"
exl-id: 847fa303-8d1e-4a17-b90d-5f9da5ca2d77
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
---
# Forms JEE workflows | Handling user data {#forms-jee-workflows-handling-user-data}

AEM Forms JEE workflows provide tools to design, create, and manage business processes. A workflow process consists of a series of steps that execute in a specified order. Each step performs a specific action such as assigning a task to a user or sending an email message. A process can interact with assets, user accounts, and services, and can be triggered using any of the following methods:

* Starting a process from AEM Forms Workspace
* Using SOAP or RESTful service
* Submitting an adaptive form
* Using watched folder
* Using Email

For more information about creating AEM Forms JEE workflow process, see [Workbench Help](https://www.adobe.com/go/learn_aemforms_workbench_65).

## User data and data stores {#user-data-and-data-stores}

When a process is triggered and as it progresses, it captures data about the process participants, data entered by participants in the form associated with the process, and attachments added to the form. The data is stored in AEM Forms JEE server database, and if configured, some data like attachments are stored in the Global Document Storage (GDS) directory. The GDS directory can be configured on a shared file system or a database.

## Access and delete user data {#access-and-delete-user-data}

When a process is triggered, a unique process instance ID and long-lived invocation ID are generated and associated with the process instance. You can access and delete data for a process instance based on the long-lived invocation ID. You can deduce the long-lived invocation ID of a process instance with the user name of the process initiator or process participants who have submitted their tasks.

However, you cannot identify the process instance ID for an initiator in the following scenarios:

* **Process triggered through a watched folder**: A process instance cannot be identified using its initiator if the process is triggered by a watched folder. In this case, the user information is encoded in the stored data.
* **Process initiated from publish AEM instance**: All process instances triggered from AEM publish instance do not capture information about the initiator. However, user data may be captured in the form associated with the process, which is stored in workflow variables.
* **Process initiated through email**: The email ID of the sender is captured as a property in an opaque blob column of the `tb_job_instance` database table, which cannot be queried directly.

### Identify process instance IDs when workflow initiator or participant is known {#initiator-participant}

Perform the following steps so you can identify process instance IDs for a workflow initiator or a participant:

1. Execute the following command in AEM Forms Server database to retrieve the principal ID for workflow initiator or participant from the `edcprincipalentity` database table.

   ```sql
   select id from edcprincipalentity where canonicalname='user_ID'
   ```

   The query returns the principal ID for the specified `user_ID`.

1. (**For workflow initiator**) Execute the following command to retrieve all tasks associated with the principal ID for the initiator from the `tb_task` database table.

   ```sql
   select * from tb_task where start_task = 1 and create_user_id= 'initiator_principal_id'
   ```

   The query returns tasks initiated by the specified `initiator`_ `principal_id`. The tasks are of two types:

    * **Completed tasks**: These tasks have been submitted and display an alphanumeric value in the `process_instance_id` field. Take note of all process instance IDs for submitted tasks and continue with the steps.
    * **Tasks initiated but not complete**: These tasks have initiated but not submitted yet. The value in the `process_instance_id` field for these tasks is **0** (zero). In this case, take note of the corresponding task IDs and see [Work with orphan tasks](#orphan).

1. (**For workflow participants**) Execute the following command to retrieve process instance IDs associated with the principal ID of the process participant for the initiator from the `tb_assignment` database table.

   ```sql
   select distinct a.process_instance_id from tb_assignment a join tb_queue q on a.queue_id = q.id where q.workflow_user_id='participant_principal_id'
   ```

   The query returns instance IDs for all processes associated with the participant including those where the participant has not submitted any task.

   Take note of all process instance IDs for submitted tasks and continue with the steps.

   For orphan tasks or tasks where the `process_instance_id` is 0 (zero), take note of the corresponding task IDs and see [Work with orphan tasks](#orphan).

1. Follow the instructions in [Purge user data from workflow instances based on process instance IDs](/help/forms/using/forms-workflow-jee-handling-user-data.md#purge) section so you can delete user data for identified process instance IDs.

### Identify process instance IDs when user data is stored in primitive variables {#primitive}

A workflow can be designed such that the user data is captured in a variable that gets stored as a blob in the database. In such cases, you can query user data only if it is stored in one of the following primitive-type variables:

* **String**: Contains the user ID directly or as a substring and can be queried using SQL.
* **Numeric**: Contains the user ID directly.
* **XML**: Contains the user ID as a substring within the text stored as text columns in database and can be queried like strings.

Perform the following steps so you can determine if a workflow that stores data in primitive-type variables contains data for the user:

1. Execute the following database command:

   ```sql
   select database_table from omd_object_type where name='pt_<app_name>/<workflow_name>'
   ```

   The query returns a table name in `tb_<number>` format for the specified application ( `app_name`) and workflow ( `workflow_name`).

   >[!NOTE]
   >
   >The value of the `name` property can be complex if the workflow is nested within subfolders inside the application. Ensure that you specify the exact full path to the workflow, which you can get from the `omd_object_type` database table.

1. Review the `tb_<number>` table schema. The table contains variables that store user data for the specified workflow. The variables in the table correspond to the variables in the workflow.

   Identify and take note of the variable that corresponds to workflow variable containing the user ID. If the identified variable is of primitive-type, you can run a query to determine workflow instances associated with a user ID.

1. Execute the following database command. In this command, the `user_var` is the primitive-type variable that contains user ID.

   ```sql
   select process_instance_id from <tb_name> where <user_var>=<user_ID>
   ```

   The query returns all process instance IDs associated with the specified `user_ID`.

1. Follow the instructions in [Purge user data from workflow instances based on process instance IDs](/help/forms/using/forms-workflow-jee-handling-user-data.md#purge) section so you can delete user data for identified process instance IDs.

### Purge user data from workflow instances based on process instance IDs {#purge}

Now that you have identified the process instance IDs associated with a user, do the following to delete user data from the respective process instances.

1. Run the following command so you can retrieve long-lived invocation ID and status for a process instance from the `tb_process_instance` table.

   ```sql
   select long_lived_invocation_id, status from tb_process_instance where id='process_instance_id'
   ```

   The query returns the long-lived invocation ID and status for the specified `process_instance_id`.

1. Create an instance of the public `ProcessManager` client ( `com.adobe.idp.workflow.client.ProcessManager`) using a `ServiceClientFactory` instance with the correct connection settings.

   For more information, see Java&trade; API reference for [Class ProcessManager](https://helpx.adobe.com/experience-manager/6-3/forms/ProgramLC/javadoc/com/adobe/idp/workflow/client/ProcessManager.html).

1. Check the status of the workflow instance. If the status is other than 2 (COMPLETE) or 4 (TERMINATED), terminate the instance first by calling the following method:

   `ProcessManager.terminateProcess(<long_lived_invocation_id>)`.

1. Purge the workflow instance by calling the following method:

   `ProcessManager.purgeProcessInstance(<long_lived_invocation_id>)`

   The `purgeProcessInstance` method completely deletes all data for the specified invocation ID from AEM Forms Server database and GDS, if configured.

### Work with orphan tasks {#orphan}

Orphan tasks are the tasks whose containing process has been initiated but not submitted yet. In this case, the `process_instance_id` is **0** (zero). Therefore, you cannot trace user data stored for orphan tasks using process instance IDs. However, you can trace it using the task ID for an orphan task. You can identify the tasks IDs from the `tb_task` table for a user as described in [Identify process instance IDs when workflow initiator or participant is known](/help/forms/using/forms-workflow-jee-handling-user-data.md#initiator-participant).

Once you have the task IDs, do the following to purge the associated files and data with an orphan task from GDS and database.

1. Run the following command on AEM Forms Server database so you can retrieve IDs for the identified task IDs.

   ```sql
   select id from tb_form_data where task_id=<task_id>
   ```

   The query returns a list of IDs. For each ID ( `fd_id`) returned in the results, create a list of session ID strings as follows:

    * _ `wfattach<task_id>`
    * `_wftask<fd_id>`
    * `_wftaskformid<fd_id>`

1. Depending on whether your GDS points to a file system or a database, perform one of the following steps:

    1. **GDS in file system**

       In the GDS file system:

       1. Search for files with the following session ID strings as their extensions:

        * `_wfattach<task_id>`
        * `_wftask<fd_id>`
        * `_wftaskformid<fd_id>`

       The files with these extensions are the marker files. They are stored with filenames in the following format:

       `<file_name_guid>.session<session_id_string>`

       1. Delete all marker files and other files with the exact filename as `<file_name_guid>` from the file system.

    1. **GDS in database**

       Execute the following commands for each session ID:

       ```sql
       delete from tb_dm_chunk where documentid in (select documentid from tb_dm_session_reference where sessionid=<session_id>)
       delete from tb_dm_session_reference where sessionid=<session_id>
       delete from tb_dm_deletion where sessionid=<session_id>
       ```

1. Run the following commands so you can delete data for task IDs from the AEM Forms Server database:

   ```sql
   delete from tb_task_acl where task_id=<task_id>
   delete from tb_task_attachment where task_id=<task_id>
   delete from tb_form_data where task_id=<task_id>
   delete from tb_assignment where task_id=<task_id>
   delete from tb_task where id=<task_id>
   ```
