---
title: Adobe Experience Manager Mobile - GDPR Readiness
description: Adobe Experience Manager Mobile - GDPR Readiness
uuid: 817c434f-4b78-40f7-99d6-6efafdedb77e
contentOwner: trushton
discoiquuid: 9399dd3d-a485-4f53-a6f2-7b190da4235b
exl-id: d06e675f-fb61-47da-85de-e0b50dd44153
---
# AEM Mobile - GDPR Readiness {#aem-mobile-gdpr-readiness}

>[!IMPORTANT]
>
>GDPR is used as an example in the sections below, but the details covered are applicable to all data protection and privacy regulations; such as GDPR, CCPA etc.

## AEM Mobile GDPR Support {#aem-mobile-gdpr-support}

AEM Mobile is ready to assist customers with their GDPR compliance obligations. No personal data is stored in AEM Mobile. If you are provisioned, you can log on to Adobe Experience Mobile with your Adobe ID.

<!-- [https://aemmobile.adobe.com/signin/index.html](https://aemmobile.adobe.com/signin/index.html) -->

## Adobe Digital Publishing Suite {#adobe-digital-publishing-suite}

Adobe's digital publishing product (which precedes AEM Mobile) supports Adobe's GDPR readiness initiatives. Please see [https://www.adobe.com/privacy/general-data-protection-regulation.html](https://www.adobe.com/privacy/general-data-protection-regulation.html). The following will provide specifics on support for GDPR relevant functions in the Digital Publishing Suite product including how to work with Adobe to initiate GDPR requests.

To ensure you are not confusing AEM Mobile with the older Digital Publishing Suite product, you can login to the Digital Publishing Suite product here:

[https://acrobat.adobe.com/us/en/](https://acrobat.adobe.com/us/en/)

### Initiating a GDPR request {#initiating-a-gdpr-request}

Please contact Adobe Customer Care to initiate a GDPR request for the Digital Publishing Suite.

The following IDs are required to locate customer data. Any subset received will imply the other IDs were not applicable to this user.

Mandatory:

* Customer's contract ID: *dpsc-contractId*

Provide at least 1 of the following:

* End user's customer provided OAuth ID (the ID that is used in the customer's direct entitlement system): *dpsc-directEntitlementId* 
* For Windows app users, the end user's App Store ID: *dpsc-windowsAppStoreId* 
* The email address the end user used to interact with the DPS App: *email*

### Frequently Asked Questions (FAQ) {#frequently-asked-questions-faq}

**Will Adobe delete my App Store purchases when initiating a DELETE request?**

Adobe will delete information it has of App store purchases (subscriptions, etc.) but purchases will still be on record in the App stores. If the App (end-user) is logged into the App store, those receipts will be picked up again and sent to Adobe and subsequently, those will be considered as new purchases and will be restored by the App to have access again.

**Will Adobe delete customer provided entitlements when initiating a DELETE request?**

Adobe will delete information it has of the customer's additional direct entitlement allowances. If the App (end-user) logs in to the OAuth mechanism that the customer has used, it will send information to Adobe and the services will pick up the extra entitlements again.

**What is expected of the end-user?**

Since the key of assigning entitlements to the App resides on the device as part of the viewer software, the end-user should uninstall the App. The end-user should realize that if they reinstall the App, then existing purchases (associated with the App store user) and direct entitlement allowances (associated with the OAuth user of the customer) will still be restored.

**What happens when an app is shared between people on a device?**

Adobe has very little information that associates directly back to a specific user. It associates the data using a randomly created UUID that is held in the App's data and is passed in every request the App initiates. This means that end-users sharing the App on the same device will use the same UUID and all the data will be considered owned by the person making the GDPR request. For both Access and Delete requests, DPSC will consider people that share an App as one person.

**What Personal Data is tracked with Analytics?**

None. There is data being tracked, but it is at the App level (not personal). This includes events like launches, crashes, close, activities, purchases or folio overlays. Geographical locations, names, device IDs or IP addresses are not tracked.

**The end user provided their information but nothing was found. Why not?**

As the Digital Publishing Suite product evolved, service implementations were changed and more data was obfuscated. If no data was found using the user's provided data, it means that the user's data cannot be tracked back to that person.

### Example {#example}

Please contact Adobe Customer Care to initiate a GDPR request.

Here's an example of the inputs and resulting outputs of a Digital Publishing Suite GDPR request:

#### Inputs: {#inputs}

```
dpsc-contractId = "12345-1234-12416234" 
directEntitlementId = "1234-1234-1234" 
windowsAppStoreId = "testWinAppStoreId" 
email = "test@what.com"
```

#### Outputs {#outputs}

```
{

    "jobId": "test-1524750204384",

    "product": "DPSC",

    "action": "access",

    "userIDS": [

        {

        "namespace": "email",

        "value": "test@what.com"

        },

        {

        "namespace": "windowsAppStoreId",

        "value": "testWinAppStoreId"

        },

        {

        "namespace": "directEntitlementId",

        "value": "1234-1234-1234"

        }

    ],

    "receiptData": {

    "recordsFound": 6,

    "recordsAffected": 0,

    "tablesModified": 0,

    "subscriptionsFound": 24,

    "entitlementsFound": 24

    },

    "records": {

        "DPS_Stage_EntitlementUserDevices": [

        {

            "user_id": "testc685-c9ca-4c1e-a11b-07d10ec724cf",

            "device_id": "appleStore:test1b16-f032-4d9c-9200-0d19999405c4",

            "account_id": "test@what.com"

        },

        {

            "user_id": "test967d-5179-4dc6-958c-facd9d94da38",

            "device_id": "appleStore:test3f07-d5aa-4b32-8fac-b2b690b7ccd7",

            "account_id": "test@what.com"

        },

        {

            "user_id": "test1838-6494-4e74-912c-1edf61581d0e",

            "device_id": "appleStore:test3813-f8cc-49ce-b021-50eb0814a3bb",

            "account_id": "1234-1234-1234"

        },

        {

            "user_id": "test5468-1a11-4e4c-be43-274181a9ef81",

            "device_id": "appleStore:testf082-2783-498d-ab62-b1b2e3eb67ae",

            "account_id": "1234-1234-1234"

        }

        ],

            "DPS_Stage_EntitlementUsers": [

        {

            "id": "store:test04a7-33a3-4b90-863d-79981ead0f19:appleStore",

            "part_id": "0",

            "alias_user_id": "testWinAppStoreId"

        },

        {

            "id": "internal:testd2da-0606-4444-87ef-0d5a1d4a121d:adobe",

            "part_id": "0",

            "user_id": "test@what.com"

        }

        ],

            "DPS_Stage_Subscriptions": [

        {

            "id": "appleStore:testc685-c9ca-4c1e-a11b-07d10ec724cf",

            "account_id": "test3531-a209-4391-beb9-951c7822244e",

            "overflow": "test4e59-86a8-4b75-b699-77e980c287ab",

            "entitlement_count": "12"

        },

        {

            "id": "appleStore:test5468-1a11-4e4c-be43-274181a9ef81",

            "account_id": "test491b-379e-4d24-96ef-e481bf8d3062",

            "overflow": "test931b-7422-485d-85a5-134828187b6c",

            "entitlement_count": "12"

        }

        ],

            "DPS_Stage_Entitlements": [

        {

            "id": "samsungStore:testc685-c9ca-4c1e-a11b-07d10ec724cf",

            "account_id": "test7332-60a0-42b8-a508-474668d83d2e",

            "overflow": "test9bc3-94d0-43cf-b132-0629868f7d9d",

            "entitlement_count": "12"

        },

        {

            "id": "appleStore:test5468-1a11-4e4c-be43-274181a9ef81",

            "account_id": "testf766-102a-460d-8f5a-42f7bb9d68b7",

            "overflow": "test4d96-2197-45a8-9caf-2aa2846b770c",

            "entitlement_count": "12"

        }

        ],

            "s3Buckets": {

            "name": "DPS-Entitlements-Overflow",

            "folder": "stage/",

            "overflows": {

            "subscriptions": [

            "test4e59-86a8-4b75-b699-77e980c287ab",

            "test931b-7422-485d-85a5-134828187b6c"

        ],

            "entitlements": [

            "test9bc3-94d0-43cf-b132-0629868f7d9d",

            "test4d96-2197-45a8-9caf-2aa2846b770c"

                ]

            }

        }

    }

}
```
