---
title: Employee recruitment reference site walkthrough
description: AEM Forms reference site showcases how organizations can use AEM Forms features to implement employee recruitment workflow.
topic-tags: introduction
products: SG_EXPERIENCEMANAGER/6.5/FORMS
exl-id: bdfc0a20-1e98-47f9-a1d1-5af5b3ef15db
solution: Experience Manager, Experience Manager Forms
feature: "Adaptive Forms, Foundation Components"
role: "Admin, User, Developer"
---
# Employee recruitment reference site walkthrough {#employee-recruitment-reference-site-walkthrough}

## Overview {#overview}

We.Finance is an organization that allows candidates to apply for employment through the reference site portal. The organization also uses the portal to manage candidates' interviewing scheduling, shortlisting, and internal communication. The site manages the following:

* Candidates searching and applying for jobs
* Screening and shortlisting of candidates
* Interviewing process
* Collection of candidate details
* Candidate background checking
* Rolling out offers to selected candidates

>[!NOTE]
>
>Employee recruitment use cases are available in both We.Finance and We.Gov reference sites. The examples, images, and descriptions used in the walkthroughs use We.Finance reference site. However, you can run these use cases and review artifacts using We.Gov as well. To do so, replace **we-finance** with **we-gov** in the mentioned URLs.

### Workflow models involved {#workflow-models-involved}

The employee recruitment use case involves two workflows:

* Before the interview - We Finance Employee Recruiting workflow
* After the interview - We Finance Employee Recruiting Post Interview workflow

These workflows are created in AEM and can be found at:

`https://[authorHost]:[authorPort]/libs/cq/workflow/admin/console/content/models.html/etc/workflow/models/`

#### We Finance Employee Recruiting workflow {#we-finance-employee-recruiting-workflow}

Following is the model of the We Finance Employee Recruiting workflow followed in this document.

![we-finance-employee-recruiting-workflow](assets/we-finance-employee-recruiting-workflow.png)

#### We Finance Employee Recruiting Post Interview workflow {#we-finance-employee-recruiting-post-interview-workflow}

Following is the model of the We Finance Employee Post Interview Recruiting workflow followed in this document.

![we-finance-employee-recruiting-post-interview-workflow](assets/we-finance-employee-recruiting-post-interview-workflow.png)

### Personas {#personas}

The scenario involves the following personas:

* Sarah Rose, the candidate applying for a job at the organization
* John Jacobs, the recruiter
* Gloria Rios, the hiring manager
* John Doe, the HR person

## Sarah applies for a job {#sarah-applies-for-a-job}

Sarah Rose is looking for a job opportunity in the organization. She visits their web portal and explores the job openings listed on the Career page. She finds a matching job listing and applies for it.

![home-page](assets/home-page.png)

We.Finance home page

![career-page](assets/career-page.png)

We.Finance career page

Sarah clicks Apply on a job posting. The job application form opens. She fills all the details in the application and submits it.

![job-application-form](assets/job-application-form.png)

### How it works {#how-it-works}

The We.Finance home page and the career page are AEM Sites pages. The career page embeds an adaptive form, which uses a repeatable panel to fetch job openings using a service and list them on the page. You can review the adaptive form at `https://[authorHost]:[authorPort]/editor.html/content/forms/af/we-finance/employee/recruitment/jobs.html`.

### See it yourself {#see-it-yourself}

Go to `https://[publishHost]:[publishPort]/content/we-finance/global/en.html` and click **[!UICONTROL Career]**. Click **[!UICONTROL Search]** so that you populate the job list, and then click **[!UICONTROL Apply]** for a job. Fill details in the form and submit the application.

Ensure that you specify a valid email ID in the application as any communication through this walkthrough is sent to the specified email ID.

## John Jacobs shortlists Sarah Rose's profile for the hiring manager's screening {#john-jacobs-shortlists-sarah-rose-s-profile-for-the-hiring-manager-s-screening}

The organization receives the job application submitted by Sarah. John Jacobs, a recruiter, is assigned the task to review Sarah's profile. John reviews the task in his AEM Inbox, finds the profile matching the job requirement, and clicks Shortlist. Sarah's profile is forwarded to Gloria Rios, the hiring manager, for her approval.

![jjacobs-inbox-1](assets/jjacobs-inbox-1.png)

John's AEM Inbox

![candidate-shortlist](assets/candidate-shortlist.png)

John Jacobs shortlists Sarah Rose's profile for the hiring manager's screening

**How it works**

The submit action in the Job Application form triggers a workflow that creates a task in John Jacob's inbox for screening the application. When John, reviews and shortlists the application, the workflow creates a task in the hiring manager, Gloria's inbox.

### See it yourself {#see-it-yourself-1}

Go to `https://[publishHost]:[publishPort]/content/we-finance/global/en/login.html?resource=/aem/inbox.html`and log in using jjacobs/password as username/password for John Jacobs. Open the Candidate Profile Review task and shortlist the applicant.

## Gloria reviews the application and approves the applicant for an interview {#gloria-reviews-the-application-and-approves-the-applicant-for-an-interview}

Gloria, the hiring manager, receives the shortlisted profile as a task in her AEM Inbox. She reviews it and approves the candidate, Sarah Rose, for the interview.

![gloriainbox](assets/gloriainbox.png)

Gloria's AEM Inbox

![gloriaschedulesinterview](assets/gloriaschedulesinterview.png)

Gloria approves Sarah Rose for an interview

**How it works**

When Gloria approves the candidate for an interview, the workflow creates a task in the AEM Inbox of John Doe, who is a recruiter for We.Finance.

### See it yourself {#see-it-yourself-2}

Go to `https://[publishHost]:[publishPort]/content/we-finance/global/en/login.html?resource=/aem/inbox.html` and log in using jjacobs/password as username/password for John Jacobs. Open the Candidate Profile Review task and shortlist the applicant.

Go to `https://[publishHost]:[publishPort]/content/we-finance/global/en/login.html?resource=/aem/inbox.html` and log in using grios/password as username/password for Gloria Rios. Open the Candidate Profile Review task and click Schedule Interview.

## John Doe schedules an interview {#john-doe-schedules-an-interview}

John Doe receives the task of scheduling an interview in his inbox. John Doe selects and opens the task and fixes the interview date and time, location, and the HR person responsible for the interview as John Jacob. John Doe clicks Send Invitation Email. An email is sent to Sarah and a task is assigned to Gloria, the hiring manager, for interviewing Sarah.

![johnjacobsaeminbox](assets/johnjacobsaeminbox.png)

John Doe's AEM Inbox

![johndoescheduleinterview](assets/johndoescheduleinterview.png)

John Doe schedules the interview and sends the details to Sarah Rose

## Sarah Rose receives the email with interview schedule {#sarah-rose-receives-the-email-with-interview-schedule}

Sarah Rose receives the email with interview schedule, venue, and other details. Sarah clicks Accept to signify that she is OK with the interview schedule and venue. As guided by the precise information, Sarah makes it to the interviews.

![sarahroseinterviewemail](assets/sarahroseinterviewemail.png)

Sarah Rose receives the interview schedule

## After the interviews, the Hiring Manager shortlists Sarah Rose {#after-the-interviews-the-hiring-manager-shortlists-sarah-rose}

After Sarah Rose goes through the interviews and clears them, Gloria Rios, the Hiring Manager, opens the Candidate Selection task from her inbox and clicks Select. Gloria Rios's decision is conveyed to the HR person, John Doe, for further processing.

![gloriariosinboxoffer](assets/gloriariosinboxoffer.png)

Gloria's AEM Inbox

![gloriariosselectcandidate](assets/gloriariosselectcandidate.png)

Gloria Rios selects Sarah Rose after the interviews

## John Doe requests more information {#john-doe-requests-more-information}

Before asking a candidate to join the organization, Sarah's background must be checked. John Doe opens and reviews the selected applicant's details and finds that some of her employment and education details are not filled in as yet. John Doe clicks Need More Information.

![johndoeinbox](assets/johndoeinbox.png) ![johndoeneedmoreinformation](assets/johndoeneedmoreinformation.png)

John Doe requests more information from Sarah Rose about her education and work experience

## Sarah Rose receives an email requesting further information {#sarah-rose-receives-an-email-requesting-further-information}

Sarah Rose receives an email notifying her that further information is required for processing her employment application. The email includes a link to the form for filling up the required information.

![sarahroseemailmoredetails](assets/sarahroseemailmoredetails.png)

Sarah Rose receives an email notifying that further information is required for processing her employment application

Sarah clicks the Provide Details link in the email. A form appears. Sarah fills up the required education and employment details as requested by John Doe and clicks Submit.

![additionalinformation1](assets/additionalinformation1.png)

Sarah opens the additional information form by clicking the link in the email

![additionalinformation2](assets/additionalinformation2.png)

Sarah fills up additional information as requested by John Doe and clicks Submit

## John Doe reviews the selected candidate profile for the additional information provided {#john-doe-reviews-the-selected-candidate-profile-for-the-additional-information-provided}

John Doe selects the candidate review request and opens it. John Doe finds that Sarah has filled up all the information as required. After reviewing the application, John Doe clicks Approve. On approval by John Doe, the request to perform a background check on Sarah Rose is forwarded to John Jacobs.

![johndoeadditionainformationinbox](assets/johndoeadditionainformationinbox.png)

John Doe's AEM Inbox

![johndoeadditionalinformationreview-copy](assets/johndoeadditionalinformationreview-copy.png)

John Doe reviews the additional information provided by Sarah and approves it

## John Jacobs receives a background check request {#john-jacobs-receives-a-background-check-request}

John Jacobs sees the background check request in his inbox. John Jacobs opens the task and reviews the information provided by Sarah Rose. After performing a background check, John Jacobs clicks Go Ahead to signify that the background check has been successful.

![johnjacobsbackgroundcheckinbox](assets/johnjacobsbackgroundcheckinbox.png)

John Jacobs's AEM Inbox

![johnjacobsbackgroundcheckgoahead](assets/johnjacobsbackgroundcheckgoahead.png)

After performing the background check, John Jacobs clicks Go Ahead

## John Doe sends out the joining letter to Sarah Rose {#john-doe-sends-out-the-joining-letter-to-sarah-rose}

John Doe receives a request in his AEM Inbox for sending the joining letter. John opens the request and views the details. John Doe attaches the joining letter PDF and then clicks Attach & Send Joining Letter.

![johndoejoiningletterinbox](assets/johndoejoiningletterinbox.png)

John Doe's AEM Inbox

![johndoejoiningletterattachandsend](assets/johndoejoiningletterattachandsend.png)

John Doe sends out the joining letter for signing

## Sarah Rose receives and signs the joining letter {#sarah-rose-receives-and-signs-the-joining-letter}

Sarah Rose receives the joining letter for signing. Sarah clicks Click Here To Review And Sign Joining Letter. The joining letter PDF opens with a field to sign the document.

![sarahrosejoiningletteremail](assets/sarahrosejoiningletteremail.png)

Sarah Rose receives the joining letter for signing

Sarah can choose either to type in, use draw to handwrite, insert an image of signature, or use her mobile's touchscreen to draw her signature. Sarah types in her name, clicks Click To Sign, and downloads the signed copy of the joining letter.

![sarahrosejoininglettersign](assets/sarahrosejoininglettersign.png)

Sarah types in her name to sign the joining letter

![sarahrosejoininglettersign2](assets/sarahrosejoininglettersign2.png)

Sarah clicks Click To Sign to complete signing the joining letter
