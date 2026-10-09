---
title: Change the order of evaluation for authentication
description: You can change the order in which AEM forms evaluates multiple authentication providers.
contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/configuring_user_management
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: 7e29c9d4-fb82-4308-aac7-0f5cb1f4aef2
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
# Change the order of evaluation for authentication {#change-the-order-of-evaluation-for-authentication}

>[!NOTE]
> 
> Ensure that the user has admin privileges to access the administrator console.

If you configured multiple authentication providers, you can change the order in which AEM forms evaluates them for authentication. The order of the authentication providers that are listed in the config.xml file determines the order of evaluation for authentication.

1. In administration console, click Settings &gt; User Management &gt; Configuration &gt; Import And Export Configuration Files.
1. To export the current configuration setting to a file, click Export and save the configuration file in another location.
1. Find the following node in the file:

   ```xml
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
