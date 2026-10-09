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
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: e72c079d-d036-46d5-b43d-29b276a174c2
    internal-label: Authoring and publishing content
subfeature_v2:
  - id: a26f372d-6d7c-452b-81df-594dd4365ae1
    internal-label: Adaptive Forms
role_v2:
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Configure AEM forms to prefetchdomain information {#configure-aem-forms-to-prefetchdomain-information}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

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
