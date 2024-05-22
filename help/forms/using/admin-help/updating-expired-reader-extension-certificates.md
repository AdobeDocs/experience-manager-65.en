---
title: Expiration of Reader Extensions certificates and its impact 
description: Expiration of Reader Extensions certificates and its impact 
exl-id: 4e14e0dc-f248-4f6e-a075-6012b6792d9d
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---

# Expiration of Reader Extensions certificates and its impact {#expiration-of-reader-extensions-certificates-and-its-impact}

Adobe Experience Manager Forms (AEM Forms) customers with Adobe Managed Services or On-premise Enterprise Base licenses are entitled to use Acrobat Reader DC Extensions service. The service enables an organization to easily share interactive PDF documents by extending the functionality of Acrobat Reader with additional usage rights. The service adds usage rights to a PDF document and activates features that are not available when a PDF document is opened using Adobe Acrobat Reader, such as adding comments to a document, filling forms, and saving the document. Third-party users do not require additional software or plug-ins to work with rights-enabled documents. PDF documents that have usage rights added are called rights-enabled documents. A user who opens a rights-enabled PDF document in Acrobat Reader can perform the operations that are enabled for that document.

Adobe uses a public key infrastructure (PKI) to issue digital certificates for use in licensing and feature enablement. Adobe has been issuing certificates under the certificate authority **Adobe Root CA**, which is set to expire on January 7, 2023. The expiration of certificate does not impact PDF documents extended using production certificates issued from the **Adobe Root CA** based certificates (old certificates). All PDF documents, Reader extended using the old certificates before January 7, 2023, including the ones downloaded by your customers, would continue to work with all the usage rights that are applied to them, and do not require any updates.

A new certificate authority, **Adobe Root CA G2**, and certificates based on the new certificate authority are now available. On or before January 7, 2023, start using the new certificates —  those based on **Adobe Root CA G2** — to Reader extend your new PDF documents.  You can [obtain new certificates from the Adobe Licensing Website](https://licensing.adobe.com/) or Adobe Support.  

## Frequently Asked Questions

**Q. What is the difference between an Adobe Root certificate and an Acrobat Reader Extensions certificate? Is the Adobe Root certificate dependent on an Acrobat Reader Extensions certificate? Are both of these certificates expiring in January 2023?**

A. Adobe Root CA is the certificate authority from which an Acrobat Reader Extensions certificate is issued. On January 7, 2023, "Adobe Root CA" and all the certificates issued from it are expiring.

**Q. There was a previous communication from Adobe regarding the expiration of certificates and the impact on using/opening PDF documents. Should that communication be ignored?**

A. Based on the reassessment of the situation, all PDF documents extended using production certificates issued from the old "Adobe Root CA" before January 7, 2023 continue to work without any change after January 7, 2023. If you have already updated your PDF documents, there is no change in the experience.

**Q. Whom should I contact if I have additional questions?** 

A. You can contact [Adobe Support](https://experienceleague.adobe.com/?support-solution=Experience+Manager#support) or raise a support ticket. 

**Q. What happens if I do not update my certificate before January 7, 2023?** 

A. All PDF documents extended using production certificates issued from the old 'Adobe Root CA' before January 7, 2023 continue to work without any change after January 7, 2023. PDFs extended with evaluation certificates do not work after the expiration date.

**Q. Is the description of new certificates any different from old certificates?**

A. The description of the new Acrobat Reader Extensions certificates mentions **G3-P24** as the program name. In the description of older certificates (certificates based on "Adobe Root CA"), **P24** is mentioned as the program name.

**Q. How do I obtain the latest certificates?**

A. All the entitled Forms Customers (with active license) can download  the new certificates (certificates based on "Adobe Root CA G2") from the [Adobe Licensing Website](https://licensing.adobe.com/). If you are unable to find the certificate on Adobe Licensing Website, contact [Adobe Support](https://experienceleague.adobe.com/?support-solution=Experience+Manager&lang=en#support) or raise a support ticket.

**Q. Do my PDF documents extended using certificates issued from "Adobe Root CA" (the old certificate authority) continue to work after January 7, 2023?**

A. Yes, all PDF documents extended using production certificates issued from the "Adobe Root CA" (the old certificate authority) before January 7, 2023, continue to work without any change after January 7, 2023. PDF documents extended with evaluation certificates cease to work past the expiration date.

**Q. Which version of Adobe Acrobat Reader is required to continue using PDF documents extended with certificates issued from "Adobe Root CA" (the old certificate authority)?**

A. Adobe Acrobat Reader 2020 or later is required to use PDF documents extended with "Adobe Root CA" (the old certificate authority). It is the supported version of Acrobat Reader at the time of publishing this document. If you are using a [non-supported version of Adobe Acrobat](https://helpx.adobe.com/support/programs/eol-matrix.html), Adobe recommends that you [download and install the latest version of Adobe Acrobat Reader](https://get.adobe.com/reader/).

**Q. Which version of Adobe Acrobat Reader is required to continue using PDF documents extended with certificates issued from "Adobe Root CA 2" (the new certificate authority)?**

A. Adobe Acrobat Reader 2020 or later is required to use PDF documents extended with "Adobe Root CA 2" (the new certificate authority). If you are using a [non-supported version of Adobe Acrobat Reader](https://helpx.adobe.com/support/programs/eol-matrix.html), Adobe recommends that you [download and install the latest version of Adobe Acrobat Reader](https://get.adobe.com/reader/).

**Q. Can I delete an old Acrobat Reader Extensions certificate and add a new one on an Adobe Experience Manager Forms Server while continuing to use the existing alias?**

A. Yes, you can delete an old Acrobat Reader Extensions certificate and add a new one with the existing alias to an Adobe Experience Manager Forms Server.

**Q. Can I keep both new and old Acrobat Reader Extensions certificates on an Adobe Experience Manager Forms Server?**

A. Yes, you can keep both certificates but with different aliases on an Adobe Experience Manager Forms Server. Post January 7, 2023, you can use only the new certificate to Reader extend a PDF document.

**Q. Can I import the same Acrobat Reader Extensions certificate to all the Adobe Experience Manager Forms environments?**

A. Yes, the same Acrobat Reader Extensions certificate can be used across multiple environments.

**Q. How do I check the usage rights applied to a PDF document?**

A. You can use the [getDocumentUsageRights](https://experienceleague.adobe.com/docs/experience-manager-65/forms/developer-reference/programming-aem-forms-jee/java-api-quick-start-code-examples/acrobat-reader-dc-extensions-service.html?lang=en#quick-start-soap-mode-retrieving-credential-information-using-the-java-api) API to retrieve the information about the usage rights applied to a PDF document.

**Q. How do I change the password of an Acrobat Reader Extensions certificate file?**

A. On Microsoft Windows, to change the certificate Password, install the certificate using the Microsoft Management Console (MMC) and select **Mark the key as Exportable**. Once installed, export the certificate with a Private key, and use another password for the PFX file.


<!-- 
## Applying the certificates {#obtaning-and-applying-the-certificates} 

You can choose one of the following paths to apply latest certificates:

* [Updating certificates for an AEM Forms on JEE environment](#Updating-and-Applying-certificates-for-an-AEM-Forms-on-JEE-environment) 
* [Updating certificates for an AEM Forms on OSGi environment](#Updating-and-applying-certificates-for-an-AEM-Forms-on-OSGi-environment)

>[!NOTE]
>
>The document uses the term certificates and credentials interchangeably.

### Pre-requisites {#Pre-requisites}

Updating the certificates requires using actions available on AEM Forms administrator console and Reader Extension APIs provided by AEM Forms. The document is intended for users and administrators with knowledge of using Adobe Experience Manger Forms APIs. Before you start, ensure that: 

* the user has administrator rights on underlying AEM Forms environment. 
* the user has setup the [development environment](https://experienceleague.adobe.com/docs/experience-manager-65/developing/devtools/howto-projects-eclipse.html) and has access to it.
* [obtain the certificates](#obtain-the-certificates).


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

### Applying certificates for an AEM Forms on JEE environment {#Updating-and-Applying-certificates-for-an-AEM-Forms-on-JEE-environment} 

Applying new certificates on AEM Forms on JEE stack requires importing new credentials and applying usage rights. You can use admin console to import credentials and AEM Forms Reader Extension APIs to apply usage rights. 

#### Import and configure credentials 

You can use the Trust Store Management pages to import a new credential. The Trust Store may contain more than one Reader Extensions credential. Designate one of those credentials as the default Reader Extensions credential. The default credential is used when a Workbench user is unable to determine which credential to use during process creation. These rules apply to default credentials:

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

If the error message "Failed to import credential due to either incorrect file format, or incorrect password" appears, verify that the password is valid.

You can also import and delete credentials programmatically. (See [Programming with AEM forms](../../developing/credentials.md).)

<!-- ### Remove usage rights from existing rights-enabled PDF documents

Remove usage rights from existing rights-enabled PDF documents before applying usage rights with latest credentials. AEM Forms on JEE provides APIs to remove usage rights. For detailed instructions, see [Removing Usage Rights from PDF Documents](../../developing/assigning-usage-rights.md#removing-usage-rights-from-pdf-documents).

To remove usage rights for AEM Forms on JEE processes developed in Workbench, see [Workbench Help](https://helpx.adobe.com/content/dam/help/en/experience-manager/6-5/forms/pdf/WorkbenchHelp.pdf). 

#### Apply the usage rights to PDF documents 

After importing new credentials, you can apply usage rights to PDF documents using the Acrobat Reader DC extensions Java Client API and web service.  For details, see [Applying Usage Rights to PDF Documents](../../developing/assigning-usage-rights.md#applying-usage-rights-to-pdf-documents). 


### Applying certificates for an AEM Forms on OSGi environment {#Updating-and-applying-certificates-for-an-AEM-Forms-on-OSGi-environment}

Applying new certificates on AEM Forms on OSGi stack requires importing new credentials and applying usage rights. You can use admin console to import credentials and AEM Forms Reader Extension APIs to apply usage rights. 

#### Import credentials {#Import-credentials}

In an AEM Forms on OSGi environment, a Reader Extension credential is associated with fd-service user. Before adding credentials for fd-user key store, perform the following steps to create a key store: 

1. Log in to your AEM Author instance as an Administrator.
1. Go to **[!UICONTROL Tools]**> **[!UICONTROL Security]**>**[!UICONTROL Users]**.
1. Scroll down the list of users until you find fd-service user account.
1. Click **[!UICONTROL fd-service]** user.
1. Click keystore tab.
1. Click **[!UICONTROL Create KeyStore]**.
1. Set the KeyStore Access Password and save your settings to create the KeyStore password.

After creating the key-store, add credentials to fd-service user. The following video explains the steps: 

>[!VIDEO](https://images-tv.adobe.com/mpcv3/5577/8db8e554-f04b-4fae-8108-b9b5e0eb03ad_1627925794.854x480at800_h264.mp4)

The following command list the details of the pfx file. Before running the command, navigate to the directory that contains the .pfx file.

`keytool -v -list -storetype pkcs12 -keystore [name of your .pfx file]`

For example, keytool -v -list -storetype pkcs12 -keystore 1005566.pfx where 1005566.pfx is the name of my pfx file

<!-- ### Remove usage rights from existing rights-enabled PDF documents

Remove usage rights from existing rights-enabled PDF documents before applying usage rights with latest credentials. You can remove the usage rights for a document by invoking the removeUsageRights API from within the docAssuranceServiceAPI. For detailed information, see [Remove Usage Rights](/help/forms/using/aem-document-services-programmatically.md#removing-usage-rights) document.

#### Apply the usage rights to PDF documents 

To apply usage rights in an AEM Forms on OSGi environment, Create custom OSGi service to usage rights to the documents. You can also create a servlet with a POST method to return the reader extended PDF to the user. For detailed instructions, see [Applying Reader Extensions](https://experienceleague.adobe.com/docs/experience-manager-learn/forms/document-services/apply-reader-extension-rights-to-pdf.html).  -->
