---
title: Creating a Custom Cloud Service
description: The default set of Cloud Services can be extended with custom Cloud Service types
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: extending-aem
content-type: reference
exl-id: 9414c77a-b180-4440-8386-e6eb4426e475
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Creating a Custom Cloud Service{#creating-a-custom-cloud-service}

The default set of Cloud Services can be extended with custom Cloud Service types. This lets you inject custom markup into the page in a structured fashion. This is primarily of use for third-party analytics providers, for example, Google Analytics, Chartbeat, and so on. Cloud Services are inherited from parent pages to child pages with the ability to break the inheritance at any level.

>[!NOTE]
>
>This step-by-step guide for creating a Cloud Service is an example using Google Analytics. Everything might not apply to your use case.

1. In CRXDE Lite, create a node under `/apps`:

    * **Name**: `acs`
    * **Type**: `nt:folder`

1. Create a node under `/apps/acs`:

    * **Name**: `analytics`
    * **Type**: `sling:Folder`

1. Create two nodes under `/apps/acs/analytics`:

    * **Name**: components
    * **Type**: `sling:Folder`

   and

    * **Name**: templates
    * **Type**: `sling:Folder`

1. Right-click `/apps/acs/analytics/components`. Select **Create...** followed by **Create Component...** The dialog that opens lets you specify:

    * **Label**: `googleanalyticspage`
    * **Title**: `Google Analytics Page`
    * **Super Type**: `cq/cloudserviceconfigs/components/configpage`
    * **Group**: `.hidden`

1. Click **Next** twice and specify:

    * **Allowed Parents:** `acs/analytics/templates/googleanalytics`

   Click **Next** twice and click **OK**.

1. Add a property to `googleanalyticspage`:

    * **Name:** `cq:defaultView`
    * **Value:** `html`

1. Create a file named `content.jsp` under `/apps/acs/analytics/components/googleanalyticspage`, with the following content:

   ```xml
   <%@page contentType="text/html"
               pageEncoding="utf-8"%><%
   %><%@include file="/libs/foundation/global.jsp"%><div>

   <div>
       <h3>Google Analytics Settings</h3>
       <ul>
           <li><div class="li-bullet"><strong>accountID: </strong><br><%= xssAPI.encodeForHTML(properties.get("accountID", "")) %></div></li>
       </ul>
   </div>
   ```

1. Create a node under `/apps/acs/analytics/components/googleanalyticspage/`:

    * **Name**: `dialog`
    * **Type**: `cq:Dialog`
    * **Properties**:

        * **Name**: `title`
        * **Type**: `String`
        * **Value**: `Google Analytics Config`
        * **Name**: `xtype`
        * **Type**: `String`
        * **Value**: `dialog`

1. Create a node under `/apps/acs/analytics/components/googleanalyticspage/dialog`:

    * **Name**: `items`
    * **Type**: `cq:Widget`
    * **Properties**:

        * **Name**: `xtype`
        * **Type**: `String`
        * **Value**: `tabpanel`

1. Create a node under `/apps/acs/analytics/components/googleanalyticspage/dialog/items`:

    * **Name**: `items`
    * **Type**: `cq:WidgetCollection`

1. Create a node under `/apps/acs/analytics/components/googleanalyticspage/dialog/items/items`:

    * **Name**: tab1
    * **Type**: `cq:Panel`
    * **Properties**:

        * **Name**: `title`
        * **Type**: `String`
        * **Value**: `Config`

1. Create a node under `/apps/acs/analytics/components/googleanalyticspage/dialog/items/items/tab1`:

    * **Name**: items
    * **Type**: `nt:unstructured`
    * **Properties**:

        * **Name**: `fieldLabel`
        * **Type**: String
        * **Value**: Account ID

        * **Name**: `fieldDescription`
        * **Type**: `String`
        * **Value**: `The account ID assigned by Google. Usually in the form UA-NNNNNN-N`

        * **Name**: `name`
        * **Type**: `String`
        * **Value**: `./accountID`
        * **Name**: `validateOnBlur`
        * **Type**: `String`
        * **Value**: `true`
        * **Name**: `xtype`
        * **Type**: `String`
        * **Value**: `textfield`

1. Copy `/libs/cq/cloudserviceconfigs/components/configpage/body.jsp` to `/apps/acs/analytics/components/googleanalyticspage/body.jsp` and change `libs` to `apps` on line 34 and make the script reference on line 79 a fully qualified path.
1. Create a template under `/apps/acs/analytics/templates/`:

    * with **Resource Type** = `acs/analytics/components/googleanalyticspage`
    * with **Label** = `googleanalytics`
    * with **Title**= `Google Analytics Configuration`
    * with **allowedPath** = `/etc/cloudservices/googleanalytics(/.*)?`
    * with **allowedChildren** = `/apps/acs/analytics/templates/googleanalytics`
    * with **sling:resourceSuperType** = `cq/cloudserviceconfigs/templates/configpage` (on template node, not the jcr:content node)
    * with **cq:designPath** = `/etc/designs/cloudservices/googleanalytics` (on jcr:content)

1. Create a component: `/apps/acs/analytics/components/googleanalytics`.

   Add the following content to `googleanalytics.jsp`:

   ```xml
   <%@page import="org.apache.sling.api.resource.Resource,
                   org.apache.sling.api.resource.ValueMap,
                   org.apache.sling.api.resource.ResourceUtil,
                   com.day.cq.wcm.webservicesupport.Configuration,
                   com.day.cq.wcm.webservicesupport.ConfigurationManager" %>
   <%@include file="/libs/foundation/global.jsp" %><%

   String[] services = pageProperties.getInherited("cq:cloudserviceconfigs", new String[]{});
   ConfigurationManager cfgMgr = resource.getResourceResolver().adaptTo(ConfigurationManager.class);
   if(cfgMgr != null) {
       String accountID = null;
       Configuration cfg = cfgMgr.getConfiguration("googleanalytics", services);
       if(cfg != null) {
           accountID = cfg.get("accountID", null);
       }

       if(accountID != null) {
       %>
   <script type="text/javascript">

     var _gaq = _gaq || [];
     _gaq.push(['_setAccount', '<%= accountID %>']);
     _gaq.push(['_trackPageview']);

     (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();

   </script><%
       }
   }
   %>
   ```

   This should output the custom markup based on the configuration properties.

1. Navigate to `http://localhost:4502/miscadmin#/etc/cloudservices` and create a page:

    * **Title**: `Google Analytics`
    * **Name**: `googleanalytics`

   Go back in CRXDE Lite, and under `/etc/cloudservices/googleanalytics`, add the following property to `jcr:content`:

    * **Name**: `componentReference`
    * **Type**: `String`
    * **Value**: `acs/analytics/components/googleanalytics`

1. Navigate to the newly created Service page ( `http://localhost:4502/etc/cloudservices/googleanalytics.html`) and click the **+** to create a config:

    * **Parent Configuration**: `/etc/cloudservices/googleanalytics`
    * **Title:**  `My First GA Config`

   Choose **Google Analytics Configuration** and click **Create**.

1. Enter an **Account ID**, for example, `AA-11111111-1`. Click **OK**.
1. Navigate to a page and add the newly created configuration in the page properties, under the **Cloud Services** tab.
1. The page will have the custom markup added to it.
