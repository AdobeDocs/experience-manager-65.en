---
title: Preventing CSRF attacks
description: Learn how to prevent Cross-site request forgery (CSRF) attacks and safeguard user data from being compromised.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: e17fc114-eba5-4e1b-8e70-ad6af7008018
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms, Security
role: User, Developer
---
# Preventing CSRF attacks {#preventing-csrf-attacks}

## How CSRF attacks work {#how-csrf-attacks-work}

Cross-site request forgery (CSRF) is a web site vulnerability where a valid user's browser is used to send a malicious request, possibly by way of an iFrame. Because the browser sends cookies on a domain basis, if the user is logged in to an application, the user's data may be compromised.

For example, consider a scenario where you are logged in to administration console in a browser. You receive an email message containing a link. You click the link, which opens a new tab in your browser. The page that you opened contains a hidden iFrame that makes a malicious request to the Forms Server using the cookie from your authenticated AEM forms session. Because User Management receives a valid cookie, it passes the request.

## CSRF-related terms {#csrf-related-terms}

**Referer:** The address of the source page from which a request is coming. For example, a web page on site1.com contains a link to site2.com. Clicking the link posts a request to site2.com. The referrer of this request is site1.com because the request is made from a page whose source is site1.com.

**Allowlisted URIs:** URIs identify resources on the Forms Server that are being requested, for example, /adminui or /contentspace. Some resources may allow a request to enter the application from external sites. These resources are considered allowlisted URIs. The Forms Server never performs a referrer check from allowlisted URIs.

**Null referer:** When you open a new browser window or tab, then type an address and press Enter, the referrer is null. The request is entirely new and not originating from a parent web page; therefore, there is no referrer for the request. The Forms Server can receive a null referrer from:

* requests made on SOAP or REST endpoints from Acrobat
* any desktop client making an HTTP request on an AEM forms SOAP or REST endpoint
* when a new browser window is opened and the URL for any AEM forms web application login page is entered

Allow a null referrer on SOAP and REST endpoints. Also allow a null referrer on all URI login pages such as /adminui and /contentspace and their corresponding mapped resources. For example, the mapped servlet for /contentspace is /contentspace/faces/jsp/login.jsp, which should be a null referrer exception. This exception is required only if you enable GET filtering for your web application. Your applications can specify whether to allow null referrers. See "Protecting from Cross-Site Request Forgery attacks" in [Hardening and Security for AEM forms](https://help.adobe.com/en_US/livecycle/11.0/HardeningSecurity/index.html).

**Allowed Referrer Exception:** Allowed Referrer Exception is a sublist of the list of allowed referrers, from which requests are blocked. Allowed Refer Exceptions are particular to a web application. If a subset of the Allowed Referrers should not be allowed to invoke a particular web application, you can blocklist the referrers by way of Allowed Referrer Exceptions. Allowed Referrer Exceptions are specified in the web.xml file for your application. (See "Protecting from Cross-Site Request Forgery attacks" in Hardening and Security for AEM forms on Help and Tutorials page.)

## How allowed referrers work {#how-allowed-referers-work}

AEM Forms provide referrer filtering, which can help prevent CSRF attacks. Here is how referrer filtering works:

1. The Forms Server checks the HTTP method used for invocation:

    * If it is POST, the Forms Server performs the referrer header check.
    * If it is GET, the Forms Server bypasses the referrer check, unless CSRF_CHECK_GETS is set to true, in which case it performs the referrer header check. CSRF_CHECK_GETS is specified in the web.xml file for your application. (See "Protecting from Cross-Site Request Forgery attacks" in [Hardening and Security guide](https://help.adobe.com/en_US/livecycle/11.0/HardeningSecurity/index.html).)

1. The Forms Server checks whether the requested URI is allowlisted:

    * If the URI is allowlisted, the server passes the request.
    * If the requested URI is not allowlisted, the server retrieves the referrer of the request.

1. If there is a referrer in the request, the server checks whether it is an allowed referrer. If it is allowed, the server checks for a referrer exception:

    * If it is an exception, the request is blocked.
    * If it is not an exception, the request is passed.

1. If there is no referrer in the request, the server checks whether a null referrer is allowed.

    * If a null referrer is allowed, the request is passed.
    * If a null referrer is not allowed, the server checks whether the requested URI is an exception for null referrer and handles the request accordingly.

## Configure allowed referrers {#configure-allowed-referers}

When you run Configuration Manager, the default host and IP address or the Forms Server are added to the Allowed Referrer list. You can edit this list in administration console.

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Configure Allowed Referrer URL's. The Allowed Referrer list appears at the bottom of the page.
1. To add an allowed referrer:

    * Type a host name or IP address in the Allowed Referrers box. To add more than one allowed referrer at a time, type each host name or IP address on a new line.
    * In the HTTP Port and HTTPS Ports boxes, specify which ports to allow for HTTP, HTTPS, or both. If you leave those boxes empty, the default ports (port 80 for HTTP and port 443 for HTTPS) are used. If you enter `0` (zero) in the boxes, all ports on that server are enabled. You can also enter a specific port number to enable only that port.
    * Click Add.

1. To remove entry from the Allowed Referrer list, select the item from the list and click Delete.

   If the Allowed Referrer List is empty, the CSRF feature stops working and the system becomes insecure.

1. After changing the Allowed Referrer list, restart the AEM Forms Server.
