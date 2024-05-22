---
title: Configuring SSL for JBoss Application Server
description: Learn how to configure SSL for JBoss Application Server.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_ssl
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 8eb4f691-a66b-498e-8114-307221f63718
solution: Experience Manager, Experience Manager Forms
feature: Document Security
role: User, Developer
---
# Configuring SSL for JBoss Application Server {#configuring-ssl-for-jboss-application-server}

To configure SSL on JBoss Application Server, you need an SSL credential for authentication. You can use the Java keytool to create a credential or request and import a credential from a certificate authority (CA). You must then enable SSL on JBoss.

You can run keytool by using a single command that includes all the information needed to create the keystore.

In this procedure:

* `[appserver root]` is the home directory of the application server running AEM forms.
* `[type]` is a folder name that varies, depending on the type of install you performed.

## Create an SSL credential {#create-an-ssl-credential}

1. In a command prompt, navigate to *[JAVA HOME]*/bin and type the following command to create the credential and keystore:

   `keytool -genkey -dname "CN=`*Host Name* `, OU=`*Group Name* `, O=`*Company Name* `,L=`*City Name* `, S=`*State* `, C=`Country Code" `-alias "AEMForms Cert"` `-keyalg RSA -keypass`*key_password* `-keystore`*keystorename* `.keystore`

   >[!NOTE]
   >
   >Replace `[JAVA_HOME]` with the directory where the JDK is installed, and replace the text in italic with values that correspond with your environment. Host Name is the fully qualified domain name of the application server.

1. Enter the `keystore_password` when prompted for a password. The password for the keystore and the key must be identical.

   >[!NOTE]
   >
   >The `keystore_password` *ntered at this step may be the same password (key_password) that you entered in step 1, or it may be different.*

1. Copy the *keystorename*.keystore to the `[appserver root]/server/[type]/conf` directory by typing one of the following commands:

    * (Windows Single Server) `copy` `keystorename.keystore[appserver root]\standalone\configuration`
    * (Windows Server Cluster) copy `keystorename.keystore[appserver root]\domain\configuration`
    * (Linux Single Server) `cp keystorename.keystore [appserver root]/standalone/configuration`
    * (Linux Server Cluster) `cp <em>keystorename</em>.keystore<em>[appserver root]</em>/domain/configuration`


1. Export the certificate file by typing the following command:

    * (Single Server) `keytool -export -alias "AEMForms Cert" -file AEMForms_cert.cer -keystore [appserver root]/standalone/configuration/keystorename.keystore`
    * (Server Cluster) `keytool -export -alias "AEMForms Cert" -file AEMForms_cert.cer -keystore [appserver root]/domain/configuration/keystorename.keystore`

1. Enter the *keystore_password* when prompted for a password.
1. Copy the AEMForms_cert.cer file to the *[appserver root] \conf* directory by typing the following command:

    * (Windows Single Server) `copy AEMForms_cert.cer [appserver root]\standalone\configuration`
    * (Windows Server Cluster) `copy AEMForms_cert.cer [appserver root]\domain\configuration`
    * (Linux Single Server) `cp AEMForms _cert.cer [appserver root]\standalone\configuration`
    * (Linux Server Cluster) `cp AEMForms _cert.cer [appserver root]\domain\configuration`

1. View the contents of the certificate by typing the following command:

    * `keytool -printcert -v -file [appserver root]\standalone\configuration\AEMForms_cert.cer`
    * `keytool -printcert -v -file [appserver root]\domain\configuration\AEMForms_cert.cer`

1. To provide write access to the cacerts file in `[JAVA_HOME]\jre\lib\security`, if necessary, perform the following task:

    * (Windows) Right-click the cacerts file and select Properties, and then deselect the Read-only attribute.
    * (Linux) Type `chmod 777 cacerts`

1. Import the certificate by typing the following command:

   `keytool -import -alias "AEMForms Cert" -file`*AEMForms_cert* `.cer -keystore`*JAVA_HOME* `\jre\lib\security\cacerts`

1. Type `changeit` as the password. This password is the default password for a Java installation and may have been changed by the system administrator.
1. When prompted for `Trust this certificate? [no]`, type `yes`. The confirmation "Certificate was added to keystore" is displayed.
1. If you are connecting over SSL from Workbench, install the certificate on the Workbench computer.
1. In a text editor, open the following files for editing:

    * Single Server - `[appserver root]`/standalone/configuration/lc_&lt;dbname/turnkey&gt;.xml

    * Server Cluster - `[appserver root]`/domain/configuration/host.xml

    * Server Cluster - `[appserver root]`/domain/configuration/domain_&lt;dbname&gt;.xml

1. * **For single server,** in the lc_&lt;dbaname/tunkey&gt;.xml file, add the following after &lt;security-realms&gt; section:

   ```xml
   <security-realm name="SSLRealm">
   <server-identities>
   <ssl>
   <keystore path="C:/Adobe/Adobe_Experience_Manager_Forms/jboss/standalone/configuration/aemformses.keystore" keystore-password="changeit" alias="AEMformsCert" key-password="changeit"/>
   </ssl>
   </server-identities>
   </security-realm>
   ```

   Locate the `<server>` section present after the following code:

   `<http-listener name="default" socket-binding="http" redirect-socket="https" max-post-size="104857600"/>`

   Add the following to the &lt;server&gt; section present after above code:

   ```xml
   <https-listener name="default-secure" socket-binding="https" security-realm="SSLRealm"/>
   ```

    * **For server cluster,** in the [appserver root]\domain\configuration\host.xml on all nodes, add the following after &lt;security-realms&gt; section:

   ```xml
   <security-realm name="SSLRealm">
   <server-identities>
   <ssl>
   <keystore path="C:/Adobe/Adobe_Experience_Manager_Forms/jboss/standalone/configuration/aemformses.keystore" keystore-password="changeit" alias="AEMForms Cert" key-password="changeit"/>
   </ssl>
   </server-identities>
   </security-realm>
   ```

   On the primary node of the Server Cluster, in the [appserver root]\domain\configuration\domain_&lt;dbname&gt;.xml, locate the &lt;server&gt; section present after the following code:

   `<http-listener name="default" socket-binding="http" redirect-socket="https" max-post-size="104857600"/>`

   Add the following to the &lt;server&gt; section present after above code:

   ```xml
   <https-listener name="default-secure" socket-binding="https" security-realm="SSLRealm"/>
   ```

1. Change the value for the `keystoreFile` attribute and the `keystorePass` attribute to the keystore password that you specified when you created the keystore.
1. Restart the application server:

    * For turnkey installations:

        * From the Windows Control Panel, click Administrative Tools, and then click Services.
        * Select JBoss for Adobe Experience Manager forms.
        * Select Action &gt; Stop.
        * Wait for the status of the service to appear as stopped.
        * Select Action &gt; Start.

    * For Adobe preconfigured or manually configured JBoss installations:

        * From a command prompt, navigate to *`[appserver root]`*/bin.
        * Stop the server by entering the following command:

            * (Windows) `shutdown.bat -S`
            * (Linux) `./shutdown.sh -S`

        * Wait until the JBoss process has fully shut down (when the JBoss process returns control to the terminal it was started in).
        * Start the server by entering the following command:

            * (Windows) `run.bat -c <profile>`
            * (Linux) `./run.sh -c <profile>`

1. To access administration console using SSL, type `https://[host name]:'port'/adminui` in a web browser:

   The default SSL port for JBoss is 8443. From here on, specify this port when accessing AEM forms.

## Request a credential from a CA {#request-a-credential-from-a-ca}

1. In a command prompt, navigate to *[JAVA HOME]*/bin and type the following command to create the keystore and the key:

   `keytool -genkey -dname "CN=`*Host Name* `, OU=`*Group Name* `, O=`*Company Name* `, L=`*City Name* `, S=`*State* `, C=`*Country Code*" `-alias "AEMForms Cert"` `-keyalg RSA -keypass`-*key_password* `-keystore`*keystorename* `.keystore`

   >[!NOTE]
   >
   >Replace *`[JAVA_HOME]`* with the directory where the JDK is installed, and replace the text in italic with values that correspond with your environment.

1. Type the following command to generate a certificate request to send to the certificate authority:

   `keytool -certreq -alias` "AEMForms Cert" `-keystore`*keystorename* `.keystore -file`*AEMFormscertRequest.csr*

1. When your request for a certificate file is fulfilled, complete the next procedure.

## Use a credential obtained from a CA to enable SSL {#use-a-credential-obtained-from-a-ca-to-enable-ssl}

1. In a command prompt, navigate to *`[JAVA HOME]`*/bin and type the following command to import the root certificate of the CA with which the CSR has been signed:

   `keytool -import -trustcacerts -file` rootcert.pem -keystore` keystorename.keystore -alias root`

   If the root certificate is not in the browser, also import it there.

   >[!NOTE]
   >
   >Replace *`[JAVA_HOME]` with the directory where the JDK is installed, and replace the text in italic with values that correspond with your environment.*

1. In a command prompt, navigate to *`[JAVA HOME]`*/bin and type the following command to import the credential into the keystore:

   `keytool -import -trustcacerts -file`*CACertificateName* `.crt -keystore`*keystorename* `.keystore`

   >[!NOTE]
   >
   >* Replace `[JAVA_HOME]` with the directory where the JDK is installed, and replace the text in italic with values that correspond with your environment.
   >* The imported CA signed certificate will replace a self-signed public certificate if it exists.

1. Complete steps 13 - 18 of Create an SSL credential.
