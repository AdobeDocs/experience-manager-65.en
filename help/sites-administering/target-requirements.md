---
title: Prerequisites for Integrating with Adobe Target
description: Learn about the prerequisites for integrating with Adobe Target.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: integration
content-type: reference
docset: aem65
exl-id: 30813c44-51ac-4e6e-8ee6-4e8baacb1ff9
solution: Experience Manager, Experience Manager Sites
feature: Integration
role: Admin
---
# Prerequisites for Integrating with Adobe Target{#prerequisites-for-integrating-with-adobe-target}

As part of the [integration of AEM and Adobe Target](/help/sites-administering/target.md), you need to register with Adobe Target, configure the replication agent, and secure activity settings on the publish node.

## Registering with Adobe Target {#registering-with-adobe-target}

To integrate AEM with Adobe Target, you must have a valid Adobe Target account. This account must have **approver** level permissions at a minimum. When you register with Adobe Target, you receive a client code. You need the client code and your Adobe Target login name and password to connect AEM to Adobe Target.

The Client Code identifies the Adobe Target customer account when calling the Adobe Target server.

>[!NOTE]
>
>Your account must also be enabled by the Target team to use the integration.
>
>If it is not the case, contact [Adobe Customer Care](https://experienceleague.adobe.com/docs/target/using/cmp-resources-and-contact-information.html).

## Enabling the Target Replication Agent {#enabling-the-target-replication-agent}

The Test and Target [replication agent](/help/sites-deploying/replication.md) must be enabled on the author instance. Note that this replication agent is not enabled by default if you used the [nosamplecontent](/help/sites-deploying/configure-runmodes.md#using-samplecontent-and-nosamplecontent) run mode for installing AEM. For more information about securing your production environment, see the [Security Checklist](/help/sites-administering/security-checklist.md).

1. On the AEM home page, click **Tools** &gt; **Deployment** &gt; **Replication**.
1. Click **Agents On Author**.
1. Click the **Test and Target (test and target)** replication agent, and then click **Edit**.
1. Select the Enabled option, then click **OK**.

   >[!NOTE]
   >
   >When you configure the Test and Target replication agent, in the **Transport** tab, the URI is set by default to **tnt:///**. Do not replace this URI with **https://admin.testandtarget.omniture.com**.
   >
   >If you try to test the connection with **tnt:///**, it throws an error. This is expected behavior as this URI is for internal use only; do not use with **Test Connection**.

## Securing the Activity Settings Node {#securing-the-activity-settings-node}

Secure the activity settings node **cq:ActivitySettings** on the publish instance so that it is inaccessible to normal users. The activity settings node should only be accessible to the service handling the activity synchronization to Adobe Target.

The **cq:ActivitySettings** node is available in CRXDE lite under `/content/campaigns/*nameofbrand*`* *under the activities jcr:content node;* *for example, `/content/campaign/we-retail/master/myactivity/jcr:content/cq:ActivitySettings`. This node is only created after you target a component.

The **cq:ActivitySettings** node under the activity's jcr:content is protected by the following ACLs:

* Deny all for everyone
* Allow jcr:read,rep:write for "target-activity-authors" (author is a member of this group out of the box)
* Allow jcr:read,rep:write for "targetservice"

These settings ensure that normal users do not have access to the node properties. Use the same ACLs on author and on publish. See [User Administration and Security](/help/sites-administering/security.md) for more information.

## Configuring the AEM Link Externalizer {#configuring-the-aem-link-externalizer}

When editing an activity in Adobe Target, the URL points to **localhost** unless you change the URL on the AEM author node. You can configure the AEM Link Externalizer if you want the exported content to point to a specific *publish* domain.

>[!NOTE]
>
>See also [Add the Cloud Configuration](/help/sites-administering/experience-fragments-target.md#add-the-cloud-configuration).

To configure the AEM externalizer:

>[!NOTE]
>
>For more details see [Externalizing URLs](/help/sites-developing/externalizer.md).

1. Navigate to the OSGi web console at **https://&lt;server&gt;:&lt;port&gt;/system/console/configMgr.**
1. Find **Day CQ Link Externalizer** and enter the domain for the author node.

   ![Day CQ Link Externalizer](assets/aem-externalizer-01.png)
