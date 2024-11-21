---
title: How to integrate AEM Forms with Adobe Analytics?
description: AEM Forms integrates with Adobe Analytics to capture and track performance metrics for your published forms.
docset: aem65
exl-id: 030fe9f2-cd41-4290-b8a6-2f9ade6b5789
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
feature: Adaptive Forms
---
# Analytics using [!DNL Adobe Launch] {#analyticsusingadobelaunch}

AEM Forms integrates with [Adobe Analytics](https://experienceleague.adobe.com/docs/analytics-learn/tutorials/overview.html?lang=en) to let you capture and track performance metrics for your published forms. The objective behind analyzing these metrics is to enable business users to gain insights into end user behavior and optimize the data capture experience. You can capture and track behavior of both logged-in and not logged-in (Anonymous) users via Adobe Analytics for Adaptive Forms.

You can also perform analytics using Cloud Service Framework. For more information on how to integrate AEM Forms with Cloud Service Framework, see [Analytics using Cloud Service Framework](/help/forms/using/configure-analytics-forms-documents.md). The main advantage of using Adobe Launch over Analytics using Cloud Service Framework is that you can also define custom events, in addition to these out of the box events. The customized events are defined using rule editor or customer clientlibs and are mapped to events in [!DNL Adobe Analytics].

After performing the actions mentioned in this article, you can configure and view reports in [!DNL Adobe Analytics], as demonstrated in the following video:

>[!VIDEO](https://video.tv.adobe.com/v/337262)

You can use [!DNL Adobe Analytics] to discover interaction patterns and problems users face while using adaptive forms. Out of the box, [!DNL Adobe Analytics] tracks and stores information about the following events:

* **Render**: Number of times a form is opened.

* **Submit**: Number of times a form is submitted.

* **Abandon**: Number of times the users leave without completing the form.

* **Error**: Number of errors encountered on the panel and on the fields of the panel.

* **Help**: Number of times a user opens help of a panel and the fields of the panel.

* **Field Visit**: Number of times a user visits a field in the form.

* **Save**: Number of times users save a form to the Forms Portal.

Apart from these out of the box events, you can also define custom events. 

The following figure illustrates the actions that you need to perform before viewing reports in [!DNL Adobe Analytics]:

![Analytics overview](/help/forms/using/assets/analyticsworkflow.png)

## 1. Configure [!DNL Adobe Analytics] {#Configure-adobe-analytics}

Before configuring [!DNL Adobe Analytics], create:

* An Adobe ID to log on to [Adobe Experience Cloud](https://experience.adobe.com/#/home).
* A [report suite](https://experienceleague.adobe.com/docs/analytics/admin/manage-report-suites/new-report-suite/t-create-a-report-suite.html).


### Install AEM Forms and [!DNL Adobe Analytics] extensions {#install-extensions}

Perform the following steps to configure AEM Forms and [Adobe Analytics](https://experienceleague.adobe.com/docs/experience-platform/tags/extensions/adobe/analytics/overview.html) extensions:

1. Log on to Adobe Experience Cloud and select an appropriate name for the company.

1. Select **[!UICONTROL Launch/Data Collection]** and select **[!UICONTROL Go to Launch/Data Collection]**.

1. Select **[!UICONTROL New property]** and specify a name for the configuration.

1. Specify a domain name and select **[!UICONTROL Save]** to save the property.

1. Select the configuration name available in the list of Tag Properties.

1. In the **[!UICONTROL Authoring]** section, select **[!UICONTROL Extensions]**.

1. Select **[!UICONTROL Catalog]** and select **[!UICONTROL Install]** for the **[!UICONTROL Adobe Experience Manager Forms]** extension. **[!UICONTROL Adobe Experience Manager Forms]** displays in the list of installed extensions available in the **Installed** tab.

1. Select **[!UICONTROL Install]** for the **[!UICONTROL Adobe Analytics]** extension.
1. Select the report suite name in the **[!UICONTROL Development Report Suites]**, **[!UICONTROL Staging Report Suites]**, and **[!UICONTROL Product Report Suites]** drop-down lists and select **[!UICONTROL Save]** to save the extension.

### Configure data elements {#configure-data-elements}

You can select any of the configured data elements in a rule created for an event. When an event occurs on an adaptive form, AEM Forms sends these data elements to [!DNL Adobe Analytics].

After installing the **[!UICONTROL Adobe Experience Manager Forms]** extension, you can create the following data elements:

<table>
 <tbody>
  <tr>
   <td>FieldName</th>
   <td>FieldTitle</th>
   <td>FormInstance</th>
  </tr>
  <tr>
   <td>FormName<br /> </td>
   <td>FormTitle<br /> </td>
   <td>PageName</td>
  </tr>
  <tr>
   <td>PageURL<br /> </td>
   <td>PanelTitle<br /> </td>
   <td>TimeSpent</td>
  </tr>
 </tbody>
</table>

Perform the following steps to configure data elements:

1. In the **[!UICONTROL Authoring]** section, select **[!UICONTROL Data Elements]**.

1. Select **[!UICONTROL Create New Data Element]**.

1. Specify a name for the Data Element. For example, Form Title for FormTitle data element type.

1. Specify **[!UICONTROL Adobe Experience Manager Forms]** as the Extension name.

1. Select the **[!UICONTROL Data Element Type]**.

1. Select **[!UICONTROL Save]** to save the data element.

   >[!VIDEO](https://video.tv.adobe.com/v/337472)

### Configure rules {#configure-rules}

Perform the following steps to create rules based on the **[!UICONTROL Adobe Experience Manager Forms]** extension:

1. In the **[!UICONTROL Authoring]** section, select **[!UICONTROL Rules]**.

1. Select **[!UICONTROL Create New Rule]**.

1.  Specify a name for the Rule. For example, Form Submit to record form submissions.

1. In the **[!UICONTROL Events]** section, select **[!UICONTROL Add]**.

1. Specify **[!UICONTROL Adobe Experience Manager Forms]** as the Extension name.

1. Select the event type. The input for the **[!UICONTROL Name]** field populates automatically based on the selected event type.

1. Select **[!UICONTROL Keep Changes]** to save the event.

1. In the **[!UICONTROL Actions]** section, select **[!UICONTROL Add]**.

1. Specify **[!UICONTROL Adobe Analytics]** as the Extension name.

1. Select **[!UICONTROL Set Variables]** as the Action Type. The options available in the drop-down list include:

   * **[!UICONTROL Set Variables]**: Use this action type to define the event type for which the selected data elements are sent from AEM Forms to [!DNL Adobe Analytics].

   * **[!UICONTROL Send Beacon]**: Use this action type to send data from AEM Forms to [!DNL Adobe Analytics].

   * **[!UICONTROL Clear Variables]**: Use this action type to clear the data trail so that the event registers only once in [!DNL Adobe Analytics].

     The recommended approach is to use the **[!UICONTROL Set Variables]** action type to configure the event and data elements, then use **[!UICONTROL Send Beacon]** to send data, and then use **[!UICONTROL Clear Variables]** to clear the data trail.

1. In the **[!UICONTROL Props]** section, map the report suite options available in the drop-down list with the data elements defined using [Configure data elements](#configure-data-elements).

   For example, to send **Form Title** data element from AEM Forms to [!DNL Adobe Analytics] when you submit a form:
   1. In the **[!UICONTROL Props]** section, select a prop for Form Title available in the report suite and then select ![Database icon](/help/forms/using/assets/database-icon.svg) to map it to Form Title created in [Configure data elements](#configure-data-elements).

      ![define-props](/help/forms/using/assets/define-props.png)

   1. Select **[!UICONTROL Add Another]** to add more data elements to the list.

1. In the **[!UICONTROL Events]** section, select an event from the options available in the report suite and select **[!UICONTROL Keep Changes]**.

1. In the **[!UICONTROL Actions]** section, select + and specify **[!UICONTROL Adobe Analytics]** as the Extension name.

1. Select **[!UICONTROL Send Beacon]** as the Action Type. In the right pane, Select **[!UICONTROL s.t()]** to send data to [!DNL Adobe Analytics] and treat it as a page view or **[!UICONTROL s.tl()]** to send data to [!DNL Adobe Analytics] and do not treat it as a page view. Select **[!UICONTROL Keep Changes]**.

1. In the **[!UICONTROL Actions]** section, select + and specify **[!UICONTROL Adobe Analytics]** as the Extension name.

1. Select **[!UICONTROL Clear Variables]** as the Action Type. Select **[!UICONTROL Keep Changes]**. After performing these steps, the **[!UICONTROL Actions]** section displays as:
   ![Actions Configuration](/help/forms/using/assets/actions-config.png)

    Customize the **[!UICONTROL Actions]** section according to your requirements. For example, you can define two **Send Beacon** steps in an Actions flow to send data to [!DNL Adobe Analytics] and treat it as a page view in one step and send data to [!DNL Adobe Analytics] and do not treat it as a page view in the second step.

   ![Actions Configuration](/help/forms/using/assets/actions-config-2.png)

1. Select **[!UICONTROL Save]** to save the rule. 
   
   You can create rules for all event types, such as Abandon, Error, Field Visit, Help, Render, Save, and Submit.

   >[!VIDEO](https://video.tv.adobe.com/v/337425)


### Publish flows {#publish-flow}

After creating the data elements and using them in rules, publish the configuration to collect form data in [!DNL Adobe Analytics].

Perform the following steps to publish the configuration:

1. In the **[!UICONTROL Publishing]** section, select **[!UICONTROL Publishing Flow]**.

1. Select **[!UICONTROL Add Library]** and specify a name and select the environment for the library.

1. Select **[!UICONTROL Add All Changed Resources]** and then select **[!UICONTROL Save & Build to Development]**.

1. In the **[!UICONTROL Development]** section, select ![More options](/help/forms/using/assets/more-options-icon.svg) and then select **[!UICONTROL Approve & Publish to Production]**.

1. Confirm the changes and the publishing flow soon displays in the **[!UICONTROL Published]** section.

![Publish Flow](/help/forms/using/assets/publish-flow.png)

## 2. Configure AEM Forms {#configure-aem-forms}

Before creating Adobe Launch configuration, create an [Adobe IMS Configuration using Adobe Launch as the Cloud Solution](https://experienceleague.adobe.com/docs/experience-manager-learn/sites/integrations/experience-platform-launch/connect-aem-launch-adobe-io.html).

### Create Adobe Launch Configuration {#create-adobe-launch-configuration}

Perform the following steps to create an Adobe Launch configuration:

1. On the AEM Forms Author instance, navigate to **[!UICONTROL Tools]** &gt; **[!UICONTROL Cloud Services]** &gt; **[!UICONTROL Adobe Launch Configurations]**.

1. Select a folder to create the configuration and select **[!UICONTROL Create]**.

1. Specify a title for the configuration in the **[!UICONTROL Title]** field.

1. Select the [associated Adobe IMS configuration](https://experienceleague.adobe.com/docs/experience-manager-learn/sites/integrations/experience-platform-launch/connect-aem-launch-adobe-io.html).

1. Select the name of the company used while [configuring Adobe Analytics](#Configure-adobe-analytics).

1. Select the name of the property created while [configuring Adobe Analytics](#install-extensions).

1. Select **[!UICONTROL Save & Close]**.

1. Publish the configuration.

>[!NOTE]
>
> When you [embed AEM Forms within an AEM Sites page](https://experienceleague.adobe.com/en/docs/experience-manager-65/content/forms/adaptive-forms-basic-authoring/embed-adaptive-form-aem-sites), Adobe Launch configurations are not supported in an iFrame for adaptive forms. To resolve this, configure Adobe Launch rules directly on the Sites page or migrate existing Adobe Launch configurations from AEM Forms to the Sites page.


### Enable [!DNL Adobe Analytics] for an adaptive form {#enable-analytics-adaptive-form}

To use [!DNL Adobe Launch] configuration in an existing Adaptive Form:

1. On the AEM Forms Author instance, navigate to **[!UICONTROL Adobe Experience Manager]** > **[!UICONTROL Forms]** > **[!UICONTROL Forms & Documents]**.
1. Select the Adaptive Form and select **[!UICONTROL Properties]**.
1. In the **[!UICONTROL Basic]** tab, select the [configuration container](#create-adobe-launch-configuration) used while creating the Adobe Launch configuration.
1. Select **[!UICONTROL Save & Close]**. The Adaptive Form is enabled for [!DNL Adobe Analytics].
1. Publish the form.

After you enable [!DNL Adobe Analytics] for an adaptive form, you can [validate](https://experienceleague.adobe.com/docs/launch-learn/implementing-in-websites-with-launch/implement-solutions/analytics.html?lang=en#validate-the-page-view-beacon) if there is an appropriate data event flow between AEM Forms and [!DNL Adobe Analytics]. The integration of AEM Forms with Adobe Analytics is complete. You can now [configure and view reports in Adobe Analytics](#view-reports-adobe-analytics).

  >[!NOTE]
  >In case, if both [Analytics using Cloud Service Framework](/help/forms/using/configure-analytics-forms-documents.md) and **Analytics using Adobe Launch** features are enabled simultaneously, **Analytics using Adobe Launch** will take precedence. 
  > 

### Create rules to capture custom events (Optional) {#capture-custom-events}

Create rules on specific fields of an adaptive form using rule editor to send Analytics data from an adaptive form to [!DNL Adobe Analytics].

In a two-stage process, you define a rule on a field in an adaptive form. The rule dispatches an event. The name of event is mapped to a custom capture event in Adobe Launch.

To create rules using rule editor in an adaptive form:

1. Select the field and select ![Rule Editor](/help/forms/using/assets/rule-editor-icon.svg) to open the rule editor page.
1. Define a condition in the [!UICONTROL When] section of the rule.
1. In the [!UICONTROL Then] section of the rule, select **[!UICONTROL Dispatch Event]** from the **[!UICONTROL Select Action]** drop-down list.
1. Specify the name of the event in the **[!UICONTROL Type Event Name]** field.

For example, if the date of birth is before a certain date, AEM Forms dispatches the **Security** event.

![Dispatch Event](/help/forms/using/assets/security-event.png)

To map the event to a custom capture event in [!DNL Adobe Analytics]:

1. [Create a rule](#configure-rules).

1. In the **[!UICONTROL Events]** section, select **[!UICONTROL Add]**.

1. Specify **[!UICONTROL Adobe Experience Manager Forms]** as the Extension name.

1. Select **[!UICONTROL Capture Custom Event]** from the **[!UICONTROL Event Type]** drop-down list.

1. Specify the name of the event that you specified in step 4 while creating a rule using rule editor.

1. Select **Keep Changes** and perform the rest of the actions specified in [Configure Rules](#configure-rules).

## 3. Configure and view reports in [!DNL Adobe Analytics] {#view-reports-adobe-analytics}

After configuring an adaptive form to send event data to [!DNL Adobe Analytics], you can start viewing reports in [!DNL Adobe Analytics]:

1. Select ![Select Product](/help/forms/using/assets/select-analytics.png) and select **[!UICONTROL Analytics]**.

1. Select **[!UICONTROL Create Project]** and select **[!UICONTROL Blank project]**.

1. Select the report suite name from the dropdown list at the top-right of the freeform.

1. Specify **Form Title** in the **[!UICONTROL Search dimension items]** text to view all form titles.

1. Drop the adaptive form title to the **[!UICONTROL Drop a segment here (or any other component)]** text box.

1. From the **[!UICONTROL Metrics]** section, drop the events to track to **[!UICONTROL Drop a metric here (or any other component)]** text box.

1. Select ![Visualizations](/help/forms/using/assets/visualization-icon.svg) and drop a chart type to the Freeform section. Similarly, you can add multiple chart types to the Freeform section.

1. Select Ctrl + S keys and specify a name to save the project.

For detailed information on viewing forms analytics reports, see [Viewing and understanding AEM Forms analytics reports](../../forms/using/view-understand-aem-forms-analytics-reports.md).
