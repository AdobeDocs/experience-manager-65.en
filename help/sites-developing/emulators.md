---
title: Emulators

description: AEM enables authors to view a page in an emulator that simulates the environment in which an end-user will view the page


contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: mobile-web
content-type: reference

legacypath: /content/docs/en/aem/6-0/develop/mobile/emulators
exl-id: 009b7e2c-ac37-4acc-a656-0a34d3853dfd
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Emulators{#emulators}

{{ue-over-mobile}}

Adobe Experience Manager (AEM) enables authors to view a page in an emulator that simulates the environment in which an end-user will view the page, as for example, on a mobile device or in an email client.

The AEM emulator framework:

* Provides content authoring within a simulated User Interface (UI), for example, a mobile device or an email client (used to author newsletters).
* Adapts the page content according to the simulated UI.
* Allows the creation of custom emulators.

>[!CAUTION]
>
>This feature is supported only in Classic UI.

## Emulators Characteristics {#emulators-characteristics}

An emulator:

* Is based on ExtJS.
* Operates on the page DOM.
* Its appearance is regulated via CSS.
* Supports plugins (for example, the mobile device rotation plugin).
* Is only active on author.
* Its base component is at `/libs/wcm/emulator/components/base`.

### How the Emulator Transforms the Content {#how-the-emulator-transforms-the-content}

The emulator works by wrapping the HTML body contents into emulator DIVs. For example, the following html code:

```xml
<body>
<div id="wrapper" class="page mobilecontentpage ">
    <div class="topnav mobiletopnav">
    ...
    </div>
    ...
</div>
</body>
```

is transformed into the following html code after the start of the emulator:

```xml
<body>
 <div id="cq-emulator-toolbar">
 ...
 </div>
 <div id="cq-emulator-wrapper">
  <div id="cq-emulator-device">
   <div class=" android vertical" id="cq-emulator">
    ...
    <div class=" android vertical" id="cq-emulator-content">
     ...
     <div id="wrapper" class="page mobilecontentpage">
     ...
     </div>
     ...
    </div>
   </div>
  </div>
 </div>
 ...
</body>
```

Two div tags have been added:

* the div with id `cq-emulator` holding the emulator as a whole and

* the div with id `cq-emulator-content` representing the device's viewport/screen/content area where the page content resides.

New CSS classes are also assigned to the new emulator divs: they represent the name of the current emulator.

Plugins of an emulator may further extend the list of assigned CSS classes, as in the example of the rotation plugin, inserting a "vertical" or "horizontal" class depending on the current device rotation.

This way, the complete appearance of the emulator can be controlled by having CSS classes corresponding to the IDs and CSS classes of the emulator divs.

>[!NOTE]
>
>It is recommended that the project HTML wraps the body content in a single div, just like in the example above. If the body content contains multiple tags there may be unpredictable results.

### Mobile Emulators {#mobile-emulators}

The existing mobile emulators:

* Are below /libs/wcm/mobile/components/emulators.
* Are available via the JSON servlet at:

  http://localhost:4502/bin/wcm/mobile/emulators.json

When the page component relies on the mobile page component ( `/libs/wcm/mobile/components/page`), the emulator functionality is automatically integrated in the page through the following mechanism:

* The mobile page component `head.jsp` includes the device group's associated emulator init component (only in author mode) and the device group's rendering CSS through:

  `deviceGroup.drawHead(pageContext);`

* The method `DeviceGroup.drawHead(pageContext)` includes the emulator's init component, that is, calls the `init.html.jsp` of the emulator component. If the emulator component does not have its own `init.html.jsp` and relies on the mobile base emulator ( `wcm/mobile/components/emulators/base)`, the init script of the mobile base emulator is called ( `/libs/wcm/mobile/components/emulators/base/init.html.jsp`).

* The init script of the mobile base emulator defines through JavaScript:

    * The configuration for all the emulators that are defined for the page (emulatorConfigs)
    * The emulator manager which integrates the emulator's functionality in the page through:

      `emulatorMgr.launch(config)`;

      The emulator manager is defined by:

      `/libs/wcm/emulator/widgets/source/EmulatorManager.js`

#### Creating a Custom Mobile Emulator {#creating-a-custom-mobile-emulator}

To create a custom mobile emulator:

1. Below `/apps/myapp/components/emulators` create the component `myemulator` (node type: `cq:Component`).

1. Set the `sling:resourceSuperType` property to `/libs/wcm/mobile/components/emulators/base`

1. Define a CSS client library with category `cq.wcm.mobile.emulator` for the emulator appearance: name = `css`, node type = `cq:ClientLibrary`

   As an example, you can refer to the node `/libs/wcm/mobile/components/emulators/iPhone/css`

1. If needed, define a JS client library, for example, to define a specific plugin: name = js, node type = cq:ClientLibrary

   As an example, you can refer to the node `/libs/wcm/mobile/components/emulators/base/js`

1. If the emulator supports specific functionalities defined by plugins (like touch scrolling), create a configuration node below the emulator: name = `cq:emulatorConfig`, node type = `nt:unstructured` and add the property that defines the plugin:

   * Name = `canRotate`, Type = `Boolean`, Value = `true`: to include the rotation functionality.

   * Name = `touchScrolling`, Type = `Boolean`, Value = `true`: to include the touch scrolling functionality.

   More functionalities can be added by defining your own plugins.
