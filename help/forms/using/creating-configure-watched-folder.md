---
title: Create or Configure a watched folder
description: Learn how to create or delete a watched folder, or modify the properties of an existing watched folder.
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: publish
exl-id: b15d8d3b-5e47-4c33-95fe-440fcf96be83
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: Admin, User, Developer
---
# Create or Configure a watched folder {#create-or-configure-a-watched-folder}

An administrator can configure a network folder, known as a *watched folder*, so that when a user places a file (such as a PDF file) in the watched folder, a pre-configured operation is started and manipulates the file. After the specified operation is performed, the operation saves the modified file in a specified output folder. For detailed information about administering a watched folder, see [Administration Help](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md).

You can use the watched folder user interface to:

* Create a watched folder
* Modify properties of an existing watched folder
* Delete a watched folder

## Create a watched folder {#create-a-watched-folder}

Before you configure a watched folder, ensure the following:

* Watched folders is an advanced feature of AEM forms. It requires AEM forms add-on package to function. Ensure that appropriate AEM Forms add-on package is installed and configured.
* You can create the watched folder at a shared storage or a local storage. Ensure that AEM forms user configured to run the watched folder has read and write permissions on the watched folder.
* You can use a Service, Workflow, or a Script to automate an operation with watched folder. Ensure that the corresponding Service, Workflow, or a Script is created and ready to run. For information about creating a Service, Workflow, and Script, see [Various methods of processing files](/help/forms/using/watched-folder-in-aem-forms.md#various-methods-for-processing-files).
* A watched folder has various properties, see [Watched Folder Properties](watched-folder-in-aem-forms.md#watchedfolderproperties).

Perform the following steps to create a watched folder:

1. Select **Adobe Experience Manager** icon on the upper-left corner of the screen.
1. Select **Tools** &gt; **Forms** &gt; **Configure Watched Folder.** A list of already configured watched folders is displayed.
1. Select **New**. A list of fields required to create the watched folder is displayed:

    * **Name**: Identifies the watched folder. Use only alphanumeric characters for the name.
    * **Path**: Specifies the watched folder location. In a clustered environment, this setting must point to a shared network folder that is accessible to every user running AEM on different nodes of a cluster.
    * **Process Files Using**: The type of the process to start. You can specify workflow, script, or service.
    * **Service Name/Script Path/Workflow Path**: The behavior of the field is based on the value specified for the **Process Files Using** field. You can specify the following values:

        * For Workflow, specify the workflow model to be executed. For example, /etc/workflow/models/&lt;workflow_name&gt;/jcr:content/model
        * For Script, specify JCR path of the script to be executed. For example, /etc/watchfolder/test/testScript.ecma
        * For Service, specify the filter used for locating an OSGi service. The service is registered as an implementation of com.adobe.aemfd.watchfolder.service.api.ContentProcessor Interface. For example, the following code is a custom implementation of the ContentProcessor interface with a custom (foo=bar) property.

   >[!NOTE]
   >
   >If you have selected **Service** for the **Process Files Using** field, the value of Service Name(inputProcessorType) field must be enclosed in parenthesis. For example (foo=bar).

   ```java
   @Component(metatype = true, immediate = true, label = "WF Test Service", description = "WF Test Service")
   @Service(value = {OutputWriter.class, ContentProcessor.class})
   @Property(name = "foo", value = "bar")
   public class OutputWriter implements ContentProcessor {
   ```

    * **Output File Pattern**: Specify a semi-colon (;) delimited list of patterns that a watched folder uses to determine the name and location of output files and folders. For more information about file patterns, see [About file patterns](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#about-file-patterns).

1. Select **Advanced**. The advanced tab contains more fields. Most of these fields contain a default value.

    * **Payload Mapper Filter:** When you create a watched folder, it creates a folder structure within the folder being watched. The folder structure has stage, result, preserve, input, and failure folders. The folder structure can serve as input payload to the workflow and accept output from a workflow. It can also list failure points, if any. The structure of a payload is different from the structure of a watched folder. You can write custom scripts to map structure of a watched folder to the payload. Such a script is called payload mapper filter. Two out-of-the-box payload mapper implementations are available. If you do not have [a custom implementation](/help/forms/using/watched-folder-in-aem-forms.md#creating-a-custom-payload-mapper-filter), use one of out-of-the-box implementation:

        * **Default mapper:** Use the default payload mapper to keep input and output contents of the watched folders in separate input and output folders in the payload.
        * **Simple File-based payload mapper:** Use the Simple File-based payload mapper to keep input and output contents directly in the payload folder. It does not create any extra hierarchy, like default mapper.

    * **Run Mode**: Specify the comma-separated list of allowed run-modes for workflow execution.
    * **Time Out Staged Files After**: Specify the number of seconds to wait before an input file/folder which has already been picked up for processing is treated as having timed out and marked as a failure. The time-out mechanism only activates when the value for this property is a positive number.
    * **Delete Timed-out Staged Files When Throttled**: If enabled, the **Time Out Staged Files After** mechanism is activated only when throttling is turned on for the watched folder.
    * **Scan Input Folder After Every:** Specify the time interval, in seconds, for scanning the watched folder for inputs. Unless the Throttle setting is enabled, poll Interval should be longer than the time to process an average job; otherwise, the system might overloaded. The value of the interval must be greater than or equal to one.
    * **Exclude File Pattern**: Specify a semi-colon (;) delimited list of patterns that a watched folder uses to determine which files and folders to scan and pick up. Any file or folder with the specified pattern is not scanned for processing. For more information about file patterns, see [About file patterns](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#about-file-patterns).
    * **Include File Pattern**: Specify a semi-colon (;) delimited list of patterns that the watched folder uses to determine which folders and files to scan and pick up. For example, if the Include File Pattern is input&ast;, all files and folders that match input&ast; are picked up. The default value is &ast; and indicates all files and folders. For more information about file patterns, see [About File Patterns](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#about-file-patterns).
    * **Wait Time:** Specify time, in milliseconds, to wait before you scan a folder or file after it is created. For example, if the wait time is 3,600,000 milliseconds (one hour) and the file was created one minute ago, this file will be picked up after 59 or more minutes have passed. The default value is 0.

      This setting is useful to ensure that all the content of file or folder is copied to the input folder. For example, if you have a large file to process and the file takes ten minutes to download, set the wait time to 10&ast;60 &ast;1000 milliseconds. This interval prevents the watched folder from scanning the file if it is not ten minutes old.

    * **Delete Results Older Than:** Specify time, in number of days, to wait before deleting the Files and folders older than the specified value. This setting is useful in ensuring that the result folder does not become full. A value of -1 days indicates to never delete the results folder. The default value is -1.
    * **Result Folder Name:** Specify the name of the folder to store the results. If the results do not appear in this folder, check the failure folder. Read-only files are not processed and are saved in the failure folder. You can use an absolute or relative path with the following file patterns:

        * %F = filename prefix
        * %E = filename extension
        * %Y = year (full)
        * %y = year (last two digits)
        * %M = month
        * %D = day of month
        * %d = day of year
        * %H = hour (24-hour clock)
        * %h = hour (12-hour clock)
        * %m = minute
        * %s = second
        * %l = millisecond
        * %R = random number (between 0&ndash;9)
        * %P = process or job id
        * For example, if it is 8 PM on July 17, 2009 and you specify C:/Test/WF0/failure/%Y/%M/%D/%H/, the result folder is C:/Test/WF0/failure/2009/07/17/20.
        * If the path is not absolute but relative, the folder is created inside the watched folder. The default value is result/%Y/%M/%D/, which is the Result folder inside the watched folder. For more information about file patterns, see [About file patterns](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#about-file-patterns).

    * **Failure Folder Name:** Specify the folder where failed files are saved. This location is always relative to the watched folder. You can use file patterns, as described for Result Folder.
    * **Preserve Folder Name:** Specify the folder where files are stored after successful scanning and pick-up. The path can be an absolute, a relative, or a null directory. You can use file patterns, as described for Result Folder. The default value is preserve/%Y/%M/%D/.
    * **Batch Size:** Specify the number of files or folders to be picked up per scan. It prevents an overload on the system; scanning too many files at one time can cause a crash. The default value is 2.

      If the scan interval is small, the threads scan the input folder often. If files are dropped frequently into the watched folder, then you should keep the scan interval small. If files are dropped infrequently, use a larger scan interval so that the other services can use the threads.

    * **Throttle On:** When this option is enabled, it limits the number of watched folder jobs that AEM forms processes at any given time. The Batch Size value determines the maximum number of jobs. For more information, see [throttling](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md#about-throttling)
    * **Overwrite Existing Files With Similar Name**: When set to True, files in the results folder and preserve folder are overwritten. When set to False, files and folders with a numeric index suffix are used for the name. The default value is False.
    * **Preserve Files On Failure:** When set to True, the input files are preserved if there is failure. The default value is true.
    * **Include Files With Pattern:** Specify a semi-colon (;) delimited list of patterns that the watched folder uses to determine which folders and files to scan and pick up. For example, if the Include File Pattern is input, all files and folders that match input are picked up. For more information, see [Administration Help](/help/forms/using/admin-help/configuring-watched-folder-endpoints.md)
    * **Invoke Watched Folder Asynchronously:** Identifies the invocation type as asynchronous or synchronous. The default value is asynchronous. Asynchronous is recommended for long-lived processes, while synchronous is recommended for transient or short-lived processes.
    * **Enable Watched Folder:** When this option is enabled, the watch folder is enabled. The default value is True.

## Modify properties of an existing watched folder {#modify-properties-of-an-existing-watched-folder}

Apart from changing the name of the watched folder, you can modify all the properties of an existing watched folder. Perform the following steps to modify properties of an existing watched folder:

1. Select the **Adobe Experience Manager** icon on the top-left corner of the screen.
1. Select **Tools** &gt; **Forms** &gt; **Configure Watched Folder.** A list of already configured watched folders is displayed.
1. On the left side of the Watched Folder screen, select the watchfolder and select **Edit.** A list of fields required to create the watched folder is displayed. The fields listed in the **Basic** Tab are mandatory. The advanced tab contains more fields. Most of these fields contain a default value. You can modify these properties as per your requirements.
1. After modifying the properties, select **Update**. The modified properties are saved.
