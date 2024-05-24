---
title: Backbone interaction
description: Conceptual information about use of Backbone JavaScript models in AEM Forms workspace.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
docset: aem65
exl-id: 8fd9770b-6ec4-4b09-b6b2-47a5e5d40f79
solution: Experience Manager, Experience Manager Forms
feature: HTML5 Forms, Adaptive Forms
role: Admin, User, Developer
---
# Backbone interaction{#backbone-interaction}

Backbone is a library that helps in creating and following MVC architecture in web applications. The basic idea of Backbone is to organize your interface into logical views, backed by models, each of which can be updated independently when the model changes, without having to redraw the page. For more information about Backbone, see [https://backbonejs.org](https://backbonejs.org/).

Some key concepts are as follows:

**Backbone model** Contains data, and most of the logic related to this data.

**Backbone view** Used to represent the state of the corresponding model. A backbone view actually behaves like a controller, listening to user interface events like user clicks, or to model events (like data changed), and modifies the user interface as appropriate.

**HTML template** A wrapper template which has placeholders populated by the model.

**AEM Forms workspace** Contains several individual components. Each component:

* Represents a single logical user interface element.
* Can be a collection of similar components.
* Made up of Backbone model, Backbone view, and HTML template.
* Contains reference to a service.
* Contains reference to required utilities.

When a component is initialized, following objects are created:

* A new instance of Backbone model for the component is created. Service is injected in the model.
* A new instance of Backbone view is created.
* Instance of corresponding model, HTML template, and Utilities are injected in the view.

In Backbone view, there is an event map which maps the various events that can arise due to user interface interactions with a corresponding handler. This mapping is initiated once a component is initialized.

When a view is initialized, the view calls its corresponding model to fetch data from server. Once all data required by a view is available, the view renders the data in the format specified by the HTML template. Multiple views may share same model for communication.

![AEM forms backbone view](do-not-localize/aem_forms_workflow.png)

An example:

1. User clicks a task template in the task list.
1. Task view listens to the click, and calls render function on the task model.
1. Task model subsequently calls the service which is a common point for all communication with AEM Forms server.
1. Service class calls AEM Forms REST endpoint for render method via ajax.
1. The success callback for this Ajax invocation is defined in the task model.
1. Task model raises a backbone event as a notification that render call is complete.
1. Another view, task details view listens to this event from task model.
1. Task details view then changes the task details template to display the rendered task (form, details, attachments, notes, and so on) to the user.
