---
title: JWT Credentials Deprecation in Adobe Developer Console
description: Learn about the impact of JWT credentials deprecation in Adobe Developer Console on AEM
exl-id: f19a92de-ba6a-4f6d-9e12-60ad1bad2e74
solution: Experience Manager, Experience Manager Sites
feature: Security
role: Admin
---
# JWT Credentials Deprecation in Adobe Developer Console {#jwt-credentials-deprecation-in-adobe-developer-console}

>[!NOTE]
> AEM as a Cloud service should reference [this article](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/security/jwt-credentials-deprecation-in-adobe-developer-console.html) for more information.

Adobe customers use [Adobe Developer Console](https://developer.adobe.com/console) to generate credentials that enable access to various APIs. Customers select from various credential types ranging from OAuth Server-to-Server to Single-Page App. One of those credential types, Service Account (JWT) credentials, has been deprecated in favor of the OAuth Server-to-Server credentials. New Service Account (JWT) credentials cannot be created on or after June 3, 2024, and existing JWT credentials will not work on or after Jan 27, 2025. You can [read about the deprecation](https://developer.adobe.com/developer-console/docs/guides/authentication/ServerToServerAuthentication/migration/).

This article provides some additional context about how AEM 6.5 customers should handle the deprecation.

The main takeaway at this time is that AEM features do not yet support the new OAuth Server-to-Server credentials. Support will come soon -- by mid May 2024 through a special compatibility package to install for AEM 6.5, if you are running the latest Service Pack 20 or lower (Service Pack 21 and higher will automatically include it). You may have received an email with instructions to migrate your JWT credentials, but rest assured that you can and should hold off on the credentials migration until AEM supports the new OAuth Server-to-Server credential type.

The sections below list the scenarios where customers must (or in some cases must not) replace their Service Account (JWT) credentials with OAuth Server-to-Server credentials, once AEM supports them in mid-May. [Read how](https://developer.adobe.com/developer-console/docs/guides/authentication/ServerToServerAuthentication/migration/#migration-overview) to replace the credentials in the future.

## Integrating AEM with Other Adobe Solutions {#integrating-aem-with-other-adobe-solutions}

**Action**: Wait to migrate until after mid-May 2024, when AEM supports it.

**Relevant AEM versions**: Adobe Managed Services (Service Pack 20 and below).


AEM customers use the AEM Author UI to configure integrations with all other Adobe solutions. For example, Adobe Target, Adobe Analytics, Adobe Launch, AFCS, and many more.

![Integrating AEM with other solutions](/help/sites-administering/assets/jwt-deprecation.png)

As an example, here are [the instructions](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/sites/administering/integration/integration-target-ims) for configuring the integration with Adobe Target. The API key in the [Completing the IMS Configuration in AEM](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/sites/administering/integration/integration-target-ims#completing-the-ims-configuration-in-aem) section should be migrated to the OAuth Server-to-Server credential type, once AEM supports those credentials in mid-May. Those instructions will be updated will revised in mid-May to help you apply the new OAuth Server-to-Server credentials.

## Cloud Manager APIs {#cloud-manager-apis}

**Action**: Wait to migrate until after mid-May 2024, when AEM supports it.

**Relevant AEM versions**: Adobe Managed Services (Service Pack 20 and below).

Customers create Adobe Developer Console projects so they can invoke [Cloud Manager APIs](https://developer.adobe.com/experience-cloud/cloud-manager/guides/getting-started/create-api-integration/). The credentials in the Adobe Developer project should be migrated to the OAuth Server-to-Server credential type, once AEM and Cloud Manager support it.
