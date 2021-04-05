---
title: Basics of managing certificates and credentials
seo-title: Basics of managing certificates and credentials
description: Learn about the basics of managing certificates and credentials.
seo-description: Learn about the basics of managing certificates and credentials.
uuid: f421e206-e7b5-416c-b9fb-974094f10a66
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_certificates_and_credentials
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: 986d16fc-4c81-4785-b1f3-fe8bd7ff669e
exl-id: 74bf0e77-f47b-475a-b2a7-52cfb3baaa22
---
# Basics of managing certificates and credentials {#basics-of-managing-certificates-and-credentials}

A *credential* contains your private key information needed for signing or identifying documents. A *certificate* is public key information that you configure for trust. AEM forms uses certificates and credentials for several purposes:

* Acrobat Reader DC extensions uses a credential to enable Adobe Reader usage rights in PDF documents. (See [Configuring credentials for use with Acrobat Reader DC extensions](/help/forms/using/admin-help/configuring-credentials-acrobat-reader-dc.md#configuring-credentials-for-use-with-acrobat-reader-dc-extensions).)
* You can configure Rights Management to display credentials for use in Acrobat only from trusted issuers. (See [Configure Rights Management display settings](/help/forms/using/admin-help/configuring-client-server-options.md#configure-document-security-display-settings).) The Common Name (CN) must be present in the certificate.
* The Signature service accesses certificates and credentials. For details on the Signature service, see [Services Reference](https://www.adobe.com/go/learn_aemforms_services_63).

**Generating a pair key**

AEM forms uses its Trust Store to store and manage certificates, credentials, and certificate revocation lists (CRLs). Additionally, you can use an independent Hardware Security Module (HSM) device to store private keys.

AEM forms does not provide any option to generate a key pair. However, you can generate it using tools, such as Java keytool, and import it in AEM forms Trust Store. For more information on Java keytool, see the following:

[https://docs.oracle.com/javase/tutorial/security/toolsign/step3.html](https://docs.oracle.com/javase/tutorial/security/toolsign/step3.html)

[https://docs.oracle.com/cd/E19798-01/821-1841/gjrgy/index.html](https://docs.oracle.com/cd/E19798-01/821-1841/gjrgy/index.html)

[https://blogs.adobe.com/livecycle/2010/01/creating_ssl_keys_and_certific.html](https://blogs.adobe.com/livecycle/2010/01/creating_ssl_keys_and_certific.html)

The following signature types are supported and can be imported in AEM forms:

* XML signature
* XMLTimeStampToken
* RFC 3161 TimeStampToken
* PKCS#7
* PKCS#1
* DSA Signatures

**Handling lost or compromised key**

If you suspect that your key is lost or has been compromised, take the following actions:

1. Inform the certifying authority, so that they add the compromised key on the certificate revocation list to revoke the key.
1. Obtain a new key and its certificates from the certifying authority.
1. Sign the documents that were signed using the compromised key again using the new key.
