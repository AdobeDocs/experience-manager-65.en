---
title: WebDAV Access
seo-title: WebDAV Access
description: Learn about WebDAV access in AEM.
seo-description: Learn about WebDAV access in AEM.
uuid: b0ecaa5d-5454-42df-8453-404ece734c32
contentOwner: Chiradeep Majumdar
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: content
content-type: reference
discoiquuid: 1eaf7afe-a181-45df-8766-bd564b1ad22a
exl-id: 891ee66c-e49c-4561-8fef-e6e448a8aa1c
---
# WebDAV Access{#webdav-access}

To connect to AEM via WebDAV with KDE:

AEM offers WebDAV support that lets you display and edit repository content. Connecting via WebDAV gives you direct access to the content repository through your desktop. Text and PDF files that are added to the repository through the WebDAV connection are automatically full-text indexed and can be searched with the standard search interfaces and through the standard Java&trade; APIs.

## General {#general}

[Detailed instructions per operating system](/help/sites-administering/webdav-access.md#connecting-via-webdav) are included in this document, but the essentially to connect to your repository using the WebDAV protocol, you point your WebDAV client to the following location:

```xml
http://localhost:4502
```

![chlimage_1-111](assets/chlimage_1-111a.png)

This URL, when connected from the operating system level, provides WebDAV access to the default workspace ( `crx.default`). While being simpler for the user, it does not give them the additional flexibility of specifying workspace names, which can be accomplished using additional [WebDAV URLs](/help/sites-administering/webdav-access.md#webdav-urls).

AEM displays the repository content as follows:

* A node of the type `nt:folder` is displayed as a folder. Nodes below the `nt:folder` node are displayed as the folder content.

* A node of the type `nt:file` is displayed as a file. Nodes below the `nt:file` node are not displayed, but form the content of the file.

When you use WebDAV to create and edit folders and files, AEM creates and edits the necessary `nt:folder` and `nt:file` nodes. If you plan to use WebDAV to import and export content, try to work with `nt:file` and `nt:folder` node types as much as possible.

>[!NOTE]
>
>Before setting up WebDAV, check the [Technical Requirements](/help/sites-deploying/technical-requirements.md#webdav-clients).

## WebDAV URLs {#webdav-urls}

The URL for the WebDAV server has the following structure:

<table>
 <colgroup>
  <col width="100" />
  <col width="100" />
  <col width="100" />
  <col width="100" />
  <col width="100" />
 </colgroup>
 <tbody>
  <tr>
   <td>
    <code>
     <strong>URL Component</strong>
    </code></td>
   <td><code>https://&lt;host&gt;:&lt;port&gt;</code></td>
   <td><code>/&lt;crx-webapp-path&gt;</code></td>
   <td><code>/repository</code></td>
   <td><code>/&lt;workspace&gt;</code></td>
  </tr>
  <tr>
   <td>
    <code>
     <strong>Example</strong>
    </code></td>
   <td><code>http://localhost:4502</code></td>
   <td><code>/crx</code></td>
   <td><code>/repository</code></td>
   <td><code>/crx.default</code></td>
  </tr>
  <tr>
   <td><strong>Description</strong></td>
   <td>Host and port on which AEM runs</td>
   <td>Path for the AEM repository webapp</td>
   <td>Path to which WebDAV servlet is mapped</td>
   <td>Name of the workspace</td>
  </tr>
 </tbody>
</table>

By changing the workspace element in the path, you can map workspaces other than the default ( `crx.default`). For example, to map a workspace named `staging`, use the following URL:

```xml
http://localhost:4502/crx/repository/staging
```

## Connecting via WebDAV {#connecting-via-webdav}

[As mentioned above](/help/sites-administering/webdav-access.md#general), to connect to your repository using the WebDAV protocol, you point your WebDAV client to your repository location. However, depending on your OS, the steps involved connecting your client differ and there may be required configuration of the OS.

Instructions on how to connect the following operating systems are provided:

* [Windows](/help/sites-administering/webdav-access.md#windows)
* [macOS](/help/sites-administering/webdav-access.md#macos)
* [Linux&reg;](/help/sites-administering/webdav-access.md#linux)

### Windows {#windows}

To successfully connect a Microsoft&reg; Windows 7 (and greater) system to an AEM instance that is not secured with SSL, the option to establish basic authentication over an unsecured network must be explicitly enabled in Windows. This ability requires a change in the Windows Registry of the WebClient.

Once the registry is updated, then the AEM instance can be mapped as a drive.

#### Windows 7 and Greater Configuration {#windows-and-greater-configuration}

To update the registry to allow basic authentication over an unsecured network:

1. Locate the following registry subkey:

   ```xml
   HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient\Parameters
   ```

1. Set the `BasicAuthLevel` registry entry subkey to a value of `2` or greater.

   If it is not present, add the subkey.

1. Restart the system for the registry change to take effect.

>[!NOTE]
>
>Adobe recommends that you create a Windows user with the same credentials as the repository user, otherwise you may encounter permission conflicts.

#### Windows 8 Configuration {#windows-configuration}

For Windows 8, change the registry entry [as described for Windows 7 and greater](/help/sites-administering/webdav-access.md#windows-and-greater-configuration). However, before you do this task, the Desktop Experience must be enabled to see the registry entry.

To enable the Desktop Experience, open **Server Manager**, then **Features**, then **Add Features**, then **Desktop Experience**.

After rebooting, the registry entry described for Windows 7 and greater is available. Modify it as described for Windows 7 and greater.

#### Connecting in Windows {#connecting-in-windows}

To connect to AEM via WebDAV in a Windows environment:

1. Open **Windows Explorer** or **File Explorer** and click **Computer** or **This PC**.

   ![chlimage_1-112](assets/chlimage_1-112a.png)

1. To start the wizard, click **Map network drive**.
1. Enter the mapping details:

    * **Drive**: Choose any available letter
    * **Folder**: `http://localhost:4502`
    * Check **Connect using different credentials**

   Click Finish

   ![chlimage_1-113](assets/chlimage_1-113a.png)

   >[!NOTE]
   >
   >If AEM is on another port, use that port number instead of 4502. Also, if you are not running the content repository on your local machine, replace `localhost` with the respective server name or IP address.

1. Enter username `admin` and password `admin`. Adobe recommends that you use the pre-configured admin account for testing.

   ![chlimage_1-114](assets/chlimage_1-114a.png)

1. The wizard closes and the newly mapped drive is opened in a Windows Explorer or File Explorer window.

   ![chlimage_1-115](assets/chlimage_1-115a.png)

Windows has now mapped AEM as a drive via WebDAV and you can use it as any other drive.

### macOS {#macos}

There are no configuration steps required to connect by way of WebDAV on macOS. You can connect to the WebDAV server.

1. Navigate to any **Finder** window and click **Go** and **Connect to Server**, or press **Command+k**.
1. In the **Connect to Server** window, enter the AEM location:

    * `http://localhost:4502`

   >[!NOTE]
   >
   >If AEM is on another port, use that port number instead of 4502. Also, if you are not running the content repository on your local machine, replace `localhost` with the respective server name or IP address.

1. When you are prompted for authentication, enter username `admin` and password `admin`. Adobe recommends that you use the pre-configured admin account for testing.

macOS has now connected to AEM via WebDAV and you can use it as any other folder on your Mac.

### Linux&reg; {#linux}

Connecting via WebDAV on Linux&reg; doesn't require any configuration, but does involve a few steps to make the connection which vary depending on your desktop environment.

#### GNOME {#gnome}

To connect to AEM via WebDAV with GNOME:

1. In Nautilus (file explorer), select **Places** and select **Connect to Server**.
1. In the **Connect to Server** window, select WebDAV (HTTP) in Service Type.

1. In **Server**, enter `http://localhost:4502/crx/repository/crx.default`

   >[!NOTE]
   >
   >If AEM is on another port, use that port number instead of 4502. Also, if you are not running the content repository on your local machine, replace `localhost` with the respective server name or IP address.

1. In **Folder**, enter `/dav`
1. Enter the username `admin`. Adobe recommends that you use the pre-configured admin account for testing.
1. Leave the port blank and enter any name for your connection.
1. Click **Connect**. AEM prompts you for your password.
1. Enter the password `admin` and click **Connect**.

GNOME has now mounted AEM as a volume and you can use it like any other volume.

#### KDE {#kde}

1. Open the Network Folder wizard.
1. Select **WebFolder**(webdav) and click Next.
1. In **Name**, type a connection name.
1. In **User**, enter `admin.` Adobe recommends that you use the pre-configured admin account.
1. In **Server**, enter `http://localhost:4502/crx/repository/crx.default`

   >[!NOTE]
   >
   >If AEM is on another port, use that port number instead of 4502. Also, if you are not running the content repository on your local machine, replace `localhost` with the respective server name or IP address

1. In **Folder**, enter `dav`

1. Click **Save and Connect**.
1. When prompted for your password, enter the password `admin` and click **Connect**.

KDE has now mounted AEM as a volume and you can use it like any other volume.
