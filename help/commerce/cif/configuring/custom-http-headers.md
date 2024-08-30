---
title: Custom HTTP Headers
description: Learn how to configure custom HTTP Headers in Adobe Experience Manager Commerce.
exl-id: 834aadac-c3be-4e7a-a3cb-349608810b40
solution: Experience Manager,Commerce
feature: Commerce Integration Framework
role: Admin, Developer
---
# Custom HTTP Headers {#custom-http-headers}

## Overview {#overview}

To gain more control over their backend, authors can configure custom HTTP headers that would be sent to the commerce engine, along with the ones already sent by CIF. Common use-cases include multi-store setups in which you can use HTTP headers to control the response of the commerce back-end.

>[!NOTE]
>
>Developers can always configure custom HTTP headers using the GraphQL client configuration.
>

## Configuration {#configuration}

To configure the custom HTTP headers, one must first define them. The custom HTTP headers must first be defined by adding them to the `com.adobe.cq.cif.http.internal.HttpHeadersConfigProviderImpl` service configuration using an OSGi config.

You can configure the values of the HTTP headers in the Cloud Service Configuration page for your project:

1. Go to the Cloud Service configuration page in Tools > Cloud Services > CIF Configuration.
1. Open an existing configuration or create one.
1. Go to the "Advanced" tab and find the "Custom HTTP Headers" multi-field. You can select the headers you defined earlier and assign values to them.

The components using the above cloud service configuration sends these HTTP headers with every GraphQL request.

## Restrictions {#restrictions}

While the service allows for any header names to be defined, including the standard ones, they are not available for configuring. In other words, you cannot override the standard HTTP headers using this feature. A list of restricted header names can be found under [mdn web docs - HTTP headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers). In addition to those, there are two more headers that cannot be used:

* "Store" - used by CIF to identify the Adobe Commerce store
* "Preview-Version" - used by CIF to retrieve staged products
