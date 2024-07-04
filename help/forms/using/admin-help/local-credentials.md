---
title: Managing local credentials
description: Learn how to manage local credentials using the Trust Store Management. AEM forms support RSA and DSA credentials in standard PKCS12 form.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_certificates_and_credentials
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: c5905272-7d09-47e4-8b35-4cc25a148477
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Security
role: User, Developer
---
# Managing local credentials {#managing-local-credentials}

Local credentials are private key credentials hosted in Trust Store Management. A *local credential* identifies where a user's DES credential is stored. Using Trust Store Management, you can import and manage your local credentials by using, for example, existing PFX files so that you can import, edit, and delete local credentials.

AEM forms support RSA and DSA credentials up to 4096 bits in standard PKCS12 format (.pfx and .p12 files).

You can import and export any number of credentials. If you want to replace an expired credential using the same alias, delete the credential, and then import the new credential with the same alias.

For information and instructions related to Acrobat Reader DC Extensions, see [Configuring credentials for use with Acrobat Reader DC Extensions](/help/forms/using/admin-help/configuring-credentials-acrobat-reader-dc.md#configuring-credentials-for-use-with-acrobat-reader-dc-extensions).

## Import a credential {#import-a-credential}

1. In the administration console, click Settings &gt;Trust Store Management &gt; Local Credentials.
1. Click Import. Under Trust Store Type, select one of these options:

    * **Document Signing Credential:** A credential used to issue a digital signature on a document.
    * **Acrobat Reader DC Extensions Credential:** A digital certificate specific to Acrobat Reader DC Extensions that enables Adobe Reader usage rights to be activated in the PDF documents produced.
    * **Default:** Indicates that this is the default credential to use with Acrobat Reader DC Extensions.

   For information about obtaining a credential, see [Preparing to Install AEM forms](https://helpx.adobe.com/pdf/aem-forms/6-3/prepare-install-single-server.pdf).

1. In the Alias box, type an identifier for the credential. This identifier is used as the display name for the credential in Acrobat Reader DC Extensions and the Signature service. This alias is also used to access the credential programmatically using the AEM forms SDK.

   >[!NOTE]
   >
   >The alias name is automatically converted to uppercase for display purposes. The alias name is not case-sensitive when you refer to it in a process.

1. Click Browse to locate the credential, type the password of the credential, and then click OK.

   If the error message "Failed to import credential due to either incorrect file format, or incorrect password" appears, verify that the password is valid.

## Export a credential {#export-a-credential}

Credentials are exported as P12 files in PKCS#12 format.

1. In the administration console, click Settings &gt;Trust Store Management &gt; Local Credentials.
1. Click the alias name of the credential that you want to export and then click Export.
1. In the Password box, type the password. This password is new and is used to encrypt the exported credential.
1. Click Export, follow the directions so you can export the credential, and then click OK.

## Edit a credential's alias or trust store type {#edit-a-credential-s-alias-or-trust-store-type}

After a credential is imported, you can edit its alias name and trust store type.

1. In the administration console, click Settings &gt;Trust Store Management &gt; Local Credentials.
1. Click the alias name of the credential that you want to edit.
1. Click Update Credential.
1. Edit the alias name and trust store type as required and click OK.

## Delete a credential {#delete-a-credential}

1. In the administration console, click Settings &gt;Trust Store Management &gt; Local Credentials.
1. Select the check boxes for the credentials to delete.
1. Click Delete and then click OK.
