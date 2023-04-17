---
title: Record a transaction for custom implementations
seo-title: Record a transaction for custom implementations
description: Use the TransactionRecorder API to record actions which are not accounted as transactions automatically
seo-description: Use the TransactionRecorder API to record actions which are not accounted as transactions automatically
uuid: a22b1a0b-7553-4a17-8fb4-a3bee97b4a98
contentOwner: khsingh
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: forms-manager
discoiquuid: 0d961630-573b-4c8e-902f-996f1d1265b6
exl-id: a1d97b15-14a6-4c3d-bdd3-6366f7acdfc8
---
# Record a transaction for custom implementations {#record-a-transaction-for-custom-implementations}

Use the TransactionRecorder API to record actions which are not accounted as transactions automatically

You can use custom code to submit a PDF Form or to send Agent UI preview URL to end users to preview an interactive communication. Or, you submit a form using custom methods instead of using submit methods provided with AEM Forms. All the previously mentioned actions and custom implementations of AEM Forms APIs are not accounted as transactions. AEM Forms provide an API, [TransactionRecorder](https://developer.adobe.com/experience-manager/reference-materials/6-5/forms/javadocs/com/adobe/aem/transaction/core/ITransactionRecorder.html), to record such actions as transactions.

To record a transaction, write the [standard sling servlet](https://experienceleague.adobe.com/docs/experience-manager-learn/forms/store-and-retrieve-af-with-2fa/create-servlet.html?lang=en) and call the servlet from a client to record a transaction. You can call the servlet using AJAX or any other standard method.

## Sample server-sided code {#sample-server-sided-code}

You can use the below sample code to run the TransactionRecorder API from a Java&trade; class using a custom OSGi bundle.

```java
import com.adobe.aem.transaction.core.ITransactionRecorder;
import com.adobe.aem.transaction.core.model.TransactionRecord;
import com.adobe.aem.transaction.core.exception.TransactionException;
import com.adobe.aem.transaction.core.FormsTransactionConstants;

@Reference
private ITransactionRecorder transactionRecorder;

doPost (SlingHttpServletRequest request, SlingHttpServletResponse response) {
    transactionRecorder.startContext();
    TransactionRecord txRecord = extractTxRecordFromRequest(request); //extract transaction relevant data from request
    try {
        bool success = doBillableWork();
        if (success) {
            transactionRecorder.recordTransaction(txRecord);
        }
    } catch (Exception e) {
        //exception handling
    } finally {
        transactionRecorder.endContext();
    }
}

//Here, it is assumed that txInfo is passed in Stringified json form in the ajax call (in data parameter). You can pass txInfo from client in any way that you find suitable.
private TransactionRecord extractTxRecordFromRequest(SlingHttpServletRequest request) {
    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(request.getInputStream()));
    Map<String, Object> txDataMap = new HashMap<String, Object>();
    String txData = bufferedReader.readLine();
    JSONObject txInfo= new JSONObject(txData );
    try {
        String resourceType= txInfo.getString("resourceType");
        String transactionType = txInfo.getString("transactionType");
        Integer transactionCount = (Integer)txInfo.get("transactionCount");
        //Extract all the relevant tx record attributes similarly and pass them in Transaction Record constructor as per the java doc}
        return new TransactionRecord(transactionCount, transactionType, resourceType, ..);
    } catch (JSONException e) {
        //exception handling
    } finally {
        bufferedReader.close();
    }
}

```

## Sample client-side code {#sample-client-side-code}

You can use the below sample code to call the servlet that has the `TransactionRecorder`API.

```javascript
$.ajax({
   type: 'POST',
   url: url, //servlet url
   contentType: 'application/json; UTF-8',
   data: JSON.stringify({transactionCount : 1,
                        transactionType: "SUBMIT",
                        resourceType: "FORM",
                        resourceSubType: "ADAPTIVE-FORM"}),
   success: successHandler,
   error: faultHandler
})

```

## Related Articles {#related-articles}

* [Transaction Reports Overview](/help/forms/using/transaction-reports-overview.md)
* [Viewing and Understanding a Transaction Reports](/help/forms/using/viewing-and-understanding-transaction-reports.md)
* [Transaction Reports Billable APIs](/help/forms/using/transaction-reports-billable-apis.md)
