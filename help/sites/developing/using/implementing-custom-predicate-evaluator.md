---
title: Implementing a Custom Predicate Evaluator for the Query Builder
seo-title: Implementing a Custom Predicate Evaluator for the Query Builder
description: The Query Builder offers an easy way of querying the content repository
seo-description: The Query Builder offers an easy way of querying the content repository
uuid: cbe5680c-5f76-4070-a826-b216be077e21
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: platform
content-type: reference
discoiquuid: 7390acf8-87a6-4537-aa35-377c26118269
index: y
internal: n
snippet: y
---

# Implementing a Custom Predicate Evaluator for the Query Builder{#implementing-a-custom-predicate-evaluator-for-the-query-builder}

This section describes how to extend the [Query Builder](/sites/developing/using/querybuilder-api.md) by implementing a custom predicate evaluator.

<!--
Comment Type: remark
Last Modified By: (colligno@adobe.com)
Last Modified Date: 2017-11-30T05:25:04.926-0500
<p>Documentation tracked under : <a href="https://issues.adobe.com/browse/DOC-2391">https://issues.adobe.com/browse/DOC-2391</a></p>
-->

### Overview {#overview}

The [Query Builder](/sites/developing/using/querybuilder-api.md) offers an easy way of querying the content repository. CQ ships with a set of predicate evaluators that helps you deal with your data.

However you might want to simplify your queries by implementing a custom predicate evaluator that hides some complexity and ensures a better semantic.

A custom predicate could also perform other things not directly possible with XPath, for example:

* looking up some data from some service
* custom filtering based on calculation

>[!NOTE]
>
>Performance issues must be considered when implementing a custom predicate.

>[!NOTE]
>
>You can find examples of queries in the [Query Builder](/sites/developing/using/querybuilder-api.md) section.

CODE ON GITHUB

You can find the code of this page on GitHub

* [Open aem-search-custom-predicate-evaluator project on GitHub](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator)
* Download the project as [a ZIP file](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator/archive/master.zip)

### Predicate Evaluator in Detail {#predicate-evaluator-in-detail}

A predicate evaluator handles the evaluation of certain predicates, which are the defining constraints of a query.

It maps a higher-level search constraint (such as "width &gt; 200") to a specific JCR query that fits the actual content model (e.g. metadata/@width &gt; 200). Or it can manually filter nodes and check their constraints.

>[!NOTE]
>
>For more information about the `PredicateEvaluator` and the `com.day.cq.search` package see the [Java documentation](/sites/developing/using/reference-materials/javadoc/index.html?com/day/cq/search/package-summary.md).

### Implementing a Custom Predicate Evaluator for Replication Metadata {#implementing-a-custom-predicate-evaluator-for-replication-metadata}

As an example this section describes how to create a custom predicate evaluator that helps data based on the replication metadata:

* `cq:lastReplicated` that stores the date of the last replication action  

* `cq:lastReplicatedBy` that stores the id of the user who triggered the last replication action  

* `cq:lastReplicationAction` that stores the last replication action (e.g. Activation, Deactivation)

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

This query is valid but hard to read and does not highlight the relationship between the three replication properties. Implementing a custom predicate evaluator will reduce the complexity and improve the semantic of this query.

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
>The set up of new AEM projects using maven is documented by [How to Build AEM Projects using Apache Maven](../../../sites/developing/using/ht-projects-maven.md).

First you need to update the Maven dependencies of your project. The `PredicateEvaluator` is part of the `cq-search` artifact so it needs to be added to your Maven pom file.

>[!NOTE]
>
>The scope of the `cq-search` dependency is set to `provided` because `cq-search` will be provided by the `OSGi` container.

pom.xml

The following snippet shows the differences, in [unified diff format](https://en.wikipedia.org/wiki/Diff#Unified_format)

<table border="0" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td><p> </p> <p><span class="code">@@ -120,6 +120,12 @@</span></p> <p><span class="code"> &amp;lt;scope&amp;gt;provided&amp;lt;/scope&amp;gt;</span></p> <p><span class="code"> </span></p> <p><span class="code"> &amp;lt;dependency&amp;gt;</span></p> <p><span class="code">+ &amp;lt;groupid&amp;gt;com.day.cq&amp;lt;/groupid&amp;gt;</span></p> <p><span class="code">+ &amp;lt;artifactid&amp;gt;cq-search&amp;lt;/artifactid&amp;gt;</span></p> <p><span class="code">+ &amp;lt;version&amp;gt;5.6.4&amp;lt;/version&amp;gt;</span></p> <p><span class="code">+ &amp;lt;scope&amp;gt;provided&amp;lt;/scope&amp;gt;</span></p> <p><span class="code">+ &amp;lt;/dependency&amp;gt;</span></p> <p><span class="code">+ &amp;lt;dependency&amp;gt;</span></p> <p><span class="code"> &amp;lt;groupid&amp;gt;junit&amp;lt;/groupid&amp;gt;</span></p> <p><span class="code"> &amp;lt;artifactid&amp;gt;junit&amp;lt;/artifactid&amp;gt;</span></p> <p><span class="code"> &amp;lt;version&amp;gt;3.8.1&amp;lt;/version&amp;gt;&amp;lt;/dependency&amp;gt;</span></p> <p> </p> </td> 
  </tr> 
 </tbody> 
</table>

[aem-search-custom-predicate-evaluator](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator)- [pom.xml](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator/raw/7aed6b35b4c8dd3655296e1b10cf40c0dd1eaa61/pom.xml)

#### Writing The ReplicationPredicateEvaluator {#writing-the-replicationpredicateevaluator}

The `cq-search` project contains the `AbstractPredicateEvaluator` abstract class. This can be extended with a few steps to implement your own custom predicate evaluator `(PredicateEvaluator`).

>[!NOTE]
>
>The following procedure explains how to build an `Xpath` expression to filter data. Another option would be to implement the `includes` method that selects data on a row basis. See the [Java documentation](/sites/developing/using/reference-materials/javadoc/com/day/cq/search/eval/PredicateEvaluator.md#includes28comdaycqsearchpredicatejavaxjcrqueryrowcomdaycqsearchevalevaluationcontext29) for more information.

1. Create a new Java class which extends `com.day.cq.search.eval.AbstractPredicateEvaluator`
1. Annotate your class with a `@Component` like the following

   src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java

   The following snippet shows the differences, in [unified diff format](https://en.wikipedia.org/wiki/Diff#Unified_format)

<table border="0" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td><p> </p> <p><span class="code">@@ -19,8 +19,11 @@</span></p> <p><span class="code"> */</span></p> <p><span class="code"> package com.adobe.aem.docs.search;</span></p> <p><span class="code"> </span></p> <p><span class="code">+import org.apache.felix.scr.annotations.Component;</span></p> <p><span class="code">+</span></p> <p><span class="code"> import com.day.cq.search.eval.AbstractPredicateEvaluator;</span></p> <p><span class="code"> </span></p> <p><span class="code">+@Component(metatype = false, factory = "com.day.cq.search.eval.PredicateEvaluator/repli")</span></p> <p><span class="code"> public class ReplicationPredicateEvaluator extends AbstractPredicateEvaluator {</span></p> <p><span class="code"> </span></p> <p><span class="code"> }</span></p> <p> </p> </td> 
  </tr> 
 </tbody> 
</table>

   [aem-search-custom-predicate-evaluator](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator)- [src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator/raw/ec70fac35fbd0d132e00c6066a204804e9cbe70f/src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java)

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

   In the override method you build a `Xpath` expression based on the `Predicate` given in argument.

### Example of a Custom Predicate Evalutor for Replication Metadata {#example-of-a-custom-predicate-evalutor-for-replication-metadata}

The complete implementation of this `PredicateEvaluator` might be similar to the following class.

src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java

<table border="0" cellpadding="0" cellspacing="0"> 
 <tbody> 
  <tr> 
   <td><p>1</p> <p>2</p> <p>3</p> <p>4</p> <p>5</p> <p>6</p> <p>7</p> <p>8</p> <p>9</p> <p>10</p> <p>11</p> <p>12</p> <p>13</p> <p>14</p> <p>15</p> <p>16</p> <p>17</p> <p>18</p> <p>19</p> <p>20</p> <p>21</p> <p>22</p> <p>23</p> <p>24</p> <p>25</p> <p>26</p> <p>27</p> <p>28</p> <p>29</p> <p>30</p> <p>31</p> <p>32</p> <p>33</p> <p>34</p> <p>35</p> <p>36</p> <p>37</p> <p>38</p> <p>39</p> <p>40</p> <p>41</p> <p>42</p> <p>43</p> <p>44</p> <p>45</p> <p>46</p> <p>47</p> <p>48</p> <p>49</p> <p>50</p> <p>51</p> <p>52</p> <p>53</p> <p>54</p> <p>55</p> <p>56</p> <p>57</p> <p>58</p> <p>59</p> <p>60</p> <p>61</p> <p>62</p> <p>63</p> <p>64</p> <p>65</p> <p>66</p> <p>67</p> <p>68</p> <p>69</p> <p>70</p> <p>71</p> <p>72</p> <p>73</p> <p>74</p> <p>75</p> <p>76</p> <p>77</p> <p>78</p> <p>79</p> <p>80</p> <p>81</p> <p>82</p> <p>83</p> <p>84</p> <p>85</p> <p>86</p> <p>87</p> <p>88</p> <p>89</p> <p>90</p> <p>91</p> <p>92</p> <p>93</p> <p>94</p> </td> 
   <td><p> </p> <p><span class="code">/*</span></p> <p><span class="code"> * #%L</span></p> <p><span class="code"> * aem-docs-custom-predicate-evaluator</span></p> <p><span class="code"> * %%</span></p> <p><span class="code"> * Copyright (C) 2013 Adobe Research</span></p> <p><span class="code"> * %%</span></p> <p><span class="code"> * Licensed under the Apache License, Version 2.0 (the "License");</span></p> <p><span class="code"> * you may not use this file except in compliance with the License.</span></p> <p><span class="code"> * You may obtain a copy of the License at</span></p> <p><span class="code"> *</span></p> <p><span class="code"> * <a href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a></span></p> <p><span class="code"> *</span></p> <p><span class="code"> * Unless required by applicable law or agreed to in writing, software</span></p> <p><span class="code"> * distributed under the License is distributed on an "AS IS" BASIS,</span></p> <p><span class="code"> * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.</span></p> <p><span class="code"> * See the License for the specific language governing permissions and</span></p> <p><span class="code"> * limitations under the License.</span></p> <p><span class="code"> * #L%</span></p> <p><span class="code"> */</span></p> <p><span class="code">package com.adobe.aem.docs.search;</span></p> <p><span class="code"> </span></p> <p><span class="code">import org.apache.felix.scr.annotations.Component;</span></p> <p><span class="code">import org.slf4j.Logger;</span></p> <p><span class="code">import org.slf4j.LoggerFactory;</span></p> <p><span class="code"> </span></p> <p><span class="code">import com.day.cq.search.Predicate;</span></p> <p><span class="code">import com.day.cq.search.eval.AbstractPredicateEvaluator;</span></p> <p><span class="code">import com.day.cq.search.eval.EvaluationContext;</span></p> <p><span class="code"> </span></p> <p><span class="code">@Component(metatype = false, factory = "com.day.cq.search.eval.PredicateEvaluator/repli")</span></p> <p><span class="code">public class ReplicationPredicateEvaluator extends AbstractPredicateEvaluator {</span></p> <p><span class="code"> static final String PE_NAME = "replic";</span></p> <p><span class="code"> </span></p> <p><span class="code"> static final String PN_LAST_REPLICATED_BY = "cq:lastReplicatedBy";</span></p> <p><span class="code"> static final String PN_LAST_REPLICATED = "cq:lastReplicated";</span></p> <p><span class="code"> static final String PN_LAST_REPLICATED_ACTION = "cq:lastReplicationAction";</span></p> <p><span class="code"> </span></p> <p><span class="code"> static final String PREDICATE_BY = "by";</span></p> <p><span class="code"> static final String PREDICATE_SINCE = "since";</span></p> <p><span class="code"> static final String PREDICATE_SINCE_OP = " &amp;gt;= ";</span></p> <p><span class="code"> static final String PREDICATE_ACTION = "action";</span></p> <p><span class="code"> </span></p> <p><span class="code"> Logger log = LoggerFactory.getLogger(getClass());</span></p> <p><span class="code"> </span></p> <p><span class="code"> /**</span></p> <p><span class="code"> * Returns a XPath expression filtering by replication metadata.</span></p> <p><span class="code"> *</span></p> <p><span class="code"> * @see com.day.cq.search.eval.AbstractPredicateEvaluator#getXPathExpression(com.day.cq.search.Predicate,</span></p> <p><span class="code"> * com.day.cq.search.eval.EvaluationContext)</span></p> <p><span class="code"> */</span></p> <p><span class="code"> @Override</span></p> <p><span class="code"> public String getXPathExpression(Predicate predicate,</span></p> <p><span class="code"> EvaluationContext context) {</span></p> <p><span class="code"> </span></p> <p><span class="code"> log.debug("predicate {}", predicate);</span></p> <p><span class="code"> </span></p> <p><span class="code"> String date = predicate.get(PREDICATE_SINCE);</span></p> <p><span class="code"> String user = predicate.get(PREDICATE_BY);</span></p> <p><span class="code"> String action = predicate.get(PREDICATE_ACTION);</span></p> <p><span class="code"> </span></p> <p><span class="code"> StringBuilder sb = new StringBuilder();</span></p> <p><span class="code"> </span></p> <p><span class="code"> if (date != null) {</span></p> <p><span class="code"> sb.append(PN_LAST_REPLICATED).append(PREDICATE_SINCE_OP);</span></p> <p><span class="code"> sb.append("xs:dateTime('").append(date).append("')");</span></p> <p><span class="code"> }</span></p> <p><span class="code"> if (user != null) {</span></p> <p><span class="code"> addAndOperator(sb);</span></p> <p><span class="code"> sb.append(PN_LAST_REPLICATED_BY);</span></p> <p><span class="code"> sb.append("='").append(user).append("'");</span></p> <p><span class="code"> }</span></p> <p><span class="code"> if (action != null) {</span></p> <p><span class="code"> addAndOperator(sb);</span></p> <p><span class="code"> sb.append(PN_LAST_REPLICATED_ACTION);</span></p> <p><span class="code"> sb.append("='").append(action).append("'");</span></p> <p><span class="code"> }</span></p> <p><span class="code"> String xpath = sb.toString();</span></p> <p><span class="code"> </span></p> <p><span class="code"> log.debug("xpath **{}**", xpath);</span></p> <p><span class="code"> </span></p> <p><span class="code"> return xpath;</span></p> <p><span class="code"> }</span></p> <p><span class="code"> </span></p> <p><span class="code"> /**</span></p> <p><span class="code"> * Add an and operator if the builder is not empty.</span></p> <p><span class="code"> *</span></p> <p><span class="code"> * @param sb a {@link StringBuilder} containing the query under construction</span></p> <p><span class="code"> */</span></p> <p><span class="code"> private void addAndOperator(StringBuilder sb) {</span></p> <p><span class="code"> if (sb.length() != 0) {</span></p> <p><span class="code"> sb.append(" and ");</span></p> <p><span class="code"> }</span></p> <p><span class="code"> }</span></p> <p><span class="code">}</span></p> <p> </p> </td> 
  </tr> 
 </tbody> 
</table>

[aem-search-custom-predicate-evaluator](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator)- [src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java](https://github.com/Adobe-Marketing-Cloud/aem-search-custom-predicate-evaluator/blob/master/src/main/java/com/adobe/aem/docs/search/ReplicationPredicateEvaluator.java)
