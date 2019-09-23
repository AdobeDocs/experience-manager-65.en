---
title: Custom User Group Mapping in AEM 6.5
seo-title: Custom User Group Mapping in AEM 6.5
description: Lear how Custom User Group Mapping works in AEM.
seo-description: Lear how Custom User Group Mapping works in AEM.
uuid: 834ede97-53fb-4d45-a186-821bb6bd02c5
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
discoiquuid: 4de42da6-d068-4af3-ade5-1b35bb022ed7
index: y
internal: n
snippet: y
---

# Custom User Group Mapping in AEM 6.5{#custom-user-group-mapping-in-aem}

## Comparison of JCR Content related to CUG {#comparison-of-jcr-content-related-to-cug}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>Older AEM Versions</strong></td> 
   <td><strong>AEM 6.5</strong></td> 
   <td><strong>Comments</strong></td> 
  </tr> 
  <tr> 
   <td><p>Property: cq:cugEnabled</p> <p>Declaring node type: N/A, residual property</p> </td> 
   <td> 
    <table border="1" cellpadding="1" cellspacing="0" width="100%"> 
     <tbody> 
      <tr> 
       <td><p>Authorization:</p> <p>Node: rep:cugPolicy of node type rep:CugPolicy</p> <p>Declaring node type: rep:CugMixin</p> <p> </p> <p> </p> <p> </p> </td> 
      </tr> 
      <tr> 
       <td><p>Authentication:</p> <p>Mixin type: granite:AuthenticationRequired</p> </td> 
      </tr> 
     </tbody> 
    </table> </td> 
   <td> 
    <table border="1" cellpadding="1" cellspacing="0" width="100%"> 
     <tbody> 
      <tr> 
       <td><p>In order to restrict read access a dedicated CUG policy is applied to the target node.</p> <p>NOTE: Policies can only be applied at the configured supported paths.</p> <p>Nodes with name rep:cugPolicy and type rep:CugPolicy are protected and cannot be written using regular JCR API calls; use JCR access control management instead.</p> <p>See <a href="http://jackrabbit.apache.org/oak/docs/security/authorization/cug.html" target="_blank">this page</a> for more info.</p> </td> 
      </tr> 
      <tr> 
       <td><p>In order to enforce authentication requirement on a node it is sufcient to add the mixin type granite:AuthenticationRequired.</p> <p>NOTE: Only respected below the configured supported paths.</p> </td> 
      </tr> 
     </tbody> 
    </table> </td> 
  </tr> 
  <tr> 
   <td><p>Property: cq:cugPrincipals</p> <p>Declaring node type: NA, residual property</p> </td> 
   <td><p>Property: rep:principalNames</p> <p>Declaring node type: rep:CugPolicy</p> </td> 
   <td><p>The property containing the names of those principals that are allowed to read the content below the restricted CUG is protected and cannot be written using regular JCR API calls; use JCR access control management instead.</p> <p>See <a href="http://svn.apache.org/repos/asf/jackrabbit/trunk/jackrabbitapi/src/main/java/org/apache/jackrabbit/api/security/authorization/PrincipalSetPolicy.java" target="_blank">this page</a> for more details on the implementation.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Property: cq:cugLoginPage</p> <p>Declaring node type: NA, residual property</p> </td> 
   <td><p>Property: granite:loginPath (optional)</p> <p>Declaring node type: granite:AuthenticationRequired</p> </td> 
   <td><p>A JCR node that has the mixin type granite:AuthenticationRequired defned, may optionally defne an alternative login path.</p> <p>NOTE: Only respected below the confgured supported paths.</p> </td> 
  </tr> 
  <tr> 
   <td><p>Property: cq:cugRealm</p> <p>Declaring node type: NA, residual property</p> </td> 
   <td>NA</td> 
   <td>No longer supported with the new implementation.</td> 
  </tr> 
 </tbody> 
</table>

## Comparison of OSGi Services {#comparison-of-osgi-services}

<table border="1" cellpadding="1" cellspacing="0" width="100%"> 
 <tbody> 
  <tr> 
   <td><strong>Older AEM Versions</strong></td> 
   <td><strong>AEM 6.5</strong></td> 
   <td><strong>Comments</strong></td> 
  </tr> 
  <tr> 
   <td><p>Label: Adobe Granite Closed User Group (CUG) Support</p> <p>Name: com.day.cq.auth.impl.CugSupportImpl</p> </td> 
   <td> 
    <table border="1" cellpadding="1" cellspacing="0" width="100%"> 
     <tbody> 
      <tr> 
       <td><p>Label: Apache Jackrabbit Oak CUG Configuration</p> <p>Name: org.apache.jackrabbit.oak.spi.security.authorization.cug.impl.CugConfiguration</p> <p>ConfgurationPolicy = REQUIRED</p> </td> 
      </tr> 
      <tr> 
       <td><p>Label: Apache Jackrabbit Oak CUG Exclude List</p> <p>Name: org.apache.jackrabbit.oak.spi.security.authorization.cug.impl.CugExcludeImpl</p> <p>ConfgurationPolicy = REQUIRED</p> <p> </p> <p> </p> <p> </p> <p> </p> </td> 
      </tr> 
      <tr> 
       <td>Name: com.adobe.granite.auth.requirement.impl.RequirementService</td> 
      </tr> 
      <tr> 
       <td><p>Label: Adobe Granite Authentication Requirement and Login Path Handler</p> <p>Name: com.adobe.granite.auth.requirement.impl.DefaultRequirementHandler</p> <p>ConfgurationPolicy = REQUIRED</p> </td> 
      </tr> 
     </tbody> 
    </table> </td> 
   <td> 
    <table border="1" cellpadding="1" cellspacing="0" width="100%"> 
     <tbody> 
      <tr> 
       <td>Configuration of the CUG authorization and enable/disable the evaluation.</td> 
      </tr> 
      <tr> 
       <td><p>Service to configure exclusion list of principals which should not be afected by the CUG authorization.</p> <p>NOTE: If the CugExcludeImpl is not configured, the CugConfguration will fallback to the default.</p> <p>It is possible to plug a custom CugExclude implementation in case of special needs.</p> </td> 
      </tr> 
      <tr> 
       <td>OSGi component implementing LoginPathProvider that exposes a matching login path to the LoginSelectorHandler. It has a mandatory reference to a RequirementHandler which is used to register the observer that listens to changed auth requirements stored in the content by the means of the granite:AuthenticationRequired mixin type. </td> 
      </tr> 
      <tr> 
       <td><p>OSGi component implementing RequirementHandler that notifes the SlingAuthenticator about changes to authrequirements.</p> <p>As confguration policy for this component is REQUIRE it will only be activated if a set of supported paths is specifed.</p> <p>Enabling the service will launch the RequirementService.</p> </td> 
      </tr> 
     </tbody> 
    </table> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td> </td> 
   <td> </td> 
  </tr> 
  <tr> 
   <td> </td> 
   <td> </td> 
   <td> </td> 
  </tr> 
 </tbody> 
</table>

