---
title: Content Services
seo-title: Content Services
description: Content Services
seo-description: null
uuid: 7bd09c91-3931-400b-bdfc-b064b9ca9668
contentOwner: User
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/MOBILE
discoiquuid: 6a7e5472-cb57-4c78-b183-7c6dcac11a4e
exl-id: 955ffb1c-4fa9-43bb-8e5b-2df7f2d17951
---
# Content Services{#content-services}

>[!NOTE]
>
>Adobe recommends using the SPA Editor for projects that require single page application framework-based client-side rendering (e.g. React). [Learn more](/help/sites-developing/spa-overview.md).

>[!CAUTION]
>
>The Content Services feature is documented for preview purposes only.
>
>It is subject to change with the release of 6.3 GA Service Pack 1.

AEM Mobile Content Services is a lightweight, feature for requesting content that is managed by AEM. This provides all app developers with a high performing way to retrieve content without having to have deep knowledge of AEM's content repository (JCR) and web framework (Sling). It allows the requesting applications to be decoupled from the content repository.

Content Services introduces several new AEM constructs that allows a developer to access AEM managed content without knoweldge of the repository structure of that content.

These constructs are necessary to maintain flexibility and to enable future expansion by providing an abstraction layer between the AEM managed content and the mobile apps consuming the content. This allows AEM Content Services to work as an abstraction layer between the native application’s content requirements and the AEM content repository.

Content Services can deliver the content as assets, packaged HTML (HTML/CSS/JS), or as channel independent content.

>[!CAUTION]
>
>**Prerequisites:**
>
>Before you get started with Content Services, ensure to enable Content Services flag. To enable creation and management of models in your app, you need to enable data models in Configuration Browser.
>
>See **[Administering Content Services](/help/mobile/developing-content-services.md)** and the [Configuration Browser](/help/sites-administering/configurations.md) documentation for more information.

![chlimage_1-143](assets/chlimage_1-143.png)

Once you have set the Content Services flag and enabled data models in Configuration Browser, see the resources below to get started with AEM Mobile Content Services, get familiar with Content Services Concepts such as model management, entity management followed by content delivery/rendering for AEM Mobile Content Services.

* Models in Repository
* Rendering and Delivery
