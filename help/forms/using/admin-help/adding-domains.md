---
title: Adding domains
description: Learn how to add an enterprise, local, or hybrid domain using Domain Management settings and general considerations for domain names and IDs.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/setting_up_and_managing_domains
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: c708936d-7aa7-4b92-be2d-d97008f187d2
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Adding domains {#adding-domains}

## Prerequisite

* Ensure that the user has admin privileges to access the administrator console.

## Add an enterprise domain {#add-an-enterprise-domain}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click New Enterprise Domain.
1. In the ID box, type a unique identifier for the domain and in the Name box, type a descriptive name for the domain. (See [Important considerations for domain names and IDs](adding-domains.md#important-considerations-for-domain-names-and-ids).)
1. Specify whether to enable account locking. (See [Configure account-locking settings](/help/forms/using/admin-help/configure-account-locking-settings.md#configure-account-locking-settings).) By default, Enable Account Locking is selected.
1. Click Add Authentication and, in the Authentication Provider list, select a provider, depending on the authentication mechanism your organization uses. Possible values are LDAP, Kerberos, SAML, or a custom authentication provider.

   If you select LDAP, you can use the LDAP server specified in your directory configuration, or you can choose different LDAP server to use for authentication. If you choose a different server, your users must exist on both LDAP servers.

1. Provide any additional information required on the page. (See [Authentication settings](/help/forms/using/admin-help/configuring-authentication-providers.md#authentication-settings).)
1. Add a directory or a custom Service Provider Interface (SPI). (See [Adding directories or custom SPIs](/help/forms/using/admin-help/configuring-directories.md#adding-directories-or-custom-spis).)
1. Click Finish and then click OK.

After creating an enterprise domain, manually synchronize the directory or create a trigger to perform a synchronization before User Management can use it. You can then set up a directory synchronization schedule and perform manual synchronization as required. (See [Synchronizing directories](/help/forms/using/admin-help/synchronizing-directories.md#synchronizing-directories).)

## Add a local domain {#add-a-local-domain}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click New Local Domain.
1. In the ID box, type a unique identifier for the domain and, in the Name box, type a descriptive name for the domain. (See [Important considerations for domain names and IDs](adding-domains.md#important-considerations-for-domain-names-and-ids).)
1. Specify whether to enable account locking and then click OK. (See [Configure account-locking settings](/help/forms/using/admin-help/configure-account-locking-settings.md#configure-account-locking-settings).) By default, Enable Account Locking is selected.

## Add a hybrid domain {#add-a-hybrid-domain}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click New Hybrid Domain.
1. In the ID box, type a unique identifier for the domain and, in the Name box, type a descriptive name for the domain. (See [Important considerations for domain names and IDs](adding-domains.md#important-considerations-for-domain-names-and-ids).)
1. Click Add Authentication and, in the Authentication Provider list, select a provider, depending on the authentication mechanism your organization uses. Possible values are LDAP, Kerberos, SAML, or a custom authentication provider.
1. Provide any additional information required on the page. (See [Authentication settings](/help/forms/using/admin-help/configuring-authentication-providers.md#authentication-settings).)
1. Click OK and then click OK again.

## Important considerations for domain names and IDs {#important-considerations-for-domain-names-and-ids}

Keep in mind the following considerations when choosing a domain name and ID:

### General considerations {#general-considerations}

* When you are using a database provider other than DB2, the domain ID can contain up to 50 bytes. If you are using single-byte ASCII characters, the limit is 50 characters. If the domain identifier contains multibyte characters, this limit is reduced. For example, if you create a domain whose identifier contains 3-byte characters, the limit is 16 characters. In addition, you cannot create domains that contain 4-byte characters. If you create a domain ID that exceeds this limit, AEM forms will be in an unstable state. To recover from this unstable state, see the " [Remove a domain that contains extended or multi-byte characters](adding-domains.md#remove-a-domain-that-contains-extended-or-multi-byte-characters)" on this page.
* The number of enterprise domains and local domains that can be created within AEM forms depends on the length of each of the domain IDs. When you add an enterprise or hybrid domain, User Management updates the configInstance string in the AuthProviders node of the AEM forms configuration file (config.xml). The configInstance string contains a colon-separated list of the absolute paths of all domains that are associated with the authorization provider. This string has a size limit of 8192 characters. When that limit is reached, you cannot create additional domains.

### Considerations when using DB2 {#considerations-when-using-db2}

When using DB2 for your AEM forms database, the maximum permitted length of the domain ID depends on the type of characters used:

* 100 single-byte (ASCII) (for example, characters used in English, French, or German languages)
* 50 double-byte (for example, characters used in Chinese, Japanese, or Korean languages)
* 25 four-byte (for example, characters used in Traditional Chinese language)

### Considerations when using MySQL {#considerations-when-using-mysql}

When using MySQL as your AEM forms database, the following limitations apply:

* Use only single-byte (ASCII) characters for the domain ID and domain name. If you use extended ASCII characters, AEM forms will be in an unstable state and may throw an exception if you attempt to delete the domain. To recover from this unstable state, see the " [Remove a domain that contains extended or multi-byte characters](adding-domains.md#remove-a-domain-that-contains-extended-or-multi-byte-characters)" topic on this page.
* You cannot create two domains that have the same name but differ in case. For example, attempting to create a domain named *Adobe* when a domain named *adobe* already exists results in an error.
* User Management cannot differentiate between two domain names that differ only in the use of extended characters. For example, if you create a domain named *abcde* and a domain named *âbcdè*, they are considered the same.

### Remove a domain that contains extended or multi-byte characters {#remove-a-domain-that-contains-extended-or-multi-byte-characters}

1. Export the configuration file, as described in [Importing and exporting the configuration file](/help/forms/using/admin-help/importing-exporting-configuration-file.md#importing-and-exporting-the-configuration-file).
1. Open the configuration file and under the Domains node, locate the node whose name attribute matches the name of the domain created with extended or multi-byte characters. Delete the entire node related to that domain.
1. In your database, search for the domain in the edcprincipaldomainentity table:

    * Select `*` from edcprincipaldomainentity.
    * Find the domain name that contains extended or multi-byte characters and set its status to OBSOLETE.

1. Import the updated configuration file, as described in [Importing and exporting the configuration file](/help/forms/using/admin-help/importing-exporting-configuration-file.md#importing-and-exporting-the-configuration-file).
