---
title: Review credential use information
description: Learn how to review the credential use information. The credential use information which describes its use, is accessible through the Acrobat Reader extension. 
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_acrobat_reader_dc_extensions
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: a8e16cf8-f3c8-48ce-87da-2f0de0b10a6e
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Review credential use information {#review-credential-use-information}

The credential contains information describing its intended use that is accessible through the Acrobat Reader DC extensions end-user web application. You can use this information to determine the type of credential installed (either evaluation or production) and its validity dates.

1. Open a web browser and enter this URL:

   http://localhost:port/ReaderExtensions (where *port* is your application server’s port number)

1. Log in using the default user name and password:

   User name: administrator

   Password: password

   >[!NOTE]
   >
   >You must have administrator or super user privileges to log in using the default user name and password. To allow other users to access Acrobat Reader DC extensions, create the user accounts in User Management and grant the users the Acrobat Reader DC extensions Web Application role.

1. Select the credential alias from the Select Credential list and review the information included in the Expiration Date and Intended Use Notice.

>[!NOTE]
>
>The credential’s expiration date is also available on the Settings &gt; Trust Store Management &gt; Local Credentials page of administration console, under Expiration Date.
