---
title: Customizing Draft and Submission data services
description: AEM Forms, by default, stores draft, and submitted adaptive forms, in a default node on the Publish instance. However, you can configure the draft and submission data services of AEM Forms to customize the storage of draft and submitted adaptive forms.
uuid: c3ec1708-3b11-4142-93f0-1cffb6643f34
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: customization
discoiquuid: 602fd6a9-9a65-411c-8475-a4082a3fdee0
exl-id: ed10ef8c-7b9c-43cf-bea8-7cf9742a8cac
---
# Customizing Draft and Submission data services {#customizing-draft-and-submission-data-services}

## Overview {#overview}

AEM Forms let users save an adaptive form as a draft. The draft functionality provides users with the option to maintain a work-in-progress form. A user can then complete and submit the form at any time from any device.

By default, AEM Forms store user data associated with the draft and submission on the Publish instance in the `/content/forms/fp` node.

However, AEM Forms Portal components provide data services that let you customize the implementation of storing user data for drafts and submissions. For example, you can store the data in a data store currently implemented in your organization.

To customize the storage of user data, you must implement the [Draft Data](/help/forms/using/custom-draft-submission-data-services.md#p-draft-data-service-p) and [Submission Data](/help/forms/using/custom-draft-submission-data-services.md#p-submission-data-service-p) services.

## Prerequisites {#prerequisites}

* Enable [Forms Portal components](/help/forms/using/enabling-forms-portal-components.md)
* Create a [Forms Portal page](/help/forms/using/creating-form-portal-page.md)
* Enable [adaptive forms for Forms Portal](/help/forms/using/draft-submission-component.md)
* Learn [implementation details of custom storage](/help/forms/using/draft-submission-component.md#customizing-the-storage)

## Draft data service {#draft-data-service}

To customize the storage of user draft data, you must provide implementation for all the methods of the `DraftAFDataService` interface.

A description of the methods and their arguments are provided in the following code sample of the interface:

```java
public interface DraftAFDataService {

 /**
  * Deletes the user data stored against the ID passed as the argument
  *
  * @param draftDataID
  * @return status for the just occurred delete draft UserData operation
  * @throws FormsPortalException
  */
 public Boolean deleteAFDraftUserData (String draftDataID) throws FormsPortalException;

 /**
  * Saves user data provided in the argument map
  *
  * @param draftUserDataMap contains Form Data (key - "guideState"), Adaptive Form Name (Key - "guideName"), and Draft DataID (Key - "userDataID") in case of update
  * @return userData ID would be returned which needs to be saved in metadata node
  * @throws FormsPortalException
  */
 public String saveAFUserData (Map<String, Object> draftUserDataMap) throws FormsPortalException;

 /**
  * Gets the user data stored against the ID passed as the argument
  *
  * @param Draft DataID
  * @return guideState (which would then be populated in adaptive form to reload the draft) which is stored against draftDataID
  * @throws FormsPortalException
  */
 public byte[] getAFDraftUserData(String draftDataID) throws FormsPortalException;

 /**
  * Saves the attachments for current adaptive form instance
  *
  * @param attachmentsBytes would expect byte array of the attachment to be saved
  * @return id for the attachment just saved (so that it could be retrieved later)
  * @throws FormsPortalException
  */
 public String saveAttachments(byte[] attachmentBytes) throws FormsPortalException;
}
```

## Submission data service {#submission-data-service}

To customize the storage of user submission data, you must provide implementation for all the methods of the `SubmittedAFDataService` interface.

A description of the methods and their arguments are provided in the following code sample of the interface:

```java
public interface SubmittedAFDataService {

 /**
  * Submits the user data passed in argument map
  *
  * @param submittedAFUserdataMap contains Form Data (key - "guideState"), Adaptive Form Name (Key - "guideName"), and Draft DataID (Key - "userDataID")
  * @return userData ID is returned that needs to be saved in the metadata node
  * @throws FormsPortalException
  */
 public String submitAFUserData (Map<String, Object> submittedAFUserdataMap) throws FormsPortalException;

 /**
  * Gets the user data stored against the ID passed as argument
  *
  * @param submitDataID
  * @return guideState which would be used to open DOR
  * @throws FormsPortalException
  */
 public byte[] getSubmittedAFUSerData(String submitDataID) throws FormsPortalException;

 /**
  * Deletes user data stored against the ID passed as argument
  *
  * @param Submit DataID
  * @return status of the delete operation on Submitted User data
  * @throws FormsPortalException
  */

 public Boolean deleteSubmittedAFUserData(String submitDataID) throws FormsPortalException;

 /**
  * Submits the attachment bytes passed as argument
  *
  * @param attachmentsBytes would expect byte array of the attachment to be saved
  * @return id for the attachment just saved (so that it could be retrieved later)
  * @throws FormsPortalException
  */
 public String submitAttachments(Object attachmentBytes) throws FormsPortalException;

}

```
