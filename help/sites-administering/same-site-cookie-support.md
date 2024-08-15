---
title: Same Site Cookie Support for AEM 6.5
description: Learn about the Same Site Cookie Support for AEM 6.5.
topic-tags: security
exl-id: e1616385-0855-4f70-b787-b01701929bbc
solution: Experience Manager, Experience Manager Sites
feature: Security
role: Admin
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
