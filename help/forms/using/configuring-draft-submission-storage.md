---
title: Configuring storage services for drafts and submissions

description: Learn how to configure storage for drafts and submissions


topic-tags: publish
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 51ca2844-91f0-453a-9b39-b876399ebecb
solution: Experience Manager, Experience Manager Forms
feature: Forms Portal
role: "Admin, User, Developer"
---
# Configuring storage services for drafts and submissions {#configuring-storage-services-for-drafts-and-submissions}

## Overview {#overview}

With AEM Forms, you can store:

* **Drafts**: A work-in-progress form that end users fill and save for later, and submit afterwards.

* **Submissions**: Submitted forms containing user provided data.

AEM Forms Portal data and metadata services provide support for drafts and submissions. By default the data is stored in the publish instance, which is then reverse-replicated to configured author instance to be available for percolation to other publish instances.

The concern with the existing out-of-the-box approach is, that it stores all the data on publish instance, including the data which can be Personal Identifiable Information (PII).

In addition to above mentioned default approach, an alternative implementation is also available for directly pushing the form data to processing instead of saving it locally. Customers having concerns about storage of potentially sensitive data on publish instance can choose the alternative implementation in which the data is sent to a processing server. Since processing happens on the author instance, it typically stays in a secure zone.

>[!NOTE]
>
>When you use the Forms Portal submit action or enable the Store data in forms portal option in adaptive form, the form data is stored in AEM repository. In a production environment, it is recommended not to store draft or submitted form data in AEM repository. Instead, you must integrate the drafts and submission component with a secure storage like enterprise database to store drafts and submitted forms data.
>
>For more information, see [Sample for integrating drafts & submissions component with database](/help/forms/using/integrate-draft-submission-database.md).

## Configuring Forms Portal drafts and submissions services {#configuring-forms-portal-drafts-and-submissions-services}

In the AEM Web Console Configuration ( `https://[host]:'port'/system/console/configMgr`), click to open **Forms Portal Draft and Submission Configuration** in edit mode.

Specify the values for properties based on your requirements as described below:

### Out of the box services to store data on publish instance {#out-of-the-box-services-to-store-data-on-publish-instance}

Data is reverse replicated to configured author instance.

<table>
 <tbody>
  <tr>
   <th>Property</th>
   <th>Value</th>
  </tr>
  <tr>
   <td>Forms Portal Draft Data Service(Identifier for draft data service (<strong>draft.data.service</strong>))</td>
   <td>com.adobe.fd.fp.service.impl.DraftDataServiceImpl<br /> </td>
  </tr>
  <tr>
   <td>Forms Portal Draft Metadata Service (Identifier for draft metadata service (<strong>draft.metadata.service</strong>))</td>
   <td>com.adobe.fd.fp.service.impl.DraftMetadataServiceImpl<br /> </td>
  </tr>
  <tr>
   <td>Forms Portal Submit Data Service (Identifier for submit data service (<strong>submit.data.service</strong>))</td>
   <td>com.adobe.fd.fp.service.impl.SubmitDataServiceImpl<br /> </td>
  </tr>
  <tr>
   <td>Forms Portal Submit Metadata Service (Identifier for submit metadata service (<strong>submit.metadata.service</strong>))</td>
   <td>com.adobe.fd.fp.service.impl.SubmitMetadataServiceImpl<br /> </td>
  </tr>
 </tbody>
</table>

### Out of the box services to store data on remote processing instance {#out-of-the-box-services-to-store-data-on-remote-processing-instance}

Data is pushed directly to configured remote instance

<table>
 <tbody>
  <tr>
   <th>Property</th>
   <th>Value</th>
  </tr>
  <tr>
   <td>Forms Portal Draft Data Service(Identifier for draft data service (<strong>draft.data.service</strong>))</td>
   <td>com.adobe.fd.fp.service.impl.DraftDataServiceRemoteImpl<br /> </td>
  </tr>
  <tr>
   <td>Forms Portal Draft Metadata Service (Identifier for draft metadata service (<strong>draft.metadata.service</strong>))</td>
   <td>com.adobe.fd.fp.service.impl.DraftMetadataServiceRemoteImpl<br /> </td>
  </tr>
  <tr>
   <td>Forms Portal Submit Data Service (Identifier for submit data service (<strong>submit.data.service</strong>))</td>
   <td>com.adobe.fd.fp.service.impl.SubmitDataServiceRemoteImpl<br /> </td>
  </tr>
  <tr>
   <td>Forms Portal Submit Metadata Service (Identifier for submit metadata service (<strong>submit.metadata.service</strong>))</td>
   <td>com.adobe.fd.fp.service.impl.SubmitMetadataServiceRemoteImpl<br /> </td>
  </tr>
 </tbody>
</table>

Apart from the configuration specified above, provide information about the configured remote processing instance.

In the AEM Web Console Configuration ( `https://[host]:'port'/system/console/configMgr`), click to open **AEM DS Settings Service** in edit mode. In the AEM DS Settings Service dialog, provide information about processing server URL, processing server user name, and password.

>[!NOTE]
>
>A sample implementation is also provided for storing user data in a database. To understand how to configure data and metadata services to store user data in an external database, see [Sample for integrating drafts & submissions component with database](/help/forms/using/integrate-draft-submission-database.md).
