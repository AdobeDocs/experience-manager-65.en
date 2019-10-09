---
title: Configuring credentials for use with Acrobat Reader DC extensions
seo-title: Configuring credentials for use with Acrobat Reader DC extensions
description: Learn how to configure credentials for use with Acrobat Reader DC extensions.
seo-description: Learn how to configure credentials for use with Acrobat Reader DC extensions.
uuid: 9210e6c9-6f5c-402d-b355-b104cdffd5eb
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_acrobat_reader_dc_extensions
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 5bb32fb1-4b6e-412f-aa16-f60db9dcaba1
---

# Configuring credentials for use with Acrobat Reader DC extensions{#configuring-credentials-for-use-with-acrobat-reader-dc-extensions}

To apply usage rights to PDF documents, configure AEM forms with a valid credential for Acrobat Reader DC extensions. A credential may have been configured during the installation of AEM forms. If you did not configure your Acrobat Reader DC extensions credential while running Configuration Manager or if you need to import a new or replacement credential, you can do so using the Trust Store Management pages.

If you are using an evaluation credential, replace it with a production credential when moving to your production environment. To update an expired or evaluations credential, first delete the old Acrobat Reader DC extensions credential.

For information about obtaining a credential, see [Preparing to Install AEM forms (Single Server)](https://www.adobe.com/go/learn_aemforms_prepareInstallsingle_63).

The Trust Store may contain more than one Acrobat Reader DC extensions credential. You must designate one of those credentials as the default Reader Extensions credential. The default credential is used when a Workbench user is unable to determine which credential to use during process creation. These rules apply to default credentials:

* If you import a Acrobat Reader DC extensions credential and the Trust Store contains no other Acrobat Reader DC extensions credentials, it is set as the default.
* If you import a Acrobat Reader DC extensions credential with the Default option selected, the default type is removed from an existing default credential. The imported credential becomes the default.
* You cannot delete a default Acrobat Reader DC extensions credential. To delete the default credential, first set another credential as the default. An exception to this rule is that if there is only one credential, you can delete it even though it is the default.
* You cannot update a default Acrobat Reader DC extensions credential.

>[!NOTE]
>
>You can also import and delete credentials programmatically. (See [Programming with AEM forms](https://www.adobe.com/go/learn_aemforms_programming_63).)

## Import a Acrobat Reader DC extensions credential {#import-a-acrobat-reader-dc-extensions-credential}

1. In administration console, click Settings &gt; Trust Store Management &gt; Local Credentials.
1. Click Import and, under Trust Store Type, select Acrobat Reader DC extensions Credential. 
1. (Optional) To indicate that this credential is the default credential to use with Acrobat Reader DC extensions, select Default.
1. In the Alias box, type an identifier for the credential. This identifier is used as the display name for the credential in Acrobat Reader DC extensions. This alias is also used to access the credential programmatically using the AEM forms SDK.

   >[!NOTE]
   >
   >The alias name is automatically converted to uppercase for display purposes. The alias name is not case-sensitive when you refer to it in a process.

1. Click Choose File to locate the credential, type the password of the credential, and then click OK.

   If the error message "Failed to import credential due to either incorrect file format, or incorrect password" appears, verify that the password is valid.

## Remove a Acrobat Reader DC extensions credential {#remove-a-acrobat-reader-dc-extensions-credential}

1. In administration console, click Settings &gt; Trust Store Management &gt; Local Credentials.
1. Select the credential and click Delete.

## Replace a Acrobat Reader DC extensions credential {#replace-a-acrobat-reader-dc-extensions-credential}

1. In administration console, click Settings &gt; Trust Store Management &gt; Local Credentials.
1. Make note of the existing credential’s alias and then select it and click Delete.
1. Import the new credential using the exact same alias name.

