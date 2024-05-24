---
title: Configuring authentication providers
description: Add, edit, or delete authentication providers, change authentication settings, and read about just-in-time provisioning of users.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/setting_up_and_managing_domains
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: d72a3977-1423-49e0-899b-234bb76be378
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configuring authentication providers {#configuring-authentication-providers}

Hybrid domains require at least one authentication provider, and enterprise domains require at least one authentication provider or directory provider.

If you enable SSO using SPNEGO, add a Kerberos authentication provider with SPNEGO enabled and an LDAP provider as a backup. This configuration enables user authentication with a user ID and password if SPNEGO is not working. (See [Enable SSO using SPNEGO](/help/forms/using/admin-help/enabling-single-sign-on-aem.md#enable-sso-using-spnego).)

## Add an authentication provider {#add-an-authentication-provider}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click an existing domain in the list. If you are adding authentication for a new domain, see [Add an enterprise domain](/help/forms/using/admin-help/adding-domains.md#add-an-enterprise-domain) or [Add a hybrid domain](/help/forms/using/admin-help/adding-domains.md#add-a-hybrid-domain).
1. Click Add Authentication and, in the Authentication Provider list, select a provider, depending on the authentication mechanism your organization uses.
1. Provide any additional information required on the page. (See [Authentication settings](configuring-authentication-providers.md#authentication-settings).)
1. (Optional) Click Test to test the configuration.
1. Click OK and then click OK again.

## Edit an existing authentication provider {#edit-an-existing-authentication-provider}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click the appropriate domain in the list.
1. On the page that appears, select the appropriate authentication provider from the list and make changes as required. (See [Authentication settings](configuring-authentication-providers.md#authentication-settings).)
1. Click OK.

## Delete an authentication provider {#delete-an-authentication-provider}

1. In administration console, click Settings &gt; User Management &gt; Domain Management.
1. Click the appropriate domain in the list.
1. Select the check boxes for the authentication providers to delete and click Delete.
1. Click OK on the confirmation page that appears and click OK again.

## Authentication settings {#authentication-settings}

The following settings are available, depending on the type of domain and type of authentication you chose.

### LDAP settings {#ldap-settings}

If you are configuring authentication for an enterprise or hybrid domain and select LDAP authentication, you can choose to use the LDAP server specified in your directory configuration, or you can choose a different LDAP server to use for authentication. If you choose a different server, your users must exist on both LDAP servers.

To use the LDAP server specified in your directory configuration, select LDAP as the authentication provider and click OK.

To use a different LDAP server to perform authentication, select LDAP as the authentication provider, and select the Custom LDAP Authentication check box. The following configuration settings are displayed.

**Server:** (Mandatory) Fully qualified domain name (FQDN) of the directory server. For example, for a computer called x on the example.com network, the FQDN is x.example.com. An IP address can be used in place of the FQDN server name.

**Port:** (Mandatory) The port the directory server uses. Typically 389, or 636 if the Secure Sockets Layer (SSL) protocol is used for sending authentication information over the network.

**SSL:** (Mandatory) Specifies whether the directory server uses SSL when sending data over the network. The default is No. When set to Yes, the corresponding LDAP server certificate must be trusted by the Java™ runtime environment (JRE) of the application server.

**Binding** (Mandatory) Specifies how to access the directory.

**Anonymous:** No user name or password is required.

**User:** Authentication is required. In the Name box, specify the name of the user record that can access the directory. It is best to enter the full distinguished name (DN) of the user account, such as cn=Jane Doe, ou=user, dc=can, dc=com. In the Password box, specify the associated password. These settings are required when you select User as the Binding option.

**Retrieve Base DNs:** (Not mandatory) Retrieves the base DNs and displays them in the drop-down list. This setting is useful when you have multiple base DNs and need to select a value.

**Base DN:** (Mandatory) Used as the starting point for synchronizing users and groups from the LDAP hierarchy. It is best to specify a base DN at the lowest level of the hierarchy that encompasses all users and groups that need to be synchronized for services. Do not include the user’s DN in this setting. To synchronize a particular user, use the Search Filter setting.

**Populate page with:** (Not mandatory) When selected, populates attributes on the User and Group settings pages with corresponding default LDAP values.

**Search Filter:** (Mandatory) The search filter to use to find the record that is associated with the user. See Search Filter Syntax.

### Kerberos settings {#kerberos-settings}

If you are configuring authentication for an enterprise or hybrid domain and select Kerberos authentication, the following settings are available.

**DNS IP:** The DNS IP address of the server where AEM forms is running. On Windows, you can determine this IP address by running ipconfig /all at the command line.

**KDC Host:** Fully qualified host name or IP address of the Active Directory server that is used for authentication.

**Service User:** If you are using Active Directory 2003, this value is the mapping created for the service principal in the form `HTTP/<server name>`. If you are using Active Directory 2008, this value is the login ID of the service principal. For example, assume that the service principal is named um spnego, the user ID is spnegodemo, and the mapping is HTTP/example.yourcompany.com. With Active Directory 2003, you set Service User to HTTP/example.yourcompany.com. With Active Directory 2008, you set Service User to spnegodemo. (See Enable SSO using SPNEGO.)

**Service Realm:** Domain name for Active Directory

**Service Password:** Service user’s password

**Enable SPNEGO:** Enables the use of SPNEGO for single sign-on (SSO). (See Enable SSO using SPNEGO.)

### SAML settings {#saml-settings}

If you are configuring authentication for an enterprise or hybrid domain and select SAML authentication, the following settings are available. For information about additional SAML settings, see [Configure SAML service provider settings](/help/forms/using/admin-help/configure-saml-service-provider-settings.md#configure-saml-service-provider-settings).

**Please select a SAML Identity Provider Metadata&#xA;file to import:** Click Browse to select a SAML identity provider metadata file generated from your IDP and then click Import. Details from IDP are displayed.

**Title:** Alias to the URL denoted by the EntityID. The title is also displayed on the login page for enterprise and local users.

**Identity Provider Supports Client Basic Authentication:** Client Basic Authentication is used when the IDP uses a SAML Artifact Resolution profile. In this profile, User Management connects back to a web service running at the IDP to retrieve the actual SAML assertion. The IDP may require authentication. If the IDP does require authentication, select this option and specify a user name and password in the boxes provided.

**Custom Properties:** Enables you to specify additional properties. The additional properties are name=value pairs separated by new lines.

The following custom properties are required if artifact binding is used.

* Add the following custom property to specify a username that represents the AEM forms Service Provider, which is used to authenticate to the IDP Artifact Resolution service.
  `saml.idp.resolve.username=<username>`

* Add the following custom property to specify the password for the user specified in `saml.idp.resolve.username`.
  `saml.idp.resolve.password=<password>`

* Add the following custom property to allow the service provider to ignore the certificate validation while establishing the connection with the Artifact Resolution service over SSL.
  `saml.idp.resolve.ignorecert=true`

### Custom settings {#custom-settings}

If you are configuring authentication for an enterprise or hybrid domain and select Custom authentication, select the name of the custom authentication provider.

## Just-in-time provisioning of users {#just-in-time-provisioning-of-users}

Just-in-time provisioning creates a user in the User Management database automatically after the user is successfully authenticated by way of an authentication provider. Relevant roles and groups are also assigned dynamically to the new user. You can enable just-in-time provisioning for enterprise and hybrid domains.

This procedure describes the way traditional authentication works in AEM forms:

1. When a user tries to log in to AEM forms, User Management passes their credentials sequentially to all available authentication providers. (Login credentials include username/password combination, Kerberos ticket, PKCS7 signature, and so on.)
1. The authentication provider validates the credentials.
1. The authentication provider then checks whether the user exists in the User Management database. The following statuses are possible:

   **Exists** If the user is current and unlocked, User Management returns authentication success. However, if the user is not current or is locked, User Management returns authentication failure.

   **Does not exist** User Management returns authentication failure.

   **Invalid** User Management returns authentication failure.

1. The result returned by the authentication provider is evaluated. If the authentication provider returned authentication success, the user is allowed to log in. Otherwise, User Management checks with the next authentication provider (steps 2-3).
1. Authentication failure is returned if no available authentication provider validates the user credentials.

When just-in-time provisioning is enabled, new users are created dynamically in User Management if one of the authentication providers validates their credentials. (After step 3 in the procedure above.)

Without just-in-time provisioning, when a user is successfully authenticated but is not found in the User Management database, the authentication fails. Just-in-time provisioning adds a step in the authentication procedure to create the user and assign roles and groups to the user.

### Enable just-in-time provisioning for a domain {#enable-just-in-time-provisioning-for-a-domain}

1. Write a service container that implements the IdentityCreator and AssignmentProvider interfaces. (See [Programming with AEM forms](https://www.adobe.com/go/learn_aemforms_programming_63).)
1. Deploy the service container to the Forms Server.
1. In administration console, click Settings &gt; User Management &gt; Domain Management.

   Select an existing domain or click New Enterprise Domain.

1. To create a domain, click New Enterprise Domain or New Hybrid Domain. To edit an existing domain, click the name of the domain.
1. Select Enable Just In Time Provisioning.

   ***note**: If the Enable Just In Time Provisioning checkbox is missing, click Home &gt; Settings &gt; User Management&gt; Configuration &gt; Advanced System Attributes and then click Reload.*

1. Add authentication providers. While adding authentication providers, on the New Authentication screen, select a registered Identity Creator and Assignment Provider. (See [Configuring authentication providers](configuring-authentication-providers.md#configuring-authentication-providers).)
1. Save the domain.
