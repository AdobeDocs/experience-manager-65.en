---
title: The RemotePage Component
description: The RemotePage Component is a custom page component for editing remote React SPA within AEM.
---
# The RemotePage Component {#remote-page-component}

When deciding [what level of integration](/help/implementing/developing/headful-headless.md) you would like to have between your external SPA and AEM, it is often clear that you need to be able to view and edit the SPA within AEM. The RemotePage Component is a custom page component just for this purpose.

## Overview {#overview}

The RemotePage component fetches all the necessary assets from the application's generated `asset-manifest.json` and uses this for rendering the SPA within AEM.

* The RemotePage allows you to inject the scripts and stylesheets of a SPA in the body of an AEM Page component.
* The Virtual Frontend Components allows to mark sections as editable in AEM SPA Editor.
* Together, a SPA hosted on a different domain can be made editable in AEM.

See the article [Editing an External SPA within AEM](editing-external-spa.md) for more details on editable, external SPAs in AEM.

## Requirements {#requirements}

* Enable CORS in development
* Configure remote URL in Page Properties
* Render the SPA in AEM

## Limitations {#limitations}

* The current implementation of the RemotePage component supports remote React applications only.
* Internal CSS defined in the application's root HTML file as well as inline CSS on the root DOM node will not be available when doing remote rendering in AEM.

## Technical Details {#technical-details}

Like the rest of the AEM SPA project, the RemotePage Component is open source. For the full technical details of the RemotePage Component, [please see the GitHub repository.](https://github.com/adobe/aem-spa-project-core/tree/master/ui.apps/src/main/content/jcr_root/apps/spa-project-core/components/remotepage)
