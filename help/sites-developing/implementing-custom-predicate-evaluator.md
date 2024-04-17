---
title: Implementing a Custom Predicate Evaluator for the Query Builder
description: The Query Builder offers an easy way of querying the content repository
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
docset: aem65
exl-id: 72cbe589-14a1-40f5-a7cb-8960f02e0ebb
solution: Experience Manager, Experience Manager Sites
feature: Developing,Search,Query Builder
role: Developer
---
# Implementing a Custom Predicate Evaluator for the Query Builder{#implementing-a-custom-predicate-evaluator-for-the-query-builder}

This section describes how to extend the [Query Builder](/help/sites-developing/querybuilder-api.md) by implementing a custom predicate evaluator.

## Overview {#overview}

The [Query Builder](/help/sites-developing/querybuilder-api.md) offers an easy way of querying the content repository. CQ ships with a set of predicate evaluators that helps you deal with your data.

However you might want to simplify your queries by implementing a custom predicate evaluator that hides some complexity and ensures better semantics.

A custom predicate could also perform other things not directly possible with XPath, for example:

* looking up some data from some service
* custom filtering based on calculation

>[!NOTE]
>
>Performance issues must be considered when implementing a custom predicate.

>[!NOTE]
>
>You can find examples of queries in the [Query Builder](/help/sites-developing/querybuilder-api.md) section.

CODE ON GITHUB

You can find the code of this page on GitHub.

* [Open aem-search-custom-predicate-evaluator project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator/archive/master.zip)

### Predicate Evaluator in Detail {#predicate-evaluator-in-detail}

A predicate evaluator handles the evaluation of certain predicates, which are the defining constraints of a query.

It maps a higher-level search constraint (such as "width &gt; 200") to a specific JCR query that fits the actual content model (for example, metadata/@width &gt; 200). Or it can manually filter nodes and check their constraints.

>[!NOTE]
>
>For more information about the `PredicateEvaluator` and the `com.day.cq.search` package, see the [Java&trade; documentation](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/index.html?com/day/cq/search/package-summary.html).

### Implementing a Custom Predicate Evaluator for Replication Metadata {#implementing-a-custom-predicate-evaluator-for-replication-metadata}

As an example this section describes how to create a custom predicate evaluator that helps data based on the replication metadata:

* `cq:lastReplicated` that stores the date of the last replication action

* `cq:lastReplicatedBy` that stores the id of the user who triggered the last replication action

* `cq:lastReplicationAction` that stores the last replication action (for example, Activation, Deactivation)

#### Querying Replication Metadata with Default Predicate Evaluators {#querying-replication-metadata-with-default-predicate-evaluators}

The following query fetches the list of nodes in `/content` branch that have been activated by `admin` since the beginning of the year.

```xml
path=/content

1_property=cq:lastReplicatedBy
1_property.value=admin

2_property=cq:lastReplicationAction
2_property.value=Activate

daterange.property=cq:lastReplicated
daterange.lowerBound=2013-01-01T00:00:00.000+01:00
daterange.lowerOperation=>=

```

This query is valid but hard to read and does not highlight the relationship between the three replication properties. Implementing a custom predicate evaluator reduces the complexity and improve the semantic of this query.

#### Objectives {#objectives}

The goal of the `ReplicationPredicateEvaluator` is to support the above query using the following syntax.

```xml
path=/content

replic.by=admin
replic.since=2013-01-01T00:00:00.000+01:00
replic.action=Activate
```

Grouping replication metadata predicates with a custom predicate evaluator helps to create a meaningful query.

#### Updating Maven Dependencies {#updating-maven-dependencies}

>[!NOTE]
>
>The setup of new Adobe Experience Manager (AEM) projects using maven is documented by [How to Build AEM Projects using Apache Maven](/help/sites-developing/ht-projects-maven.md).

First, update the Maven dependencies of your project. The `PredicateEvaluator` is part of the `cq-search` artifact so it must be added to your Maven pom.xml file.

>[!NOTE]
>
>The scope of the `cq-search` dependency is set to `provided` because `cq-search` is provided by the `OSGi` container.

pom.xml

The following snippet shows the differences in [unified diff format](https://en.wikipedia.org/wiki/Diff#Unified_format)

```
@@ -120,6 +120,12 @@
             <scope>provided</scope>
         <dependency>
+            <groupid>com.day.cq</groupid>
+            <artifactid>cq-search</artifactid>
+            <version>5.6.4</version>
+            <scope>provided</scope>
+        </dependency>
+        <dependency>
             <groupid>junit</groupid>
             <artifactid>junit</artifactid>
             <version>3.8.1</version></dependency>
```

[aem-search-custom-predicate-evaluator](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator) - [pom.xml](https://raw.githubusercontent.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator/7aed6b35b4c8dd3655296e1b10cf40c0dd1eaa61/pom.xml)

#### Writing The ReplicationPredicateEvaluator {#writing-the-replicationpredicateevaluator}

The `cq-search` project contains the `AbstractPredicateEvaluator` abstract class. This can be extended with a few steps to implement your own custom predicate evaluator `(PredicateEvaluator`).

>[!NOTE]
>
>The following procedure explains how to build an `Xpath` expression to filter data. Another option would be to implement the `includes` method that selects data on a row basis. See the [Java&trade; documentation](https://developer.adobe.com/experience-manager/reference-materials/6-5/javadoc/com/day/cq/search/eval/PredicateEvaluator.html#includes28comdaycqsearchpredicatejavaxjcrqueryrowcomdaycqsearchevalevaluationcontext29) for more information.

1. Create a Java&trade; class which extends `com.day.cq.search.eval.AbstractPredicateEvaluator`
1. Annotate your class with a `@Component` like the following

   src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java

   The following snippet shows the differences in [unified diff format](https://en.wikipedia.org/wiki/Diff#Unified_format)

```
@@ -19,8 +19,11 @@
  */
 package com.adobe.aem.docs.search;

+import org.apache.felix.scr.annotations.Component;
+
 import com.day.cq.search.eval.AbstractPredicateEvaluator;

+@Component(metatype = false, factory = "com.day.cq.search.eval.PredicateEvaluator/repli")
 public class ReplicationPredicateEvaluator extends AbstractPredicateEvaluator {

 }
```

   [aem-search-custom-predicate-evaluator](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator) - [src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java](https://raw.githubusercontent.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator/ec70fac35fbd0d132e00c6066a204804e9cbe70f/src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java)

   >[!NOTE]
   >
   >The `factory`must be a unique string starting with `com.day.cq.search.eval.PredicateEvaluator/`and ending with the name of your custom `PredicateEvaluator`.

   >[!NOTE]
   >
   >The name of the `PredicateEvaluator` is the predicate name, which is used when building queries.

1. Override:

   ```java
   public String getXPathExpression(Predicate predicate, EvaluationContext context)
   ```

   In the override method, you build a `Xpath` expression based on the `Predicate` given in argument.

### Example of a Custom Predicate Evaluator for Replication Metadata {#example-of-a-custom-predicate-evalutor-for-replication-metadata}

The complete implementation of this `PredicateEvaluator` might be similar to the following class.

src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java

```
/*
 * #%L
 * aem-docs-custom-predicate-evaluator
 * %%
 * Copyright (C) 2013 Adobe Research
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */

package com.adobe.aem.docs.search;

import org.apache.felix.scr.annotations.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.day.cq.search.Predicate;
import com.day.cq.search.eval.AbstractPredicateEvaluator;
import com.day.cq.search.eval.EvaluationContext;

@Component(metatype = false, factory = "com.day.cq.search.eval.PredicateEvaluator/repli")

public class ReplicationPredicateEvaluator extends AbstractPredicateEvaluator {

    static final String PE_NAME = "replic";


    static final String PN_LAST_REPLICATED_BY = "cq:lastReplicatedBy";
    static final String PN_LAST_REPLICATED = "cq:lastReplicated";
    static final String PN_LAST_REPLICATED_ACTION = "cq:lastReplicationAction";

    static final String PREDICATE_BY = "by";
    static final String PREDICATE_SINCE = "since";
    static final String PREDICATE_SINCE_OP = " >= ";
    static final String PREDICATE_ACTION = "action";

    Logger log = LoggerFactory.getLogger(getClass());

    /**
     * Returns a XPath expression filtering by replication metadata.
     *
     * @see com.day.cq.search.eval.AbstractPredicateEvaluator#getXPathExpression(com.day.cq.search.Predicate,
     *      com.day.cq.search.eval.EvaluationContext)
     */

    @Override

    public String getXPathExpression(Predicate predicate,
            EvaluationContext context) {

        log.debug("predicate {}", predicate);

        String date = predicate.get(PREDICATE_SINCE);
        String user = predicate.get(PREDICATE_BY);
        String action = predicate.get(PREDICATE_ACTION);

        StringBuilder sb = new StringBuilder();

        if (date != null) {

            sb.append(PN_LAST_REPLICATED).append(PREDICATE_SINCE_OP);
            sb.append("xs:dateTime('").append(date).append("')");

        }

        if (user != null) {

            addAndOperator(sb);
            sb.append(PN_LAST_REPLICATED_BY);
            sb.append("='").append(user).append("'");

        }

        if (action != null) {

            addAndOperator(sb);
            sb.append(PN_LAST_REPLICATED_ACTION);
            sb.append("='").append(action).append("'");

        }

        String xpath = sb.toString();

        log.debug("xpath **{}**", xpath);

        return xpath;

    }

    /**
     * Add an and operator if the builder is not empty.
     *
     * @param sb a {@link StringBuilder} containing the query under construction
     */

    private void addAndOperator(StringBuilder sb) {

        if (sb.length() != 0) {

            sb.append(" and ");

        }

    }

}
```

[aem-search-custom-predicate-evaluator](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator) - [src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator/blob/master/src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java)
