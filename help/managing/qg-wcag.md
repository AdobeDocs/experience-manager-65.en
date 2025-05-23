---
title: A Quick Guide to WCAG 2.1
description: A Quick Guide to Web Content Accessibility Guidelines (WCAG) version 2.1.
exl-id: 9cd37f5a-ff59-4617-a0f3-cd8994fbf4ab
solution: Experience Manager, Experience Manager 6.5
feature: Compliance
role: Developer,Leader,Architect,Data Architect,User
---
# A Quick Guide to WCAG 2.1{#quick-guide-to-wcag}

Adobe Experience Manager (AEM) has been developed to maximize compliance with the Web Content Accessibility Guidelines.

The [Web Content Accessibility Guidelines (WCAG) version 2.1](https://www.w3.org/TR/WCAG/) are a set of internationally recognized guidelines developed by the [World Wide Web Consortium (W3C)](https://www.w3.org/) under their [Web Accessibility Initiative (WAI)](https://www.w3.org/WAI/).

>[!NOTE]
>
>WCAG 2.1 updates the previous version WCAG 2.0, from 2008. See [WCAG 2.1 - Comparison with WCAG 2.0](https://www.w3.org/TR/WCAG21/#comparison-with-wcag-2-0).

>[!NOTE]
>
>Since these documents were written the [updated version of the guidelines, WCAG 2.2](https://www.w3.org/TR/) was made available in October 2023. 
>
>See [Comparison with WCAG 2.1](https://www.w3.org/TR/WCAG/#comparison-with-wcag-2-1) and [New Features in WCAG 2.2](https://www.w3.org/TR/WCAG/#new-features-in-wcag-2-2).

WCAG 2.1 consists of a set of technology independent guidelines and success criteria to help make web content accessible to, and usable by, persons with disabilities. They provide advice to web content authors, designers and developers on ensuring that the resources they produce are as accessible as possible to as many people as possible, regardless of any disability they have; for example, visual impairment, hearing loss, learning difficulties, age related limitations, among others.

For example, describing an image (or any other non-text content) by using the `alt` attribute in HTML greatly benefits people who are blind or partially sighted. The textual description in the `alt` attribute can either be converted into speech output or transmitted to electronic refreshable braille displays.

Additionally, WCAG 2.1 can result in advantages for other beneficiaries, including people who may be considered *situationally disabled*. People who, because of circumstances such as browsing technology, network connection speed or browsing environment, may experience barriers similar to people with disabilities.

Using Adobe Experience Manager, content authors and/or website owners can create web content that meets relevant WCAG 2.1 Level A and Level AA success criteria.

Therefore, understanding the aims of WCAG 2.1 and how the guidelines are structured is an important part of understanding web accessibility and how the guidelines can help in creating accessible web content.

The intention of WCAG 2.1 is to provide guidelines that:

* Are **technology-agnostic:**
  In other words, guidelines that can be applied to a range of web content formats, not just HTML. So WCAG 2.1 can cover content generated by or provided in PDF, Flash, JavaScript and other current and future web technologies. 

* Are **testable:**
  Each guideline is written in such a way that it can be objectively tested to ensure that a group of accessibility experts would generally agree that the guideline has been met. One of the challenges of accessibility guidelines is that while some can be technically testable, others require human judgment to ascertain whether or not the guideline has been successfully met. 

* Support **prioritized and contextual implementation:**
  WCAG 2.1 guidelines are given priorities, relating to the likely impact of not following a guideline on a particular group of users with disabilities. This allows authors to make an informed decision on the most important guidelines for their particular situation. In addition, the concept of *accessibility supported* is introduced. This allows authors to make decisions on how best to use web technologies that may not have full accessibility support, or may require users to have specific assistive technologies and/or browsers to benefit from accessibility features.

These aims have significantly influenced the structure of WCAG 2.1.

>[!NOTE]
>
>It is not possible to create a web site that caters for every possible disability or type of person. The purpose of WCAG 2.1 is to help web authors create sites that are, as far as possible, accessible within certain conditions and within reason.

## Structure {#structure}

WCAG 2.1 is structured in a way that introduces concepts of accessible web content creation in a progressively detailed manner. This may give the impression that WCAG 2.1 is a very complex set of interlinked documents, but the aim is to (progressively) provide more detailed information as and when authors need it - rather than providing it all in one very large document.

WCAG 2.1 consists of four key principles for accessible design, sometimes referred to by the acronym **POUR**. These are:

1. **Perceivable**: can a user sense the web content in question?
1. **Operable**: can a user navigate, input data, or otherwise interact with the web content?
1. **Understandable**: can a user process and comprehend the web content presented to them?
1. **Robust**: is the web content available in the intended way across a suitably wide range of browsing environments, including legacy and emerging browsing environments?

To elaborate:
* Each **principle** consists of one or more **guidelines**.

* Guidelines are worded as instructions, which are either positive (Do this...) or negative (Do not do this...).
* Guidelines are numbered 1.1 to 4.1, where the first number corresponds to the parent principle.
* Each guideline consists of one or more **success criteria**.
* Success criteria are written as statements, which are either `True` or `False` for any given web page.
* Success sriteria may include either/or choices, or may include exceptions; situations where the success criteria does not need to be met.
* Success criteria are numbered according to the parent guideline and principle, from 1.1.1 to 4.1.1. They also have a short name summarizing the intent of the criterion, for easier reference. For example, success criterion [1.1.1 is Non-text Content](https://www.w3.org/TR/WCAG/#non-text-content).
* Success criteria include a list of related **techniques** (described in more detail below).

## Supporting Resources {#supporting-resources}

In addition to the core WCAG 2.1 components of Principles, Guidelines and Success Criteria, there are a series of supporting documents. Some of them provide specific advice on how to meet aspects of the guidelines, others are more general references helping web authors, designers and developers of all abilities understand and use WCAG 2.1 as effectively as possible.

While WCAG 2.1 itself is a stable document, and will not change, most of these supporting resources are dynamic documents; they will change and grow over time, as new technologies emerge, and new examples are found of how web accessibility can be achieved.

### WCAG 2.1 Resources {#wcag-resources}

This list is not intended to be exhaustive, it provides an introduction to the resources available:
* [An outline of all WCAG related documents](https://www.w3.org/WAI/standards-guidelines/wcag/)
* [A summary of the different documents](https://www.w3.org/WAI/standards-guidelines/wcag/docs/)
* [Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/TR/WCAG21/)
* [New in WCAG 2.1](https://www.w3.org/WAI/standards-guidelines/wcag/new-in-21/)
* [A Quick Reference Guide for How to Meet WCAG 2.1](https://www.w3.org/WAI/WCAG21/quickref/)
* [WCAG 2 Frequently Asked Questions](https://www.w3.org/WAI/standards-guidelines/wcag/faq/)


### What is New in WCAG 2.1 {#what-is-new}

The guidelines provide information about what is new in WCAG 2.1:

* [What's New in WCAG 2.1](https://www.w3.org/WAI/standards-guidelines/wcag/new-in-21/) provides valuable information about the delta between WCAG 2.0 and WCAG 2.1. 

* The section [WCAG 2.0 and 2.1](https://www.w3.org/WAI/standards-guidelines/wcag/#versions) further clarifies the status of their relationship.

### Techniques for WCAG 2.1 {#techniques-for-wcag}

Techniques for WCAG 2.1 are available on the [Techniques for WCAG 2.1](https://www.w3.org/WAI/WCAG21/Techniques/) page.

**Techniques** form the level below success criteria in the WCAG 2.1 hierarchy. They are classed by WAI as informative, not normative. In other words, a specific technique does not have to be followed in order for a resource to conform with WCAG 2.1.

Because techniques are much more specific than success criteria, they usually refer to a particular technology or content type (for example, HTML, or video), or situation (for example, e-commerce or e-learning application). You can think of techniques as proven examples of how specific guidelines and success criteria can be met, so they are helpful aids to authors and developers working in particular contexts.

Techniques can be accessed:

* By collection (techniques may be general, or relate to a specific technology or format - such as HTML, CSS, or Client-side Scripting), or
* From related success criteria. Techniques can apply to more than one success criterion.

Each technique has a unique number, which relates to its collection. For example, one of the ARIA techniques is [Technique ARIA2: Identifying a required field with the aria-required property](https://www.w3.org/WAI/WCAG21/Techniques/aria/ARIA2.html).

Techniques may be Sufficient, Advisory, or a Failure:

* A *Sufficient Technique* is one, which, if followed, will be enough to meet a particular success criterion.
* An *Advisory Technique* is one, which, if followed, will have a positive impact on accessibility, but may not be enough on its own to ensure a particular success criterion is met.
* A *Failure* is a technique describing specific example of where a success criteria would not be met.

Details for techniques include a description, applicability, examples, resources for further information and details of how authors can test for successful application of the technique.

The list of techniques is not complete and WAI is constantly updating the list with new examples, reflecting developments in web technology, design approaches, and research findings. So it is well worth regularly checking the list of techniques for new additions.

### Understanding WCAG 2.1 {#understanding-wcag}

This refers to a series of documents, which provide advice helping readers to appreciate the purpose of specific guidelines and success criteria. You can [download an introduction, plus links to more detailed information](https://www.w3.org/WAI/WCAG21/Understanding/).

Each individual guideline and success criterion also has its own ‘Understanding’ page, providing information on:

* The intent of the guideline;
* Specific success criteria;
* Advisory techniques, which help in meeting the requirements of the guideline, but which do not fall under any specific success criterion.

Each success criterion’s individual "understanding" page provides information on:

* The success criterion’s intent;
* General examples of how the success criterion can be met;
* Related (non W3C) resources on how to meet the success criterion;
* Techniques and failures: specific and detailed examples of how the success criterion can be met (described in more detail below)
* Key terms - a glossary of terms important to understanding the success criterion.

An example can be found at: [Understanding Success Criterion 1.1.1 ("Non-text content")](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content).

### How to Meet WCAG 2.1 {#how-to-meet-wcag}

The ‘How to Meet’ section is available on the [How To Meet WCAG 2.1](https://www.w3.org/WAI/WCAG21/quickref/) page. This section provides an alternative presentation of WCAG, allowing readers to refine the content of the guidelines to those most relevant to their own interests and/or circumstances. Readers can filter the success criteria techniques they would like to view by specifying particular web content technologies such as Cascading Style Sheets or scripting, or specifying a particular priority level(s).

Without filtering, this resource provides all success criteria grouped by guideline. For each success criterion, the following is provided:

* The text of the success criterion;
* A link to the corresponding "understanding" document;
* A list of related Sufficient techniques, linking to details of each technique;
* A list of related Advisory techniques, linking to details of each technique (if one exists);
* A list of related failures, linking to details of each failure.
