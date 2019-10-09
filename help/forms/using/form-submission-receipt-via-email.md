---
title: Sending a form submission acknowledgement via email
seo-title: Sending a form submission acknowledgement via email
description: AEM Forms allows you to configure the email submit action that sends an acknowledgement to a user on submitting the form.
seo-description: AEM Forms allows you to configure the email submit action that sends an acknowledgement to a user on submitting the form.
uuid: 77b3c836-6011-48bd-831c-ebc214218efb
content-type: reference
products: SG_EXPERIENCEMANAGER/6.4/FORMS
topic-tags: publish
discoiquuid: 7ffe6317-174b-4d80-9ac6-9bfb5eed7e29
---

# Sending a form submission acknowledgement via email {#sending-a-form-submission-acknowledgement-via-email}

## Adaptive form data submission {#adaptive-form-data-submission}

Adaptive forms provides several out-of-the-box [submit actions](/help/forms/using/configuring-submit-actions.md) workflows for submitting the form data to different endpoints.

For example, the **Email action **submit action sends an email on successful submission of an adaptive form. It can also be configured to send the form data and the PDF in the email.

This article details the steps to enable the Email action on an adaptive form and different configurations it provides.

>[!NOTE]
>
>You can also use the **Email PDF action **to send the completed form by email as a PDF attachment. The configuration options available for this action are the same as the options available for the Email action. The Email PDF action is available only for XFA-based adaptive forms

## Email action {#email-action}

The Email action enables an author to send email automatically to one or more recipients on the successful submission of an adaptive form.

>[!NOTE]
>
>To use the Email action, you need to configure the AEM mail service as described in [Configuring the mail service](/help/sites-administering/notification.md#configuring-the-mail-service).

### Enabling Email action on an adaptive form {#enabling-email-action-on-an-adaptive-form}

1. Open an adaptive form in edit mode.  

1. Click **Edit** next to the **Start of an Adaptive Form** toolbar.

   The Edit Component dialog opens.

   ![Edit component dialog for an adaptive form](assets/start_of_adp_form.png)

1. Select the **Submit actions** tab and choose **Email action** from the Submit action drop-down list.

   The tab displays the options to configure the Email action for the current form.

   ![Submit actions tab](assets/dialog.png)

1. Specify valid email IDs in the Mailto, CC, and BCC fields.

   Specify the subject and the body of the email in the Subject and Email template fields, respectively.

   You can also specify variable placeholders in the fields, in which case, the values of the fields are processed when the form is successfully submitted by an end user. For more information, see [Using adaptive form field names to dynamically create email content](/help/forms/using/form-submission-receipt-via-email.md#p-using-adaptive-form-field-names-to-dynamically-create-email-content-p).

   Select Include attachments if the form includes file attachments and you want to attach these files in the email.

   >[!NOTE]
   >
   >If you choose the **Email PDF action**, you must select the Include attachments option.

1. Click **OK** to save the changes.

### Using adaptive form field names to dynamically create email content {#using-adaptive-form-field-names-to-dynamically-create-email-content}

The field names in an adaptive form are called placeholders that are replaced with the value of that field after a user submits the form.

In the Email action tab, you can use placeholders that are processed when the action is performed. It implies that the headers of the email (such as Mailto, CC, BCC, subject) are generated when the user submits the form.

To define a placeholder, specify `${<field name>}` in a field in the Submit actions tab.

For example, if the form contains the **Email address** field, named `email_addr`, for capturing the email ID of a user, you can specify the following in the Mailto, CC, or BCC fields.

`${email_addr}`

When a user submits the form, an email is sent to the email ID entered in the `email_addr` field of the form.

>[!NOTE]
>
>You can find the name of a field in the **Edit** dialog for the field.

Variable placeholders can also be used in the **Subject** and **Email template** fields.

For example:

`Hi ${first_name} ${last_name},`

`Your form has been received by our department. It usually takes ten business days to process the request.`

`Regards`

`Administrator`

>[!NOTE]
>
>Fields in repeatable panels cannot be used as variable placeholders.

