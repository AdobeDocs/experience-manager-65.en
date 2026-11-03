---
title: Same Site Cookie Support for AEM 6.5
description: Learn about the Same Site Cookie Support for AEM 6.5.
topic-tags: security
exl-id: e1616385-0855-4f70-b787-b01701929bbc
solution: Experience Manager, Experience Manager Sites
feature: Security
role: Admin
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: b1210526-416b-4ef6-bcc0-1692e99f30e9
    internal-label: Administration and security
subfeature_v2:
  - id: c35bc059-fd80-4a01-91a6-e48da3c76758
    internal-label: Security practices
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
---
# Same Site Cookie Support for AEM 6.5 {#same-site-cookie-support-for-aem-65}

Since version 80, Chrome, and later Safari, introduced a new model for cookie security. This mode is designed to introduce security controls around availability of cookies to third-party sites, through a setting called `SameSite`. For more detailed information, see this [web.dev - SameSite cookies explained](https://web.dev/samesite-cookies-explained/) article.

The default value of this setting (`SameSite=Lax`) might cause authentication between AEM instances or services to not work. This is because the domains or URL structures of these services might not fall under the constraints of this cookie policy.

To get around this, you need to set the `SameSite` cookie attribute to `None` for the login token.

>[!CAUTION]
>
>The `SameSite=None` setting is only applied if the protocol is secure (HTTPS). 
>
>If the protocol is not secure (HTTP), then the setting is ignored and the server will show this WARN message:
>
>`WARN com.day.crx.security.token.TokenCookie Skip 'SameSite=None'`

You can add the setting by following the below steps:

1. Go to the Web Console at `http://serveraddress:serverport/system/console/configMgr`
1. Search for and click the **Adobe Granite Token Authentication Handler**
1. Set the **SameSite attribute for the login-token cookie** to `None`, as shown in the image below
   ![samesite](assets/samesite1.png)
1. Click Save
1. Once this setting is updated and users are logged out and logged in again, `login-token` cookies will have the `None` attribute set and will be included in cross-site requests.
