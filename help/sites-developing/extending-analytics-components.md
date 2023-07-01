---
title: Adding Adobe Analytics Tracking to Components
description: Adding Adobe Analytics Tracking to Components
uuid: 447b140c-678c-428d-a1c9-ecbdec75cd42
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
discoiquuid: a11c39b4-c23b-4207-8898-33aea25f2ad0
exl-id: e6c1258c-81d5-48e4-bdf1-90d7cc13a22d
---
# Adding Adobe Analytics Tracking to Components{#adding-adobe-analytics-tracking-to-components}

## Including the Adobe Analytics Module in a Page Component {#including-the-adobe-analytics-module-in-a-page-component}

Page template components (for example, `head.jsp, body.jsp`) need JSP includes to load the ContextHub and the Adobe Analytics integration (which is a part of Cloud Services). All includes load JavaScript files.

The ContextHub entry should be included immediately below the `<head>` tag, while Cloud Services should be included in the `<head>` and before the `</body>` section; for example:

```xml
<head>
   <sling:include path="contexthub" resourceType="granite/contexthub/components/contexthub" />
...
   <cq:include script="/libs/cq/cloudserviceconfigs/components/servicelibs/servicelibs.jsp"/>
...
</head>
<body>
...
    <cq:include path="cloudservices" resourceType="cq/cloudserviceconfigs/components/servicecomponents"/>
</body>
```

The `contexthub` script that you insert after the `<head>` element adds the ContextHub features to the page.

The `cloudservices` scripts that you add in the `<head>` and the `<body>` sections apply to the cloud services configurations that are added to the page. (If the page uses more than one Cloud Services configuration, you need to include the ContextHub jsp and the Cloud Services jsp only once.)

When an Adobe Analytics framework is added to the page, the `cloudservices` scripts generate Adobe Analytics-related JavaScript and references to client-side libraries, similar to the following example:

```xml
<div class="sitecatalyst cloudservice">
<script type="text/javascript" src="/etc/clientlibs/foundation/sitecatalyst/sitecatalyst.js"></script>
<script type="text/javascript" src="/etc/clientlibs/foundation/sitecatalyst/util.js"></script>
<script type="text/javascript" src="/content/geometrixx-outdoors/_jcr_content/analytics.sitecatalyst.js"></script>
<script type="text/javascript" src="/etc/clientlibs/mac/mac-sc.js"></script>
<script type="text/javascript" src="/etc/clientlibs/foundation/sitecatalyst/plugins.js"></script>
<script type="text/javascript">
<!--
CQ_Analytics.Sitecatalyst.frameworkComponents = ['foundation/components/page'];
/**
 * Sets Adobe Analytics variables accordingly to mapped components. If <code>options</code>
 * object is provided only variables matching the options.componentPath are set.
 *
 * @param {Object} options Parameter object from CQ_Analytics.record() call. Optional.
 */
CQ_Analytics.Sitecatalyst.updateEvars = function(options) {
    this.frameworkMappings = [];
 this.frameworkMappings.push({scVar:"pageName",cqVar:"pagedata.title",resourceType:"foundation/components/page"});
    for (var i=0; i<this.frameworkMappings.length; i++){
  var m = this.frameworkMappings[i];
  if (!options || options.compatibility || (options.componentPath == m.resourceType)) {
   CQ_Analytics.Sitecatalyst.setEvar(m);
  }
    }
}

CQ_Analytics.CCM.addListener("storesinitialize", function(e) {
 var collect = true;
    var lte = s.linkTrackEvents;
    s.pageName="content:geometrixx-outdoors:en";
    CQ_Analytics.Sitecatalyst.collect(collect);
    if (collect) {
  CQ_Analytics.Sitecatalyst.updateEvars();
     /************* DO NOT ALTER ANYTHING BELOW THIS LINE ! **************/
     var s_code=s.t();if(s_code)document.write(s_code);
     s.linkTrackEvents = lte;
     if(s.linkTrackVars.indexOf('events')==-1){delete s.events};
     $CQ(document).trigger("sitecatalystAfterCollect");
    }
});
//-->
</script>
<script type="text/javascript">
<!--
if(navigator.appVersion.indexOf('MSIE')>=0)document.write(unescape('%3C')+'\!-'+'-')
//-->
</script>
<noscript><img src="https://daydocumentation.112.2o7.net/b/ss/daydocumentation/1/H.25--NS/1380120772954?cdp=3&gn=content%3Ageometrixx-outdoors%3Aen" height="1" width="1" border="0" alt=""/></noscript>
<span data-tracking="{event:'pageView', values:{}, componentPath:'foundation/components/page'}"></span>
<div id="cq-analytics-texthint" style="background:white; padding:0 10px; display:none;">
 <h3 class="cq-texthint-placeholder">Component clientcontext is missing or misplaced.</h3>
</div>
<script type="text/javascript">
$CQ(function(){
 if( CQ_Analytics &&
  CQ_Analytics.ClientContextMgr &&
  !CQ_Analytics.ClientContextMgr.isConfigLoaded )
  {
   $CQ("#cq-analytics-texthint").show();
  }
});
</script>
</div>
```

All AEM sample sites such as Geometrixx Outdoors have this code included.

### The sitecatalystAfterCollect Event {#the-sitecatalystaftercollect-event}

The `cloudservices` script triggers the `sitecatalystAfterCollect` event:

```
$CQ(document).trigger("sitecatalystAfterCollect");
```

This event is triggered to indicate that page tracking has been completed. If you are performing additional tracking operations on this page, you should listen to this event instead of the document load or document ready event. Using the `sitecatalystAfterCollect` event avoids collisions or other unpredictable behavior.

>[!NOTE]
>
>The `/libs/cq/analytics/clientlibs/sitecatalyst/sitecatalyst.js` library includes the code from the Adobe Analytics `s_code.js` file.

## Implementing Adobe Analytics Tracking for Custom Components {#implementing-adobe-analytics-tracking-for-custom-components}

Enable your AEM components to interact with the Adobe Analytics framework. Then, configure your framework so that Adobe Analytics tracks the component data.

Components that interact with the Adobe Analytics framework appear in SideKick when you are editing a framework. After dragging the component to the framework, the component properties appear and you can then map them with Adobe Analytics properties. (See [Setting Up a Framework For Basic Tracking](/help/sites-administering/adobeanalytics-connect.md#creating-a-adobe-analytics-framework).)

Components can interact with the Adobe Analytics framework when the component has a child node named `analytics`. The `analytics` node has the following properties:

* `cq:trackevents`: Identifies the CQ events that the component exposes. (See Custom Events.)
* `cq:trackvars`: Names the CQ variables that are mapped with Adobe Analytics properties.
* `cq:componentName`: The name for the component that appears in Sidekick.
* `cq:componentGroup`: The group in Sidekick that includes the component.

The code in the component JSP adds the JavaScript to the page that triggers the tracking, and defines the data that is tracked. The event name and data names used in the JavaScript must match the corresponding values of the `analytics` node properties.

* Use the data-tracking attribute to track event data when a page loads. (See [Tracking Custom Events on Page Load](/help/sites-developing/extending-analytics.md#tracking-custom-events-on-page-load).)
* Use the CQ_Analytics.record function to track event data when users interact with page features. (See [Tracking Custom Events After Page Load](/help/sites-developing/extending-analytics.md#tracking-custom-events-after-page-load).)

When you use these data-tracking methods, the Adobe Analytics integration module automatically performs the calls to Adobe Analytics to record the events and data.

### Example: Tracking topnav Clicks {#example-tracking-topnav-clicks}

Extend the foundation topnav component so that Adobe Analytics tracks clicks on navigation links at the top of the page. When a navigation link is clicked, Adobe Analytics records the link that was clicked, and the page on which it was clicked.

The following procedures require that you have already performed the following tasks:

* Created a CQ application.
* Created an Adobe Analytics Configuration and an Adobe Analytics Framework.

#### Copy the topnav component {#copy-the-topnav-component}

Copy the topnav component to your CQ application. The procedure requires that your application is set up in CRXDE Lite.

1. Right-click the `/libs/foundation/components/topnav` node and click Copy.
1. Right-click the Components folder below your application folder and click Paste.
1. Click Save All.

#### Integrating topnav With The Adobe Analytics Framework {#integrating-topnav-with-the-adobe-analytics-framework}

Configure the topnav component and edit the JSP file to define the tracking events and data.

1. Right-click the topnav node and click Create &gt; Create Node. Specify the following property values and then click OK:

    * Name: `analytics`
    * Type: `nt:unstructured`

1. Add the following property to the analytics node to name the tracking event:

    * Name: cq:trackevents
    * Type: String
    * Value: topnavClick

1. Add the following property to the analytics node to name the data variables:

    * Name: cq:trackvars
    * Type: String
    * Value: topnavTarget,topnavLocation

1. Add the following property to the analytics node to name the component for Sidekick:

    * Name: cq:componentName
    * Type: String
    * Value: topnav (tracking)

1. Add the following property to the analytics node to name the component group for Sidekick:

    * Name: cq:componentGroup
    * Type: String
    * Value: General

1. Click Save All.
1. Open the `topnav.jsp` file.
1. In the a element, add the following attribute:

   ```xml
   onclick = "tracknav('<%= child.getPath() %>.html')"
   ```

1. At the bottom of the page, add the following JavaScript code:

   ```xml
   <script type="text/javascript">
       function tracknav(target) {
               if (CQ_Analytics.Sitecatalyst) {
                   CQ_Analytics.record({
                       event: 'topnavClick',
                       values: {
                           topnavTarget: target,
                           topnavLocation:'<%=currentPage.getPath() %>.html'
                       },
                       componentPath: '<%=resource.getResourceType()%>'
                   });
               }
       }
   </script>
   ```

1. Click Save All.

The content of the `topnav.jsp` file should appear as follows:

```xml
<%@page session="false"%><%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Top Navigation component

  Draws the top navigation

--%><%@include file="/libs/foundation/global.jsp"%><%
%><%@ page import="java.util.Iterator,
        com.day.text.Text,
        com.day.cq.wcm.api.PageFilter,
        com.day.cq.wcm.api.Page,
        com.day.cq.commons.Doctype,
        org.apache.commons.lang3.StringEscapeUtils" %><%

    // get starting point of navigation
    long absParent = currentStyle.get("absParent", 2L);
    String navstart = Text.getAbsoluteParent(currentPage.getPath(), (int) absParent);

    //if not deep enough take current node
    if (navstart.equals("")) navstart=currentPage.getPath();

    Resource rootRes = slingRequest.getResourceResolver().getResource(navstart);
    Page rootPage = rootRes == null ? null : rootRes.adaptTo(Page.class);
    String xs = Doctype.isXHTML(request) ? "/" : "";
    if (rootPage != null) {
        Iterator<Page> children = rootPage.listChildren(new PageFilter(request));
        while (children.hasNext()) {
            Page child = children.next();
            %><a onclick = "tracknav('<%= child.getPath() %>.html')"  href="<%= child.getPath() %>.html"><%
            %><img alt="<%= StringEscapeUtils.escapeXml(child.getTitle()) %>" src="<%= child.getPath() %>.navimage.png"<%= xs %>></a><%
        }
    }
%><script type="text/javascript">
    function tracknav(target) {
            if (CQ_Analytics.Sitecatalyst) {
                CQ_Analytics.record({
                    event: 'topnavClick',
                    values: {
                        topnavTarget:target,
                        topnavLocation:'<%=currentPage.getPath() %>.html'
                    },
                    componentPath: '<%=resource.getResourceType()%>'
                });
            }
    }
</script>
```

>[!NOTE]
>
>It is often desirable to track data from the ContextHub. For information about using JavaScript to obtain this information, see [Accessing Values in the ContextHub](/help/sites-developing/extending-analytics.md#accessing-values-in-the-contexthub).

#### Adding the Tracking Component to Sidekick {#adding-the-tracking-component-to-sidekick}

Add components that are enabled for tracking with the Adobe Analytics to Sidekick so that you can add them to your framework.

1. Open your Adobe Analytics framework from your Adobe Analytics Configuration. ([http://localhost:4502/etc/cloudservices/sitecatalyst.html](http://localhost:4502/etc/cloudservices/sitecatalyst.html))
1. On Sidekick, click the Design button.

   ![The Design button featuring a right-angle square.](assets/chlimage_1a.png)

1. In the Link Tracking Configuration area, click Configure Inheritance.

   ![chlimage_1](assets/chlimage_1aa.png)

1. In the Allowed Components list, select topnav (tracking) in the General section, then click OK.
1. Expand Sidekick to enter edit mode. The component is now available in the General group.

#### Adding the topnav Component to Your Framework {#adding-the-topnav-component-to-your-framework}

Drag the topnav component to your Adobe Analytics framework and map the component variables and events to Adobe Analytics variables and events. (See [Setting Up a Framework For Basic Tracking](/help/sites-administering/adobeanalytics-connect.md).)

![chlimage_1-1](assets/chlimage_1-1a.png)

The topnav component is now integrated with the Adobe Analytics framework. When you add the component to a page, clicking the items in the top navigation bar causes tracking data to be sent to Adobe Analytics.

### Sending s.products Data to Adobe Analytics {#sending-s-products-data-to-adobe-analytics}

Components can generate data for the s.products variable that is sent to Adobe Analytics. Design your components to contribute to the s.products variable:

* Record a value named `product` of a specific structure.
* Expose the data members of the `product` value so that they can be mapped with Adobe Analytics variables in the Adobe Analytics framework.

The Adobe Analytics s.products variable uses the following syntax:

```
s.products="category;product;quantity;price;eventY={value}|eventZ={value};evarA={value}|evarB={value}"
```

The Adobe Analytics integration module constructs the `s.products` variable using the `product` values that AEM components generate. The `product` value in the JavaScript that AEM components generate is an array of values that have the following structure:

```
"product": [{
    "category": "",
    "sku"     : "path to product node",
    "quantity": quantity,
    "price"   : price,
    "events   : {
      "eventName1": "eventValue1",
      "eventName_n": "eventValue_n"
    }
    "evars"   : {
      "eVarName1": "eVarValue1",
      "eVarName_n": "eVarValue_n"
    }
}]
```

When a data item is omitted from the `product` value, it is sent as an empty string in s.products.

>[!NOTE]
>
>When no event is associated with a product value, Adobe Analytics uses the `prodView` event by default.

The `analytics` node of the component must expose the variable names using the `cq:trackvars` property:

* product.category
* product.sku
* product.quantity
* product.price
* product.events.eventName1
* product.events.eventName_n
* product.evars.eVarName1
* product.evars.eVarName_n

The eCommerce module provides several components that generate s.products variable data. For example, the submitorder component ([http://localhost:4502/crx/de/index.jsp#/libs/commerce/components/submitorder/submitorder.jsp](http://localhost:4502/crx/de/index.jsp#/libs/commerce/components/submitorder/submitorder.jsp)) generates JavaScript that is similar to the following example:

```
<script type="text/javascript">
    function trackCartPurchase() {
        if (CQ_Analytics.Sitecatalyst) {
            CQ_Analytics.record({
                "event": ["productsCartPurchase"],
                "values": {
                    "product": [
                        {
                            "category": "",
                            "sku"     : "/path/to/prod/1",
                            "quantity": 3,
                            "price"   : 179.7,
                            "evars"   : {
                                "childSku": "/path/to/prod/1/green/xs",
                                "size"    : "XS"
                            }
                        },
                        {
                            "category": "",
                            "sku"     : "/path/to/prod/2",
                            "quantity": 10,
                            "price"   : 150,
                            "evars"   : {
                                "childSku": "/path/to/prod/2",
                                "size"    : ""
                            }
                        },
                        {
                            "category": "",
                            "sku"     : "/path/to/prod/3",
                            "quantity": 2,
                            "price"   : 102,
                            "evars"   : {
                                "childSku": "/path/to/prod/3/m",
                                "size"    : "M"
                            }
                        }
                    ]
                },
                "componentPath": "commerce/components/submitorder"
            });
            CQ_Analytics.record({
                "event": ["discountRedemption"],
                "values": {
                    "discount": "/path/to/discount/1 - /path/to/discount/2",
                    "product" : [{
                        "category": "",
                        "sku"     : "Promotional Discount",
                        "events"  : {"discountRedemption": 20.00}
                    }]
                },
                "componentPath": "commerce/components/submitorder"
            });
            CQ_Analytics.record({
                "event": ["cartPurchase"],
                "values": {
                    "orderId"       : "00e40e2d-13a2-4a00-a8ee-01a9ebb0bf68",
                    "shippingMethod": "overnight",
                    "paymentMethod" : "Amex",
                    "billingState"  : "NY",
                    "billingZip"    : "10458",
                    "product"       : [{"category": "", "sku": "", "quantity": "", "price": ""}]
                },
                "componentPath": "commerce/components/submitorder"
            });
        }
        return true;
    }
</script>
```

#### Limiting the Size of Tracking Calls {#limiting-the-size-of-tracking-calls}

Generally, web browsers limit the size of GET requests. Because CQ product and SKU values are repository paths, product arrays that include multiple values can exceed the request size limit. Therefore, your components should limit the number of items in the `product` array of each `CQ_Analytics.record function`. Create multiple functions if the number of items that you need to track can exceed the limit.

For example, the eCommerce submitorder component limits the number of `product` items in a call to four. When the cart contains more than four products, it generates multiple `CQ_Analytics.record` functions.
