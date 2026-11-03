---
title: Unable to use Experience Manager Forms with certain versions of Oracle JDK
description: Unable to use Experience Manager Forms with certain versions of Oracle JDK
exl-id: 6a8a7cb7-77d6-4bfc-82f3-82d0fddfc10a
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Unable to use Experience Manager Forms with certain versions of Oracle JDK {#unable-to-use-forms-with-certain-versions-of-oracle-jdk}

The issue applies to the following versions:

* Experience Manager 6.3 Forms
* Experience Manager 6.4 Forms
* Experience Manager 6.5 Forms

## Issue {#issue}

User encounters the following exception:
`Caused by: javax.xml.xpath.XPathExpressionException: javax.xml.transform.TransformerException: JAXP0801002: the compiler encountered an XPath expression containing '101' operators that exceeds the '100' limit set by 'FEATURE_SECURE_PROCESSING'.`

## Reason {#reason}

The exception occurs, when you run Experience Manager Forms with Oracle JDK (Java Development Kit) version greater than or equal to the following versions:

* [JDK7u341](https://www.oracle.com/java/technologies/javase/7u341-relnotes.html)
* [JDK8u331](https://www.oracle.com/java/technologies/javase/8u331-relnotes.html)
* [JDK11u15](https://www.oracle.com/java/technologies/javase/11-0-15-relnotes.html)

The above mentioned and later versions of Java, includes new XML processing limits in the JVM (Java Virtual Machine) which causes certain Forms specific operations to fail.

## Workaround {#workaround}

1. Stop your Experience Manager Forms Server.
1. Configure the following JVM argument for your application server:

    `-Djdk.xml.xpathExprOpLimit=2000`

    It sets the system property in JVM to a reasonably high value so that default limit is not hit.

1. Start your Experience Manager Forms Server.
