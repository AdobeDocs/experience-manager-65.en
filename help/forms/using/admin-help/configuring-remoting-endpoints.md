---
title: Configuring Remoting endpoints
description: Learn how to configure remoting endpoints. This document explains how to enable application built with Flex to invoke the service using the AEM forms Remoting.

contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_endpoints
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 891d7d75-555a-46c6-a8a0-d5238b48bc79
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Configuring Remoting endpoints {#configuring-remoting-endpoints}

A remoting endpoint enables an application built with Flex to invoke the service using (Deprecated for AEM forms) AEM forms Remoting. A remoting endpoint is automatically created for each activated service. A Flex destination that has the same name as the endpoint is created, and Flex clients can create remote objects that point to this destination to invoke operations on the relevant service.

## Remoting endpoint settings {#remoting-endpoint-settings}

**Flex Client Authentication Method:** Determines the type of response that the server sends back to the client when the invoked service is security enabled, the operation invoked does not support anonymous invocations, and the client passes in either no or invalid credentials.
