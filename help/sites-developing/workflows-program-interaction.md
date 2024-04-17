---
title: Interacting with Workflows Programmatically
description: Learn how to interact with workflows programmatically in Adobe Experience Manager.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
exl-id: 2b396850-e9fb-46d9-9daa-ebd410a9e1a5
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Interacting with Workflows Programmatically{#interacting-with-workflows-programmatically}

When [customizing and extending your workflows](/help/sites-developing/workflows-customizing-extending.md) you can access workflow objects:

* [Using the Workflow Java API](#using-the-workflow-java-api)
* [Obtaining Workflow Objects in ECMA Scripts](#obtaining-workflow-objects-in-ecma-scripts)
* [Using the Workflow REST API](#using-the-workflow-rest-api)

## Using the Workflow Java API {#using-the-workflow-java-api}

The workflow Java API consists of the [`com.adobe.granite.workflow`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/package-summary.html) package and several sub-packages. The most significant member of the API is the `com.adobe.granite.workflow.WorkflowSession` class. The `WorkflowSession` class provides access to both design-time and runtime workflow objects:

* workflow models
* work items
* workflow instances
* workflow data
* inbox items

The class also provides several methods for intervening in workflow lifecycles.

The following table provides links to the reference documentation of several key Java objects to use when interacting programmatically with workflows. The examples that follow demonstrate how to obtain and use the class objects in code.

|Features|Objects|
|---|---|
|Accessing a workflow|[`WorkflowSession`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/WorkflowSession.html)|
|Executing and querying a workflow instance|[`Workflow`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/exec/Workflow.html)</br>[`WorkItem`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/exec/WorkItem.html)</br>[`WorkflowData`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/exec/WorkflowData.html)|
|Managing a workflow model|[`WorkflowModel`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/model/WorkflowModel.html)</br>[`WorkflowNode`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/model/WorkflowNode.html)</br>[`WorkflowTransition`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/model/WorkflowTransition.html)|
|Information for a node that is in the workflow (or not)|[`WorkflowStatus`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/status/WorkflowStatus.html)|

## Obtaining Workflow Objects in ECMA Scripts {#obtaining-workflow-objects-in-ecma-scripts}

As described in [Locating the Script](/help/sites-developing/the-basics.md#locating-the-script), AEM (via Apache Sling) provides an ECMA script engine that executes server-side ECMA scripts. The [`org.apache.sling.scripting.core.ScriptHelper`](https://sling.apache.org/apidocs/sling5/org/apache/sling/scripting/core/ScriptHelper.html) class is immediately available to your scripts as the `sling` variable.

The `ScriptHelper` class provides access to the `SlingHttpServletRequest` that you can use to eventually obtain the `WorkflowSession` object; for example:

```
var wfsession = sling.getRequest().getResource().getResourceResolver().adaptTo(Packages.com.adobe.granite.workflow.WorkflowSession);
```

## Using the Workflow REST API {#using-the-workflow-rest-api}

The Workflow console makes heavy use of the REST API; so this page describes the REST API for workflows.

>[!NOTE]
>
>The curl command line tool enables you to use the Workflow REST API to access workflow objects and manage instance lifecycles. The examples throughout this page demonstrate the use of the REST API via the curl command line tool.

The following actions are supported with the REST API:

* start or stop a workflow service
* create, update or delete workflow models
* [start, suspend, resume or terminate workflow instances](/help/sites-administering/workflows.md#workflow-status-and-actions)
* complete or delegate work items

>[!NOTE]
>
>By using Firebug, a Firefox extension for web development, it is possible to follow the HTTP traffic when the console is operated. For example, you can check the parameters and the values sent to the AEM server with a `POST` request.

In this page it is assumed that AEM runs on localhost at port `4502` and that the installation context is " `/`" (root). If it is not the case of your installation, the URIs, to which the HTTP requests apply, need to be adapted accordingly.

The rendering supported for `GET` requests is the JSON rendering. The URLs for `GET` should have the `.json` extension, for example:

`http://localhost:4502/etc/workflow.json`

### Managing Workflow Instances {#managing-workflow-instances}

The following HTTP request methods apply to:

`http://localhost:4502/etc/workflow/instances`

<table>
 <tbody>
  <tr>
   <td>HTTP request method</td>
   <td>Actions</td>
  </tr>
  <tr>
   <td><code>GET</code></td>
   <td>Lists the available workflow instances.</td>
  </tr>
  <tr>
   <td><code>POST</code></td>
   <td><p>Creates a new workflow instance. The parameters are:<br /> - <code>model</code>: the ID (URI) of the respective workflow model<br /> - <code>payloadType</code>: containing the type of the payload (for example, <code>JCR_PATH</code> or URL).<br /> The payload is sent as parameter <code>payload</code>. A <code>201</code> (<code>CREATED</code>) response is sent back with a location header containing the URL of the new workflow instance resource.</p> </td>
  </tr>
 </tbody>
</table>

#### Managing a Workflow Instance by its State {#managing-a-workflow-instance-by-its-state}

The following HTTP request methods apply to:

`http://localhost:4502/etc/workflow/instances.{state}`

| HTTP request method |Actions |
|---|---|
| `GET` |Lists the available workflow instances and their states ( `RUNNING`, `SUSPENDED`, `ABORTED` or `COMPLETED`) |

#### Managing a Workflow Instance by its ID {#managing-a-workflow-instance-by-its-id}

The following HTTP request methods apply to:

`http://localhost:4502/etc/workflow/instances/{id}`

<table>
 <tbody>
  <tr>
   <td>HTTP request method</td>
   <td>Actions</td>
  </tr>
  <tr>
   <td><code>GET</code></td>
   <td>Gets the instances data (definition and metadata) including the link to the respective workflow model.</td>
  </tr>
  <tr>
   <td><code>POST</code></td>
   <td>Changes the state of the instance. The new state is sent as the parameter <code>state</code> and must have one of the following values: <code>RUNNING</code>, <code>SUSPENDED</code>, or <code>ABORTED</code>.<br /> If the new state is not reachable (for example, when suspending a terminated instance) a <code>409</code> (<code>CONFLICT</code>) response is sent back to the client.</td>
  </tr>
 </tbody>
</table>

### Managing Workflow Models {#managing-workflow-models}

The following HTTP request methods apply to:

`http://localhost:4502/etc/workflow/models`

<table>
 <tbody>
  <tr>
   <td>HTTP request method</td>
   <td>Actions</td>
  </tr>
  <tr>
   <td><code>GET</code></td>
   <td>Lists the available workflow models.</td>
  </tr>
  <tr>
   <td><code>POST</code></td>
   <td>Creates a new workflow model. If the parameter <code>title</code> is sent, a new model is created with the specified title. Attaching a JSON model definition as parameter <code>model</code> creates a new workflow model according to the provided definition.<br /> A <code>201</code> response (<code>CREATED</code>) is sent back with a location header containing the URL of the new workflow model resource.<br /> The same happens when a model definition is attached as a file parameter called <code>modelfile</code>.<br /> In both the cases of the <code>model</code> and <code>modelfile</code> parameters, an additional parameter called <code>type</code> is required to define the serialization format. New serialization formats can be integrated using the OSGI API. A standard JSON serializer is delivered with the workflow engine. Its type is JSON. See below for an example of the format.</td>
  </tr>
 </tbody>
</table>

Example: in the browser, a request to `http://localhost:4502/etc/workflow/models.json` generates a json response similar to the following:

```
[
    {"uri":"/var/workflow/models/activationmodel"}
    ,{"uri":"/var/workflow/models/dam/adddamsize"}
    ,{"uri":"/var/workflow/models/cloudconfigs/dtm-reactor/library-download"}
    ,{"uri":"/var/workflow/models/ac-newsletter-workflow-simple"}
    ,{"uri":"/var/workflow/models/dam/dam-create-language-copy"}
    ,{"uri":"/var/workflow/models/dam/dam-create-and-translate-language-copy"}
    ,{"uri":"/var/workflow/models/dam-indesign-proxy"}
    ,{"uri":"/var/workflow/models/dam-xmp-writeback"}
    ,{"uri":"/var/workflow/models/dam-parse-word-documents"}
    ,{"uri":"/var/workflow/models/dam/process_subasset"}
    ,{"uri":"/var/workflow/models/dam/dam_set_last_modified"}
    ,{"uri":"/var/workflow/models/dam/dam-autotag-assets"}
    ,{"uri":"/var/workflow/models/dam/update_asset"}
    ,{"uri":"/var/workflow/models/dam/update_asset_offloading"}
    ,{"uri":"/var/workflow/models/dam/dam-update-language-copy"}
    ,{"uri":"/var/workflow/models/dam/update_from_lightbox"}
    ,{"uri":"/var/workflow/models/cloudservices/DTM_bundle_download"}
    ,{"uri":"/var/workflow/models/dam/dam_download_asset"}
    ,{"uri":"/var/workflow/models/dam/dynamic-media-encode-video"}
    ,{"uri":"/var/workflow/models/dam/dynamic-media-video-thumbnail-replacement"}
    ,{"uri":"/var/workflow/models/dam/dynamic-media-video-user-uploaded-thumbnail"}
    ,{"uri":"/var/workflow/models/newsletter_bounce_check"}
    ,{"uri":"/var/workflow/models/projects/photo_shoot_submission"}
    ,{"uri":"/var/workflow/models/projects/product_photo_shoot"}
    ,{"uri":"/var/workflow/models/projects/approval_workflow"}
    ,{"uri":"/var/workflow/models/prototype-01"}
    ,{"uri":"/var/workflow/models/publish_example"}
    ,{"uri":"/var/workflow/models/publish_to_campaign"}
    ,{"uri":"/var/workflow/models/screens/publish_to_author_bin"}
    ,{"uri":"/var/workflow/models/s7dam/request_to_publish_to_youtube"}
    ,{"uri":"/var/workflow/models/projects/request_copy"}
    ,{"uri":"/var/workflow/models/projects/request_email"}
    ,{"uri":"/var/workflow/models/projects/request_landing_page"}
    ,{"uri":"/var/workflow/models/projects/request_launch"}
    ,{"uri":"/var/workflow/models/request_for_activation"}
    ,{"uri":"/var/workflow/models/request_for_deactivation"}
    ,{"uri":"/var/workflow/models/request_for_deletion"}
    ,{"uri":"/var/workflow/models/request_for_deletion_without_deactivation"}
    ,{"uri":"/var/workflow/models/request_to_complete_move_operation"}
    ,{"uri":"/var/workflow/models/reverse_replication"}
    ,{"uri":"/var/workflow/models/salesforce-com-export"}
    ,{"uri":"/var/workflow/models/scene7"}
    ,{"uri":"/var/workflow/models/scheduled_activation"}
    ,{"uri":"/var/workflow/models/scheduled_deactivation"}
    ,{"uri":"/var/workflow/models/screens/screens-update-asset"}
    ,{"uri":"/var/workflow/models/translation"}
    ,{"uri":"/var/workflow/models/s7dam/request_to_remove_from_youtube"}
    ,{"uri":"/var/workflow/models/wcm-translation/create_language_copy"}
    ,{"uri":"/var/workflow/models/wcm-translation/prepare_translation_project"}
    ,{"uri":"/var/workflow/models/wcm-translation/translate-i18n-dictionary"}
    ,{"uri":"/var/workflow/models/wcm-translation/sync_translation_job"}
    ,{"uri":"/var/workflow/models/wcm-translation/translate-language-copy"}
    ,{"uri":"/var/workflow/models/wcm-translation/update_language_copy"}
]
```

#### Managing a Specific Workflow Model {#managing-a-specific-workflow-model}

The following HTTP request methods apply to:

`http://localhost:4502*{uri}*`

Where `*{uri}*` is the path to the model node in the repository.

<table>
 <tbody>
  <tr>
   <td>HTTP request method</td>
   <td>Actions</td>
  </tr>
  <tr>
   <td><code>GET</code></td>
   <td>Gets the <code>HEAD</code> version of the model (definition and metadata).</td>
  </tr>
  <tr>
   <td><code>PUT</code></td>
   <td>Updates the <code>HEAD</code> version of the model (creates a new version).<br /> The complete model definition for the new version of the model must be added as a parameter called <code>model</code>. Additionally a <code>type</code> parameter is needed as when creating new models and needs to have the value <code>JSON</code>.<br /> </td>
  </tr>
  <tr>
   <td><code>POST</code></td>
   <td>Same behaviour as with PUT. Needed because AEM widgets do not support <code>PUT</code> operations.</td>
  </tr>
  <tr>
   <td><code>DELETE</code></td>
   <td>Deletes the model. To solve firewall/proxy issues a <code>POST</code> that contains an <code>X-HTTP-Method-Override</code> header entry with value <code>DELETE</code> will also be accepted as <code>DELETE</code> request.</td>
  </tr>
 </tbody>
</table>

Example: in the browser, a request to `http://localhost:4502/var/workflow/models/publish_example.json` returns a `json` response that is similar to the following code:

```shell
{
  "id":"/var/workflow/models/publish_example",
  "title":"Publish Example",
  "version":"1.0",
  "description":"This example shows a simple review and publish process.",
  "metaData":
  {
    "multiResourceSupport":"true",
    "tags":"wcm,publish"
  },
  "nodes":
  [{
    "id":"node0",
    "type":"START",
    "title":"Start",
    "description":"The start node of the workflow.",
    "metaData":
    {
    }
  },
  {
    "id":"node1",
    "type":"PARTICIPANT",
    "title":"Validate Content",
    "description":"Validate the modified content.",
    "metaData":
    {
      "PARTICIPANT":"admin"
    }
  },
  {
    "id":"node2",
    "type":"PROCESS",
    "title":"Publish Content",
    "description":"Publish the modified content.",
    "metaData":
    {
      "PROCESS_AUTO_ADVANCE":"true",
      "PROCESS":"com.day.cq.wcm.workflow.process.ActivatePageProcess"
    }
  },
  {
    "id":"node3",
    "type":"END",
    "title":"End",
    "description":"The end node of the workflow.",
    "metaData":
    {
    }
  }],
  "transitions":
  [{
    "from":"node0",
    "to":"node1",
    "metaData":
    {
    }
  },
  {
    "from":"node1",
    "to":"node2",
    "metaData":
    {
    }
  },
  {
    "from":"node2",
    "to":"node3",
    "metaData":
    {
    }
  }
]}
```

#### Managing a Workflow Model by its Version {#managing-a-workflow-model-by-its-version}

The following HTTP request methods apply to:

`http://localhost:4502/etc/workflow/models/{id}.{version}`

| HTTP request method |Actions |
|---|---|
| `GET` |Gets the data of the model in the given version (if it exists). |

### Managing (User) Inboxes {#managing-user-inboxes}

The following HTTP request methods apply to:

`http://localhost:4502/bin/workflow/inbox`

<table>
 <tbody>
  <tr>
   <td>HTTP request method</td>
   <td>Actions</td>
  </tr>
  <tr>
   <td><code>GET</code></td>
   <td>Lists the work items that are in the inbox of the user, who is identified by the HTTP authentication headers.</td>
  </tr>
  <tr>
   <td><code>POST</code></td>
   <td>Completes the work item whose URI is sent as the parameter <code>item</code> and advances the according workflow instance to the next nodes, that is defined by the parameter <code>route</code> or <code>backroute</code> if there is going back a step.<br /> If the parameter <code>delegatee</code> is sent, the work item identified by the parameter <code>item</code> is delegated to the specified participant.</td>
  </tr>
 </tbody>
</table>

#### Managing a (User) Inbox by the WorkItem ID {#managing-a-user-inbox-by-the-workitem-id}

The following HTTP request methods apply to:

`http://localhost:4502/bin/workflow/inbox/{id}`

| HTTP request method |Actions |
|---|---|
| `GET` |Gets the data (definition and metadata) of the inbox `WorkItem` identified by its ID. |

## Examples {#examples}

### How to get a List of all Running Workflows with their IDs {#how-to-get-a-list-of-all-running-workflows-with-their-ids}

To get a list of all running workflows, do a GET to:

`http://localhost:4502/etc/workflow/instances.RUNNING.json`

#### How to get a List of all Running Workflows with their IDs - REST using curl {#how-to-get-a-list-of-all-running-workflows-with-their-ids-rest-using-curl}

Example using curl:

```shell
curl -u admin:admin http://localhost:4502/etc/workflow/instances.RUNNING.json
```

The `uri` displayed in the results can be used as the instance `id` in other commands; for example:

```shell
[
    {"uri":"/etc/workflow/instances/server0/2017-03-08/request_for_activation_1"}
]
```

>[!NOTE]
>
>This `curl` command can be used with any [workflow status](/help/sites-administering/workflows.md#workflow-status-and-actions) in place of `RUNNING`.

### How to change the Workflow Title {#how-to-change-the-workflow-title}

To change the **Workflow Title** displayed in the **Instances** tab of the workflow console, send a `POST` command:

* to: `http://localhost:4502/etc/workflow/instances/{id}`

* with the following parameters:

    * `action`: its value has to be: `UPDATE`
    * `workflowTitle`: the workflow title

#### How to change the Workflow Title - REST using curl {#how-to-change-the-workflow-title-rest-using-curl}

Example using curl:

```shell
curl -u admin:admin -d "action=UPDATE&workflowTitle=myWorkflowTitle" http://localhost:4502/etc/workflow/instances/{id}

# for example
curl -u admin:admin -d "action=UPDATE&workflowTitle=myWorkflowTitle" http://localhost:4502/etc/workflow/instances/server0/2017-03-08/request_for_activation_1
```

### How to List all Workflow Models {#how-to-list-all-workflow-models}

To get a list of all available workflow models, do a GET to:

`http://localhost:4502/etc/workflow/models.json`

#### How to List all Workflow Models - REST using curl {#how-to-list-all-workflow-models-rest-using-curl}

Example using curl:

```shell
curl -u admin:admin http://localhost:4502/etc/workflow/models.json
```

>[!NOTE]
>
>See also [Managing Workflow Models](#managing-workflow-models).

### Obtaining a WorkflowSession Object {#obtaining-a-workflowsession-object}

The `com.adobe.granite.workflow.WorkflowSession` class is adaptable from a `javax.jcr.Session` object or a `org.apache.sling.api.resource.ResourceResolver` object.

#### Obtaining a WorkflowSession Object - Java {#obtaining-a-workflowsession-object-java}

In a JSP script (or Java code for a servlet class), use the HTTP request object to obtain a `SlingHttpServletRequest` object, which provides access to a `ResourceResolver` object. Adapt the `ResourceResolver` object to `WorkflowSession`.

```java
<%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false"
    import="com.adobe.granite.workflow.WorkflowSession,
  org.apache.sling.api.SlingHttpServletRequest"%><%

SlingHttpServletRequest slingReq = (SlingHttpServletRequest)request;
WorkflowSession wfSession = slingReq.getResourceResolver().adaptTo(WorkflowSession.class);
%>
```

#### Obtaining a WorkflowSession Object - ECMA Script {#obtaining-a-workflowsession-object-ecma-script}

Use the `sling` variable to obtain the `SlingHttpServletRequest` object that you use to obtain a `ResourceResolver` object. Adapt the `ResourceResolver` object to the `WorkflowSession` object.

```
var wfsession = sling.getRequest().getResource().getResourceResolver().adaptTo(Packages.com.adobe.granite.workflow.WorkflowSession);
```

### Creating, Reading or Deleting Workflow Models {#creating-reading-or-deleting-workflow-models}

The following examples show how to access workflow models:

* The code for Java and ECMA script uses the `WorkflowSession.createNewModel` method.
* The curl command accesses the model directly using its URL.

The examples used:

1. Create a model (with the ID `/var/workflow/models/mymodel/jcr:content/model`).
1. Delete the model.

>[!NOTE]
>
>Deleting the model sets the `deleted` property of the model's `metaData` child node to `true`.
>
>Deletion does not remove the model node.

When creating a model:

* The workflow model editor requires that models use a specific node structure below `/var/workflow/models`. The parent node of the model must be of the type `cq:Page` having a `jcr:content` node with the following property values:

  * `sling:resourceType`: `cq/workflow/components/pages/model`
  * `cq:template`: `/libs/cq/workflow/templates/model`

  When you create a model, you must first create this `cq:Page` node and use its `jcr:content` node as the parent of the model node.

* The `id` argument that some methods require for identifying the model is the absolute path of the model node in the repository:

  `/var/workflow/models/<*model_name>*/jcr:content/model`

  >[!NOTE]
  >
  >See [How to List all Workflow Models](#how-to-list-all-workflow-models).

#### Creating, Reading or Deleting Workflow Models - Java {#creating-reading-or-deleting-workflow-models-java}

```java
<%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" import="com.adobe.granite.workflow.WorkflowSession,
                 com.adobe.granite.workflow.model.WorkflowModel,
             org.apache.sling.api.SlingHttpServletRequest"%><%

SlingHttpServletRequest slingReq = (SlingHttpServletRequest)request;
WorkflowSession wfSession = slingReq.getResourceResolver().adaptTo(WorkflowSession.class);
/* Create the parent page */
String modelRepo = new String("/var/workflow/models");
String modelTemplate = new String ("/libs/cq/workflow/templates/model");
String modelName = new String("mymodel");
Page modelParent = pageManager.create(modelRepo, modelName, modelTemplate, "My workflow model");

/* create the model */
String modelId = new String(modelParent.getPath()+"/jcr:content/model")
WorkflowModel model = wfSession.createNewModel("Made using Java",modelId);

/* delete the model */
wfSession.deleteModel(modelId);
%>
```

#### Creating, Reading or Deleting Workflow Models - ECMA Script {#creating-reading-or-deleting-workflow-models-ecma-script}

```
var resolver = sling.getRequest().getResource().getResourceResolver();
var wfSession = resolver.adaptTo(Packages.com.adobe.granite.workflow.WorkflowSession);
var pageManager = resolver.adaptTo(Packages.com.day.cq.wcm.api.PageManager);

//create the parent page node
var workflowPage = pageManager.create("/var/workflow/models", "mymodel", "/libs/cq/workflow/templates/model", "Created via ECMA Script");
var modelId = workflowPage.getPath()+ "/jcr:content/model";
//create the model
var model = wfSession.createNewModel("My Model", modelId);
//delete the model
var model = wfSession.deleteModel(modelId);
```

#### Deleting a Workflow Model - REST using curl {#deleting-a-workflow-model-rest-using-curl}

```shell
# deleting the model by its id
curl -u admin:admin -X DELETE http://localhost:4502/etc/workflow/models/{id}
```

>[!NOTE]
>
>Due to the level of detail required, curl is not considered practical for creating and/or reading a model.

### Filtering Out System Workflows when Checking Workflow Status {#filtering-out-system-workflows-when-checking-workflow-status}

You can use the [WorkflowStatus API](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/status/WorkflowStatus.html) to retrieve information about the workflow status of a node.

Various methods have the parameter:

`excludeSystemWorkflows`

This parameter can be set to `true` to indicate that system workflows should be excluded from the relevant results.

You [can update the OSGi configuration](/help/sites-deploying/configuring-osgi.md) **Adobe Granite Workflow PayloadMapCache** that specifies the workflow `Models` to be considered as system workflows. The default (runtime) workflow models are:

* `/var/workflow/models/scheduled_activation/jcr:content/model`
* `/var/workflow/models/scheduled_deactivation/jcr:content/model`

### Auto-Advance Participant Step after a Timeout {#auto-advance-participant-step-after-a-timeout}

If you need to auto-advance a **Participant** step that has not been completed within a predefined time you can:

1. Implement an OSGI event listener to listen on task creation and modification.
1. Specify a timeout (deadline), then create a scheduled sling job to fire at that time.
1. Write a job handler that is notified when the timeout expires and triggers the job.

   This handler will take the required action on the task if the task is not yet completed

>[!NOTE]
>
>The action to be taken must be clearly defined to be able to use this approach.

### Interacting with Workflow Instances {#interacting-with-workflow-instances}

The following provide basic examples of how to interact (progammatically) with workflow instances.

#### Interacting with Workflow Instances - Java {#interacting-with-workflow-instances-java}

```java
// starting a workflow
WorkflowModel model = wfSession.getModel(workflowId);
WorkflowData wfData = wfSession.newWorkflowData("JCR_PATH", repoPath);
wfSession.startWorkflow(model, wfData);

// querying and managing a workflow
Workflow[] workflows workflows = wfSession.getAllWorkflows();
Workflow workflow= wfSession.getWorkflow(id);
wfSession.suspendWorkflow(workflow);
wfSession.resumeWorkflow(workflow);
wfSession.terminateWorkflow(workflow);
```

#### Interacting with Workflow Instances - ECMA Script {#interacting-with-workflow-instances-ecma-script}

```
// starting a workflow
var model = wfSession.getModel(workflowId);
var wfData = wfSession.newWorkflowData("JCR_PATH", repoPath);
wfSession.startWorkflow(model, wfData);

// querying and managing a workflow
var workflows = wfSession.getWorkflows("RUNNING");
var workflow= wfSession.getWorkflow(id);
wfSession.suspendWorkflow(workflow);
wfSession.resumeWorkflow(workflow);
wfSession.terminateWorkflow(workflow);
```

#### Interacting with Workflow Instances - REST using curl {#interacting-with-workflow-instances-rest-using-curl}

* **Starting a workflow**

  ```shell
  # starting a workflow
  curl -d "model={id}&payloadType={type}&payload={payload}" http://localhost:4502/etc/workflow/instances

  # for example:
  curl -u admin:admin -d "model=/var/workflow/models/request_for_activation&payloadType=JCR_PATH&payload=/content/we-retail/us/en/products" http://localhost:4502/etc/workflow/instances
  ```

* **Listing the instances**

  ```shell
  # listing the instances
  curl -u admin:admin http://localhost:4502/etc/workflow/instances.json
  ```

  This will list all instances; for example:

  ```shell
  [
      {"uri":"/var/workflow/instances/server0/2018-02-26/prototype-01_1"}
      ,{"uri":"/var/workflow/instances/server0/2018-02-26/prototype-01_2"}
  ]
  ```

  >[!NOTE]
  >
  >See [How to get a List of all Running Workflows](#how-to-get-a-list-of-all-running-workflows-with-their-ids) with their IDs for listing instances with a specific status.

* **Suspending a workflow**

  ```shell
  # suspending a workflow
  curl -d "state=SUSPENDED" http://localhost:4502/etc/workflow/instances/{id}

  # for example:
  curl -u admin:admin -d "state=SUSPENDED" http://localhost:4502/etc/workflow/instances/server0/2017-03-08/request_for_activation_1

  ```

* **Resuming a workflow**

  ```shell
  # resuming a workflow
  curl -d "state=RUNNING" http://localhost:4502/etc/workflow/instances/{id}

  # for example:
  curl -u admin:admin -d "state=RUNNING" http://localhost:4502/etc/workflow/instances/server0/2017-03-08/request_for_activation_1

  ```

* **Terminating a workflow instance**

  ```shell
  # terminating a workflow
  curl -d "state=ABORTED" http://localhost:4502/etc/workflow/instances/{id}

  # for example:
  curl -u admin:admin -d "state=ABORTED" http://localhost:4502/etc/workflow/instances/server0/2017-03-08/request_for_activation_1
  ```

### Interacting with Work Items {#interacting-with-work-items}

The following provide basic examples of how to interact (progammatically) with work items.

#### Interacting with Work Items - Java {#interacting-with-work-items-java}

```java
// querying work items
WorkItem[] workItems = wfSession.getActiveWorkItems();
WorkItem workItem = wfSession.getWorkItem(id);

// getting routes
List<Route> routes = wfSession.getRoutes(workItem);

// delegating
Iterator<Participant> delegatees = wfSession.getDelegatees(workItem);
wfSession.delegateWorkItem(workItem, delegatees.get(0));

// completing or advancing to the next step
wfSession.complete(workItem, routes.get(0));
```

#### Interacting with Work Items - ECMA Script {#interacting-with-work-items-ecma-script}

```
// querying work items
var workItems = wfSession.getActiveWorkItems();
var workItem = wfSession.getWorkItem(id);

// getting routes
var routes = wfSession.getRoutes(workItem);

// delegating
var delegatees = wfSession.getDelegatees(workItem);
wfSession.delegateWorkItem(workItem, delegatees.get(0));

// completing or advancing to the next step
wfSession.complete(workItem, routes.get(0));
```

#### Interacting with Work Items - REST using curl {#interacting-with-work-items-rest-using-curl}

* **Listing Work Items from the Inbox**

  ```shell
  # listing the work items
  curl -u admin:admin http://localhost:4502/bin/workflow/inbox

  ```

  Details for work items currently in the Inbox will be listed; for example:

  ```shell
  [{
      "uri_xss": "/var/workflow/instances/server0/2018-02-26/prototype-01_2/workItems/node2_var_workflow_instances_server0_2018-02-26_prototype-01_2",
      "uri": "/var/workflow/instances/server0/2018-02-26/prototype-01_2/workItems/node2_var_workflow_instances_server0_2018-02-26_prototype-01_2",
      "currentAssignee_xss": "workflow-administrators",
      "currentAssignee": "workflow-administrators",
      "startTime": 1519656289274,
      "payloadType_xss": "JCR_PATH",
      "payloadType": "JCR_PATH",
      "payload_xss": "/content/we-retail/es/es",
      "payload": "/content/we-retail/es/es",
      "comment_xss": "Process resource is null",
      "comment": "Process resource is null",
      "type_xss": "WorkItem",
      "type": "WorkItem"
    },{
      "uri_xss": "configuration/configure_analyticstargeting",
      "uri": "configuration/configure_analyticstargeting",
      "currentAssignee_xss": "administrators",
      "currentAssignee": "administrators",
      "type_xss": "Task",
      "type": "Task"
    },{
      "uri_xss": "configuration/securitychecklist",
      "uri": "configuration/securitychecklist",
      "currentAssignee_xss": "administrators",
      "currentAssignee": "administrators",
      "type_xss": "Task",
      "type": "Task"
    },{
      "uri_xss": "configuration/enable_collectionofanonymoususagedata",
      "uri": "configuration/enable_collectionofanonymoususagedata",
      "currentAssignee_xss": "administrators",
      "currentAssignee": "administrators",
      "type_xss": "Task",
      "type": "Task"
    },{
      "uri_xss": "configuration/configuressl",
      "uri": "configuration/configuressl",
      "currentAssignee_xss": "administrators",
      "currentAssignee": "administrators",
      "type_xss": "Task",
      "type": "Task"
    }

  ```

* **Delegating Work Items**

  ```xml
  # delegating
  curl -d "item={item}&delegatee={delegatee}" http://localhost:4502/bin/workflow/inbox

  # for example:
  curl -u admin:admin -d "item=/etc/workflow/instances/server0/2017-03-08/request_for_activation_1/workItems/node1_etc_workflow_instances_server0_2017-03-08_request_for_act_1&delegatee=administrators" http://localhost:4502/bin/workflow/inbox
  ```

  >[!NOTE]
  >
  >The `delegatee` must be a valid option for the workflow step.

* **Completing or advancing work items to the next step**

  ```xml
  # retrieve the list of routes; the results will be similar to {"results":1,"routes":[{"rid":"233123169","label":"End","label_xss":"End"}]}
  http://localhost:4502/etc/workflow/instances/<path-to-the-workitem>.routes.json

  # completing or advancing to the next step; use the appropriate route ID (rid value) from the above list
  curl -d "item={item}&route={route}" http://localhost:4502/bin/workflow/inbox

  # for example:
  curl -u admin:admin -d "item=/etc/workflow/instances/server0/2017-03-08/request_for_activation_1/workItems/node1_etc_workflow_instances_server0_2017-03-08_request_for_activation_1&route=233123169" http://localhost:4502/bin/workflow/inbox
  ```

### Listening for Workflow Events {#listening-for-workflow-events}

Use the OSGi event framework to listen for events that the [ `com.adobe.granite.workflow.event.WorkflowEvent`](https://helpx.adobe.com/experience-manager/6-5/sites/developing/using/reference-materials/javadoc/com/adobe/granite/workflow/event/WorkflowEvent.html) class defines. This class also provides several useful methods for obtaining information about the subject of the event. For example, the `getWorkItem` method returns the `WorkItem` object for the workitem that is involved in the event.

The following example code defines a service that listens to workflow events and performs tasks according to the type of event.

```java
package com.adobe.example.workflow.listeners;

import org.apache.sling.event.jobs.JobProcessor;
import org.apache.sling.event.jobs.JobUtil;

import org.osgi.service.event.Event;
import org.osgi.service.event.EventHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;

import com.adobe.granite.workflow.event.WorkflowEvent;
import com.adobe.granite.workflow.exec.WorkItem;

/**
 * The <code>WorkflowEventCatcher</code> class listens to workflow events.
 */
@Component(metatype=false, immediate=true)
@Service(value=org.osgi.service.event.EventHandler.class)
public class WorkflowEventCatcher implements EventHandler, JobProcessor {

 @Property(value=com.adobe.granite.workflow.event.WorkflowEvent.EVENT_TOPIC)
 static final String EVENT_TOPICS = "event.topics";

 private static final Logger logger = LoggerFactory.getLogger(WorkflowEventCatcher.class);

 public void handleEvent(Event event) {
  JobUtil.processJob(event, this);
 }

 public boolean process(Event event) {
  logger.info("Received event of topic: " + event.getTopic());
  String topic = event.getTopic();

  try {
   if (topic.equals(WorkflowEvent.EVENT_TOPIC)) {
    WorkflowEvent wfevent = (WorkflowEvent)event;
    String eventType = wfevent.getEventType();
    String instanceId = wfevent.getWorkflowInstanceId();

    if (instanceId != null) {
     //workflow instance events
     if (eventType.equals(WorkflowEvent.WORKFLOW_STARTED_EVENT) ||
       eventType.equals(WorkflowEvent.WORKFLOW_RESUMED_EVENT) ||
       eventType.equals(WorkflowEvent.WORKFLOW_SUSPENDED_EVENT)) {
      // your code comes here...
     } else if (
       eventType.equals(WorkflowEvent.WORKFLOW_ABORTED_EVENT) ||
       eventType.equals(WorkflowEvent.WORKFLOW_COMPLETED_EVENT)) {
      // your code comes here...
     }
     // workflow node event
     if (eventType.equals(WorkflowEvent.NODE_TRANSITION_EVENT)) {
      WorkItem currentItem = (WorkItem) event.getProperty(WorkflowEvent.WORK_ITEM);
      // your code comes here...
     }
    }
   }
  } catch(Exception e){
   logger.debug(e.getMessage());
   e.printStackTrace();
  }
  return true;
 }
}
```
