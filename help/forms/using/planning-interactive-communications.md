---
title: "Tutorial: Plan the Interactive Communication"

description: Plan the anatomy for your Interactive Communication


contentOwner: anujkapo
products: SG_EXPERIENCEMANAGER/6.5/FORMS

feature: Interactive Communication
exl-id: ea0c8971-56f4-4094-87e4-1b222b73951f
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Tutorial: Plan the Interactive Communication {#tutorial-plan-the-interactive-communication}

Plan the anatomy for your Interactive Communication

 ![02-create-adaptive-form-main-image](assets/02-create-adaptive-form-main-image.png)

This tutorial is a step in the [Create your first Interactive Communication](/help/forms/using/create-your-first-interactive-communication.md) series. It is recommended to follow the series in chronological sequence to understand, perform, and demonstrate the complete tutorial use case.

The first step in planning an Interactive Communication is to finalize the content of the Interactive Communication. Subject matter experts from departments such as legal, finance, support, or marketing can help you in finalizing the content. After the content is finalized, you must analyze it to identify the various asset types that are required to create the Interactive Communication.

## Planning considerations {#planning-considerations}

An interactive communication includes the following elements:

* **Static text** mostly includes the parts of the interactive communication that are generic in nature and are included in communication to all the customers. For example, header, footer, salutation, or disclaimers.
* **Data sourced from a backend system (form data model)** is customer-specific and is dynamically merged with the interactive communication. For example, the policy number or address can be sourced using form data model.
* **Layout or templates** for the Print and Web version of the Interactive Communication.
* **Order** in which the various text paragraphs appear in the Interactive Communication.
* **Data entered by a frontline employee (Agent UI)** who is customizing the communication before sending it out. For example, the payment due date.

* **Conditional data** that gets populated based on predefined conditions. For example, the date when the interactive communication is generated.
* **Images stored in a repository**, such as logos and signature images. Images such as corporate logos would appear in most or all interactive communication.
* **Charts and tables** required to simplify the representation of complex data in an Interactive Communication

## Anatomy of the Interactive Communication {#anatomy-of-the-interactive-communication}

Once you have finalized the content and elements that are used to create your Interactive Communication, you can create an anatomy of the Interactive Communication. The anatomy must have the details listed in the [Planning Considerations](/help/forms/using/planning-interactive-communications.md#planning-considerations) section. Based on our use case, the following is an example of an anatomy of the monthly bill that a telecom operator sends to its customers.

The anatomy includes data with the following modes of input:

* Static text
* Form data model
* Agent UI
* Conditional data
* Images

In each section, the text in bold represents static text. The database includes customer, bills, and calls tables. A form data model can receive data from any of these tables. For more information, see [Create form data model](/help/forms/using/create-form-data-model0.md).

The following table illustrates the data source for each field in the anatomy of Interactive Communication:

<table>
 <tbody>
  <tr>
   <td>Section</td>
   <td>Static text</td>
   <td>FDM </td>
   <td>Agent UI</td>
   <td>Images</td>
  </tr>
  <tr>
   <td>Bill Details</td>
   <td><p>Invoice No</p> <p>Bill Date</p> <p>Bill Period</p> <p>Your Plan</p> </td>
   <td><p>Value for <strong>Your Plan </strong>field</p> <p>Table - customer</p> </td>
   <td><p>Values for the following fields:</p>
    <ul>
     <li>Invoice No</li>
     <li>Bill Date</li>
     <li>Bill Period</li>
    </ul> <p> </p> </td>
   <td>--</td>
  </tr>
  <tr>
   <td>Customer Details</td>
   <td><p>Place of Supply</p> <p>State Code</p> <p>Mobile Number</p> <p>Alternate Contact Number</p> <p>Relationship Number</p> <p>Number of Connections</p> </td>
   <td><p>Values for the following fields:</p>
    <ul>
     <li>Name</li>
     <li>Address</li>
     <li>Mobile Number</li>
     <li>Alternate Contact Number</li>
     <li>Relationship Number</li>
    </ul> <p>Table - customer</p> </td>
   <td><p>Values for the following fields:</p>
    <ul>
     <li>Place of Supply</li>
     <li>State Code</li>
     <li>Number of Connections</li>
    </ul> </td>
   <td>--</td>
  </tr>
  <tr>
   <td>Bill Summary</td>
   <td><p>Previous Balance</p> <p>Payments</p> <p>Adjustments</p> <p>Charges current bill period</p> <p>Amount Due</p> <p>Due Date</p> </td>
   <td><p>Value for the <strong>Charges current bill period </strong> field</p> <p>Table - bills</p> </td>
   <td><p>Values for the following fields:</p>
    <ul>
     <li>Previous Balance</li>
     <li>Payments</li>
     <li>Adjustments</li>
     <li>Amount Due</li>
     <li>Due Date</li>
    </ul> </td>
   <td>--</td>
  </tr>
  <tr>
   <td>Summary of charges</td>
   <td><p>Call Charges</p> <p>Conference Call Charges</p> <p>SMS Charges </p> <p>Mobile Internet Charges</p> <p>National Roaming Charges</p> <p>International Roaming Charges</p> <p>Value Added Services Charges</p> <p>Total Charges</p> <p>TOTAL PAYABLE</p> <p>Condition on the Value Added Services Charges field</p> </td>
   <td><p>Values for the following fields:</p>
    <ul>
     <li>Call Charges</li>
     <li>Conference Call Charges</li>
     <li>SMS Charges </li>
     <li>Mobile Internet Charges</li>
     <li>National Roaming Charges</li>
     <li>International Roaming Charges</li>
     <li>Value Added Services Charges</li>
     <li>Total Charges (usagecharges computed field)</li>
     <li>TOTAL PAYABLE (usagecharges computed field)</li>
    </ul> <p>Table - bills</p> </td>
   <td>No fields</td>
   <td>--</td>
  </tr>
  <tr>
   <td>Itemised calls - Outgoing</td>
   <td><p>Column names:</p>
    <ul>
     <li>Date</li>
     <li>Time</li>
     <li>Number</li>
     <li>Duration</li>
     <li>Charges</li>
    </ul> </td>
   <td><p>All values</p> <p>Table - calls</p> </td>
   <td>No fields</td>
   <td>--</td>
  </tr>
  <tr>
   <td>Pay Now</td>
   <td>--</td>
   <td>--</td>
   <td>--</td>
   <td>PayNow</td>
  </tr>
  <tr>
   <td>Value Added Services</td>
   <td>--</td>
   <td>--</td>
   <td>--</td>
   <td>ValueAddedServices</td>
  </tr>
 </tbody>
</table>
