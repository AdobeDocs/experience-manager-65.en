---
title: Enabling multi-threaded file conversions
seo-title: Enabling multi-threaded file conversions
description: Learn how to enable multi-threaded file conversions.
seo-description: Learn how to enable multi-threaded file conversions.
uuid: 830c78aa-4f68-4e01-8b24-69a0275689c7
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_pdf_generator
products: SG_EXPERIENCEMANAGER/6.5/FORMS
discoiquuid: 85d655bb-1b6b-4b4d-ae39-eca3ef9b7fd7
feature: PDF Generator
exl-id: 402c1fd4-c6c8-494e-b452-b56a91c4a397
---
# Enabling multi-threaded file conversions {#enabling-multi-threaded-file-conversions}

PDF Generator provides the ability to enable multi-threaded file conversions for certain types of files. Multi-threaded file conversion improves the performance of PDF Generator by allowing it to perform multiple conversions at the same time.

## Enabling multi-threaded file conversions for OpenOffice, Word, and PowerPoint documents {#enabling-multi-threaded-file-conversions-for-openoffice-word-and-powerpoint-documents}

By default, PDF Generator can convert only one OpenOffice, Microsoft Word, or PowerPoint document at a time. If you enable multi-threaded conversions, PDF Generator can convert more than one of the documents concurrently. PDF Generator will launch multiple instances of OpenOffice or PDFMaker (used to perform the Word and PowerPoint conversions).

>[!NOTE]
>
>Multi-threaded file conversions are not supported with Microsoft Word 2003 and PowerPoint 2003. To enable multi-threaded file conversions, upgrade to Microsoft Word 2007 and PowerPoint 2007 or Microsoft Word 2010 and PowerPoint 2010.

>[!NOTE]
>
>Multi-threaded file conversions are not supported with Microsoft Excel, Microsoft Visio, Microsoft Project, or Microsoft Publisher.

Each instance of OpenOffice or PDFMaker is launched using a separate user account. Each user account that you add must be a valid user with administrative privileges on the forms server computer. In a clustered environment, the same set of users must be valid for all nodes of the cluster.

On the User Accounts page in administration console, you can specify which user accounts to use for multi-threaded file conversions. You can add accounts, delete them, or change account passwords. If you are running PDF Generator on Windows Server 2003 or Windows Server 2008, add at least three user accounts that have administrator privileges.

When adding users for OpenOffice, Microsoft Word, or Microsoft PowerPoint on Windows Server 2003 or 2008, or for OpenOffice on Linux or Sun™ Solaris™, dismiss the initial activation dialogs for all users.

### Add the right to replace the process-level token {#add-the-right-to-replace-the-process-level-token}

On a Windows Operating system, the administrator user accounts that are used for PDF conversion (PDFG users) will need replace process level token privileges. You can add this right by using the Group Policy Editor:

1. In the Windows Start menu, click Run and then enter gpedit.msc.
1. Click Local Computer Policy &gt; Computer Configuration &gt; Windows Settings &gt; Security Settings &gt; Local Policies &gt; User Rights Assignment. Edit the *Replace a process level token* policy to include the Administrators group.
1. Add the user to the Replace a Process Level Token entry.

### Additional configuration required for OpenOffice, Microsoft Word, and Microsoft PowerPoint on Windows Server 2008 {#additional-configuration-required-for-openoffice-microsoft-word-and-microsoft-powerpoint-on-windows-server-2008}

If you are running OpenOffice, Microsoft Word, or Microsoft PowerPoint on Windows Server 2008, disable UAC for each user added.

1. Click Control Panel &gt; User Accounts &gt; Turn User Account Control on or off.
1. Deselect the box "Use User Account Control (UAC) to help protect your computer" and click OK.
1. Restart the computer for settings to take effect.

### Additional configuration required for OpenOffice on Linux or Solaris {#additional-configuration-required-for-openoffice-on-linux-or-solaris}

1. Add user accounts. (See [Add a user account](enabling-multi-threaded-file-conversions.md#add-a-user-account).)
1. Next, you will make changes to the /etc/sudoers file. The default permission for this file is 440. Change the permission for this file to writable.
1. Add entries for additional users (other than the administrator who runs the forms server) in the /etc/sudoers file. For example, if you are running AEM forms as a user named lcadm and a server named myhost, and you want to impersonate user1 and user2, add the following entries to /etc/sudoers:

   ```shell
    lcadm myhost=(user1) NOPASSWD: ALL
    lcadm myhost=(user2) NOPASSWD: ALL
   ```

   This configuration enables lcadm to run any command on host ‘myhost’ as ‘user1’ or ‘user2’ without prompting for password.

   >[!NOTE]
   >
   >Ensure that you have assigned system user and PDFG user roles to ‘user1’ and ‘user2’ . To assign PDFG role to a user, see [Add a user account](enabling-multi-threaded-file-conversions.md#add-a-user-account)

1. Also in the /etc/sudoers file, locate and comment out this line by adding a number sign (#) at the beginning of the line:

   ```shell
   Defaults requiretty
   ```

   This enables you to add Linux users.

1. Change the permission for the etc/sudoers file back to 440.
1. Allow all the users that you added via [Add a user account](enabling-multi-threaded-file-conversions.md#add-a-user-account) to make connections to the forms server. For example, to allow a local user named user1 the permission of making the connection to the forms server, use the following command

   `xhost +local:user1@`

   For more details, refer to xhost command documentation.

1. Restart the server.

>[!NOTE]
>
>OpenOffice must be installed in a directory location that all PDFG users can access. You can verify this by logging in as the PDFG user and checking whether you can launch OpenOffice without issues.

### Add a user account {#add-a-user-account}

1. In administration console, click Services &gt; PDF Generator &gt; User Accounts.
1. Click Add and enter the user name and password of a user who has administrative privileges on the forms server. If you are configuring users for OpenOffice, dismiss the initial OpenOffice activation dialogs.

   >[!NOTE]
   >
   >If you are configuring users for OpenOffice, the number of instances of OpenOffice cannot be greater than number of user accounts specified in this step.

1. Restart the forms server.

### Remove a user from the list used for multi-threaded file conversions {#remove-a-user-from-the-list-used-for-multi-threaded-file-conversions}

1. In administration console, click Services &gt; PDF Generator &gt; User Accounts.
1. Click the check box next to the user who you want to remove and click Delete.
1. On the confirmation page, click Delete.
1. Restart the forms server.

### Change the password for an account {#change-the-password-for-an-account}

1. In administration console, click Services &gt; PDF Generator &gt; User Accounts.
1. Click the user name, and enter and confirm the new password. This password must match the user’s system password.
