---
title: Identity Management
description: Learn about the inner workings of identity management in AEM.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
docset: aem65
exl-id: acb5b235-523e-4c01-9bd2-0cc2049f88e2
solution: Experience Manager, Experience Manager Sites
feature: Administering
role: Admin
---

# Identity Management{#identity-management}

Individual visitors to your website can only be identified when you provide the ability for them to log in. There are various reasons why you may want to provide a login capability:

* [AEM Communities](/help/communities/overview.md)Site visitors are required to sign in to post content to the community.
* [Closed User Groups](/help/sites-administering/cug.md)

  You may need to limit access to your website (or sections of it) to specific visitors.

* [Personalization](/help/sites-administering/personalization.md) Allowing visitors to configure certain aspects of how they access your website.

Log in (and out) functionality is provided by an [account with a **Profile**](#profiles-and-user-accounts), which holds additional information about the registered visitor (user). The actual processes for registration and authorization may differ:

* Self-registration from the website

  A [Community Site](/help/communities/sites-console.md) may be configured to allow visitors to self-register or sign-in with their Facebook or Twitter accounts.

* Request for registration from the website

  For a closed user group you might allow visitors to request registration, but enforce authorization by means of a workflow.

* Register each account from the author environment

  If you have a small number of profiles, which will need authorization anyway, you may decide to register each directly.

To allow visitors to register, a series of components and forms can be used to collect the required identification information, then the additional (often optional) profile information. After they have registered, they should also be able to check and update, the details that they have submitted.

Additional functionality can be configured or developed:

* Configure any reverse replication that is required.
* Allow a user to remove their profile, by developing a form together with a workflow.

>[!NOTE]
>
>The information specified in the profile can also be used to provide the user with targeted content via [Segments](/help/sites-administering/campaign-segmentation.md) and [Campaigns](/help/sites-classic-ui-authoring/classic-personalization-campaigns.md).

## Registration Forms {#registration-forms}

A [form](/help/sites-authoring/default-components.md#form-component) can be used to collect the registration information, then generate the new account and profile.

For example, users can request a new profile, using the Geometrixx page
`http://localhost:4502/content/geometrixx-outdoors/en/user/register.html`

![Sample registration form](assets/registerform.png)

Upon submitting the request, the profile page opens where the user can provide personal details.

![Sample profile page](assets/profilepage.png)

The new account is also visible in the [Users console](/help/sites-administering/security.md).

## Login {#login}

The login component can be used to collect the login information, then activate the login process.

This provides the visitor with the standard fields of **Username** and **Password**, with a **Login** button to activate the login process when the credentials are entered.

For example, users can either log in, or create an account, using the **Sign In** option on the Geometrixx toolbar, which uses the page:

`http://localhost:4502/content/geometrixx-outdoors/en/user/sign-in.html`

![Sample log in page](assets/login.png)

## Logging Out {#logging-out}

As there is a login mechanism, a logout mechanism is also required. This is available as the **Sign Out** option in Geometrixx.

## Viewing and Updating a Profile {#viewing-and-updating-a-profile}

Depending on your registration form the visitor may have registered information in their profile. They should be able to view and/or update this at a later stage. This can be done with a similar form; for example, in Geometrixx:

```
http://localhost:4502/content/geometrixx-outdoors/en/user/profile.html

```

To see the details of your profile click **My Profile** in the top right corner of any page; for example, with the `admin` account:
`http://localhost:4502/home/users/a/admin/profile.form.html/content/geometrixx-outdoors/en/user/profile.html.`

You can view another profile using the [client context](/help/sites-administering/client-context.md) (on the author environment and with sufficient privileges):

1. Open a page; for example, the Geometrixx page:

   `http://localhost:4502/cf#/content/geometrixx/en.html`

1. Click **My Profile** in the top right corner. You will see the profile of your current account; for example, the administrator.
1. Press **control-alt-C** to open the client context.
1. In top left corner of the client context, click the **Load a Profile** button.

   ![Load a Profile icon](do-not-localize/loadprofile.png)

1. Select another profile from the drop-down list in the dialog window; for example, **Alison Parker**.
1. Click **OK**.
1. Click again on **My Profile**. The form will be updated with Alison's details.

   ![Sample profile of Alison](assets/profilealison.png)

1. You can now use **Edit Profile** or **Change Password** to update the details.

## Adding Fields to the Profile Definition {#adding-fields-to-the-profile-definition}

You can add fields to the profile definition. For example, to add a "Favorite Color" field to the Geometrixx profile:

1. From the Websites console navigate to Geometrixx Outdoors Site &gt; English &gt; User &gt;My Profile.
1. Double-click the **My Profile** page to open it for editing.
1. In the **Components** tab of sidekick expand the **Form** section.
1. Drag a **Dropdown List** from sidekick to the form, just below the **About me** field.
1. Double-click the **Dropdown List** component to open the dialog for configuration and enter:

    * **Element Name** - `favoriteColor`
    * **Title** - `Favorite Color`
    * **Items** - Add several colors as items

   Click **OK** to save.

1. Close the page and return to the **Websites** console and activate the My Profile page.

   Next time you view a profile you can select a favorite color:

   ![Alison Parker's favorite color sample field](assets/aparkerfavcolour.png)

   The field will be saved under the **profile** section of the relevant user account:

   ![Alison Parker's data in CRXDE](assets/aparkercrxdelite.png)

## Profile States {#profile-states}

There are several use cases that require knowing whether a user (or rather their profile) is in a *specific state* or not.

This involves defining an appropriate property in the user profile in a way that:

* is visible and accessible to the user
* defines two states for each property
* lets you toggle between the two states defined

This is done with:

* [State Providers](#state-providers)

  To manage the two states of a specific property and the transitions between the two.

* [Workflows](#workflows)

  To manage actions related to the states.

Multiple states can be defined; for example, in Geometrixx these include:

* subscribing (or unsubscribing) to notifications on newsletters or comment threads
* adding and removing a connection to a friend

### State Providers {#state-providers}

A state provider manages the current state of the property in question, together with the transitions between the two possible states.

State providers are implemented as components, so can be customized for your project. In Geometrixx these include:

* Un-/Subscribe Forum Topic
* Add/Remove Friend

### Workflows {#workflows}

State providers manage a profile property and its states.

A workflow is needed to implement the actions related to the states. For example, when subscribing for notifications, the workflow will handle the actual subscription action; when unsubscribing from notifications, the workflow will handle removing the user from the subscription list.

## Profiles and User Accounts {#profiles-and-user-accounts}

Profiles are stored in the Content Repository as part of the[user account](/help/sites-administering/user-group-ac-admin.md).

The profile can be found under `/home/users/geometrixx`:

![Profiles as seen in CRXDE](assets/chlimage_1-138.png)

On a standard installation (author or publish) everyone has read access to the entire profile information of all users. everyone is a "*Built-in group automatically containing all existing users and groups. The list of members cannot be edited*".

These access rights are defined by the following wildcard ACL:

/home everyone allow jcr:read rep:glob = &#42;/profile&#42;

That allows:

* forum, comments or blog posts to display information (such as icon or full name) from the appropriate profile
* links to geometrixx profile pages

If such access is not appropriate for your installation you can change these default settings.

This can be done using the **[Access Control](/help/sites-administering/user-group-ac-admin.md#access-right-management)** tab:

![Managing ACLs in CRXDE](assets/aclmanager.png)

## Profile Components {#profile-components}

A range of profile components are also available for defining the profile requirements for your site.

### Checked Password Field {#checked-password-field}

This component gives you two fields for:

* the input of a password
* a check to confirm that the password has been input correctly.

With default settings the component will appear as follows:

![Check password dialog](assets/dc_profiles_checkedpassword.png)

### Profile Avatar Photo {#profile-avatar-photo}

This component provides the user with a mechanism for selecting and uploading an Avatar Photo file.

![Avatar selector](assets/dc_profiles_avatarphoto.png)

### Profile Detailed Name {#profile-detailed-name}

This component allows the user to input a detailed name.

![Detailed name dialog](assets/dc_profiles_detailedname.png)

### Profile Gender {#profile-gender}

This component allows the user to input their gender.

![Gender selector](assets/dc_profiles_gender.png)
