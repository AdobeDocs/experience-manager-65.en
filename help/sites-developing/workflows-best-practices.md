---
title: Workflow Best Practices

description: Learn the best practices for working with workflows in Adobe Experience Manager.


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference

exl-id: 14775476-6fe5-4583-8ab5-b55fef892174
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Workflow Best Practices{#workflow-best-practices}

Workflows enable you to automate Adobe Experience Manager (AEM) activities.

They often represent a large amount of the processing that occurs in an AEM environment, so when custom workflow steps are not written according to best practices, or out-of-the-box workflows are not configured to run as efficiently as possible, the system can suffer as a result.

It is therefore highly recommended to plan your workflows implementations carefully.

## Configuration {#configuration}

When configuring workflow processes (customized and/or out-of-the-box), there are a few things that should be kept in mind.

### Transient Workflows {#transient-workflows}

To optimize high ingestion loads you can define a [workflow as transient](/help/sites-developing/workflows.md#transient-workflows).

When a workflow is transient the runtime data related to the intermediate worksteps are not persisted in the JCR when they run (the output renditions are persisted).

The advantages can include:

* A reduction in the workflow processing time; of upto 10%.
* Significantly reduce repository growth.
* No more CRUD workflows are required to purge.
* In addition, it reduces the number of TAR files to compact.

>[!CAUTION]
>
>If your business dictates that you persist/archive workflow runtime data for audit purposes, do not enable this feature.

### Tuning DAM Workflows {#tuning-dam-workflows}

For performance tuning guidelines for DAM workflows, see the [AEM Assets Performance Tuning Guide](/help/assets/performance-tuning-guidelines.md).

### Configure the Maximum Number of Concurrent Workflows {#configure-the-maximum-number-of-concurrent-workflows}

AEM can allow multiple workflow threads to run concurrently. By default the number of threads is configured to be half the number of processor cores on the system.

In cases where the workflows being executed are demanding of system resources, this can mean little is left for AEM to use for other tasks, such as rendering the authoring UI. As a result, the system may be sluggish during activities such as bulk image uploading.

To address this issue, Adobe recommends configuring the number of **Maximum Parallel Jobs** to be between half to three-quarters of the number of processor cores on the system. This should allow enough capacity for the system to stay responsive when processing these workflows.

To configure **Maximum Parallel Jobs**, you can either:

* Configure the **[OSGi Configuration](/help/sites-deploying/configuring-osgi.md)** from the AEM Web console; for **Queue: Granite Workflow Queue** (an **Apache Sling Job Queue Configuration**).

* Configure the queue can from the **Sling Jobs** option of the AEM Web console; for **Job Queue Configuration: Granite Workflow Queue**, at `http://localhost:4502/system/console/slingevent`.

Additionally, there is a separate configuration for the **Granite Workflow External Process Job Queue**. This is used for workflow processes that launch external binaries, such as **InDesign Server** or **Image Magick**.

### Configure Individual Job Queues {#configure-individual-job-queues}

In some cases it is useful to configure individual job queues to control concurrent threads, or other queue options, on an individual job basis. You can add and configure an individual queue from the Web console via the **Apache Sling Job Queue Configuration** factory. To find the appropriate topic to list, execute your workflow's model and look for it in the **Sling Jobs** console; for example, at `http://localhost:4502/system/console/slingevent`.

Individual job queues can be added for transient workflows as well.

### Configure Workflow Purging {#configure-workflow-purging}

In a standard installation AEM provides a maintenance console where daily and weekly maintenance activities can be scheduled and configured; for example, at:

`http://localhost:4502/libs/granite/operations/content/maintenance.html`

By default, the **Weekly Maintenance Window** has a **Workflow Purge** task, but this needs to be configured before it will run. To configure workflow purges, a new **Adobe Granite Workflow Purge Configuration** must be added in the Web console.

For further details on maintenance tasks in AEM, see the [Operations Dashboard](/help/sites-administering/operations-dashboard.md).

## Customization {#customization}

When writing custom workflow processes, there are some things that should be kept in mind.

### Locations {#locations}

Definitions of workflow models, launchers, scripts and notifications are held in the repository according to type; that is, out-of-the-box, custom, among others.

>[!NOTE]
>
>See also [Repository Restructuring in AEM 6.5](/help/sites-deploying/repository-restructuring.md).

#### Locations - Workflow Models {#locations-workflow-models}

Workflow models are stored in the repository according to type:

* Out-of-the-box workflow designs are held under the following path:

  `/libs/settings/workflow/models/`

  >[!CAUTION]
  >
  >Do not:
  >
  >* place any of your custom workflow models in this folder
  >* edit anything in `/libs`
  >
  >As any changes may be overwritten at upgrade or when installing hot-fixes, cumulative fix packs or service packs.

* Custom workflow designs are held under:

  ```
  /conf/global/settings/workflow/models/...

  ```

* Runtime workflow designs (both out-of-the-box and custom) are held under the following path:

  `/var/workflow/models/`

* Legacy workflow designs (both design-time and runtime) are held under the following path:

  `/etc/workflow/models/`

  >[!NOTE]
  >
  >If these designs are edited *using the AEM UI*, then the details will be copied to the new locations.

#### Locations - Workflow Launchers {#locations-workflow-launchers}

Workflow launcher definitions are also stored in the repository according to type:

* Out-of-the-box workflow launchers are held under the following path:

  `/libs/settings/workflow/launcher/`

  >[!CAUTION]
  >
  >Do not:
  >
  >* place any of your custom workflow launchers in this folder
  >* edit anything in `/libs`
  >
  >As any changes may be overwritten at upgrade or when installing hot-fixes, cumulative fix packs or service packs.

* Custom workflow launchers are held under:

  ```
  /conf/global/settings/workflow/launcher/...

  ```

* Legacy workflow launchers are held under the following path:

  `/etc/workflow/launcher/`

  >[!NOTE]
  >
  >If these definitions are edited *using the AEM UI*, then the details will be copied to the new locations.

#### Locations - Workflow Scripts {#locations-workflow-scripts}

Workflow scripts are also stored in the repository according to type:

* Out-of-the-box workflow scripts are held under the following path:

  `/libs/workflow/scripts/`

  >[!CAUTION]
  >
  >Do not:
  >
  >* place any of your custom workflow scripts in this folder
  >* edit anything in `/libs`
  >
  >As any changes may be overwritten at upgrade or when installing hot-fixes, cumulative fix packs or service packs.

* Custom workflow scripts are held under:

  ```
  /apps/workflow/scripts/...

  ```

* Legacy workflow scripts are held under the following path:

  `/etc/workflow/scripts/`

#### Locations - Workflow Notifications {#locations-workflow-notifications}

Workflow notifications are also stored in the repository according to type:

* Out-of-the-box workflow notification definitions are held under the following path:

  `/libs/settings/workflow/notification/`

  >[!CAUTION]
  >
  >Do not:
  >
  >* place any of your custom workflow notification definitions in this folder
  >* edit anything in `/libs`
  >
  >As any changes may be overwritten at upgrade or when installing hot-fixes, cumulative fix packs or service packs.

* Custom workflow notification definitions are held under:

  ```
  /conf/global/settings/workflow/notification/...

  ```

  >[!NOTE]
  >
  >If you want to override a workflow notification text, create an overlaid path under:
  >
  >
  >`/conf/global/settings/workflow/notification/<path-under-libs>`

* Legacy workflow notification definitions are held under the following path:

  `/etc/workflow/notification/`

### Process Sessions {#process-sessions}

As in any custom development, it is always recommended to use a user's session when possible:

* for best adherence to security guidelines
* to allow the system to manage opening and closing the session

When implementing a workflow process:

* A workflow session will be provided and should be used unless there is a compelling reason not to.
* New sessions should not be created from workflow steps as this causes inconsistencies in the state(s) together with possible concurrency issues in the workflow engine.
* You should not acquire a new JCR session from within a process step in a workflow; you should adapt the workflow session provided by the Process Step API to a jcr session. For example:

```
public void execute(WorkItem item, WorkflowSession workflowSession, MetaDataMap args) throws WorkflowException {
        // to obtain a jcr session:
        javax.jcr.Session jcrSession = workflowSession.adaptTo(javax.jcr.Session.class);

        // to obtain a sling resource resolver:
        org.apache.sling.api.resource.ResourceResolver slingResourceResolver = workflowSession.adaptTo(org.apache.sling.api.resource.ResourceResolver.class);
```

Saving a session:

* Inside a workflow process, if the `WorkflowSession` is being used to modify the repository then do not explicitly save the session - the workflow will save the session when it completes.
* `Session.Save` should not be called from within a workflow step:

    * it is recommended to adapt the workflow jcr session; then `save` is not necessary as the workflow engine saves the session automatically once the workflow has finished executing.
    * it is not recommended for a process step to create its own jcr session.

* By eliminating unnecessary saves, you can reduce overhead and thus make the workflows more efficient.

>[!CAUTION]
>
>If, despite the recommendations here, you do create your own jcr session, then it must be saved.

### Minimize the Number/Scope of Launchers {#minimize-the-number-scope-of-launchers}

There is one listener that is responsible for all the [workflow launchers](/help/sites-administering/workflows-starting.md#workflows-launchers) that are registered:

* It will listen for changes at all the paths specified in the globbing properties of the other launchers.
* When an event is dispatched, the workflow engine will then evaluate each launcher to determine if it should run.

Creating too many launchers will cause the evaluation process to run more slowly.

Creating a globbing path at the root of the repository on a single launcher would cause the workflow engine to listen for and evaluate create/modify events to every node in the repository. For this reason, it is recommended to only create launchers that are needed and to make the globbing path as specific as possible.

Due to the impact of these launchers on workflow behavior, it can also be helpful to disable any out-of-the-box launchers that are not in use.

### Configuration Enhancements for Launchers {#configuration-enhancements-for-launchers}

The custom [launcher configuration](/help/sites-administering/workflows-starting.md#workflows-launchers) has been enhanced to support the following:

* Have multiple conditions "AND"ed together.
* Have OR conditions within a single condition.
* Disable/enable launchers based on whether a feature flag is enabled or disabled.
* Support regex in launcher conditions.

### Do Not Start Workflows from other Workflows {#do-not-start-workflows-from-other-workflows}

Workflows can carry a significant amount of overhead, both in terms of objects created in memory and nodes tracked in the repository. For this reason, it is better to have a workflow do its processing within itself rather than start additional workflows.

An example of this would be a workflow that implements a business process on a set of content and then activates that content. It is better to create a custom workflow process that activates each of these nodes, rather than starting an **Activate Content** model for each of the content nodes that needs to be published. This approach will require additional development work, but is more efficient when executed than starting a separate workflow instance for each activation.

Another example would be a workflow that processes several nodes, creates a workflow package, then activates said package. Rather than creating the package and then starting a separate workflow with the package as the payload, you can change the payload of your workflow in the step that creates the package and then call the step to activate the package within the same workflow model.

### Handler Advance {#handler-advance}

When designing a workflow model you have the option to enable handler advance on your workflow steps. Alternately, you can add code to your workflow step to determine which step should be run next and then execute it.

It is recommened to use handler advance as it delivers better performance.

### Workflow Stages {#workflow-stages}

You can define [workflow stages](/help/sites-developing/workflows.md#workflow-stages), then assign tasks/steps to a specific workflow stage.

This information is used for displaying the progress of a workflow when you click the [**Workflow Info** tab of a workitem from the **Inbox**](/help/sites-authoring/workflows-participating.md#opening-a-workflow-item-to-view-details-and-take-actions). Existing workflow models can be edited to add stages.

### Activate Page Process Step {#activate-page-process-step}

The **Activate Page Process** step will activate pages for you, but it will not automatically find any referenced DAM assets and activate those as well.

This is something to keep in mind if you plan to use this step as part of a workflow model.

### Upgrade Considerations {#upgrade-considerations}

When upgrading your instance:

* make sure that any custom workflow models are backed up before an instance is upgraded.
* confirm that none of your custom workflows are stored under the [location](#locations):

    * `/libs/settings/workflow/models/projects`

>[!NOTE]
>
>See also [Repository Restructuring in AEM 6.5](/help/sites-deploying/repository-restructuring.md).

## System Tools {#system-tools}

There are many system tools available to help with monitoring, maintaining, and troubleshooting workflows. All example URLs below use `localhost:4502`, but should be available on any author instance ( `<hostname>:<port>`).

### Sling Job Handling Console {#sling-job-handling-console}

`http://localhost:4502/system/console/slingevent`

The Sling Job Handling console will show:

* Statistics on the state of jobs in the system since the last restart.
* It will also show the configurations for all job queues and provide a shortcut to editing them in the configuration manager.

### Workflow Report Tool {#workflow-report-tool}

The workflow reporting tool is being removed in 6.3 to prevent performance degradation.

### Workflow Maintenance Operations MBean {#workflow-maintenance-operations-mbean}

`http://localhost:4502/system/console/jmx/com.adobe.granite.workflow:type=Maintenance`

The workflow maintenance MBean exposes several useful maintenance routines such as purging completed workflows and retrieving workflow statistics.

## Further Information {#further-information}

For further information see:

* [Working with Workflows](/help/sites-authoring/workflows.md)
* [Administering Workflows](/help/sites-administering/workflows.md)
* [Developing and Extending Workflows](/help/sites-developing/workflows.md)
* [Performance Optimization](/help/sites-deploying/configuring-performance.md)
