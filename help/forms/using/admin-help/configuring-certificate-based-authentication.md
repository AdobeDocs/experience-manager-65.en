---
title: Configuring certificate-based authentication

description: Import a Certificate Authority (CA) certificate into the Trust Store and create a certificate mapping for certificate-based authentication.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 9cbea8c8-4d42-446b-b98d-c090709624d7
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms, Security"
role: "User, Developer"
---
# Configuring certificate-based authentication {#configuring-certificate-based-authentication}

User Management usually performs authentication by using a user name and password. User Management also supports certificate-based authentication, which you can use to authenticate users through Acrobat or to authenticate users programmatically. For details about authenticating users programmatically, see [Programming with AEM forms](https://www.adobe.com/go/learn_aemforms_programming_63).

To use certificate-based authentication, import a Certificate Authority (CA) certificate that you trust into the Trust Store and then create a certificate mapping.

## Import the CA certificate {#import-the-ca-certificate}

When importing the certificate, select the Trust for Certificate Authentication and Trust for Identity options, and any other options that you require. For details about importing certificates, see [Managing certificates](/help/forms/using/admin-help/certificates.md#managing-certificates).

## Configuring certificate mapping {#configuring-certificate-mapping}

To enable certificate-based authentication for users, create a certificate mapping. A *certificate mapping* defines a map between a certificate’s attributes and the attributes of users in a domain. You can map more than one certificate to the same domain.

When you test a certificate, User Management uploads the certificate checks to ensure that it meets the following requirements:

* The certificate is valid.
* The Issuer you specified can verify the certificate.
* The certificate contains the attribute required for mapping.
* The mapping you specified maps the certificate to only one user in the AEM forms database. Both current and obsolete (deleted) users are checked to determine whether they match the mapping criteria. Therefore, the certificate test fails if more than one user, including obsolete users, has the attribute value being considered.

>[!NOTE]
>
>You cannot edit an existing certificate mapping.

**Add a certificate mapping**

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Certificate Mapping.
1. Click New Certificate Mapping and, in the For Issuer list, select the certificate alias as configured in Trust Store Management.
1. Map one of the certificate’s attributes to a user’s attribute. For example, you can map the certificate’s common name to the user’s login ID.

   If the content of the attribute in the certificate is different from the content in the user’s attribute in the User Management database, you can use a Java Regular Expression (regex) to match the two attributes. For example, if the common names of the certificates are names like *Alex Pink (Authentication)* and *Alex Pink (Signing)* and the common name in the User Management database is *Alex Pink*, you use a regex to extract the required part of the certificate attribute (in this example, *Alex Pink*.) The regular expression you specify must conform to the Java regex specification.

   You can transform the expression by specifying the order of the groups in the Custom Order box. The custom order is used with the `java.util.regex.Matcher.replaceAll()` method. The behavior that is seen will correspond to that method's behavior, and the input string (the custom order) must be specified accordingly.

   To test the regex, enter a value in the Test Parameter box and click Test.

   You can use the following characters in the regex:

    * . (any character)
    * &ast; (0 or more occurrences)
    * () (specify the group in brackets)
    * \ (used to escape a regex character to a regular character)
    * $n (used to refer to the nth group)

   Examples of regular expressions:

    * To extract "Alex Pink" from "Alex Pink (Authentication)"

      **Regex:** (.&ast;) \(Authentication\)

    * To extract "Alex Pink" from "Alex (Authentication) Pink"

      **Regex:** (.&ast;)\(Authentication\) (.&ast;)

    * To extract "Pink Alex" from "Alex (Authentication) Pink"

      **Regex:** (.&ast;)\(Authentication\) (.&ast;)

      Custom Order: $2 $1 (return second group, concatenated to first group, captured by whitespace character)

    * To extract "apink@sampleorg.com" from "smtp:apink@sampleorg.com"

      **Regex:** smtp:(.&ast;)

   For details on using regular expressions, see [Java tutorial about regular expressions](https://java.sun.com/docs/books/tutorial/essential/regex/).

1. In the For Domain list, select the user’s domain.
1. To test this configuration, click Browse to upload a sample user certificate, click Test Certificate and, if the configuration is correct, click OK.

**Edit an existing certificate mapping**

1. In Administration Console, click Settings &gt; User Management &gt; Configuration.
1. Click Certificate Mapping.
1. Select the certificate mapping to edit and edit its configuration. You can update the regular expression and custom order.
1. To test your changes, click Browse to upload a sample certificate, click Test Certificate, and then click OK.

**Delete a certificate mapping**

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Certificate Mapping.
1. Select the check box for the certificate mapping to delete, click Delete, and then click OK.
