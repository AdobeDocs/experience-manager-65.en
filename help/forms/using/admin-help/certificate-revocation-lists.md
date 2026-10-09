---
title: Managing certificate revocation lists
description: Learn how to manage certificate revocation lists. You can import, edit, and delete certificate revocation lists (CRLs) using Trust Store Management.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/managing_certificates_and_credentials
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 01e966f6-a650-4565-80d1-e2297f25da5c
solution: Experience Manager, Experience Manager Forms
role: User, Developer
feature: Adaptive Forms
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
# Managing certificate revocation lists{#managing-certificate-revocationlists}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

Using Trust Store Management, you can import, edit, and delete certificate revocation lists (CRLs). Base64 and DER-encoded certificate revocation lists are supported.

## Import a CRL {#import-a-crl}

1. In the administration console, click Settings &gt;Trust Store Management &gt; Certificate Revocation Lists, and then click Import.
1. In the Alias box, type an identifier for the CRL.
1. Click Browse to locate the CRL and then click OK.

## Export a CRL {#export-a-crl}

1. In the administration console, click Settings &gt;Trust Store Management &gt; Certificate Revocation Lists.
1. Click the alias name of the CRL so you can export, and then click Export.
1. Follow the directions so you can export the CRL. CRLs are exported in Base64 encoding.
1. Click OK.

## Delete a CRL {#delete-a-crl}

1. In the administration console, click Settings &gt;Trust Store Management &gt; Certificate Revocation Lists.
1. Select the check boxes for the CRLs to delete, click Delete, and then click OK.
