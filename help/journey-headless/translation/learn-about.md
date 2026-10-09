---
title: Learn about headless content and how to translate it in AEM
description: Learn headless concepts, how they map to AEM, and the theory of AEM translation.
exl-id: cb2e2d89-e2d2-462f-8fff-b201847d0641
solution: Experience Manager, Experience Manager Sites
feature: Headless,Content Fragments,Language Copy
role: Admin, Developer, User, Leader
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: c45915cf-e157-4af7-a80d-97b905bcb3a5
    internal-label: Experience Manager Sites
feature_v2:
  - id: bfd4bc52-c397-5127-8f86-8953ba9fc0a3
    internal-label: Headless
  - id: a642c50e-80eb-4fc1-a5d2-f3762d1f841d
    internal-label: Administration
  - id: d9d38edd-df1b-480c-8f5e-72b62576f390
    internal-label: Site and page features
subfeature_v2:
  - id: e9db7c79-8f65-4281-a439-c9049296d903
    internal-label: Content Fragments
  - id: e15a4109-ae5d-497d-b301-31149e35aed4
    internal-label: Language Copy Wizard
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: f8a45b24-4be7-4f1b-909b-60d06b483a20
    internal-label: Leader
---
# Learn about headless content and how to translate it in AEM {#learn-about}

Learn headless concepts, how they map to AEM, and the theory of AEM translation.

## Objective {#objective}

This document helps you understand headless content delivery, how AEM supports headless, and how such content can be translated. After reading you should:

* Understand the basic concepts of headless content delivery.
* Be familiar with how AEM supports headless and translation.

## Full-Stack Content Delivery {#full-stack}

Ever since the rise of easy-to-use, large-scale content management systems (CMSes), organizations have used them as a central location to manage messaging, branding, and communications. Using the CMS as a central point for administering experiences improved efficiency by eliminating the need to duplicate tasks in disparate systems.

![The classic full-stack CMS](/help/journey-headless/developer/assets/full-stack.png)

In a full-stack CMS, all the functionality for manipulating content is in the CMS. Features of the system make up different components of the CMS stack. The full-stack solution has many advantages.

* There is one system to maintain.
* Content is managed centrally.
* All services of the system are integrated.
* Content authoring is seamless.

So if new channel must be added or support for new types of experiences is required, one (or more) new components can be inserted into the stack and there is only one place to make changes.

![Adding a new channel to the stack](/help/journey-headless/developer/assets/adding-channel.png)

However the complexity of the dependencies within the stack quickly becomes apparent as other items in the stack need to be adjusted to accommodate the changes.

## The Head in Headless {#the-head}

The head of any system is generally the output renderer of that system, typically in the form of a GUI or other graphical output.

When we talk about a headless CMS, the CMS manages the content and continues to deliver it to consumers. However, by only delivering the **content** in a standardized fashion, a headless CMS omits the final output rendering, leaving the **presentation** of the content to the consuming service.

![Headless CMS](/help/journey-headless/developer/assets/headless-cms.png)

The consuming services, be they AR experiences, a web shop, mobile experiences, progressive web apps (PWAs), and so on, take in content from the headless CMS and provide their own rendering. They take care of providing their own heads for your content.

Omitting the head simplifies the CMS by removing complexity. Doing this also shifts the responsibility of rendering the content to the services that actually need the content and are often better suited to such rendering.

## Translating Headless Content in AEM {#translating-in-aem}

In addition to offering robust tools to create, manage, and deliver traditional webpages in the full-stack fashion, AEM also offers the ability to author self-contained selections of content and serve them headlessly.

The power of AEM allows it to deliver content either headlessly, full-stack, or in both models at the same time. For the translation specialist, the same set of translation tools can be applied to both types of content, giving you a unified approach for translating your content.

Further in the journey you will learn the details about how AEM translates content, but at a high level, the concept is simple:

1. Define a connection to a translation service by configuring the translation integration framework.
1. Define which content should be translated using translation rules.
1. Create a translation project to harvest the content, send it to the translation service, and receive the results.
1. Review and publish the translated content.

## What's Next {#what-is-next}

Thanks for getting started on your AEM headless translation journey! Now that you read this document you should:

* Understand the basic concepts of headless content delivery.
* Be familiar with how AEM supports headless and translation.

Build on this knowledge and continue your AEM headless translation journey by next reviewing the document [Get started with AEM headless translation](getting-started.md) where you will have an overview of how AEM manages headless content and get to know its translation tools.

## Additional Resources {#additional-resources}

While it is recommended that you move on to the next part of the headless translation journey by reviewing the document [Get started with AEM headless translation,](getting-started.md) the following are some additional, optional resources that do a deeper dive on some concepts mentioned in this document, but they are not required to continue on the headless journey.

* [MSM and Translation](/help/sites-administering/msm-and-translation.md) - The details of AEM's Multi-Site Manager and how it works with its translation tools
* An [Introduction to AEM as a Headless CMS](/help/sites-developing/headless/introduction.md)
* The [AEM Developer Portal](https://experienceleague.adobe.com/landing/experience-manager/headless/developer.html)
* [Tutorials for Headless in AEM](https://experienceleague.adobe.com/docs/experience-manager-learn/getting-started-with-aem-headless/overview.html)
