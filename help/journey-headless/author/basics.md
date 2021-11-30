---
title: Learn Authoring Basics
description: Learn about the concepts and mechanics of authoring content for your Headless CMS using Content Fragments.
index: yes
hide: no
hidefromtoc: no
exl-id: 3eca973f-b210-41bb-98da-ecbd2bae9803
---
# Authoring Basics for Headless with AEM {#author-headless-basics}

## The Story so Far {#story-so-far}

At the beginning of the [AEM Headless Content Author Journey](overview.md) the [Introduction](introduction.md) covered the basic concepts and terminology relevant to authoring for headless.

This article builds on these so you understand how to author your own content for your AEM headless project.

## Objective {#objective}

* **Audience**: Beginner
* **Objective**: Introduce the basics of Headless CMS Authoring:
  * Introduction to authoring with AEMaaCS
  * Introduction to Content Fragments

## Basic Handling {#basic-handling}

Before you get to grips with Content Fragments, here is a (very) quick introduction to using AEM....but nothing really replaces the experience of signing in and trying to use the system.

### Author and Publish {#author-preview-publish}

An AEM installation generally consists of at least two environments:

* Author
* Publish

You log into, and use the author environment to generate your content. When ready you then publish your content so that it becomes generally available. For headless this would be to other applications, for web pages this would be to readers on the web.

For more details see the Authoring Concepts.

### Signing In {#signing-in}

As with most systems you will need to login. As an author you will be provided with:

* User (account) name
* Password
* Link to access the login screen

Your account will have been configured with any privileges that you need. If you have any issues, we recommend that you contact your in-house project support team.

### Navigation {#navigation}

The first time you log in a small online tutorial will highlight some of the main features of the user interface.

You can then use the Navigation Panel to access key areas of AEM. For Content Fragments you will be using the **Assets Console**. 

The Navigation Panel can be opened by selecting Adobe icon at the top left, followed by the small compass icon:

![Navigation panel](/help/journey-headless/author/assets/headless-journey-author-navigation-01.png)

>[!NOTE]
>Although Content Fragments are a feature of AEM **Sites**, they are found in the **Assets** console. This is a technical detail that should not affect you, but might be useful to know.

Within the console you can select folders to navigate to your Content Fragment, or the breadcrumbs (in the header) to navigate back up the tree.

![Breadcrumbs](/help/journey-headless/author/assets/headless-journey-author-navigation-02.png)

### Actions, Selecting, Viewing {#actions-selecting-viewing}

The **Assets** console has dedicated **Action Toolbars**, and **Quick Actions** that you can use after selecting a resource (for example, a folder or content fragment).

The Quick Actions are available for a single resource, see **Basel** in the example below:

![Quick Actions](/help/journey-headless/author/assets/headless-journey-author-navigation-05.png)

The Actions Toolbar provides access to the full range of actions - applicable for the current scenario. The actions available can change; for example, dependent on your location, or whether you have selected multiple resources:

![Action Toolbar](/help/journey-headless/author/assets/headless-journey-author-navigation-06.png)

You can select the format for viewing your resources with the View Selector:

![View Selector](/help/journey-headless/author/assets/headless-journey-author-navigation-03.png)

You can view additional information about items using the Rail Selector. This also gives access to additional actions.

![Left Rail](/help/journey-headless/author/assets/headless-journey-author-navigation-04.png)

## Authoring Content Fragments {#authoring-content-fragments}

So, that was a very quick introduction to the AEM User Interface (UI), but hopefully you've had a chance to try it out. Now we get down to your real interest - Content Fragments for Headless.

We'll have to go through things from start to finish, but your instance might already have folders and/or fragments created, and these might be in different locations. The principles are the same.

### Organizing and Navigating {#organizing-and-navigating}

Unless you have very few Content Fragments you will want to organize them - so that you (and others) can find them again.

#### Creating a Folder {#creating-folder}

You can do this by creating a series of folders within **Files** section of the Assets console. Select the **Create** option (top right), followed by **Folder**:

![Create Folder option](/help/journey-headless/author/assets/headless-journey-author-folder-01.png)

A dialog will open where you can enter the details, then confirm with **Create**:

![Create Folder dialog](/help/journey-headless/author/assets/headless-journey-author-folder-02.png)

#### Using Paths and Tags to limit Content Fragment Models available in the Folder {#tags-paths-for-models-in-folder}

This section is slightly more advanced. You don't really need it if you're just starting out and trying things, but it is *very* useful when you have a lot of fragments. So it's good to know about - even if you don't use it quite yet.

Your Content Architect will have created all the Content Fragment Models required for your current project, and maybe some other projects too. To help keep things simple for yourself, and other authors, you can limit the list of models available for a specific folder.

After creating your folder you can open the folder **Properties**. Here there are various tabs with information, and configuration details, about the folder. In particular for Content Fragments, you can use the **Policies** tab to define specific paths and/or tags for this folder. This limits the Content Fragment Models available for use in the folder as it means that Content Fragment Models must meet these requirements before they can be used to generate fragments in this folder.

![Create Folder Properties - Policies](/help/journey-headless/author/assets/headless-journey-author-folder-04.png)

>[!NOTE]
>
>You can read further details under Content Fragment Models - Allowing Content Fragment Models on your Assets Folder.

You then navigate through these folders to create, and edit your Content Fragments.

#### Just in case - Folder Cloud Services Configuration {#cloud-services-folder}

Just in case...

You will probably be given an initial folder where you can create your folders. This is as some configuration details must be applied (usually by a Developer or System Administrator) to the root folder. This probably won't interest you, but if necessary you can check the **Configuration** in the **Cloud Services** of the folder **Properties**:

![Create Folder Properties - Configuration](/help/journey-headless/author/assets/headless-journey-author-folder-03.png)

>[!NOTE]
>
>You can read more under Apply the Configuration to your Assets Folder. 

### Creating a Content Fragment {#creating-fragment}

Creating a Content Fragment is very similar - you just use the **Content Fragment** option instead:

![Create Content Fragment option](/help/journey-headless/author/assets/headless-journey-author-content-fragment-01.png)

This time a wizard opens. The first step is to select the Content Fragment Model that your fragment will be based on:

![Create Content Fragment - select Model](/help/journey-headless/author/assets/headless-journey-author-content-fragment-02.png)

After continuing with **Next** you can supply the details (**Basic** and **Advanced**) for your fragment:

![Create Content Fragment - provide Name](/help/journey-headless/author/assets/headless-journey-author-content-fragment-03.png)

Confirm with **Create** and you can then **Open** your fragment in the editor.

### Editing a Fragment {#editing-fragment}

You can open a fragment immediately after creating it, or by selecting it from the Assets console.

When the editor first opens you'll see:

* A list of icons at the left side - this gives you access to various areas of functionality. The editor opens in the **Variations** tab, this is where most of the editing happens. You might also be interested in the **Annotations** and **Metadata** tabs.

* A header with information about the fragment, and access to various actions.

* The main editing area - this depends on the model used to create your fragment.

As examples:

* A fragment that only requires multiple pieces of information, some with a specific type. For headless content, references are key, you'll learn about these later in your journey.
  
  ![Content Fragment Editor - My Fragment](/help/journey-headless/author/assets/headless-journey-author-content-fragment-04.png)

* A fragment that allows you to write a long section of text. Here there are additional options for managing, and formatting the text. You can even open the individual text fields in a full screen editor (using the small screen-like icon at the right)
  
  ![Content Fragment Editor - Alaska Spirits](/help/journey-headless/author/assets/headless-journey-author-content-fragment-05.png)

>[!NOTE]
>
>Project specific documentation might be required to help authors with details of how to successfully complete some fields. 
>
>See Content Fragments Models - Data Types and Properties for generic details.

Confirm your updates with either **Save** or **Save & close**.

>[!NOTE]
>
>For more details you can read Variations - Authoring Content Fragments.

#### What you (probably) don't need to worry about {#what-you-probably-do-not-need-to-worry-about}

OK, this might seem a slightly strange section, but once you open the Content Fragment Editor and start exploring you'll see various options that (probably) do not apply for your headless journey as a Content Author. So this is just a quick heads-up on what you should be able ignore in the headless context:

* **Content Fragment Models**

  You will see the name of the Content Fragment Model at the top of the editor - directly under the fragment name. This is also a link that takes you to the model editor.
  Content Fragment Models are actually vital to your Content Fragments as they define the structure that you use. However, creating and editing them is (usually) the responsibility of another persona, the Content Architect. 

  >[!NOTE]
  >
  >If you want to learn more, you can read the AEM Headless Content Architect Journey.

* **Associated Content**

  This one is quite obvious as it's a tab in the editor.

  Content Fragments have been available in AEM for quite a few versions. Originally they were made available for "traditional" use when authoring pages....and they are still used in this context. This can involve associating assets (for example images) that although not embedded in the fragment, needs to be available to the author when authoring a page.

* **Preview**

  This is another tab in the editor and provides a technical view, primarily intended for developers.

* **Update page references**

  This action is available from the **...** (ellipses) drop down. It is not interesting for headless authors as it relates to page authoring.

### Publishing {#publishing}

<!-- needs more details -->

Once you have completed your fragment you can **Publish** it so that it is available to the headless applications.

The publish actions are available in the editor (or from the toolbar of the **Assets** console):

![Content Fragment Editor - My Fragment](/help/journey-headless/author/assets/headless-journey-author-content-fragment-06.png)

## What's Next {#whats-next}

Now that you have learned the basics, the next step is to [Learn how about References](references.md). This will introduce and discuss the various references available, and how to create levels of structure with the Fragment References - a key part of authoring for headless.

## Additional Resources {#additional-resources}

* [Authoring Concepts](/help/sites-cloud/authoring/getting-started/concepts.md)

* [Basic Handling](/help/sites-cloud/authoring/getting-started/basic-handling.md) - this page is primarily based on the **Sites** console, but many/most features are also relevant for authoring **Content Fragments** under the **Assets** console.

  * [Navigation Panel](/help/sites-cloud/authoring/getting-started/basic-handling.md#navigation-panel)

  * [The Header](/help/sites-cloud/authoring/getting-started/basic-handling.md#the-header)
  
  * [Action Toolbar](/help/sites-cloud/authoring/getting-started/basic-handling.md#actions-toolbar)

  * [Quick Actions](/help/sites-cloud/authoring/getting-started/basic-handling.md#quick-actions)
  
  * [Viewing and Selecting Resources](/help/sites-cloud/authoring/getting-started/basic-handling.md#viewing-and-selecting-resources)
  
  * [Rail Selector](/help/sites-cloud/authoring/getting-started/basic-handling.md#rail-selector)

* [Working with Content Fragments](/help/assets/content-fragments/content-fragments.md)
 
  * [Managing Content Fragments](/help/assets/content-fragments/content-fragments-managing.md)

    * [Apply the Configuration to your Assets Folder](/help/assets/content-fragments/content-fragments-configuration-browser.md#apply-the-configuration-to-your-assets-folder)
  
    * [Creating a Content Fragment](/help/assets/content-fragments/content-fragments-managing.md#creating-a-content-fragment)
  
  * [Variations - Authoring Content Fragments](/help/assets/content-fragments/content-fragments-variations.md)

  * [Content Fragment Models](/help/assets/content-fragments/content-fragments-models.md)

    * [Content Fragment Models - Data Types](/help/assets/content-fragments/content-fragments-models.md#data-types)
  
    * [Content Fragment Models - Properties](/help/assets/content-fragments/content-fragments-models.md#properties)

    *  [Content Fragment Models - Allowing Content Fragment Models on your Assets Folder](/help/assets/content-fragments/content-fragments-models.md#allowing-content-fragment-models-assets-folder)

* Getting Started Guides
  * [Creating an Assets Folder Headless Quick Start Guide](/help/implementing/developing/headless/getting-started/create-assets-folder.md)

* AEM Headless Content Architect Journey

* AEM Headless Translation Journey
