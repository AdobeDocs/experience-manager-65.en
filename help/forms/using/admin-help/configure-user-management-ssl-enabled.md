---
title: Configure User Management for an SSL-enabled LDAP server

description: Learn how  to configure User Management for an SSL-enabled LDAP server to enable synchronization to work properly over LDAPS.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 606e84f2-6728-47a9-a439-dbe2e55100ad
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configure User Management for an SSL-enabled LDAP server {#configure-user-management-for-an-ssl-enabled-ldap-server}

For synchronization to work properly over LDAPS, the LDAP certificates that the certificate authority (CA) issued must be present in the application server’s Java runtime environment (JRE). Import the certificate into the application server’s JRE cacerts file, which is usually in the *[JAVA_HOME]*/jre/lib/security/cacerts directory.

1. Enable SSL on the directory server. For details, see the documentation provided by your directory vendor.
1. Export a client certificate from the directory server.
1. Use the keytool program to import the client certificate file into the default Java virtual machine (JVM™) certificate store of the AEM forms application server . The procedure for this task varies, depending on your JVM and client installation paths. For example, if you use BEA WebLogic Server with JDK 1.5, from a command prompt, type this text:

   `keytool -import -alias`*alias* `-file certificatename -keystore C:\bea\jdk15_04\jre\lib\security\cacerts`

1. When prompted, type the password. (For Java, the default password is `changeit`.) A message appears stating that the certificate is imported successfully.
1. When prompted, type `Yes` to trust the certificate.
1. Enable SSL in User Management and, when configuring the directory settings, select Yes for the SSL option and change the port setting accordingly. The default port number is 636.

>[!NOTE]
>
>If you experience any problems using SSL, use an LDAP browser to check whether it can access the LDAP system when using SSL. If the LDAP browser cannot get access, your certificate or application server is not configured properly. If the LDAP browser works correctly and you are still experiencing problems, User Management is not configured properly.
