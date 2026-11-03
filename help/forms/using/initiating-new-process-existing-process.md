---
title: Initiating a new process with existing process data in AEM Forms workspace
description: See how you can initiate a new process with existing process data in AEM Forms workspace.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace
docset: aem65
exl-id: 6fa97c06-9238-4444-b67f-983ef3b6fdc8
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Initiating a new process with existing process data in AEM Forms workspace{#initiating-a-new-process-with-existing-process-data-in-aem-forms-workspace}

You can initiate a new process using the data of an existing process data. The need to initiate a new process from existing process data arises when we have to use the same form frequently with few changes in content like that of paid-time-off forms. This feature saves time and effort of users especially when the process has long form to fill.

Following are the steps to initiate a new process from existing process data:-

1. Do one of the following actions:

    * In Tracking, click the process instance whose data you want to use. From the Process History view in the right pane, click the task row that corresponds to the start point.
    * In Tracking, select a search template to display a list of process instances. Select the instance whose data you want to use.
    * In the **[!UICONTROL To-Do]** tab, select the task. Click the **[!UICONTROL History]** tab, and select the task that initiated the process instance.

   ![Select the task](assets/start3_new.png) ![Select the task](assets/start1_new.png)

1. In the Task action toolbar, click **[!UICONTROL Start]**. An Adaptive Form for the new process instance is displayed with prefilled data.  

1. Update the data as necessary, and click either **[!UICONTROL Complete]** or an appropriate button on the form.
