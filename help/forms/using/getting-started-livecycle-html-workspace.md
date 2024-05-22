---
title: Getting started with AEM Forms workspace

description: How to get started with using the LiveCycle AEM Forms workspace to manage your business automation processes.


contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace

exl-id: d2a962b6-16be-4866-a856-5064f81c9610
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "Admin, User, Developer"
---
# Getting started with AEM Forms workspace {#getting-started-with-aem-forms-workspace}

You can use AEM Forms workspace to perform the following tasks:

* Start a business process
* View and act upon tasks that are assigned to you or to other To-do lists that you have access to
* Track tasks that are part of the processes you started or participated in

## Navigating&nbsp;AEM Forms workspace {#navigating-html-workspace}

Different items in the AEM Forms workspace user interface are displayed depending on the process and task that you are working on. You may or may not see the Summary, Forms, Details, History, Attachments, or Notes tabs, or all the buttons that are described in this Help at all times.

You can navigate the main AEM Forms workspace user interface by using any of the following methods:

* Click the items in the top navigation bar to access the Start Process, To-do list, Preferences, Tracking, Help, and log out option.
* Click the Start Process, To-do, or Tracking tab to access the three main working areas.
* On the Start Process, To-do, and Tracking tabs, click the items on the list in the left panel to access favorites, process categories, search templates, drafts, or assigned tasks. Use the scroll bar to see additional items in the list.
* All the action buttons--Approve, Reject, Forward, Consult, Lock, and Share--show in both, the document and the Ownership.
* Click All Options icon in the navigation bar, at the bottom of the page, to forward the task to another user, to share the task with another user, to consult on the task with another user, or to lock the task.
* On the History tab, select a task to display the Attachments and Assignments tabs for that task.
* Use the tab key, arrow keys, and spacebar to navigate through AEM Forms workspace without using a mouse.

## Using AEM Forms workspace&nbsp;with screen readers {#using-html-workspace-with-screen-readers}

AEM Forms workspace is a web-based HTML application and is compatible with screen readers. You can navigate through the AEM Forms workspace interface by using the keyboard.

To use AEM Forms workspace with a screen reader, keep in mind these points:

* AEM Forms workspace is a standard HTML application that complies with any standard screen reader tool. You do not need any specific script to run a screen reader tool.
* All the navigation in AEM Forms workspace is through anchor tags, which can easily be accessed through tabs.
* Forms can take a few seconds to load. The screen reader does not audibly inform you that the form is loading and that you must wait.

## Navigating AEM Forms workspace&nbsp;using a keyboard {#navigating-html-workspace-using-a-keyboard}

When you are navigating AEM Forms workspace by using a keyboard, the navigation conforms to HTML accessibility conventions. In certain situations, the tabbing order does not follow the typical conventional order. The following tips help you navigate the interface:

* If you have problems tabbing out of the toolbars at the top of the browser, press Ctrl+Tab to tab into the content of the browser window.
* The AEM Forms workspace Help opens in a separate browser window. After you view the Help, the focus returns to the browser window that contains AEM Forms workspace. The Help menu remains focused when the focus returns.
* When you open a form to start a process or complete a task, the focus remains with the existing element and does not change to the form. Use tab to move the focus to the form and browse through it. Tabbing order through the form depends on the type and design of the form.

  For PDF forms, when you tab through to the end of the form or submit the form, the cursor focus jumps to the browser Address bar. Tab through the menus again (but not the entire form) to go to the form action buttons such as Save As Draft and Complete. If the form is still open, you can also tab past the buttons and back into the form.

## Managing preferences {#managing-preferences}

You can set the various AEM Forms workspace preferences in the following categories:

**Out of Office:** Set preferences to control how tasks are assigned to other people while you are out of the office. See [Setting out-of-office preferences](todo-lists.md#setting-out-of-office-preferences).

**Queues:** Set preferences for sharing your To-do list with other users or for requesting access to another user's list. See [Working with tasks from group and shared queues](todo-lists.md#working-with-tasks-from-group-and-shared-queues).

**UI Settings:** Set preferences for how you interact with AEM Forms workspace. See [Set user interface preferences](#set-user-interface-preferences).

### Set user interface preferences {#set-user-interface-preferences}

Set the user interface preferences in the Preferences &gt; UI Settings tab. The following preferences are available.

* **Start Location:** Specifies the page that appears when you log in to AEM Forms workspace. The four available options are Start Process, To Do, Tracking, and Favorites.
* **Logout Prompt:** Specifies whether you are prompted to confirm that you want to log out after you click Log Out.
* **Date Format:** Specifies the date display format used across AEM Forms workspace.
* **Time Format**: Specifies the time display format used across AEM Forms workspace.
* **Notify Task Events via Email:** Specifies whether you receive email notifications for task events, including task assignments, reminders, and deadlines for tasks in your To-do list and in group To-do lists that you belong to.
* **Attach Forms in Email:** Specifies whether a copy of the form is attached to email notification messages. Attachments are supported only for PDF and XDP forms.
* **Save draft periodically:** Specifies whether your form drafts are auto-saved periodically or not. To save your drafts periodically, enable this option and set the auto-save duration from 1 to 30 minutes. When auto-save is enabled and a user is working on a draft, the draft is saved periodically after the specified number of minutes. The draft is auto-saved only when there is a change in the draft since the last save or auto-save. When the draft is saved, an alert message appears on the screen.
