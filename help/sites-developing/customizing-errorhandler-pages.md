---
title: Customizing Pages shown by the Error Handler
seo-title: Customizing Pages shown by the Error Handler
description: AEM comes with a standard error handler for handling HTTP errors
seo-description: AEM comes with a standard error handler for handling HTTP errors
uuid: aaf940fd-e428-4c7c-af7f-88b1d02c17c6
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: platform
content-type: reference
discoiquuid: 63c94c82-ed96-4d10-b645-227fa3c09f4b
---

# Customizing Pages shown by the Error Handler{#customizing-pages-shown-by-the-error-handler}

AEM comes with a standard error handler for handling HTTP errors; for example, by showing:

![chlimage_1-67](assets/chlimage_1-67.png)

System provided scripts exist (under `/libs/sling/servlet/errorhandler`) to respond to error codes, by default the following are available with a standard CQ instance:

* 403.jsp
* 404.jsp

>[!NOTE]
>
>AEM is based on Apache Sling, so see [https://sling.apache.org/site/errorhandling.html](https://sling.apache.org/site/errorhandling.html) for detailed information about Sling Error Handling.

>[!NOTE]
>
>On an author instance, [CQ WCM Debug Filter](/help/sites-deploying/osgi-configuration-settings.md) is enabled by default. This always results in the response code 200. The default error handler responds by writing the full stack trace to the response.
>
>On a publish instance, CQ WCM Debug Filter is *always* disabled (even if configured as enabled).

## How to Customize Pages shown by the Error Handler {#how-to-customize-pages-shown-by-the-error-handler}

You can develop your own scripts to customize the pages shown by the error handler when an error is encountered. Your customized pages will be created under `/apps` and overlay the default pages (that are under `/libs`).

>[!NOTE]
>
>See [Using Overlays](/help/sites-developing/overlays.md) for more details.

1. In the repository, copy the default script(s):

    * from `/libs/sling/servlet/errorhandler/`
    * to `/apps/sling/servlet/errorhandler/`

   As the destination path does not exist by default you will need to create it when doing this for the first time.

1. Navigate to `/apps/sling/servlet/errorhandler`. Here you can either:

    * edit the appropriate existing script to supply the information required.
    * create, and edit, a new script for the required code.

1. Save the changes and test.

>[!CAUTION]
>
>The 404.jsp and 403.jsp handlers have been specifically designed to cater for CQ5 authentication; in particular, to allow for system login in the case of these errors.
>
>Therefore, replacement of these two handlers should be done with great care.

### Customizing the Response to HTTP 500 Errors {#customizing-the-response-to-http-errors}

HTTP 500 errors are caused by server side exceptions.

* **[500 Internal Server Error](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html)** 
  The server encountered an unexpected condition which prevented it from fulfilling the request.

When request processing results in an exception, the Apache Sling framework (that AEM is built on):

* logs the exception
* returns:

    * the HTTP response code 500 
    * the exception stack trace

  in the body of the response.

By [customizing the pages shown by the error handler](#how-to-customize-pages-shown-by-the-error-handler) a `500.jsp` script can be created. However, it is only used if `HttpServletResponse.sendError(500)` is executed explicitly; i.e. from an exception catcher.

Otherwise, the response code is set to 500, but the `500.jsp` script is not executed.

To handle 500 errors, the file name of the error handler script must be the same as the exception class (or superclass). To handle all such exceptions you can create a script `/apps/sling/servlet/errorhandler/Throwable.js`p or `/apps/sling/servlet/errorhandler/Exception.jsp`.

>[!CAUTION]
>
>On an author instance, [CQ WCM Debug Filter](/help/sites-deploying/osgi-configuration-settings.md) is enabled by default. This always results in the response code 200. The default error handler responds by writing the full stack trace to the response.
>
>For a custom error-handler, responses with code 500 are needed - so the [CQ WCM Debug Filter needs to be disabled](/help/sites-deploying/osgi-configuration-settings.md). This ensures that the response code 500 is returned, which in turn triggers the correct Sling error-handler.
>
>On a publish instance, CQ WCM Debug Filter is *always* disabled (even if configured as enabled).

