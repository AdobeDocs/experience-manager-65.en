---
title: Record a transaction for custom component API for AEM Forms on JEE.
description: Learn about using the TransactionRecorder API to record transactions for custom component.
feature: Transaction Reports
exl-id: 33e1868a-2a7f-4785-8571-95651e661e21
role: Admin, User, Developer
solution: Experience Manager, Experience Manager Forms
product_v2:
  - id: fd1f54a9-f50c-467d-8956-cebbaf4f3eb8
    internal-label: Experience Manager
  - id: e8f6de9b-cf88-4405-8d10-15efa08c230e
    internal-label: Experience Manager Forms
feature_v2:
  - id: bcb3e79d-a57e-59a4-ad50-e03803c9f153
    internal-label: Transaction Reports
role_v2:
  - id: c66ffd68-0f65-42bb-aa23-b4020f12e0bd
    internal-label: Admin
  - id: b69b2659-1057-424e-8fc5-ed9e016dc554
    internal-label: User
  - id: ff6a42d2-313e-452e-93a6-792e4fad9ff8
    internal-label: Developer
---
# Record a transaction for custom component APIs for AEM Forms on JEE {#record-a-transaction-for-custom-components}

When you use billable APIs in your custom component, you can enable transaction reporting for the component. To enable transaction reporting, modify the `component.xml` file of the component and add the tag given below under the operation for which transaction reporting must be enabled.

**Tag**: `<transaction-operation-type>CONVERT</transaction-operation-type> // Supported values are SUBMIT, CONVERT, RENDER.`

| Old operation tag      | New operation tag |
| ----------- | ----------- |
| `<operation>`<br> `<.... tags`<br>`<...>`<br>`<operation>` | `<operation>`<br> `<.... tags`<br>`<...>`<br>`<transaction-operation-type>CONVERT</transaction-operation-type`<br>`<operation>` |

If you must capture more than one transaction for an API, such as a batch API where transaction count varies with the number of input counts, handle the transaction count at the API level.

**To record the varied transaction count:**

1. Import class `"com.adobe.idp.dsc.InvocationContextStack"` in the code. The class is part of the `adobe-livecycle-client.jar` sdk file. The sdk file is available at `<AEM_Forms_JEE_Install>\sdk\client-libs\common`

    >[!NOTE] 
    > Update the client file shared above in your client project with the new file in case that it is already bundled.

1. In the API for which varied transactions must be logged:
    1. Add logic so you can store the transaction count in some integer variable, such as, `transaction_count`.
    1. When the operation is successful, add `InvocationContextStack.recordTransactionCount(transaction_count)`.

<!--
For example, you can set count for your custom component by importing class `"com.adobe.idp.dsc.InvocationContextStack"` in the code available at `adobe-livecycle-client.jar`  and determine the transaction count basis API input/result and add (In this case we add count is equal to 3):
`InvocationContextStack.recordTransactionCount(<count>).` to 
`InvocationContextStack.recordTransactionCount(3)`.
-->

## Related Articles

* [Enabling and viewing transaction reports for AEM Forms on JEE](/help/forms/using/transaction-report-overview-jee.md)
* [List of billable APIs for AEM Forms on JEE](/help/forms/using/transaction-reports-billable-apis-jee.md)
