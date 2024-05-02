---
title: Integration with Adobe Sign | Handling user data
description: Learn AEM Forms integration with Adobe Sign for e-signatures in adaptive forms. It supports multiple signing options for various workflows.
topic-tags: grdp
products: SG_EXPERIENCEMANAGER/6.5/FORMS
feature: Acrobat Sign
role: "Admin, User, Developer"
exl-id: b43ed9b7-b1ef-4878-ae3b-643b558eed7b
solution: Experience Manager, Experience Manager Forms
---
# Integration with Adobe Sign | Handling user data {#integration-with-adobe-sign-handling-user-data}

[!DNL AEM Forms] integrates with[!DNL  Adobe Sign] to enable e-signature workflows in adaptive forms to process forms or agreements for legal, sales, payroll, human resource management workflows. It allows for single and multiuser signing, sequential and simultaneous signing workflows, signing forms as an anonymous or logged-in user, and multiple ways to authenticate users.

When a signer or multiple signers sign and submit an adaptive form, an [!DNL Adobe Sign] agreement is generated that includes information about the signers.

For more information about [!DNL AEM Forms] integration with [!DNL Adobe Sign], see [Using Adobe Sign in an adaptive form](/help/forms/using/working-with-adobe-sign.md).

## User data and data stores {#data}

[!DNL Adobe Sign] enabled adaptive form includes information about the signers and may include other user data collected by the adaptive form. The [!DNL Adobe Sign] service saves user data with the signature within the agreement. The agreement is saved on an [!DNL Adobe Sign] server configured in [!DNL AEM Forms] cloud services. In addition, if the adaptive form is configured to use the Forms Portal submit action, the agreement data is saved in the Forms Portal data store along with the form data.

## Access and delete user data {#access-and-delete-user-data}

User data is collected within the agreement but not saved in any of the service tables. [!DNL Adobe Sign] enables administrators to make their own choices on managing the data they control in the service. Privacy administrators on the [!DNL Adobe Sign] service can list or remove agreements based on the email address of a requestor.

[!DNL Adobe Sign] offers a web application that allows searching of agreements by participants, and if necessary, deleting them. For more information, see [Adobe Sign - Feature: Delete User Information](https://helpx.adobe.com/sign/help/adobesign_gdpr_user_deletion.html).

Agreements data for adaptive forms configured to use the Forms Portal submit action is also saved in the Forms Portal data store. To access and delete data from the Forms Portal data store, see [Forms Portal | Handling user data](/help/forms/using/forms-portal-handling-user-data.md).
