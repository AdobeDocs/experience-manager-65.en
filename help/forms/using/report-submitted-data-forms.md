---
title: APIs to work with submitted forms on forms portal

description: AEM Forms provides APIs that you can use to query and take actions on submitted forms data in forms portal.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: publish, developer-reference

feature: Forms Portal
exl-id: a685889e-5d24-471c-926d-dbb096792bc8
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# APIs to work with submitted forms on forms portal {#apis-to-work-with-submitted-forms-on-forms-portal}

AEM Forms provides APIs that you can use to query forms data submitted through forms portal. In addition, you can post comments or update properties of submitted forms using the APIs explained in this document.

>[!NOTE]
>
>Users who will invoke the APIs must be added to the reviewers group as described in [Associating submission reviewers to a form](/help/forms/using/adding-reviewers-form.md).

## GET /content/forms/portal/submission.review.json?func=getFormsForSubmissionReview {#get-content-forms-portal-submission-review-json-func-getformsforsubmissionreview-br}

Returns a list of all eligible forms.

### URL parameters {#url-parameters}

This API does not require additional parameters.

### Response {#response}

The response object contains a JSON array that includes forms names and their repository path. The structure of the response is as follows:

```json
[
 {formName: "<form name>",
 formPath: "<path to the form>" },
 {.....},
 ......]
```

### Example {#example}

**Request URL**

```http
https://[host]:[port]/content/forms/portal/submission.review.json?func=getFormsForSubmissionReview
```

**Response**

```json
[{"formPath":"/content/dam/formsanddocuments/forms-review/form2","formName":"form2"},{"formPath":"/content/dam/formsanddocuments/forms-review/form1","formName":"form1"}]
```

## GET /content/forms/portal/submission.review.json?func=getAllSubmissions {#get-content-forms-portal-submission-review-json-func-getallsubmissions}

Returns details of all submitted forms. However, you can use URL parameters to limit the results.

### URL parameters {#url-parameters-1}

Specify the following parameters in the request URL:

<table>
 <tbody>
  <tr>
   <th>Parameter</th>
   <th>Description</th>
  </tr>
  <tr>
   <td><code>formPath</code></td>
   <td>Specifies the CRX repository path where the form resides. If you do not specify the form path, it returns an empty response.<br /> </td>
  </tr>
  <tr>
   <td><code>offset</code><br /> (optional)</td>
   <td>Specifies the starting point in the index of the results set. The default value is <strong>0</strong>.</td>
  </tr>
  <tr>
   <td><code>limit</code><br /> (optional)</td>
   <td>Limits the number of results. The default value is <strong>30</strong>.</td>
  </tr>
  <tr>
   <td><code>orderby</code> <br /> (optional)</td>
   <td>Specifies the property for sorting results. The default value is <strong>jcr:lastModified</strong>, which sorts results based on the last modified time.</td>
  </tr>
  <tr>
   <td><code>sort</code> <br /> (optional)</td>
   <td>Specifies the order for sorting results. The default value is <strong>desc</strong>, which sorts results in descending order. You can specify <code>asc</code> to sort results in ascending order.</td>
  </tr>
  <tr>
   <td><code>cutPoints</code> <br /> (optional)</td>
   <td>Specifies a comma-separated list of form properties to be included in results. The default properties are:<br /> <code>formName</code>, <code>formPath</code>, <code>submitID</code>, <code>formType</code>, <code>jcr:lastModified</code>, <code>owner</code></td>
  </tr>
  <tr>
   <td><code>search</code> <br /> (optional)</td>
   <td>Searches the specified value in form properties and returns forms with matching values. The default value is <strong>""</strong>.</td>
  </tr>
 </tbody>
</table>

### Response {#response-1}

The response object contains a JSON array that includes details of the specified forms. The structure of the response is as follows:

```json
{
 total: "<total number of submissions>",
 items: [{ formName: "<name of the form>", formPath: "<path to the form>", owner: "<owner of the form>"},
 ....]}
```

### Example {#example-1}

**Request URL**

```http
https://[host]:[port]/content/forms/portal/submission.review.json?func=getAllSubmissions&formPath=/content/dam/formsanddocuments/forms-review/form2
```

**Response**

```json
{"total":1,"items":[{"formName":"form2","formPath":"/content/dam/formsanddocuments/forms-review/form2","submitID":"1403037413508500","formType":"af","jcr:lastModified":"2015-11-05T17:52:32.243+05:30","owner":"admin"}]}
```

## POST /content/forms/portal/submission.review.json?func=addComment {#post-content-forms-portal-submission-review-json-func-addcomment-br}

Adds a comment to the specified submission instance.

### URL parameters {#url-parameters-2}

Specify the following parameters in the request URL:

| Parameter |Description |
|---|---|
| `submitID` |Specifies the metadata ID associated with a submission instance. |
| `Comment` |Specifies the text for comment to add to the specified submission instance. |

### Response {#response-2}

Returns a comment ID on successful posting of a comment.

### Example {#example-2}

**Request URL**

```http
https://[host:'port'/content/forms/portal/submission.review.json?func=addComment&submitID=1403037413508500&comment=API+test+comment
```

**Response**

```java
1403873422601300
```

## GET /content/forms/portal/submission.review.json?func=getComments &nbsp; {#get-content-forms-portal-submission-review-json-func-getcomments-nbsp}

Returns all comments posted on the specified submission instance.

### URL parameters {#url-parameters-3}

Specify the following parameter in the request URL:

| Parameter |Description |
|---|---|
| `submitID` |Specifies the metadata ID of a submission instance. |

### Response {#response-3}

The response object contains a JSON array that includes all comments associated with the specified submission ID. The structure of the response is as follows:

```json
[{
 owner: "<name of the commenter>",
 comment: "<comment text>",
 time: "<time when the comment was posted>"},
 { }......]
```

### Example {#example-3}

**Request URL**

```http
https://[host]:'port'/content/forms/portal/submission.review.json?func=getComments&submitID=1403037413508500
```

**Response**

```java
[{"owner":"fr1","comment":"API test comment","time":1446726988250}]
```

## POST /content/forms/portal/submission.review.json?func=updateSubmission {#post-content-forms-portal-submission-review-json-func-updatesubmission-br}

Updates the value of the specified property of the specified submitted form instance.

### URL parameters {#url-parameters-4}

Specify the following parameters in the request URL:

| Parameter |Description |
|---|---|
| `submitID` |Specifies the metadata ID associated with a submission instance. |
| `property` |Specifies the form property to be updated. |
| `value` |Specifies the value of the form property to be updated. |

### Response {#response-4}

Returns a JSON object with information about the update posted.

### Example {#example-4}

**Request URL**

```http
https://[host]:'port'/content/forms/portal/submission.review.json?func=updateSubmission&submitID=1403037413508500&value=sample_value&property=some_new_prop

```

**Response**

```json
{"formName":"form2","owner":"admin","jcr:lastModified":1446727516593,"path":"/content/forms/fp/admin/submit/metadata/1403037413508500.html","submitID":"1403037413508500","status":"submitted"}
```
