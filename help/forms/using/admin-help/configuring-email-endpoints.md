---
title: Configuring email endpoints
description: Learn how to configure email endpoints. Email endpoints enable you to invoke a service by sending one or more documents to a specified email account.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_endpoints
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 33583a12-4f20-4146-baa4-c9854e454bbf
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configuring email endpoints {#configuring-email-endpoints}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

Email endpoints enable users to invoke a service by sending one or more documents (as email attachments) to a specified email account. The email inbox acts as a collecting point for the attachments. The service monitors the inbox and processes the attachments. The results of the conversion are forwarded to the user defined in the endpoint.

For an email endpoint, authorized users can invoke a process by emailing files to the appropriate account. The results will be returned to the submitting user (by default) or to the user defined in the endpoint settings.

Before you configure an email endpoint, create a POP3 or IMAP email account for use by the endpoint. Set up a separate account for each type of conversion. For example, one account can be configured to generate standard PDF documents from incoming file attachments, and another account can be configured to generate secure PDF documents.

>[!NOTE]
>
>Each email address must map to only one email endpoint. You cannot configure multiple email endpoints to a single email address, even if the additional email endpoints are disabled.

All email endpoints are configured with an authorized user name and password for the email inbox, which are required when invoking the service. The email account is protected by the mail server system on which it is configured.

If your users send documents with Western European language characters in file and conversion path names, they must use an email application that supports the required encoding types (Latin1 [ISO-8859-1], Western European [Windows], or UTF-8). For more information, see the *Installing and Deploying AEM forms* document for your application server.

Before you configure an email endpoint, configure the Email service. (See [Configure default email endpoint settings](configuring-email-endpoints.md#configure-default-email-endpoint-settings).) The Email service’s configuration parameters have two purposes:

* To configure attributes that are common for all email endpoints
* To provide default values for all the email endpoints

## Configure SSL for an email endpoint {#configure-ssl-for-an-email-endpoint}

You can configure POP3, IMAP, or SMTP to use Secure Sockets Layer (SSL) for an email endpoint.

1. On the email server, enable SSL for POP3, IMAP, or SMTP according to the manufacturer’s documentation.
1. Export a client certificate from the email server.
1. Use the keytool program to import the client certificate file to the application server’s Java Virtual Machine (JVM) certificate store. The procedure for this step will depend on the JVM and client installation paths.

   For example, if you are using a default Oracle WebLogic Server installation with JDK 1.5.0 on Microsoft Windows Server® 2003, type the following text in a command prompt:

   `keytool -import -file client_certificate -alias myalias -keystore BEA_HOME\jdk150_04\jre\security\cacerts`

1. When prompted, enter the password (for Java, the default password is `changeit`). You will receive a message stating that the certificate was imported successfully.
1. Use administration console to add the email endpoint to the service.
1. Create the email endpoint in administration console. When configuring the endpoint settings, select POP3/IMAP SSL Enabled for incoming messages and SMTP SSL Enabled for outgoing messages, and change the port properties accordingly.

>[!NOTE]
>
>Tip: If you experience problems when using SSL, use an email client such as Microsoft Outlook to check whether it can access the email server using SSL. If the email client cannot access the email server, the issue is related to the configuration of either your certificate or your email server.

## Configure default email endpoint settings {#configure-default-email-endpoint-settings}

You can use the Service Management page to configure attributes that are common for all email endpoints, and to provide default values for all the email endpoints.

For forms workflow to receive and handle incoming email messages from users, you need to create an email endpoint for the Complete Task service. This email endpoint requires additional settings, as described in [Create an Email endpoint for the Complete Task service](configuring-email-endpoints.md#create-an-email-endpoint-for-the-complete-task-service).

### Change the default values for email endpoints {#change-the-default-values-for-email-endpoints}

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. On the Service Management page, click Email: 1.0 (the Component ID is com.adobe.idp.dsc.provider.service.email.Email).
1. On the Configuration tab, specify the default email endpoint settings and then click Save.

### Default email endpoint settings {#default-email-endpoint-settings}

**Cron Expression:** The cron expression as used by quartz to schedule the polling of the input directory.

**Repeat Interval:** The number of times the directory polling is repeated. The default repeat interval is in seconds if this value is not specified in the endpoint configuration. The default value is 10. This value cannot be less than 10.

**Repeat Count:** The number of times the input directory is polled. The default repeat count to use if this value is not specified in the endpoint configuration. A value of -1 indicates indefinite scanning of the directory. The default value is -1.

**Delay when job starts:** The default value, in seconds, for the delay before the job starts to scan the endpoint. The default value is 0.

**Batch Size:** The number of emails the receiver processes per scan for optimum performance. A value of -1 indicates all emails. The default value is 2.

**Asynchronous:** Identifies the invocation type as asynchronous or synchronous. Transient and synchronous processes can only be invoked synchronously. The default value is asynchronous.

**Domain Pattern:** The domain name pattern that is used to filter incoming emails. For example, if adobe.com is used, only email from adobe.com will be processed; email from other domains is ignored.

**File Pattern:** The incoming file attachment patterns that the provider accepts. This includes files that have specific extensions (&ast;.dat, &ast;.xml), specific names (data), and composite expressions in the name and extension (.[dD][aA]'port'). The default value is &ast;.&ast;.

**Successful Job’s Recipients:** One or more email addresses that are used to send emails to indicate successful jobs. By default, a successful job message is always sent to the sender of the initial job. Up to 100 recipients are supported. To turn off this setting, leave this field blank.

**Failed Job’s Recipients:** One or more email addresses that are used to send emails to indicate failed jobs. By default, a failed job message is always sent to the sender who sent the initial job. Up to 100 recipients are supported. To turn off this setting, leave this field blank.

**Inbox Host:** The inbox host name or IP address for the email provider to scan.

**Inbox Port:** The inbox port number for the email provider to scan. If the value is 0, the default IMAP or POP3 port is used.

**Inbox Protocol:** The email protocol for the email endpoint to use to scan the inbox. The choices are IMAP or POP3. The inbox host mail server must support these protocols.

**Inbox Time Out:** Specifies the amount of time the endpoint will wait before canceling when attempting to connect to the inbox. If a connection is not acquired before the time-out value is reached, the inbox will not be polled.

**Inbox User:** The user name required to log in to the email account. Depending on the email server and configuration, this name may only be the user name portion of the email or it may be the full email address.

**Inbox Password:** The password for the Inbox User.

**POP3/IMAP SSL Enabled:** When selected, enables SSL.

**SMTP Host:** The host name of the mail server that the email provider uses to send results and error messages. For example, mail.example.com.

**SMTP Port:** The port that is used to connect to the mail server. The default value is 25.

**SMTP User:** The user account for the email provider to use when it sends email for results and errors.

**SMTP Password:** The password for the SMTP account. Some mail servers do not require an SMTP password.

**Send From:** The email address (for example, user@company.com) used to send email notifications of results and errors. If you do not specify a Send From value, the email server attempts to determine the email address by combining the value specified in the SMTP User setting with a default domain configured on the email server. If your email server does not have a default domain and you do not specify a value for Send From, errors may occur. To ensure that the email messages have the correct from address, specify a value for the Send From setting.

**SMTP SSL Enabled:** When selected, enables SSL over SMTP.

**Include The Original Email Body As An Attachment:** By default, when you send an email to the Forms Server, the original text of the message is included in the body of the message. To instead include the text as an attachment, select this option.

**Use The Original Subject Line For Result Emails:** By default, Forms server uses the values specified in the Success Email Subject and Error Email Subject settings as the subject line when sending result email messages. To instead use the same subject line as the original email sent to the server, select this option.

**Success Email Subject:** After you send an email to an email endpoint to start or continue a process, you receive a return email message from the AEM Forms Server. If your email succeeds, you receive a success email. If your email fails, you receive a failure email informing why it failed. This setting enables you to specify the subject line of success email messages sent for this endpoint.

**Success Email Body:** Enables you to specify the body text of success email messages sent for this endpoint.

**Error Email Subject Prefix:** Enables you to specify the text used at the beginning of the subject line of failure email messages sent for this endpoint.

**Error Email Subject:** Enables you to specify the subject line of failure email messages sent for this endpoint. This text is displayed after the Error Email Subject Prefix.

**Error Email Body:** Enables you to specify the first line in the body text of failure email messages sent for this endpoint.

**Email Summary Info:** Each success or failure message includes a section containing the original email text that you sent to the Forms Server. This setting specifies the text that appears above that section.

**Validate Inbox Before Creating/Updating This Endpoint:** When this option is selected, the Forms Server checks whether your SMTP/POP3 settings are correct before creating the endpoint. When you click Add, a message displays, stating whether the inbox account is valid. If this option is not selected, the AEM Forms Server creates the endpoint without validating the inbox.

**Character Set Encoding:** The encoding format to use for the email message. The default is UTF-8, which most users outside Japan will use. Users in a Japanese environment may choose ISO2022-JP.

**Failed Email Sent Folder:** Specifies a directory in which to store results if the SMTP mail server is not operational.

## Email endpoint settings {#email-endpoint-settings}

Use the following settings to configure an email endpoint.

**Name:** A mandatory setting that identifies the endpoint. Do not include a < character because it truncates the name displayed in Workspace. If you’re entering a URL as the name of the endpoint, ensure that it conforms with the syntax rules specified in RFC1738.

**Description:** A description of the endpoint. Do not include a < character because it truncates the description displayed in Workspace.

**Cron Expression:** Enter a cron expression if the email must be scheduled by using a cron expression.

**Repeat Count:** Number of times the email endpoint scans the folder or directory. A value of -1 indicates indefinite scanning. The default value is -1.

**Repeat Interval:** The scanning rate that the receiver uses for checking for incoming mail.

**Delay when job starts:** The time to wait to scan after the scheduler starts.

**Batch Size:** The number of emails the receiver processes per scan for optimum performance. A value of -1 indicates all emails. The default value is 2.

**User Name:** A mandatory setting, which is the user name that is used when invoking a target service from email. The default value is SuperAdmin.

**Domain Name:** A mandatory setting, which is the user’s domain. The default value is DefaultDom.

**Domain Pattern:** Specifies the domain patterns of incoming email that the provider accepts. For example, if adobe.com is used, only email from adobe.com is processed; email from other domains is ignored.

**File Pattern:** Specifies the incoming file attachment patterns that the provider accepts. This includes files that have specific extensions (&ast;.dat, &ast;.xml), specific names (data), or composite expressions in the name and extension (&ast;.[dD][aA]'port').

**Successful Job’s Recipients:** An email address to which messages are sent to indicate successful jobs. By default, a successful job message is always sent to the sender. If you type sender, email results are sent to the sender. Up to 100 recipients are supported. Specify additional recipients with email addresses, separated by commas (,).

To turn off this setting, leave the setting blank. In some cases, you want to trigger a process and do not want an email notification of the result.

**Failed Job’s Recipients:** An email address to which messages are sent to indicate failed jobs. By default a failed job message is always sent to the sender. If you type sender, email results are sent to the sender. Up to 100 recipients are supported. Specify additional recipients with email addresses, separated by commas (,).

To turn off this setting, leave the setting blank. In some cases, you want to trigger a process and do not want an email notification of the result.

**Inbox Host:** The inbox host name or IP address for the email provider to scan.

**Inbox Port:** The port that the email server uses. The default value for POP3 is 110 and the default value for IMAP is 143. If SSL is enabled, the default value for POP3 is 995 and the default value for IMAP is 993.

**Inbox Protocol:** The email protocol for the email endpoint to use to scan the inbox. The values are IMAP or POP3. The inbox host mail server must support these protocols.

**Inbox Time Out:** The time-out, in seconds, for the email provider to wait for inbox responses.

**Inbox User:** The user name that is required to log in to the email account. Depending on the email server and configuration, this value may be only the user name portion of the email or it may be the full email address.

**Inbox Password:** The password for the inbox user.

**POP3/IMAP SSL Enabled:** Select this setting to force the email provider to use SSL to scan the inbox. Ensure that your mail server supports SSL.

**SMTP Host:** The host name of the mail server the email provider uses to send results and error messages.

**SMTP Port:** The default value for the SMTP port is 25.

**SMTP User:** The user account for the email provider to use when it sends email notifications of results and errors.

**SMTP Password:** The password for the SMTP account. Some mail servers do not require an SMTP password.

**Send From:** The email address (for example, user@company.com) used to send email notifications of results and errors. If you do not specify a Send From value, the email server attempts to determine the email address by combining the value specified in the SMTP User setting with a default domain configured on the email server. If your email server does not have a default domain and you do not specify a value for Send From, errors may occur. To ensure that the email messages have the correct from address, specify a value for the Send From setting.

**SMTP SSL Enabled:** Select this setting to force the email provider to use SSL to scan the inbox. Ensure that your mail server supports SSL.

**Failed Email Sent Folder:** Specifies a directory in which to store results if the SMTP mail server is not operational.

**asynchronous:** When set to synchronous, all input documents are processed and a single response is returned. When set to asynchronous, a response is sent for each document that is processed.

For example, an email endpoint is created for a service that takes a single Word document and returns that document as a PDF file. An email can be sent to the endpoint’s inbox that contains multiple (3) Word documents. When all three documents are processed, if the endpoint is configured as synchronous, a single response email is sent with all three documents attached. If the endpoint is asynchronous, a response email is sent after each Word document is converted to PDF. The result is three emails, each with a single PDF attachment.

The default value is asynchronous.

**Include the original email body as an attachment:** By default, when you send an email to the Forms Server, the original text of the message is included in the body of the message. To instead include the text as an attachment, select this option.

**Use the original subject line for result emails:** By default, Forms server uses the values specified in the Success Email Subject and Error Email Subject settings as the subject line when sending result email messages. To instead use the same subject line as the original email sent to the server, select this option.

**Success Email Subject:** After you send an email to an email endpoint to start or continue a process, you receive a return email message from the AEM Forms Server. If your email succeeds, you receive a success email. If your email fails, you receive a failure email informing why it failed. This setting enables you to specify the subject line of success email messages sent for this endpoint.

**Success Email Body:** Enables you to specify the body text of success email messages sent for this endpoint.

**Error Email Subject Prefix:** Enables you to specify the text used at the beginning of the subject line of failure email messages sent for this endpoint.

**Error Email Subject:** Enables you to specify the subject line of failure email messages sent for this endpoint. This text is displayed after the Error Email Subject Prefix.

**Error Email Body:** Enables you to specify the first line in the body text of failure email messages sent for this endpoint.

**Email Summary Info:** Each success or failure message includes a section containing the original email text that you sent to the Forms Server. This setting specifies the text that appears above that section.

**Validate Inbox before creating/updating this endpoint:** When this option is selected, the Forms Server checks whether your SMTP/POP3 settings are correct before creating the endpoint. When you click Add, a message displays, stating whether the inbox account is valid. If this option is not selected, the AEM Forms Server creates the endpoint without validating the inbox.

**Operation Name:** This setting is mandatory. A list of operations that can be assigned to the email endpoint. The operation that you select here determines which fields are displayed in the Input Parameter Mappings and Output Parameter Mappings sections.

**Input Parameter Mappings:** Used to configure the input that is required to process the service and operation. The two types of input are literal and variable:

**Literal:** The email uses the value that is entered in the field as it is displayed.

**Variable:** You can map a string from the email subject, body, header, or sender's email address. To do this, use one of the following keywords: %SUBJECT%, %BODY%, %HEADER%, or %SENDER%. For example, if you use %SUBJECT%, the email subject content is used as the input parameter. To pick up attachments, enter a file pattern that the email endpoint can use to select the attached documents. For example, entering &ast;.pdf selects any attached document that has a .pdf filename extension. Entering &ast; selects any attached document. Entering example.pdf selects any attached document named example.pdf.

**Output Parameter Mappings:** Used to configure the output of the service and operation. The following characters in the output parameter mapping values are expanded in the attachment filename:

**%F** Represents the source file’s filename (not including an extension).

**%E** Represents the source file’s extension.

Any occurrence of the backslash (\) is replaced with %%.

***note**: If the service request message includes multiple file attachments, you cannot use the %F and %E parameters for the Output Parameter Mappints property of the endpoint. If the services response returns multiple file attachments, you cannot specify the same file name for more than one attachment. If you do not follow these recommendations, the invoked service create the names for the returned files, and the names are not predictable.*

The following values are available:

**Single Object:** The email provider does not have the source folder destination; results are returned as attachments. The pattern is Result/%F.ps and returns Result%%sourcefilename.ps as the filename attachment.

**List:** The pattern is Result/%F/ and returns Result%%sourcefilename%%file1 as the filename attachment.

**Map:** The pattern is Result/%F/ and the source destination is Result%%sourcefilename%%file1 and Result%%sourcefilename%%file2. If the map contains more than one object and the pattern is Result/%F.ps, the response file attachments are Result%%sourcefilename1.ps (output 1) and Result%%sourcefilename2.ps (output 2).

## Create an Email endpoint for the Complete Task service {#create-an-email-endpoint-for-the-complete-task-service}

For forms workflow to receive and handle incoming email messages from users, you need to create an email endpoint for the Complete Task service.

1. In administration console, click Services &gt; Applications and Services &gt; Service Management.
1. On the Service Management page, click the Complete Task service.
1. On the Endpoints tab, select Email from the drop-down list and click Add.
1. In the Inbox Host box, type the host name or IP address of the mail server.
1. In the Inbox User box, type the user name required to log in to the email account that you created to handle form submissions. Depending on the email server and configuration, this name may be only the user name portion of the email or it may be the full email address.
1. In the Inbox Password box, type the password for the Inbox User.
1. In the SMTP Host box, type the host name or IP address of the mail server from which the email provider sends results and error messages.
1. In the SMTP User box, type the user account for the email provider to use when it sends out email for results and errors. This user account can be the same value you used for Inbox User.
1. In the SMTP Password box, type the password for the SMTP account.
1. In the Operation Name list, select invoke.
1. In the attachmentMap list, select Variable and type `*.*` in the adjacent box. This sends all attachments from the inbound mail messages to a map variable for the Complete Task process.
1. In the mailBody list, select variable and type `%BODY%` in the adjacent box.
1. In the mailFrom list, select Variable and type `%SENDER%` in the adjacent box. This maps the sender address to the Complete Task process data.
1. In the results box, type `results`. This causes the Complete Task or Start Process to return a result string.
1. Click Add.
