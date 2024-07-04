---
title: Configuring Server Settings
description: The Server Settings page provides access to email, task notification and administrator notification settings.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms_workflow
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 362b7b91-c58b-4e47-a6ef-56a4b54a100c
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configuring Server Settings {#configuring-server-settings}

The Server Settings page provides access to various settings for forms workflow:

* **Email settings** that enable outgoing email messages, along with the email server settings used for those messages. (See [Configuring email settings](configuring-server-settings.md#configuring-email-settings).)
* **Task notification settings** that enable, disable, or modify the messages sent in email notifications to end users and groups regarding their tasks. (See [Configuring notifications for users and groups](configuring-server-settings.md#configuring-notifications-for-users-and-groups).)
* **Administrator notification settings** that enable, disable, or modify the messages sent in email notifications for administrative tasks. (See [Configuring notifications for administrators](configuring-server-settings.md#configuring-notifications-for-administrators).)

## Configuring email settings {#configuring-email-settings}

You can specify an email account for the Forms Server, through which it sends email messages to AEM forms users and administrators. These email messages are used to notify and remind users of tasks that they must complete, notify the user of tasks that have reached a deadline, and notify the administrator of any process errors that occur.

To enable the sending of email messages between AEM forms and users, configure the outgoing email settings on the Email Settings page. Outgoing email must use an SMTP server.

To enable AEM forms to receive and handle incoming email messages from users, create an email endpoint for the Complete Task service. (See [Create an Email endpoint for the Complete Task service](/help/forms/using/admin-help/configuring-email-endpoints.md#create-an-email-endpoint-for-the-complete-task-service)).

If your processes are designed and implemented without requiring email, you do not have to configure any of the options on the Email Settings page.

### Configure outgoing email settings {#configure-outgoing-email-settings}

1. In administration console, click Services &gt; forms workflow &gt; Server Settings &gt; Email Settings.
1. Select Enable Outgoing Messages.
1. In the SMTP Server box, type the email server name or IP address. All notification email messages from forms workflow are sent from this email server.
1. In the User Name and Password boxes, type the login name and password to be used when the SMTP server requires authentication. Leave them blank if anonymous login is allowed.
1. In the Email Address box, type the email address to use as the return address for email messages that forms workflow sends.

   >[!NOTE]
   >
   >If you are using Microsoft Exchange Server and the Email Address is an invalid email address, Microsoft Exchange server fails to send an email to Distribution Lists. To resolve the issue, select the **Enable External Communication** option seperately for every Distribution List on Microsoft Exchange server.

1. Click Save.

>[!NOTE]
>
>If you enter incorrect information, you can click Cancel to go back to the previously displayed page.

### Configuring email templates to use AEM Forms Workspace {#configuring-email-templates-to-use-html-workspace}

>[!NOTE]
>
>The Flex Workspace is deprecated for AEM forms release.

By default, the emails sent out by AEM forms contain links to (Deprecated for AEM forms on JEE) Flex Workspace. You can configure AEM forms to send out emails with links to AEM Forms Workspace. To know more about the benefits of AEM Forms Workspace over (Deprecated for AEM forms on JEE) Flex Workspace, see [this](/help/forms/using/features-html-workspace-available-flex.md) article.

1. In administration console, click Home &gt; Services &gt; forms workflow &gt; Server Settings &gt; Task Notifications.
1. Open task assignment template.
1. Set the template in the task notifications to the following: `https://@@notification-host@@:8080/lc/libs/ws/index.html?taskId=@@taskid@@`

   ```java
   https://@@notification-host@@:8080/lc/libs/ws/index.html?taskId=@@taskid@@
   ```

## Configuring notifications for users and groups {#configuring-notifications-for-users-and-groups}

On the Task Notification page, you can configure templates that forms workflow will use to generate the email notifications that are sent to users and groups. You can customize and format the notifications using forms workflow variables.

You configure the following types of notifications for users and groups:

* reminders
* task assignments
* deadlines

To generate email notifications for a group, specify an email address for the group in User Management. <!--Fix broken link See Setting up and organizing users -->When forms workflow sends an email notification to a group, each member within the group who has an email address specified receives the email notification. When a member of the group receives an email notification and wants to claim the task, the member must click the claim link in the email notification, which opens the task details page in Workspace. From there, the member can either claim or claim and open the work item.

>[!NOTE]
>
>The Flex Worksapce is deprecated for AEM forms release.

### Configure reminders for users or groups {#configure-reminders-for-users-or-groups}

You can send reminder notifications to the assigned user or group when a deadline to complete a task is approaching. The rules for determining exactly when a reminder notification is sent are determined by the process developer.

1. In administration console, click Services &gt; Forms workflow &gt; Server Settings &gt; Task Notifications.
1. Under Notification Type, click Reminder (for users) or Group - Reminder (for groups).
1. Select Enable Reminder or Enable Group - Reminder.
1. (User notifications only) To include an attachment of the form and its data with the reminder email message, select Include Form Data.
1. In the Subject box, type the text for the subject line of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. In the Notification Template box, type the text for the body of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. In the Message Format list, select the format that the email message is sent in, either HTML or Text. The default format is HTML.
1. In the Email Encoding list, select the encoding format to use for the email message. The default is UTF-8, which most users outside of Japan will use. Users in Japan may select ISO2022-JP.
1. Click Save.

### Configure task assignment notifications for users or groups {#configure-task-assignment-notifications-for-users-or-groups}

You can send task assignment notifications to a user or group when they are assigned a task.

1. In administration console, click Services &gt; Forms workflow &gt; Server Settings &gt; Task Notifications.
1. Under Notification Type, click Task Assignment for users or Group - Task Assignment for groups.
1. Select Enable Task Assignment for users or Enable Group - Task Assignment for groups.
1. (User notifications only) To include an attachment of the form and its data with the task assignment email message, select Include Form Data.
1. In the Subject box, type the text for the subject line of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. In the Notification Template box, type the text for the body of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. In the Message Format list, select the format that the email message is sent in, either HTML or Text. The default format is HTML.
1. In the Email Encoding list, select the encoding format to use for the email message. The default is UTF-8, which most users outside of Japan will use. Users in Japan may select ISO2022-JP.
1. Click Save.

### Configure deadline notifications for users or groups {#configure-deadline-notifications-for-users-or-groups}

You can send deadline notifications to users and groups when the deadline to act upon an assigned task has passed. A deadline notification is usually informational because the user can no longer act upon the assigned task.

1. In administration console, click Services &gt; Forms workflow &gt; Server Settings &gt; Task Notifications.
1. Under Notification Type, click Deadline (for users) or Group - Deadline (for groups).
1. Select Enable Deadline or Enable Group - Deadline.
1. In the Subject box, type the text for the subject line of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. In the Notification Template box, type the text for the body of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. In the Message Format list, select the format that the email message is sent in, either HTML or Text. The default format is HTML.
1. In the Email Encoding list, select the encoding format to use for the email message. The default is UTF-8, which most users outside of Japan will use. Users in Japan may select ISO2022-JP.
1. Click Save.

### Hide the DO NOT DELETE tag for all emails {#hide-the-do-not-delete-tag-for-all-emails}

You can configure email to hide to the DO NOT DELETE tracking tag in all emails send in a human-centric process. 

<!-- 
For details, see [How to hide the 'DO-NOT-DELETE' tag with CSS](https://blogs.adobe.com/LiveCycleHelp/2013/09/how-to-hide-the-do-not-delete-tag-with-css.html) 
-->

## Configuring notifications for administrators {#configuring-notifications-for-administrators}

You can configure templates that forms workflow will use to generate the email notifications that are sent to administrators.

You configure the following types of notifications for administrators:

* stalled branch
* stalled operation

### Configure stalled branch notifications {#configure-stalled-branch-notifications}

If a branch stalls (stops proceeding either deliberately or because of an error), you can have an email notification sent to an administrator or another user, who can then investigate the problem.

1. In administration console, click Services &gt; Forms workflow &gt; Server Settings &gt; Administrator Notifications.
1. Under Notification Type, click Stalled Branch.
1. Select Enable Stalled Branch.
1. In the Email Address box, type the addresses of the users to notify when a branch stalls. Use the format user@domain.com and separate each address with a comma. Typically, this email address is for an administrator.
1. In the Subject box, type the text for the subject line of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. In the Notification Template box, type the text for the body of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. In the Message Format list, select the format that the email message is sent in, either HTML or Text. The default format is HTML.
1. In the Email Encoding list, select the encoding format to use for the email message. The default is UTF-8, which most users outside Japan use. Users in Japan may select ISO2022-JP.
1. Click Save.

### Configure stalled operation notifications {#configure-stalled-operation-notifications}

If an operation stalls (stops proceeding either deliberately or because of an error), you can have an email notification sent to an administrator or another user, who can investigate the problem.

1. In administration console, click Services &gt; Forms workflow &gt; Server Settings &gt; Administrator Notifications.
1. Under Notification Type, click Stalled Operation.
1. Select Enable Stalled Operation.
1. In the Email Addresses box, type the addresses of the users to notify when an operation stalls. Use the format user@domain.com and separate each address with a comma. Typically, this email address is for an administrator.
1. In the Subject box, type the text for the subject line of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications)
1. In the Notification Template box, type the text for the body of the email message. This field is prepopulated with default text. For details about customizing this field, see [Customizing the content of notifications](configuring-server-settings.md#customizing-the-content-of-notifications).
1. Click Save.

## Customizing the content of notifications {#customizing-the-content-of-notifications}

The Task Notifications and Administrator Notifications pages provide several features that enable you to customize notification messages:

* rich text editor
* variable picker
* URL generation

### Rich text editor {#rich-text-editor}

The Notification Template area is a rich text editor that enables you to generate HTML for the email notification messages. It provides font and paragraph formatting options, which are found below the Notification Template box. The options include font type, size, style, and color, and paragraph alignment and bullets.

### URL generation {#url-generation}

For Task Notifications only, Forms workflow includes two predefined URL configurations that you can drag from the Url Generation list into the Notification Template box and then customize:

* OpenTask is available for the Reminder and Task Assignment notification types. This URL provides a link to the task in Workspace, allowing the user to access the task quickly from the email notification. When you drag the OpenTask URL to the Notification Template box, the URL is in the following format:

  `https://@@notification-host@@:<PORT>/workpace/Main.html?taskId=@@taskid@@`

* ClaimTask is available for the Group - Reminder and Group - Task Assignment notification types. This URL provides a link to the task details page in Workspace, where the user can either claim or claim and open the work item. When you drag the ClaimTask URL to the Notification Template box, the URL is in the following format:

  `https://@@notification-host@@:<PORT>/workpace/Main.html?taskId=@@taskid@@`

>[!NOTE]
>
>The Flex Worksapce is deprecated for AEM forms release.

If your solution is deployed in a clustered environment, replace `@@notification-host@@` with the cluster address.

`<`*PORT* `>` is the port number of the HTTP listener for the application server. The default HTTP listener port for the supported application servers are as follows:

**JBoss:** 8080

**Oracle WebLogic Server:** 7001

**IBM WebSphere:** 9080

To make these URLs function correctly, replace `<`*PORT* `>` with the port number that is appropriate for your environment.

>[!NOTE]
>
>If you are using a custom web application other than Forms to provide users with access to the tasks, you must instead use a URL format that is appropriate for your custom application.

### Variable picker {#variable-picker}

The Variable Picker list provides useful variables that you can drag-and-drop into the Subject or Notification Template boxes. When you drop a variable in the Subject or Notification Template boxes, it changes to the actual forms workflow variable name with two @ symbols on either side of it, for example, `@@taskid@@`.

For reminders, task assignments, and deadlines for users and groups, you can use the following variables in the Subject and Notification Template boxes:

**description** The contents of the Description property, as defined in the user step (start point, Assign Task operation, or Assign Multiple Tasks operation) of the process in Workbench.

**instructions** The contents of the Task Instructions property, as defined in the user step of the process in Workbench.

**notification-host** The host name of the AEM forms application server .

**process-name** The name of the process.

**operation-name** The name of the step.

**taskid** The unique identifier for the current task.

**actions** Produces a numbered list of valid routes (for example, Approve, Reject) that the recipient can click.

In addition, for group reminders, group task assignments and group deadlines, you can also use:

**group-name** The name of the group that is assigned the work item.

>[!NOTE]
>
>If a variable has no value, nothing is returned.

For stalled branches, you can use the following variables in the Subject and Notification Template boxes:

**branch-id** The branch identifier.

**process-id** The process instance identifier.

**notification-host** The host name of the AEM forms application server .

For stalled operations, you can use the following variables in the Subject and Notification Template boxes:

**action-id** The operation identifier.

**branch-id** The branch identifier.

**process-id** The process instance identifier.

**notification-host** The host name of the AEM forms application server .

### Using a variable in the Subject box {#using-a-variable-in-the-subject-box}

If you type the following text in the Subject box for Task Assignment notifications:

`Please complete task @@taskid@@`

The user receives an email message with the following subject if they are assigned task 376:

`Please complete task 376`

### Using variables in the Notification Template box {#using-variables-in-the-notification-template-box}

If you type the following text in the Notification Template box for Stalled Branch notifications:

`Branch @@branch-id@@ has stalled! You have received this notification from @@notification-host@@.`

The administrator receives an email message that contains the following content if the branch number is 4868 and the server name is `ServerXYZ`:

`Branch 4868 has stalled! You have received this notification from ServerXYZ.`

## Configuring Business Activity Monitoring connections {#configuring-business-activity-monitoring-connections}

Business Activity Monitoring, an optional module, provides a set of operational dashboards that provide real-time visibility into your operations and key performance indicators.

On the BAM Configuration Settings page, you set the connections to the server that runs BAM so that process-related events can be tracked and transmitted to that server.

1. In administration console, click Services &gt; Forms workflow &gt; Server Settings &gt; BAM Configuration Settings.
1. In the BAM Host box, type the name of the server that runs BAM. The default is localhost.
1. In the BAM Port box, type the port to be used to connect to the server that runs BAM. The default BAM port for JBoss is 8080, WebLogic is 7001, and WebSphere is 9080.
1. In the Server Host box, type the name or IP address of the host Forms Server. The default value is localhost.
1. In the Server Port box, type the port number used by the Forms Server.
1. In the User Name and Password boxes, type the appropriate user ID and password to access the BAM Server. The default user name is CognosNowAdmin and the default password is manager.
1. Click Save.
