---
title: The CSRF Protection Framework
seo-title: The CSRF Protection Framework
description: The framework makes use of tokens to guarantee that the client request is legitimate
seo-description: The framework makes use of tokens to guarantee that the client request is legitimate
uuid: 7cb222ba-fc7a-46ee-8b49-a5f39a53580b
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: introduction
content-type: reference
discoiquuid: f453427d-c813-48b7-b2f9-adadea39c67d
---

# The CSRF Protection Framework{#the-csrf-protection-framework}

In addition to the Apache Sling Referrer Filter, Adobe also provides a new CSRF Protection Framework to protect against this type of attack.

The framework makes use of tokens to guarantee that the client request is legitimate. The tokens are generated when the form is sent to the client and validated when the form is sent back to the server.

>[!NOTE]
>
>There are no tokens on the publish instances for anonymous users.

## Requirements {#requirements}

**Dependencies**

Any component that relies on the `granite.jquery` dependency will benefit from the CSRF Protection Framework automatically. If this is not the case for any of your components, you must declare a dependency to `granite.csrf.standalone` before you can use the framework.

**Replicating the Crypto Key**

In order to make use of the tokens, you need to replicate the `/etc/keys/hmac` binary to all of the instances in your deployment. A convenient way to copy the HMAC key to all the instances is to create a package containing the key and install it via the Package Manager on all the instances.

>[!NOTE]
>
>Make sure you also make the necessary [Dispatcher configuration changes](https://helpx.adobe.com/experience-manager/dispatcher/user-guide.html) in order to use the CSRF Protection Framework.

>[!NOTE]
>
>If you use the manifest cache with your web application, make sure you add "**&ast;**" to the manifest in order to make sure the token does not take the CSRF token generation call offline. For more information, consult this [link](https://www.w3.org/TR/offline-webapps/).
>
>For more information on CSRF attacks and ways to mitigate them, see the [Cross-Site Request Forgery OWASP page](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_%28CSRF%29).

