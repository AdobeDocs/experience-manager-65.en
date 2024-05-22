---
title: Displaying the user avatar

description: How to customize the AEM Forms workspace to display the image of a logged-in user.


contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-workspace

exl-id: ee0708b0-b630-4a2b-84b6-3c0b92dd7777
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: "User, Developer"
---
# Displaying the user avatar {#displaying-the-user-avatar}

Avatar of the logged-in user is displayed in the upper-right corner of AEM Forms workspace. Also, the avatars of direct reports in the organizational hierarchy are displayed in the Manager View. You can configure AEM Forms workspace to pick the user images from your database, say LDAP server.

>[!NOTE]
>
>The supported aspect ratio of the user images is 1:1.

1. Create a DSC, using the details mentioned in the next step. For more information, see 'Developing Components for AEM Forms' topic in [Programming with AEM Forms](https://www.adobe.com/go/learn_aemforms_programming_63) guide.
1. In the DSC, define a new SPI which exposes getCurrentUserImageUrl and getUserImageUrl methods to get an image URL for an AEM Forms user. Following is a sample Java™ code snippet:

   ```java
   public class DemoUserImageURLProviderService {
     public String getCurrentUserImageUrl()
     {
        // return the URL for profile Image of logged in user
     }
     public String getUserImageUrl(String principalOid)
     {
         // return the URL for profile Image for user represented by this principal Oid
      }
   }
   ```

1. Create a component.xml file. Ensure that spec-id is as shown in the code snippet below.

   The following code snippet is a sample. Customize it to suit your specific requirements.

   ```java
   <component xmlns="https://adobe.com/idp/dsc/component/document">
       <component-id>com.adobe.sample.DemoUsersComponent</component-id>
       <version>1.1</version>
       <supports-export>false</supports-export>
       <descriptor-class>com.adobe.idp.dsc.component.impl.DefaultPOJODescriptorImpl</descriptor-class>
       <services>
           <service name="DemoUserImageURLProviderService" title="Demo User ImageURL provider service" orchestrateable="false">
           <auto-deploy service-id="DemoUserImageURLProviderService" category-id="Demo Users Component DSC" major-version="1" minor-version="0" />
           <description>Service for resolving user image url.</description>
            <specifications>
            <specification spec-id="com.adobe.idp.taskmanager.dsc.enterprise.UserImageUrlProvider"/>
            </specifications>
           <specification-version>1.0</specification-version>
           <implementation-class>com.adobe.sample.demousers.DemoUserImageURLProviderService</implementation-class>
           <request-processing-strategy>single_instance</request-processing-strategy>
           <supported-connectors>default</supported-connectors>
           <operation-config>
               <operation-name>*</operation-name>
               <transaction-type>Container</transaction-type>
               <transaction-propagation>supports</transaction-propagation>
               <!--transaction-timeout>3000</transaction-timeout-->
           </operation-config>
           <operations>
               <operation anonymous-access="false" name="getCurrentUserImageUrl" method="getCurrentUserImageUrl">
                   <output-parameter name="result" type="java.lang.String"/>
               </operation>
               <operation anonymous-access="false" name="getUserImageUrl"
   method="getUserImageUrl">
               <input-parameter name="principalOid" type="java.lang.String"/>
               <output-parameter name="result" type="java.lang.String"/>
               </operation>
           </operations>
           </service>
       </services>
   </component>
   ```

1. Deploy DSC through Workbench. Restart `ProcessManagementClientSessionService` service.
1. You may have to refresh your browser or logout/login with the user again.
