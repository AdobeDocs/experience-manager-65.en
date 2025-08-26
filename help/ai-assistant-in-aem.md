---
title: AI Assistant in AEM
description: Use AI Assistant to help you find answers, and troubleshoot for the solutions that are available in Adobe Experience Manager.
solution: Experience Manager
feature: Cloud Manager, Developing
role: Admin, Architect, Developer


---
# AI Assistant in AEM {#about-ai-assistant-in-aem}

The AEM (Adobe Experience Manager) AI Assistant offers a conversational interface designed to streamline finding answers to your Adobe Experience Manager-related queries. It helps you get instant answers to your AEM product-related questions (*available to all users*), and automate support ticket creation (*available to Support Admins*). 

The AI Assistant supports AEM as a Cloud Service, including the following solutions:

* Experience Hub overview page
* Edge Delivery Services
* Sites
* Assets
* Forms
* Dynamic Media
* Cloud Manager


It is directly embedded in AEM and accessible from AEM Experience Hub, Cloud Manager, and Author UI.

The following 3-minute, 39-second video delivers a step-by-step walkthrough of the AI Assistant in AEM.

>[!VIDEO](https://video.tv.adobe.com/v/3470354?learn=on) 

## Get access to AI Assistant in AEM{#get-access}

To grant users access to the AI Assistant in AEM, your Adobe Admin must configure the following custom permissions for the profiles that require access in the **Adobe Admin Console**:

* **AI Assistant access** - Permission to use the AI Assistant in AEM for product knowledge, allowing users to ask product-related questions in the AI Assistant chat. This permission must be enabled.
* **Support access** - Users must also have permission to open support tickets, which requires the **Support Admin** role.

AI Assistant requests in AEM are authenticated through Adobe Identity Management Services (IMS). For details, see the [Adobe Identity Management Services overview](https://www.adobe.com/content/dam/cc/en/trust-center/ungated/whitepapers/corporate/adobe-identity-management-services-security-overview.pdf).

**To get access to AI Assistant in AEM:**

1. Customers must have an additional agreement in place to access most AI-powered and agentic capabilities in Adobe Experience Manager. Contact your Adobe representative for details.

<!-- OLD STEP 1 [Customers must sign the Gen AI rider with Adobe](https://fieldreadiness-adobe.highspot.com/items/665f831c9f831b011aeda057#1). 

    The GenAI Rider is a legal agreement between a customer and Adobe, required to use most AI and agentic capabilities. Contact Adobe Customer Care to learn more. -->

1. The AEM Admin configures the AI Assistant for use in their organization. See [Configure the AI Assistant in AEM](/help/ai-assistant-in-aem-admin.md).

<!--
>[!IMPORTANT]
>Be sure you have reviewed and submitted the user agreement so Adobe can enable the AI Assistant feature for you to test out and participate in the private beta program.
>
>For any questions, send an email to [Grp-AEMAIASSISTANT@adobe.com](mailto:Grp-AEMAIASSISTANT@adobe.com) from your email address associated with your Adobe ID. --> 

## Scope {#scope}

The current scope of the AI Assistant in AEM focuses on addressing product knowledge questions for AEMr as a Cloud Service. This scope includes comprehensive support for key areas. <!--, such as Sites, Assets, Forms, Edge Delivery Services, Dynamic Media, and Cloud Manager. -->

* **Surfaces**: Available across AEM Experience Hub, Author UI, Cloud Manager.
* **Capabilities**: Product‑knowledge and first-stop for troubleshooting and guidance, automated creation of support tickets and lookup.
* **Value**: Saves time, accelerates learning and time to value, reduces the need to create support tickets manually, and improves efficiency in creating support tickets.

## Privacy, Security, and Governance{#privacy-security-governance}
 
The AI Assistant in AEM is designed with a strong emphasis on privacy, security, and governance.

This article outlines the trust-centered features that you can expect from the AI Assistant in AEM:

* No personal data is used by AI Assistant in AEM, including for training purposes.
* AI Assistant in AEM does not have access to consumer data.
* Explicit permission is required to interact with AI Assistant in AEM.
* User-provided prompts (questions, queries, and so on) are not shared with other customers.

<!-- See also [Security at Adobe whitepaper](). NEED ACTIVE LINK FROM ADRIAN NICOLAE TANASE. CURRENTLY 404. -->

## Get to know the AI Assistant in AEM for product knowledge and automated support ticket creation {#ai-prod-insights}

Product knowledge encompasses concepts and topics derived from Adobe Experience League documentation. These questions can be categorized into the following sub-groups:


| Product knowledge | Available to all users<br>Examples |
| :--- | :--- |
| Pointed learning | <ul><li>What is the Universal Editor?</li><li>How do I create a program in Cloud Manager?</li></ul> |
| Open discovery | <ul><li>How do I use Universal Editor?</li><li>Is there a way to copy content from one environment to another?</li></ul>  |
| Troubleshooting | <ul><li>Why can't I access the Universal Editor?</li><li>Why is my pipeline failing?</li></ul>  |
| **Support ticket creation** | **Available to Support Admins only**<br>**Examples** |
| Automated support ticket creation capturing AI Assistant chat history and context | <ul><li>Create a support ticket for me.</li></ul> |
| Retrieve status of support ticket | <ul><li>Show me all the support tickets that I have opened.</li><li>Show me the status of ticket "E-----------"</li></ul> |

{style="table-layout:auto"}


## How to craft effective questions {#ai-craft-questions}

To receive the most accurate responses from the AI Assistant in AEM, it is important to phrase your questions with clarity and context. Use the following tips to ensure that your queries are clear and well-structured:

* Clearly state your task or question in a concise manner.  
* Avoid ambiguous wording or overly complex syntax to improve understanding.
* Include relevant context about your task or question, as this approach helps the AI Assistant in AEM provide more precise and relevant answers. 
For example, in your prompt, it helps to name the AEM solution you are working in - Sites, Assets, Dynamic Media, Edge Delivery Services, Cloud Manager, or Forms.

### Examples of unsupported questions {#ai-unsupported-questions}

| Area | Examples |
| --- | --- |
| Operational insights | <ul><li>How many development environments exist in my tenant?</li><li>Who started the last production pipeline?</li></ul> |
| Troubleshooting | <ul><li>Why is my production pipeline failing?</li></ul>  |
| Task and automation | <ul><li>Configure a code quality pipeline from a dev branch for me.</li></ul>  | 


## Use AI Assistant in AEM {#ai-use} 

<!-- UNHIDE AFTER BETA or at GA
### Enable AI Assistant in AEM access through Admin Console 

To use the AI Assistant in AEM, your organization must opt in at the Admin Console level. A product administrator creates (or chooses) a user group and grants it the new "AI Assistant" permission. Anyone added to that group instantly gains access to the Assistant across AEM. If the goal is company-wide availability, the admin simply assigns all users to that group.

![AI Assistant in AEM in the Admin Console](/help/implementing/cloud-manager/assets/ai-assistant-admin-console.png)

From an employee's perspective, the process is straightforward: identify the product administrator for Adobe Experience Manager in your organization and request to be added to the AI-enabled user group. Once you appear in that group, the Assistant icon shows up automatically the next time you sign in.

Administrators should keep normal Cloud Manager governance in mind. Hold product administrator rights in the Admin Console to create profiles, manage user groups, or edit permissions. If users also need the Assistant's built-in **Create Support Ticket** feature, add the standard **Support Admin** role (standard Admin Console role) to the same individuals or group.

![Technical support ticket creation in the AI Assistant in AEM of the Admin Console](/help/implementing/cloud-manager/assets/ai-assistant-admin-console-support-ticket.png)

For a guided walkthrough of setting up users and groups in AEM as a Cloud Service, see [Configuring access to AEM as a Cloud Service ](https://experienceleague.adobe.com/en/docs/experience-manager-learn/cloud-service/accessing/overview). 

See also [Custom Permissions](/help/implementing/cloud-manager/custom-permissions.md). -->


### Start an AI Assistant in AEM conversation

You can reset the AI Assistant in AEM and start a new conversation when you want to change topics. This ability is especially helpful when troubleshooting queries that are failing or providing incorrect information.

**To start an AI Assistant in AEM conversation:** 

1. Near the upper-right corner of the AEM user interface (either from Cloud Manager pages or the author instance of the AEM environments), click the **AI Assistant** icon.

    ![AI Assistant icon on the toolbar](/help/assets/assets-ai/ai-assistant-icon.png)

1. In the **AI Assistant** panel text box near the bottom, type your question or prompt, then press `Enter` or click ![Send icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Send_18_N.svg).

    >[!NOTE]
    >
    >Personal data should not be included in your inputs, as it is unnecessary for using this tool.

    ![Text box at bottom of the AI Assistant panel](/help/assets/assets-ai/ai-assistant-prompt-text-box.png)

1. To start a new conversation (new topic or a change in the topic), click ![More icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_More_18_N.svg) > **Start new conversation**. 

    ![Start a new conversation in AI Assistant from the ellipsis icon](/help/assets/assets-ai/ai-assistant-start-new-conversation.png)

### Discover prompts by category

AI Assistant in AEM includes a discoverability feature to help you explore supported topics and categories.  

**To discover prompts by category:** 

1. In the AI Assistant panel, click ![Learn icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Learn_18_N.svg) to turn on the prompt discovery panel.

    ![Panel that lets you explore prompts by category in AI Assistant](/help/assets/assets-ai/ai-assistant-discover-prompts.png) 
    *Panel showing prompt categories in AI Assistant.*

1. Select a category to view a list of related prompts.  
1. Select a prompt to see examples of the types of questions the AI Assistant can answer.

1. To hide the prompt discovery panel, click ![Learn icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Learn_18_N.svg) again.

### Share your feedback on the AI Assistant in AEM

Your input helps Adobe improve the AI Assistant for better performance and accuracy.

Share your feedback on your experience with AI Assistant in AEM through the following options:

![Thumbs up, thumbs down, and flag icons](/help/assets/assets-ai/ai-assistant-feedback-icons.png)

| Click | Description |
| --- | --- |
| ![Thumbs up outine icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_ThumbUpOutline_18_N.svg) | Indicate what went well and to share positive feedback. | 
| ![Thumbs down outine icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_ThumbDownOutline_18_N.svg) | Provide suggestions for improvement. Add specific comments about your experience, which are reviewed daily. |
| ![Flag icon](https://spectrum.adobe.com/static/icons/workflow_18/Smock_Flag_18_N.svg) | Report concerns or provide detailed feedback about your interaction with the AI Assistant in AEM. |  

## Frequently asked questions about AI Assistant in AEM {#ai-faq}

Here are answers to some common questions about the AI Assistant:

* **Is the information provided by the AI Assistant in AEM in real-time?**  
  No. AI Assistant sources its content from Adobe Experience League documentation. Updates to the content may take some time to reflect in its responses.
* **Which Adobe applications does AI Assistant in AEM support?**  
  Currently, AI Assistant supports product knowledge inquiries in AEM as a Cloud Service, including Sites, Assets, Dynamic Media, Cloud Manager, and Forms.
* **What are the capabilities of AI Assistant in AEM?**  
  AI Assistant in AEM is designed to answer queries related to Adobe product knowledge.
* **Does the AI Assistant in AEM use personal information for training data?**  
  No. AI Assistant in AEM does not use personal information for training purposes. Avoid sharing personal information about yourself or others, including names or contact details, with the AI Assistant in AEM.

<!-- IS THE DOCUMENTATION BELOW STILL NEEDED? IF SO, GO AHEAD AND DELETE THE COMMENT TAGS!!

## AEM Forms AI Assistant (Forms Experience Builder) {#ai-forms-builder}

In addition to the general AI Assistant in AEM for product knowledge, AEM offers a specialized **[AEM Forms AI Assistant (Forms Experience Builder)](/help/edge/docs/forms/forms-ai-assistant.md)**. This enhanced assistant can actively help you create and configure forms through natural language prompts and answer questions specific to forms.

### Key capabilities

The AEM Forms AI Assistant provides:

* **Form Creation**: Create new forms from scratch using natural language descriptions.
* **Design Import**: Convert existing designs (PDF, Figma, images) into functional AEM Forms. 
* **Form Configuration**: Add fields, panels, validation rules, and conditional logic.
* **Layout Management**: Organize form structure and optimize for different devices.
* **Integration Setup**: Configure form submissions and data handling.
* **Product Knowledge**: Answer questions about AEM Forms features and best practices.

### Where to access

The AEM Forms AI Assistant is available in the following:

* **Universal Editor**: For Edge Delivery Services forms with visual editing capabilities.
* **Adaptive Forms Editor**: For detailed form configuration and advanced features.
* **Forms Management UI**: For high-level form creation and management tasks.

### Getting started

>[!NOTE]
>
> The AEM Forms AI Assistant (Forms Experience Builder) is available under the private beta program. Send an email from your work address to [aem-forms-ea@adobe.com](mailto:aem-forms-ea@adobe.com) to request access.

To learn more about using the AEM Forms AI Assistant , see the [AEM Forms AI Assistant](/help/edge/docs/forms/forms-ai-assistant.md) documentation.

### Example Use Cases

* **"Create a customer feedback form with name, email, rating, and comments fields"**
* **"Convert this uploaded PDF application form into a digital adaptive form"**  
* **"Add conditional logic to show spouse information only when marital status is 'Married'"**
* **"Configure this form to submit data to the Customer Relationship Management system"**

This specialized AEM Forms AI Assistant represents the next evolution in form building, combining the power of AI with AEM's robust forms capabilities to streamline your form creation workflow.
-->
