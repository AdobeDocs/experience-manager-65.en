---
title: Updating expired Reader Extension service certificates
description: Reader extended documents not working, update certificates 
---

# Updating expired Reader Extension service certificates {#Updating-expired-Reader-Extension-service-certificates}

Adobe Experience Manager Forms (AEM Forms) customers with Adobe Managed Services or On-premise Enterprise Base licenses are entitled to use Reader Extension service. The service enables an organization to easily share interactive PDF documents by extending the functionality of Adobe Reader with additional usage rights. The service adds usage rights to a PDF document and activates features that are not usually available when a PDF document is opened using Adobe Acrobat Reader DC, such as adding comments to a document, filling forms, and saving the document. Third-party users do not require additional software or plug-ins to work with rights-enabled documents. PDF documents that have usage rights added are called rights-enabled documents. A user who opens a rights-enabled PDF document in Adobe Reader can perform the operations that are enabled for that document.

Adobe leverages a PKI (public key infrastructure) to issue digital certificates for use in licensing and feature enablement. Adobe has been issuing certificates under the certificate authority “Adobe Root CA”, it is scheduled to expire on Jan 7, 2023. It will lead to expiration of all certificates issued under this certificate authority. Once the certificate expires, all features dependent on the certificates no longer work. For example, a reader-extended PDF document that allows adding comments using Adobe Acrobat Reader stops working for customers after Jan 7, 2023. To resolve the issue, administrator of Reader Extension service, using old certificates, should obtain and reapply new certificates issued by new Adobe Root CA G2 to their PDF documents (reader extend the PDF documents with new certificates).  

The expiration of certificates impacts both AEM Forms on JEE and AEM Forms on OSGi stacks. Both the stacks have a different set of instructions. Depending on your stack, choose one of the following paths: 

* Updating certificates for an AEM Forms on JEE environment 
* Updating certificates for an AEM Forms on OSGi environment

>[!NOTE]
>
>The document uses term certificates and credentials interchangeably. 

## Pre-requisites {#Pre-requisites}

Updating the certificates requires using actions available on AEM Forms administrator console and Reader Extension APIs provided by AEM Forms. The document is intended for users and administrators with knowledge of using Adobe Experience Manger Forms APIs. Before you start, ensure that: 

* the user has administrator rights on underlying AEM Forms environment. 
* the user has setup the [development environment](https://experienceleague.adobe.com/docs/experience-manager-65/developing/devtools/howto-projects-eclipse.html) and has access to it.
* obtain the certificates.

### Obtain the certificates {#obtain-the-certificates}

The Rights credential is delivered as a digital certificate that contains the public key, the private key, and the password used to access the credential.

If your organization purchases a production version of Reader Extensions, the production Rights credential is delivered by Adobe Licensing Website (LWS). A production Rights credential is unique to your organization and can enable the specific usage rights that you require.

If you obtained Reader Extensions through a partner or software provider who integrated Reader Extensions into their software, the Rights credential is provided to you by that partner who, in turn, receives this credential from Adobe.

>[!NOTE]
>
>The Rights credential cannot be used for typical document signing or assertion of identity. For these applications, you can use a self-sign certificate or acquire an identity certificate from a Certificate Authority (CA).

The following types of Rights credentials are available:

**Customer Evaluation**: A credential with a short validity period that is provided to customers who want to evaluate Reader Extensions. Usage rights applied to documents using this credential expire when the credential expires. This type of credential is valid only for two to three months.

**Production**: A credential with a long validity period that is provided to customers who purchased the full product. Production credentials are unique to each customer but can be installed on multiple systems.

If you have already used certificates to reader extend PDF files, download a production certificate from [Adobe Licensing Website (LWS)](https://licensing.adobe.com/).

## Updating and Applying certificates for an AEM Forms on JEE environment {#Updating-and-Applying-certificates-for-an-AEM-Forms-on-JEE-environment} 

Updating and applying new certificates on AEM Forms on JEE stack requires importing new credentials, removing usage rights from existing PDF documents, and applying usage rights. You can use admin console to import credentials and AEM Forms Reader Extension APIs to remove and apply usage rights. 

### Import and configure credentials 

You can use the Trust Store Management pages to import a new or replacement credential. The Trust Store may contain more than one Reader Extensions credential. You must designate one of those credentials as the default Reader Extensions credential. The default credential is used when a Workbench user is unable to determine which credential to use during process creation. These rules apply to default credentials:

* If you import a Reader Extensions credential and the Trust Store contains no other Reader Extensions credentials, it is set as the default.
* If you import a Reader Extensions credential with the Default option selected, the default type is removed from an existing default credential. The imported credential becomes the default.
* You cannot delete a default Reader Extensions credential. To delete the default credential, first set another credential as the default. An exception to this rule is that if there is only one credential, you can delete it even though it is the default.
* You cannot update a default Reader Extensions credential.

To import the credentials: 

1. In administration console, click Settings > Trust Store Management > Local Credentials.
1. Click Import and, under Trust Store Type, select Acrobat Reader DC extensions Credential.
1. (Optional) To indicate that this credential is the default credential to use with Acrobat Reader DC extensions, select Default.
1. In the Alias box, type an identifier for the credential. This identifier is used as the display name for the credential in Acrobat Reader DC extensions. This alias is also used to access the credential programmatically using the AEM forms SDK.
1. Click Choose File to locate the credential, type the password of the credential, and then click OK.

If the error message “Failed to import credential due to either incorrect file format, or incorrect password” appears, verify that the password is valid.

You can also import and delete credentials programmatically. (See [Programming with AEM forms](../../developing/credentials.md).)

### Remove usage rights from existing rights-enabled PDF documents

Remove usage rights from existing rights-enabled PDF documents before applying usage rights with latest credentials. AEM Forms on JEE provides APIs to remove usage rights. For detailed instructions, see [Removing Usage Rights from PDF Documents](../../developing/assigning-usage-rights.md#removing-usage-rights-from-pdf-documents).

To remove usage rights for AEM Forms on JEE processes developed in Workbench, see [Workbench Help](https://helpx.adobe.com/content/dam/help/en/experience-manager/6-5/forms/pdf/WorkbenchHelp.pdf).

### Apply the usage rights to PDF documents 

After importing new credentials and removing usage rights from existing rights-enabled PDF documents, apply usage rights to PDF documents using the new credentials. You can apply usage rights to PDF documents using the Acrobat Reader DC extensions Java Client API and web service.  For details, see [Applying Usage Rights to PDF Documents](../../developing/assigning-usage-rights.md#applying-usage-rights-to-pdf-documents). 


## Updating and Applying certificates for an AEM Forms on OSGi environment {#Updating-and-applying-certificates-for-an-AEM-Forms-on-OSGi-environment}

Updating and applying new certificates on AEM Forms on OSGi stack requires importing new credentials, removing usage rights from existing PDF documents, and applying usage rights. You can use admin console to import credentials and AEM Forms Reader Extension APIs to remove and apply usage rights. 

### Import credentials {#Import-credentials}

In an AEM Forms on OSGi environment, a Reader Extension credential is associated with fd-service user. Before adding credentials for fd-user key store, perform the following steps to create a key-store: 

1. Login to your AEM Author instance as an Administrator.
1. Go to Tools> Security>Users.
1. Scroll down the list of users till you find fd-service user account.
1. Click on the fd-service user.
1. Click on the keystore tab.
1. Click on Create KeyStore.
1. Set the KeyStore Access Password and save your settings to create the KeyStore password.

After creating the key-store, add credentials to fd-service user.

>[!VIDEO](https://images-tv.adobe.com/mpcv3/5577/8db8e554-f04b-4fae-8108-b9b5e0eb03ad_1627925794.854x480at800_h264.mp4)

The following command list the details of the pfx file. Before running the command, navigate to the durectory that contains the .pfx file.

`keytool -v -list -storetype pkcs12 -keystore <name of your .pfx file>`

For example keytool -v -list -storetype pkcs12 -keystore 1005566.pfx where 1005566.pfx is the name of my pfx file

### Remove usage rights from existing rights-enabled PDF documents

Remove usage rights from existing rights-enabled PDF documents before applying usage rights with latest credentials. You can remove the usage rights for a document by invoking the removeUsageRights API from within the docAssuranceServiceAPI. For detailed information, see [Remove Usage Rights](/help/forms/using/aem-document-services-programmatically.md#removing-usage-rights) document.

### Apply the usage rights to PDF documents 

To apply usage rights in an AEM Forms on OSGi environment, Create custom OSGi service to usage rights to the documents. You can also create a servlet with a POST method to return the reader extended PDF to the user. For detailed instructions, see [Applying Reader Extensions](https://experienceleague.adobe.com/docs/experience-manager-learn/forms/document-services/apply-reader-extension-rights-to-pdf.html). 

## Frequenty Asked Questions

**Who should I contact if I have additional questions?** 

You can contact [Adobe Support](https://experienceleague.adobe.com/?support-solution=Experience+Manager#support) or raise a support ticket. 

**What happens if I don’t update my certificate before January 7th, 2023?** 

On attempting to open a PDF documents Reader Extended with old certificates, users experience  an error message and can no longer access the reader-extended features. An example error is. 

`The document has been changed since it was created and use of extended features in no longer available. Please contact the author for the orignal version of this document.`

**Is there any change in the name of new description?**

New Reader Extension certificates mention G3-P24 as program name in the description. In the older certificates, program name P24 was mentioned in the description. 