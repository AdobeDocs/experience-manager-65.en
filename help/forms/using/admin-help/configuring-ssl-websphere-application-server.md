---
title: Configuring SSL for WebSphere Application Server
description: Learn how to configure SSL for WebSphere Application Server.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_ssl
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: b0786b52-879e-4a24-9cc9-bd9dcb2473cc
solution: Experience Manager, Experience Manager Forms
feature: Document Security
role: User, Developer
---
# Configuring SSL for WebSphere Application Server {#configuring-ssl-for-websphere-application-server}

This section includes the following steps to configure SSL with your IBM WebSphere Application Server.

## Creating a local user account on WebSphere {#creating-a-local-user-account-on-websphere}

For enabling SSL, WebSphere needs access to a user account in the local OS user registry that has permission to administer the system:

* (Windows) Create a Windows user who is part of the Administrators group and has the privilege to act as part of the operating system. (See [Create a Windows user for WebSphere](configuring-ssl-websphere-application-server.md#create-a-windows-user-for-websphere).)
* (Linux, UNIX) The user can be a root user or another user who has root privileges. When you enable SSL on WebSphere, use the server identification and password of this user.

### Create a Linux or UNIX user for WebSphere {#create-a-linux-or-unix-user-for-websphere}

1. Log in as the root user.
1. Create a user by entering the following command in a command prompt:

    * (Linux and Sun Solaris) `useradd`
    * (IBM AIX) `mkuser`

1. Set the password of the new user by entering `passwd` in the command prompt.
1. (Linux and Solaris) Create a shadow password file by entering `pwconv` (with no parameters) in the command prompt.

   >[!NOTE]
   >
   >(Linux and Solaris) For WebSphere Application Server Local OS security registry to work, a shadow password file must exist. The shadow password file is usually named **/etc/shadow** and is based on the /etc/passwd file. If the shadow password file does not exist, an error occurs after enabling global security and configuring the user registry as Local OS.

1. Open the group file from the /etc directory in a text editor.
1. Add the user who you created in step 2 to the `root` group.
1. Save and close the file.
1. (UNIX with SSL enabled) Start and stop WebSphere as the root user.

### Create a Windows user for WebSphere {#create-a-windows-user-for-websphere}

1. Log in to Windows by using an administrator user account.
1. Select **Start &gt; Control Panel &gt; Administrative Tools &gt; Computer Management &gt; Local Users and Groups**.
1. Right-click Users and select **New User**.
1. Type a user name and password in the appropriate boxes, and type any other information you require in the remaining boxes.
1. Deselect **User Must Change Password At Next Login**, click **Create**, and then click **Close**.
1. Click **Users**, right-click the user you created and select **Properties**.
1. Click the **Member Of** tab and then click **Add**.
1. In the Enter The Object Names To Select box, type `Administrators`, click Check Names to ensure that the group name is correct.
1. Click **OK** and then click **OK** again.
1. Select **Start &gt; Control Panel &gt; Administrative Tools &gt; Local Security Policy &gt; Local Policies**.
1. Click User Rights Assignment, and then right-click Act as Part of the Operating System and select Properties.
1. Click **Add User or Group**.
1. In the Enter The Object Names To Select box, type the name of the user you created in step 4, click **Check Names** to ensure that the name is correct, and then click **OK**.
1. Click **OK** to close the Act As Part Of The Operating System Properties dialog box.

### Configure WebSphere to use the newly created user as Administrator {#configure-websphere-to-use-the-newly-created-user-as-administrator}

1. Ensure that WebSphere is running.
1. In WebSphere Administrative Console, select **Security &gt; Global Security**.
1. Under Administrative security, select **Administrative user roles**.
1. Click Add and do the following:

    1. Type **&ast;** in the search box and click search.
    1. Click **Administrator** under roles.
    1. Add the newly created user to Mapped to role and map it to Administrator.

1. Click **OK** and save your changes.
1. Restart the WebSphere profile.

## Enable administrative security {#enable-administrative-security}

1. In WebSphere Administrative Console, select **Security &gt; Global Security**.
1. Click **Security Configuration Wizard**.
1. Ensure **Enable Application Security** checkbox is enabled. Click **Next**.
1. Select **Federated Repositories** and click **Next**.
1. Specify the credentials you want to set and click **Next**.
1. Click **Finish**.
1. Restart the WebSphere profile.

   WebSphere starts using the default keystore and truststore.

## Enable SSL (custom key and truststore) {#enable-ssl-custom-key-and-truststore}

Truststores and keystores can be created using ikeyman utility or admin console. To make ikeyman work properly, enure that the WebSphere installation path does not contain parentheses.

1. In WebSphere Administrative Console, select **Security &gt; SSL certificate and key management**.
1. Click **Keystores and certificates** under Related items.
1. In the **Key store usages** dropdown, ensure that **SSL Keystores** is selected. Click **New**.
1. Type a logical name and description.
1. Specify the path where you want your keystore to be created. If you have already created a keystore through ikeyman, specify the path to the keystore file.
1. Specify and confirm the password.
1. Choose the keystore type and click **Apply**.
1. Save the master configuration.
1. Click **Personal Certificate**.
1. If you had added already created a keystore using ikeyman, your certificate will appear. Otherwise, you need to add a new self-signed certificate by performing the following steps:

    1. Select **Create &gt; Self-signed Certificate**.
    1. Specify appropriate values on the certificate form. Ensure that you keep Alias and common name as fully qualified domain name of the machine.
    1. Click **Apply**.

1. Repeat steps 2 through 10 for creating a truststore.

## Apply custom keystore and truststore to the server {#apply-custom-keystore-and-truststore-to-the-server}

1. In WebSphere Administrative Console, select **Security &gt; SSL certificate and key management**.
1. Click **Manage endpoint security configuration**. The local topology map opens.
1. Under Inbound, select direct child of nodes.
1. Under Related items, select **SSL configurations**.
1. Select **NodeDeafultSSLSetting**.
1. From the truststore name and keystore name drop-down lists, select the custom truststore and keystore that you created.
1. Click **Apply**.
1. Save the master configuration.
1. Restart the WebSphere profile.

   Your profile now runs on custom SSL settings and your certificate.

## Enabling support for AEM forms natives {#enabling-support-for-aem-forms-natives}

1. In WebSphere Administrative Console, select **Security &gt; Global Security**.
1. In the Authentication section, expand **RMI/IIOP security** and click **CSIv2 inbound communications**.
1. Ensure that **SSL-supported** is selected in the Transport drop-down list.
1. Restart the WebSphere profile.

## Configuring WebSphere to convert URLs that begins with https {#configuring-websphere-to-convert-urls-that-begins-with-https}

To convert a URL that begins with https, add a Signer certificate for that URL to the WebSphere server.

**Create a Signer certificate for a https enabled site**

1. Ensure that WebSphere is running.
1. In WebSphere Administrative Console, navigate to Signer certificates and then click Security &gt; SSL Certificate and Key Management &gt; Key Stores and Certificates &gt; NodeDefaultTrustStore &gt; Signer Certificates.
1. Click Retrieve From Port and perform these tasks:

    * In the Host box, type the URL. For example, type `www.paypal.com`.
    * In the Port box, type `443`. This port is the default SSL port.
    * In the Alias box, type an alias.

1. Click Retrieve Signer Information and then verify that the information is retrieved.
1. Click Apply and then click Save.

HTML-to-PDF conversion from the site whose certificate is added will now work from the Generate PDF service.

>[!NOTE]
>
>For an application to connect to SSL sites from inside WebSphere, a Signer certificate is required. It is used by Java Secure Socket Extensions (JSSE) to validate certificates that the remote side of the connection sent during an SSL handshake.

## Configuring dynamic ports {#configuring-dynamic-ports}

IBM WebSphere does not allow multiple calls to ORB.init() when Global Security is enabled. You can read about the permanent restriction at https://www-01.ibm.com/support/docview.wss?uid=swg1PK58704.

Perform the following steps to set the port to be dynamic and resolve the issue:

1. In WebSphere Administrative Console, select **Servers** &gt; **Server Types** &gt; **WebSphere application server**.
1. In the Preferences section, select your server.
1. In the **Configuration** tab, under **Communications** section, expand **Ports**, and click **Details**.
1. Click the following port names, change the **port number** to 0, and click **OK**.

    * `ORB_LISTENER_ADDRESS`
    * `SAS_SSL_SERVERAUTH_LISTENER_ADDRESS`
    * `CSIV2_SSL_SERVERAUTH_LISTENER_ADDRESS`
    * `CSIV2_SSL_MUTUALAUTH_LISTENER_ADDRESS`

## Configure the sling.properties file {#configure-the-sling-properties-file}

1. Open `[aem-forms_root]`\crx-repository\launchpad\sling.properties file for editing.
1. Locate the `sling.bootdelegation.ibm` property and add `com.ibm.websphere.ssl.*`to its value field. The updated field look like the following:

   ```shell
   sling.bootdelegation.ibm=com.ibm.xml.*, com.ibm.websphere.ssl.*
   ```

1. Save the file and restart the server.
