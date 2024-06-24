---
title: Creating a custom profile for HTML5 forms
description: A HTML5 forms profile is a resource node in Apache Sling. It represents a customized version of HTML5 forms Render service.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 9cd22244-9aa6-4b5f-96cf-c9cb3d6f9c8a
feature: "HTML5 Forms,Mobile Forms"
exl-id: cf86c810-c466-4894-acc2-d4faf49754cc
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Creating a custom profile for HTML5 forms {#creating-a-custom-profile-for-html-forms}

A profile is a resource node in [Apache Sling](https://sling.apache.org/). It represents custom version of HTML5 forms rendition service. You can use the HTML5 forms Rendition service to customize appearance, behavior, and interactions of the HTML5 forms. A profile node exists in the `/content` folder in the JCR repository. You can place the node directly under the `/content` folder or any subfolder of the `/content` folder.

The profile node has the **sling:resourceSuperType** property and the default value is **xfaforms/profile**. The render script for the node is at /libs/xfaforms/profile.

The Sling scripts are JSP scripts. These JSP scripts serve as containers for putting together the HTML for requested form and the required JS / CSS artifacts. These Sling scripts are also referred as **Profile Renderer scripts**. The profile renderer calls the Forms OSGi service to render the requested form.

The profile script is in html.jsp and html.POST.jsp for GET and POST requests. You can copy and modify one or more files to override and add your customizations. Do not make any in-place changes, the patch update overwrites such changes.

A profile contains various modules. The modules are formRuntime.jsp, config.jsp, toolbar.jsp, formBody.jsp, nav_footer.jsp, and footer.jsp.

## formRuntime.jsp {#formruntime-jsp-br}

The formRuntime.jsp modules contains references of the client libraries. It also depicts methods to extract locale information from the request and include the localized messages in the request. You can include own customJavaScript libs or styles in the formRuntime.jsp.

## config.jsp {#config-jsp}

The config.jsp module contains various configurations such as logging, proxy services, and behavior version. You can add your own configuration and widget customization to the config.jsp module. You can also add configurations such as custom widget registration to the config.jsp module.

## toolbar.jsp {#toolbar-jsp}

The toolbar.jsp contains code to create colored toolbar. To remove the toolbar, remove toolbar.jsp from the HTML.jsp

## formBody.jsp {#formbody-jsp}

The formBody.jsp module is for the HTML representation of the XFA form.

## nav_footer.jsp {#nav-footer-jsp}

At first, the HTML5 form renders only the first page of the form. When a user scrolls the form, then the rest of the forms is loaded. It makes the loading experience faster. The nav_footer.jsp component contains all the styles and required elements to facilitate loading of the pages on scroll.

## footer.jsp {#footer-jsp}

The footer.jsp module is an empty. It lets you add scripts that are used only for user interaction.

## Creating Custom Profiles {#creating-custom-profiles}

To create a custom profile, perform the following steps:

### Create Profile Node {#create-profile-node}

1. Navigate to the CRX DE interface at the URL: `https://'[server]:[port]'/crx/de` and log in to the interface with administrator credentials.

1. In the left pane, navigate to the location */content/xfaforms/profiles*.

1. Copy the node default, and paste the node in different folder (*/content/profiles*) with name *hrform*.

1. Select the new node, *hrform*, and add a string property: *sling:resourceType* with value: *hrform/demo*.

1. Click Save All in toolbar menu to save the changes.

### Create the profile renderer script {#create-the-profile-renderer-script}

After creating a custom profile, add render information to this profile. On receiving a request for the new profile, CRX verifies the existence of the /apps folder for the JSP page to be rendered. Create the JSP page in the /apps folder.

1. In the left pane, navigate to the `/apps` folder.
1. Right-click the `/apps` folder and choose to create a folder with name **hrform**.
1. Insider the **hrform** folder create a folder named **demo**.
1. Click the **Save All** button.
1. Navigate to `/libs/xfaforms/profile/html.jsp` and copy the node **html.jsp**.
1. Paste **html.jsp** node into the `/apps/hrform/demo` folder created above with same name **html.jsp** and click **Save**.
1. If you have any other components of profile script, follow step 1-6 to copy the components in /apps/hrform/demo folder.

1. To verify that th profile is created, open URL `https://'[server]:[port]'/content/xfaforms/profiles/hrform.html`

To verify your forms, [Import your forms](/help/forms/using/get-xdp-pdf-documents-aem.md) from your local file system to AEM Forms and [preview the form](/help/forms/using/previewing-forms.md) on AEM server author instance.
