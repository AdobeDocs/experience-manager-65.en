---
title: AEM Development - Guidelines and Best Practices
seo-title: AEM Development - Guidelines and Best Practices
description: Guidelines and best practices for developing on AEM
seo-description: Guidelines and best practices for developing on AEM
uuid: a67de085-4441-4a1d-bec3-2f27892a67ff
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: introduction
content-type: reference
discoiquuid: b4cf0ffc-973a-473b-80c8-7f530d111435
exl-id: 8eef7e4d-a6f2-4b87-a995-0761447283c6
---
# AEM Development - Guidelines and Best Practices{#aem-development-guidelines-and-best-practices}

## Guidelines for Using Templates and Components {#guidelines-for-using-templates-and-components}

AEM components and templates form a very powerful toolkit. They can be used by developers to provide website business users, editors, and administrators with the functionality to adapt their websites to changing business needs (content agility) while retaining the uniform layout of the sites (brand protection).

A typical challenge for a person responsible for a website, or set of websites (for example in a branch office of a global enterprise), is to introduce a new type of content presentation on their websites.

Let us assume there is a need to add a newslist page to the websites, which lists extracts from other articles already published. The page should have the same design and structure as the rest of the website.

The recommended way to approach such a challenge would be to:

* Reuse an existing template to create a new type of page. The template roughly defines page structure (navigation elements, panels, and so on), which is further fine-tuned by its design (CSS, graphics).
* Use the paragraph system (parsys/iparsys) on the new pages.
* Define access right to the Design mode of the paragraph systems, so that only authorized people (usually the administrator) can change them.
* Define the components allowed in the given paragraph system so that editors can then place the required components on the page. In our case it could be a list component, which can traverse a subtree of pages and extract the information according to predefined rules.
* Editors add and configure the allowed components, on the pages they are responsible for, to deliver the requested functionality (information) to the business.

This illustrates how this approach empowers the contributing users and administrators of the website to respond to business needs quickly, without requiring the involvement of development teams. Alternative methods, such as creating a new template, is usually a costly exercise, requiring a change management process and involvement of the development team. This makes the whole process much longer and costly.

The developers of AEM-based systems should therefore use:

* templates and access control to paragraph system design for uniformity and brand protection
* paragraph system including its configuration options for flexibility.

The following general rules for developers make sense in majority of usual projects:

* Keep the number of templates low - as low as the number of fundamentally different page structures on the web sites.
* Provide necessary flexibility and configuration capabilities to your custom components.
* Maximize use of the power and flexibility of AEM paragraph system - the parsys & iparsys components.

### Customizing Components and Other Elements {#customizing-components-and-other-elements}

When creating your own components or customizing an existing component it is often easiest (and safest) to re-use existing definitions. The same principles also applies to other elements within AEM, for example the error handler.

This can be done by copying and overlaying the existing definition. In other words, copying the definition from `/libs` to `/apps/<your-project>`. This new definition, in `/apps`, can be updated according to your requirements.

>[!NOTE]
>
>See [Using Overlays](/help/sites-developing/overlays.md) for more details.

For example:

* [Customizing a Component](/help/sites-developing/components.md)

  This involved overlaying a component definition:

    * Create a new component folder in `/apps/<website-name>/components/<MyComponent>` by copying an existing component:

        * For example, to customize the Text component copy:

            * from `/libs/foundation/components/text`
            * to `/apps/myProject/components/text`

* [Customizing pages shown by the Error Handler](/help/sites-developing/customizing-errorhandler-pages.md#how-to-customize-pages-shown-by-the-error-handler)

  This case involves overlaying a servlet:

    * In the repository, copy the default script(s):

        * from `/libs/sling/servlet/errorhandler/`
        * to `/apps/sling/servlet/errorhandler/`

>[!CAUTION]
>
>You **must not** change anything in the `/libs` path.
>
>This is because the content of `/libs` is overwritten the next time you upgrade your instance (and may well be overwritten when you apply either a hotfix or feature pack).
>
>For configuration and other changes:
>
>1. copy the item in `/libs` to `/apps`
>1. make any changes within `/apps`

## When to use JCR Queries and when not to use them {#when-to-use-jcr-queries-and-when-not-to-use-them}

JCR Queries are a powerful tool when employed correctly. They are appropriate for:

* real end-user queries, such as fulltext searches on content.
* occasions where structured content needs to be found across the entire repository.

  In such cases, make sure that queries only run when absolutely required, for example, on component activation or cache invalidation (as opposed to for example, Workflows Steps, Event Handlers that trigger on content modifications, Filters, etc).

JCR Queries should never be used for pure rendering requests. For example, JCR Queries are not appropriate for

* rendering navigation
* creating a "top 10 latest news items" overview
* showing counts of content items

For rendering content, use navigational access to the content tree instead of performing a JCR Query.

>[!NOTE]
>
>If you use the [Query Builder](/help/sites-developing/querybuilder-api.md), you use JCR Queries, as the Query Builder generates JCR Queries under the hood.
>

## Security Considerations {#security-considerations}

>[!NOTE]
>
>It is also worthwhile to reference the [security checklist](/help/sites-administering/security-checklist.md).

### JCR (Repository) Sessions {#jcr-repository-sessions}

You should use the user session, not the administrative session. This means you should use:

```java
slingRequest.getResourceResolver().adaptTo(Session.class);
```

### Protect against Cross-Site Scripting (XSS) {#protect-against-cross-site-scripting-xss}

Cross-site scripting (XSS) allows attackers to inject code into web pages viewed by other users. This security vulnerability can be exploited by malicious web users to bypass access controls.

AEM applies the principle of filtering all user-supplied content upon output. Preventing XSS is given the highest priority during both development and testing.

Additionally, a web application firewall, such as [mod_security for Apache](https://modsecurity.org), can provide reliable, central control over the security of the deployment environment and protect against previously undetected cross-site scripting attacks.

>[!CAUTION]
>
>Example code provided with AEM may not itself protect against such attacks and generally relies on request filtering by a web application firewall.

The XSS API cheat sheet contains information you need to know in order to use the XSS API and make an AEM app more secure. You can download it here:

The XSSAPI cheat sheet.

[Get File](assets/xss_cheat_sheet_2016.pdf)

### Securing Communication for Confidential Information {#securing-communication-for-confidential-information}

As for any internet application, make sure that when transporting confidential information

* traffic is secured through SSL
* HTTP POST is used if applicable

This applies to information that is confidential to the system (like configuration or administrative access) as well as information confidential to its users (like their personal details)

## Distinct Development Tasks {#distinct-development-tasks}

### Customizing Error Pages {#customizing-error-pages}

Error pages can be customized for AEM. This is advisable so that the instance does not reveal sling traces on internal server errors.

See [Customizing Error Pages shown by the Error Handler](/help/sites-developing/customizing-errorhandler-pages.md) for full details.

### Open Files in the Java Process {#open-files-in-the-java-process}

Because AEM can access a large number of files it is recommended that the number of [open files for a Java process](/help/sites-deploying/configuring.md#open-files-in-the-java-process) be explicitly configured for AEM.

To minimize this issue development should ensure that any file opened is correctly closed as soon as (meaningfully) possible.
