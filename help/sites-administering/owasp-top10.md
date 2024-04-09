---
title: OWASP Top 10
description: Learn how AEM deals with the top ten OWASP security risks.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
exl-id: 8b2a2f1d-8286-4ba5-8fe2-627509c72a45
feature: Security
solution: Experience Manager, Experience Manager Sites
role: Admin
---
# OWASP Top 10{#owasp-top}

The [Open Web Application Security Project](https://owasp.org/) (OWASP) maintains a list of what they regard as the [Top Ten Web Application Security Risks](https://owasp.org/www-project-top-ten/).

These are listed below, together with an explanation of how CRX deals with them.

## 1. Injection {#injection}

* SQL - Prevented by design: The default repository setup neither includes nor requires a traditional database, all data is stored in the content repository. All access is limited to authenticated users and can only be performed through the JCR API. SQL is supported for search queries only (SELECT). Furthermore, SQL offers value binding support.
* LDAP - LDAP injection is not possible, since the authentication module filters the input and performs the user import using the bind method.
* OS - There is no shell execution performed from within the application.

## 2. Cross-Site Scripting (XSS) {#cross-site-scripting-xss}

The general mitigation practice is to encode all output of user-generated content using a server-side XSS protection library based on [OWASP Encoder](https://owasp.org/www-project-java-encoder/) and [AntiSamy](https://wiki.owasp.org/index.php/Category:OWASP_AntiSamy_Project).

XSS is a top priority during both testing and development, and any issues found are (typically) resolved immediately.

## 3. Broken Authentication and Session Management {#broken-authentication-and-session-management}

AEM uses sound and proven authentication techniques, relying on [Apache Jackrabbit](https://jackrabbit.apache.org/jcr/index.html) and [Apache Sling](https://sling.apache.org/). Browser/HTTP Sessions are not used in AEM.

## 4. Insecure Direct Object References {#insecure-direct-object-references}

All access to data objects is mediated by the repository and therefore restricted by role-based access control.

## 5. Cross-Site Request Forgery (CSRF) {#cross-site-request-forgery-csrf}

Cross-Site Request Forgery (CSRF) is mitigated by automatically injecting a cryptographic token into all forms and AJAX requests and verifying this token on the server for every POST.

In addition, AEM ships with a referrer-header based filter, which can be configured to *only* allow POST requests from specific hosts (defined in a list).

## 6. Security Misconfiguration {#security-misconfiguration}

It is impossible to guarantee that all software is always correctly configured. However, Adobe strives to provide as much guidance as possible and make configuration as simple as possible. Furthermore, AEM ships with [integrated Security Healthchecks](/help/sites-administering/operations-dashboard.md) that help you monitor security configuration at a glance.

Review the [Security Checklist](/help/sites-administering/security-checklist.md) for more information which provides you with step-by-step hardening instructions.

## 7. Insecure Cryptographic Storage {#insecure-cryptographic-storage}

Passwords are stored as cryptographic hashes in the user node. By default, such nodes are only readable by the administrator and the user themself.

Sensitive data such as third-party credentials are stored in encrypted form using a FIPS 140-2 certified cryptographic library.

## 8. Failure to Restrict URL Access {#failure-to-restrict-url-access}

The repository allows the setting of [finely grained privileges (as specified by JCR)](https://developer.adobe.com/experience-manager/reference-materials/spec/jcr/2.0/16_Access_Control_Management.html) for any given user or group at any given path, through access control entries. Access restrictions are enforced by the repository.

## 9. Insufficient Transport Layer Protection {#insufficient-transport-layer-protection}

Mitigated by server configuration (for example, use HTTPS only).

## 10. Unvalidated Redirects and Forwards {#unvalidated-redirects-and-forwards}

Mitigated by restricting all redirects to user-supplied destinations to internal locations.
