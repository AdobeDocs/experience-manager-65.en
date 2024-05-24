---
title: Configuring locations for Forms
description: Learn how to configure location for AEM Form. You can specify the file locations of attribute, the location of the form, the seed PDF file, and the cache location.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_forms
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 0d9eb7fe-28a6-444e-957d-023687158c61
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configuring locations for Forms {#configuring-locations-for-forms}

You can specify the URL, URI, and file locations of attributes such as the web root, the location of the forms to be retrieved, the seed PDF file that is used in PDFForm transformations, and the cache location.

1. In administration console, click Services &gt; Forms.
1. Under Locations, specify the appropriate options. The options are described below.
1. Click Save.

## Locations settings {#locations-settings}

**Base URL:** The base URL where form resources such as images and scripts are located. This value is required for HTML transformations that include HREF references to external dependencies, such as images or scripts. One such script is xfasubset.js, which is required for HTML forms to perform XFA intelligence. This value must be the HTTP equivalent of the content root URI.

>[!NOTE]
>
>Base URL supports only HTTP or repository protocols. It does not support protocols such as file:///. If you need to access a resource such as a custom CSS or digital signature URI, use the appropriate API parameter value to specify the absolute location.

When a dependency path is absolute, the Base URL value is ignored. Otherwise, the dependency path is combined with the base URL.

The default value is an empty string.

The following example points to the same content (using Content Root URI and Base URL):

`(ContentRootURI)/subdir/image1.jpg`

`(BaseURL)/subdir/image1.jpg`

**FS Web Root URI:** The URL of the Forms web application. You can leave this box empty if the Forms web application and the client application are deployed on the same application server; the Forms API web root URL is used.

If the Forms web application and the client application are not deployed to the same application server, provide the URL for the Forms web application in this box, as shown in this example:

`https://<host name>:<port>/FormServer`

Where `host name`and `port` are the server name and port number of the server that is hosting the Forms web application.

The default value is an empty string.

**Web Root URI:** The application’s web root. This value is combined with the sTargetURL parameter (when sTargetURL is provided as relative), specified through the AEM forms SDK, to construct an absolute URL to access application-specific web content.

The default value is an empty string.

**Content Root URI:** The URI or absolute location that forms are retrieved from. This value is combined with the sFormQuery parameter, specified through the API, to construct the absolute path to the form that is retrieved. This value can reference a directory or a web location that is accessible using HTTP.

The default value is an empty string.

**XCI Configuration URI:** The relative or absolute location in which the XCI file used for rendering is found. For a relative value, it is assumed that the XCI file resides in the deployable AEM forms EAR file.

The default value is `com/adobe/formServer/PA/pa.xci`.

**Font Map URI:** The relative or absolute location of the font-mapping file. For a relative value, it is assumed that this file resides in the deployable AEM forms EAR file.

The font-mapping file is used to create custom font mappings for HTML transformations in forms, therefore allowing you to specify which font will be substituted when a font is not available on the client’s computer.

The default value is `com/adobe/formServer/client-font-map.properties`.

The following entry is an example of an entry in the font-mapping file:

`Arial=Arial,Helvetica,sans-serif`

**Seed PDF File:** The initial PDF file that is used in a PDFForm transformation to optimize delivery. The seed PDF file specifies a customized PDF file (containing only XFA stream, image, and font resources) that is appended with the form design and data. The form is rendered by Acrobat 7 or later and applies to PDFForm transformation.

The default value is an empty string.

**Cache Location:** Specifies the location of the Forms disk cache. When you change this setting, all existing cache information from the current location is reset and a new cache is created at the new location. Select one of the following options:

**Default Location:** This is the default selection. When this option is selected, the cache is created at a location that is dependent on the application server you are using:

* **JBoss:** [JBoss Home]\server\[install type]\svcdata\FormServer\Cache
* **WebLogic:** [WebLogic Home]\user_projects\domains\[aem-forms Domain Name]\adobe\[Forms Server name]\FormServer\Cache
* **WebSphere:** [IBM Home]\WebSphere\AppServer\installedApps\adobe\server1\FormServer\Cache

**LC Temp Directory:** The cache is created in a subdirectory of the AEM forms temp directory, which is specified in the administration console under Settings > Core System Settings > Configurations > Location of Temp Directory. The subdirectory is named adobeform_[servername].

>[!NOTE]
>
>If you are using a temp cleaning utility, while deleting these directories does not affect functionality, it can significantly impact performance for a short time until the new cache is created. To avoid this issue, do not delete these directories while clearing the AEM forms temp directory.
