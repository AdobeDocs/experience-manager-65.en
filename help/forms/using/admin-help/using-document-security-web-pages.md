---
title: Using the document security webpages

description: Learn how you can login, navigate and use the document security web pages.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: Document Security
exl-id: caa31752-a02d-4d20-b7d9-c4aad5d0fae6
solution: Experience Manager, Experience Manager Forms
role: "User, Developer"
---
# Using the document security webpages {#using-the-document-security-webpages}

Users and administrators use the document security web pages to create and manage policies, manage policy-protected documents, and monitor events that are associated with policy-protected documents. Administrators also use the web pages to create policy sets and designate policy set coordinators, configure document security default settings, manage invited user registration and accounts, and monitor and manage server, policy, user, and document-related events.

>[!NOTE]
>
>You can also log in to document security through Acrobat and other client applications using your user login account. (See [Setting up access to document security from client applications](using-document-security-web-pages.md#setting-up-access-to-document-security-from-client-applications).)

To open the web pages, you require a browser and the URL and your login information for document security. The URL for users is different from the URL for administrators.

Because document security references your organization's existing directories for user information, your document security login information may be the same information that you use to log in to your network and other applications. See your system administrator or administrator for your account information.

To log in as an administrator, you need to have the administrator role assigned to you. You can use the default super administrator account that is created during the installation process.

## Log in to the web pages {#log-in-to-the-web-pages}

To log in to the web pages using a browser, you need the document security URL and an account. The URL for users is different from the URL for administrators. Administrators can also log in to the user pages to create policies.

If you have access to more than one installation of document security, you need the URL for the instance of document security you want to access. See your administrator if you do not have this information. The default URL for the user pages is `https://[host]:[port]/edc`. The port number may not be required in some cases. Ask your administrator for details.

The default URL for administrators is `https://[host]:[port]/adminui`.

For administrators, a default super administrator account is created during installation. You can use this account to log in when document security is first installed.

>[!NOTE]
>
>You can also access the web pages from Acrobat and other client applications. See Acrobat Help or the appropriate Acrobat Reader DC extensions Help for details.

1. Type the URL in your browser:

   Document security URL: `https://[host]:[port]/edc`

   or Administration Console URL: `https://[host]:[port]/adminui`

1. In the login window, type your user name and password, and click OK.
1. In Administration Console, click Services &gt; document security.

>[!NOTE]
>
>When working with the web pages, avoid using the browser buttons, such as the back button, refresh button, and the back and forward arrows because this action can cause unwanted data capture and data display problems.

## Navigating the web pages {#navigating-the-web-pages}

When you log in to the user web pages, you will see links to the Policies, Documents, and Events user pages.

When you log in to administration console and navigate to the document security main page, you may also see one or two additional links, one for the Configuration page and one for the Invited and Local Users page. The Invited and Local Users page is displayed only if invited user registration is enabled.

Use these links to access the various pages, where you create and manage policies and policy-protected documents.

**Display a page**

1. Click the name of the page; such as click Policies.

**Go back to the previous page**

1. Click the navigation link at the top of the page for the page you want to go back to.

**Refresh the data listing on a page**

1. On the main page, click the link to the page you want to refresh.

>[!NOTE]
>
>When working with the web pages, avoid using the browser buttons, such as the back button, refresh button, and the back and forward arrows, because this action can cause unwanted data capture and data display problems.

## Setting up access to document security from client applications {#setting-up-access-to-document-security-from-client-applications}

Client applications must be set up to connect to document security to protect documents, open policy-protected documents, and connect to the document security web pages. See *Acrobat Help* or the appropriate *RightsManagementExtension Help* for information about configuring the connection within the client application.

Document security is accessed via Secure Sockets Layer (SSL). Install the website's certificate in your certificate store so that you can access document security through the client applications.

<!-- Fix broken link See Configuring SSL for information on SSL.-->

These instructions are specific to Internet Explorer, but you can install the certificate by using any supported web browser. For more information, see the Help for your browser.

**Install the server certificate using Internet Explorer**

1. Open your web browser and type the base URL for document security in the Address box. For example, type `https://[host]:[port]`. A Security Alert dialog box appears.
1. Click View Certificate, and then click Install Certificate and select the defaults for installation. The certificate needs to be installed in the Trusted Root Certification Authorities.
1. Close your browser session.
1. Open another browser window and type the same URL in the Address box. A Security Alert dialog should not appear. This test confirms that the certificate is properly installed.

## Log out of the web pages {#log-out-of-the-web-pages}

Log out when you finish using the web pages so that you can safely use your web browser for other purposes. Depending on how document security is configured, you may need to close your browser to completely log out.

1. In the upper-right corner of the page, click Logout.
1. If a message appears on the Logout page, close your browser window to completely log out. Otherwise, you can proceed to use the browser for other purposes.
