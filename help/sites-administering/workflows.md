---
title: Administering Workflows
description: Learn how to automate Adobe Experience Manager activities using workflows.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
exl-id: 10eecfb8-d43d-4f01-9778-87c752dee64c
solution: Experience Manager, Experience Manager Sites
feature: Operations
role: Admin
---
# Administering Workflows{#administering-workflows}

Workflows enable you to automate Adobe Experience Manager (AEM) activities. Workflows:

* Consist of a series of steps that are run in a specific order.

  * Each step performs a distinct activity; such as waiting for user input, activating a page, or sending an email message.

* Can interact with assets in the repository, user accounts, and AEM services.
* Can coordinate complicated activities that involve any aspect of AEM.

The business processes that your organization has established can be represented as workflows. For example, the process of publishing website content typically includes steps such as approval and sign-off by various stakeholders. These processes can be implemented as AEM workflows and applied to content pages and assets.

* [Starting Workflows](/help/sites-administering/workflows-starting.md)
* [Administering Workflow Instances](/help/sites-administering/workflows-administering.md)
* [Managing Access to Workflows](/help/sites-administering/workflows-managing.md)

>[!NOTE]
>
>For further information see:
>
>* Applying and participating in workflows: [Working with Workflows](/help/sites-authoring/workflows.md).
>* Creating workflow models and extending workflow functionality: [Developing and Extending Workflows](/help/sites-developing/workflows.md).
>* Improving the performance of workflows that use significant server resources: [Concurrent Workflow Processing](/help/sites-deploying/configuring-performance.md#concurrent-workflow-processing).
>

## Workflow Models and Instances {#workflow-models-and-instances}

[Workflow models](/help/sites-developing/workflows.md#model) in AEM are the representation and implementation of business processes:

* Typically they act on pages or assets to achieve a specific result.
* These pages and/or assets are called the workflow payload.
* Workflow models consist of a series of steps that perform a specific task.
* The payload is passed from step to step as the workflow progresses.

When a workflow model is started (executed), a workflow instance is created. A workflow model can be started multiple times, each time generating a distinct workflow instance. For each instance, the steps that the workflow model defines are executed.

>[!CAUTION]
>
>The steps performed are those defined by the workflow model *at the time that the instance is generated*. See [Developing and Extending Workflows - Models](/help/sites-developing/workflows.md#model) for further details.

Workflow instances progress through the following lifecycle:

1. The workflow model is started and a workflow instance is created and running.

   1. The payload of the workflow instance is identified when the model is started.
   1. The instance is effectively a copy of the model (as at the time of creation).
   1. AEM authors, administrators, or services can start workflow models.

1. The first step of the workflow model is executed.
1. The step is completed and the workflow engine uses the model to determine the next step to execute.
1. The subsequent steps in the workflow model are executed and completed.
1. When the final step is completed, the workflow instance is completed and therefore archived.

Many useful workflow models are provided with AEM. In addition, the developers in your organization can create custom workflow models, tailored to the specific needs of your business processes.

## Workflow Steps {#workflow-steps}

When workflow steps are executed, they are associated with a workflow instance. The history of a workflow instance includes information about each step that has executed for the instance. This information is useful for investigating problems that occur during execution.

Either a user or a service performs workflow steps, depending on the type of step:

* When a user performs a step, they are assigned a work item that is placed in their Inbox. The user is responsible for manually completing the step so that the workflow instance progresses.
* When a service performs a step, upon completion the workflow instance progresses automatically to the next step.

>[!NOTE]
>
>If an error occurs, the service/step implementation should handle behavior for an error scenario. The workflow engine itself retries the job, then logs an error and stops the instance.

## Workflow Status and Actions {#workflow-status-and-actions}

A workflow can have one of the following statuses:

* **RUNNING**: The workflow instance is running.
* **COMPLETED**: The workflow instance has been successfully ended.

* **SUSPENDED**: Marks the workflow as suspended. However, see the Caution note below on a known issue with this state.
* **ABORTED**: The workflow instance has been terminated.
* **STALE**: Progression of the workflow instance requires that a background job executes, however the job cannot be found in the system. This situation can occur when an error occurs when executing the workflow.

>[!NOTE]
>
>When the execution of a Process Step results in errors, the step appears in the administrator's Inbox and the workflow status is **RUNNING**.

Depending on the status, you can perform actions on running workflow instances when you must intervene in the normal progression of a workflow instance:

* **Suspend**: Suspending changes the workflow state to Suspended. See Caution below:

>[!CAUTION]
>
>Marking a workflow state to "Suspend" has a known issue. In this state, it is possible to act on suspended workflow items in an Inbox.

* **Resume**: Restarts a suspended workflow at the same point of execution where it was suspended, using the same configuration.
* **Terminate**: Ends the workflow execution and changes the state to **ABORTED**. An aborted workflow instance cannot be restarted.
