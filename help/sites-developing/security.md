---
title: Security
description: Application Security starts during the development phase
exl-id: c4f7f45f-224b-4fc3-b4b0-f5b21b8a466f
solution: Experience Manager, Experience Manager Sites
feature: Developing,Security
role: Developer
---
# Security{#security}

Application Security starts during the development phase. Adobe recommends applying the following security best practices.

## Use Request Session {#use-request-session}

Following the principle of least privilege, Adobe recommends that every repository access is done by using the session bound to the user request and proper access control.

## Protect against Cross-Site Scripting (XSS) {#protect-against-cross-site-scripting-xss}

Cross-site scripting (XSS) allows attackers to inject code into web pages viewed by other users. This security vulnerability can be exploited by malicious web users to bypass access controls.

AEM applies the principle of filtering all user-supplied content upon output. Preventing XSS is given the highest priority during both development and testing.

The XSS protection mechanism provided by AEM is based on the [AntiSamy Java&trade; Library](https://wiki.owasp.org/index.php/Category:OWASP_AntiSamy_Project) provided by [OWASP (The Open Web Application Security Project)](https://owasp.org/). The default AntiSamy configuration can be found at

`/libs/cq/xssprotection/config.xml`

It is important that you adapt this configuration to your own security needs by overlaying the configuration file. The official [AntiSamy documentation](https://wiki.owasp.org/index.php/Category:OWASP_AntiSamy_Project) provides you with all the information you need to implement your security requirements.

>[!NOTE]
>
>Adobe recommends that you always access to the XSS protection API by using the [XSSAPI provided by AEM](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/adobe/granite/xss/XSSAPI.html).

Also, a web application firewall, such as [mod_security for Apache](https://www.modsecurity.org), can provide reliable, central control over the security of the deployment environment and protect against previously undetected cross-site scripting attacks.

## Access to Cloud Service Information {#access-to-cloud-service-information}

>[!NOTE]
>
>ACLs for the Cloud Service Information and the OSGi settings required to secure your instance are automated as part of the [Production Ready Mode](/help/sites-administering/production-ready.md). While this means that you do not need to change the configuration manually, it is still recommended that you review them before you go live with your deployment.

When you [integrate your AEM instance with the Adobe Experience Cloud](/help/sites-administering/marketing-cloud.md), you use [Cloud Service configurations](/help/sites-developing/extending-cloud-config.md). Information about these configurations, together with any statistics collected are stored in the repository. Adobe recommends that, if you are using this functionality, you review whether the default security on this information matches your requirements.

The webservicesupport module writes statistics and configuration information under:

`/etc/cloudservices`

With the default permissions:

* Author environment: `read` for `contributors`

* Publish environment: `read` for `everyone`

## Protect against Cross-Site Request Forgery Attacks {#protect-against-cross-site-request-forgery-attacks}

For more information on the security mechanisms AEM employs to mitigate CSRF attacks, see the [Sling Referrer Filter](/help/sites-administering/security-checklist.md#protect-against-cross-site-request-forgery) section of the Security Checklist and the [CSRF Protection Framework documentation](/help/sites-developing/csrf-protection.md).
