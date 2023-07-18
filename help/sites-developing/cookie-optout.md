---
title: Configuring Cookie Usage
seo-title: Configuring Cookie Usage
description: AEM provides a service that enables you to configure and control how cookies are used with your web pages
seo-description: AEM provides a service that enables you to configure and control how cookies are used with your web pages
uuid: 10d95176-0a56-41f1-9d36-01dbdac757d4
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: 5773ec1a-f15b-462d-8f9f-54ee1d7ead44
exl-id: 42e8d804-6b6a-432e-a651-940b9f45db4e
---
# Configuring Cookie Usage{#configuring-cookie-usage}

AEM provides a service that enables you to configure and control how cookies are used with your web pages:

* A configurable server-side service maintains a list of cookies that can be used.
* A javascript API enables your javascript code to verify that a cookie can be used.

Use this feature to make sure that your pages comply with your users' consent regarding cookie usage.

## Configuring Allowed Cookies {#configuring-allowed-cookies}

Configure the Adobe Granite Opt-Out Service to specify how cookies are used on your web pages. The following table describes the properties that you can configure.

To configure the service, you can use the [Web Console](/help/sites-deploying/configuring-osgi.md#osgi-configuration-with-the-web-console) or [add an OSGi configuration to the repository](/help/sites-deploying/configuring-osgi.md#adding-a-new-configuration-to-the-repository). The following table desribes the properties that you need for either method. For an OSGi configuration, the service PID is `com.adobe.granite.optout`.

| Property Name (Web Console) |OSGi Property Name |Description |
|---|---|---|
| Opt-Out Cookies |optout.cookies |The names of cookies that indicate, when present on the user's device, that the user has not consented to using cookies. |
| Opt-Out HTTP Headers |optout.headers |The names of HTTP headers that indicate, when present, that the user has not consented to using cookies. |
| White-List Cookies |optout.whitelist.cookies |A list of cookies that are essential to the functioning of the web site, and can be used without a user's consent. |

## Validating Cookie Usage {#validating-cookie-usage}

Use client-side javascript to call Adobe Granite Opt-Out Service to verify that you can use a cookie. Use the Granite.OptOutUtil javascript object to perform any of the following tasks:

* Obtain a list of cookie names that indicate that that user does not consent to using cookies for tracking purposes.
* Obtain a list of cookies that can be used.
* Determine whether the web browser contains a cookie that indicates the user does not consent to the use of cookies for tracking.
* Determine whether a specific cookie can be used.

The granite.utils [client library folder](/help/sites-developing/clientlibs.md#referencing-client-side-libraries) provides the Granite.OptOutUtil object. Add the following code to your page head JSP to include a link to the javascript library:

`<ui:includeClientLib categories="granite.utils" />`

For example, the following javascript function determines whether the COOKIE_NAME cookie is allowed to be used before writing to it:

```
function writeCookie(value){
   if (!Granite.OptOutUtil.maySetCookie("COOKIE_NAME"))
      return;
   if (value) {
      value = encodeURIComponent(value);
      document.cookie = "COOKIE_NAME=" + value;
   }
}
```

## The Granite.OptOutUtil JavaScript Object {#the-granite-optoututil-javascript-object}

Granite.OptOutUtil enables you to determine whether cookie usage is allowed.

### getCookieNames() function {#getcookienames-function}

Returns the names of the cookies that, when present, indicate that the user has not given consent to the use of cookies.

**Parameters**

None.

**Returns**

An array of cookie names.

#### getWhitelistCookieNames() function {#getwhitelistcookienames-function}

Returns the names of cookies that can be used regardless of the user's consent.

**Parameters**

None.

**Returns**

An array of cookie names.

#### isOptedOut() function {#isoptedout-function}

Determines whether the user's browser contains any cookies that indicate that consent has not been given to use cookies.

**Parameters**

None.

**Returns**

A boolean value of `true` if a cookie is found that indicates no consent, and a value of `false` if no cookies indicate non-consent.

### maySetCookie(cookieName) function {#maysetcookie-cookiename-function}

Determines whether a specific cookie can be used on the user's browser. This function is equivalent to using the `isOptedOut` function in conjunction with determining whether the given cookie is included in the list that the `getWhitelistCookieNames` function returns.

**Parameters**

* cookieName: String. The name of the cookie.

**Returns**

A boolean value of `true` if `cookieName` can be used, or a value of `false` if `cookieName` cannot be used.
