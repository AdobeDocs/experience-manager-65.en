---
title: Integrating AEM 6.5 with Adobe Campaign Classic
description: Learn how to integrate AEM 6.5 with Adobe Campaign Classic
uuid: 3c998b0e-a885-4aa9-b2a4-81b86f9327d3
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
discoiquuid: df94dd1b-1b65-478b-a28d-81807a8084b1
exl-id: a7281ca0-461f-4762-a631-6bb539596200
---

# Integrating AEM 6.5 with Adobe Campaign Classic {#integrating-campaign-classic}

By integrating AEM with Adobe Campaign Classic (ACC), you can manage email delivery, content, and forms directly in AEM. Configuration steps in both Adobe Campaign Classic and AEM are needed to enable bidirectional communication between solutions.

This integration allows AEM and Adobe Campaign Classic to be used independently. Marketers can create campaigns and use targeting in Adobe Campaign, while content creators in parallel can work on content design in AEM. Using the integration, the content and design of the campaign created in AEM can be targeted and delivered by Adobe Campaign.

>[!INFO]
>
>This document details how to integrate Adobe Campaign Classic with AEM 6.5. For other Campaign integrations see the document [Integrating AEM 6.5 with Adobe Campaign.](campaign.md)

## Integration Steps {#integration-steps}

Integration between AEM and Campaign requires a number of steps in both solutions.

1. [Install the AEM Integration Package in Campaign.](#install-package)
1. [Create an operator for AEM in Campaign](#create-operator)
1. [Configure Campaign integration in AEM](#campaign-integration)
1. [Configure the AEM Externalizer](#externalizer)
1. [Configure the campaign-remote user in AEM](#configure-user)
1. [Configure the AEM external account in Campaign](#acc-setup)

This document leads you through each of these steps in detail.

## Prerequisites {#prerequisites}

* Administrator access to Adobe Campaign Classic
  * To perform the integration, you need a working Adobe Campaign Classic instance, including a configured database.
  * If you need additional details on how to set up and configure Adobe Campaign Classic please refer to the [Adobe Campaign Classic documentation,](https://experienceleague.adobe.com/docs/campaign-classic/using/campaign-classic-home.html) particularly the Installation and Configuration guide.
* Administrator access to AEM

## Install the AEM Integration Package in Campaign {#install-package}

The **AEM Integration** package in Adobe Campaign includes a number of standard configurations necessary to connect to AEM.

1. As an administrator, sign into the Adobe Campaign instance using the client console.

1. Select **Tools** &gt; **Advanced** &gt; **Import package...**.

   ![Import package](assets/import-package.png)

1. Click **Install a standard package** and then click **Next**.

1. Check the **AEM Integration** package.

   ![Install a standard package](assets/select-package.png)

1. Click **Next**, and then **Start** to begin the installation.

   ![Installation progress](assets/installation.png)

1. Click **Close** when the installation completes.

The integration package is now installed.

## Create the Operator for AEM in Campaign {#create-operator}

The integration package automatically creates the `aemserver` operator that AEM uses to connect to Adobe Campaign. You must define a security zone for this operator and set its password.

1. Log into Adobe Campaign as an administrator using the client console.

1. Select **Tools** -&gt; **Explorer** from the menu bar.

1. In the explorer, navigate to the **Administration** &gt; **Access Management** &gt; **Operators** node.

1. Select the `aemserver` operator.

1. On the **Edit** tab of the operator, select the **Access Rights** sub-tab and then click the **Edit the access parameters...** link.

   ![Set security zone](assets/access-rights.png)

1. Select the appropriate security zone and define the trusted IP mask as necessary.

1. Click **Save**.

1. Log out of the Adobe Campaign client.

1. On the filesystem of the Adobe Campaign server, navigate to the Campaign installation location and edit the `serverConf.xml` file as an administrator. This file is typically located under:
   * `C:\Program Files\Adobe\Adobe Campaign Classic v7\conf` in Windows.
   * `/usr/local/neolane/nl6/conf/eng` in Linux.

1. Search for `securityZone` and ensure that the following parameters are set for the security zone of the AEM operator.

   * `allowHTTP="true"`
   * `sessionTokenOnly="true"`
   * `allowUserPassword="true"`.

1. Save the file.

1. Ensure that the security zone does not get overwritten by the respective setting in the `config-<server name>.xml` file.

   * If the configuration file contains a separate security zone setting, then change the `allowUserPassword` attribute to `true`.

1. If you want to change the Adobe Campaign Classic server port, replace `8080` with the desired port.

   >[!CAUTION]
   >
   >By default, there is no security zone configured for the operator. For AEM to connect to Adobe Campaign, you must select a zone as detailed in the previous steps.
   >
   >Adobe strongly recommends creating a security zone dedicated to AEM to avoid any security issues. For more on this topic, please refer to the [Adobe Campaign Classic documentation.](https://experienceleague.adobe.com/docs/campaign-classic/using/installing-campaign-classic/additional-configurations/security-zones.html)

1. In the Campaign client, return to the `aemserver` operator and select the **General** tab.

1. Click the **Reset password...** link.

1. Specify a password and store it in a secure location for future use.

1. Click **OK** to save the password for the `aemserver` operator.

## Configure the Campaign Integration in AEM {#campaign-integration}

AEM uses [the operator you already set up in Campaign](#create-operator) in order to communicate with Campaign

1. Sign into to your AEM authoring instance as an administrator.

1. From the global navigation side rail, select **Tools** &gt; **Cloud Services** &gt; **Legacy Cloud Services** &gt; **Adobe Campaign**, then click **Configure Now**.

   ![Configure Adobe Campaign](assets/configure-campaign-service.png)

1. In the dialog, create a Campaign service configuration by entering a **Title** and click **Create**.

   ![Configure Campaign dialog](assets/configure-campaign-dialog.png)

1. A new window and dialog opens to edit the configuration. Provide the necessary information.

    * **Username** - This is [the Adobe Campaign AEM Integration package operator created in the previous step.](#create-operator) By default it is `aemserver`. 
    * **Password** - This is the password for [the Adobe Campaign AEM Integration package operator created in the previous step.](#create-operator)
    * **API End Point** - This is the Adobe Campaign instance URL.

    ![Configure Adobe Campaign in AEM](assets/configure-campaign.png)

1. Select **Connect to Adobe Campaign** to verify the connection and then click **OK**.

AEM can now communicate with Adobe Campaign.

>[!NOTE]
>
>Make sure that your Adobe Campaign server is reachable via the internet. AEM can not access private networks.

## Configure Replication to AEM Publish Instance {#replication}

Campaign content is created by content authors on the AEM authoring instance. This instance is typically only available internally at your organization. For content such as images and assets to be accessible to the recipients of your campaign, you need to publish that content.

The replication agent is responsible for publishing your content from the AEM author instance to the publish instance and must be set up for the integration to work properly. This step is also necessary to replicate certain authoring instance configurations into the publishing instance.

To configure replication from your AEM author instance to the publish instance:

1. Sign into to your AEM authoring instance as an administrator.

1. From the global navigation side rail, select **Tools** &gt; **Deployment** &gt; **Replication** &gt; **Agents on author**, then tap or click **Default agent (publish)**.

   ![Configure replication agent](assets/acc-replication-config.png)

1. Tap or click **Edit** then select the **Transport** tab.

1. Configure the **URI** field by replacing the default `localhost` value with the IP address of the AEM publishing instance.

   ![Transport tab](assets/acc-transport-tab.png)

1. Tap or click **OK** to save the changes to the agent settings.

You have configured replication to the AEM publish instance so your campaign recipients can access your content.

>[!NOTE]
>
>If you do not want to use the replication URL but instead use the public-facing URL, you can set the public URL in the following configuration setting via OSGi
>
>From the global navigation side rail, select **Tools** &gt; **Operations** &gt; **Web Console** &gt; **OSGi Configuration** and search for **AEM Campaign Integration - Configuration**. Edit the configuration and change the field **Public URL** (`com.day.cq.mcm.campaign.impl.IntegrationConfigImpl#aem.mcm.campaign.publicUrl`).

## Configure the AEM Externalizer {#externalizer}

[The Externalizer](/help/sites-developing/externalizer.md) is an OSGi service in AEM that transforms a resource path into an external and absolute URL, which is necessary for AEM to serve content that Campaign can use. You must configure it in order for the Campaign integration to work.

1. Sign into the AEM authoring instance as an administrator.
1. From the global navigation side rail, select **Tools** &gt; **Operations** &gt; **Web Console** &gt; **OSGi Configuration** and search for **Day CQ link Externalizer**.
1. By default the last entry in the **Domains** field is intended for the publish instance. Change the URL from the default `http://localhost:4503` to your publicly-available publish instance.

   ![Configuring the Externalizer](assets/acc-externalizer-config.png)

1. Tap or click **Save**. 

You have configured the Externalizer and Adobe Campaign can now access your content.

>[!NOTE]
>
>The publish instance must be reachable from the Adobe Campaign server. If it points to `localhost:4503` or another server that Adobe Campaign cannot reach, images from AEM will not appear in the Adobe Campaign console.

## Configure the campaign-remote User in AEM {#configure-user}

In order for Campaign to communicate with AEM, you need to set a password for the `campaign-remote` user in AEM.

1. Log into AEM as an administrator.
1. On the main navigation console, click on **Tools** in the left rail.
1. Then click **Security** -&gt; **Users** to open the user administration console.
1. Locate the `campaign-remote` user.
1. Select the `campaign-remote` user and click **Properties** to edit the user.
1. In the **Edit User Settings** window, click **Change Password**.
1. Provide a new password for the user and note the password in a secure location for future use.
1. Click **Save** to save the password change.
1. Click **Save &amp; Close** to save the changes to the `campaign-remote` user.

## Configure the AEM External Account in Campaign {#acc-setup}

When [installing the **AEM Integration** package in Campaign,](#install-package) an external account is created for AEM. By configuring this external account, Adobe Campaign can connect to AEM, enabling two-way communication between the solutions.

1. Log into Adobe Campaign as an administrator using the client console.

1. Select **Tools** -&gt; **Explorer** from the menu bar.

1. In the explorer, navigate to the **Administration** &gt; **Platform** &gt; **External Accounts** node.

   ![External accounts](assets/external-accounts.png)

1. Locate the external AEM account. By default it has the values:

   * **Type** - `AEM`
   * **Label** - `AEM Instance`
   * **Internal Name** - `aemInstance`

1. On the **General** tab of this account, enter the user information that you defined in the [Set campaign-remote User Password](#set-campaign-remote-password) step.

   * **Server** - The AEM author server address
     * The AEM author server must be reachable from the Adobe Campaign Classic server instance. 
     * Ensure that the server address does **not** end in a trailing slash.
   * **Account** - By default, this is the `campaign-remote` user that you set in AEM in the [Set campaign-remote User Password](#set-campaign-remote-password) step.
   * **Password** - This password is the same as the `campaign-remote` user that you set in AEM in the [Set campaign-remote User Password](#set-campaign-remote-password) step.

1. Select the **Enabled** checkbox.

1. Click **Save**.

Adobe Campaign can now communicate with AEM.

## Next Steps {#next-steps}

With both Adobe Campaign Classic and AEM configured, the integration is now complete.

You can now learn how to create a newsletter in Adobe Experience Manager by continuing with [this document.](/help/sites-authoring/campaign.md)
