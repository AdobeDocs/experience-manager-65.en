---
title: AEM Commerce - GDPR Readiness
description: Learn about the procedures to handle GDPR requests in AEM Commerce and how to use them.
contentOwner: carlino
exl-id: 3a483b9d-627a-41d3-8ac1-66f9c5e89ad5
solution: Experience Manager, Experience Manager Sites
feature: Compliance
role: Admin, Developer, Leader, User
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: b1210526-416b-4ef6-bcc0-1692e99f30e9
    internal-label: Administration and security
subfeature_v2:
  - id: c42c36cf-eeed-484a-8b39-a33a68192a07
    internal-label: Compliance
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
  - id: f8a45b24-4be7-4f1b-909b-60d06b483a20
    internal-label: Leader
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
---
# AEM Commerce - GDPR Readiness{#aem-commerce-gdpr-readiness}

>[!IMPORTANT]
>
>GDPR is used as an example in the sections below, but the details covered are applicable to all data protection and privacy regulations; such as GDPR and CCPA.

The European Union's General Data Protection Regulation on data privacy rights takes effect as of May 2018. See the [GDPR page at the Adobe Privacy Center](https://business.adobe.com/privacy/general-data-protection-regulation.html).

>[!NOTE]
>
>See [AEM GDPR Readiness](/help/managing/data-protection-and-privacy.md) for further details.

![screen_shot_2018-03-22at111606](assets/screen_shot_2018-03-22at111606.jpg)

With Adobe's out-of-the-box Commerce integrations, AEM is the experience layer, consuming services and sending data back to the customer commerce platform that runs in a headless mode.

For some commerce platforms, Adobe stores profile information ( `/home/users`) and commerce tokens (to log on in the commerce platform) in AEM. For these use cases, read [Handling GDPR Requests for the AEM Platform](/help/sites-administering/handling-gdpr-requests-for-aem-platform.md).

![screen_shot_2018-03-22at111621](assets/screen_shot_2018-03-22at111621.jpg)

## Handling GDPR Requests for AEM Commerce {#handling-gdpr-requests-for-aem-commerce}

For the Salesforce Commerce Cloud integration, AEM Commerce does not store any GDPR relevant information. Forward the request to the [Salesforce Cloud](https://documentation.b2c.commercecloud.salesforce.com/DOC1/index.jsp).

For the hybris and HCL WebSphere&reg; Commerce integrations, there is some data in AEM. Use the [AEM Platform GDPR instructions](/help/sites-administering/handling-gdpr-requests-for-aem-platform.md) and consider these questions:

1. **Where is my data stored/used?** Cached user profile information such as name, commerce user identifier, token, password, and address data as shown from AEM.
1. **With whom do I share the covered GDPR data?** Any update of GDPR relevant data in AEM Commerce does not get stored (except relevant profile information, as mentioned above) but is proxied back to the commerce platform.
1. **How to delete my user data**? Delete the user profile in AEM and invoke the user deletion on the commerce platform.

>[!NOTE]
>
>Have a look at the [hybris wiki](https://wiki.hybris.com/) or the [HCL WebSphere&reg; Commerce documentation](https://help.hcltechsw.com/commerce/index.html), if necessary.
