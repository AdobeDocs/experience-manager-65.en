---
title: Data Retention in AEM Forms
description: Learn how Adobe Experience Manager (AEM) Forms, by default, acts as a pass-through server and does not store form end-user data, supporting data privacy.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
role: Admin, User
solution: Experience Manager Forms
feature: Adaptive Forms
product_v2:
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
---
# Data retention in AEM Forms {#data-retention-in-aem-forms}

Does AEM Forms store form data? By default, no. Adobe Experience Manager (AEM) Forms acts as a pass-through server for data captured via Adaptive Forms, and it does not store end-user data in the AEM Repository. Instead, the server passes the submitted data to the destination that you own and configure. This default behavior helps you meet your data privacy and compliance goals, and it applies to both AEM Forms on OSGi and AEM Forms on JEE.

Because AEM Forms is an extensible platform, you can customize AEM to change this default behavior. If your customization stores the data submitted through an Adaptive Form in the AEM Repository or writes it to AEM logs, you must ensure that such data is not retained on your production and staging systems.

## Default behavior with out-of-the-box capabilities {#default-behavior}

When you use out-of-the-box Adaptive Forms capabilities, AEM Forms does not store end-user data. The server directly passes the submitted data through to the destination that you own and configure.

Out-of-the-box mechanisms that connect a form to a destination you own include the Form Data Model (FDM), out-of-the-box connectors, and submit actions. Each of these sends data to a location that you own and configure, so it is not retained in the AEM Repository. A form can also invoke an external or third-party service, such as a REST API, from a rule or a submit action, and forward data to that service without persisting the data on AEM.

If you use AEM Workflows with long-lived processes involving an approval step, AEM Forms may hold data in memory and in temporary storage to complete the operation. For information on how to prevent this data from being saved on AEM, see the [Data in long-lived workflow processes](#long-lived-workflow-processes) section.

The Forms Portal Submit action retains data captured or submitted via Adaptive Forms, but the data is saved to a storage location that you provide and own, not in the AEM Repository or logs. For more information, see [Secure data saved by forms portal submit action](/help/forms/using/hardening-securing-aem-forms-environment.md#secure-data-saved-by-forms-portal-submit-action).

## Data in transit {#data-in-transit}

Although AEM Forms does not store end-user data by default, data still moves between the end user, AEM Forms, and the destination that you configure. Secure this traffic with Transport Layer Security (TLS) so that data is encrypted in transit.

To secure the connection between the browser and AEM, enable HTTPS on the AEM instance. For the steps, see [SSL/TLS By Default](/help/sites-administering/ssl-by-default.md).

In addition, make sure the endpoints that AEM Forms sends data to, such as cloud configurations, submit action URLs, and Form Data Model data sources, use secure HTTPS endpoints. Because AEM Forms does not store the data that it passes through, encryption at rest does not apply to that data. For more guidance on securing the connection, see [Secure transport layer](/help/forms/using/hardening-securing-aem-forms-environment.md#secure-transport-layer).

## Form Data Model for external data stores {#form-data-model}

To read and write data to a data store, use a Form Data Model (FDM). FDM is the recommended mechanism to connect a form to a data source that you own and manage, such as a database or a RESTful web service.

For more information, see [Introduction to AEM Forms Data Integration](/help/forms/using/data-integration.md). For guidance on securing the data that an FDM handles, see [Secure data handled by form data model (FDM)](/help/forms/using/hardening-securing-aem-forms-environment.md#secure-data-handled-by-form-data-model-fdm).

## Data in long-lived workflow processes {#long-lived-workflow-processes}

If you use long-lived workflow processes, AEM can save data temporarily as part of the workflow payload. The workflow variables that carry this payload are stored in the workflow instance metadata in the AEM Repository, and they can contain personally identifiable information (PII) or sensitive personal data (SPD) provided by end users while filling an adaptive form.

To keep this data in a repository that you own and manage, such as Azure Blob storage, rather than on AEM, use AEM's data externalization capability. When you externalize the variables, data is not saved in the AEM Repository; it is stored in your own data repository instead.

For the steps to externalize data, see [Parameterize sensitive data to workflow variables and store in external data stores](/help/forms/using/aem-forms-workflow.md#externalize-wf-variables).

## Customization and logging {#customization-and-logging}

AEM is a customizable solution. If you customize AEM, ensure that your customization does not store any data in the AEM Repository or logs.

When you use default capabilities, AEM Forms does not write form end-user data to logs.

Custom code can write data to logs. If you add tracing or logging during development, remove traces and data sent to logs before deploying your code to staging and production environments.

## Frequently asked questions about AEM Forms data retention {#faq}

**Does AEM Forms store form data?**

No. By default, Adobe Experience Manager (AEM) Forms acts as a pass-through server for data captured through Adaptive Forms and does not store end-user data in the AEM Repository. The server passes submitted data to the destination that you own and configure, such as a Form Data Model data source, a submit-action target, or an external API. This default behavior applies to both AEM Forms on OSGi and AEM Forms on JEE.

**Where is Adaptive Form data stored?**

Submitted Adaptive Form data is stored in the destination that you own and configure, not in the Adobe Experience Manager (AEM) Repository. Out-of-the-box mechanisms such as the Form Data Model (FDM), connectors, and submit actions send data to your own location. A form can also forward data to an external service, such as a REST API, without persisting it on AEM. The Forms Portal submit action also saves data to a storage location that you provide and own.

**Do long-lived workflows store form data?**

Long-lived workflow processes in Adobe Experience Manager (AEM) Forms can save data temporarily as part of the workflow payload, which is stored in the workflow instance metadata in the AEM Repository. To keep this data in a repository that you own and manage, such as Azure Blob storage, rather than on AEM, use the [AEM data externalization capability for workflow variables](/help/forms/using/aem-forms-workflow.md#externalize-wf-variables).

**Does AEM Forms write data to logs?**

No. With default capabilities, Adobe Experience Manager (AEM) Forms does not write form end-user data to logs. Because AEM is a customizable platform, custom code can write data to logs. If you add tracing or logging during development, remove those traces and any logged data before deploying to staging and production environments. A customization must not store data in the AEM Repository or logs.

**How is data protected in transit?**

Data in transit is protected with Transport Layer Security (TLS) in Adobe Experience Manager (AEM) Forms. Enable HTTPS on the AEM instance to secure the connection between the browser and AEM. In addition, make sure the endpoints that AEM Forms sends data to, such as cloud configurations, submit-action URLs, and Form Data Model data sources, use secure HTTPS endpoints. Because AEM Forms does not store the data it passes through, encryption at rest does not apply to that data.

## Related resources {#related-resources}

* [Introduction to AEM Forms Data Integration](/help/forms/using/data-integration.md)
* [Parameterize sensitive data to workflow variables and store in external data stores](/help/forms/using/aem-forms-workflow.md#externalize-wf-variables)
* [Configuring the Submit action](/help/forms/using/configuring-submit-actions.md)
* [Hardening and securing AEM Forms on OSGi environment](/help/forms/using/hardening-securing-aem-forms-environment.md)
