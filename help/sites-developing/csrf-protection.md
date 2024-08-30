---
title: The CSRF Protection Framework
description: The framework makes use of tokens to guarantee that the client request is legitimate
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: introduction
content-type: reference
exl-id: e6b0f8f7-54b0-4dd6-86ad-5516954c6d90
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# The CSRF Protection Framework{#the-csrf-protection-framework}

In addition to the Apache Sling Referrer Filter, Adobe also provides a new CSRF Protection Framework to protect against this type of attack.

The framework makes use of tokens to guarantee that the client request is legitimate. The tokens are generated when the form is sent to the client and validated when the form is sent back to the server.

>[!NOTE]
>
>There are no tokens on the publish instances for anonymous users.

## Requirements {#requirements}

### Dependencies {#dependencies}

Any component that relies on the `granite.jquery` dependency can benefit from the CSRF Protection Framework automatically. If not, for any of your components, you must declare a dependency to `granite.csrf.standalone` before you can use the framework.

### Replicating the Crypto Key {#replicating-crypto-keys}

To use the tokens, you need to replicate the HMAC binary to all the instances in your deployment. See [Replicating the HMAC key](/help/sites-administering/encapsulated-token.md#replicating-the-hmac-key) for more details.

>[!NOTE]
>
>Make sure you also make the necessary Dispatcher configuration changes to use the CSRF Protection Framework:
>
>* [Configuring Adobe Experience Manager Dispatcher to Prevent CSRF Attacks](https://experienceleague.adobe.com/en/docs/experience-manager-dispatcher/using/configuring/configuring-dispatcher-to-prevent-csrf)
>* [Dispatcher Overview](https://experienceleague.adobe.com/en/docs/experience-manager-dispatcher/using/dispatcher)

>[!NOTE]
>
>If you use the manifest cache with your web application, make sure you add "**&ast;**" to the manifest to make sure the token does not take the CSRF token generation call offline. For more information, consult this [link](https://www.w3.org/TR/offline-webapps/).
>
>For more information on CSRF attacks and ways to mitigate them, see the [Cross-Site Request Forgery OWASP page](https://owasp.org/www-community/attacks/csrf).
