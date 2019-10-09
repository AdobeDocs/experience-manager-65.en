---
title: Developing with CRXDE Lite
seo-title: Developing with CRXDE Lite
description: CRXDE Lite is embedded into AEM and enables you to perform standard development tasks in the browser
seo-description: CRXDE Lite is embedded into AEM and enables you to perform standard development tasks in the browser
uuid: a5eafc8c-f9fa-49ba-ad2f-0cccc427ca49
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: development-tools
content-type: reference
discoiquuid: 19cb3946-32ba-4f0b-89f0-f9272f2373d2
---

# Developing with CRXDE Lite {#developing-with-crxde-lite}

This section describes how to develop your AEM application using CRXDE Lite.

Please refer to the overview documentation for more information on the different development environments that are available.

CRXDE Lite is embedded into AEM and enables you to perform standard development tasks in the browser. With CRXDE Lite, you can create a project, create and edit files (like .jsp and .java), folders, templates, components, dialogs, nodes, properties and bundles while logging and integrating with SVN.

CRXDE Lite is recommended when you do not have direct access to the AEM server, when you develop an application by extending or modifying the out-of-the-box components and Java bundles or when you do not need a dedicated debugger, code completion and syntax highlighting.

>[!NOTE]
>
>By default, all AEM users can access CRXDE Lite. If desired, [configure ACLs](/help/sites-administering/security.md#permissions-and-acls) for the following node so that only developers can access CRX DE Lite:
>
>`/libs/granite/crxde`

>[!NOTE]
>
>It is recommended to use the [AEM Developer Tools for Eclipse](/help/sites-developing/aem-eclipse.md) and the [AEM HTL Brackets Extension](/help/sites-developing/aem-brackets.md) during project development.

## Getting Started with CRXDE Lite {#getting-started-with-crxde-lite}

To get started with CRXDE Lite, proceed as follows:

1. Install AEM.
1. In your browser, enter https://`<host>`:`<port>`/crx/de. By default it is `http://localhost:4502/crx/de`.
1. Enter your **username** and **password**. By default it is `admin` and `admin`.

1. Click **OK**.

The CRXDE Lite User Interface looks as follows in your browser:

![chlimage_1-238](assets/chlimage_1-238.png)

You can now use CRXDE Lite to develop your application.

### Overview of the User Interface {#overview-of-the-user-interface}

CRXDE Lite offers the following functionality:

<table> 
 <tbody> 
  <tr> 
   <td>Top switcher bar</td> 
   <td>Allows you to quickly switch between CRXDE Lite, Package Manager, and Package Share.</td> 
  </tr> 
  <tr> 
   <td>Node path widget</td> 
   <td><p>Displays the path to the currently selected node.</p> <p>You can also use it to jump to a node, by entering the path by hand, or pasting it from somewhere else, and hitting Enter.</p> <p>It also provides support for looking for nodes with specific node name. Enter the name of the node you would like to find, and wait (or hit the search symbol on the right-hand side). You can try entering, e.g., the string <em>oak</em> into the widget to see how it works. If a given node or nodes is loaded into the explorer pane, the list will be displayed, and you can select the path and hit Enter to navigate to it. Note that it only works for the nodes currently loaded into the CRXDE client application in browser. If you want to search the whole repository, use Tools, then Query.</p> </td> 
  </tr> 
  <tr> 
   <td>Explorer pane</td> 
   <td><p>Displays a tree of all the nodes in the repository.</p> <p>Click a node to display its properties in the <strong>Properties</strong> tab. After clicking a node, you can select an action in the toolbar. Click the node again to rename it.</p> <p>Tree Navigation Filter (binocular icon): enables you to filter the nodes in the repository for which the name contains the input text. It only applies to nodes that have been loaded locally.<br /> </p> </td> 
  </tr> 
  <tr> 
   <td>Edit pane</td> 
   <td><p><strong>Home</strong> tab: lets you search content and/or documentation and access developer resources (documentation, developer blog, knowledge base) and support (Adobe homepage and support center).<br /> </p> <p>Double-click a file in the <strong>Explorer</strong> pane to display its content; like for example a .jsp or a .java file. You can then modify it and save the changes.</p> <p>Once a file is edited in the <strong>Edit</strong> pane, the following tools are available on the toolbar:<br /> </p> - <strong>Show in tree: </strong>shows the file in the repository tree.<br /> - <strong>Search/Replace ...</strong>: do search or replace.<br /> <br /> Double-click on the status line of the <strong>Edit</strong> pane opens the <strong>Go to line</strong> dialog so you can enter a specific line number to go to.<br /> </td> 
  </tr> 
  <tr> 
   <td>Properties tab<br /> </td> 
   <td>Displays the properties of the node that you have selected. You can add new properties or delete existing ones.<br /> </td> 
  </tr> 
  <tr> 
   <td>Access Control tab</td> 
   <td><p>Display permissions based on current path, repository-level or principal.</p> <p>The permissions are broken down into</p> <p>- <strong>Applicable Access Control Policy</strong>: The policies that can be applied to the current selection.</p> <p>- <strong>Local Access Control Policies</strong>: The current policies applied locally to the current selection.</p> <p>- <strong>Effective Access Control Policies</strong>: The current policies applied for the current selection, might be set locally or inherited from parent nodes.</p> <p>Note. To be able to see the Access Control information at all, the user logged in to CRXDE Lite must have rights to read ACL entries. The anonymous user cannot see this information by default - please log in as, e.g., admin to see the information.</p> </td> 
  </tr> 
  <tr> 
   <td>Replication tab</td> 
   <td><p>Display the replication status of current node. You can replicate and replicate delete the current node.</p> </td> 
  </tr> 
  <tr> 
   <td>Console tab<br /> </td> 
   <td><p><strong>Server Logs</strong>:</p> <p>Displays logs messages. You can configure the log level, clear the console, pin at the selected scroll position and enable/disable the displaying of messages.<br /> </p> <p><strong>Version Control</strong>:</p> <p>Displays version control messages.<br /> </p> </td> 
  </tr> 
  <tr> 
   <td>Build Info tab<br /> </td> 
   <td>Displays information when a bundle is being built.<br /> </td> 
  </tr> 
  <tr> 
   <td>Refresh<br /> </td> 
   <td>Refreshes the current selection. Changes from other users are updated in your view of the repository. Changes you have made are unaffected.<br /> </td> 
  </tr> 
  <tr> 
   <td>Save All</td> 
   <td><p><strong>Save All</strong>:<br /> </p> <p>Saves all the changes you have made. Until you click save, the changes are temporary, and will be lost when you exit the console.</p> <p><strong>Revert</strong>:</p> <p>Discards all the changes that you have made on the selected node since the last save action, then reloads the current state of the repository for the selected node.</p> <p><strong>Revert All</strong>:</p> <p>Discards all the changes that you have made throughout the entire repository since the last save action, then reloads the current state of the repository.</p> </td> 
  </tr> 
  <tr> 
   <td>Create ...<br /> </td> 
   <td><p>Drop-down menu to create the following under the selected node:<br /> </p> <p>- <strong>Node</strong>: a node with an arbitrary node type<br /> </p> <p>- <strong>File</strong>: nt:file node and its nt:resource subnode</p> <p>- <strong>Folder</strong>: nt:folder node</p> <p>- <strong>Template</strong>: AEM template</p> <p>- <strong>Component</strong>: AEM component</p> <p>- <strong>Dialog</strong>: AEM dialog</p> </td> 
  </tr> 
  <tr> 
   <td>Delete<br /> </td> 
   <td>Deletes the selected node.<br /> </td> 
  </tr> 
  <tr> 
   <td>Copy</td> 
   <td>Copies the selected node.<br /> </td> 
  </tr> 
  <tr> 
   <td>Paste<br /> </td> 
   <td>Pastes the copied node under the selected node.<br /> </td> 
  </tr> 
  <tr> 
   <td>Move ...<br /> </td> 
   <td>Moves the selected node to the node that is set through the dialog.</td> 
  </tr> 
  <tr> 
   <td>Rename ...<br /> </td> 
   <td>Renames the selected node.<br /> </td> 
  </tr> 
  <tr> 
   <td>Mixins ...<br /> </td> 
   <td>Allows you to add mixin types to the node type. The mixin types are mostly used to add advanced features such as versioning, access control, referencing, and locking to the node.</td> 
  </tr> 
  <tr> 
   <td>Team<br /> </td> 
   <td><p>Drop-down menu to perform standard version control tasks:</p> <p>- <strong>Update</strong> repository from SVN server</p> <p>- <strong>Commit</strong> local changes to SVN server</p> <p>- View <strong>Status</strong> of the current node</p> <p>- View <strong>Recursive Status</strong> of the subtree of the current node</p> <p>- <strong>Checkout</strong> a working copy from SVN server</p> <p>- <strong>Export</strong> a project from SVN server (without creating a working copy)</p> <p>- <strong>Import</strong> a project from repository to SVN server<br /> </p> <p>Note you need to be logged in as user with sufficient permissions to be able to execute some of the tasks (especially the ones that write to the local repository).<br /> </p> </td> 
  </tr> 
  <tr> 
   <td>Tools<br /> </td> 
   <td><p>Drop-down menu with the following tools:</p> <p>- <strong>Server Config ...</strong>: to access the Felix Console.</p> <p>- <strong>Query ...</strong>: to query the repository.</p> <p>- <strong>Privileges ...</strong>: to open privilege management, where you can view and add privileges.</p> <p>- <strong>Test Access Control ...</strong>: a place where you can test the permission for certain path and/or principal.</p> <p>- <strong>Export Node Type</strong>: to export node types in the system as cnd notation.</p> <p>- <strong>Import Node Type ...</strong>: to import node types using cnd notation.</p>  <p>- <strong>Install SiteCatalyst Debugger ...</strong>: instructions on how to install Analytics Debugger.</p> </td> 
  </tr> 
  <tr> 
   <td>Login widget<br /> </td> 
   <td><p>Displays the currently logged-in users and the workspace they are logged into, e.g., admin@crx.default.</p> <p>Click it to log in or re-login as a specific user. If you don't specify a workspace to log in to, you will be logged into the default workspace, crx.default.</p> <p>If you want to browse the repository as Anonymous user, use <strong>anonymous</strong> as the login name, and any password (e.g., a space or a dot).<br /> </p> <p>If your authorization is no longer valid (e.g., it is expired), the login widget displays "<strong>Unauthorized - Login...</strong>". Click it to log in again.</p> </td> 
  </tr> 
 </tbody> 
</table>

### Creating a Project {#creating-a-project}

With CRXDE Lite you can create a working project in three clicks. The project wizard creates a new project under `/apps`, some content under `/conten`t and a package wrapping all the project the content under `/etc/packages`. The project can be used right away to render a sample page displaying **Hello World**, based on a jsp script that renders a property from the repository and calls a Java class to render some text.

To create a project with CRXDE Lite:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click a node, select **Create ...**, then **Create Project ...**. 

   Note: you can right-click any node in the tree navigation, as the new project nodes are, by design, created below `/apps,` `/content` and `/etc/packages`.

1. Define:

    * **Project Name** - the project name is used to create the new nodes and the bundle, e.g. `myproject`.
    * **Java Package** - the Java package name prefix, e.g. `com.mycompany`.

1. Click **Create**.
1. Click **Save All** to save the changes on the server.

To access the sample page displaying **Hello World**, point your browser to:

`http://localhost:4502/content/<project-name>.html`

The **Hello World** page is based on a content node, that calls a jsp script through the `sling:resourceType` property. The script reads the `jcr:title` property from the repository and gets the body content by calling a method of the SampleUtil class, that is available in the project bundle.

The following nodes are created:

* `/apps/<project-name>`: the application container.
* `/apps/<project-name>/components`: the components container, containing the sample html.jsp file, used to render a page.  

* `/apps/<project-name>/src`: the bundles container, containing a sample project bundle.  

* `/apps/<project-name>/install`: the compiled bundles container, containing the compiled sample project bundle.
* `/content/<project-name>`: the content container.
* `/etc/packages/<java-suffix>/<project-name>.zip`, a package wrapping all the project app and content. You can use it to rebuild the project for further deployment (e.g. to other environments) or for sharing through Package Share.

The structure looks as follows in CRXDE Lite with a project called **myproject** and a java package suffix called **mycompany**:

![chlimage_1-239](assets/chlimage_1-239.png) 

![chlimage_1-240](assets/chlimage_1-240.png) 

### Creating a Folder {#creating-a-folder}

To create a folder with CRXDE Lite:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click the folder under which you want to create the new folder, select **Create ...**, then **Create Folder ...**.

1. Enter the folder **Name** and click **OK**.

1. Click **Save All** to save the changes on the server.

### Creating a Template {#creating-a-template}

To create a template with CRXDE Lite:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click the folder where you want to create the template, select **Create ...**, then **Create Template ...**.  

1. Enter the **Label**, **Title**, **Description**, **Resource Type** and **Ranking** of the template. Click **Next**.

1. This step is optional: set the **Allowed Paths**. Click **Next**

1. This step is optional: set the **Allowed Parents**. Click **Next**.

1. This step is optional: set the **Allowed Children**. Click **OK**.

1. Click **Save All** to save the changes on the server.

It creates:

* A node of type `cq:Template` with Template properties  

* A child node of type `cq:PageContent` with Page Content properties

You can add properties to your template: refer to the [Creating a Property](#creating-a-property) section.

### Creating a Component {#creating-a-component}

The feature described here is only available if the node type `cq:Component` is available in the repository.

To create a component with CRXDE Lite:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click the folder where you want to create the component, select **Create ...**, then **Create Component ...**.  

1. Enter the **Label**, **Title**, **Description**, **Super Resource Type** and **Group** of the component. Click **Next**.

1. This step is optional: set the component properties **Is Container, No Decoration**, **Cell Name** and **Dialog Path**. Click **Next**.

1. This step is optional: set the component property **Allowed Parents**. Click **Next**.

1. This step is optional: set the component property **Allowed Children**. Click **OK**.

1. Click **Save All** to save the changes on the server.

It creates:

* A node of type `cq:Component`
* Component properties
* A component .jsp script

### Creating a Dialog {#creating-a-dialog}

To create a dialog with CRXDE Lite:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click the component where you want to create the dialog, select **Create ...**, then **Create Dialog ...**.  

1. Enter the **Label** and the **Title**. Click **OK**.

1. Click **Save Al**l to save the changes on the server.

It creates a dialog with the following structure:

`dialog[cq:Dialog]/items[cq:Widget]/items[cq:WidgetCollection]/tab1[cq:Panel]`

You can now adapt the dialog to your needs by modifying properties or creating new nodes.

You can also use the Dialog Editor to edit a dialog. Double clicking the dialog node in CRXDE Lite will bring up the editor. More information about the Dialog Editor can be found [here](/help/sites-developing/dialog-editor.md).

### Creating a Node {#creating-a-node}

To create a node with CRXDE Lite:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click the node where you want to create the new node, select **Create ...**, then **Create Node ...**.  

1. Enter the **Name** and the **Type**. Click **OK**.

1. Click **Save All** to save the changes on the server.

You can now adapt the node to your needs by modifying properties or creating new nodes.

>[!NOTE]
>
>Most of the edit operations, including Create Node, keeps all the changes in memory, and only stores them into the repository upon saving (via the "Save All" button). However some operations such as move are automatically persisted.
>
>The validation with regard to whether the newly created node is allowed by the node type of the parent node is also carried out by the JCR repository first when saving changes. If you receive an error message while saving a node, please check, whether the content structure is valid (e.g., you cannot create an `nt:unstructured` node as a child of `nt:folder` node).

### Creating a Property {#creating-a-property}

To create a property with CRXDE Lite:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, select the node where you want to add the new property.  
1. In the **Properties** tab in the bottom pane, enter the **Name**, the **Type** and the **Value**. Click **Add**.

1. Click **Save All** to save the changes on the server.

### Creating a Script {#creating-a-script}

To create a new script:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click the component where you want to create the script, select **Create ...**, then **Create File ...**.

1. Enter the File **Name** including its extension. Click **OK**.

1. The new file opens as a tab in the Edit pane.
1. Edit the file.
1. Click **Save All** to save the changes.

### Managing a Bundle {#managing-a-bundle}

With CRXDE Lite, it is straightforward to create an OSGI bundle, add Java classes to it, and build it. The bundle is then automatically installed and started in the OSGI container.

This section describes how to create a `Test` bundle with a `HelloWorld` Java class that displays **Hello World!** in your browser when the resource is requested.

#### Creating a Bundle {#creating-a-bundle}

To create the Test bundle with CRXDE Lite:

1. In CRXDE Lite create `myapp` project with the [project wizard](#creating-a-project). Among others the following nodes are created:

    * `/apps/myapp/src`
    * `/apps/myapp/install`

1. Right-click the folder `/apps/myapp/src` that will contain the `Test` bundle, select **Create ...**, then **Create Bundle ...**.  

1. Set the bundle properties as follows:

    * Symbolic Bundle Name: `com.mycompany.test.TestBundle`
    * Bundle Name: `Test Bundle`
    * Bundle Description: `This is my Test Bundle`
    * Package:`com.mycompany.test`

      Click **OK**.

1. Click **Save All** to save the changes on the server.

The wizard creates the following elements:

* The node `com.mycompany.test.TestBundle` of type `nt:folder.` It is the bundle container node.  

* The file `com.mycompany.test.TestBundle.bnd`. It acts as deployment descriptor for your bundle and consists of a set of headers.  

* The folder structures:

    * `src/main/java/com/mycompany/test`. It will contain the packages and the Java classes.
    * `src/main/resources`. It will contain the resources used within the bundle.

* The `Activator.java` file. It is the optional listener class to be notified of bundle start and stop events.

The following table lists all the properties of the .bnd file, their values and descriptions:

<table> 
 <tbody> 
  <tr> 
   <td><strong>Property</strong></td> 
   <td><strong>Value (at bundle creation)<br /> </strong></td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>Export-Package:</td> 
   <td><p>*</p> <p>Note: this value needs to be adapted to reflect the specificity of the bundle.</p> </td> 
   <td>The Export-Package header defines exported packages from the bundle (comma-separated list of packages). The exported packages constitute the public<br /> view of the bundle.<br /> </td> 
  </tr> 
  <tr> 
   <td>Import-Package:</td> 
   <td><p>*</p> <p>Note: this value needs to be adapted to reflect the specificity of the bundle.</p> </td> 
   <td>The Import-Package header defines imported packages for the bundle (comma-separated list of packages)</td> 
  </tr> 
  <tr> 
   <td>Private-Package:</td> 
   <td><p>*</p> <p>Note: this value needs to be adapted to reflect the specificity of the bundle.</p> </td> 
   <td>The Private-Package header defines private packages for the bundle (comma-separated list of packages). The private packages constitute the internal implementation.<br /> </td> 
  </tr> 
  <tr> 
   <td>Bundle-Name:</td> 
   <td>Test Bundle</td> 
   <td>Defines a short, human-readable name for the bundle</td> 
  </tr> 
  <tr> 
   <td>Bundle-Description:</td> 
   <td>This is my Test Bundle</td> 
   <td>Defines a short, human-readable description for the bundle</td> 
  </tr> 
  <tr> 
   <td>Bundle-SymbolicName:</td> 
   <td>com.mycompany.test.TestBundle</td> 
   <td>Specifies a unique, non-localizable name for the bundle</td> 
  </tr> 
  <tr> 
   <td>Bundle-Version:</td> 
   <td>1.0.0-SNAPSHOT</td> 
   <td>Specifies the version of the bundle</td> 
  </tr> 
  <tr> 
   <td>Bundle-Activator:</td> 
   <td>com.mycompany.test.Activator</td> 
   <td>Specifies the name of the optional listener class to be notified of bundle start and stop events</td> 
  </tr> 
 </tbody> 
</table>

For more information on the bnd format, refer to the [bnd utility](https://bndtools.org/) used by CRXDE to create OSGI bundles.

#### Creating a Java Class {#creating-a-java-class}

To create the `HelloWorld` Java class within the Test Bundle:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click the node containing the `Activator.java` file ( `/apps/myapp/src/com.mycompany.test.TestBundle/src/main/java`), select **Create ...**, then **Create File ...**.

1. Name the file `HelloWorld.java`. Click **OK**.

1. The `HelloWorld.java` file opens in the Edit pane.
1. Add the following lines into `HelloWorld.java`:

   ```
   package com.mycompany.test;  
  
   public class HelloWorld { 
     public String getString(){ 
     return "Hello World!"; 
     } 
   }
   ```

1. Click **Save All** to save the changes on the server.

#### Building a Bundle {#building-a-bundle}

To build the Test Bundle:

1. Open CRXDE Lite in your browser.
1. In the Navigation pane, right-click the .bnd file, select **Tools, **then** Bundle**.

The Build Bundle wizard:

* Compiles the Java classes.
* Creates the .jar file containing the compiled Java classes and the resources and places it into the `myapp/install` folder.
* Installs and starts the bundle in the OSGI container.

To see the effect of the Test Bundle, create a component that uses the Java method HelloWorld.getString() and a resource that is rendered by this component:

1. Create the component `mycomp` under `myapp/components`.

1. Edit `mycomp.jsp` and replace the code with the following lines:

   ```
   <%@ page import="com.mycompany.test.HelloWorld"%><% 
   %><%@ include file="/libs/foundation/global.jsp"%><% 
   %><% HelloWorld hello = new HelloWorld();%><% 
   %> 
   <html> 
   <body> 
   <b><%= hello.getString() %></b><br> 
   </body> 
   </html>
   ```

1. Create the resource `test_node` of type `nt:unstructured` under `/content`.  

1. For `test_node`, create the following property: Name = `sling:resourceType`, Type = `String`, Value = `myapp/components/mycomp`.

1. Click **Save All** to save the changes on the server.  

1. In your browser, request `test_node`: `https://<hostname>:<port>/content/test_node.html`.

1. A page is displayed with the **Hello World!** message.

### Exporting and Importing Node Types {#exporting-and-importing-node-types}

With CRXDE Lite you can import and/or export node type definitions in [CND (Compact Namespace and Node Type Definition) notation](http://jackrabbit.apache.org/jcr/node-type-notation.html).

To export a node type definition:

1. Open CRXDE Lite in your browser.
1. Select your required node.
1. Select **Tools** then **Export Node Type**.

1. The definition, in cnd notation will be displayed in your browser. Save the information if required.

To import a node type definition:

1. Open CRXDE Lite in your browser.
1. Select **Tools** then **Import Node Type...**.

1. Enter the CND notation for the definition n the text box.
1. Check **Allow Update** if you are updating an existing definition.
1. Click **Import**.

### Logging {#logging}

With CRXDE Lite you can display the file `error.log` that is located on the file system at `<crx-install-dir>/crx-quickstart/server/logs` and filter it with the appropriate log level. Proceed as follows:

1. Open CRXDE Lite in your browser.
1. In the **Console** tab at the bottom of the window, in the drop-down menu on the right, select **Server Logs**.

1. Click the **Stop** icon to display the messages.

You can:

* Adjust the log parameters in the Felix Console by clicking the **Logging Configurations** icon.
* Clear the messages by clicking the **Brush** icon.
* Pin the message at the current selection by clicking the **Pin** icon.
* Enable or disable the displaying of messages by clicking the **Stop** icon.

## Access Control {#access-control}

>[!NOTE]
>
>See [Users, Groups and Access Rights Administration](/help/sites-administering/user-group-ac-admin.md) for more information.

