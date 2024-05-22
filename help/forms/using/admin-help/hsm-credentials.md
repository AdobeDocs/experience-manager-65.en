---
title: Managing HSM credentials
description: Learn how to manage HSM credentials. You can manage HSM from the Trust Store Management page. You can view, check, update, reset and delete HSM components.  
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_certificates_and_credentials
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: facbeab2-de95-4778-894c-faa771d3391e
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms, Security"
role: "User, Developer"
---
# Managing HSM credentials {#managing-hsm-credentials}

From the Trust Store Management page, you can manage Hardware Security Module (HSM) credentials. An HSM is a third-party PKCS#11 device that you can use to securely generate and store private keys. The HSM physically protects the access to and use of the private keys.

The client software is required to communicate with the HSM. The HSM client software must be installed and configured on the same computer as AEM forms.

AEM forms Digital Signatures can use credentials stored on an HSM to apply server-side digital signatures. Follow the instructions in this section to create an alias for each HSM credential that Digital Signatures will use. The alias contains all the parameters required by the HSM.

>[!NOTE]
>
>After changing your HSM configuration, restart the AEM Forms Server.

## Create an alias for an HSM credential when the HSM device is online {#create-an-alias-for-an-hsm-credential-when-the-hsm-device-is-online}

1. In administration console, click Settings &gt;Trust Store Management &gt; HSM Credentials and then click Add.
1. In the Profile Name box, type a string used to identify the alias. This value is used as a property to some Digital Signatures operations, such as the Sign Signature Field operation.
1. In the PKCS11 Library box, type the fully qualified path of your HSM client library on the server. For example, `c:\Program Files\LunaSA\cryptoki.dll`. In a clustered environment, this path must be identical for all servers in the cluster.
1. Click Test HSM Connectivity. If AEM forms is able to connect to the HSM device, a message displays, stating that the HSM is available. Click Next.
1. Use either the Token Name, Slot ID, or Slot List Index to identify where the credentials are stored on the HSM.

    * **Token Name:** Corresponds to the name of the HSM partition to be used (for example, HSMPART1).
    * **Slot Id:** The Slot ID is a slot identifier of type data type long.
    * **Slot List Index:** If you select Slot List Index, set the Slot Info to an integer that corresponds to the slot. This is a 0-based index, which means that if the client is registered with the HSMPART1 partition first, HSMPART1 will be referred to using SlotListIndex value 0.

1. In the Token Pin box, type the password required to access the HSM key and click Next.
1. In the Credentials box, select a credential. Click Save.

## Create an alias for an HSM credential when the HSM device is offline {#create-an-alias-for-an-hsm-credential-when-the-hsm-device-is-offline}

1. In administration console, click Settings &gt;Trust Store Management &gt; HSM Credentials and then click Add.
1. In the Profile Name box, type a string used to identify the alias. This value is used as a property to some Digital Signatures operations, such as the Sign Signature Field operation.
1. In the PKCS11 Library box, type the fully qualified path of your HSM client library on the server. For example, `c:\Program Files\LunaSA\cryptoki.dll`. In a clustered environment, this path must be identical for all servers in the cluster.
1. Select the Offline Profile Creation check box. Click Next.
1. In the HSM Device list, select the manufacturer of the HSM device where the credential is stored.
1. In the Slot Type list, select Slot Id, Slot Index, or Token Name and specify a value in the Slot Info box. AEM forms uses these settings to determine where the credentials are stored on the HSM.

    * **Token Name:** Corresponds to a partition name (for example, HSMPART1).
    * **Slot Id:** The Slot ID is an integer that corresponds to the slot, which in turn corresponds to a partition. For example, the client (Forms Server) registered with the HSMPART1 partition first. This maps slot 1 to the HSMPART1 partition, for this client. Because HSMPART1 is the first partition registered, the Slot ID is 1 and you would set Slot Info to 1.

      The slot ID is set on a client-by-client basis. If you registered a second machine to a different partition (for example, HSMPART2 on the same HSM device), then slot 1 would be associated with the HSMPART2 partition for that client.

    * **Slot Index:** If you select Slot Index, set the Slot Info to an integer that corresponds to the slot. This is a 0-based index, which means that if the client is registered with the HSMPART1 partition first, slot 1 is mapped to the HSMPART1 for this client. Because HSMPART1 is the first partition registered, the Slot Index is 0.

1. Select one of these options and provide the path:

    * **Certificate**: (Not required if using SHA1) Click Browse and locate the path to the public key for the credential you are using.
    * **Certificate SHA1:** (Not required if using a physical certificate) Type SHA1 value (thumbprint) of the public key (.cer) file for the credential you are using. Ensure that there are no spaces used in the SHA1 value.

1. In the Password box, type the password required to access the HSM key for the given slot information, and then click Save.

## View HSM credential alias properties {#view-hsm-credential-alias-properties}

1. In administration console, click Settings &gt;Trust Store Management &gt; HSM Credentials.
1. Click the alias name of the credential alias to view the properties and then click OK.

## Check the status of an HSM credential {#check-the-status-of-an-hsm-credential}

1. In administration console, click Settings &gt;Trust Store Management &gt; HSM Credentials.
1. Click the check box next to credential that you want to check and click Check Status.

The Status column reflects the current status of the credential. If there is failure, a red X is displayed in the Status column. Hover your mouse over the X to display a tool tip containing the reason for the failure.

## Update HSM credential alias properties {#update-hsm-credential-alias-properties}

1. In administration console, click Settings &gt;Trust Store Management &gt; HSM Credentials.
1. Click the alias name of the credential alias.
1. Click Update Credential and update the settings as required.

## Reset all HSM Connections {#reset-all-hsm-connections}

Reset the open connections to an HSM device after any disruption to the network session between the Forms Server and the HSM device. For example, disruptions can happen due to a network outage or the HSM device being taken offline for a software update. After a disruption, the existing connections are stale and any signing requests against those connections fail. Using the Reset All HSM Connections option clears the old connections.

1. In administration console, click Settings &gt;Trust Store Management &gt; HSM Credentials.
1. Click Reset All HSM Connections.

## Delete an HSM credential alias {#delete-an-hsm-credential-alias}

1. In administration console, click Settings &gt;Trust Store Management &gt; HSM Credentials.
1. Select the check boxes for the HSM credentials you want to delete, click Delete, and then click OK.

## Configure remote HSM support {#configure-remote-hsm-support}

AEM forms uses a Web Services-based IPC/RPC mechanism. This mechanism enables AEM forms to use an HSM installed on a remote computer. To use this functionality, install the web service on the remote computer where the HSM is installed. See [Configuring HSM support for AEM forms ES using Sun JDK on Windows 64-bit platform](https://kb2.adobe.com/cps/808/cpsid_80835.html)for more information.

This mechanism does not support online creation of HSM profiles or status checks. However, there are two ways to create HSM profiles and perform status checks:

* Create an AEM forms client credential by passing it the Signer's Certificate. Follow the steps in [Configuring HSM support for AEM forms ES using Sun JDK on Windows 64-bit platform](https://kb2.adobe.com/cps/808/cpsid_80835.html). The web service location is passed in as a Credential property. Offline HSM profiles create using either certificate der or certificate SHA-1 hex is also supported. However, if you have upgraded to AEM forms from an earlier version of AEM forms, make client changes because the credential carried certificate and web service information.
* Web Service location is specified in the administration console for the Signature service. (See [Signature service settings](/help/forms/using/admin-help/configure-service-settings.md#signature-service-settings).) Here, the client only carried the alias of the HSM profile in the trust store. You can use this option seamlessly without any client changes, even if you have upgraded to AEM forms from an earlier version of AEM forms. This option does not support HSM profiles using certificate SHA-1.
