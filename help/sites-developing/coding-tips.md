---
title: Coding Tips
description: Learn some tips for coding best-practices in Adobe Experience Manager.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
content-type: reference
topic-tags: best-practices
exl-id: 85ca35e5-6e2b-447a-9711-b12601beacdd
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Coding Tips{#coding-tips}

## Use taglibs or HTL as much as possible {#use-taglibs-or-htl-as-much-as-possible}

Including scriptlets in JSPs makes it difficult to debug issues in the code. Also, by including scriptlets in JSPs, it is difficult to separate business logic from the view layer, which is a violation of the Single Responsibility Principle and the MVC design pattern.

### Write readable code {#write-readable-code}

Code is written once, but read many times. Spending some time up front to clean the code that is written pays out dividends down the road as you and other developers read it later.

### Choose intention-revealing names {#choose-intention-revealing-names}

Ideally, another programmer should not have to open a module to understand what it does. Likewise, they should be able to tell what a method does without reading it. The better you can subscribe to these ideas, the easier it is to read the code and the faster you can write and change the code.

In the AEM code base, the following conventions are used:


* A single implementation of an interface is named `<Interface>Impl`, that is, `ReaderImpl`.
* Multiple implementations of an interface are named `<Variant><Interface>`, that is, `JcrReader` and `FileSystemReader`.
* Abstract base classes are named `Abstract<Interface>` or `Abstract<Variant><Interface>`.
* Packages are named `com.adobe.product.module`. Each Maven artifact or OSGi bundle must have its own package.
* Java&trade; implementations are placed in an impl package below their API.


These conventions do not necessarily apply to customer implementations, but it is important that conventions are defined and adhered to so that the code can stay maintainable.

Ideally, names should reveal their intention. A common code test for when names are not as clear as they should be is the presence of comments explaining what the variable or method is for:

<table>
 <tbody>
  <tr>
   <td><p><strong>Unclear</strong></p> </td>
   <td><p><strong>Clear</strong></p> </td>
  </tr>
  <tr>
   <td><p>int d; //elapsed time in days</p> </td>
   <td><p>int elapsedTimeInDays;</p> </td>
  </tr>
  <tr>
   <td><p>//get tagged images<br /> public List getItems() {}</p> </td>
   <td><p>public List getTaggedImages() {}</p> </td>
  </tr>
 </tbody>
</table>

### Do not repeat yourself  {#don-t-repeat-yourself}

DRY states that the same set of code should never be duplicated. This also applies to things like string literals. Code duplication opens the door for defects whenever something has to change and should be sought out and eliminated.

### Avoid naked CSS rules {#avoid-naked-css-rules}

CSS rules should be specific to your target element in the context of your application. For example, a CSS rule applied to *.content .center* would be overly broad and could potentially end up impacting lots of content across your system, requiring others to override this style in the future. Whereas, *.myapp-centertext* would be a more specific rule as it is specifying centered *text* in the context of your application.

### Eliminate usage of deprecated APIs {#eliminate-usage-of-deprecated-apis}

When an API is deprecated, it is always better to find the new recommended approach instead of relying on the deprecated API. This will ensure smoother upgrades in the future.

### Write localizable code {#write-localizable-code}

Any strings that are not being supplied by an author should be wrapped in a call to AEM's i18n dictionary through *I18n.get()* in JSP/Java and *CQ.I18n.get()* in JavaScript. This implementation will return the string that was passed to it if no implementation is found, so this offers the flexibility of implementing localization after implementing the features in the primary language.

### Escape resource paths for safety {#escape-resource-paths-for-safety}

While paths in the JCR should not contain spaces, the presence of them should not cause code to break. Jackrabbit provides a Text utility class with *escape()* and *escapePath()* methods. For JSPs, Granite UI exposes a *granite:encodeURIPath() EL* function.

### Use the XSS API and/or HTL to protect against cross-site scripting attacks {#use-the-xss-api-and-or-htl-to-protect-against-cross-site-scripting-attacks}

AEM provides an XSS API to easily clean parameters and ensure safety from cross-site scripting attacks. Also, HTL has these protections built directly into the templating language. An API cheat sheet is available for download at [Development - Guidelines and Best Practices](/help/sites-developing/dev-guidelines-bestpractices.md).

### Implement appropriate logging {#implement-appropriate-logging}

For Java&trade; code, AEM supports slf4j as the standard API for logging messages and should be used with the configurations made available through the OSGi console for the sake of consistency in administration. Slf4j exposes five different logging levels. Adobe recommends using the following guidelines when choosing which level to log a message at:

* ERROR: When something has broken in the code and processing cannot continue. This will often occur as a result of an unexpected exception. It is helpful to include stack traces in these scenarios.
* WARN: When something has not worked properly, but processing can continue. This will often be the result of an exception that we expected, such as a *PathNotFoundException*.
* INFO: Information that would be useful when monitoring a system. Keep in mind that this is the default and that most customers will leave this in place on their environments. Therefore, do not use it excessively.
* DEBUG: Lower level information about processing. Useful when debugging an issue with support.
* TRACE: The lowest level information, things like entering/exiting methods. This will usually only be used by developers.

If there is JavaScript, *console.log* should only be used during development and all log statements should be removed before release.

### Avoid cargo cult programming {#avoid-cargo-cult-programming}

Avoid copying code without understanding what it does. When in doubt, it is always best to ask someone who has more experience with the module or API that you are not clear on.
