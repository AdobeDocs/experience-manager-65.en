---
title: Record a transaction for custom components for AEM Forms on JEE.
description: Use the TransactionRecorder API to record transaction for custom component.
topic-tags: forms-manager 
feature: Transaction Reports
---
# Record a transaction for custom component API for AEM Forms on JEE {#record-a-transaction-for-custom-components}

If you have deployed custom component, you can enable transactions reporting. To enable transaction reporting, you modify the `component.xml` file of the component and add the tag given below under the operation for which transaction reporting needs to be enabled.

If you have deployed custom component, you can enable transaction reporting for the same.

**Tag**: `<transaction-operation-type>CONVERT</transaction-operation-type> // Supported values are SUBMIT, CONVERT, RENDER.`

| Old operation tag      | New operation tag |
| ----------- | ----------- |
| `<operation>`<br> `<.... tags`<br>`<...>`<br>`<operation>` | `<operation>`<br> `<.... tags`<br>`<...>`<br>`<transaction-operation-type>CONVERT</transaction-operation-type`<br>`<operation>` |

In case there is requirement to capture more than 1 transaction for an API, for example, If there is a batch API where transaction count may vary with the number of input counts, In those cases you need to handle the transaction count at the API level.

<!--For example, you can set count for your custom component by importing class `"com.adobe.idp.dsc.InvocationContextStack"` in the code available at `adobe-livecycle-client.jar`  and determine the transaction count basis API input/result and add (In this case we add count is equal to 3):
`InvocationContextStack.recordTransactionCount(<count>).` to 
`InvocationContextStack.recordTransactionCount(3)`.-->

Steps to record the varied transaction count:

1. Import class `"com.adobe.idp.dsc.InvocationContextStack"` in the code. The class is part of the `adobe-livecycle-client.jar` sdk file. This sdk file is available at `<AEM_Forms_JEE_Install>\sdk\client-libs\common`

    >[!NOTE] 
    > Update the client file shared above in your client project with the new file, in case it is already bundled.

1. In the API for which varied transactions need to be logged:
    1. Add logic to store the transaction count in some integer variable, such as, `transaction_count`.
    1. When the operation is successful, add `InvocationContextStack.recordTransactionCount(transaction_count)`.

## Related Articles

* [Enable and view transaction report on AEM Forms JEE](/help/forms/using/transaction-report-overview-jee.md)
* [Billable APIs on AEM Forms JEE](/help/forms/using/transaction-reports-billable-apis-jee.md)


