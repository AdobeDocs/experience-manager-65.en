---
title: APIs to access letter instances
description: Discover APIs and use them to programmatically access letter instances in AEM Forms environment.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: correspondence-management
feature: Correspondence Management
exl-id: 9d43d9d4-5487-416c-b641-e807227ac056
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# APIs to access letter instances {#apis-to-access-letter-instances}

## Overview {#overview}

Using the Create Correspondence UI of Correspondence Management, you can save drafts of letter instances under progress and there are submitted letter instances.

Correspondence Management provides you with APIs using which you can build the listing interface to work with submitted letter instances or drafts. The APIs list and open submitted and draft letter instances of an agent, so that the agent could continue working on the draft or submitted letter instances.

## Fetching letter instances {#fetching-letter-instances}

Correspondence Management exposes APIs to fetch letter instances through the LetterInstanceService service.

|Method|Description|
|--- |--- |
|getAllLetterInstances|Fetches letter instances based on the input query parameter. To fetch all letter instances, pass the query parameter as null.|
|getLetterInstance|Fetches the specified letter instance based on letter instance Id.|
|letterInstanceExists|Checks if a LetterInstance exists by the given name.|

>[!NOTE]
>
>LetterInstanceService is an OSGI service and its instance can be retrieved by using @Reference in Java&trade;
>Class or sling.getService(LetterInstanceService. Class ) in JSP.

### Using&nbsp;getAllLetterInstances {#using-nbsp-getallletterinstances}

The following API finds the letter instances based on the query object (both Submitted and Draft). If the query object is null, then it returns all the letter instances. This API returns a list of [LetterInstanceVO](https://helpx.adobe.com/aem-forms/6-2/javadocs/com/adobe/icc/dbforms/obj/LetterInstanceVO.html) objects, which can be used for extracting additional information of the letter instance.

**Syntax**: `List getAllLetterInstances(Query query) throws ICCException;`

<table>
 <tbody>
  <tr>
   <td><strong>Parameter</strong></td>
   <td><strong>Description</strong></td>
  </tr>
  <tr>
   <td>query</td>
   <td>The query parameter is used to find/filter Letter instance. Here, the query supports only top-level attributes/properties of the object. Query consists of statements and the "attributeName" used in the Statement object should be the name of the property in the Letter instance object.<br /> </td>
  </tr>
 </tbody>
</table>

#### Example 1: Fetch all the letter instances of type SUBMITTED {#example-fetch-all-the-letter-instances-of-type-submitted}

The following code returns the list of submitted letter instances. To get only drafts, change the `LetterInstanceType.COMPLETE.name()` to `LetterInstanceType.DRAFT.name().`

```java
@Reference
LetterInstanceService letterInstanceService;
Query query = new Query();

List<LetterInstanceVO> submittedLetterInstances = new ArrayList<LetterInstanceVO>();

Statement statementForInstanceType = new Statement();
statementForInstanceType.setAttributeName("letterInstanceType");
statementForInstanceType.setOperator(Operator.EQUALS);
statementForInstanceType.setAttributeValue(LetterInstanceType.COMPLETE.name());
query.addStatement(statementForInstanceType);
submittedLetterInstances = letterInstanceService.getAllLetterInstances(query);

```

#### Example 2:&nbsp;Fetch all the letter instances submitted by a user and letter instance type is DRAFT {#example-nbsp-fetch-all-the-letter-instances-submitted-by-a-user-and-letter-instance-type-is-draft}

The following code has multiple statements in the same query to get the results filtered based on different criteria such as letter instance submitted (attribute submittedby) by a user and type of letterInstanceType is DRAFT.

```java
@Reference
LetterInstanceService letterInstanceService;

String submittedBy = "tglodman";
Query query = new Query();

List<LetterInstanceVO> submittedLetterInstances = new ArrayList<LetterInstanceVO>();

Statement statementForInstanceType = new Statement();
statementForInstanceType.setAttributeName("letterInstanceType");
statementForInstanceType.setOperator(Operator.EQUALS);
statementForInstanceType.setAttributeValue(LetterInstanceType.COMPLETE.name());
query.addStatement(statementForInstanceType);

Statement statementForSubmittedBy = new Statement();
statementForSubmittedBy .setAttributeName("submittedby");
statementForSubmittedBy .setOperator(Operator.EQUALS);
statementForSubmittedBy .setAttributeValue(submittedBy);
query.addStatement(statementForSubmittedBy );
submittedLetterInstances = letterInstanceService.getAllLetterInstances(query);
```

### Using&nbsp;getLetterInstance {#using-nbsp-getletterinstance}

Fetch the letter instance identified by the given letter instance id. It returns `` null if instance id is not matched.

**Syntax:** `public LetterInstanceVO getLetterInstance(String letterInstanceId) throws ICCException;`

```java
@Reference
LetterInstanceService letterInstanceService;
String letterInstanceId = "/content/apps/cm/letterInstances/1001/sampleLetterInstance";
LetterInstanceVO letterInstance = letterInstanceService.getLetterInstance(letterInstanceId );
```

### Verifying if LetterInstance exist {#verifying-if-letterinstance-exist}

Check if a Letter Instance exists by the given name

**Syntax**: `public Boolean letterInstanceExists(String letterInstanceName) throws ICCException;`

| **Parameter** | **Description** |
|---|---|
| letterInstanceName | Name of letter instance that you want to check if it exists. |

```java
@Reference
LetterInstanceService letterInstanceService;
String letterInstanceName = "sampleLetterInstance";
Boolean result = letterInstanceService.letterInstanceExists(letterInstanceName );
```

## Opening letter instances {#opening-letter-instances}

Letter Instance can be of the type Submitted or Draft. Opening both the letter instance types show different behaviors:

* If there is a Submitted letter instance, a PDF representing the letter instance is opened. The submitted Letter instance persisted on the server also contains the dataXML & processed XDP, which can be used to accomplish and further custom use a case such as creating a PDF/A.
* If there is a Draft letter instance, the create correspondence UI is reloaded to the exact previous state as it was during the time when the draft was created

### Opening Draft Letter Instance&nbsp; {#opening-draft-letter-instance-nbsp}

CCR UI supports the cmLetterInstanceId parameter, which can be used to reloaded letter.

`https://[hostName]:[portNo]/[contextPath]//aem/forms/createcorrespondence.html?random=[randomNo]&cmLetterInstanceId=[letterInstanceId]`

>[!NOTE]
>
>You do not have to specify the cmLetterId or cmLetterName/State/Version when reloading a correspondence, as the submitted data already contains all the details about the correspondence that is reloaded. RandomNo is used to avoid browser cache issues, you can use a timestamp as a random number.

### Opening submitted letter instance {#opening-submitted-letter-instance}

Submitted PDF can be directly opened using the letter instance Id:

`https://[hostName]:[portNo]/[contextPath]/[letterInstanceId]`
