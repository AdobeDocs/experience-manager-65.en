---
title: "Correspondence Management: Troubleshooting"
description: Learn how to handle errors that come up during the process of saving a letter in an AEM Forms environment.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: correspondence-management
feature: Correspondence Management
exl-id: cf06796b-bb8c-4a65-8f42-02fb0cfa3ebd
solution: Experience Manager, Experience Manager Forms
role: "Admin, User, Developer"
---
# Correspondence Management: Troubleshooting {#correspondence-management-troubleshooting}

## Errors when saving a letter {#errors-when-saving-a-letter}

### Issue {#issue}

One of the following errors displayed when saving a letter:

* Data binding not present for the text module
* Provide the property information needed for the following

### Reason {#reason}

These errors could occur due to one of the following:

* A data dictionary is bound to the letter but is not present on the server.
* A data dictionary is bound to the letter but has an underscore (_) in its name.

### Workaround {#workaround}

Ensure that the data dictionary you are using in the letter is present on the server and does not have an underscore (_) in its name.

## Error when previewing a letter {#error-when-previewing-a-letter}

### Issue {#issue-1}

While previewing a letter, the error "Error in loading letter: Could not import asset from XML input" appears even when a previously unpublished text asset in the letter is published.

### Workaround {#workaround-1}

Reset the letter cache on the publish instance using the following steps and then retry viewing the letter:

1. Go to **`https://'[server]:[port]'/[contextPath]/system/console/configMgr`** and log in as Admin.
1. Select **Correspondence Management Configurations**.
1. In **Correspondence Management Configurations**, disable **Enable Letter Cache **and then click** Save.**
1. Check **Enable Letter Cache** and then click **Save**.
1. Retry viewing the letter.
