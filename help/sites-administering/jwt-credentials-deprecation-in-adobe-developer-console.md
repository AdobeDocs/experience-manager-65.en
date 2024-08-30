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
> AEM as a Cloud service should reference [the comparable article for the AEMaaCS version](https://experienceleague.adobe.com/docs/experience-manager-cloud-service/content/security/jwt-credentials-deprecation-in-adobe-developer-console.html) for more information.

Adobe customers use [Adobe Developer Console](https://developer.adobe.com/console) to generate credentials that enable access to various APIs. Customers select from various credential types ranging from OAuth Server-to-Server to Single-Page App. One of those credential types, Service Account (JWT) credentials, has been deprecated in favor of the OAuth Server-to-Server credentials. New Service Account (JWT) credentials cannot be created on or after June 3, 2024, and existing JWT credentials will not work on or after Jan 27, 2025. You can [read about the deprecation](https://developer.adobe.com/developer-console/docs/guides/authentication/ServerToServerAuthentication/migration/).

This article provides some additional context about how Adobe Experience Manager (AEM) 6.5 customers should handle the deprecation.

The main takeaway is that AEM now supports the new OAuth Server-to-Server credentials for AEM. You may have received an email with instructions to migrate your JWT credentials, this migration can now be done.

The sections below list the scenarios where customers must (or in some cases must not) replace their Service Account (JWT) credentials with OAuth Server-to-Server credentials, now that AEM supports them. [Read how](https://developer.adobe.com/developer-console/docs/guides/authentication/ServerToServerAuthentication/migration/#migration-overview) to migrate the credentials.

## Integrating AEM with Other Adobe Solutions {#integrating-aem-with-other-adobe-solutions}

**Action**: Migrate your configuration as AEM now supports OAuth credentials.

**Relevant AEM versions**: Adobe Managed Services (Service Pack 21 and above).

AEM customers use the AEM to configure integrations with all other Adobe solutions. For example, Adobe Target, Adobe Analytics, and others.

![Integrating AEM with other solutions](/help/sites-administering/assets/jwt-deprecation.png)

See [Setting Up IMS Integrations for AEM](/help/sites-administering/setting-up-ims-integrations-for-aem.md) for details of how to:

* create configurations with OAuth credentials 
* migrate configurations, that were created with JWT credentials, to use OAuth credentials

## Cloud Manager APIs {#cloud-manager-apis}

**Action**: Confirm when these can be migrated from JWT to OAuth credentials.

**Relevant AEM versions**: Adobe Managed Services (Service Pack 21 and above).

Customers create Adobe Developer Console projects so they can invoke [Cloud Manager APIs](https://developer.adobe.com/experience-cloud/cloud-manager/guides/getting-started/create-api-integration/). The credentials in the Adobe Developer project should be migrated to the OAuth Server-to-Server credential type before the deprecated JWT credentials expire in January 2025.
