---
title: Integrate Adobe Sign with AEM Forms
seo-title: Integrate Adobe Sign with AEM Forms
description: Learn how to configure Adobe Sign for AEM Forms
seo-description: Learn how to configure Adobe Sign for AEM Forms
uuid: e5049775-fb6c-4228-9823-e6a2811460da
contentOwner: sashanka
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: develop
discoiquuid: 1f28b257-5419-4a21-a54a-b20bf35530ac
docset: aem65

feature: Adaptive Forms, Acrobat Sign
exl-id: 52146038-1582-41b8-aee0-215d04bb91d7
---
# Integrate [!DNL Adobe Sign] with AEM [!DNL Forms]{#integrate-adobe-sign-with-aem-forms}

[!DNL Adobe Sign] enables e-signature workflows for adaptive forms. E-signatures improve workflows to process documents for legal, sales, payroll, human resource management, and many more areas.

In a typical [!DNL Adobe Sign] and adaptive forms scenario, a user fills an adaptive form to **apply for a service**. For example, a credit card application and a citizen benefits form. When a user fills, submits, and signs the application form, the form is sent to the service provider for further action. Service provider reviews the application and uses [!DNL Adobe Sign] to mark the application approved. To enable similar electronic-signature workflows, you can integrate [!DNL Adobe Sign] with AEM [!DNL Forms].

To use [!DNL Adobe Sign] with AEM [!DNL Forms], configure [!DNL Adobe Sign] in AEM Cloud Services:

## Prerequisites {#prerequisites}

You require the following to integrate [!DNL Adobe Sign] with AEM [!DNL Forms]:

* An active [Adobe Sign developer account.](https://acrobat.adobe.com/us/en/why-adobe/developer-form.html)
* An [SSL enabled](/help/sites-administering/ssl-by-default.md) AEM [!DNL Forms] server.
* An [Adobe Sign API application](https://www.adobe.io/apis/documentcloud/sign/docs.html#!adobedocs/adobe-sign/master/gstarted/create_app.md).
* Credentials (Client ID and Client Secret) of [!DNL Adobe Sign] API application.
* When reconfiguring, remove the existing [!DNL Adobe Sign] configuration from both author and publish instances.
* Use [identical crypto key](/help/sites-administering/security-checklist.md#make-sure-you-properly-replicate-encryption-keys-when-needed) for author and publish instances.

## Configure [!DNL Adobe Sign] with AEM [!DNL Forms] {#configure-adobe-sign-with-aem-forms}

After prerequisites are in place, perform the following steps to configure [!DNL Adobe Sign] with AEM [!DNL Forms] on the Author instance:

1. On AEM [!DNL Forms] author instance, navigate to **Tools** ![hammer](assets/hammer.png) &gt; **[!UICONTROL General]** &gt; **[!UICONTROL Configuration Browser]**.
1. On the **[!UICONTROL Configuration Browser]** page, tap **[!UICONTROL Create]**.
   * See the [Configuration Browser](/help/sites-administering/configurations.md) documentation for more information.
1. In the **[!UICONTROL Create Configuration]** dialog, specify a **[!UICONTROL Title]** for the configuration, enable **[!UICONTROL Cloud Configurations]**, and tap **[!UICONTROL Create]**. It creates a configuration container for cloud services.
1. Navigate to **Tools** ![hammer](assets/hammer.png) &gt; **[!UICONTROL Cloud Services]** &gt; **[!UICONTROL Adobe Sign]** and select the configuration container you created in the above step.

   >[!NOTE]
   >
   >You can either execute steps 1-4 to create a new configuration container and create an [!DNL Adobe Sign] configuration in the container or use the existing `global` folder in **Tools** ![hammer](assets/hammer.png) &gt; **[!UICONTROL Cloud Services]** &gt; **[!UICONTROL Adobe Sign]**. If you create the configuration in the new configuration container, ensure to specify the container name in the **[!UICONTROL Configuration Container]** field when you create an adaptive form.
   
   >[!NOTE]
   >
   >Ensure that the URL of the cloud services configuration page starts with **HTTPS**. If not, [enable SSL](/help/sites-administering/ssl-by-default.md) for AEM [!DNL Forms] server.

1. On the configuration page, tap **[!UICONTROL Create]** to create [!DNL Adobe Sign] configuration in AEM [!DNL Forms].
1. In the **[!UICONTROL General]** tab of the **[!UICONTROL Create Adobe Sign Configuration]** page, specify a **[!UICONTROL Name]** for the configuration and tap **[!UICONTROL Next]**. You can optionally specify a title and browse to select a thumbnail for the configuration.

1. Copy the URL in your current browser window to a notepad. It is required to configure [!DNL Adobe Sign] application with AEM[!DNL Forms].

1.  In the **[!UICONTROL Settings]** tab, the **[!UICONTROL OAuth URL]** field contains the default URL. The format of the URL is:

      `https://<shard>/public/oAuth/v2`
   
      For example: 
      `https://secure.na1.echosign.com/public/oauth/v2`
   
      where:
   
      **na1** refers to the default database shard. You can modify the value for the database shard. Ensure that  the [!DNL  Adobe Sign] Cloud Configurations point to the [correct Shard](https://helpx.adobe.com/sign/using/identify-account-shard.html).
   
      If you create another [!DNL Adobe Sign] configuration for an Adobe Experience Manager feature or component, ensure that all the [!DNL Adobe Sign] Cloud Configurations point to the same shard.
   
      >[!NOTE]
      >
      > Keep the **Create Adobe Sign Configuration** page open. Do not close it. You can retrieve **Client Id** and **Client Secret** after configuring OAuth settings for the [!DNL Adobe Sign] application as described in upcoming steps.


1. Configure OAuth settings for the [!DNL Adobe Sign] application:

    1. Open a browser window and sign in to the [!DNL Adobe Sign] developer account.
    1. Select the application configured for AEM [!DNL Forms], and tap **[!UICONTROL Configure OAuth for Application]**.
    1. Copy the **[!UICONTROL Client ID]** and **[!UICONTROL Client Secret]** to a notepad.
    1. In the **[!UICONTROL Redirect URL]** box, add the HTTPS URL copied in the previous step.
    1. Enable the following OAuth settings for the [!DNL Adobe Sign] application and click **[!UICONTROL Save]**.

    * aggrement_read
    * aggrement_write
    * aggrement_send
    * widget_write
    * workflow_read

   For step-by-step information to configure OAuth settings for an [!DNL Adobe Sign] application and obtain the keys, see [Configure oAuth settings for the application](https://www.adobe.io/apis/documentcloud/sign/docs.html#!adobedocs/adobe-sign/master/gstarted/configure_oauth.md) developer documentation.

   ![OAuth Config](assets/oauthconfig_new.png)

1. Go back to the **[!UICONTROL Create Adobe Sign Configuration]** page. In the **[!UICONTROL Settings]** tab, the **[!UICONTROL OAuth URL]** field mentions the  default URL. The format of the URL is:

   `https://<shard>/public/oAuth/v2`

   For example: 
   `https://secure.na1.echosign.com/public/oauth/v2`

   where:

   **na1** refers to the default database shard.

   You can modify the value for the database shard. Restart the server to be able to use the new value for the database shard.

   >[!NOTE]
   >
   > Ensure that your author and publish instance configurations point to the same shard. If you create multiple Adobe Sign configurations for an organization, ensure all the configurations utilize the same shard.

1. Go back to the **[!UICONTROL Create Adobe Sign Configuration]** page. In the **[!UICONTROL Settings]** tab, specify the **Client ID** (also referred to as Application ID) and **Client Secret**. Use the [Client ID and Client Secret of Adobe Sign application](https://opensource.adobe.com/acrobat-sign/developer_guide/helloworld.html#get-the-app-id-and-secret) created for AEM Forms.

1. Select the **[!UICONTROL Enable Adobe Sign for attachments also]** option to append files attached to an adaptive form to the corresponding [!DNL Adobe Sign] document sent for signing.

1. Tap **[!UICONTROL Connect to Adobe Sign]**. When prompted for credentials, provide username and password of the account used while creating [!DNL Adobe Sign] application.

1. Tap **[!UICONTROL Create]** to create the [!DNL Adobe Sign] configuration.

1. Open AEM Web Console. The URL is `https://'[server]:[port]'/system/console/configMgr`
1. Open **[!UICONTROL Forms Common Configuration Service].**
1. In the **[!UICONTROL Allow]** field, **select** All users - All the users, anonymous or logged in, can preview attachments, verify and sign forms, and click **[!UICONTROL Save].** Author instance is configured to use [!DNL Adobe Sign].
1. Publish the configuration. 
1. Use [replication](https://docs.adobe.com/content/help/en/experience-manager-65/deploying/configuring/replication.html) to create identical configuration on corresponding publish instances. 

Now, [!DNL Adobe Sign] is integrated with AEM [!DNL Forms] and ready for use in adaptive forms. To [use Adobe Sign service in an adaptive form](../../forms/using/working-with-adobe-sign.md#configure-adobe-sign-for-an-adaptive-form), specify the configuration container created above in adaptive form properties.



## Configure [!DNL Adobe Sign] scheduler to sync the signing status {#configure-adobe-sign-scheduler-to-sync-the-signing-status}

An [!DNL Adobe Sign] enabled adaptive form is submitted only after all the signers complete the signing process. By default, the [!DNL Adobe Sign] Scheduler services is scheduled to check (poll) signer response after every 24 hours. You can change the default interval for your environment. Perform the following steps to change the default interval:

1. Log in to AEM [!DNL Forms] server with admin credentials and navigate to **Tools** &gt; **[!UICONTROL Operations]** &gt; **[!UICONTROL Web Console]**.

   You can also open the following URL in a browser window:
   `https://[localhost]:'port'/system/console/configMgr`

1. Locate and open the **[!UICONTROL Adobe Sign Configuration Service]** option. Specify a [cron expression](https://en.wikipedia.org/wiki/Cron#CRON_expression) in the **[!UICONTROL Status Update Scheduler Expression]** field and click **[!UICONTROL Save]**. For example, to run the configuration service daily at 00:00 am, specify `0 0 0 1/1 * ? *` in the **[!UICONTROL Status Update Scheduler Expression]** field.

Default interval to sync status of [!DNL Adobe Sign] is now changed.

## Related Articles {#related-articles}

* [Using Adobe Sign in an adaptive form](../../forms/using/working-with-adobe-sign.md)
* [Using Adobe Sign with AEM Forms (Video)](https://helpx.adobe.com/experience-manager/kt/forms/using/adobe-sign-integration-feature-video.html)
