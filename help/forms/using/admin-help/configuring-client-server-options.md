---
title: Configuring client and server options
description: Learn how you can configure the various client and server options, such as server configuration settings, document security roles, and event auditing.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/working_with_document_security
products: SG_EXPERIENCEMANAGER/6.5/FORMS
feature: Document Security
exl-id: fe132f13-5f9a-4c86-a385-0a0026c812e2
solution: Experience Manager, Experience Manager Forms
role: User, Developer
---
# Configure the document security server {#configure-the-document-security-server}

1. In administration console, click Services &gt; document security &gt; Configuration &gt; Server Configuration.
1. Configure the settings and click OK.

## Server configuration settings {#server-configuration-settings}

**Base URL:** The base document security URL, containing the server name and port. Information appended to the base creates connection URLs. For example, /edc/Main.do is appended to access the web pages. Users also respond to external user registration invitations through this URL.

If you are using IPv6, enter the Base URL as the computer name or the DNS name. If you use a numerical IP address, Acrobat will fail to open policy protected files. Also, use HTTP secure (HTTPS) URL for your server.

>[!NOTE]
>
>The base URL is embedded in policy-protected files. Client applications use the base URL to connect back to the server. Secured files will continue to contain the base URL, even if it is changed later. If you change the base URL, configuration information must be updated for all connecting clients.

**Default Offline Lease Period:** The default length of time that a user can use a protected document offline. This setting determines the initial value of the Auto-Offline lease period setting when you create a policy. (See Creating and editing policies.) When the lease period expires, the recipient must synchronize the document again to continue using it.

For a discussion of how offline lease and synchronization works, see [Primer on configuring offline lease and synchronization](https://blogs.adobe.com/security/2009/05/primer_on_configuring_offline.html).

**Default Offline Synchronization Period:** The maximum time any document can be used offline from when it is initially protected.

**Client Session Timeout:** The length of time, in minutes, after which document security disconnects if a user who is logged in through a client application does not interact with document security.

**Allow Anonymous Users Access:** Select this option to enable the ability to create shared and personal polices that allow anonymous users to open policy-protected documents. (Users who do not have accounts can access the document, but they cannot log in to document security or use other policy-protected documents.)

**Disable Access to Version 7 Clients:** Specifies whether users can use Acrobat or Reader 7.0 to connect to the server. When this option is selected, users must use Acrobat or Reader 8.0 and later to complete document security operations on PDF documents. If polices require that Acrobat or Reader 8.0 and later must run in certified mode when opening policy-protected documents, you should disable access to Acrobat or Reader 7. (See Specify the document permissions for users and groups.)

**Allow offline access per document** Select this option to specify offline access per document. If this setting is enabled, then the user will have offline access to only those documents that the user has opened online at least once.

**Allow Username Password Authentication:** Select this option to enable client applications to use user name/password authentication when connecting to the server.

**Allow Kerberos Authentication:** Select this option to enable client applications to use Kerberos authentication when connecting to the server.

**Allow Client Certificate Authentication:** Select this option to enable client applications to use certificate authentication when connecting to the server.

**Allow Extended Authentication** Select to enable extended authentication and then enter the Extended Authentication Landing URL.

Selecting this option enables client applications to use extended authentication. Extended authentication provides for customized authentication processes and different authentication options configured on the AEM Forms Server. For example, users can now experience the SAML-based authentication instead of AEM forms username/Password, from Acrobat and Reader Client. By default, the Landing URL contains *localhost* as the server name. Replace the server name with a fully qualified hostname. The hostname in the landing URL is automatically populated from the base URL, if extended Authentication is not enabled yet. See [Add the extended authentication provider](configuring-client-server-options.md#add-the-extended-authentication-provider).

***note**: Extended authentication is supported on Apple Mac OS X with Adobe Acrobat release 11.0.6 and above.*

**Preferred HTML Control Width for Extended Authentication** Specify the width of the extended authentication dialog that opens in Acrobat for entering user credentials.

**Preferred HTML Control Height for Extended Authentication** Specify the height of the extended authentication dialog that opens in Acrobat for entering user credentials.

***note**: The limits of the width and height for this dialog box are as follows:*
Width: Minimum = 400, maximum = 900

Height: Minimum = 450; maximum = 800

**Enable Client Credential Caching:** Select this option to allow users to cache their credentials (user name and password). When users' credentials are cached, they do not have to enter their credentials every time they open a document or when they click the Refresh button on the Manage Security Policies page in Adobe Acrobat. You can specify the number of days before users must supply their credentials again. Setting the number of days to 0 allows credentials to be cached indefinitely.

## Configuring document security users and administrators {#configuring-document-security-users-and-administrators}

### Assigning document security roles to administrators {#assigning-document-security-roles-to-administrators}

Your AEM forms environment contains one or more administrator users who have the appropriate privileges for creating users and groups. If your organization is using document security, at least one administrator must also be assigned the privilege to manage invited and local users.

The administrators must also have the administration console User role to access administration console. (See [Creating and configuring roles](/help/forms/using/admin-help/creating-configuring-roles.md#creating-and-configuring-roles).)

### Configuring visible users and groups {#configuring-visible-users-and-groups}

To view users and groups in selected domains during policy user searches, a super administrator or policy set administrator must select and add domains (created in User Management) to the visible user and group list for each policy set.

The visible user and group list is visible to the policy set coordinator and is used to restrict which domains the end user can browse when choosing users or groups to add to policies. If this task is not performed, the policy set coordinator will not find any users or groups to add to the policy. There can be more than one policy set coordinator for any given policy set.

1. After you install and configure your AEM forms environment with document security, set up all appropriate domains in User Management. <!-- Fix broken link (See Setting up and managing domains) -->

   ***note**: Creating domains must be done before any policies can be created.*

1. In administration console, click Services &gt; Document Management &gt; Policies and then click the Policy Sets tab.
1. Select Global Policy Set and then click the Visible Users And Groups tab.
1. Click Add Domain(s) and add existing domains as required.
1. Navigate to Services &gt; document security &gt; Configuration &gt; My Policies and click the Visible Users And Groups tab.
1. Click Add Domain(s) and add existing domains as required.

## Add the extended authentication provider {#add-the-extended-authentication-provider}

AEM forms provides a sample configuration that you can customize for your environment. Perform the following steps:

>[!NOTE]
>
>Extended authentication is supported on Apple Mac OS X with Adobe Acrobat release 11.0.6 and above.

1. Obtain the sample WAR file deploy it. See the installation guide appropriate for your application server.
1. Ensure that the Forms Server has a fully qualified name instead of IP addresses as the base URL and that it is a HTTPS URL. See [Server configuration settings](configuring-client-server-options.md#server-configuration-settings).
1. Enable Extended Authentication from the Server Configuration page. See [Server configuration settings](configuring-client-server-options.md#server-configuration-settings).
1. Add the required SSO redirect URLs in the User Management configuration file. See [Add SSO redirect URLs for extended authentication](configuring-client-server-options.md#add-sso-redirect-urls-for-extended-authentication).

### Add SSO redirect URLs for extended authentication {#add-sso-redirect-urls-for-extended-authentication}

With extended authentication enabled, users opening a policy protected document in Acrobat XI or Reader XI get a dialog for authentication. This dialog loads the HTML page that you specified as the extended authentication landing URL on the document security server settings. See [Server configuration settings](configuring-client-server-options.md#server-configuration-settings).

>[!NOTE]
>
>Extended authentication is supported on Apple Mac OS X with Adobe Acrobat release 11.0.6 and above.

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Import And Export Configuration Files.
1. Click Export and save the configuration file to your disk.
1. Open the file in an editor, and locate the AllowedUrls node.
1. In the `AllowedUrls` node, add the following lines: `<entry key="sso-l" value="/ssoexample/login.jsp"/> <entry key="sso-s" value="/ssoexample"/> <entry key="sso-o" value="/ssoexample/logout.jsp"/>`

   ```xml
   <entry key="sso-l" value="/ssoexample/login.jsp"/>
   <entry key="sso-s" value="/ssoexample"/>
   <entry key="sso-o" value="/ssoexample/logout.jsp"/>
   ```

1. Save the file, and then import the updated file from the Manual Configuration page: In administration console, click Settings &gt; User Management &gt; Configuration &gt; Import And Export Configuration Files.

## Configuring offline security {#configuring-offline-security}

document security provides the ability to use policy-protected documents offline without an Internet or network connection. This ability requires that the policy allow offline access, as described in [Specify the document permissions for users and groups](/help/forms/using/admin-help/creating-policies.md#specify-the-document-permissions-for-users-and-groups). Before a document having such a policy can be used offline, the recipient must open the document while online and enable offline access, by clicking Yes when prompted. The recipient may also be requested to authenticate his identity. The recipient can then use documents offline for the duration of the offline lease period that is specified in the policy.

When the offline lease period ends, the recipient must synchronize again with document security either by opening a document online or by using an Acrobat or Acrobat Reader DC extensions menu command to synchronize. (See *Acrobat Help* or the appropriate *Acrobat Reader DC extensions Help*.)

Because documents that allow offline access require caching key material on the computer where the files are stored offline, the file can potentially be compromised if an unauthorized user can obtain the key material. To compensate for this possibility, scheduled and manual key rollover options are provided that you can configure to prevent an unauthorized person from using the key to access the document.

### Set a default offline lease period {#set-a-default-offline-lease-period}

Recipients of policy-protected documents can take the documents offline for the number of days specified in the policy. After initially synchronizing the document with document security, the recipient can use it offline until the offline lease period expires. When the lease period expires, the recipient must take the document online and log in to synchronize with document security to continue using the document.

You can configure a default offline lease period. The lease period can be changed from the default when anyone creates or edits a policy.

1. On the document security page, click Configuration &gt; Server Configuration.
1. In the Default Offline Lease Period box, type the number of days for the offline lease period.
1. Click OK.

### Manage key rollovers {#manage-key-rollovers}

Document security uses encryption algorithms and licenses to protect documents. When it encrypts a document, document security generates and manages a decryption key called a *DocKey* that it passes to the client application. If the policy that protects a document permits offline access, an offline key called a *principal key* is also generated for each user who has offline access to the document.

>[!NOTE]
>
>If a principal key does not exist, document security generates one to secure a document.

To open a policy-protected document offline, the user's computer must have the appropriate principal key. The computer obtains the principal key when the user synchronizes with document security (opens a protected document online). If this principal key is compromised, any document to which the user has offline access might also be compromised.

One way to lessen the threat to offline documents is to avoid permitting offline access to particularly sensitive documents. Another method is to periodically roll over the principal keys. When document security rolls the key over, any existing keys can no longer access the policy-protected documents. For example, if a perpetrator obtains a principal key from a stolen laptop, that key cannot be used to access the documents that are protected after the rollover occurs. If you suspect that a specific principal key has been compromised, you can manually roll over the key.

However, a key rollover affects all principal keys, not just one. It also reduces the scalability of the system because clients must store more keys for offline access. The default key rollover frequency is 20 days. It is recommended not to set this value lower than 14 days because people may be prevented from viewing offline documents and system performance may be affected.

In the following example, Key1 is the older of the two principal keys, and Key2 is the newer one. When you click the Rollover Keys Now button the first time, Key1 becomes invalid, and a newer, valid principal key (Key3) is generated. Users will obtain Key3 when they synchronize with document security, typically by opening a protected document online. However, users are not forced to synchronize with document security until they reach the maximum offline lease period specified in a policy. After the first key rollover, users who remain offline can still open offline documents, including those protected by Key3, until they reach the maximum offline lease period. When you click the Rollover Keys Now button a second time, Key2 becomes invalid, and Key4 is created. Users who remain offline during the two key rollovers are not able to open documents protected with Key3 or Key4 until they synchronize with document security.

**Change the key rollover frequency**

For confidentiality purposes, when you are using offline documents, document security provides an automatic key rollover option with a default frequency period of 20 days. You can change the rollover frequency; however, avoid setting the value lower than 14 days because people may be prevented from viewing offline documents and system performance may be affected.

1. On the document security page, click Configuration &gt; Key Management.
1. In the Key Rollover Frequency box, type the number of days for the rollover period.
1. Click OK.

**Manually roll over principal keys**

To maintain confidentiality of offline documents, you can manually roll over principal keys. You may find it necessary to manually roll over a key (for example, if the key is compromised by someone who obtains it from a computer where it is cached to enable offline access to a document).

>[!NOTE]
>
>Avoid frequently using manual rollover because it causes all principal keys to roll over, not just one, and may temporarily prevent users from viewing new documents offline.

The principal keys must be rolled over twice before previously existing keys on client computers are invalidated. Client computers that have invalidated principal keys must re-synchronize with the document security service to acquire the new principal keys.

1. On the document security page, click Configuration &gt; Key Management.
1. Click Rollover Keys Now and then click OK.
1. Wait approximately 10 minutes. The following log message appears in the server log: `Done RightsManagement key rollover for`*N* `principals`. Where *N* is the number of users in the document security system.
1. Click Rollover Keys Now and then click OK.
1. Wait approximately 10 minutes.

## Configuring event auditing and privacy settings {#configuring-event-auditing-and-privacy-settings}

Document security can audit and record information about events that are related to interaction with policy-protected documents, policies, administrators, and the server. You can configure event auditing, and you can specify the types of events to audit. To audit events for a particular document, the auditing option on the policy must also be enabled.

When auditing is enabled, you can view details of the audited events on the Events page. document security users can also view events that are related specifically to the policy-protected documents that they use or create.

You can select these types of events for auditing:

* Policy-protected document events, such as attempts by authorized or unauthorized users to open documents
* Policy events, such as creating, changing, deleting, enabling, and disabling of policies
* User events, such as external user invitations and registrations, activated and deactivated user accounts, changes to user passwords, and profile updates
* AEM forms events, such as version mismatches, unavailable directory server and authorization providers, and server configuration changes

### Enable or disable event auditing {#enable-or-disable-event-auditing}

You can enable and disable auditing of events related to the server, policy-protected documents, policies, policy sets, and users. When you enable event auditing, you can choose to audit all the possible events or you can select specific events to audit.

When you enable the server auditing, you can view the audited events on the Events page.

1. In administration console, click Services &gt; Document Security &gt; Configuration &gt; Audit and Privacy Settings.
1. To configure server auditing, under Enable Server Auditing, select Yes or No.
1. If you selected Yes, under each event category, do one of the following actions to select the options to audit:

    * To audit all events in the category, select All.
    * To audit only some events, deselect All, and then select the check boxes beside the events you want to audit.

      (See [Event auditing options](configuring-client-server-options.md#event-auditing-options).)

1. Click OK.

>[!NOTE]
>
>When working with the web pages, avoid using the browser buttons, such as the back button, refresh button, and the back or forward arrow because this action can cause unwanted data capture and data display problems.

### Enable or disable privacy notification {#enable-or-disable-privacy-notification}

You can enable and disable a privacy notification message. When you enable privacy notification, a message appears when a recipient attempts to open a policy-protected document. The notice informs the user that the document usage is being audited. You can also specify a URL that the user can use to view your privacy policy page if one is available.

1. In administration console, click Services &gt; Document Security&gt; Configuration &gt; Audit and Privacy Settings.
1. To configure the privacy notification, under Enable Privacy Notice, select Yes or No.

   If the policy attached to a document allows anonymous user access and Enable Privacy Notice is set to No, the user is not prompted to log in and the privacy notification message is not displayed.

   If the policy attached to a document does not allow anonymous user access, the user will see the privacy notification message.

1. If applicable, in the Privacy URL box, type the URL to your privacy policy page. If the Privacy URL box is left blank, the privacy page from adobe.com is displayed.
1. Click OK.

>[!NOTE]
>
>Disabling the privacy notice does not disable document usage auditing. Out of the box auditing actions and custom actions supported via extended usage tracking can still collect user behavior information.

### Import a custom audit event type {#import-a-custom-audit-event-type}

If you are using a document security-enabled application that supports auditing of additional events, such as events specific to a certain file type, an Adobe partner can provide you with custom audit events that you can import into document security. Use this feature only if you have been provided with custom event types by an Adobe partner.

1. In administration console, click Services &gt; Document Security &gt; Configuration &gt; Event Management.
1. Click Browse to go to the XML file to import and click Import.
1. Importing overwrites existing custom audit event types on the server if identical event code and namespace combinations are found.
1. Click OK.

### Delete a custom audit event type {#delete-a-custom-audit-event-type}

1. In administration console, click Services &gt; document security &gt; Configuration &gt; Event Management.
1. Select the check box next to the custom audit event type to delete and click Delete.
1. Click OK.

### Export audit events {#export-audit-events}

You can export audit events to a file for archiving purposes.

1. In administration console, click Services &gt; Document Security &gt; Configuration &gt; Event Management.
1. Edit the settings under Export Audit Events as required. You can specify:

    * the minimum age of the audit events to export
    * the maximum number of audit events to include in a single file. The server generates one or more files, based on this value.
    * the folder where the file will be created. This folder is on the Forms Server. If the folder path is relative, then it is relative to your application server root directory.
    * the file prefix to use for the audit events files
    * the format of the file, either a comma-separated values (CSV) file that is compatible with Microsoft Excel or an XML file.

1. Click Export. If you want to cancel the export, click Cancel Export. If another user has scheduled an export, the Cancel Export button is unavailable until that export is complete. The Cancel Export button is unavailable if another user has scheduled an export. To check whether a scheduled Export or Delete has started or finished, click Refresh.

### Delete audit events {#delete-audit-events}

You can delete audit events that are older than a specified number of days.

1. In administration console, click Services &gt; Document Security &gt; Configuration &gt; Event Management.
1. Under Delete Audit Events, specify the number of days in the Delete Audit Events Older Than box.
1. Click Delete. Click Export. If you want to cancel the delete, click Cancel Delete. If another user has scheduled a delete, the Cancel Delete button is unavailable until that export is complete. The Cancel Delete button is unavailable if another user has scheduled an export. To check whether a scheduled Delete has started or finished, click Refresh.

### Event auditing options {#event-auditing-options}

You can enable and disable event auditing and specify the types of events to be audited.

**Document events**

**View Document:** A recipient views a policy-protected document.

**Close Document:** A recipient closes a policy-protected document.

**Print Low resolution** A recipient prints a policy-protected document with the low-resolution option specified.

**Print High resolution:** A recipient prints a policy-protected document with high-resolution option specified.

**Add Annotation to Document:** A recipient adds an annotation to a PDF document.

**Revoke Document:** A user or administrator revokes access to a policy-protected document.

**Unrevoke Document:** A user or administrator reinstates access to a policy-protected document.

**Form Filling:** A recipient enters information into a PDF document that is a fillable form.

**Removed Policy:** A publisher removes a policy from a document to withdraw the security protections.

**Change Document Revocation URL:** A call from the API level changes the revocation URL that is specified to access a new document that replaces a revoked document.

**Modify Document:** A recipient changes the content of a policy-protected document.

**Sign Document:** A recipient signs a document.

**Secure a New Document:** A user applies a policy to protect a document.

**Switch Policy on Document:** A user or administrator switches the policy that is attached to a document.

**Publish Document As:** A new document whose documentName and license are identical to an existing document is registered on the server, and the documents do not have a parent-child relationship. This event can be triggered using the AEM forms SDK.

**Iterate Document:** A new document whose documentName and license are identical to an existing document is registered on the server, and the documents have a parent-child relationship. This event can be triggered using the AEM forms SDK.

**Policy events**

**Created Policy:** A user or administrator creates a policy.

**Enabled Policy:** An administrator makes a policy available.

**Changed Policy:** A user or administrator changes a policy.

**Disabled Policy:** An administrator makes a policy unavailable.

**Deleted Policy:** A user or administrator deletes a policy.

**Change Policy Owner:** A call from the API level changes the policy owner.

**User events**

**Deleted User:** An administrator deletes a user account.

**Register Invited User:** An external user registers with document security.

**Successful Login:** Successful login attempts by administrators or users.

**Invited Users:** Document security invites a user to register.

**Activated Users:** External users activate their accounts by using the URL in the activation email, or an administrator enables an account.

**Change Password:** Invited users change their passwords or an administrator resets a password for a local user.

**Failed Login:** Failed login attempts by administrators or users.

**Deactivated Users:** An administrator disables a local user account.

**Profile Update:** Invited users change their name, organization name, and password.

**Account Locked:** An administrator locks an account.

**Policy Set Events**

**Created&#xA;Policy Set:** An administrator or policy set coordinator creates a policy set.

**Deleted Policy Set:** An administrator or policy set coordinator deletes a policy set.

**Modified Policy Set:** An administrator or policy set coordinator changes a policy set.

**System events**

**Directory&#xA;Synchronization Complete:** This information is not available from the Events page. The current directory synchronization information, including the current synchronization state and time of the last synchronization, is displayed on the Domain Management page. To access the Domain Management page in administration console, click Settings > User Management > Domain Management.

**Client Enable Offline Access:** A user enabled offline access to documents that are secured against the server on the user's computer.

**Synchronized Client** Client application must synchronize information with the server to allow for offline access.

**Version Mismatch:** A version of the AEM forms SDK that is incompatible with the server attempted to connect to the server.

**Directory Synchronization Information:** This information is not available from the Events page. The current directory synchronization information, including the current synchronization state and time of the last synchronization, is displayed on the Domain Management page. To access the Domain Management page in administration console, click Settings > User Management > Domain Management.

**Server Configuration Change:** Changes to the server configuration that are done either through the web pages or manually by importing a config.xml file. This includes changes to the base URL, session time-outs, login lockouts, directory settings, key rollovers, SMTP server settings for external registration, watermark configuration, display options, and so on.

## Configuring extended usage tracking {#configuring-extended-usage-tracking}

Document security can track various custom events that may be performed on a protected document. You can enable the tracking of events from the document security server at the global level or at a policy level. You can then set up a JavaScript to capture specific actions performed within the protected PDF document such as clicking a button, or saving the document. This usage data is sent as an XML file in key-value pairs, which you can use for further analysis. End users who access the protected documents can allow or decline such tracking from the client application.

If tracking is enabled at the global level, you can override this setting at the policy level and disable it for a particular policy. Policy-level overriding is not possible if tracking is disabled at the global level. The list of tracked events is automatically pushed to the server when the event count reaches 25 or when the document is closed. You can also configure your script to explicitly push the event list as per your requirements. You can customize the event tracking by accessing the document security object properties and methods.

After you enable tracking, all policies that are subsequently created will have tracking turned on by default. Policies created prior to tracking being enabled on the server will need manual updates.

### Enable or disable extended usage tracking {#enable-or-disable-extended-usage-tracking}

Before you begin, ensure that Server Auditing is enabled. See [Configuring event auditing and privacy settings](configuring-client-server-options.md#configuring-event-auditing-and-privacy-settings) for more information on auditing.

1. In administration console, click Services &gt; Document Security &gt; Configuration &gt; Audit and Privacy Settings.
1. To configure extended usage tracking, under Enable Tracking, select Yes or No.
1. To set the selection of the Allow collection of detailed usage data check box on the log in page, under Enable Tracking default, select Yes or No.

To view the tracked events you can use the Document Events filter on the Events page. The events tracked using JavaScript are labelled as Detailed Usage Tracking. Refer to [Monitoring events](/help/forms/using/admin-help/monitoring-events.md#monitoring-events) for more information on events.

## Configure document security display settings {#configure-document-security-display-settings}

1. In administration console, click Services &gt; document security &gt; Configuration &gt; Display Options.
1. Configure the settings and click OK.

### Display settings {#display-settings}

**Rows to display for search results:** Number of rows that appear on a page when searches are performed.

**Customization for client login dialog**

These settings control the text displayed in the login prompt that appears when a user logs into document security through a client application.

**Welcome Text:** The welcome message text, such as "Please Login with Your User name and Password". The welcome message text should contain information on how to log in to document security and how to contact an administrator or other designated support person in your organization for assistance. For example, external users may need to contact an administrator if they forget their passwords or need assistance with the registration or login process. The maximum length of the welcome text is 512 characters.

**User Name Text:** The text label for the user name box.

**Password Text:** The text label for the password box.

**Customization for client certificate authentication dialog**

These settings control the text displayed in the certificate authentication dialog box.

**Choose&#xA;Authentication Type Text:** The text displayed to direct a user to select an authentication type.

**Choose Certificate Text:** The text displayed to direct a user to select a certificate type.

**Certificates Not Available Error Text:** Message of up to 512 characters to display when the selected certificate is not available.

**Customization for client certificate display**

**Only Display Trusted Credential Issuers:** When this option is selected, the client application presents the user with only certificates from credential issuers that AEM forms is configured to trust (See Managing certificates and credentials.) When this option is not selected, the user is presented with a list of all certificates on the user's system.

## Configure dynamic watermarks {#configure-dynamic-watermarks}

Using document security, you can configure default settings for the dynamic watermark option that you can apply when you create policies. A *watermark* is an image that is superimposed over text in the document. It is useful for tracking the content of a document and can help identify illegal use of the content.

A dynamic watermark can consist of either text made up of defined variables such as user ID and date and custom text, or rich content within a PDF. You can configure watermarks with several elements each with its own positioning and formatting.

Watermarks are not editable and therefore they are a more secure method of ensuring the confidentiality of the document content. Dynamic watermarks also ensure that a watermark shows enough user-specific information to act as a deterrent to further distributing the document.

The watermark that a policy specifies appears in the policy-protected document when a recipient views or prints the document. Unlike permanent watermarks, a dynamic watermark is never saved in the document, which provides the flexibility that is necessary when deploying a document in an intranet environment to ensure that the viewing application displays the identity of the specific user. Also, if a document has multiple users, the use of the dynamic watermark means you can use one document instead of multiple versions, each with a different watermark. The watermark that appears reflects the identity of the current user.

Notice that dynamic watermarks are different from the watermarks that users can add directly to the document in Acrobat. The result is that you can have two watermarks in a policy-protected document.

### Considerations when creating watermarks {#considerations-when-creating-watermarks}

You can create dynamic watermarks with several watermark elements with each element specified as either text or PDF. You can include up to five elements, in a watermark.

If you choose a text-based watermark, you can specify several elements within the watermark with multiple text entries and specify the positioning of each element. Assign meaningful names to these elements, such as header, footer, and so on.

For example, if you want to specify different text in the header, footer, on the margins, and across the document as a watermark, you create several watermark elements and specify their positions. If you want the user ID of the user and the current date of accessing the document to appear in the header, the policy name in the right margin, and a custom text "CONFIDENTIAL" to appear diagonally across the document, you define separate watermark elements with text as the type, and specify its formatting and positioning. When the watermark is applied to a document, all the elements in the watermark are applied to the document at the same time, in the order they are added to the watermark.

Typically, you use PDF-based watermarks to include graphic contents such as logos or special symbols such as copyright or registered trademark.

You can change the limits on the number of watermark elements and the PDF file size by modifying the document security configuration file. See [Change the watermark configuration parameters](configuring-client-server-options.md#change-the-watermark-configuration-parameters).

Keep in mind the following when you configure watermarks:

* You cannot use a password-protected PDF document as the watermark element. However, if the watermark that you create contains other elements that are not password-protected, they will be applied as part of the watermark.
* You can change the maximum PDF file size that you want to use as watermark element. However, large PDF documents used as watermarks degrade performance during offline synchronization of documents applied with such watermarks. See [Change the watermark configuration parameters](configuring-client-server-options.md#change-the-watermark-configuration-parameters).
* Only the first page of the selected PDF is used as the watermark. Ensure that the information that you want to appear as watermark is available on the first page itself.
* Even though you can specify the scaling of the PDF document, consider the page size and layout of the PDF if you plan to use it as a watermark in the header, footer, or margins.
* When specifying the font name, enter the name correctly. AEM forms substitutes the font that you specified if it is not present in the client machine where the document is opened.
* If you selected text as the watermark content, specifying the scaling option as Fit To Page does not work for pages that have dissimilar width.
* When you specify the positioning of the watermark elements, ensure that no more than one element has the same positioning. If two watermark elements have the same positioning such as center, they appear overlapped on the document, and in the order they were added to the watermark.
* When specifying the font size and type, ensure that the length of text is completely visible within the page. Text contents roll over into new lines, so the watermark content that you intended to be present in the margins might overlap into the content areas on pages. However, if the document is opened in Acrobat 9, text beyond the single line is truncated.

### Limitations of dynamic watermarks {#limitations-of-dynamic-watermarks}

Some client applications may not support Dynamic watermarks. See the appropriate Acrobat Reader DC extensions Help. In addition, keep in mind the following about the versions of Acrobat that supports dynamic watermarks:

* You cannot use a password-protected PDF document as the watermark element.
* Acrobat and Adobe Reader versions earlier than 10 do not support the following watermark features:

    * PDF watermarks
    * Multiple elements in the watermark (Text/PDF)
    * Advanced options such as range of pages, or display options
    * Text formatting options such as specified font, font name and color. However, earlier versions of Acrobat and Reader will display the text content in the default font and color.

* Acrobat 9.0 and earlier versions: Acrobat 9.0 and earlier does not support policy names in dynamic watermarks. If Acrobat 9.0 opens a policy-protected document with a dynamic watermark that includes a policy name and other dynamic data, the watermark is displayed without the policy name. If the dynamic watermark includes only the policy name, Acrobat displays an error message

### Add a dynamic watermark template {#add-a-dynamic-watermark-template}

You can create dynamic watermark templates. These templates remain available as a configuration option for policies that administrators or users create.

>[!NOTE]
>
>Dynamic watermark configuration information is not captured with the other configuration information when you export a configuration file.

1. In administration console, click Services &gt; Document Security &gt; Configuration &gt; Watermarks.
1. Click New.
1. In the Name box, type a name for the new watermark.

   ***note**: You cannot use some special characters in the names or descriptions of watermarks or watermark elements. See the restrictions listed in [Considerations for editing policies](/help/forms/using/admin-help/creating-policies.md#considerations-for-editing-policies).*

1. Under Name, next to the plus sign, enter a meaningful name to the watermark element such as Header, and add a description, and expand the plus sign to display the options.
1. Under Source, select the type of watermark as either Text or PDF.
1. If you selected Text, do the following:

    * Select the watermark types to include. If you select Custom Text, in the adjacent box, type the text to display for the watermark. Keep in mind the text length that will appear as watermark.
    * Specify the text formatting properties such as font name, font size, foreground color, and background color for the text contents of the watermark text. Specify the foreground and background color as hex values.

      ***note**: If you select the scaling option as Fit To Page, the font size property is not available for editing.*

1. If you selected PDF for rich watermark options, Click **Browse** next to Select Watermark PDF to select the PDF document that you want to use as the watermark.

   ***note**: Do not use a password-protected PDF document. If you specify a password-protected PDF as the watermark element, the watermark is not applied.*

1. Under Use As Background, select either Yes or No.

   **note**: Currently, the watermark appears in the foreground irrespective of this setting.

1. To control where the watermark is displayed on the document, configure the Vertical Alignment and Horizontal Alignment options.
1. Either select Fit to Page or select % and type a percentage in the box. The value must be a whole number, not a fraction. To configure the watermark size, you can use a value that is the percentage of the page or set the watermark to fit the size of the page.
1. In the Rotation box, type the degrees by which to rotate the watermark. The range is from -180 to 180. Use a negative value to rotate the watermark counterclockwise. The value must be a whole number, not a fraction.
1. In the Opacity box, type a percentage. Use a whole number, not a fraction.
1. Under Advanced Options, set the following:

   **Page Range Options**

   Set the range of pages where the watermark should be displayed. Enter the start page as 1 and the end page as -1 to have all pages marked with the watermark.

   **Display Options**

   Select where you want to have the watermark appear. By default, the watermark appears both on soft copy (online) and hard copy (print).

1. Click **New** under watermark Elements to add more watermark elements if necessary.
1. Click OK.

### Edit a dynamic watermark template {#edit-a-dynamic-watermark-template}

1. In administration console, click Services &gt; document security &gt; Configuration &gt; Watermarks.
1. Click the appropriate watermark in the list.
1. On the Edit Watermarks page, change the settings as required.
1. Click OK.

### Delete a dynamic watermark template {#delete-a-dynamic-watermark-template}

When you delete a dynamic watermark, it is no longer available to add to a new policy. However, the watermark remains on existing policies that currently use it, and documents that the policy currently protects continue to show the dynamic watermark until you or a user edits the policy that contains the deleted watermark. After the policy is edited, the watermark is no longer applied. A message appears, indicating that the existing watermark is deleted on the policy and the user can select another one to replace it.

1. In administration console, click Services &gt; Document Security &gt; Configuration &gt; Watermarks.
1. Select the check box beside the appropriate watermark and click Delete.
1. Click OK.

## Configuring invited user registration {#configuring-invited-user-registration}

Users who are external to your organization can register with document security. Invited users who register and activate their accounts can log in to document security by using their email address and the password they create when they register. Registered invited users can use policy-protected documents to which they have permissions.

When invited users are activated, they become local users. Local users can be configured and managed by using the Invited and Local Users area. (See [Managing invited and local user accounts](/help/forms/using/admin-help/invited-local-user-accounts.md#managing-invited-and-local-user-accounts).)

Depending on the capabilities that you enable for invited users, they can also use these document security features:

* Apply policies to documents
* Create policies
* Add invited users to policies

Document security automatically generates a registration invitation email when the following events occur unless the user is already in the source LDAP directory or has previously been invited to register:

* An existing user adds an invited user to a policy
* An administrator adds an invited user account on the Invited User Registration page

The registration email contains a link to a Registration page and information about how to register. After the invited user registers, document security issues an activation email with a link to an Activation page. When activated, the account remains valid until you deactivate or delete it.

If you enable built-in registration, you specify your SMTP server, registration email details, access capabilities, and reset password email information only once. Before you enable built-in registration, ensure that you have created a local domain in User Management have assigned the "Document security Invite User" role to the appropriate users and groups in your organization. (See [Add a local domain](/help/forms/using/admin-help/adding-domains.md#add-a-local-domain) and [Creating and configuring roles](/help/forms/using/admin-help/creating-configuring-roles.md#creating-and-configuring-roles).) If you do not use built-in registration, you must have your own user registration system created using the AEM forms SDK. See the help on "Developing SPIs for AEM forms" in [Programming with AEM forms](/help/forms/developing/introducing-java-api-soap-quick.md). If you do not use the Built-in Registration option, it is recommended that you configure a message in the activation email and on the client login screen to notify users about how to contact the administrator for a new password or for other information.

**Enable and configure invited user registration**

By default, the invited user registration process is disabled. You can enable and disable invited user registration for document security, as required.

1. In administration console, click Services &gt; document security &gt; Configuration &gt; Invited User Registration.
1. Select Enable Invited User Registration.
1. (Optional) Update the invited user registration settings as required:

    * [Exclude or include an external user or group](configuring-client-server-options.md#exclude-or-include-an-external-user-or-group)
    * [Server and registration account parameters](configuring-client-server-options.md#server-and-registration-account-parameters)
    * [Registration invitation email settings](configuring-client-server-options.md#registration-invitation-email-settings)
    * [Activation email settings](configuring-client-server-options.md#activation-email-settings)
    * [Configure a password reset email](configuring-client-server-options.md#configure-a-password-reset-email)

1. (Optional) Under Built-in Registration, select Yes to enable this option. If you do not enable built-in registration, you must set up your own user registration system.
1. Click OK.

### Exclude or include an external user or group {#exclude-or-include-an-external-user-or-group}

You can restrict registration with document security for certain external users or user groups. This option is useful, for example, to allow access to a certain user group but exclude specific individuals who are part of the group.

The following settings are in the Email Restriction Filter area of the Invited User Registration page.

**Exclusion:** Type the email address of a user or group to exclude. To exclude multiple users or groups, type each email address on a new line. To exclude all users who belong to a particular domain, enter a wildcard and the domain name. For example, to exclude all users in the example.com domain, enter &ast;.example.com.

**Inclusion:** Type the email address of a user or group to include. To include multiple users or groups, type each email address on a new line. To include all users who belong to a particular domain, enter a wildcard and the domain name. For example, to include all users in the example.com domain, enter &ast;.example.com.

### Server and registration account parameters {#server-and-registration-account-parameters}

The following settings are in the General Settings area of the Invited User Registration page.

**SMTP Host:** The host name of the SMTP server. The SMTP server manages the outgoing email notices to register and activate invited user accounts.

If necessary by your SMTP host, type the required information in the SMTP Server Account Name and SMTP Server Account Password boxes to connect to the SMTP server. Some organizations do not enforce this requirement. If you need information, see your system administrator.

**SMTP server socket class name:** Socket class name for the SMTP server. For example, javax.net.ssl.SSLSocketFactory.

**Email Content Type:** Accepted MIME type like text/plain or text/html.

**Email Encoding:** Encoding format to use when sending email messages. You can specify any encoding, for example, UTF-8 for Unicode or ISO-8859-1 for Latin. The default is UTF-8.

**Redirect Email Address:** When you specify an email address for this setting, any new invitation are sent to the address provided. This setting can be useful for testing purposes.

**Use Local Domains:** Select the appropriate domain. On a new installation, ensure that you created the domain by using User Management. If this is an upgrade, an external user domain was created during the upgrade and can be used.

**Use SSL for SMTP server:** Select this option to enable SSL for the SMTP server.

**Display login link on registration page:** Displays a login link on the registration page displayed for invited users.

**To enable Transport Layer Security (TLS) for the SMTP server**

1. Open the administration console.

   The default location of the Administration console is `https://<server>:<port>/adminui`.

1. Navigate to Home &gt; Services &gt; Document Security &gt; Configuration &gt; Invited User Registration.
1. On the Invited User Registration, specify all the configuration settings and then click OK.

   >[!NOTE]
   >
   >If you are using Microsoft Office 365 as the SMTP server for sending the invitations for user registration, the use the following settings:
   >
   >**SMTP Host:** smtp.office365.com
   >**Port:** 587

1. Next, you need to update the config.xml. See [Configuration to enable SMTP for Transport Layer Security (TLS)](configuring-client-server-options.md#configuration-to-enable-smtp-for-transport-layer-security-tls)

>[!NOTE]
>
>If you make any changes to the Invited User Registration options, the config.xml file is overwritten and TLS is deactivated. If you overwrite the changes, you need to perform the above step to re-active TLS support for Invited User Registration.

### Registration invitation email settings {#registration-invitation-email-settings}

Document security automatically issues a registration invitation email when you create an invited user account or when an existing user adds an external recipient who has not previously registered or been invited to register to a policy. The email contains a link that the recipient can use to access the registration page and enter personal account information, including user name and password. The password can be any combination of eight characters.

When the recipient activates the account, the user becomes a local user.

The following settings are in the Invitation Email Configuration area of the Invited User Registration page.

**From:** The email address from which the invitation email is sent. The default format of the From email address is postmaster@[your_installation_domain].com.

**Subject:** Default subject for the invitation email message.

**Timeout:** The number of days after which the registration invitation expires if the external user does not register. The default value is 30 days.

**Message:** The text that appears in the body of the message inviting the user to register.

### Activation email settings {#activation-email-settings}

After invited users register, document security sends an activation email. The activation email contains a link to the account activation page where the users can activate their account. When the accounts are activated, users can log in to document security by using their email address and the password they created when they registered.

When the recipient activates the user account, the user becomes a local user.

The following settings are in the Activation Email Configuration area of the Invited User Registration page.

>[!NOTE]
>
>It is also recommended that you configure a message on the login screen to advise external users how to contact their administrator for a new password or for other information.

**From:** The email address from which the activation email is sent. This email address receives failed delivery notices from the registrant's email host and also any messages that the recipient sends in reply to the registration email. The default format of the From email address is postmaster@[your_installation_domain].com.

**Subject:** Default subject for the activation email message.

**Timeout:** The number of days after which the activation invitation expires if the user does not activate the account. The default value is 30 days.

**Message:** The text that appears in the body of the message a message indicating that the recipient's user account needs to be activated. You may also want to include information such as how to contact an administrator to obtain a new password.

### Configure a password reset email {#configure-a-password-reset-email}

If you have to reset an invited user's password, a confirmation email is generated that invites the user to choose a new password. A user's password cannot be determined; if the user forgets it, you must reset it.

The following settings are in the Reset Password Email area of the Invited User Registration page.

**From:** The email address from which the password reset email is sent. The default format of the From email address is postmaster@[your_installation_domain].com.

**Subject:** Default subject for the reset email message.

**Message:** The text that appears in the body of the message a message indicating that the recipient's external user password is reset.

## Enable users and groups to create policies {#enable-users-and-groups-to-create-policies}

The Configuration page has a link to the My Policies page, where you specify which end users can create my policies and which users and groups are visible in search results. The My Policies page has two tabs:

**Create Policies tab:** Use to configure user permissions to create custom policies.

**Visible Users and Groups tab:** Use to control which users and groups are visible in user search results. The super user or policy set administrator is required to select and add domains, created in User Management, to the visible user and group for each policy set. This list is visible to the policy set coordinator and is used to put limits on which domains the policy set coordinator can browse when choosing users to add to policies.

Before giving users permission to create custom policies, consider how much access or control you want individual users to have. Additionally, consider how exposed you want your users and groups to be when making them visible to searches.

### Specify users and groups who can create policies {#specify-users-and-groups-who-can-create-policies}

As an administrator, specify which users and groups can create custom policies. This permission can be set at the user and group level. The search functionality searches the User Management database for users and groups.

1. In administration console, click Services &gt; Document Security &gt; Configuration &gt; My Policies.
1. On the My Policies page, click the Create Policies tab and click Add Users and Groups.
1. In the Find box, type the user name or email address of the user or group that you are searching for. If you do not have this information, leave the box empty. You can also type a partial name or email address, such as when you know only the first two letters of a user name.
1. In the Using list, select your search parameters Name or Email.
1. In the Type list, select Group or User to narrow your search.
1. In the In list, select the domain to search. If you do not know the user or group's domain, select All Domains.
1. In the Display list, specify the number of search results to display per page and then click Find.
1. To add My Policies users and groups, select the check box for each user and group to add.
1. Click Add, and then click OK.

Your selected users and groups now have permission to create custom policies.

### Remove the create custom policies permission from a user or group {#remove-the-create-custom-policies-permission-from-a-user-or-group}

1. On the document security page, click Configuration &gt; My Policies.
1. On the My Policies page, click the Create Policies tab. Users and groups with permissions to create custom policies are displayed.
1. Select the check box next to the users and groups to remove from this permission.
1. Click Delete, and then click OK.

### Specify users and groups that are visible in searches {#specify-users-and-groups-that-are-visible-in-searches}

When users are managing their custom policies, they can search for users and groups to add to their policies. Specify the domains from which users and groups are visible in these searches.

1. On the document security page, click Configuration &gt; My Policies.
1. On the My Policies page, click the Visible Users and Groups tab.
1. To make the users and groups in a domain visible, click Add Domains, select the domains, and click Add. To remove a domain, select the checkbox next to the domain name and click Delete.

## Manually editing the document security configuration file {#manually-editing-the-document-security-configuration-file}

You can import and export the configuration information that is stored in the document security database. For example, you may want to make a backup copy of the configuration information when you move from a staging to a production environment, or you may want to edit advanced options that can only be configured be editing this file.

You can make the following changes using the configuration file:

[Display CATIA permissions when creating and editing policies](configuring-client-server-options.md#display-catia-permissions-when-creating-and-editing-policies)

[Specify a timeout period for offline synchronization](configuring-client-server-options.md#specify-a-timeout-period-for-offline-synchronization)

[Denying document security services for specific applications](configuring-client-server-options.md#denying-document-security-services-for-specific-applications)

[Change the watermark configuration parameters](configuring-client-server-options.md#change-the-watermark-configuration-parameters)

[Disabling external links](configuring-client-server-options.md#disabling-external-links)

>[!NOTE]
>
>Importing the configuration file reconfigures your system based on the information in the file. The exceptions are dynamic watermark configuration and custom events information, which are not saved with the exported configuration file. Configure this information manually in your new system. Only a system administrator or a professional services consultant who is familiar with document security and XML should modify the content of a configuration file, such as to reconfigure a corrupted setting or to tune parameters for a particular enterprise deployment scenario.

**Export a configuration file**

1. In administration console, click Services &gt; document security 11 &gt; Configuration &gt; Manual Configuration.
1. Click Export and save the configuration file in another location. The default filename is config.xml.
1. Click OK.
1. Before changing the configuration file, make a backup copy in case you need to revert.

**Import a configuration file**

1. In administration console, click Services &gt; document security 11 &gt; Configuration &gt; Manual Configuration.
1. Click Browse to go to the configuration file and then click Import. You cannot type the path directly in the File Name box.
1. Click OK.

### Specify a timeout period for offline synchronization {#specify-a-timeout-period-for-offline-synchronization}

Document security enables users to open and use protected document when they are not connected to the document security server. The user's client application must regularly synchronize with the server to keep documents valid for offline use. The first time users open a protected document, they are asked whether their computer should be authorized to perform periodic client synchronization.

By default, the synchronization occurs automatically every four hours and as-needed when a user is connected to the document security server. If the offline period for a document expires while the user is offline, the user must reconnect to the server to enable the client application to synchronize with the server.

In the document security configuration file, you can specify the default frequency of the automatic background synchronization. This setting acts as the default timeout period client applications, unless the client explicitly sets its own timeout value.

1. Export the document security configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)
1. Open the configuration file in an editor and locate the `PolicyServer` node. Under that node, locate the `ServerSettings` node.
1. In the `ServerSettings` node, add this following entry and then save the file:

   `<entry key="BackgroundSyncFrequency" value="`*time* `"/>`

   where *time* is the number of seconds between automatic background synchronizations. If you sent this value to `0`, synchronization always occurs. The default value is `14400` seconds (every four hours).

1. Import the configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)

### Denying document security services for specific applications {#denying-document-security-services-for-specific-applications}

You can configure document security to deny services to applications that meet specific criteria. The criteria can specify a single attribute such as a platform name or it can specify multiple sets of attributes. This feature can help you control the requests document security must handle. Here are some applications of this feature:

* **Revenue protection:** You may want to deny access to any client application that does not support your revenue conventions.
* **Application compatibility:** Some application may be incompatible with the policies or behavior of your document security server.

When client applications attempt to establish a link with document security, they supply application, version, and platform information. Document security compares this information against Denials settings it obtains from the document security configuration file.

The Denials settings can contain several sets of denial conditions. If all the attributes of any one set match, the requesting application is denied access to the document security services.

The denial-of-service feature requires that client applications use the document security C++ Client SDK version 8.2 or later. The following Adobe products provide product information when requesting document security services:

* Adobe Acrobat 9.0 Professional/Acrobat 9.0 Standard and later
* Adobe Reader 9.0 and later
* Acrobat Reader DC extensions for Microsoft Office 8.2 and later

Client applications use the Client API from the document security C++ Client SDK to request services from document security. The Client API requests include platform and SDK version information (precompiled into the Client API) and product information obtained from the client application.

Client applications or plug-ins supply product information in their implementation of a callback function. The application provides the following information:

* Integrator name
* Integrator version
* Application family
* Application name
* Application version

If any information is not applicable, the client application leaves the corresponding field blank.

Several Adobe applications include product information when requesting document security services, including Acrobat, Adobe Reader, and Acrobat Reader DC extensions for Microsoft Office.

**Acrobat and Adobe Reader**

When Acrobat or Adobe Reader request a service from document security, it supplies the following product information:

* **Integrator:** Adobe Systems, Inc.
* **Integrator version:** 1.0
* **Application family:** Acrobat
* **Application name:** Acrobat
* **Application version:** 9.0.0

**Acrobat Reader DC extensions for Microsoft Office**

Acrobat Reader DC extensions for Microsoft Office is a plug-in used with the Microsoft Office products Microsoft Word, Microsoft Excel, and Microsoft PowerPoint. When it requests a service, it supplies the following information:

* **Integrator:** Adobe Systems Incorporated
* **Integrator version:** 8.2
* **Application family:** Acrobat Reader DC extensions for Microsoft Office
* **Application name:** Microsoft Word, Microsoft Excel, or Microsoft PowerPoint
* **Application version:** 2003 or 2007

**Configure document security to deny services for specific applications**

1. Export the document security configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)
1. Open the configuration file in an editor and locate the `PolicyServer` node. Add a `ClientVersionRules` node as an immediate child of the `PolicyServer` node, if one does not exist:

   ```xml
    <node name="ClientVersionRules">
        <map>
            <entry key="infoURL" value="URL"/>
        </map>
        <node name="Denials">
            <map/>
            <node name="MyEntryName">
                <map>
                    <entry key="SDKPlatforms" value="platforms"/>
                    <entry key="SDKVersions" value="versions"/>
                    <entry key="AppFamilies" value="families"/>
                    <entry key="AppNames" value="names"/>
                    <entry key="AppVersions" value="versions"/>
                    <entry key="Integrators" value="integrators"/>
                    <entry key="IntegratorVersions" value="versions"/>
                </map>
            </node>
            <node name="MyOtherEntryName"
                <map>
                    [...]
                </map>
            </node>
            [...]
        </node>
    </node>
   ```

   where:

   `SDKPlatforms` specifies the platform hosting the client application. Possible values are:

    * Microsoft Windows
    * Apple OS X
    * Sun Solaris
    * HP-UX

   `SDKVersions` specifies the version of the document security C++ Client API used by the client application. For example, `"8.2"`.

   `APPFamilies` is defined by the Client API.

   `AppName`specifies the name of the client application. Commas are used as name separators. To include a comma in a name, escape it with a backslash (\) character. For example, *"Adobe Systems\, Inc."*.

   `AppVersions` specifies the version of the client application.

   `Integrators` specifies the name of the company or group that developed the plug-in or integrated application.

   `IntegratorVersions` is the version of the plug-in or integrated application.

1. For each additional set of denial data, add another *MyEntryName* element.
1. Save the configuration file.
1. Import the configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)

**Examples**

In this example, all Windows clients are denied access.

```xml
 <node name="ClientVersionRules">
     <map>
         <entry key="infoURL" value="https://www.dont.use/windows.html"/>
     </map>
     <node name="Denials">
         <map/>
         <node name="Entry_1">
             <map>
                 <entry key="SDKPlatforms" value="Microsoft Windows"/>
             </map>
         </node>
     </node>
 </node>
```

In this example, My Application version 3.0 and My Other Application version 2.0 are denied access. The same denials information URL is used regardless of the reason for denial.

```xml
 <node name="ClientVersionRules">
     <map>
         <entry key="infoURL" value="https://get.a.new/version.html"/>
     </map>
     <node name="Denials">
         <map/>
         <node name="FirstDenialSettings">
             <map>
                 <entry key="AppNames" value="My Application"/>
                 <entry key="AppVersions" value="3.0"/>
             </map>
         </node>
         <node name="SecondDenialSettings">
             <map>
                 <entry key="AppNames" value="My Other Application"/>
                 <entry key="AppVersions" value="2.0"/>
             </map>
         </node>
     </node>
 </node>
```

In this example, all requests from a Microsoft PowerPoint 2007 or Microsoft PowerPoint 2010 installation of Acrobat Reader DC extensions for Microsoft Office are denied.

```xml
 <node name="ClientVersionRules">
     <map>
         <entry key="infoURL" value="https://get.a.new/version.html"/>
     </map>
     <node name="Denials">
         <map/>
         <node name="Entry_1">
             <map>
                 <entry key="AppFamilies" value=
     "document security Extension for Microsoft Office"/>
                 <entry key="AppNames" value= "Microsoft PowerPoint"/>
                 <entry key="AppVersions" value="2007,2010"/>
             </map>
         </node>
     </node>
 </node
```

### Change the watermark configuration parameters {#change-the-watermark-configuration-parameters}

By default, you can specify a maximum of five elements in a watermark. Also, the maximum file size of the PDF document that you want to use as watermark is limited to 100KB. You can change these parameters in the config.xml file.

***note**: You should change these parameters with caution.*

1. Export the document security configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)
1. Open the configuration file in an editor and locate the `ServerSettings` node.
1. In the `ServerSettings` node, add the following entries and then save the file: `<entry key="maximumSizeOfWatermarkElement" value="max filesize in KB"/> <entry key="maximumWatermarkElementsPerWatermark" value="max elements"/>`

   The first entry, *max file size* is the maximum file size (in KB) that is allowed for a PDF watermark element. Default is 100KB.

   The second entry, *max elements* is the maximum number of elements that is allowed in a watermark. Default is 5.

   ```xml
   <entry key="maximumSizeOfWatermarkElement" value="max filesize in KB"/>
   <entry key="maximumWatermarkElementsPerWatermark" value="max elements"/>
   ```

1. Import the configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)

### Disabling external links {#disabling-external-links}

Many document security users do not have access to external links such as **www.adobe.com** while they are using the Right Management user interfaces:

* `https://[host]:'port'/adminui`
* `https://[host]:'port'/edc`.

The following changes to the config.xml disables all external links from the Right Management user interfaces.

1. Export the document security configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)
1. Open the configuration file in an editor and locate the `DisplaySettings` node.
1. To disable all external links, in the `DisplaySettings` node, add the following entry and then save the file: `<entry key="ExternalLinksAllowed" value="false"/>`

   ```xml
   <entry key="ExternalLinksAllowed" value="false"/>
   ```

1. Import the configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)

### Configuration to enable SMTP for Transport Layer Security (TLS) {#configuration-to-enable-smtp-for-transport-layer-security-tls}

The following changes to the config.xml enable TLS support for the Invited User Registration feature.

1. Export the document security configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)
1. Open the configuration file in an editor and locate the `DisplaySettings` node.
1. Locate the following node: `<node name="ExternalUser">`

   ```xml
   <node name="ExternalUser">
   ```

1. Set the value of the `SmtpUseTls` key in the `ExternalUser` node to **true**.
1. Set the value of the `SmtpUseSsl` key in the `ExternalUser` node to **false**.
1. Save the `config.xml`.
1. Import the configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)

### Disable SOAP endpoints for Document Security documents {#disable-soap-endpoints-for-document-security-documents}

The following changes to the config.xml todisable SOAP endpoints for document security documents.

1. Export the document security configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)
1. Open the configuration file in an editor and locate the following node: `<node name="DRM">`

   ```xml
   <node name="DRM">
   ```

1. In the DRM node, locate the `entry` node:

   `<entry key="AllowUnencryptedVoucher" value="true"/>`

1. To disable SOAP endpoints for document security documents, set the value attribute to **false**.

   ```xml
   <node name="DRM">
       <map>
           <entry key="AllowUnencryptedVoucher" value="false"/>
       </map>
   </node>
   ```

1. Save the `config.xml`.
1. Import the configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)

### Increasing scalability of the document security server {#increasingscalability}

By default, while synchronizing a document for offline use, along with the information for current document, the document security clients fetch policies, watermarks, licenses and revocation updates information for all the other documents that the user has access to. If these updates and information is not synced with the client, then a document opened in offline mode may still open with older policy, watermark, and revocation information.

You can increase the scalability of the document security server by limiting the information being sent to the client. The reduction in amount of information sent to client results in improved scalability, reduced response time, and better performance of the server. Perform the following steps to increase the scalability:

1. Export the document security configuration file. (See [Manually editing the document security configuration file](configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)
1. Open the configuration file in an editor and locate the ServerSettings node.
1. In the ServerSettings node, set the value of the `DisableGlobalOfflineSynchronizationData`property to `true`.

   `<entry key="DisableGlobalOfflineSynchronizationData" value="true"/>`

   When set to true, the document security server sends information only for the current document and information for rest of the documents (the other documents a user has access to) is not sent to client.

   >[!NOTE]
   >
   >By default, the value of the `DisableGlobalOfflineSynchronizationData`key is set to `false`.

1. Save and import the configuration file. (See [Manually editing the document security configuration file](/help/forms/using/admin-help/configuring-client-server-options.md#manually-editing-the-document-security-configuration-file).)
