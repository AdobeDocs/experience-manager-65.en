---
title: Use custom email templates in an Assign Task step

description: Custom email templates for forms workflow email notifications 


topic-tags: publish

docset: aem65
exl-id: d4035c91-ee8d-4f12-bdac-e3912be732d7
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Workflow
role: Admin, User, Developer
---
# Use custom email templates in an Assign Task step{#use-custom-email-templates-in-an-assign-task-step}

You can use the Assign Task step to create and assign tasks to a user or group. When a task is assigned to a user or group, an email notification is sent to the defined user or to each member of the defined group. A typical email notification contains link of the assigned task and information related to the task. The following image displays a sample email notification:

![Email notification with out of the box template](do-not-localize/default_email_template_new.png)

You can customize the appearance and use custom metadata in an email notification. AEM Forms provide an out of the box template for email notifications. You can customize the out of the box template or create a template from scratch.

Email notification templates are based on [HTML email](https://en.wikipedia.org/wiki/HTML_email). These emails adapt to different email clients and screen sizes. Moreover, the styling of the email is defined within the template.

The following image displays a customized email notification: 

![Email notification using custom template](do-not-localize/customized-email.png) 

## Customize the existing template {#customize-the-existing-template}

Out of the box, AEM Forms provides a template for email notifications. The template provides title description, due date, priority, workflow name, and link of the assigned task. You can customize the template to change the appearance. Perform the following steps to customize the template:

1. Log in to CRXDE with administrator account.  

1. Navigate to /libs/fd/dashboard/templates/email.  

1. Open the htmlEmailTemplate.txt file. It contains the default template.  

1. Replace the content of htmlEmailTemplate.txt file with custom content.

   An email notification template is an [HTML email](https://en.wikipedia.org/wiki/HTML_email). You can replace the existing html code with your custom code to change the appearance of the template.

1. Save the file. Now, the customized template is ready for use.

## Create an email template {#create-an-email-template}

Out of the box, AEM Forms provides a template for email notifications. The template provides title description, due date, priority, workflow name, and link of the assigned task. You can also add a custom email template (your own template) for Assign task steps. Perform the following steps to add a custom email template:

1. Log in to CRXDE with administrator account.  

1. Navigate to /libs/fd/dashboard/templates/email.  

1. Create a .txt file. For example, EmailOnTaskAssign.txt.  

1. Add custom HTML code to the file.

   An email notification template is an [HTML email](https://en.wikipedia.org/wiki/HTML_email). You can add custom HTML code to the file to create a template.

1. Save the file. The template is ready for use in Assign Task step.

## Use an email template in an Assign Task step {#use-an-email-template-in-an-assign-task-step}

Out of the box, Assign task step is configured to use the default template, htmlEmailTemplate.txt. You can choose to use a custom template. To change the template:

1. Open the Assign Task step.  

1. Navigate to Assignee &gt; HTML Email Template.  

1. Select the newly created HTML Email Template.  

1. Click OK. The template is changed.

An email notification also uses [metadata](../../forms/using/use-metadata-in-email-notifications.md). For example, due date, priority, workflow name, and more. You can also configure the template to use [custom metadata](../../forms/using/use-metadata-in-email-notifications.md#using-custom-metadata-in-an-email-notification).
