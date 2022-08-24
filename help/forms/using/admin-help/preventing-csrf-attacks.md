---
title: Preventing CSRF attacks
seo-title: Preventing CSRF attacks
description: Learn how to prevent Cross-site request forgery (CSRF) attacks and safeguard user data from being compromised.
seo-description: Learn how to prevent Cross-site request forgery (CSRF) attacks and safeguard user data from being compromised.
uuid: f3553826-f5eb-40ea-aeb7-90e4ad30598c
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: a3cbffb7-c1d1-47c2-bcfd-70f1e2d81ac9
exl-id: e17fc114-eba5-4e1b-8e70-ad6af7008018
---
# Preventing CSRF attacks {#preventing-csrf-attacks}

## How CSRF attacks work {#how-csrf-attacks-work}

Cross-site request forgery (CSRF) is a web site vulnerability where a valid user’s browser is used to send a malicious request, possibly via an iFrame. Because the browser sends cookies on a domain basis, if the user is currently logged in to an application, the user’s data may be compromised.

For example, consider a scenario where you are logged in to administration console in a browser. You receive an email message containing a link. You click the link, which opens a new tab in your browser. The page that you opened contains a hidden iFrame that makes a malicious request to the forms server using the cookie from your authenticated AEM forms session. Because User Management receives a valid cookie, it passes the request.

## CSRF-related terms {#csrf-related-terms}

**Referer:** The address of the source page from which a request is coming. For example, a web page on site1.com contains a link to site2.com. Clicking the link posts a request to site2.com. The referer of this request is site1.com because the request is made from a page whose source is site1.com.

**Allowlisted URIs:** URIs identify resources on the forms server that are being requested, for example, /adminui or /contentspace. Some resources may allow a request to enter the application from external sites. These resources are considered allowlisted URIs. The forms server never performs a referer check from allowlisted URIs.

**Null referer:** When you open a new browser window or tab, then type an address and press Enter, the referer is null. The request is entirely new and not originating from a parent web page; therefore, there is no referer for the request. The forms server can receive a null referer from:

* requests made on SOAP or REST endpoints from Acrobat
* any desktop client making an HTTP request on a AEM forms SOAP or REST endpoint
* when a new browser window is opened and the URL for any AEM forms web application login page is entered

Allow a null referer on SOAP and REST endpoints. Also allow a null referer on all URI login pages such as /adminui and /contentspace and their corresponding mapped resources. For example, the mapped servlet for /contentspace is /contentspace/faces/jsp/login.jsp, which should be a null referer exception. This exception is required only if you enable GET filtering for your web application. Your applications can specify whether to allow null referers. See "Protecting from Cross-Site Request Forgery attacks" in [Hardening and Security for AEM forms](https://help.adobe.com/en_US/livecycle/11.0/HardeningSecurity/index.html).

**Allowed Referer Exception:** Allowed Referer Exception is a sublist of the list of allowed referers, from which requests are blocked. Allowed Refer Exceptions are particular to a web application. If a subset of the Allowed Referers should not be allowed to invoke a particular web application, you can blocklist the referers via Allowed Referer Exceptions. Allowed Referer Exceptions are specified in the web.xml file for your application. (See "Protecting from Cross-Site Request Forgery attacks" in Hardening and Security for AEM forms on Help and Tutorials page.)

## How allowed referers work {#how-allowed-referers-work}

AEM forms provides referer filtering, which can help prevent CSRF attacks. Here is how referer filtering works:

1. The forms server checks the HTTP method used for invocation:

    * If it is POST, the forms server performs the referer header check.
    * If it is GET, the forms server bypasses the referer check, unless CSRF_CHECK_GETS is set to true, in which case it performs the referer header check. CSRF_CHECK_GETS is specified in the web.xml file for your application. (See "Protecting from Cross-Site Request Forgery attacks" in [Hardening and Security guide](https://help.adobe.com/en_US/livecycle/11.0/HardeningSecurity/index.html).)

1. The forms server checks whether the requested URI is allowlisted:

    * If the URI is allowlisted, the server passes the request.
    * If the requested URI is not allowlisted, the server retrieves the referer of the request.

1. If there is a referer in the request, the server checks whether it is an allowed referer. If it is allowed, the server checks for a referer exception:

    * If it is an exception, the request is blocked.
    * If it is not an exception, the request is passed.

1. If there is no referer in the request, the server checks whether a null referer is allowed.

    * If a null referer is allowed, the request is passed.
    * If a null referer is not allowed, the server checks whether the requested URI is an exception for null referer and handles the request accordingly.

## Configure allowed referers {#configure-allowed-referers}

When you run Configuration Manager, the default host and IP address or the forms server are added to the Allowed Referer list. You can edit this list in administration console.

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Configure Allowed Referer URL’s. The Allowed Referer list appears at the bottom of the page.
1. To add an allowed referer:

    * Type a host name or IP address in the Allowed Referers box. To add more than one allowed referer at a time, type each host name or IP address on a new line.
    * In the HTTP Port and HTTPS Ports boxes, specify which ports to allow for HTTP, HTTPS, or both. If you leave those boxes empty, the default ports (port 80 for HTTP and port 443 for HTTPS) are used. If you enter `0` (zero) in the boxes, all ports on that server are enabled. You can also enter a specific port number to enable only that port.
    * Click Add.

1. To remove entry from the Allowed Referer list, select the item from the list and click Delete.

   If the Allowed Referer List is empty, the CSRF feature stops working and the system becomes insecure.

1. After changing the Allowed Referer list, restart the AEM forms server.
