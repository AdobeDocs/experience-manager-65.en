---
title: Managing certificates
description: Learn how to import and export a certificate and edit its trust settings.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_certificates_and_credentials
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 1fe0e7b4-6109-4f7a-8858-8237a1c5c93b
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Security
role: User, Developer
---
# Managing certificates {#managing-certificates}

Using the Trust Store Management, you can import, edit, and delete certificates that you trust on the server for validation of digital signatures and certificate authentication. You can import and export any number of certificates. After a certificate is imported, you can edit the trust settings and trust store type. Consider the following options when combining trust store types:

* **Trust for Certificate Authentication with CA:** For CRL validation, also select Trust for Identity.
* **Trust for Certificate Authentication with ICA:** Select only Trust for Identity. An ICA should not be trusted for Certificate Authentication. If you trust the ICA for Certificate Authentication, the ICA becomes a CA for path building. If the ICA is trusted for both Certificate Authentication and Identity, the CA vendor certificate is ignored because the ICA becomes the CA.
* **Trust for OCSP Server with HTTPs:** If the OSCP respondent server resides at an HTTPs location, you must also select Trust for SSL Connections. If the OSCP respondent requires CRL validation, ensure that you also select Trust for Identity.
* **Adobe Root:** Do not select SSL Connections or OCSP Server Trust Store Types. Adobe Root is not trusted for SSL Connections and OCSP Server. Adobe does not issue OCSP and SSL certificates. Adobe Root is implicitly trusted with an alias name="ADOBEROOT".

Only X509v3 certificates are supported. This certificate type can be supplied in a binary DER-encoded file (.cer file) or a text file that contains a Base64-encoded version of the same DER-encoded certificate (including X509 certificates in Privacy Enhanced Mail (PEM) format).

Certificates required to complete a signature verification must be in the same store (HSM or database).

You can also import and delete certificates using the Trust Manager API. For details, see "Importing certificates using the Trust Manager API" and "Deleting certificates using the Trust Manager API" in [Programming with AEM forms](https://www.adobe.com/go/learn_aemforms_programming_63).

## Import a certificate {#import-a-certificate}

1. In administration console, click **[!UICONTROL Settings > Trust Store Management > Certificates]**.
1. Click Import and, under Trust Store Type, select one of these options:

    * **Trust for SSL Connections:** Specifies that AEM forms can use certificates to connect to external systems over SSL.
    * **Trust for Certify Signature:** Specifies that certificates are trusted in document signing operations for certifying author digital signatures.
    * **Trust for Signature:** Specifies that certificates are trusted in document signing operations for non-author digital signatures.
    * **Trust for Certificate Authentication:** Specifies AEM forms uses certificates for authenticating users using certificate or smart card authentication.
    * **Trust for OCSP Server:** Specifies that AEM forms can use certificates to connect to external OCSP responders
    * **Trust for Identity:** Specifies that certificates can be used to trust information other than types specified above.

   >[!NOTE]
   >
   >The trust store implicitly trusts an Adobe Root Certificate for certificate authentication, signature, certify signature, and identity.

1. In the Alias box, type the identifier for the certificate.
1. Click **[!UICONTROL Browse]** to locate the certificate and then click **[!UICONTROL OK]**.

## Export a certificate {#export-a-certificate}

1. In administration console, click **[!UICONTROL Settings > Trust Store Management > Certificates]**.
1. Click the alias name of the certificate to export. The **[!UICONTROL Certificate Details]** page is displayed.
1. Click **[!UICONTROL Export]**, follow the directions to export the certificate, and then click **[!UICONTROL OK]**.

## Edit a certificate’s trust settings and trust store type {#edit-a-certificate-s-trust-settings-and-trust-store-type}

1. In administration console, click **[!UICONTROL Settings > Trust Store Management > Certificates]**.
1. Click the alias name of the certificate to edit.
1. Click **[!UICONTROL Update Certificate]**.
1. To change the Alias name of the certificate, type a new name in the Alias box.
1. To update the trust store type for the certificate, select the appropriate trust store type.
1. To update the policy restrictions, in the Certificate Policies box, type the policy information, and then click **[!UICONTROL OK]**.

## Delete a certificate {#delete-a-certificate}

1. In administration console, click **[!UICONTROL Settings > Trust Store Management > Certificates]**.
1. Select the check boxes for the certificates to delete, click **[!UICONTROL Delete]**, and then click **[!UICONTROL OK]**.
