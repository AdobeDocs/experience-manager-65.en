---
title: Protecting Documents with Policies
description: Use the Document Security service to dynamically apply confidentiality settings to Adobe PDF documents and to maintain control over the documents. The Document Security service also enables the users to maintain control over how recipients use the policy-protected PDF document.
contentOwner: admin
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: operations
role: Developer
exl-id: ff42579e-6aaf-433d-8b5d-9e9dd0957250
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms,  Document Services, API"
---
# Protecting Documents with Policies {#protecting-documents-with-policies} 

**Samples and examples in this document are only for AEM Forms on JEE environment.**

**About the Document Security Service**

The Document Security service enables users to dynamically apply confidentiality settings to Adobe PDF documents and to maintain control over the documents, no matter how widely they are distributed.

The Document Security service prevents information from spreading beyond the user's reach by enabling the users to maintain control over how recipients use the policy-protected PDF document. A user can specify who can open a document, limit how they can use it, and monitor the document after it is distributed. A user can also dynamically control access to a policy-protected document and can even dynamically revoke access to the document.

The Document Security service also protects other file types such as Microsoft Word files (DOC files). You can use the Document Security Client API to work with these file types. The following versions are supported:

* Microsoft Office 2003 files (DOC, XLS, PPT files)
* Microsoft Office 2007 files (DOCX, XLSX, PPTX files)
* PTC Pro/E files

For clarity, the following two sections discuss how to work with Word documents:

* [Applying Policies to Word Documents](protecting-documents-policies.md#applying-policies-to-word-documents)
* [Removing Policies from Word Documents](protecting-documents-policies.md#removing-policies-from-word-documents)

You can accomplish these tasks using the Document Security service:

* Create policies. For information, see [Creating Policies](protecting-documents-policies.md#creating-policies).
* Modify policies. For information, see [Modifying Policies](protecting-documents-policies.md#modifying-policies).
* Delete policies. For information, see [Deleting Policies](protecting-documents-policies.md#deleting-policies).
* Apply policies to PDF documents. For information, see [Applying Policies to PDF Documents](protecting-documents-policies.md#applying-policies-to-pdf-documents).
* Remove policies from PDF documents. For information, see [Removing Policies from PDF Documents](protecting-documents-policies.md#removing-policies-from-pdf-documents).
* Inspect policy-protected documents. For information, see [Inspecting Policy Protected PDF Documents](protecting-documents-policies.md#inspecting-policy-protected-pdf-documents).
* Revoke access to PDF documents. For information, see [Revoking Access to Documents](protecting-documents-policies.md#revoking-access-to-documents).
* Reinstate access to revoked documents. For information, see [Reinstating Access to Revoked Documents](protecting-documents-policies.md#reinstating-access-to-revoked-documents).
* Create watermarks. For information, see [Creating Watermarks](protecting-documents-policies.md#creating-watermarks).
* Search for events. For information, see [Searching for Events](protecting-documents-policies.md#searching-for-events).

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

## Creating Policies {#creating-policies}

You can programmatically create policies using the Document Security Java API or web service API. A *policy* is a collection of information that includes document security settings, authorized users, and usage rights. You can create and save any number of policies, using security settings appropriate for different situations and users.

Policies enable you to perform these tasks:

* Specify the individuals who can open the document. Recipients can either belong to or be external to your organization.
* Specify how recipients can use the document. You can restrict access to different Acrobat and Adobe Reader features. These features include the ability to print and copy text, add signatures, and add comments to a document.
* Change the access and security settings at any time, even after you distribute the policy-protected document.
* Monitor the use of the document after you distribute it. You can see how the document is being used and who is using it. For example, you can find out when someone has opened the document.

### Creating a policy using web services {#creating-a-policy-using-web-services}

When creating a policy using the web service API, reference an existing Portable Document Rights Language (PDRL) XML file that describes the policy. Policy permissions and the principal are defined in the PDRL document. The following XML document is an example of a PDRL document.

```xml
 <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
 <Policy PolicyInstanceVersion="1" PolicyID="5DA3F847-DE76-F9CC-63EA-49A8D59154DE" PolicyCreationTime="2004-08-30T00:02:28.294+00:00" PolicyType="1" PolicySchemaVersion="1.0" PolicyName="SDK Test Policy -4344050357301573237" PolicyDescription="An SDK Test policy" xmlns="https://www.adobe.com/schema/1.0/pdrl">
       <PolicyEntry>
          <ns1:Permission PermissionName="com.adobe.aps.onlineOpen" Access="ALLOW" xmlns:ns1="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns2:Permission PermissionName="com.adobe.aps.offlineOpen" Access="ALLOW" xmlns:ns2="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns3:Permission PermissionName="com.adobe.aps.pdf.editNotes" Access="ALLOW" xmlns:ns3="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns4:Permission PermissionName="com.adobe.aps.pdf.fillAndSign" Access="ALLOW" xmlns:ns4="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
          <Principal PrincipalNameType="SYSTEM">
             <PrincipalDomain>EDC_SPECIAL</PrincipalDomain>
 
             <PrincipalName>all_internal_users</PrincipalName>
          </Principal>
       </PolicyEntry>
       <PolicyEntry>
          <ns5:Permission PermissionName="com.adobe.aps.onlineOpen" Access="ALLOW" xmlns:ns5="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns6:Permission PermissionName="com.adobe.aps.offlineOpen" Access="ALLOW" xmlns:ns6="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns7:Permission PermissionName="com.adobe.aps.pdf.copy" Access="ALLOW" xmlns:ns7="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns8:Permission PermissionName="com.adobe.aps.pdf.printLow" Access="ALLOW" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" xmlns:ns8="https://www.adobe.com/schema/1.0/pdrl" />
 
          <ns9:Permission PermissionName="com.adobe.aps.policySwitch" Access="ALLOW" xmlns:ns9="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns10:Permission PermissionName="com.adobe.aps.revoke" Access="ALLOW" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" xmlns:ns10="https://www.adobe.com/schema/1.0/pdrl" />
 
          <ns11:Permission PermissionName="com.adobe.aps.pdf.edit" Access="ALLOW" xmlns:ns11="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns12:Permission PermissionName="com.adobe.aps.pdf.editNotes" Access="ALLOW" xmlns:ns12="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns13:Permission PermissionName="com.adobe.aps.pdf.fillAndSign" Access="ALLOW" xmlns:ns13="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <ns14:Permission PermissionName="com.adobe.aps.pdf.printHigh" Access="ALLOW" xmlns:ns14="https://www.adobe.com/schema/1.0/pdrl" xmlns="https://www.adobe.com/schema/1.0/pdrl-ex" />
 
          <Principal PrincipalNameType="SYSTEM">
             <PrincipalDomain>EDC_SPECIAL</PrincipalDomain>
 
             <PrincipalName>publisher</PrincipalName>
          </Principal>
       </PolicyEntry>
 
       <OfflineLeasePeriod>
          <Duration>P31D</Duration>
       </OfflineLeasePeriod>
 
       <AuditSettings isTracked="true" />
 
       <PolicyValidityPeriod isAbsoluteTime="false">
          <ValidityPeriodRelative>
             <NotBeforeRelative>PT0S</NotBeforeRelative>
 
             <NotAfterRelative>P20D</NotAfterRelative>
          </ValidityPeriodRelative>
       </PolicyValidityPeriod>
 </Policy>
 
```

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary-of-steps}

To create a policy, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Set the policy's attributes.
1. Create a policy entry.
1. Register the policy.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

The following JAR files must be added to your project's classpath:

* adobe-rightsmanagement-client.jar
* namespace.jar (if AEM Forms is deployed on JBoss)
* jaxb-api.jar (if AEM Forms is deployed on JBoss)
* jaxb-impl.jar (if AEM Forms is deployed on JBoss)
* jaxb-libs.jar (if AEM Forms is deployed on JBoss)
* jaxb-xjc.jar (if AEM Forms is deployed on JBoss)
* relaxngDatatype.jar (if AEM Forms is deployed on JBoss)
* xsdlib.jar (if AEM Forms is deployed on JBoss)
* adobe-livecycle-client.jar
* adobe-usermanager-client.jar
* adobe-utilities.jar
* jbossall-client.jar (use a different JAR file if AEM Forms is not deployed on JBoss)

For information about the location of these JAR files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, create a Document Security service client object.

**Set the policy's attributes**

To create a policy, set policy attributes. A mandatory attribute is the policy name. Policy names must be unique for each policy set. A policy set is simply a collection of policies. There can be two policies with the same name if the policies belong to separate policy sets. However, two policies within a single policy set cannot have the same policy name.

Another useful attribute to set is the validity period. A validity period is the time period during which a policy-protected document is accessible to authorized recipients. If you do not set this attribute, then the policy is always valid.

A validity period can be set to one of these options:

* A set number of days that the document is accessible from the time which the document is published
* An end date after which the document is not accessible
* A specific date range for which the document is accessible
* Always valid

You can specify just a start date, which results in the policy being valid after the start date. If you specify just an end date, the policy is valid until the end date. However, an exception is thrown if both a start date and an end date are not defined.

When setting attributes that belong to a policy, you can also set encryption settings. These encryption settings take affect when the policy is applied to a document. You can specify the following encryption values:

* **AES256**: Represents the AES encryption algorithm with a 256-bit key.
* **AES128**: Represents the AES encryption algorithm with a 128-bit key.
* **NoEncryption:** Represents no encryption.

When specifying the `NoEncryption` option, you cannot set the `PlaintextMetadata` option to `false`. If you attempt to do so, an exception is thrown.

>[!NOTE]
>
>For information about other attributes that you can set, see the `Policy` interface description in the [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

**Create a policy entry**

A policy entry attaches principals, which are groups and users, and permissions to a policy. A policy must have at least one policy entry. Assume, for example, that you perform these tasks:

* Create and register a policy entry that enables a group to only view a document while online and prohibits recipients from copying it.
* Attach the policy entry to the policy.
* Secure a document with the policy by using Acrobat.

These actions result in recipients only being able to view the document online and not being able to copy it. The document remains secure until security is removed from it.

**Register the policy**

A new policy must be registered before it can be used. After you register a policy, you can use it to protect documents.

### Create a policy using the Java API {#create-a-policy-using-the-java-api}

Create a policy by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `DocumentSecurityClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Set the policy's attributes.

    * Create a `Policy` object by invoking the `InfomodelObjectFactory` object's static `createPolicy` method. This method returns a `Policy` object.
    * Set the policy's name attribute by invoking the `Policy` object's `setName` method and passing a string value that specifies the policy name.
    * Set the policy's description by invoking the `Policy` object's `setDescription` method and passing a string value that specifies the policy's description.
    * Specify the policy set to which the new policy belongs by invoking the `Policy` object's `setPolicySetName` method and passing a string value that specifies the policy set name. (You can specify `null` for this parameter value that results in the policy being added to the *My Policies* policy set.)
    * Create the policy's validity period by invoking the `InfomodelObjectFactory` object's static `createValidityPeriod` method. This method returns a `ValidityPeriod` object.
    * Set the number of days for which a policy-protected document is accessible by invoking the `ValidityPeriod` object's `setRelativeExpirationDays` method and passing an integer value that specifies the number of days.
    * Set the policy's validity period by invoking the `Policy` object's `setValidityPeriod` method and passing the `ValidityPeriod` object.

1. Create a policy entry.

    * Create a policy entry by invoking the `InfomodelObjectFactory` object's static `createPolicyEntry` method. This method returns a `PolicyEntry` object.
    * Specify the policy's permissions by invoking the `InfomodelObjectFactory` object's static `createPermission` method. Pass a static data member that belongs to the `Permission` interface that represents the permission. This method returns a `Permission` object. For example, to add the permission that enables users to copy data from a policy-protected PDF document, pass `Permission.COPY`. (Repeat this step for each permission to add).
    * Add the permission to the policy entry by invoking the `PolicyEntry` object's `addPermission` method and passing the `Permission` object. (Repeat this step for each `Permission` object that you created).
    * Create the policy principal by invoking the `InfomodelObjectFactory` object's static `createSpecialPrincipal` method. Pass a data member that belongs to the `InfomodelObjectFactory` object that represents the principal. This method returns a `Principal` object. For example, to add the publisher of the document as the principal, pass `InfomodelObjectFactory.PUBLISHER_PRINCIPAL`.
    * Add the principal to the policy entry by invoking the `PolicyEntry` object's `setPrincipal`method and passing the `Principal` object.
    * Add the policy entry to the policy by invoking the `Policy` object's `addPolicyEntry` method and passing the `PolicyEntry` object.

1. Register the policy.

    * Create a `PolicyManager` object by invoking the `DocumentSecurityClient` object's `getPolicyManager` method.
    * Register the policy by invoking the `PolicyManager` object's `registerPolicy` method and passing the following values:

        * The `Policy` object that represents the policy to register.

    * A string value that represents the policy set that the policy belongs to.

   If you use an AEM forms administrator account within connection settings to create the `DocumentSecurityClient` object, then specify the policy set name when you invoke the `registerPolicy` method. If you pass a `null` value for the policy set, the policy is created in the administrators *My Policies* policy set.

   If you use a Document Security user within connection settings, then you can invoke the overloaded `registerPolicy` method that accepts only the policy. That is, you do not need to specify the policy set name. However, the policy is added to the policy set named *My Policies*. If you do not want to add the new policy to this policy set, then specify a policy set name when you invoke the `registerPolicy` method.

   >[!NOTE]
   >
   >When creating a policy, reference an existing policy set. If you specify a policy set that does not exist, then an exception is thrown.

For code examples using the Document Security service, see the following:

* "Quick Start (SOAP mode): Creating a policy using the Java API"

### Create a policy using the web service API {#create-a-policy-using-the-web-service-api}

Create a policy by using the Document Security API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `DocumentSecurityServiceClient` object by using its default constructor.
    * Create a `DocumentSecurityServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `RightsManagementServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `RightsManagementServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `RightsManagementServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Set the policy's attributes.

    * Create a `PolicySpec` object by using its constructor.
    * Set the policy's name by assigning a string value to the `PolicySpec` object's `name` data member.
    * Set the policy's description by assigning a string value to the `PolicySpec` object's `description` data member.
    * Specify the policy set to which the policy belongs by assigning a string value to the `PolicySpec` object's `policySetName` data member. Specify an existing policy set name. (You can specify `null` for this parameter value that results in the policy being added to *My Policies*.)
    * Set the policy's offline lease period by assigning an integer value to the `PolicySpec` object's `offlineLeasePeriod` data member.
    * Set the `PolicySpec` object's `policyXml` data member with a string value that represents PDRL XML data. To perform this task, create a .NET `StreamReader` object by using its constructor. Pass the location of a PDRL XML file that represents the policy to the `StreamReader` constructor. Next, invoke the `StreamReader` object's `ReadLine` method and assign the return value to a string variable. Iterate through the `StreamReader` object until the `ReadLine` method returns null. Assign the string variable to the `PolicySpec` object's `policyXml` data member.

1. Create a policy entry.

   It is not necessary to create a policy entry when creating a policy using the Document Security web service API. The policy entry is defined in the PDRL document.

1. Register the policy.

   Register the policy by invoking the `DocumentSecurityServiceClient` object's `registerPolicy` method and passing the following values:

    * The `PolicySpec` object that represents the policy to register.
    * A string value that represents the policy set that the policy belongs to. You can specify a `null` value which results in the policy being added to the *MyPolices* policy set.

   If you use an AEM forms administrator account within connection settings to create the `DocumentSecurityClient` object, specify the policy set name when you invoke the `registerPolicy` method.

   If you use a Document SecurityDocument Security user within connection settings, then you can invoke the overloaded `registerPolicy` method that accepts only the policy. That is, you do not need to specify the policy set name. However, the policy is added to the policy set named *My Policies*. If you do not want to add the new policy to this policy set, then specify a policy set name when you invoke the `registerPolicy` method.

   >[!NOTE]
   >
   >When creating a policy and you specify a policy set, ensure that you specify an existing policy set. If you specify a policy set that does not exist, then an exception is thrown.

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Creating a policy using the web service API"
* "Quick Start (SwaRef): Creating a policy using the web service API"

## Modifying Policies {#modifying-policies}

You can modify an existing policy using the Document Security Java API or web service API. To change an existing policy, you retrieve it, modify it, and then update the policy on the server. For example, assume that you retrieve an existing policy and extend its validity period. Before the change takes effect, you must update the policy.

You can modify a policy when business requirements change and the policy no longer reflects these requirements. Instead of creating a policy, you can simply update an existing policy.

To modify policy attributes using a web service (for example, using Java proxy classes that were created with JAX-WS), you must ensure that the policy is registered with the Document Security service. You can then reference the existing policy by using the `PolicySpec.getPolicyXml` method and modify the policy attributes by using the applicable methods. For example, you can modify the offline lease period by invoking the `PolicySpec.setOfflineLeasePeriod` method.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-1}

To modify an existing policy, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Retrieve an existing policy.
1. Change policies attributes.
1. Update the policy.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Securityservice operation, you must create a Document Security service client object. If you are using the Java API, create a `RightsManagementClient` object. If you are using the Document Security web service API, create a `RightsManagementServiceService` object.

**Retrieve an existing policy**

Retrieve an existing policy to modify it. To retrieve a policy, specify the policy name and the policy set to which the policy belongs. If you specify a `null` value for the policy set name, the policy is retrieved from the *My Policies* policy set.

**Set the policy's attributes**

To modify a policy, you modify the value of policy attributes. The only policy attribute that you cannot change is the name attribute. For example, to change the policy's offline lease period, you can modify the value of the policy's offline lease period attribute.

When modifying a policy's offline lease period using a web service, the `offlineLeasePeriod` field on the `PolicySpec` interface is ignored. To update the offline lease period, modify the `OfflineLeasePeriod` element in the PDRL XML document. Then reference the updated PDRL XML document by using the `PolicySpec` interface's `policyXML` data member.

>[!NOTE]
>
>For information about other attributes that you can set, see the `Policy` interface description in the [AEM Forms API Reference](https://www.adobe.com/go/learn_aemforms_javadocs_63_en).

**Update the policy**

Before the changes that you make to a policy take affect, you must update the policy with the Document Security service. Changes to policies that are protecting documents are updated the next time that the policy-protected document is synchronized with the Document Security service.

### Modify existing policies using the Java API {#modify-existing-policies-using-the-java-api}

Modify an existing policy by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `RightsManagementClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve an existing policy.

    * Create a `PolicyManager` object by invoking the `RightsManagementClient` object's `getPolicyManager` method.
    * Create a `Policy` object that represents the policy to update by invoking the `PolicyManager` object's `getPolicy` method and passing the following values"

        * A string value that represents the policy set name to which the policy belongs. You can specify `null` that results in the `MyPolicies` policy set being used.
        * A string value that represents the policy name.

1. Set the policy's attributes.

   Change the policy's attributes to meet your business requirements. For example, to change the policy's offline lease period, invoke the `Policy` object's `setOfflineLeasePeriod` method.

1. Update the policy.

   Update the policy by invoking `PolicyManager` object's `updatePolicy` method. Pass the `Policy` object that represents the policy to update.

**Code examples**

For code examples using the Document Security service, see the Quick Start(SOAP mode): Modifying a policy using the Java API section.

### Modify existing policies using the web service API {#modify-existing-policies-using-the-web-service-api}

Modify an existing policy by using the Document Security API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `RightsManagementServiceClient` object by using its default constructor.
    * Create a `RightsManagementServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `RightsManagementServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `RightsManagementServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `RightsManagementServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve an existing policy.

   Create a `PolicySpec` object that represents the policy to modify by invoking the `RightsManagementServiceClient` object's `getPolicy` method and passing the following values:

    * A string value that specifies the policy set name to which the policy belongs. You can specify `null` that results in the `MyPolicies` policy set being used.
    * A string value that specifies the name of the policy.

1. Set the policy's attributes.

   Change the policy's attributes to meet your business requirements.

1. Update the policy.

   Update the policy by invoking the `RightsManagementServiceClient` object's `updatePolicyFromSDK` method and passing the `PolicySpec` object that represents the policy to update.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Modifying a policy using the web service API"
* "Quick Start (SwaRef): Modifying a policy using the web service API"

## Deleting Policies {#deleting-policies}

You can delete an existing policy using the Document Security Java API or web service API. After a policy is deleted, it can no longer be used to protect documents. However, existing policy-protected documents that are using the policy are still protected. You can delete a policy when a newer one becomes available.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-2}

To delete an existing policy, perform the following steps:

1. Include project files
1. Create a Document Security Client API object.
1. Delete the policy.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, you must create a Document Security service client object. If you are using the Java API, create a `RightsManagementClient` object. If you are using the Document Security web service API, create a `RightsManagementServiceService` object.

**Delete the policy**

To delete a policy, you specify the policy to delete and the policy set to which the policy belongs. The user whose settings are used to invoke AEM Forms must have permission to delete the policy; otherwise an exception occurs. Likewise, if you attempt to delete a policy that does not exist, an exception occurs.

### Delete policies using the Java API {#delete-policies-using-the-java-api}

Delete a policy by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `RightsManagementClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Delete the policy.

    * Create a `PolicyManager` object by invoking the `RightsManagementClient` object's `getPolicyManager` method.
    * Delete the policy by invoking the `PolicyManager` object's `deletePolicy` method and passing the following values:

        * A string value that specifies the policy set name to which the policy belongs. You can specify `null` that results in the `MyPolicies` policy set being used.
        * A string value that specifies the name of the policy to delete.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (SOAP mode): Deleting a policy using the Java API"

### Delete policies using the web service API {#delete-policies-using-the-web-service-api}

Delete a policy by using the Document Security API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `RightsManagementServiceClient` object by using its default constructor.
    * Create a `RightsManagementServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `RightsManagementServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `RightsManagementServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `RightsManagementServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Delete the policy.

   Delete a policy by invoking the `RightsManagementServiceClient` object's `deletePolicy` method and passing the following values:

    * A string value that specifies the policy set name to which the policy belongs. You can specify `null` that results in the `MyPolicies` policy set being used.
    * A string value that specifies the name of the policy to delete.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Deleting a policy using the web service API"
* "Quick Start (SwaRef): Deleting a policy using the web service API"

## Applying Policies to PDF Documents {#applying-policies-to-pdf-documents}

You can apply a policy to a PDF document to secure the document. By applying a policy to a PDF document, you restrict access to the document. You cannot apply a policy to a document if the document is already secured with a policy.

While the document is open, you can also restrict access to Acrobat and Adobe Reader features, including the ability to print and copy text, make changes, and add signatures and comments to a document. In addition, you can revoke a policy-protected PDF document when you no longer want users to access the document.

You can monitor the use of a policy-protected document after you distribute it. That is, you can see how the document is being used and who is using it. For example, you can find out when somebody has opened the document.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-3}

To apply a policy to a PDF document, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Retrieve a PDF document to which a policy is applied.
1. Apply an existing policy to the PDF document.
1. Save the policy-protected PDF document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client APIobject**

Before you can programmatically perform a Document Security service operation, create a Document Security service client object. If you are using the Java API, create a `DocumentSecurityClient` object. If you are using the Document Security web service API, create a `DocumentSecurityServiceService` object.

**Retrieve a PDF document**

You can retrieve a PDF document to apply a policy. After you apply a policy to the PDF document, users are restricted when using the document. For example, if the policy does not enable the document to be opened while offline, then users must be online to open the document.

**Apply an existing policy to the PDF document**

To apply a policy to a PDF document, reference an existing policy and specify which policy set the policy belongs to. The user who is setting the connection properties must have access to the specified policy. If not, an exception occurs.

**Save the PDF document**

After the Document Security service applies a policy to a PDF document, you can save the policy-protected PDF document as a PDF file.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Revoking Access to Documents](protecting-documents-policies.md#revoking-access-to-documents)

### Apply a policy to a PDF document using the Java API {#apply-a-policy-to-a-pdf-document-using-the-java-api}

Apply a policy to a PDF document by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `RightsManagementClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve a PDF document.

    * Create a `java.io.FileInputStream` object that represents the PDF document by using its constructor. Pass a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Apply an existing policy to the PDF document.

    * Create a `DocumentManager` object by invoking the `RightsManagementClient` object's `getDocumentManager` method.
    * Apply a policy to the PDF document by invoking the `DocumentManager` object's `protectDocument` method and passing the following values:

        * The `com.adobe.idp.Document` object that contains the PDF document to which the policy is applied.
        * A string value that specifies the name of the document.
        * A string value that specifies the name of the policy set to which the policy belongs. You can specify a `null` value that results in the `MyPolicies` policy set being used.
        * A string value that specifies the policy name.
        * A string value that represents the name of the user manager domain of the user who is the publisher of the document. This parameter value is optional and can be null (if this parameter is null, then the next parameter value must be null).
        * A string value that represents the name of the canonical name of the user manager user who is the publisher of the document. This parameter value is optional and can be `null` (if this parameter is null, then the previous parameter value must be `null`).
        * A `com.adobe.livecycle.rightsmanagement.Locale` that represents the locale that is used for selecting the MS Office template. This parameter value is optional and not used for PDF documents. To secure a PDF document, specify `null`.

      The `protectDocument` method returns a `RMSecureDocumentResult` object that contains the policy-protected PDF document.

1. Save the PDF document.

    * Invoke the `RMSecureDocumentResult` object's `getProtectedDoc` method to get the policy-protected PDF document. This method returns a `com.adobe.idp.Document` object.
    * Create a `java.io.File` object and ensure that the file extension is PDF.
    * Invoke the `com.adobe.idp.Document` object's `copyToFile` method to copy the contents of the `Document` object to the file (ensure that you use the `Document` object that was returned by the `getProtectedDoc` method).

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (EJB mode): Applying a policy to a PDF document using the Java API"
* "Quick Start (SOAP mode): Applying a policy to a PDF document using the Java API"

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Apply a policy to a PDF document using the web service API {#apply-a-policy-to-a-pdf-document-using-the-web-service-api}

Apply a policy to a PDF document by using the Document Security API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `RightsManagementServiceClient` object by using its default constructor.
    * Create a `RightsManagementServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `RightsManagementServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `RightsManagementServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `RightsManagementServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document to which a policy is applied.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. Determine the byte array size by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method. Pass the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Apply an existing policy to the PDF document.

   Apply a policy to the PDF document by invoking the `RightsManagementServiceClient` object's `protectDocument` method and passing the following values:

    * The `BLOB` object that contains the PDF document to which the policy is applied.
    * A string value that specifies the name of the document.
    * A string value that specifies the name of the policy set to which the policy belongs. You can specify a `null` value that results in the `MyPolicies` policy set being used.
    * A string value that specifies the policy name.
    * A string value that represents the name of the user manager domain of the user who is the publisher of the document. This parameter value is optional and can be null (if this parameter is null, then the next parameter value must be `null`).
    * A string value that represents the name of the canonical name of the user manager user who is the publisher of the document. This parameter value is optional and can be null (if this parameter is null, then the previous parameter value must be `null`).
    * A `RMLocale` value that specifies the locale value (for example, `RMLocale.en`).
    * A string output parameter that is used to store the policy identifier value.
    * A string output parameter that is used to store the policy-protected identifier value.
    * A string output parameter that is used to store the mime type (for example, `application/pdf`).

   The `protectDocument` method returns a `BLOB` object that contains the policy-protected PDF document.

1. Save the PDF document.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the policy-protected PDF document.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `protectDocument` method. Populate the byte array by getting the value of the `BLOB` object's `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a PDF file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Applying a policy to a PDF document using the web service API"
* "Quick Start (SwaRef): Applying a policy to a PDF document using the web service API "

## Removing Policies from PDF Documents {#removing-policies-from-pdf-documents}

You can remove a policy from a policy-protected document to remove security from the document. That is, if you no longer want the document to be protected by a policy. If you want to update a policy-protected document with a newer policy, then instead of removing the policy and adding the updated policy, it is more efficient to switch the policy.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-4}

To remove a policy from a policy-protected PDF document, perform the following steps:

1. Include project files
1. Create a Document Security Client API object.
1. Retrieve a policy-protected PDF document.
1. Remove the policy from the PDF document.
1. Save the unsecured PDF document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, create a Document Security service client object.

**Retrieve a policy-protected PDF document**

You can retrieve a policy-protected PDF document to remove a policy. If you attempt to remove a policy from a PDF document that is not protected by a policy, you will cause an exception.

**Remove the policy from the PDF document**

You can remove a policy from a policy-protected PDF document provided that an administrator is specified in the connection settings. If not, then the policy used to secure a document must contain the `SWITCH_POLICY` permission to remove a policy from a PDF document. Also, the user specified in the AEM Forms connection settings must also have that permission. Otherwise, an exception is thrown.

**Save the unsecured PDF document**

After the Document Security service removes a policy from a PDF document, you can save the unsecured PDF document as a PDF file.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Applying Policies to PDF Documents](protecting-documents-policies.md#applying-policies-to-pdf-documents)

### Remove a policy from a PDF document using the Java API {#remove-a-policy-from-a-pdf-document-using-the-java-api}

Remove a policy from a policy-protected PDF document by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `DocumentSecurityClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve a policy-protected PDF document.

    * Create a `java.io.FileInputStream` object that represents the policy-protected PDF document by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Remove the policy from the PDF document.

    * Create a `DocumentManager` object by invoking the `DocumentSecurityClient` object's `getDocumentManager` method.
    * Remove a policy from the PDF document by invoking the `DocumentManager` object's `removeSecurity` method and passing the `com.adobe.idp.Document` object that contains the policy-protected PDF document. This method returns a `com.adobe.idp.Document` object that contains an unsecured PDF document.

1. Save the unsecured PDF document.

    * Create a `java.io.File` object and ensure that the file extension is PDF.
    * Invoke the `Document` object's `copyToFile` method to copy the contents of the `Document` object to the file (ensure that you use the `Document` object that was returned by the `removeSecurity` method).

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (SOAP mode): Removing a policy from a PDF document using the Java API"

### Remove a policy using the web service API {#remove-a-policy-using-the-web-service-api}

Remove a policy from a policy-protected PDF document using the Document Security API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `DocumentSecurityServiceClient` object by using its default constructor.
    * Create a `DocumentSecurityServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `DocumentSecurityServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a policy-protected PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the policy-protected PDF document from which the policy is removed.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Remove the policy from the PDF document.

   Remove the policy from the PDF document by invoking the `DocumentSecurityServiceClient` object's `removePolicySecurity` method and passing the `BLOB` object that contains the policy-protected PDF document. This method returns a `BLOB` object that contains an unsecured PDF document.

1. Save the unsecured PDF document.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the unsecured PDF document.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `removePolicySecurity` method. Populate the byte array by getting the value of the `BLOB` object's `MTOM` field.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Removing a policy from a PDF document using the web service API "
* "Quick Start (SwaRef): Removing a policy from a PDF document using the web service API"

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Revoking Access to Documents {#revoking-access-to-documents}

You can revoke access to a policy-protected PDF document resulting in all copies of the document being inaccessible to users. When a user attempts to open a revoked PDF document, they are redirected to a specified URL where a revised document can be viewed. The URL to where the user is redirected must be programmatically specified. When you revoke access to a document, the change takes effect the next time the user synchronizes with the Document Security service by opening the policy-protected document online.

The ability to revoke access to a document provides additional security. For example, assume a newer version of a document is available and you no longer want anyone viewing the outdated version. In this situation, access to the older document can be revoked, and nobody can view the document unless access is reinstated.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-5}

To revoke a policy-protected document, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Retrieve a policy-protected PDF document.
1. Revoke the policy-protected document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, you must create a Document Security service client object.

**Retrieve a policy-protected PDF document**

Retrieve a policy-protected PDF document to revoke it. You cannot revoke a document that has already been revoked or is not a policy-protected document.

If you know the license identifier value of the policy-protected document, then it is not necessary to retrieve the policy-protected PDF document. However, in most cases, you must retrieve the PDF document to obtain the license identifier value.

**Revoke the policy-protected document**

To revoke a policy-protected document, specify the license identifier of the policy-protected document. In addition, you can specify the URL of a document that the user can view when they attempt to open the revoked document. That is, assume that an outdated document is revoked. When a user attempts to open the revoked document, they will see an updated document instead of the revoked document.

>[!NOTE]
>
>If you attempt to revoke a document that is already revoked, an exception is thrown.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Applying Policies to PDF Documents](protecting-documents-policies.md#applying-policies-to-pdf-documents)

[Reinstating Access to Revoked Documents](protecting-documents-policies.md#reinstating-access-to-revoked-documents)

### Revoke access to documents using the Java API {#revoke-access-to-documents-using-the-java-api}

Revoke access to a policy-protected PDF document by using the Document Security API (Java):

1. Include project files

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `DocumentSecurityClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve a policy-protected PDF document

    * Create a `java.io.FileInputStream` object that represent the policy-protected PDF document by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Revoke the policy-protected document

    * Create a `DocumentManager` object by invoking the `DocumentSecurityClient` object's `getDocumentManager` method.
    * Retrieve the license identifier value of the policy-protected document by invoking the `DocumentManager` object's `getLicenseId` method. Pass the `com.adobe.idp.Document` object that represents the policy-protected document. This method returns a string value that represents the license identifier value.
    * Create a `LicenseManager` object by invoking the `DocumentSecurityClient` object's `getLicenseManager` method.
    * Revoke the policy-protected document by invoking the `LicenseManager` object's `revokeLicense` method and passing the following values:

        * A string value that specifies the license identifier value of the policy-protected document (specify the return value of the `DocumentManager` object's `getLicenseId` method).
        * A static data member of the `License` interface that specifies the reason to revoke the document. For example, you can specify `License.DOCUMENT_REVISED`.
        * A `java.net.URL` value that specifies the location to where a revised document is located. If you do not want to redirect a user to another URL, then you can pass `null`.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (SOAP mode): Revoking a document using the Java API"

### Revoke access to documents using the web service API {#revoke-access-to-documents-using-the-web-service-api}

Revoke access to a policy-protected PDF document by using the Document Security API (web service):

1. Include project files

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object

    * Create a `DocumentSecurityServiceClient` object by using its default constructor.
    * Create a `DocumentSecurityServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `DocumentSecurityServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a policy-protected PDF document

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a policy-protected PDF document that is revoked.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the policy-protected PDF document to revoke and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Revoke the policy-protected document

    * Retrieve the license identifier value of the policy-protected document by invoking the `DocumentSecurityServiceClient` object's `getLicenseID` method and passing the `BLOB` object that represents the policy-protected document. This method returns a string value that represents the license identifier.
    * Revoke the policy-protected document by invoking the `DocumentSecurityServiceClient` object's `revokeLicense` method and passing the following values:

        * A string value that specifies the license identifier value of the policy-protected document (specify the return value of the `DocumentSecurityServiceService` object's `getLicenseId` method).
        * A static data member of the `Reason` enum that specifies the reason to revoke the document. For example, you can specify `Reason.DOCUMENT_REVISED`.
        * A `string` value that specifies the URL location to where a revised document is located. If you do not want to redirect a user to another URL, then you can pass `null`.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Revoking a document using the web service API"
* "Quick Start (SwaRef): Revoking a document using the web service API"

**See also**

[Removing Policies from Word Documents](protecting-documents-policies.md#removing-policies-from-word-documents)

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Reinstating Access to Revoked Documents {#reinstating-access-to-revoked-documents}

You can reinstate access to a revoked PDF document, resulting in all copies of the revoked document being accessible to users. When a user opens a reinstated document that was revoked, the user is able to view the document.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-6}

To reinstate access to a revoked PDF document, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Retrieve the license identifier of the revoked PDF document.
1. Reinstate access to the revoked PDF document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, you must create a Document Security service client object. If you are using the Java API, create a `DocumentSecurityClient` object. If you are using the Document Security web service API, create a `DocumentSecurityServiceService` object.

**Retrieve the license identifier of the revoked PDF document**

Retrieve the license identifier of the revoked PDF document to reinstate a revoked PDF document. After you obtain the license identifier value, you can reinstate a revoked document. If you attempt to reinstate a document that is not revoked, you will cause an exception.

**Reinstate access to the revoked PDF document**

To reinstate access to a revoked PDF document, you must specify the license identifier of the revoked document. If you attempt to reinstate access to a PDF document that is not revoked, you will cause an exception.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Applying Policies to PDF Documents](protecting-documents-policies.md#applying-policies-to-pdf-documents)

[Revoking Access to Documents](protecting-documents-policies.md#revoking-access-to-documents)

### Reinstate access to revoked documents using the Java API {#reinstate-access-to-revoked-documents-using-the-java-api}

Reinstate access to a revoked document by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `DocumentSecurityClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve the license identifier of the revoked PDF document.

    * Create a `java.io.FileInputStream` object that represents the revoked PDF document by using its constructor and passing a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.
    * Create a `DocumentManager` object by invoking the `DocumentSecurityClient` object's `getDocumentManager` method.
    * Retrieve the license identifier value of the revoked document by invoking the `DocumentManager` object's `getLicenseId` method and passing the `com.adobe.idp.Document` object that represents the revoked document. This method returns a string value that represents the license identifier.

1. Reinstate access to the revoked PDF document.

    * Create a `LicenseManager` object by invoking the `DocumentSecurityClient` object's `getLicenseManager` method.
    * Reinstate access to the revoked PDF document by invoking the `LicenseManager` object's `unrevokeLicense` method and passing the license identifier value of the revoked document.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (SOAP mode): Reinstating access to a revoked document using the web service API"

### Reinstate access to revoked documents using the web service API {#reinstate-access-to-revoked-documents-using-the-web-service-api}

Reinstate access to a revoked document using the Document Security API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `DocumentSecurityServiceClient` object by using its default constructor.
    * Create a `DocumentSecurityServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `DocumentSecurityServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve the license identifier of the revoked PDF document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a revoked PDF document to which access is reinstated.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the revoked PDF document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Reinstate access to the revoked PDF document.

    * Retrieve the license identifier value of the revoked document by invoking the `DocumentSecurityServiceClient` object's `getLicenseID` method and passing the `BLOB` object that represents the revoked document. This method returns a string value that represents the license identifier.
    * Reinstate access to the revoked PDF document by invoking the `DocumentSecurityServiceClient` object's `unrevokeLicense` method and passing a string value that specifies the license identifier value of the revoked PDF document (pass the return value of the `DocumentSecurityServiceClient` object's `getLicenseId` method).

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Reinstating access to a revoked document using the web service API"
* "Quick Start (SwaRef): Reinstating access to a revoked document using the web service API"

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Inspecting Policy Protected PDF Documents {#inspecting-policy-protected-pdf-documents}

You can use the Document Security Service API (Java and web service) to inspect policy-protected PDF documents. Inspecting policy-protected PDF documents returns information about the policy-protected PDF document. You can, for example, determine the policy that was used to secure the document and the date when the document was secured.

You cannot perform this task if your version of LiveCycle is 8.x or an earlier version. Support for inspecting policy-protected documents is added in AEM Forms. If you attempt to inspect a policy-protected document using LiveCycle 8.x (or earlier), an exception is thrown.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-7}

To inspect a policy-protected PDF document, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Retrieve a policy-protected document to inspect.
1. Obtain information about the policy-protected document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, include the necessary JAR files. If you are using web services, make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, create a Document Security service client object. If you are using the Java API, create a `RightsManagementClient` object. If you are using the Document Security web service API, create a `RightsManagementServiceService` object.

**Retrieve a policy-protected document to inspect**

To inspect a policy-protected document, retrieve it. If you attempt to inspect a document that is not secured with a policy or is revoked, an exception is thrown.

**Inspect the document**

After you retrieve a polciy-protected document, you can inspect it.

**Obtain information about the policy-protected document**

After you inspect a policy-protected PDF document, you can obtain information about it. For example, you can determine the policy that is used to secure the document.

If you secure a document with a policy that belongs to My Policies and then call `RMInspectResult.getPolicysetName` or `RMInspectResult.getPolicysetId`, null is returned.

If the document is secured using a policy that is contained in a policy set (other than My Policies) then `RMInspectResult.getPolicysetName` and `RMInspectResult.getPolicysetId` return valid strings.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Inspect Policy Protected PDF Documents using the Java API {#inspect-policy-protected-pdf-documents-using-the-java-api}

Inspect a policy-protected PDF document by using the Document Security Service API (Java):

1. Include project files.

   Include client JAR files, such as the adobe-rightsmanagement-client.jar, in your Java project's class path. For information about the location of these files, see [Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files).

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties. (See [Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties).)
    * Create a `RightsManagementClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve a policy-protected document to inspect.

    * Create a `java.io.FileInputStream` object that represents the policy-protected PDF document by using its constructor. Pass a string value that specifies the location of the PDF document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Inspect the document.

    * Create a `DocumentManager` object by invoking the `RightsManagementClient` object's `getDocumentManager` method.
    * Inspect the policy-protected document by invoking the `LicenseManager` object's `inspectDocument` method. Pass the `com.adobe.idp.Document` object that contains the policy-protected PDF document. This method returns a `RMInspectResult` object that contains information about the policy-protected document.

1. Obtain information about the policy-protected document.

   To obtain information about the policy-protected document, invoke the appropriate method that belongs `RMInspectResult` object. For example, to retrieve the policy name, invoke the `RMInspectResult` object's `getPolicyName` method.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (SOAP mode): Inspecting policy protected PDF documents using the Java API"

### Inspect Policy Protected PDF Documents using the web service API {#inspect-policy-protected-pdf-documents-using-the-web-service-api}

Inspect a policy-protected PDF document by using the Document Security Service API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `RightsManagementServiceClient` object by using its default constructor.
    * Create a `RightsManagementServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `RightsManagementServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `RightsManagementServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `RightsManagementServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a policy-protected document to inspect.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a PDF document to inspect.
    * Create a `System.IO.FileStream` object by invoking its constructor. Pass a string value that represents the file location of the PDF document and the mode to open the file in.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method. Pass the byte array, starting position, and stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Inspect the document.

   Inspect the policy-protected document by invoking the `RightsManagementServiceClient` object's `inspectDocument` method. Pass the `BLOB` object that contains the policy-protected PDF document. This method returns a `RMInspectResult` object that contains information about the policy-protected document.

1. Obtain information about the policy-protected document.

   To obtain information about the policy-protected document, get the value of the appropriate field that belongs to the `RMInspectResult` object. For example, to retrieve the policy name, get the value of the `RMInspectResult` object's `policyName` field.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Inspecting policy protected PDF documents using the web service API"
* "Quick Start (SwaRef): Inspecting policy protected PDF documents using the web service API"

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Creating Watermarks {#creating-watermarks}

Watermarks help ensure the security of a document by uniquely identifying the document and controlling copyright infringement. For example, you can create and place a watermark that states Confidential on all pages of a document. After a watermark is created, you can include it as part of a policy. That is, you can set the policy's watermark attribute with the newly created watermark. After a policy that contains a watermark is applied to a document, the watermark appears in the policy-protected document.

>[!NOTE]
>
>Only users with Document Security administrative privileges can create watermarks. That is, you must specify such a user when defining connection settings required to create a Document Security service client object.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-8}

To create a watermark, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Set the watermarks attributes.
1. Register the watermark with the Document Security service.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, you must create a Document Security service client object. If you are using the Java API, create a `RightsManagementClient` object. If you are using the Document Security web service API, create a `RightsManagementServiceService` object.

**Set the watermarks attributes**

To create a watermark, you must set watermark attributes. The name attribute must always be defined. In addition to the name attribute, you must set at least one of the following attributes:

* Custom Text
* DateIncluded
* UserIdIncluded
* UserNameIncluded

The following table lists key and value pairs that are required when creating a watermark using web services.

<table>
 <thead>
  <tr>
   <th><p>Key Name</p></th>
   <th><p>Description</p></th>
   <th><p>Value</p></th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><p><code>WaterBackCmd:IS_USERNAME_ENABLED</code></p></td>
   <td><p>Specifies if the user name of the user opening the document is part of the watermark.</p></td>
   <td><p>True or False</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:IS_USERID_ENABLED</code></p></td>
   <td><p>Specifies if the identification of the user opening the document is part of the watermark.</p></td>
   <td><p>True or False</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:IS_CURRENTDATE_ENABLED</code></p></td>
   <td><p>Specifies if the current date is part of the watermark.</p></td>
   <td><p>True or False</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:IS_CUSTOMTEXT_ENABLED</code></p></td>
   <td><p>If this value is true, then the value of the custom text must be specified using <code>WaterBackCmd:SRCTEXT</code>.</p></td>
   <td><p>True or False</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:OPACITY</code></p></td>
   <td><p>Specifies the opacity of the watermark. The default value is 0.5 if it is not specified.</p></td>
   <td><p>A value between 0.0&ndash;1.0.</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:ROTATION</code></p></td>
   <td><p>Specifies the rotation of the watermark. The default value is 0 degrees.</p></td>
   <td><p>A value between 0&ndash;359.</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:SCALE</code></p></td>
   <td><p>If this value is specified, then <code>WaterBackCmd:IS_SIZE_ENABLED</code> must be present and the value must be true. If this attribute is not specified, the default behavior is fit to page.</p></td>
   <td><p>A value greater than 0.0 and less than or equal to 1.0.</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:HORIZ_ALIGN</code></p></td>
   <td><p>Specifies the watermark's horizontal alignment. The default value is center.</p></td>
   <td><p>left, center, or right</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:VERT_ALIGN</code></p></td>
   <td><p>Specifies the watermark's vertical alignment. The default value is center.</p></td>
   <td><p>top, center, or bottom</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:IS_USE_BACKGROUND</code></p></td>
   <td><p>Specifies if the watermark is a background. The default value is false.</p></td>
   <td><p>True or False</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:IS_SIZE_ENABLED</code></p></td>
   <td><p>True if a custom scale is specified. If this value is true, SCALE must also be specified. If this value is false, then the default is fit to page.</p></td>
   <td><p>True or False</p></td>
  </tr>
  <tr>
   <td><p><code>WaterBackCmd:SRCTEXT</code></p></td>
   <td><p>Specifies the custom text for a watermark. If this value is present, then <code>WaterBackCmd:IS_CUSTOMTEXT_ENABLED</code> must also be present and set to true.</p></td>
   <td><p>True or False</p></td>
  </tr>
 </tbody>
</table>

All watermarks must have one of the following attributes defined:

* `WaterBackCmd:IS_USERNAME_ENABLED`
* `WaterBackCmd:IS_USERID_ENABLED`
* `WaterBackCmd:IS_CURRENTDATE_ENABLED`
* `WaterBackCmd:IS_CUSTOMTEXT_ENABLED`

All other attributes are optional.

**Register the watermark**

A new watermark must be registered with the Document Security service before it can be used. After you register a watermark, you can use it within policies.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Applying Policies to PDF Documents](protecting-documents-policies.md#applying-policies-to-pdf-documents)

### Create watermarks using the Java API {#create-watermarks-using-the-java-api}

Create a watermark by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as the `adobe-rightsmanagement-client.jar`, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `RightsManagementClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Set the watermark attributes

    * Create a `Watermark` object by invoking the `InfomodelObjectFactory` object's static `createWatermark` method. This method returns a `Watermark` object.
    * Set the watermark's name attribute by invoking the `Watermark` object's `setName` method and passing a string value that specifies the policy name.
    * Set the watermark's background attribute by invoking the `Watermark` object's `setBackground` method and passing `true`. By setting this attribute, the watermark appears in the background of the document.
    * Set the watermark's custom text attribute by invoking the `Watermark` object's `setCustomText` method and passing a string value that represents the watermark's text.
    * Set the watermark's opacity attribute by invoking the `Watermark` object's `setOpacity` method and passing an integer value that specifies the opacity level. A value of 100 indicates that the watermark is completely opaque and a value of 0 indicates that the watermark is completely transparent.

1. Register the watermark.

    * Create a `WatermarkManager` object by invoking the `RightsManagementClient` object's `getWatermarkManager` method. This method returns a `WatermarkManager` object.
    * Register the watermark by invoking the `WatermarkManager` object's `registerWatermark` method and passing the `Watermark` object that represents the watermark to register. This method returns a string value that represents the watermark's identification value.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (SOAP mode): Creating a watermark using the Java API"

### Create watermarks using the web service API {#create-watermarks-using-the-web-service-api}

Create a watermark by using the Document Security API (web service):

1. Create a Document Security Client API object.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `RightsManagementServiceClient` object by using its default constructor.
    * Create a `RightsManagementServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `RightsManagementServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `RightsManagementServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `RightsManagementServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Set the watermark attributes.

    * Create a `WatermarkSpec` object by invoking the `WatermarkSpec` constructor.
    * Set the watermark's name by assigning a string value to the `WatermarkSpec` object's `name` data member.
    * Set the watermark's `id` attribute by assigning a string value to the `WatermarkSpec` object's `id` data member.
    * For each watermark property to set, create a separate `MyMapOf_xsd_string_To_xsd_anyType_Item` object.
    * Set the key value by assigning a value to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `key` data member (for example, `WaterBackCmd:OPACITY)`.
    * Set the value by assigning a value to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `value` data member (for example, `.25`).
    * Create a `MyArrayOf_xsd_anyType` object. For each `MyMapOf_xsd_string_To_xsd_anyType_Item` object, invoke the `MyArrayOf_xsd_anyType` object's `Add` method. Pass the `MyMapOf_xsd_string_To_xsd_anyType_Item` object.
    * Assign the `MyArrayOf_xsd_anyType` object to the `WatermarkSpec` object's `values` data member.

1. Register the watermark.

   Register the watermark by invoking the `RightsManagementServiceClient` object's `registerWatermark` method and passing the `WatermarkSpec` object that represents the watermark to register.

**Code examples**

For code examples using the Document Security service, see the following Quick Starts:

* "Quick Start (MTOM): Creating a watermark using the web service API"
* "Quick Start (SwaRef): Creating a watermark using the web service API"

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Modifying Watermarks {#modifying-watermarks}

You can modify an existing watermark using the Document Security Java API or web service API. To change an existing watermark, you retrieve it, modify its attributes, and then update it on the server. For example, assume that you retrieve an watermark and modify its opacity attribute. Before the change takes effect, you must update the watermark.

When you modify a watermark, the change impacts future documents that have the watermark applied to them. That is, existing PDF documents that contain the watermark are not affected.

>[!NOTE]
>
>Only users with Document Security administrative privileges can modify watermarks. That is, you must specify such a user when defining connection settings required to create a Document Security service client object.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-9}

To modify a watermark, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Retrieve the watermark to modify.
1. Set the watermarks attributes.
1. Update the watermark.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, you must create a Document Security service client object. If you are using the Java API, create a `DocumentSecurityClient` object. If you are using the Document Security web service API, create a `DocumentSecurityServiceService` object.

**Retrieve the watermark to modify**

To modify a watermark, you must retrieve an existing watermark. You can retrieve a watermark by specifying its name or by specifying its identifier value.

**Set the watermarks attributes**

To modify an existing watermark, change the value of one or more watermark attributes. When programmatically updating a watermark using a web service, you must set all the attributes that were originally set, even if the value does not change. For example, assume the following watermark attributes are set: `WaterBackCmd:IS_USERID_ENABLED`, `WaterBackCmd:IS_CUSTOMTEXT_ENABLED`, `WaterBackCmd:OPACITY`, and `WaterBackCmd:SRCTEXT`. Although the only attribute that you want to modify is `WaterBackCmd:OPACITY`, you must set the other values are well.

>[!NOTE]
>
>When using the Java API to modify a watermark, you do not need to specify all attributes. Set the watermark attribute that you want to modify.

>[!NOTE]
>
>For information about the watermark attribute names, see [Creating Watermarks](protecting-documents-policies.md#creating-watermarks).

**Update the watermark**

After you modify a watermark's attributes, you must update the watermark.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Creating Watermarks](protecting-documents-policies.md#creating-watermarks)

### Modify watermarks using the Java API {#modify-watermarks-using-the-java-api}

Modify a watermark by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as the adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `DocumentSecurityClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve the watermark to modify.

   Create a `WatermarkManager` object by invoking the `DocumentSecurityClient` object's `getWatermarkManager` method and pass a string value that specifies the watermark name. This method returns a `Watermark` object that represents the watermark to modify.

1. Set the watermark attributes.

   Set the watermark's opacity attribute by invoking the `Watermark` object's `setOpacity` method and passing an integer value that specifies the opacity level. A value of 100 indicates that the watermark is completely opaque and a value of 0 indicates that the watermark is completely transparent.

   >[!NOTE]
   >
   >This example modifies only the opacity attribute.

1. Update the watermark.

    * Update the watermark by invoking the `WatermarkManager` object's `updateWatermark` method and pass the `Watermark` object whose attribute was modified.

**Code examples**

For code examples using the Document Security service, see the Quick Start(SOAP mode): Modifying a watermark using the Java API section.

### Modify watermarks using the web service API {#modify-watermarks-using-the-web-service-api}

Modify a watermark by using the Document Security API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `DocumentSecurityServiceClient` object by using its default constructor.
    * Create a `RightsManagementServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/DocumentSecurityService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `DocumentSecurityServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve the watermark to modify.

   Retrieve the watermark to modify by invoking the `DocumentSecurityServiceClient` object's `getWatermarkByName` method. Pass a string value that specifies the watermark name. This method returns a `WatermarkSpec` object that represents the watermark to modify.

1. Set the watermark attributes.

    * For each watermark property to update, create a separate `MyMapOf_xsd_string_To_xsd_anyType_Item` object.
    * Set the key value by assigning a value to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `key` data member (for example, `WaterBackCmd:OPACITY)`.
    * Set the value by assigning a value to the `MyMapOf_xsd_string_To_xsd_anyType_Item` object's `value` data member (for example, `.50`).
    * Create a `MyArrayOf_xsd_anyType` object. For each `MyMapOf_xsd_string_To_xsd_anyType_Item` object, invoke the `MyArrayOf_xsd_anyType` object's `Add` method. Pass the `MyMapOf_xsd_string_To_xsd_anyType_Item` object.
    * Assign the `MyArrayOf_xsd_anyType` object to the `WatermarkSpec` object's `values` data member.

1. Update the watermark.

   Update the watermark by invoking the `DocumentSecurityServiceClient` object's `updateWatermark` method and passing the `WatermarkSpec` object that represents the watermark to modify.

**Code examples**

For code examples using the Document Security service, see the following Quick Start:

* "Quick Start (MTOM): Modifying a watermark using the web service API"

## Searching for Events {#searching-for-events}

The Rights Management service tracks specific actions as they occur, such as applying a policy to a document, opening a policy-protected document, and revoking access to documents. Event auditing must be enabled for the Rights Management service or events are not tracked.

Events fall into one of the following categories:

* Administrator events are actions related to an administrator, such as creating an administrator account.
* Document events are actions related to a document, such as closing a policy-protected document.
* Policy events are actions related to a policy, such as creating a policy.
* Service events are actions related to the Rights Management service, such as synchronizing with the user directory.

You can search for specify specific events by using the Rights Management Java API or web service API. By searching for events, you can perform tasks, such as creating a log file of certain events.

>[!NOTE]
>
>For more information about the Rights Management service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-10}

To search for a Rights Management event, perform the following steps:

1. Include project files.
1. Create a Rights Management Client API object.
1. Specify the event for which to search.
1. Search for the event.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Rights Management Client API object**

Before you can programmatically perform a Rights Management service operation, you must create a Rights Management service client object. If you are using the Java API, create a `DocumentSecurityClient` object. If you are using the Rights Management web service API, create a `DocumentSecurityServiceService` object.

**Specify the events to search for**

Specify the event to search for. For example, you can search for the policy create event, which occurs when a new policy is created.

**Search for the event**

After you specify the event to search for, you can use either the Rights Management Java API or the Rights Management web service API to search for the event.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

### Search for events using the Java API {#search-for-events-using-the-java-api}

Search for events by using the Rights Management API (Java):

1. Include project files

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Rights Management Client API object

   Create a `DocumentSecurityClient` object by using its constructor and passing a `ServiceClientFactory` object that contains connection properties.

1. Specify the events to search for

    * Create an `EventManager` object by invoking the `DocumentSecurityClient` object's `getEventManager` method. This method returns an `EventManager` object.
    * Create an `EventSearchFilter` object by invoking its constructor.
    * Specify the event for which to search by invoking the `EventSearchFilter` object's `setEventCode` method and passing a static data member that belongs to the `EventManager` class that represents the event for which to search. For example, to search for the policy create event, pass `EventManager.POLICY_CREATE_EVENT`.

   >[!NOTE]
   >
   >You can define additional search criteria by invoking `EventSearchFilter` object methods. For example, invoke the `setUserName` method to specify a user associated with the event.

1. Search for the event

   Search for the event by invoking the `EventManager` object's `searchForEvents` method and passing the `EventSearchFilter` object that defines the event search criteria. This method returns an array of `Event` objects.

**Code examples**

For code examples using the Rights Management service, see the following Quick Starts:

* "Quick Start (SOAP): Searching for events using the Java API"

### Search for events using the web service API {#search-for-events-using-the-web-service-api}

Search for events by using the Rights Management API (web service):

1. Include project files

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Rights Management Client API object

    * Create a `DocumentSecurityServiceClient` object by using its default constructor.
    * Create a `DocumentSecurityServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `DocumentSecurityServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Specify the events to search for

    * Create an `EventSpec` object by using its constructor.
    * Specify the start of the time period during which the event occurred by setting the `EventSpec` object's `firstTime.date` data member with `DataTime` instance that represents the start of the date range when the event occurred.
    * Assign the value `true` to the `EventSpec` object's `firstTime.dateSpecified` data member.
    * Specify the end of the time period during which the event occurred by setting the `EventSpec` object's `lastTime.date` data member with `DataTime` instance that represents the end of the date range when the event occurred.
    * Assign the value `true` to the `EventSpec` object's `lastTime.dateSpecified` data member.
    * Set the event to search for by assigning a string value to the `EventSpec` object's `eventCode` data member. The following table lists the numeric values that you can assign to this property:

    <table>
    <thead>
    <tr>
    <th><p>Event type</p></th>
    <th><p>Value</p></th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td><p><code>ALL_EVENTS</code></p></td>
    <td><p>999</p></td>
    </tr>
    <tr>
    <td><p><code>USER_CHANGE_PASSWORD_EVENT</code></p></td>
    <td><p>1000</p></td>
    </tr>
    <tr>
    <td><p><code>USER_REGISTER_EVENT</code></p></td>
    <td><p>1001</p></td>
    </tr>
    <tr>
    <td><p><code>USER_PREREGISTER_EVENT</code></p></td>
    <td><p>1002</p></td>
    </tr>
    <tr>
    <td><p><code>USER_ACTIVATE_EVENT</code></p></td>
    <td><p>1003</p></td>
    </tr>
    <tr>
    <td><p><code>USER_DEACTIVATE_EVENT</code></p></td>
    <td><p>1004</p></td>
    </tr>
    <tr>
    <td><p><code>USER_AUTHENTICATE_EVENT</code></p></td>
    <td><p>1005</p></td>
    </tr>
    <tr>
    <td><p><code>USER_AUTHENTICATE_DENY_EVENT </code></p></td>
    <td><p>1006</p></td>
    </tr>
    <tr>
    <td><p><code>USER_ACCOUNT_LOCK_EVENT</code></p></td>
    <td><p>1007</p></td>
    </tr>
    <tr>
    <td><p><code>USER_DELETE_EVENT </code></p></td>
    <td><p>1008</p></td>
    </tr>
    <tr>
    <td><p><code>USER_UPDATE_PROFILE_EVENT </code></p></td>
    <td><p>1009</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_VIEW_EVENT </code></p></td>
    <td><p>2000</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_PRINT_LOW_EVENT </code></p></td>
    <td><p>2001</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_PRINT_HIGH_EVENT </code></p></td>
    <td><p>2002</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_SIGN_EVENT </code></p></td>
    <td><p>2003</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_ADD_ANNOTATION_EVENT </code></p></td>
    <td><p>2004</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_FORM_FILL_EVENT </code></p></td>
    <td><p>2005</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_CLOSE_EVENT </code></p></td>
    <td><p>2006</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_MODIFY_EVENT </code></p></td>
    <td><p>2007</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_CHANGE_SECURITY_HANDLER_EVENT </code></p></td>
    <td><p>2008</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_SWITCH_POLICY_EVENT </code></p></td>
    <td><p>2009</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_REVOKE_EVENT </code></p></td>
    <td><p>2010</p></td>
    </tr>
    <tr>
    <td><p><code>$1</code></p></td>
    <td><p>2011</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_SECURE_EVENT </code></p></td>
    <td><p>2012</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_UNKNOWN_CLIENT_EVENT </code></p></td>
    <td><p>2013</p></td>
    </tr>
    <tr>
    <td><p><code>DOCUMENT_CHANGE_REVOKE_URL_EVENT </code></p></td>
    <td><p>2014</p></td>
    </tr>
    <tr>
    <td><p><code>POLICY_CHANGE_EVENT </code></p></td>
    <td><p>3000</p></td>
    </tr>
    <tr>
    <td><p><code>POLICY_ENABLE_EVENT </code></p></td>
    <td><p>3001</p></td>
    </tr>
    <tr>
    <td><p><code>POLICY_DISABLE_EVENT </code></p></td>
    <td><p>3002</p></td>
    </tr>
    <tr>
    <td><p><code>POLICY_CREATE_EVENT </code></p></td>
    <td><p>3003</p></td>
    </tr>
    <tr>
    <td><p><code>POLICY_DELETE_EVENT </code></p></td>
    <td><p>3004</p></td>
    </tr>
    <tr>
    <td><p><code>POLICY_CHANGE_OWNER_EVENT </code></p></td>
    <td><p>3005</p></td>
    </tr>
    <tr>
    <td><p><code>SERVER_CLIENT_SYNC_EVENT </code></p></td>
    <td><p>4000</p></td>
    </tr>
    <tr>
    <td><p><code>SERVER_SYNC_DIR_INFO_EVENT </code></p></td>
    <td><p>4001</p></td>
    </tr>
    <tr>
    <td><p><code>SERVER_SYNC_DIR_COMPLETE_EVENT </code></p></td>
    <td><p>4002</p></td>
    </tr>
    <tr>
    <td><p><code>SERVER_VERSION_MISMATCH_EVENT </code></p></td>
    <td><p>4003</p></td>
    </tr>
    <tr>
    <td><p><code>SERVER_CONFIG_CHANGE_EVENT </code></p></td>
    <td><p>4004</p></td>
    </tr>
    <tr>
    <td><p><code>SERVER_ENABLE_OFFLINE_ACCESS_EVENT </code></p></td>
    <td><p>4005</p></td>
    </tr>
    <tr>
    <td><p><code>ADMIN_ADD_EVENT </code></p></td>
    <td><p>5000</p></td>
    </tr>
    <tr>
    <td><p><code>ADMIN_DELETE_EVENT </code></p></td>
    <td><p>5001</p></td>
    </tr>
    <tr>
    <td><p><code>ADMIN_EDIT_EVENT </code></p></td>
    <td><p>5002</p></td>
    </tr>
    <tr>
    <td><p><code>ADMIN_ACTIVATE_EVENT </code></p></td>
    <td><p>5003</p></td>
    </tr>
    <tr>
    <td><p><code>ADMIN_DEACTIVATE_EVENT </code></p></td>
    <td><p>5004</p></td>
    </tr>
    <tr>
    <td><p><code>ERROR_DIRECTORY_SERVICE_EVENT </code></p></td>
    <td><p>6000</p></td>
    </tr>
    <tr>
    <td><p><code>CREATED_POLICYSET_EVENT</code></p></td>
    <td><p>7000</p></td>
    </tr>
    <tr>
    <td><p><code>DELETED_POLICYSET_EVENT</code></p></td>
    <td><p>7001</p></td>
    </tr>
    <tr>
    <td><p><code>MODIFIED_POLICYSET_EVENT</code></p></td>
    <td><p>7002</p></td>
    </tr>
    </tbody>
    </table>

1. Search for the event

   Search for the event by invoking the `DocumentSecurityServiceClient` object's `searchForEvents` method and passing the `EventSpec` object that represents the event for which to search and the maximum number of results. This method returns a `MyArrayOf_xsd_anyType` collection where each element is an `AuditSpec` instance. Using an `AuditSpec` instance, you can obtain information about the event such as the time that it occurred. The `AuditSpec` instance contains a `timestamp` data member that specifies this information.

**Code examples**

For code examples using the Rights Management service, see the following Quick Starts:

* "Quick Start (MTOM): Searching for events using the web service API"
* "Quick Start (SwaRef): Searching for events using the web service API"

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)

[Invoking AEM Forms using SwaRef](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-swaref)

## Applying Policies to Word Documents {#applying-policies-to-word-documents}

In addition to PDF documents, the Rights Mangement service supports additional document formats such as a Microsoft Word document (DOC file) and other Micosoft office file formats. For example, you can apply a policy to a Word document to secure it. By applying a policy to a Word document, you restrict access to the document. You cannot apply a policy to a document if the document is already secured with a policy.

You can monitor the use of a policy-protected Word document after you distribute it. That is, you can see how the document is being used and who is using it. For example, you can find out when somebody has opened the document.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-11}

To apply a policy to a Word document, perform the following steps:

1. Include project files.
1. Create a Document Security Client API object.
1. Retrieve a Word document to which a policy is applied.
1. Apply an existing policy to the Word document.
1. Save the policy-protected Word document.

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client APIobject**

Before you can programmatically perform a Document Security service operation, you must create a Document Security service client object.

**Retrieve a Word document**

Retrieve a Word document to apply a policy. After you apply a policy to the Word document, users are restricted when using the document. For example, if the policy does not enable the document to be opened while offline, then users must be online to open the document.

**Apply an existing policy to the Word document**

To apply a policy to a Word document, you must reference an existing policy and specify which policy set the policy belongs to. The user who is setting the connection properties must have access to the specified policy. If not, an exception occurs.

**Save the Word document**

After the Document Security service applies a policy to a Word document, you can save the policy-protected Word document as a DOC file.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Revoking Access to Documents](protecting-documents-policies.md#revoking-access-to-documents)

### Apply a policy to a Word document using the Java API {#apply-a-policy-to-a-word-document-using-the-java-api}

Apply a policy to a Word document by using the Document Security API (Java):

1. Include project files.

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object.

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `DocumentSecurityClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve a Word document.

    * Create a `java.io.FileInputStream` object that represents the Word document by using its constructor and passing a string value that specifies the location of the Word document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Apply an existing policy to the Word document.

    * Create a `DocumentManager` object by invoking the `DocumentSecurityClient` object's `getDocumentManager` method.
    * Apply a policy to the Word document by invoking the `DocumentManager` object's `protectDocument` method and passing the following values:

        * The `com.adobe.idp.Document` object that contains the Word document to which the policy is applied.
        * A string value that specifies the name of the document.
        * A string value that specifies the name of the policy set to which the policy belongs. You can specify a `null` value that results in the `MyPolicies` policy set being used.
        * A string value that specifies the policy name.
        * A string value that represents the name of the user manager domain of the user who is the publisher of the document. This parameter value is optional and can be null (if this parameter is null, then the next parameter value must be null).
        * A string value that represents the name of the canonical name of the user manager user who is the publisher of the document. This parameter value is optional and can be `null` (if this parameter is `null`, then the previous parameter value must be `null`).
        * A `com.adobe.livecycle.rightsmanagement.Locale` that represents the locale that is used for selecting the MS Office template. This parameter value is optional and you can specify `null`.

      The `protectDocument` method returns a `RMSecureDocumentResult` object that contains the policy-protected Word document.

1. Save the Word document.

    * Invoke the `RMSecureDocumentResult` object's `getProtectedDoc` method to get the policy-protected Word document. This method returns a `com.adobe.idp.Document` object.
    * Create a `java.io.File` object and ensure that the file extension is DOC.
    * Invoke the `com.adobe.idp.Document` object's `copyToFile` method to copy the contents of the `Document` object to the file (ensure that you use the `Document` object that was returned by the `getProtectedDoc` method).

**Code examples**

For code examples using the Document Security service, see the following Quick Start:

* "Quick Start (SOAP mode): Applying a policy to a Word document using the Java API"

### Apply a policy to a Word document using the web service API {#apply-a-policy-to-a-word-document-using-the-web-service-api}

Apply a policy to a Word document by using the Document Security API (web service):

1. Include project files.

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/DocumentSecurityService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object.

    * Create a `DocumentSecurityServiceClient` object by using its default constructor.
    * Create a `DocumentSecurityServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/DocumentSecurityService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `DocumentSecurityServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `DocumentSecurityServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a Word document.

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store a Word document to which a policy is applied.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the Word document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. Determine the byte array size by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method. Pass the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Apply an existing policy to the Word document.

   Apply a policy to the Word document by invoking the `DocumentSecurityServiceClient` object's `protectDocument` method and passing the following values:

    * The `BLOB` object that contains the Word document to which the policy is applied.
    * A string value that specifies the name of the document.
    * A string value that specifies the name of the policy set to which the policy belongs. You can specify a `null` value that results in the `MyPolicies` policy set being used.
    * A string value that specifies the policy name.
    * A string value that represents the name of the user manager domain of the user who is the publisher of the document. This parameter value is optional and can be null (if this parameter is null, then the next parameter value must be `null`).
    * A string value that represents the name of the canonical name of the user manager user who is the publisher of the document. This parameter value is optional and can be null (if this parameter is null, then the previous parameter value must be `null`).
    * A `RMLocale` value that specifies the locale value (for example, `RMLocale.en`).
    * A string output parameter that is used to store the policy identifier value.
    * A string output parameter that is used to store the policy-protected identifier value.
    * A string output parameter that is used to store the mime type (for example, `application/doc`).

   The `protectDocument` method returns a `BLOB` object that contains the policy-protected Word document.

1. Save the Word document.

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the policy-protected Word document.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `protectDocument` method. Populate the byte array by getting the value of the `BLOB` object's `MTOM` data member.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.
    * Write the contents of the byte array to a Word file by invoking the `System.IO.BinaryWriter` object's `Write` method and passing the byte array.

**Code examples**

For code examples using the Document Security service, see the following Quick Start:

* "Quick Start (MTOM): Applying a policy to a Word document using the web service API "

## Removing Policies from Word Documents {#removing-policies-from-word-documents}

You can remove a policy from a policy-protected Word document to remove security from the document. That is, if you no longer want the document to be protected by a policy. If you want to update a policy-protected Word document with a newer policy, then instead of removing the policy and adding the updated policy, it is more efficient to switch the policy.

>[!NOTE]
>
>For more information about the Document Security service, see [Services Reference for AEM Forms](https://www.adobe.com/go/learn_aemforms_services_63).

### Summary of steps {#summary_of_steps-12}

To remove a policy from a policy-protected Word document, perform the following steps:

1. Include project files
1. Create a Document Security Client API object.
1. Retrieve a policy-protected Word document.
1. Remove the policy from the Word document.
1. Save the unsecured Word document.s

**Include project files**

Include necessary files into your development project. If you are creating a client application using Java, then include the necessary JAR files. If you are using web services, then make sure that you include the proxy files.

**Create a Document Security Client API object**

Before you can programmatically perform a Document Security service operation, create a Document Security service client object.

**Retrieve a policy-protected Word document**

Retrieve a policy-protected Word document to remove a policy. If you attempt to remove a policy from a Word document that is not protected by a policy, you will cause an exception.

**Remove the policy from the Word document**

You can remove a policy from a policy-protected Word document provided that an administrator is specified in the connection settings. If not, then the policy used to secure a document must contain the `SWITCH_POLICY` permission to remove a policy from a Word document. Also, the user specified in the AEM Forms connection settings must also have that permission. Otherwise, an exception is thrown.

**Save the unsecured Word document**

After the Document Security service removes a policy from a Word document, you can save the unsecured Word document as a DOC file.

**See also**

[Including AEM Forms Java library files](/help/forms/developing/invoking-aem-forms-using-java.md#including-aem-forms-java-library-files)

[Setting connection properties](/help/forms/developing/invoking-aem-forms-using-java.md#setting-connection-properties)

[Applying Policies to Word Documents](protecting-documents-policies.md#applying-policies-to-word-documents)

### Remove a policy from a Word document using the Java API {#remove-a-policy-from-a-word-document-using-the-java-api}

Remove a policy from a policy-protected Word document by using the Document Security API (Java):

1. Include project files

   Include client JAR files, such as adobe-rightsmanagement-client.jar, in your Java project's class path.

1. Create a Document Security Client API object

    * Create a `ServiceClientFactory` object that contains connection properties.
    * Create a `RightsManagementClient` object by using its constructor and passing the `ServiceClientFactory` object.

1. Retrieve a policy-protected Word document

    * Create a `java.io.FileInputStream` object that represents the policy-protected Word document by using its constructor and passing a string value that specifies the location of the Word document.
    * Create a `com.adobe.idp.Document` object by using its constructor and passing the `java.io.FileInputStream` object.

1. Remove the policy from the Word document

    * Create a `DocumentManager` object by invoking the `RightsManagementClient` object's `getDocumentManager` method.
    * Remove a policy from the Word document by invoking the `DocumentManager` object's `removeSecurity` method and passing the `com.adobe.idp.Document` object that contains the policy-protected Word document. This method returns a `com.adobe.idp.Document` object that contains an unsecured Word document.

1. Save the unsecured Word document

    * Create a `java.io.File` object and ensure that the file extension is DOC.
    * Invoke the `Document` object's `copyToFile` method to copy the contents of the `Document` object to the file (ensure that you use the `Document` object that was returned by the `removeSecurity` method).

**Code examples**

For code examples using the Document Security service, see the following Quick Start:

* "Quick Start (SOAP mode): Removing a policy from a Word document using the Java API "

### Remove a policy from a Word document using the web service API {#remove-a-policy-from-a-word-document-using-the-web-service-api}

Remove a policy from a policy-protected Word document by using the Document Security API (web service):

1. Include project files

   Create a Microsoft .NET project that uses MTOM. Ensure that you use the following WSDL definition: `http://localhost:8080/soap/services/RightsManagementService?WSDL&lc_version=9.0.1`.

   >[!NOTE]
   >
   >Replace `localhost` with the IP address of the server hosting AEM Forms.

1. Create a Document Security Client API object

    * Create a `RightsManagementServiceClient` object by using its default constructor.
    * Create a `RightsManagementServiceClient.Endpoint.Address` object by using the `System.ServiceModel.EndpointAddress` constructor. Pass a string value that specifies the WSDL to the AEM Forms service (for example, `http://localhost:8080/soap/services/RightsManagementService?WSDL`.) You do not need to use the `lc_version` attribute. This attribute is used when you create a service reference.)
    * Create a `System.ServiceModel.BasicHttpBinding` object by getting the value of the `RightsManagementServiceClient.Endpoint.Binding` field. Cast the return value to `BasicHttpBinding`.
    * Set the `System.ServiceModel.BasicHttpBinding` object's `MessageEncoding` field to `WSMessageEncoding.Mtom`. This value ensures that MTOM is used.
    * Enable basic HTTP authentication by performing the following tasks:

        * Assign the AEM forms user name to the field `RightsManagementServiceClient.ClientCredentials.UserName.UserName`.
        * Assign the corresponding password value to the field `RightsManagementServiceClient.ClientCredentials.UserName.Password`.
        * Assign the constant value `HttpClientCredentialType.Basic` to the field `BasicHttpBindingSecurity.Transport.ClientCredentialType`.

    * Assign the constant value `BasicHttpSecurityMode.TransportCredentialOnly` to the field `BasicHttpBindingSecurity.Security.Mode`.

1. Retrieve a policy-protected Word document

    * Create a `BLOB` object by using its constructor. The `BLOB` object is used to store the policy-protected Word document from which the policy is removed.
    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the Word document and the mode in which to open the file.
    * Create a byte array that stores the content of the `System.IO.FileStream` object. You can determine the size of the byte array by getting the `System.IO.FileStream` object's `Length` property.
    * Populate the byte array with stream data by invoking the `System.IO.FileStream` object's `Read` method and passing the byte array, the starting position, and the stream length to read.
    * Populate the `BLOB` object by assigning its `MTOM` field with the contents of the byte array.

1. Remove the policy from the Word document

   Remove the policy from the Word document by invoking the `RightsManagementServiceClient` object's `removePolicySecurity` method and passing the `BLOB` object that contains the policy-protected Word document. This method returns a `BLOB` object that contains an unsecured Word document.

1. Save the unsecured Word document

    * Create a `System.IO.FileStream` object by invoking its constructor and passing a string value that represents the file location of the unsecured Word document.
    * Create a byte array that stores the data content of the `BLOB` object that was returned by the `removePolicySecurity` method. Populate the byte array by getting the value of the `BLOB` object's `MTOM` field.
    * Create a `System.IO.BinaryWriter` object by invoking its constructor and passing the `System.IO.FileStream` object.

**Code examples**

For code examples using the Document Security service, see the following Quick Start:

* "Quick Start (MTOM): Removing a policy from a Word document using the web service API"

**See also**

[Invoking AEM Forms using MTOM](/help/forms/developing/invoking-aem-forms-using-web.md#invoking-aem-forms-using-mtom)
