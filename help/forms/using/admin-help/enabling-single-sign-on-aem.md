---
title: Enabling single sign-on in AEM forms
description: Learn how to enable single sign-on (SSO) using HTTP headers and SPNEGO.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 89561ed0-d094-4ef7-9bc1-bde11f3c5bc3
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms,Document Security
role: User, Developer
---
# Enabling single sign-on in AEM forms{#enabling-single-sign-on-in-aem-forms}

AEM forms provides two ways to enable single sign-on (SSO) - HTTP headers and SPNEGO.

When SSO is implemented, the AEM forms user login pages are not required and do not appear if the user is already authenticated through their company portal.

If AEM forms cannot authenticate a user by using either of these methods, the user is redirected to a login page.

## Enable SSO using HTTP headers {#enable-sso-using-http-headers}

You can use the Portal Configuration page to enable single sign-on (SSO) between applications and any application that supports conveying the identity over HTTP header. When SSO is implemented, the AEM forms user login pages are not required and do not appear if the user is already authenticated through their company portal.

You can also enable SSO by using SPNEGO. (See [Enable SSO using SPNEGO](enabling-single-sign-on-aem.md#enable-sso-using-spnego).)

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Configure Portal Attributes.
1. Select Yes to enable SSO. If you select No, the remaining settings on the page are unavailable.
1. Set the remaining options on the page as required and click OK:

    * **SSO type:** (Mandatory) Select HTTP Header to enable SSO using HTTP headers.
    * **HTTP header for user’s identifier:** (Mandatory) Name of the header whose value contains the logged-in user’s unique identifier. User Management uses this value to find the user in the User Management database. The value obtained from this header should match the unique identifier of the user who is synchronized from the LDAP directory. (See [User settings](/help/forms/using/admin-help/adding-configuring-users.md#user-settings).)
    * **Identifier value maps to user’s User ID instead of user’s unique identifier:** Maps the user’s unique identifier value to the User ID. Select this option if the user’s unique identifier is a binary value that cannot be easily propagated through HTTP headers (for example, objectGUID if you are synchronizing users from Active Directory).
    * **HTTP header for domain:** (Not mandatory) Name of the header whose value contains the domain name. Use this setting only if no single HTTP header uniquely identifies the user. Use this setting for cases where multiple domains exist and the unique identifier is unique only within a domain. In this case, specify the header name in this text box and specify domain mapping for the multiple domains in the Domain mapping box. (See [Editing and converting existing domains](/help/forms/using/admin-help/editing-converting-existing-domains.md#editing-and-converting-existing-domains).)
    * **Domain mapping:** (Mandatory) Specifies mapping for multiple domains in the format *header value=domain name*.

      For example, consider a situation where the HTTP header for a domain is domainName, and it can have values of domain1, domain2, or domain3. In this case, use domain mapping to map the domainName values to User Management domain names. Each mapping must be on a different line:

      domain1=UMdomain1

      domain2=UMdomain2

      domain3=UMdomain3

### Configure allowed referers {#configure-allowed-referers}

For the steps to configure allowed referers, see [Configure allowed referers](/help/forms/using/admin-help/preventing-csrf-attacks.md#configure-allowed-referers).

## Enable SSO using SPNEGO {#enable-sso-using-spnego}

You can use Simple and Protected GSSAPI Negotiation Mechanism (SPNEGO) to enable single sign-on (SSO) when using Active Directory as your LDAP server in a Windows environment. When SSO is enabled, the AEM forms user login pages are not required and do not appear.

You can also enable SSO by using HTTP headers. (See [Enable SSO using HTTP headers](enabling-single-sign-on-aem.md#enable-sso-using-http-headers).)

>[!NOTE]
>
>AEM Forms on JEE does not support configuring SSO using Kerberos/SPNEGO in a multiple child domain environments .

1. Decide which domain to use to enable SSO. The AEM Forms Server and the users must be part of the same Windows domain or trusted domain.
1. In Active Directory, create a user who represents the AEM Forms Server. (See [Create a user account](enabling-single-sign-on-aem.md#create-a-user-account).) If you are configuring more than one domain to use SPNEGO, ensure that the passwords for each of these users is different. If the passwords are not different, SPNEGO SSO does not work.
1. Map the service principal name. (See [Map a Service Principal Name (SPN)](enabling-single-sign-on-aem.md#map-a-service-principal-name-spn).)
1. Configure the domain controller. (See [Prevent Kerberos integrity-check failures](enabling-single-sign-on-aem.md#prevent-kerberos-integrity-check-failures).)
1. Add or edit an enterprise domain as described in [Adding domains](/help/forms/using/admin-help/adding-domains.md#adding-domains) or [Editing and converting existing domains](/help/forms/using/admin-help/editing-converting-existing-domains.md#editing-and-converting-existing-domains). When you create or edit the enterprise domain, perform these tasks:

    * Add or edit a directory that contains your Active Directory information.
    * Add LDAP as an authentication provider.
    * Add Kerberos as an authentication provider. Provide the following information on the New or Edit Authentication page for Kerberos:

        * **Authentication Provider:** Kerberos
        * **DNS IP:** The DNS IP address of the server where AEM forms is running. You can determine this IP address by running `ipconfig/all` on the command line.
        * **KDC Host:** Fully qualified host name or IP address of the Active Directory server used for authentication
        * **Service User:** The service principal name (SPN) passed to the KtPass tool. In the example used earlier, the service user is `HTTP/lcserver.um.lc.com`.
        * **Service Realm:** Domain name for Active Directory. In the example used earlier, the Domain name is `UM.LC.COM.`
        * **Service Password:** Service user’s password. In the example used earlier, the service password is `password`.
        * **Enable SPNEGO:** Enables the use of SPNEGO for single sign-on (SSO). Select this option.

1. Configure SPNEGO client browser settings. (See [Configuring SPNEGO client browser settings](enabling-single-sign-on-aem.md#configuring-spnego-client-browser-settings).)

### Create a user account {#create-a-user-account}

1. In SPNEGO, register a service as a user in Active Directory on the domain controller to represent AEM forms. On the domain controller, go to Start Menu &gt; Administrative Tools &gt; Active Directory Users And Computers. If Administrative Tools is not in the Start menu, use the Control Panel.
1. Click the Users folder to display a list of users.
1. Right-click the user folder and select New &gt; User.
1. Type the First Name/Last Name and User Logon Name and then click Next. For example, set the following values:

    * **First Name**: umspnego
    * **User Logon Name**: spnegodemo

1. Type a password. For example, set it to *password*. Ensure that Password Never Expires is selected and no other options are selected.
1. Click Next and then click Finish.

### Map a Service Principal Name (SPN) {#map-a-service-principal-name-spn}

1. Obtain the KtPass utility. This utility is used to map an SPN to a REALM. You can obtain the KtPass utility as part of Windows Server Tool pack or Resource Kit. (See [Windows Server 2003 Service Pack 1 Support Tools](https://support.microsoft.com/kb/892777).)
1. In a command prompt, run `ktpass` using the following arguments:

   `ktpass -princ HTTP/`*host* `@`*REALM* `-mapuser`*user*

   For example, type the following text:

   `ktpass -princ HTTP/lcserver.um.lc.com@UM.LC.COM -mapuser spnegodemo`

   The values that you must provide are described as follows:

   **host:** Fully qualified name of the Forms Server or any unique URL. In this example, it is set to lcserver.um.lc.com.

   **REALM:** The Active Directory realm for the domain controller. In this example, it is set to UM.LC.COM. Ensure that you enter the realm in uppercase characters. To determine the realm for Windows 2003, complete the following steps:

    * Right-click My Computer and select Properties
    * Click the Computer Name tab. The Domain Name value is the realm name.

   **user:** The login name of the user account you created in the previous task. In this example, it is set to spnegodemo.

If you encounter this error:

```shell
DsCrackNames returned 0x2 in the name entry for spnegodemo.
ktpass:failed getting target domain for specified user.
```

try specifying the user as spnegodemo@um.lc.com:

```shell
ktpass -princ HTTP/lcserver.um.lc.com@UM.LC.COM -mapuser spnegodemo
```

### Prevent Kerberos integrity-check failures {#prevent-kerberos-integrity-check-failures}

1. On the domain controller, go to Start Menu &gt; Administrative Tools &gt; Active Directory Users And Computers. If Administrative Tools is not in the Start menu, use the Control Panel.
1. Click the Users folder to display a list of users.
1. Right-click the user account that you created in a previous task. In this example, the user account is `spnegodemo`.
1. Click Reset Password.
1. Type and confirm the same password that you typed previously. In this example, it is set to `password`.
1. Deselect Change Password At Next Logon and then click OK.

### Configuring SPNEGO client browser settings {#configuring-spnego-client-browser-settings}

For SPNEGO-based authentication to work, the client computer must be part of the domain the user account is created in. You must also configure the client browser to allow SPNEGO-based authentication. As well, the site that requires SPNEGO- based authentication must be a trusted site.

If the server is accessed by using the computer name, such as https://lcserver:8080, no settings are required for Internet Explorer. If you enter a URL that does not contain any dots ("."), Internet Explorer treats the site as a local intranet site. If you are using a fully qualified name for the site, the site must be added as a trusted site.

**Configure Internet Explorer 6.x**

1. Go to Tools &gt; Internet Options and click the Security tab.
1. Click the Local Intranet icon and then click Sites.
1. Click Advanced and, in the Add This Web Site To The Zone box, type the URL of your Forms Server. For example, type `https://lcserver.um.lc.com`
1. Click OK until all dialog boxes are closed.
1. Test the configuration by accessing the URL of your AEM Forms Server. For example, in the browser URL box, type `https://lcserver.um.lc.com:8080/um/login?um_no_redirect=true`

**Configure Mozilla Firefox**

1. In the browser URL box, type `about:config`

   The about:config - Mozilla Firefox dialog box appears.

1. In the Filter box, type `negotiate`
1. In the list shown, click network.negotiate-auth.trusted-uri and type one of the following commands as appropriate for your environment:

   `.um.lc.com`- Configures Firefox to allow SPNEGO for any URL that ends with um.lc.com. Ensure that you include the dot (".") at the beginning.

   `lcserver.um.lc.com` - Configures Firefox to allow SPNEGO for your specific server only. Do not start this value with a dot (".").

1. Test the configuration by accessing the application. The welcome page for the target application should appear.
