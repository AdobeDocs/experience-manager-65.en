---
title: Workflow Process Reference
description: Refer to this process reference for workflows in Adobe Experience Manager.
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
exl-id: a9de8ec6-6948-4643-89c3-62d9b1f6293a
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Workflow Process Reference{#workflow-process-reference}

AEM provides several process steps that can be used for creating workflow models. Custom process steps can also be added for tasks not covered by the built-in steps (see [Creating Workflow Models](/help/sites-developing/workflows-models.md)).

## Process Characteristics {#process-characteristics}

For each process step, the following characteristics are described.

### Java&trade; Class or ECMA Path {#java-class-or-ecma-path}

Process steps are defined either by a Java&trade; class or an ECMAScript.

* For the Java&trade; class processes, the fully qualified class name is provided.
* For the ECMAScript processes, the path to the script is provided.

### Payload {#payload}

The payload is the entity upon which a workflow instance acts. The payload is selected implicitly by the context within which a workflow instance is started.

For example, if a workflow is applied to an AEM page *P* then *P* is passed from step to step as the workflow advances, with each step optionally acting upon *P* in some way.

In the most common case, the payload is a JCR node in the repository (for example, an AEM Page or Asset). A JCR Node payload is passed as a string that is either a JCR path or a JCR identifier (UUID). Sometimes the payload may be a JCR property (passed as a JCR path), a URL, a binary object, or a generic Java&trade; object. Individual process steps that do act on the payload will usually expect a payload of a certain type, or act differently depending on the payload type. For each process described below, the expected payload type, if any, is described.

### Arguments {#arguments}

Some workflow processes accept arguments that the administrator specifies when setting up the workflow step.

Arguments are entered as a single string in the **Process Arguments** property in the **Properties** pane of the workflow editor. For each process described below, the format of the argument string is described in a simple EBNF grammar. For example, the following indicates that the argument string consists of one or more comma-delimited pairs, where each pair consists of a name (which is a string) and a value, separated by a double colon:

```
    args := name '::' value [',' name '::' value]*
    name := /* A string */
    value := /* A string */
```


### Timeout {#timeout}

After this timeout period, the workflow step is no longer operational. Some workflow processes respect the timeout, while for others it does not apply and is ignored.

### Permissions {#permissions}

The session passed to the `WorkflowProcess` is backed by the service user for the workflow process service, which has the following permissions at the root of the repository:

* `jcr:read`
* `rep:write`
* `jcr:versionManagement`
* `jcr:lockManagement`
* `crx:replicate`

If that set of permissions is not sufficient for your `WorkflowProcess` implementation, then it must use a session with the required permissions.

The recommended way to do this is to use a service user created with the necessary, but minimal, subset of permissions required.

>[!CAUTION]
>
>If you are upgrading from a version before AEM 6.2, you might need to update your implementation.
>
>In previous versions, the admin session was passed to the `WorkflowProcess` implementations and could then have full access to the repository without having to define specific ACLs.
>
>The permissions are now defined as above ([Permissions](#permissions)). As is the recommended method for updating your implementation.
>
>A short-term solution is also available for backward-compatibility purposes when code changes are not feasible:
>
>* Using the Web Console ( `/system/console/configMgr` locate the **Adobe Granite Workflow Configuration Service**
>
>* enable the **Workflow Process Legacy Mode**
>
>This reverts to the old behavior of providing an admin session to the `WorkflowProcess` implementation and provide unrestricted access to the entirety of the repository once again.

## Workflow Control Processes {#workflow-control-processes}

The following processes do not perform any actions on content. They serve to control the behavior of the workflow itself.

### AbsoluteTimeAutoAdvancer (Absolute Time Auto Advancer) {#absolutetimeautoadvancer-absolute-time-auto-advancer}

The `AbsoluteTimeAutoAdvancer` (Absolute Time Auto Advancer) process behaves identically to **AutoAdvancer**, except that it times out at a given time and date, instead of after a given length of time.

* **Java&trade; Class**: `com.adobe.granite.workflow.console.timeout.autoadvance.AbsoluteTimeAutoAdvancer`
* **Payload**: None.
* **Arguments**: None.
* **Timeout**: Process times out when the set time and date is reached.

### AutoAdvancer (Auto Advancer) {#autoadvancer-auto-advancer}

The `AutoAdvancer` process automatically advances the workflow to the next step. If there is more than one possible next step (for example, if there is an OR split) then this process will advance the workflow along the *default route*, if one has been specified, otherwise the workflow will not be advanced.

* **Java&trade; Class**: `com.adobe.granite.workflow.console.timeout.autoadvance.AutoAdvancer`

* **Payload**: None.
* **Arguments**: None.
* **Timeout**: Process times out after set length of time.

### ProcessAssembler (Process Assembler) {#processassembler-process-assembler}

The `ProcessAssembler` process executes multiple subprocesses sequentially in a single workflow step. To use the `ProcessAssembler`, create a single step of this type in your workflow and set its arguments to indicate the names and arguments of the subprocesses you wish to execute.

* **Java&trade; Class**: `com.day.cq.workflow.impl.process.ProcessAssembler`

* **Payload**: A DAM Asset, AEM Page, or no payload (depends on requirements of subprocesses).
* **Arguments**:

```
        args := arg [',' arg]
        arg := processname ['::' processargs]
        processname := /* A fully qualified Java Class or absolute
        repository path to an ECMAScript */
        processargs := processarg [';' processarg]*
        processarg := '[' nobracketprocessarg ']' | nobracketprocessarg
        nobracketprocessarg := listitem [':' listitem]*
        listitem := /* A string */
```

* **Timeout**: Respected.

For example:

* Extract the metadata from the asset.
* Create three thumbnails of the three specified sizes.
* Create a JPEG image from the asset, assuming the asset is originally not a GIF or a PNG (in which case no JPEG is created).
* Set the last-modified date on the asset.

```shell
com.day.cq.dam.core.process.ExtractMetadataProcess,
    com.day.cq.dam.core.process.CreateThumbnailProcess::[140:100];[48:48];[319:319:false],
    com.day.cq.dam.core.process.CreateWebEnabledImageProcess::dimension:1280:1280;mimetype:image/jpeg,
    com.day.cq.dam.core.process.AssetSetLastModifiedProcess
```

## Basic Processes {#basic-processes}

The following processes perform simple tasks or serve as examples.

>[!CAUTION]
>
>Do not change anything in the `/libs` path.
>
>This is because the content of `/libs` is overwritten the next time you upgrade your instance (and may be overwritten when you apply either a hotfix or feature pack).

### delete {#delete}

The item at the given path is deleted.

* **ECMAScript path**: `/libs/workflow/scripts/delete.ecma`

* **Payload**: JCR path
* **Arguments**: None
* **Timeout**: Ignored

### noop {#noop}

This is the null process. It performs no operation, but does log a debug message.

* **ECMAScript path**: `/libs/workflow/scripts/noop.ecma`

* **Payload**: None
* **Arguments**: None
* **Timeout**: Ignored

### rule-false {#rule-false}

This is a null process that returns `false` on the `check()` method.

* **ECMAScript path**: `/libs/workflow/scripts/rule-false.ecma`

* **Payload**: None
* **Arguments**: None
* **Timeout**: Ignored

### sample {#sample}

This is a sample ECMAScript process.

* **ECMAScript path**: `/libs/workflow/scripts/sample.ecma`

* **Payload**: None
* **Arguments**: None
* **Timeout**: Ignored

### LockProcess {#lockprocess}

Locks the payload of the workflow.

* **Java&trade; class:** `com.day.cq.workflow.impl.process.LockProcess`

* **Payload:** JCR_PATH and JCR_UUID
* **Arguments:** None
* **Timeout:** Ignored

The step has no effect under the following circumstances:

* The payload is already locked
* The payload node does not contain a jcr:content child node

### UnlockProcess {#unlockprocess}

Unlocks the payload of the workflow.

* **Java&trade; class:** `com.day.cq.workflow.impl.process.UnlockProcess`

* **Payload:** JCR_PATH and JCR_UUID
* **Arguments:** None
* **Timeout:** Ignored

The step has no effect under the following circumstances:

* The payload is already unlocked
* The payload node does not contain a jcr:content child node

## Versioning Processes {#versioning-processes}

The following process performs a version-related task.

### CreateVersionProcess {#createversionprocess}

Creates a version of the workflow payload (AEM page or DAM asset).

* **Java&trade; class**: `com.day.cq.wcm.workflow.process.CreateVersionProcess`

* **Payload**: A JCR path or UUID that refers to a page or DAM asset
* **Arguments**: None
* **Timeout**: Respected
