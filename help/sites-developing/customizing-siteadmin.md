---
title: Customizing the Websites Console (Classic UI)
description: The Websites Administration console can be extended to display custom columns
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
docset: aem65
exl-id: 2b9b4857-821c-4f2f-9ed9-78a1c9f5ac67
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Customizing the Websites Console (Classic UI){#customizing-the-websites-console-classic-ui}

## Adding a Custom Column to the Websites (siteadmin) Console {#adding-a-custom-column-to-the-websites-siteadmin-console}

The Websites Administration console can be extended to display custom columns. The console is built based on a JSON object that can be extended by creating an OSGI service implementing the `ListInfoProvider` interface. Such a service modifies the JSON object that is sent to the client to build the console.

This step-by-step tutorial explains how to display a new column in the Websites Administration console by implementing the `ListInfoProvider` interface. It consists of the following steps:

1. [Creating the OSGI service](#creating-the-osgi-service) and deploying the bundle containing it to the AEM server.
1. (optional) [Testing the new service](#testing-the-new-service) by issuing a JSON call to request the JSON object that is used to build the console.
1. [Displaying the new column](#displaying-the-new-column) by extending the node structure of the console in the repository.

>[!NOTE]
>
>This tutorial can also be used to extend the following administration consoles:
>
>* the Digital Assets console
>* the Community console
>

### Creating the OSGI Service {#creating-the-osgi-service}

The `ListInfoProvider` interface defines two methods:

* `updateListGlobalInfo`, to update global properties of the list,
* `updateListItemInfo`, to update single list item.

The arguments for both methods are:

* `request`, the associated Sling HTTP request object,
* `info`, the JSON object to update, which is respectively the global list or the current list item,
* `resource`, a Sling resource.

The sample implementation is below:

* Adds a *starred* property for each item, which is `true` if the page name starts with an *e*, and `false` otherwise.

* Adds a *starredCount* property, which is global for the list and contains the number of starred list items.

To create the OSGI service:

1. In CRXDE Lite, [create a bundle](/help/sites-developing/developing-with-crxde-lite.md#managing-a-bundle).
1. Add the sample code below.
1. Build the bundle.

The new service is up and running.

```java
package com.test;

import com.day.cq.commons.ListInfoProvider;
import com.day.cq.i18n.I18n;
import com.day.cq.wcm.api.Page;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;

@Component(metatype = false)
@Service(value = ListInfoProvider.class)
public class StarredListInfoProvider implements ListInfoProvider {

    private int count = 0;

    public void updateListGlobalInfo(SlingHttpServletRequest request, JSONObject info, Resource resource) throws JSONException {
        info.put("starredCount", count);
        count = 0; // reset for next execution
    }

    public void updateListItemInfo(SlingHttpServletRequest request, JSONObject info, Resource resource) throws JSONException {
        Page page = resource.adaptTo(Page.class);
        if (page != null) {
            // Consider starred if page name starts with 'e'
            boolean starred = page.getName().startsWith("e");
            if (starred) {
                count++;
            }
            I18n i18n = new I18n(request);
            info.put("starred", starred ? i18n.get("Yes") : i18n.get("No"));
        }
    }

}
```

>[!CAUTION]
>
>* Your implementation should decide, based on the provided request and/or resource, whether it should add the information to the JSON object or not.
>* If your `ListInfoProvider` implementation defines a property that exists in the response object, its value is overwritten by the one you provide.
>
>  You can use [service ranking](https://docs.osgi.org/javadoc/r2/org/osgi/framework/Constants.html#SERVICE_RANKING) to manage the execution order of multiple `ListInfoProvider` implementations.

### Testing the New Service {#testing-the-new-service}

When you open the Websites Administration console and browse through your site, the browser is issuing an Ajax call to get the JSON object that is used to build the console. For example, when you browse to the `/content/geometrixx` folder, the following request is sent to the AEM server to build the console:

[https://localhost:4502/content/geometrixx.pages.json?start=0&limit=30&predicate=siteadmin](https://localhost:4502/content/geometrixx.pages.json?start=0&limit=30&predicate=siteadmin)

To make sure that the new service is running after having deployed the bundle containing it:

1. Point your browser to the following URL:
   [https://localhost:4502/content/geometrixx.pages.json?start=0&limit=30&predicate=siteadmin](https://localhost:4502/content/geometrixx.pages.json?start=0&limit=30&predicate=siteadmin)

1. The response should display the new properties as follows:

![screen_shot_2012-02-13at163046](assets/screen_shot_2012-02-13at163046.png)

### Displaying the New Column {#displaying-the-new-column}

The last step consists in adapting the nodes structure of the Websites Administration console to display the new property for all the Geometrixx pages by overlaying `/libs/wcm/core/content/siteadmin`. Proceed as follows:

1. In CRXDE Lite, create the nodes structure `/apps/wcm/core/content` with nodes of type `sling:Folder` to reflect the structure `/libs/wcm/core/content`.

1. Copy the node `/libs/wcm/core/content/siteadmin` and paste it below `/apps/wcm/core/content`.

1. Copy the node `/apps/wcm/core/content/siteadmin/grid/assets` to `/apps/wcm/core/content/siteadmin/grid/geometrixx` and changes its properties:

    * Remove **pageText**

    * Set **pathRegex** to `/content/geometrixx(/.*)?`
      This makes the grid configuration active for all Geometrixx websites.

    * Set **storeProxySuffix** to `.pages.json`

    * Edit the **storeReaderFields** multivalued property and add the `starred` value.

    * To activate MSM functionality, add the following MSM parameters to the multi-String property **storeReaderFields**:

        * **msm:isSource**
        * **msm:isInBlueprint**
        * **msm:isLiveCopy**

1. Add a `starred` node (of type **nt:unstructured**) below `/apps/wcm/core/content/siteadmin/grid/geometrixx/columns` with the following properties:

    * **dataIndex**: `starred` of type String

    * **header**: `Starred` of type String

    * **xtype**: `gridcolumn` of type String

1. (optional) Drop the columns that you do not want to display at `/apps/wcm/core/content/siteadmin/grid/geometrixx/columns`

1. `/siteadmin` is a vanity path that, as default, points to `/libs/wcm/core/content/siteadmin`.
   To redirect this to your version of siteadmin on `/apps/wcm/core/content/siteadmin`, define the property `sling:vanityOrder` to have a value higher than that defined on `/libs/wcm/core/content/siteadmin`. The default value is 300, so anything higher is suitable.

1. Go to the Websites Administration console and navigate to the Geometrixx site:
   [https://localhost:4502/siteadmin#/content/geometrixx](https://localhost:4502/siteadmin#/content/geometrixx).

1. The new column called **Starred** is available, displaying custom information as follows:

![screen_shot_2012-02-14at104602](assets/screen_shot_2012-02-14at104602.png)

>[!CAUTION]
>
>If multiple grid configurations match the requested path defined by the **pathRegex** property, the first one is used, and not the most specific one, which means that the order of the configurations is important.

### Sample package {#sample-package}

The outcome of this tutorial is available in the [Customizing the Websites Administration Console](https://localhost:4502/crx/packageshare/index.html/content/marketplace/marketplaceProxy.html?packagePath=/content/companies/public/adobe/packages/helper/customizing-siteadmin) package on Package Share.
