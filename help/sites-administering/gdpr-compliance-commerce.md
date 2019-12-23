---
title: AEM Commerce - GDPR Readiness
seo-title: AEM Commerce - GDPR Readiness
description: null
seo-description: null
uuid: 7ca26587-8cce-4c75-8629-e0e5cfb8166c
contentOwner: carlino
discoiquuid: c637964a-dfcb-41fe-9c92-934620fe2cb3
---

# AEM Commerce - GDPR Readiness{#aem-commerce-gdpr-readiness}

>[!IMPORTANT]
>
>GDPR is used as an example in the sections below, but the details covered are applicable to all data protection and privacy regulations; such as GDPR, CCPA etc.

The European Union's General Data Protection Regulation on data privacy rights takes effect as of May 2018. For further information see the [GDPR page at the Adobe Privacy Center](https://www.adobe.com/privacy/general-data-protection-regulation.html).

>[!NOTE]
>
>See [AEM GDPR Readiness](/help/managing/data-protection-and-privacy.md) for further details.

![screen_shot_2018-03-22at111606](assets/screen_shot_2018-03-22at111606.jpg)

In our out-of-the-box Commerce integrations, AEM is the experience layer, consuming services and sending data back to the customer commerce platform that runs in a headless mode.

For some commerce platforms, we store profile information ( `/home/users`) and commerce tokens (to login in the commerce platform) in AEM. For these use cases, please read [Handling GDPR Requests for the AEM Platform](/help/sites-administering/handling-gdpr-requests-for-aem-platform.md).

![screen_shot_2018-03-22at111621](assets/screen_shot_2018-03-22at111621.jpg)

## Handling GDPR Requests for AEM Commerce {#handling-gdpr-requests-for-aem-commerce}

For the Salesforces Commerce Cloud integration, AEM Commerce does not store any GDPR relevant information. You should forward the request to the [Salesforce Cloud](https://documentation.demandware.com/).

For the hybris and IBM WebSphere integrations, there is some data in AEM. You should use the [AEM Platform GDPR instructions](/help/sites-administering/handling-gdpr-requests-for-aem-platform.md) and consider these questions:

1. **Where is my data stored/used?** Cached user profile information such as name, commerce user identifier, token, password, address data, and so on is shown from AEM.
1. **With whom do I share the covered GDPR data?** Any update of GDPR relevant data in AEM Commerce does not get stored (except relevant profile information, as mentionned above) but is proxied back to the commerce platform.
1. **How to delete my user data**? Delete the user profile in AEM and invoke the user deletion on the commerce platform.

>[!NOTE]
>
>Have a look at the [hybris wiki](https://wiki.hybris.com/) or the [Websphere Commerce documentation](https://www-01.ibm.com/support/docview.wss?uid=swg27036450) if required.

