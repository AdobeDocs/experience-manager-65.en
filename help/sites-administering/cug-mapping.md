---
title: Custom User Group Mapping in AEM 6.5
seo-title: Custom User Group Mapping in AEM 6.5
description: Lear how Custom User Group Mapping works in AEM.
seo-description: Lear how Custom User Group Mapping works in AEM.
uuid: 7520351a-ab71-4661-b214-a0ef012c0c93
contentOwner: User
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: Security
content-type: reference
discoiquuid: 13085dd3-d283-4354-874b-cd837a9db9f9
docset: aem65
exl-id: 661602eb-a117-454d-93d3-a079584f7a5d
feature: Security
---
# Custom User Group Mapping in AEM 6.5 {#custom-user-group-mapping-in-aem}

## Comparison of JCR Content related to CUG (Custom User Group) {#comparison-of-jcr-content-related-to-cug}

<table>
 <tbody>
  <tr>
   <td><strong>Older AEM Versions</strong></td>
   <td><strong>AEM 6.5</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td><p>Property: cq:cugEnabled</p> <p>Declaring node type: N/A, residual property</p> </td>
   <td><p>Authorization:</p> <p>Node: rep:cugPolicy of node type rep:CugPolicy</p> <p>Declaring node type: rep:CugMixin</p> <p> </p> <p> </p> <p> </p> Authentication:</p> <p>Mixin type: granite:AuthenticationRequired</p> </td>
   <td><p>To restrict read access, a dedicated CUG policy is applied to the target node.</p> <p>NOTE: Policies can only be applied at the configured supported paths.</p> <p>Nodes with name rep:cugPolicy and type rep:CugPolicy are protected and cannot be written using regular JCR API calls; use JCR access control management instead.</p> <p>See <a href="https://jackrabbit.apache.org/oak/docs/security/authorization/cug.html">this page</a> for more info.</p> <p>To enforce authentication requirement on a node, it is sufficient to add the mixin type granite:AuthenticationRequired.</p> <p>NOTE: Only respected below the configured supported paths.</p> </td>
  </tr>
  <tr>
   <td><p>Property: cq:cugPrincipals</p> <p>Declaring node type: NA, residual property</p> </td>
   <td><p>Property: rep:principalNames</p> <p>Declaring node type: rep:CugPolicy</p> </td>
   <td><p>The property containing the names of those principals that are allowed to read the content below the restricted CUG is protected and cannot be written using regular JCR API calls; use JCR access control management instead.</p> <p>See <a href="https://jackrabbit.apache.org/api/2.12/org/apache/jackrabbit/api/security/authorization/PrincipalSetPolicy.html">this page</a> for more details on the implementation.</p> </td>
  </tr>
  <tr>
   <td><p>Property: cq:cugLoginPage</p> <p>Declaring node type: NA, residual property</p> </td>
   <td><p>Property: granite:loginPath (optional)</p> <p>Declaring node type: granite:AuthenticationRequired</p> </td>
   <td><p>A JCR node that has the mixin type granite:AuthenticationRequired defined, may optionally define an alternative login path.</p> <p>NOTE: Only respected below the configured supported paths.</p> </td>
  </tr>
  <tr>
   <td><p>Property: cq:cugRealm</p> <p>Declaring node type: NA, residual property</p> </td>
   <td>NA</td>
   <td>No longer supported with the new implementation.</td>
  </tr>
 </tbody>
</table>

## Comparison of OSGi Services {#comparison-of-osgi-services}

**Older AEM Versions**

Label: Adobe Granite Closed User Group (CUG) Support

Name: com.day.cq.auth.impl.CugSupportImpl

**AEM 6.5**

* Label: Apache Jackrabbit Oak CUG Configuration

  Name: org.apache.jackrabbit.oak.spi.security.authorization.cug.impl.CugConfiguration

  ConfigurationPolicy = REQUIRED

* Label: Apache Jackrabbit Oak CUG Exclude List

  Name: org.apache.jackrabbit.oak.spi.security.authorization.cug.impl.CugExcludeImpl

  ConfigurationPolicy = REQUIRED

* Name: com.adobe.granite.auth.requirement.impl.RequirementService
* Label: Adobe Granite Authentication Requirement and Login Path Handler

  Name: com.adobe.granite.auth.requirement.impl.DefaultRequirementHandler

  ConfigurationPolicy = REQUIRED

**Comments**

* Configuration of the CUG authorization and enable/disable the evaluation.
Service to configure exclusion list of principals which should not be affected by the CUG authorization.

  >[!NOTE]
  > 
  >If the `CugExcludeImpl` is not configured, the `CugConfiguration` falls back to the default.

  It is possible to plug a custom CugExclude implementation if there are special needs.

* OSGi component implementing LoginPathProvider that exposes a matching login path to the LoginSelectorHandler. It has a mandatory reference to a RequirementHandler which is used to register the observer that listens to changed auth requirements stored in the content by the means of the granite:AuthenticationRequired mixin type.
* OSGi component implementing RequirementHandler that notifies the SlingAuthenticator about changes to authrequirements.

  As configuration policy for this component is REQUIRE, it is only activated if a set of supported paths is specified.

  Enabling the service launches the RequirementService.

<!-- nested tables not supported - text above is the table>
<table>
 <tbody>
  <tr>
   <td><strong>Older AEM Versions</strong></td>
   <td><strong>AEM 6.5</strong></td>
   <td><strong>Comments</strong></td>
  </tr>
  <tr>
   <td><p>Label: Adobe Granite Closed User Group (CUG) Support</p> <p>Name: com.day.cq.auth.impl.CugSupportImpl</p> </td>
   <td><p>Label: Apache Jackrabbit Oak CUG Configuration</p> <p>Name: org.apache.jackrabbit.oak.spi.security.authorization.cug.impl.CugConfiguration</p> <p>ConfigurationPolicy = REQUIRED</p> </td>
    <td><p>Label: Apache Jackrabbit Oak CUG Exclude List</p> <p>Name: org.apache.jackrabbit.oak.spi.security.authorization.cug.impl.CugExcludeImpl</p> <p>ConfigurationPolicy = REQUIRED</p> <p> </p> <p> </p> <p> </p> <p> </p> </td>
      </tr>
      <tr>
       <td>Name: com.adobe.granite.auth.requirement.impl.RequirementService</td>
      </tr>
      <tr>
       <td><p>Label: Adobe Granite Authentication Requirement and Login Path Handler</p> <p>Name: com.adobe.granite.auth.requirement.impl.DefaultRequirementHandler</p> <p>ConfigurationPolicy = REQUIRED</p> </td>
      </tr>
     </tbody>
    </table> </td>
   <td>
     <tbody>
      <tr>
       <td>Configuration of the CUG authorization and enable/disable the evaluation.</td>
      </tr>
      <tr>
       <td><p>Service to configure exclusion list of principals which should not be affected by the CUG authorization.</p> <p>NOTE: If the CugExcludeImpl is not configured, the CugConfiguration will fall back to the default.</p> <p>It is possible to plug a custom CugExclude implementation in case of special needs.</p> </td>
      </tr>
      <tr>
       <td>OSGi component implementing LoginPathProvider that exposes a matching login path to the LoginSelectorHandler. It has a mandatory reference to a RequirementHandler which is used to register the observer that listens to changed auth requirements stored in the content by the means of the granite:AuthenticationRequired mixin type. </td>
      </tr>
      <tr>
       <td><p>OSGi component implementing RequirementHandler that notifies the SlingAuthenticator about changes to authrequirements.</p> <p>As configuration policy for this component is REQUIRE it will only be activated if a set of supported paths is specified.</p> <p>Enabling the service will launch the RequirementService.</p> </td>
      </tr>
     </tbody>
     </td>
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
-->
