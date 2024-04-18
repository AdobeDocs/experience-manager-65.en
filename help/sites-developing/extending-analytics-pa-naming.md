---
title: Implementing Server-Side Page Naming for Analytics

description: Adobe Analytics uses the s.pageName property to uniquely identify pages and to associate the data that is collected for the pages


contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference

exl-id: 17a4e4dc-804e-44a9-9942-c37dbfc8016f
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Implementing Server-Side Page Naming for Analytics{#implementing-server-side-page-naming-for-analytics}

Adobe Analytics uses the `s.pageName` property to uniquely identify pages and to associate the data that is collected for the pages. Typically, you perform the following tasks in AEM to assign a value to this property that AEM sends to Analytics:

* Use the Analytics cloud service framework to map a CQ variable to the Analytics `s.pageName` property. (See [Mapping Component Data with Adobe Analytics Properties](/help/sites-administering/adobeanalytics-mapping.md).)

* Design the page component so that it includes the CQ variable that you map to the `s.pageName` property. (See [Implementing Adobe Analytics Tracking for Custom Components](/help/sites-developing/extending-analytics-components.md).)

To expose Analytics report data in the Sites console and in Content Insight, AEM requires the value of the `s.pageName` property for each page. The AEM Analytics Java API defines the `AnalyticsPageNameProvider` interface that you implement to provide the Sites console and Content Insights with the value of the `s.pageName` property. Your `AnaltyicsPageNameProvider` service resolves the pageName property on the server for reporting purposes, as it can be dynamically set using JavaScript on the client for tracking purposes.

## The Default Analytics Page Name Provider Service {#the-default-analytics-page-name-provider-service}

The `DefaultPageNameProvider` service is the default service that determines the value of the `s.pageName` property to use for retrieving Analytics data for a page. The service works in conjunction with the AEM foundation page component ( `/libs/foundation/components/page`). This page component defines the following CQ variables that are meant to be mapped to the `s.pageName` property:

* `pagedata.path`: The value is set to the page path.
* `pagedata.title`: The value is set to the page title.
* `pagedata.navTitle`: The value is set to the page navigation title.

The `DefaultPageNameProvider` service determines which of these CQ variables is mapped to the `s.pageName` property in the Analytics cloud service framework. The service then determines the appropriate page property to use for retrieving analytics report data:

* `pagedata.path`: The service uses `page.getPath()`

* `pagedata.title`: The service uses `page.getTitle()`

* `pagedata.navTitle`: The service uses `page.getNavigationTitle()`

The `page` object is the is the [ `com.day.cq.wcm.api.Page`](https://helpx.adobe.com/experience-manager/6-3/sites-developing/reference-materials/javadoc/com/day/cq/wcm/api/Page.html) Java object for the page.

If you do not map a CQ variable to the `s.pageName` property in the framework, the value for `s.pageName` is generated from the page path. For example, the page with the path `/content/geometrixx/en` uses the value `content:geometrixx:en` for `s.pageName`.

>[!NOTE]
>
>The DefaultPageNameProvider service uses a service ranking of 100.

## Maintaining Continuity in Analytics Reporting {#maintaining-continuity-in-analytics-reporting}

Maintaining a complete history of analytics data for a page requires that the value of the s.pageName property that is used for a page never changes. However, the analtyics properties that the foundation page component defines can be easily changed. For example, moving a page changes the value of `pagedata.path` and breaks the continuity of the reporting history:

* Data that was collected for the previous path is no longer associated with the page.
* If a different page uses the path that another page once used, the different page inherits the data for that path.

To ensure reporting continuity, the value of `s.pageName` should have the following characteristics:

* Unique.
* Stable.
* Human-readable.

For example, a custom pag component can include a page property that authors use to specify a unique ID for the page that is used as the value for the `s.pageProperties` property:

* The page includes an analytics variable that is set to the value of the unique ID that is stored in the page property.
* The analytics variable is mapped to the `s.pageProperties` property in the Analytics framework.
* Your implementation of the AnalytcsPageNameProvider interface retrieves the value of the page property to use for querying the page Analytics data.

>[!NOTE]
>
>Ask your Analytics consultant for help in developing an effective strategy for your `s.pageName` value.

### Implementing an Analytics Page Name Provider Service {#implementing-an-analytics-page-name-provider-service}

Implement the `com.day.cq.analytics.sitecatalyst.AnalyticsPageNameProvider` interface as an OSGi service to customize the logic that retrieves the `s.pageName` property value. The Sites page analytics and Content Insight use the service to retrieve report data from Analytics.

The AnalyticsPageNameProvider interface defines two methods that you must implement:

* `getPageName`: Returns a `String` value that represents the value to use as the `s.pageName` property.

* `getResource`: Returns an `org.apache.sling.api.resource.Resource` object that represents the page that is associated with the `s.pageName` property.

Both methods take a `com.day.cq.analytics.sitecatalyst.AnalyticsPageNameContext` object as a parameter. The `AnalyticsPageNameContext` class provides information about the context of the analytics calls:

* The base path of the page resource.
* The `Framework` object for the Analytics cloud service configuration.
* The `Resource` object for the page.
* The `ResourceResolver` object for the page.

The class also provides a setter for the page name.

### Example AnalyticsPageNameProvider Implementation {#example-analyticspagenameprovider-implementation}

The following example `AnalyticsPageNameProvider` implementation supports a custom page component:

* The component extends the foundation page component.
* The dialog box includes a field that authors use to specify the value of the `s.pageName` property.
* The property value is stored in the pageName property of the `jcr:content`node of the page instances.
* The analytics property that stores the `s.pageName` property is called `pagedata.pagename`. This property is mapped to the `s.pageName` property in the Analytics framework.

The following implementation of the `getPageName` method returns the value of the pageName node property if the framework mapping is configured correctly:

```java
public String getPageName(AnalyticsPageNameContext context) {
        String pageName = null;

        Framework framework = context.getFramework();
        Resource resource = context.getResource();

        if (resource != null && framework != null && framework.mapsSCVariable(S_PAGE_NAME)) {
            String cqVar = framework.getMapping(S_PAGE_NAME);
            Page page = resource.adaptTo(Page.class);
            if (cqVar.equals("pagedata.pagename")) {
                pageName = page.getProperties().get("pageName",null);
            }
        }
        return pageName;
    }
```

The following implementation of the getResource method returns the Resource object for the page:

```java
     public Resource getResource(AnalyticsPageNameContext context) {
        Resource res = null;

        Framework framework = context.getFramework();
        ResourceResolver resolver = context.getResourceResolver();
        String pageName = context.getPageName();
        String basePath = context.getBasePath();

        if (pageName != null && basePath != null && resolver != null
                && framework != null && framework.mapsSCVariable(S_PAGE_NAME)) {
            String cqVar = framework.getMapping(S_PAGE_NAME);
            if (cqVar.equals("pagedata.pagename")) {
             Iterator<Resource>
             hits = resolver.findResources(createQuery(pageName, basePath, "pagename"), Query.JCR_SQL2);
             if (hits.hasNext()) {
              res = hits.next();
              res = res.getParent();
             }
            }
        }
        return res;
    }

    private String createQuery(String pageName, String basePath, String propName) {
        return "SELECT * FROM [cq:PageContent] WHERE ISDESCENDANTNODE(["
                + basePath + "]) and [" + propName + "] = \"" + pageName + "\"";
    }
```

The following code represents the entire class, including SCR annotations that configure the service. The service ranking is 200 which overrides the default service.

```java
/*************************************************************************
 *
 * ADOBE CONFIDENTIAL
 * __________________
 *
 * Copyright 2019 Adobe Systems Incorporated
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains
 * the property of Adobe Systems Incorporated and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to Adobe Systems Incorporated and its
 * suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from Adobe Systems Incorporated.
 **************************************************************************/
package com.day.cq.analytics.sitecatalyst;

import java.util.Iterator;

import javax.jcr.query.Query;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.osgi.framework.Constants;
import org.osgi.service.component.annotations.Component;

import com.day.cq.analytics.sitecatalyst.AnalyticsPageNameContext;
import com.day.cq.analytics.sitecatalyst.AnalyticsPageNameProvider;
import com.day.cq.analytics.sitecatalyst.Framework;
import com.day.cq.wcm.api.Page;

import static com.day.cq.analytics.sitecatalyst.AnalyticsPageNameContext.S_PAGE_NAME;

/**
 * Default implementation of {@link AnalyticsPageNameProvider} that resolves
 * page title, path or navTitle if mapped in {@link Framework}.
 */
@Component(
    service = { AnalyticsPageNameProvider.class },
    property = {
        Constants.SERVICE_DESCRIPTION + "=Example Page Name Resolver implementation",
        Constants.SERVICE_RANKING + ":Integer=200"
    }
)
public class ExamplePageNameProvider implements AnalyticsPageNameProvider {
    public String getPageName(AnalyticsPageNameContext context) {
        String pageName = null;

        Framework framework = context.getFramework();
        Resource resource = context.getResource();

        if (resource != null && framework != null && framework.mapsSCVariable(S_PAGE_NAME)) {
            String cqVar = framework.getMapping(S_PAGE_NAME);
            Page page = resource.adaptTo(Page.class);
            if (cqVar.equals("pagedata.path")) {
                pageName = page.getProperties().get("pageName",null);
            }
        }
        return pageName;
    }

    public Resource getResource(AnalyticsPageNameContext context) {
        Resource res = null;

        Framework framework = context.getFramework();
        ResourceResolver resolver = context.getResourceResolver();
        String pageName = context.getPageName();
        String basePath = context.getBasePath();

        if (pageName != null && basePath != null && resolver != null
                && framework != null && framework.mapsSCVariable(S_PAGE_NAME)) {
            String cqVar = framework.getMapping(S_PAGE_NAME);
            if (cqVar.equals("pagedata.pagename")) {
                Iterator<Resource>
                hits = resolver.findResources(createQuery(pageName, basePath, "pagename"), Query.JCR_SQL2);
                if (hits.hasNext()) {
                    res = hits.next();
                    res = res.getParent();
                }
            }
        }
        return res;
    }

    private String createQuery(String pageName, String basePath, String propName) {
        return "SELECT * FROM [cq:PageContent] WHERE ISDESCENDANTNODE(["
                + basePath + "]) and [" + propName + "] = \"" + pageName + "\"";
    }
}
```
