---
title: Configure AEM forms to prefetchdomain information
description: Configure AEM forms to prefetch domain information if you experience a slower response time due to deeply nested groups or if you are a member of many groups.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: cf5283a5-dbfb-460d-a8bd-11cd15ab8640
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Configure AEM forms to prefetchdomain information {#configure-aem-forms-to-prefetchdomain-information}

Users may experience a slower response time if they belong to many groups (for example, 500 or more) or if the groups are nested deeply (for example, 30 levels). If you are experiencing this problem, you can configure AEM forms to prefetch information from certain domains.

1. In administration console, click **[!UICONTROL Settings > User Management > Configuration > Import And Export Configuration Files]**.
1. To export the current configuration setting to a file, click **[!UICONTROL Export]** and save the configuration file in another location.
1. Add the following node (marked in bold):

   ```xml
    <node name="UM">
    <map/>
    <node name="PrincipalCache">
        <map>
            <entry key="principalCacheSize" value="1000"/>
            <entry key="principalCacheBatchFetchSize" value="10"/>
            <entry key="rebuildCacheAfterSync" value="true />
            <entry key="enableFullPrefetch" value="false"/>
            <entry key="principalCacheDomains" value="Domain_Name1/Domain_Name2/Domain_Name3"/>
        <map>
    </node>
    <node name="APSAuditService">
   ```

   In this example, multiple domains are configured for prefetch. The domain names are separated by a "/". This is shown in the example above with *Domain_Name1*, *Domain_Name2*, and *Domain_Name3*.

1. To import the updated file, in User Management, click **[!UICONTROL Configuration > Import And Export Configuration Files]**.
1. Click **[!UICONTROL Browse]** to find the file, click Import, and then click **[!UICONTROL OK]**.
