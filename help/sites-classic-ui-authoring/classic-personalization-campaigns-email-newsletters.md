---
title: Publishing an Email to Email Service Providers

description: You can publish newsletters to e-mail services such as ExactTarget and Silverpop Engage.


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: personalization
content-type: reference

exl-id: c07692f7-3618-4e8c-96d7-4db09f2d9896
solution: Experience Manager, Experience Manager Sites
feature: Authoring,Personalization
role: User
---
# Publishing an Email to Email Service Providers{#publishing-an-email-to-email-service-providers}

You can publish newsletters to e-mail services such as ExactTarget and Silverpop Engage. This document describes how to configure AEM to publish a newsletter to these e-mail services.

>[!NOTE]
>
>You need to configure the service provider before you can create and publish an email. See [Configuring ExactTarget](/help/sites-administering/exacttarget.md) and [Configuring Silverpop Engage](/help/sites-administering/silverpop.md) for more information.

To publish your email to the email service provider, you need to perform the following steps:

1. Create an email.
1. Apply the Email Service configuration to the email.
1. Publish the email.

>[!NOTE]
>
>If you update email providers, do a flight test, or send a newsletter, these operations fail if the newsletter is not published to the Publish instance first or if the Publish instance is not available. Be sure to publish your newsletter and make sure the Publish instance is up and running.

## Creating an Email {#creating-an-email}

An email or newsletter that you want to publish to an e-mail service can be created under a campaign using the **Geometrixx Newsletter** template. You can also use the **Geometrixx Outdoors E-Mail** template. Sample email/newsletter-based on the **Geometrixx Outdoors E-Mail** template are available at `https://<hostname>:<port>/cf#/content/campaigns/geometrixx-outdoors/e-mails.html`.

To create an email that is published to the configured e-mail service:

1. Go to **Websites** and then **Campaigns**. Select a campaign.
1. Click **New** to open the **Create Page** window.
1. Enter the title, name, and select the **Geometrixx Newsletter** template from the list of available templates.
1. Click **Create**.
1. Open the created email.
1. Switch to design mode to select the components you want to display in the sidekick.
1. Switch to edit mode and start adding content (text, images, [email tools](#adding-exacttarget-email-tools-to-your-email), [personalization variables](#adding-text-and-personalization-tool-to-your-e-mail), and so on) to your email.

### Adding ExactTarget Email Tools to your email {#adding-exacttarget-email-tools-to-your-email}

>[!NOTE]
>
>This section is specific to the ExactTarget service.

The **Email Tools** component for ExactTarget can add more email functionality to your email/newsletter.

1. Open an email to be published to ExactTarget.
1. Add the component **ET - Email Tools** to your page using the sidekick. Open the component in Edit mode.

   ![chlimage_1](assets/chlimage_1.gif)

1. Select an option from the **Options** menu:

<table>
 <tbody>
  <tr>
   <td>Physical Mailing Address (Required)</td>
   <td>This component inserts the physical mailing address of your organization in your email.</td>
  </tr>
  <tr>
   <td>Profile Center (Required)</td>
   <td>The profile center is a webpage where subscribers can enter and maintain the personal information that you keep about them.</td>
  </tr>
  <tr>
   <td>View Email as a Web Page</td>
   <td>This component allows the user to view the email as a webpage.</td>
  </tr>
  <tr>
   <td>Privacy Policy</td>
   <td>This component inserts the link to your privacy policy in the email.<br /> </td>
  </tr>
  <tr>
   <td>Unsubscribe Center</td>
   <td>Gives the option to the user to unsubscribe from your mailing list.</td>
  </tr>
  <tr>
   <td>Subscription Center</td>
   <td>A subscription center is a web page where a subscriber can control the messages they receive from your organization.</td>
  </tr>
  <tr>
   <td>Track Email Opens</td>
   <td>A hidden component that lets you use ExactTarget tracking feature.<br /> </td>
  </tr>
 </tbody>
</table>

   >[!NOTE]
   >
   >The **Options** drop-down menu is only populated if ExactTarget configuration is applied to the email. See [Applying Email Service Configuration to Email Settings](#applying-e-mail-service-configuration-to-e-mail-settings) for more information.

1. Publish the email to ExactTarget.

   The email with the email tools is available for use in the configured ExactTarget account.

>[!NOTE]
>
>* The URLs within the email tools are replaced (in the received email) by their actual values only when an email is sent using **Simple Send** or **Guided Send** but not **Test Send**.
>
>* Two of the email tools are required: **Physical Mailing Address (Required)** and **Profile Center (Required)**. When the email is published to ExactTarget, these two email-tools are added to the bottom of every mail by default.
>

### Adding Text and Personalization tool to your e-mail {#adding-text-and-personalization-tool-to-your-e-mail}

You can add personalized fields in an email by adding the **Text and Personalization** component to the page:

1. Open the e-mail to be published to your e-mail service.
1. To enable personalization field from your email service, add the framework configuration while configuring the email service. See [configuring Silverpop Engage](/help/sites-administering/silverpop.md) and [configuring Exact Target](/help/sites-administering/exacttarget.md) for more information.
1. Add the component **Text & Personalization** from the sidekick. This component is the part of newsletter group. Open this component in the edit mode.

   ![chlimage_1-110](assets/chlimage_1-110a.png)

1. Add the required personalized field to the text by selecting the field from the drop-down menu and clicking **Insert**.
1. Click **OK** to finish.

## Applying E-mail Service Configuration to E-mail Settings {#applying-e-mail-service-configuration-to-e-mail-settings}

To apply your E-mail service configuration to a newsletter:

1. Create an E-mail Service configuration.
1. Open your email/newsletter.
1. Open the email/newsletter settings by either clicking **Settings** or by clicking **Page Properties in** the sidekick.
1. Click **Add Service** in **Cloud Services** tab. You see the list of services. Select your required configuration - either **ExactTarget** or **Silverpop** - from the list from the drop-down list.

   ![chlimage_1-5](assets/chlimage_1-5a.jpeg)

1. Click **OK**.

## Publishing Emails to Email Service {#publishing-emails-to-email-service}

Emails/Newsletters can be published to your E-mail Service by following these steps:

1. Open the email.
1. Before publishing an email, make sure you have applied the correct configuration to your email.
1. Click **Publish**. This opens the **Publish Newsletter To E-mail Service Provider** window.
1. Fill in the **Newsletter Name** field. The email/newsletter is published to E-mail Service Provider with this name. In case an email name is not provided, then the email is published using the page name of the newsletter in AEM.
1. Click **Publish**.

   ![chlimage_1-6](assets/chlimage_1-6.jpeg)

   If successful, AEM confirms you can view the email in ExactTarget or Silverpop Engage.

   If there is ExactTarget the published email can ve viewed by clicking **View Published Email**. This takes you directly to the published newsletter in the ExactTarget ([https://members.exacttarget.com/](https://members.exacttarget.com/).).

>[!NOTE]
>
>If an email/newsletter is published with the same name as that of an email/newsletter already published, then the earlier email/newsletter is not replaced. Instead, a new email/newsletter is created with same name (the IDs of two newsletters are, however, different).
>
>Publishing the email/newsletter to E-mail Service Provider also publishes the email/newsletter to the AEM publish instance.
>

### Updating A Published E-mail {#updating-a-published-e-mail}

The **Update** button on the Publish dialog box lets you update a newsletter already published to an E-mail Service Provider. In case the newsletter has not yet been published and the **Update** button is clicked, a **Newsletter is not published** message displays.

To update a published email:

1. Open the email/newsletter that has previously been published to an e-mail service provider that you want to re-publish after making changes to the email/newsletter.
1. Click **Publish**. The **Publish Newsletter to Email Service Provider** window displays. Click **Update**.

   To check if the email/newsletter has been updated on ExactTarget, click **View Published Email**. This takes you to the published email in ExactTarget.

   To check if the email/newsletter has been updated on Silverpop Email Service, visit the Silverpop Engage site.
