---
title: Change the order of evaluation for authentication
seo-title: Change the order of evaluation for authentication
description: You can change the order in which AEM forms evaluates multiple authentication providers. 
seo-description: You can change the order in which AEM forms evaluates multiple authentication providers. 
uuid: c2693e5b-cf09-4bb8-815a-2b20ebf6eea0
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.4/FORMS
discoiquuid: 5434df9c-ecf6-450a-aa7e-d9ab69b66fe6
---

# Change the order of evaluation for authentication {#change-the-order-of-evaluation-for-authentication}

If you configured multiple authentication providers, you can change the order in which AEM forms evaluates them for authentication. The order of the authentication providers that are listed in the config.xml file determines the order of evaluation for authentication.

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Import And Export Configuration Files.
1. To export the current configuration setting to a file, click Export and save the configuration file in another location.
1. Find the following node in the file:

   ```as3
    <node name="AuthSchemes"> 
        <map />  
            <node name="CertificateAuth"> 
                <map> 
                    <entry key="order" value="3" />  
                    <entry key="name" value="edc.server.auth.scheme.certificate" />  
                </map> 
        </node> 
        <node name="Kerberos"> 
            <map> 
                <entry key="kerberosSPN" value="defaultSPN" />  
                <entry key="order" value="1" />  
                <entry key="name" value="edc.server.auth.scheme.kerberos" />  
            </map> 
    </node>
   ```

   In `<entry key="order" value="3" />`, edit the value for each node to set the order of the authentication evaluation.

1. To import the updated file, in User Management, click Configuration &gt; Import And Export Configuration Files.
1. Click Browse to find the file, click Import, and then click OK.

