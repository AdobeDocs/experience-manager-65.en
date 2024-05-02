---
title: Creating and managing policies

description: A policy is a set of confidentiality settings and users who can access a document to which the policy is applied. You can create and manage various types of policies using AEM forms.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: Document Security
exl-id: 5e57451c-1a89-442c-8404-841e95d5ceff
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Creating and managing policies {#creating-and-managing-policies}

A *policy* defines a set of confidentiality settings and users who can access a document to which the policy is applied. A *policy set* is used to group a set of policies that have a common business purpose. These policy sets are then made available to a subset of users in the system. For details about policies, see [Policies and policy-protected documents](/help/forms/using/admin-help/document-security.md#policies-and-policy-protected-documents).

## Types of policies {#types-of-policies}

Document security provides the following types of policies.

**Personal policies**

Users can create, edit, copy, delete, and apply their own policies with settings appropriate to a particular situation. Only the person who creates a policy and the administrator can access that personal policy. Personal policies appear on the My Policies tab of the Policies page.

Invited users can also create, edit, copy, and delete personal policies if the administrator enables this capability.

**Shared policies**

Administrators and policy set coordinators create shared policies based on the confidentiality requirements that your organization identifies for different types of documents and users. Shared policies are contained within policy sets and are available to all authorized users (document publishers, policy set coordinators, and document recipients) for a particular policy set. Administrators and policy set coordinators can enable and disable shared policies. Shared policies appear in policy sets on the Policy Sets tab of the Policies page.

When you first install document security, it contains one shared policy, named *Restrict to All Principals*. When this policy is applied to a document, any user who can log in to document security can access the document. This policy is in the policy set named *Global Policy Set*. By default, this policy is not enabled. You can enable it if it suits your organization's needs.

**Microsoft&reg; Outlook auto-generated policies**

Using Acrobat, you can apply policies to documents that you send as email attachments in Microsoft&reg; Outlook. In Outlook, you can protect a document by using an existing policy. Or, you can use an auto-generated policy that Acrobat generates with default confidentiality settings and applies to the document that is attached to an email message. (See *[Acrobat Help](https://help.adobe.com/en_US/acrobat/pro/using/index.html)*.)

>[!NOTE]
>
>For a policy to be available in Outlook, you must set the policy as a favorite in Acrobat. All other policies, including those there you are the Publisher, are not displayed in Outlook.

## Who can create and manage policies and policy sets {#who-can-create-and-manage-policies-and-policy-sets}

The way that you interact with policies and policy sets depends on your role within the organization:

**Users:** Users can create, edit, and delete their personal policies. Invited users can also create personal policies if the administrator enables this capability.

**Policy set coordinators:** Policy set coordinators can create and manage shared policies within the policy sets where they are designated as a coordinator. A policy set coordinator is typically a specialist in the organization who can best author the policies in a particular policy set.

**Administrators:** Administrators can edit any user's personal policies. They can create shared policies. They can also create, edit, and delete policy sets, and designate policy set coordinators.

For details on the various document security roles, see [About document security users](/help/forms/using/admin-help/document-security.md#about-document-security-users).

## Creating and editing policies {#creating-and-editing-policies}

Users can create or edit personal policies for their own use. Administrators and policy set coordinators can create or edit shared policies for your organization.

### Considerations for editing policies {#considerations-for-editing-policies}

When you edit a policy, the changes affect documents that the policy currently protects, and documents that the policy protect thereafter. For example, if you remove recipients from a policy that is applied to a document, the recipients can no longer open the document.

The status of the document determines when the change takes effect:

* If the document is online, changes are applied immediately unless the user has the document open. In this case, the user must close the document for the changes to take effect.
* If a recipient is using the document offline (for example, on a laptop computer), the changes take effect the next time the recipient takes the document online. It then synchronizes with document security by opening any policy-protected document.

>[!NOTE]
>
>Policies that Acrobat auto-generates for the recipients of documents that are attached to email messages in Microsoft&reg; Outlook do not appear in the policy list. You can view these policies only by opening the Document Detail page for the associated document.

When you edit policies, these restrictions apply:

* Invited users can only edit policies if the administrator enables this capability. If you cannot edit policies, the Edit option is not available.
* Policy set coordinators can edit policies within policy sets only if they have the correct permissions. The super-user or policy set administrator sets these permissions in the document security administrator interface.
* If the policy has a watermark configured that the administrator deleted since the policy was created, this watermark will no longer be applied to documents if you edit and save the policy. Deleted watermarks remain in effect only for existing policies as long as you do not edit the policy. If you edit the policy, you must select another watermark to replace the deleted one.
* You cannot grant anonymous access to a document by editing the policy that is applied. If you edit the policy, users must still log in to access the document. To apply anonymous access to this document, first remove the policy in the client application and then apply another policy that permits anonymous access.
* Policies that Acrobat auto-generates for the recipients of a document that is attached to an email message in Microsoft Outlook do not appear in the policy list. To access this policy, locate the document on the Documents page, open the Document Detail page, and click the policy name in the list of document details.

**Create or edit a policy**

1. On the document security page, click Policies and click one of these tabs:

    * To create or edit a personal policy, click the My Policy tab.
    * To create or edit a shared policy, if you have permission, click the Policy Sets tab and click the appropriate policy set name, then click the Policies tab.

1. Click New or select the policy that you want to edit from the list.
1. In the Name box, type a name that uniquely identifies the policy. In the Description box, describe what the policy does and when to use it. If the policy is within a policy set, the name and description appear in the policy list for all specified users. Personal policies are available only to the user and the administrators.

   The following characters cannot be used in the name or description:

    * less-than sign (&lt;)
    * greater-than sign (&gt;)
    * ampersand (&)
    * single quotation mark (')
    * double quotation mark (")
    * backslash (\)
    * forward slash (/)

   If you used the following character in the name or description, they are converted to spaces:

    * carriage return (ASCII character 13)
    * new line (ASCII character 10).

   >[!NOTE]
   >
   >You can create a policy name that contains extended characters; however, when a comparison is made between two strings, accented and non-accented characters such as "e" and "é" are considered to be the same. When someone creates a policy, a comparison is made to check whether a policy with the same name exists. The comparison cannot distinguish between names that are the same except for accented characters. It is assumed that the policy is already added to the database and the new one is not added.

1. Add users and groups to the policy and set the appropriate permissions. (See [Users and Groups](creating-policies.md#users-and-groups).)
1. Under General Settings, select the appropriate options. (See [General Settings](creating-policies.md#general-settings).)
1. (Optional) If applicable, select an external authorization provider and specify its properties. If you do not want to use an external authorization provider, click Remove Default Provider.

   An external authorization provider is used to set up properties within the policy and when selected, the external authorization provider uses this information to evaluate the policy. The available properties are configured by the administrator and the person who installs the software.

1. Under Advanced Settings, select the appropriate options. (See [Advanced Settings](creating-policies.md#advanced-settings).)
1. Under Unchangeable Advanced Settings, select the appropriate options. (See [Unchangeable Advanced Settings](creating-policies.md#unchangeable-advanced-settings).)
1. Click Save. The policy appears in the policy list. An icon with a red circle appears beside the new policy, indicating that it is still disabled.

   To make the policy available to users, enable it. (See [Enable or disable shared policies](creating-policies.md#enable-or-disable-shared-policies).)

### Users and Groups {#users-and-groups}

In the Users and Groups area, you specify the users who have access to documents protected with the policy. For each user or group you specify, you also set the document usage privileges.

>[!NOTE]
>
>The document publisher is the user who protects the document with the policy. This user is always included by default on a policy, with full access rights, including revocation and policy-switching capabilities. However, administrators can change the document publisher's access rights for shared policies. For example, the administrator can restrict the document publisher from revoking document access or switching the policy.

**Add User or Group:** To add a user or group of users, click Add User or Group and then click Advanced Search so you can find users or groups. Users include your organization's internal users and invited users who have registered with document security. When you select this option, the Add User or Group page appears:

* In the Find box, type the user or group name or email address.
* In the Using list, select Name or Email.
* In the Type list, select User or Group.
* Select the domain that you want to search from the In list, and click Find.
* When the results are returned, select the user or group to add, and click Add.

>[!NOTE]
>
>If you enter a correct invited user name or email address and no result is returned, the user may not have registered yet, or the account may be deleted. You can try adding the user as an invited user type or contact your administrator.

**Invite New User:** To add an invited user, click Invite New User, type the user's email address in the box that appears, and click Invite. This option is available only if the administrator enabled it. When you add new invited users to a policy, document security sends a registration invitation email if the users are not already invited to register. The users must use the link in the email to create an account, and then they must activate the account.

After registering, invited users can use policy-protected documents that they have authorization for. Depending on the capabilities that the administrator enables, the external users may have permission to apply policies to documents, create, edit and delete policies, and add other external users to policies.

**Add Anonymous User:** To allow anonymous user access, click Add Anonymous User. This option is available only if the administrator enabled anonymous user access for document security. (See Configure the document security server.) This option grants everyone access to documents protected by this policy, regardless of whether they have a document security account. If you select this option, you cannot add other types of users to the policy.

>[!NOTE]
>
>To permit anonymous access to a policy-protected document that currently does not have it, remove the existing policy and then apply a policy that permits anonymous access. If you switch or change the existing policy, the users must still log in to access the document.

#### Specify the document permissions for users and groups {#specify-the-document-permissions-for-users-and-groups}

You can specify document permissions for one user or group at a time, or you can select multiple users and groups from the list and change their permissions using the options in the column headings area.

By default, all policy-protected documents have a permission that allows users to open them while online.

The Permissions and Options tab is displayed in document security.

These document permissions are available on the Permissions tab. You can apply these permissions to PDF, PTC Pro/E, and Microsoft Office files.

**Print:** Permits the user to print a document that is protected with this policy. For Office and Pro/E files, you can select the Print check box to allow printing, or clear it to prevent printing. If you select the Show Custom Permissions For PDF check box, you can select from these options:

**Not Allowed:** User is not allowed to print the PDF.

**Allowed:** User is allowed to print the PDF.

**Low res. only:** User is allowed to print the PDF at a low resolution.

**Modify:** Permits the user to modify a document that is protected with this policy. For Office and Pro/E files, you can select the Modify check box to allow modifications, or clear it to prevent modifications. If you select the Show Custom Permissions For PDF check box, you can select from these options:

**Not Allowed:** User is not allowed to modify the PDF.

**Any:** User can modify the PDF.

**Collaborate:** User is allowed to collaborate with others, using the Collaborate options in Adobe Acrobat. This permission allows the user to copy form data even if the Copy permission is not explicitly given in the policy.

**Alter Pages:** User is allowed to add and remove pages and edit content in the PDF.

**Fill &amp; Sign:** User is allowed to fill form fields on the PDF and sign it.

**Copy:** Permits the user to copy text from a document that is protected with this policy.

**Screen Reader:** This permission is displayed if you select the Show Custom Permissions For PDF check box. When this option is selected, Adobe Acrobat has permission to add temporary tags to the PDF to improve its readability with a screen reader.

These document permissions are available on the Options tab. You can apply these permissions to PDF, PTC Pro/E, and Microsoft Office files:

**Offline:** Permits the user to view a document offline that is protected with this policy.

**Permission Validity:** Select Permissions Are Always Valid or set a document permission validity period. If you select a validity period, click the calendar icon to select a date and use the arrows to specify the time in 24-hour format.

For shared policies, administrators can disable the following privileges for the document publisher (the user who applies the policy to a document):

**Revoke:** Permits the document publisher to revoke document access privileges.

**Switch:** Permits the document publisher to switch policy privileges.

### General Settings {#general-settings}

The General Settings area contains the following settings:

**Validity Period:** The time period during which the policy-protected document is accessible to authorized recipients. You can choose from these validity period options:

**Document will not be valid after:** The document is accessible for the specified number of days from when the document was secured.

**Document will not be valid after this date:** The document is valid from the date the policy is applied to the document until the end date that is specified.

**Valid from, to:** The document is valid during the dates you specified. You can use the calendar to select a date, where applicable, by clicking the calendar icon.

**Document is always valid:** The document validity period does not expire.

>[!NOTE]
>
>The validity dates are based on the time zone of the document security system, not on the time zone of your local computer.

**Auditing:** Enable or disable auditing of the events that are associated with a policy-protected document. For example, document security can record events such as attempts to open a document. Audited events appear in the list on the Events page. If you do not select this option, document security does not record events for documents that are associated with the policy.

>[!NOTE]
>
>The administrator must also enable server auditing on the Auditing and Privacy Settings configuration page for the auditing feature to work.

**Extended Usage Tracking:** Enable or disable Extended Usage Tracking. Document security supports tracking of user events associated with various operations performed on a PDF file. The document security object can be accessed using a Java Script. A button click, a multimedia file being played, or the saving of a file are some examples of events that are fired from a policy-protected PDF. Using the document security object, you can also retrieve user information. The tracking of events may be enabled from the document security server at the global level or at a policy level.

**Auto-Offline Lease Period:** The maximum number of days the recipient can use the policy-protected document offline (without an active Internet or network connection). When the lease period expires, the recipient must synchronize the document again to continue using it.

### External Authorization Providers {#external-authorization-providers}

Select the external authentication providers if you have already configured any. Available providers are listed.

### Authentication Settings {#authentication-settings}

You can override the authentication settings that you configured on the server and specify the authentication options relevant for this policy. Select Override Global Authentication Settings and then select the authentication options relevant for this policy. The following authentication options are available:

**Allow Username Password Authentication:** Select this option if you want enable client applications to use user name/password authentication when connecting to the server.

**Allow Kerberos Authentication:** Select this option if you want to enable client applications to use Kerberos authentication when connecting to the server.

**Allow Client Certificate Authentication:** Select this option if you want to enable client applications to use certificate authentication when connecting to the server.

**Allow Extended Authentication** Select to enable extended authentication. Selecting this option enables client applications to use extended authentication. Extended authentication provides for customized authentication processes and different authentication options configured on the Document Security server

If you are overriding the global authentication settings, you can choose the authentication options relevant for this policy. For example, if you had enabled three authentication options (username and password, client certificate, and extended authentication) on the server, you can override that global setting and select only extended authentication for this policy. Ensure that the authentication option that you select here is already configured on the server. In this example, you cannot select Kerberos as the authentication option because it is not configured on the server.

>[!NOTE]
>
>Extended authentication is supported on Apple Mac OS X with Adobe Acrobat release 11.0.6 and above.

### Advanced Settings {#advanced-settings}

The Advanced Settings area contains the following settings:

**Dynamic Watermark:** Select a watermark to be dynamically displayed on the pages of a document (for example, when a recipient prints the document). Dynamic watermarks uniquely identify a document, therefore helping to ensure the confidentiality of the document and preventing copyright infringement. For example, the administrator can configure a dynamic watermark that displays the current date, the user name, or identifier of the person who is using the document. Or, the name of the policy used to protect the document. A watermark can also display custom text or graphic elements, if configured. Administrators configure the watermark options, and administrators and users can apply them to policies.

(See [Configure dynamic watermarks](/help/forms/using/admin-help/configuring-client-server-options.md#configure-dynamic-watermarks).)

If you are editing a policy and the administrator deleted a configured watermark that you previously selected for this policy, a note appears on the Edit Policy page. In this case, if you are saving the edited document, select a new watermark if you want one to appear on the document.

>[!NOTE]
>
>For policies that provide anonymous user access, the user name and identifier of an anonymous user is not displayed as a watermark even if you select this type of watermark.

**Use Only Certified Acrobat Plug-ins for PDF:** When selected for a policy, this option specifies that Acrobat 8.0 and later must run in certified mode when opening documents that are secured with the policy. When Acrobat runs in certified mode, it does not load any third-party plug-ins.

Select this option if you are concerned about a document recipient writing a plug-in that can circumvent any of the document protections in Acrobat 8.0 and later. Do not select this option if your document recipients must use third-party plug-ins in Acrobat to interact with documents.

This option enables only the certified mode in Acrobat 8.0 or later; the administrator must disable access for Acrobat 7.0.

(See [Configure the document security server](/help/forms/using/admin-help/configuring-client-server-options.md#configure-the-document-security-server).)

This option does not apply to Adobe Reader.

**Access Denied Error Message:** A message that appears to anyone who attempts to open a policy-protected document without permission. This message appears in Acrobat. Clients that cannot display this message display a default message to indicate that access is denied.

### Unchangeable Advanced Settings {#unchangeable-advanced-settings}

The Unchangeable Advanced Settings area contains the following settings. You cannot change these settings after you save the policy.

**Encryption Algorithm and Key Length:** Used to protect your documents. You can choose from these options:

* AES 128-bit
* AES 256-bit. Only Acrobat 9.0 and later supports this option. To use AES 256 encryption for PDF files, obtain and install the Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy files. These files replace the local_policy.jar and US_export_policy.jar files in the [JAVE_HOME]/lib/security folder. For example, if you are using Sun JDK 1.6, copy the downloaded files to the [dep root]/Java/jdk1.6.0_26/lib/security folder. You can download these files from [Java SE Downloads](https://java.sun.com/javase/downloads/index.jsp).
* No encryption. Acrobat 9.0 and later currently support this option. If you select this option, the Document Restrictions options are disabled. This option may be useful if you want to use document security for document auditing or version control but to not want to encrypt the document.

**Document Restrictions:** Select the PDF document components to encrypt. Other client applications encrypt the entire document but not linked or embedded files. You can choose from these options:

* The entire document, including its attachments and metadata. *Metadata* is information about the document and its content that you can view through the document Properties dialog box or the Acrobat Advanced menu. In Acrobat, you can attach files of different types (for example, text, audio, and video files) to PDF documents.
* The document and its attachments but not the metadata.
* The document attachments only. You can encrypt the attachments to a PDF file without encrypting the document content.

## Enable or disable shared policies {#enable-or-disable-shared-policies}

To make a shared policy available, the administrator or policy set coordinator must enable it. You can enable new policies or previously disabled policies. A shared policy that you disable is still enforced for documents that are protected with that policy.

A red X appears beside a disabled policy.

>[!NOTE]
>
>Administrators cannot disable personal policies, and users cannot enable and disable their own policies.

1. On the document security page, click Policies and then click the Policy Sets tab.
1. Click the appropriate policy set name and click the Policies tab.
1. Select the check box beside the appropriate policy, click either Enable or Disable, and then click OK.

## View information about a policy {#view-information-about-a-policy}

Using the My Policies tab, you can search personal policies.

Policy sets that administrators create are listed on the Policy Sets tab of the Policies page. They contain information about the policy set, including its name, the date created and modified, and a description. Click a policy set name so you can see its details. Policy set coordinators who have permission to manage policies can create shared policies within a particular policy set.

When you create or edit a policy, a page is displayed where you can configure the policy name, permission levels, confidentiality settings, and the recipients to include in the policy.

The administrator can configure the following confidentiality settings for a policy:

* General document confidentiality options, such as the document validity period and offline lease period
* The authorized users, and the document restrictions and privileges for each of those users
* Advanced document confidentiality options, including dynamic watermarks and document encryption

Users can view the policies they created and any shared policies that they have access to. Administrators can view all the shared and personal policies that are in document security.

You can view more detailed information about a policy that appears in the list, including the users or groups that are included on the policy and the confidentiality settings that are specified for those users.

>[!NOTE]
>
>Policies that Acrobat auto-generates for the recipients of documents that are attached to email messages in Microsoft Outlook do not appear in the policy list. You can view these policies only by opening the Document Detail page for the associated document.

1. On the document security page, click Policies and then click the My Policies tab.
1. Complete the search information so you can search for personal policies.
1. Select the appropriate policy from the list.
1. On the Policy Detail page, you can see details about the policy, edit the policy, or view events related to the policy.

## Search for policies {#search-for-policies}

Administrators can search for shared policies and for personal policies that were created by other users.

1. To search for a shared policy, click Policies and then click the Policy Sets tab. Click a policy set in the list and then click the Policies tab.

   To search for a personal policy, on the document security page, click Policies and then click the My Policies tab.

1. In the Find list, select one of these options:

   **Policy ID:** The policy identification number that is generated when the user creates the policy. Type the exact policy ID.

   **Policy Name:** The name of the policy. You can search for part of the policy name or all of it.

1. In the text box, type the corresponding value. For example, if you selected Policy Name, type the policy name you are searching for.
1. In the Display list, select the number of results to display and then click Find. The search results are displayed.
1. (Optional) To view policy details, click the policy.

## Copy a policy {#copy-a-policy}

You can copy an existing policy and save it with a new name and description. Copying policies is an efficient way to create policies by using existing settings.

External users can copy policies only if the administrator enables this capability. If you cannot create policies, the Copy option is not available.

1. On the document security page, click Policies and then click the My Policy tab.
1. Select the appropriate policy from the list.
1. On the Policy Detail page, click Copy.
1. In the New Policy Name box, type the new policy name. Optionally, type a new Description.

   The following characters cannot be used in the name or description:

    * less-than sign (&lt;)
    * greater-than sign (&gt;)
    * ampersand (&)
    * single quotation mark (')
    * double quotation mark (")
    * backslash (\)
    * forward slash (/)

   If you used the following character in the name or description, they are converted to spaces:

    * carriage return (ASCII character 13)
    * new line (ASCII character 10).

   >[!NOTE]
   >
   >You can create a policy name that contains extended characters; however, when a comparison is made between two strings, accented and non-accented characters such as "e" and "é" are considered to be the same. When someone creates a policy, a comparison is made to check whether a policy with the same name exists. The comparison cannot distinguish between names that are the same except for accented characters. It is assumed that the policy is already added to the database and the new one is not added.

1. Click OK.

## Delete a policy {#delete-a-policy}

You can delete policies that you created. Administrators can delete policies that any user created. Policy set coordinators can delete policies in their policy sets. A policy that you delete is still enforced for documents that are protected with that policy. You can delete more than one policy at a time.

Invited users can delete policies only if the administrator enables this capability. If you cannot delete policies, the delete option is not available.

1. On the document security page, click Policies.
1. Click the My Policy tab.
1. To delete a shared policy, click the Policy Sets tab and click the appropriate policy set name.
1. Select the check box beside the appropriate policy and click Delete, and then click OK.

>[!NOTE]
>
>Use the client application to remove policies from documents. (See Acrobat Help or the appropriate Acrobat Reader DC extensions Help.)

## Sort the policy list {#sort-the-policy-list}

You can sort the policy list by column heading to find policies more easily. A triangle icon next to the column heading indicates which column is currently used to sort. An upward-pointing triangle indicates ascending order, while a downward-pointing triangle indicates descending order.

1. On the document security page, click Policies and click the Policy Set tab.
1. Select a policy set and then click the Policies tab.
1. Click the appropriate column heading.
1. To change the sort order, click the column again.
