---
title: Measure and improve effectiveness and conversion of forms

description: AEM Forms integrates with Adobe Target and Adobe Analytics solutions that lets you measure and improve the performance and conversion rate of your forms.


content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: integrations

docset: aem65
exl-id: 4f45ad22-611b-4b4f-8e89-cb64a122b70a
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: Admin, User, Developer
---
# Measure and improve effectiveness and conversion of forms{#measure-and-improve-effectiveness-and-conversion-of-forms}

## The challenge {#the-challenge-br}

Organizations are increasingly empowering and encouraging their customers to transact using digital self-services across multiple channels. However, in absence of one-to-one feedback mechanism, it becomes challenging to measure success and experiment with digital forms to enhance customer experience and increase conversions.

To maximize ROI, organizations must monitor how their customers interact with services, and experiment with their digital artifacts (forms) to enhance customer experiences. To measure success and define a strategy for improvement, organizations need answers to questions like:

* How many customers tried accessing or transacting with my forms?
* How many of them successfully completed the transaction?
* How many of them abandoned the form?
* What are the problem areas where customers are facing issues?
* What changes do I bring in and how do I test what cause better conversion?

## The solution {#the-solution}

AEM Forms integrates with [Adobe Marketing Cloud](https://www.adobe.com/marketing-cloud.html) solutions - [Adobe Analytics](https://www.adobe.com/marketing-cloud/web-analytics.html) and [Adobe Target](https://www.adobe.com/marketing-cloud/testing-targeting.html) - that can help you monitor and analyze how your forms are performing and enable you to experiment and identify the experience that leads to better conversion rate.

## The workflow {#the-workflow}

Let's get down to the details of how you can measure the performance and improve conversion rates for forms.

### Target audience {#target-audience}

* Business users and analysts responsible for marketing strategies and success
* IT personnel looking after infrastructure and solutions set-up and maintenance

### AEM Forms components and features involved {#aem-forms-components-and-features-involved}

* Adaptive forms
* Integration with Adobe Analytics to collect, organize, and report customer interactions with your adaptive forms
* Integration with Adobe Target to run A/B tests for adaptive forms

### Assumptions {#assumptions}

* You already have an Adobe Marketing Cloud account and registered for Analytics and Target solutions.
* You have a published adaptive form that customers can access.

### Workflow steps {#workflow-steps}

#### Step 1: Configure Analytics and Target in AEM Forms  {#step-configure-analytics-and-target-in-aem-forms-br}

**Configure Analytics**

To gain deep insights into your customer interactions with your forms, you need to first configure Analytics in AEM Forms. Perform the following steps:

1. Create a report suite in Adobe Analytics
1. Create cloud service configuration in AEM
1. Create cloud service framework in AEM
1. Configure AEM Forms Analytics configuration service in AEM
1. Enable analytics on the form in AEM

For detailed steps, see [Configuring analytics and reports for adaptive forms](../../forms/using/configure-analytics-forms-documents.md).

**Configure Target**

To create and run A/B tests for your adaptive forms, configure Target in AEM Forms as described in [Set up and integrate Target in AEM Forms](../../forms/using/ab-testing-adaptive-forms.md#p-set-up-and-integrate-target-in-aem-forms-p).

#### Step 2: View analytics report {#step-view-analytics-report-br}

As your customers access and interact with forms on which you have enabled Analytics, their interactions are captured in highly secured Analytics databases. The databases are segmented by clients and accessible via secure connections.

You can view a report from within AEM for analytics-enabled forms and analyze data. To view the report:

1. On AEM server, navigate to **Forms &gt; Forms & Documents**.
1. Select the form for which you want the analytics report.
1. Click the Analytics Reports icon. The report gets displayed.

Let's take a look at the data points that Analytics collects and reports for forms.

**Forms analytics report**

The analytics report for adaptive forms captures the following Key Performance Indicators (KPIs) at a form level:

* **Average fill time**: Average time spent in filling the form
* **Impressions**: Number of times the form appeared in the search results

* **Renditions**: Number of times the form has been rendered or opened
* **Drafts**: Number of times the form has been saved as draft

* **Submissions**: Number of times the form has been submitted
* **Abort**: Number of times users left without completing the form
* **Visits/Submissions**: Ratio of visits per submission

In addition, you get the following details about each panel in the form:

* **Time**: Average time spent (seconds) on the panel and its fields

* **Error**: Number of errors encountered on the panel and its fields per 1000 form renditions

* **Help**: Number of times users accessed the in-context help for the panel and its fields per 1000 form renditions

![A sample analytics report for an adaptive form](assets/summary-report.png)

For more details about forms analytics reports, see [Viewing and understanding AEM Forms analytics reports](../../forms/using/view-understand-aem-forms-analytics-reports.md).

>[!NOTE]
>
>You can view detailed reports and get deeper insight about your customers and their interactions with your forms from your Analytics account on Adobe Marketing Cloud.

#### Step 3: Analyze data points {#step-analyze-data-points}

In this step, you will analyze data points in the analytics report and infer how the form is performing. If it does not meet your success KPIs, you will construct hypotheses, based on data, and find possible solutions to fix the issues. For example:

* If the average fill time for the form is higher than your expectation, it is possible that your form is complex for customers to understand, the form does not use standard terminologies, the form is too long, and so on. In this case, you might want to simplify the form structure and fields, rework the form design, shorten the length of the form, or add help descriptions and examples for non-standard form fields.
* If data indicates that most customers are accessing help for a form panel, it is evident that customers are puzzled about what information to fill in. You might want to use alternate terminology or add some example inputs and help description for that panel.
* If the abort or abandonment rate for a form is higher than expected, it might be due to the form taking long time to render, customers are inadvertently landing on the form, or it is too complicated. In this case, you may want to optimize the form description that appears in the search results, simplify the form, optimize the form for faster loading, and so on.

Once you have analyzed these data points and arrived at a hypothesis, make the required changes in the form.

#### Step 4: Validate your analysis and fixes {#step-validate-your-analysis-and-fixes}

In this step, you will validate the changes you have made in the form and verify if it impacts the conversion rate.

**Run an A/B test**

Integration of AEM Forms with Target allows creating A/B tests for adaptive forms. In A/B tests, you randomly present different experiences of a form to your customers in real time to know which experience works better or causes more conversions. Once you have significant data indicating one experience delivering better conversion than the other, you can declare that experiences as winner, and going forward, it becomes the default experience visible to all customers.

For more information about creating an A/B test for an adaptive form, see [A/B testing of adaptive forms](../../forms/using/ab-testing-adaptive-forms.md).

![A sample summary report of A/B test for an adaptive form](assets/ab-test-report-4.png)

## Best practices {#best-practices}

The real best practices are the ones that you identify yourself while performing this workflow. They are unique to your environment and requirements. Capture your learnings through the workflow and document them as best practices.

Some recommendations on designing forms and running A/B tests are as follows:

**Forms design**

* Keep the form simple, short, and easy to navigate. Use directional cues for navigation.
* Use standard or common terminologies for form fields.
* Explain the field and required input, with examples or help, where users may get confused.
* Validate user inputs as they type it, wherever possible, to avoid errors on form submission.
* Optimize layouts for desktop and mobile devices.
* Auto-populate information for known users.

**A/B tests**

* Construct a hypothesis and identify success metrics before running the A/B test.
* Do minimal variations (ideally one at a time) in your alternate experience to know what impacted the conversion rate.
* Test frequently to eliminate inefficiencies.
