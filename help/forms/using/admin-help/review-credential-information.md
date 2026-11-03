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
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
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
