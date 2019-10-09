---
title: How to use the VLT Tool
seo-title: How to use the VLT Tool
description: The Jackrabbit FileVault tool (VLT) is developed by The Apache Foundation that maps the content of a Jackrabbit/AEM instance to your file system
seo-description: The Jackrabbit FileVault tool (VLT) is developed by The Apache Foundation that maps the content of a Jackrabbit/AEM instance to your file system
uuid: 579e7785-8b50-4366-b562-8e79b6451464
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.4/SITES
topic-tags: development-tools
content-type: reference
discoiquuid: a76425e9-fd3b-4c73-80f9-0ebabb8fd94f
---

# How to use the VLT Tool{#how-to-use-the-vlt-tool}

The Jackrabbit FileVault tool (VLT) is a tool developed by [The Apache Foundation](https://www.apache.org/) that maps the content of a Jackrabbit/AEM instance to your file system. The VLT tool has similar functions as source control system client (such as a Subversion (SVN) client), providing normal check-in, check-out and management operations, as well as configuration options for flexible representation of the project content.

You run the VLT tool from the command line. This document describes how to use the tool, including how to get started and get help, as well as a list of all [commands](#vlt-commands) and available [options](#vlt-global-options).

## Concepts and Architecture {#concepts-and-architecture}

>[!NOTE]
>
>See the [Filevault Overview](https://jackrabbit.apache.org/filevault/overview.html) and [Vault FS](https://jackrabbit.apache.org/filevault/vaultfs.html) page from the official [Apache Jackrabbit Filevault documentation](https://jackrabbit.apache.org/filevault/index.html).

## Getting Started with VLT {#getting-started-with-vlt}

To start using VLT, you need to do the following:

1. Install VLT, update environment variables, and update global ignored subversion files.
1. Set up the AEM repository (if you have not already done so).
1. Check out the AEM repository.
1. Synchronize with the repository.
1. Test whether the synchronization worked.

### Installing the vlt tool {#installing-the-vlt-tool}

To use the VLT tool, you first need to install it. It is not installed by default and is an additional tool available in the `/opt` folder of your AEM instance. In addition, you need to set your system's environment variable.

1. Copy the FileVault archive file from the cq-quickstart/opt/filevault directory of your installation. Copy either filevalut.tgz or filevault.zip, depending on your operating system.

   You can also download the latest version of FileVault from [Package Share](/help/sites-administering/package-manager.md).

1. Extract the archive.
1. Add `<archive-dir>/vault-cli-<version>/bin` to your environment `PATH` so that the command files vlt or vlt.bat are accessed as appropriate.

   For example, `<aem-installation-dir>/crx-quickstart/opt/helpers/vault-cli-3.1.16/bin>`

1. Open a command line shell and execute vlt --help. Make sure it displays the following help screen:

   ```shell
   vlt --help
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   Jackrabbit FileVault [version 3.1.16] Copyright 2013 by Apache Software Foundation. See LICENSE.txt for more information.                                                    
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   Usage:                                                                                                                                                                       
     vlt [options] <command> [arg1 [arg2 [arg3] ..]]                                                                                                                            
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   
   Global options:                                                                                                                                                              
     -Xjcrlog <arg>           Extended JcrLog options (omit argument for help)                                                                                                  
     -Xdavex <arg>            Extended JCR remoting options (omit argument for help)                                                                                            
     --credentials <arg>      The default credentials to use                                                                                                                    
     --update-credentials     if present the credentials-to-host list is updated in the ~/.vault/auth.xml                                                                       
     --config <arg>           The JcrFs config to use                                                                                                                           
     -v (--verbose)           verbose output                                                                                                                                    
     -q (--quiet)             print as little as possible                                                                                                                       
     --version                print the version information and exit                                                                                                            
     --log-level <level>      the log4j log level                                                                                                                               
     -h (--help) <command>    print this help                                                                                          
   ```

After you have installed it you need to update global ignored subversion files. Edit your svn settings and add the following:

```xml
[miscellany]
### Set global-ignores to a set of whitespace-delimited globs
### which Subversion will ignore in its 'status' output, and
### while importing or adding files and directories.
global-ignores = .vlt
```

### Configuring the End of Line Character {#configuring-the-end-of-line-character}

VLT automatically handles End Of Line (EOF) according to the following rules:

* lines of files checked out on Windows end with a `CRLF`
* lines of files checked out on Unices end with a `LF`
* lines of files commited to the repository end with a `LF`

To guarantee that VLT and SVN configuration match, you should set up the `svn:eol-style` property to `native` for the extension of the files stored in the repository. Edit your svn settings and add the following:

```xml
[auto-props]
*.css = svn:eol-style=native
*.cnd = svn:eol-style=native
*.java = svn:eol-style=native
*.js = svn:eol-style=native
*.json = svn:eol-style=native
*.xjson = svn:eol-style=native
*.jsp = svn:eol-style=native
*.txt = svn:eol-style=native
*.html = svn:eol-style=native
*.xml = svn:eol-style=native
*.properties = svn:eol-style=native
```

### Checking out the repository {#checking-out-the-repository}

Check out the repository using the source control system. In svn, for example, type the following (substituting the URI and path with your repository):

```shell
svn co https://svn.server.com/repos/myproject
```

### Synchronizing with the repository {#synchronizing-with-the-repository}

You need to synchronize filevault with the repository. To do this:

1. In the command line, navigate to **content/jcr_root**.
1. Check out the repository by typing the following (substituting your port number for **4502** and your admin passwords):

   ```shell
   vlt --credentials admin:admin co --force http://localhost:4502/crx
   ```

   >[!NOTE]
   >
   >The credentials have to be specified only once upon your initial checkout. They will then be stored in your home directory inside **.vault/auth.xml**.

### Testing whether the synchronization worked {#testing-whether-the-synchronization-worked}

After you have checked out the repository and synchronized it, you should test to make sure everything functions properly. An easy way to do this is to edit a **.jsp** file and see whether your changes are reflected after committing the changes.

To test the synchronization:

1. Navigate to **.../jcr_content/libs/foundation/components/text**.
1. Edit something in **text.jsp**.
1. See the modified files by typing `vlt st`
1. See the changes by typing `vlt diff text.jsp`
1. Commit the changes: `vlt ci test.jsp`.
1. Reload a page containing a text component and see whether your changes are there.

## Getting Help with the VLT Tool {#getting-help-with-the-vlt-tool}

After installing the VLT tool, you can access its Help file from the command line:

```shell
vlt --help
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Jackrabbit FileVault [version 3.1.16] Copyright 2013 by Apache Software Foundation. See LICENSE.txt for more information.                                                    
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Usage:                                                                                                                                                                       
  vlt [options] <command> [arg1 [arg2 [arg3] ..]]                                                                                                                            
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Global options:                                                                                                                                                              
  -Xjcrlog <arg>           Extended JcrLog options (omit argument for help)                                                                                                  
  -Xdavex <arg>            Extended JCR remoting options (omit argument for help)                                                                                            
  --credentials <arg>      The default credentials to use                                                                                                                    
  --update-credentials     if present the credentials-to-host list is updated in the ~/.vault/auth.xml                                                                       
  --config <arg>           The JcrFs config to use                                                                                                                           
  -v (--verbose)           verbose output                                                                                                                                    
  -q (--quiet)             print as little as possible                                                                                                                       
  --version                print the version information and exit                                                                                                            
  --log-level <level>      the log4j log level                                                                                                                               
  -h (--help) <command>    print this help                                                                                                                                   
Commands:                                                                                                                                                                    
  export                   Export the Vault filesystem                                                                                                                       
  import                   Import a Vault filesystem                                                                                                                         
  checkout (co)            Checkout a Vault file system                                                                                                                      
  status (st)              Print the status of working copy files and directories.                                                                                           
  update (up)              Bring changes from the repository into the working copy.                                                                                          
  info                     Displays information about a local file.                                                                                                          
  commit (ci)              Send changes from your working copy to the repository.                                                                                            
  revert (rev)             Restore pristine working copy file (undo most local edits).                                                                                       
  resolved (res)           Remove 'conflicted' state on working copy files or directories.                                                                                   
  propget (pg)             Print the value of a property on files or directories.                                                                                            
  proplist (pl)            Print the properties on files or directories.                                                                                                     
  propset (ps)             Set the value of a property on files or directories.                                                                                              
  add                      Put files and directories under version control.                                                                                                  
  delete (del,rm)          Remove files and directories from version control.                                                                                                
  diff (di)                Display the differences between two paths.                                                                                                        
  rcp                      Remote copy of repository content.                                                                                                                
  sync                     Control vault sync service                                                                                                                        
  console                  Run an interactive console                                                                                                                        
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

```

For help on a particular command, type the help command followed by the name of the command. For example:

```shell
vlt --help export
Usage:                                                                                                                                                                       
 export -v|-t <arg>|-p <uri> <jcr-path> <local-path>                                                                                                                         

Description:
  Export the Vault filesystem mounted at <uri> to the local filesystem at <local-path>. An optional <jcr-path> can be specified in order to export just a sub tree.          
                                                                                                                                                                             
  Example:                                                                                                                                                                   
    vlt export http://localhost:4502/crx /apps/geometrixx myproject                                                                                                          

Options:                                                                                                                                                                     
  -v (--verbose)          verbose output                                                                                                                                     
  -t (--type) <arg>       specifies the export type. either 'platform' or 'jar'.                                                                                             
  -p (--prune-missing)    specifies if missing local files should be deleted.                                                                                                
  <uri>                   mountpoint uri                                                                                                                                     
  <jcr-path>              the jcr path                                                                                                                                       
  <local-path>            the local path                        
```

## Common Tasks Performed in VLT {#common-tasks-performed-in-vlt}

The following are some common tasks performed in VLT. For detailed information on each command see the individual [commands](#vlt-commands).

### Checking out a subtree {#checking-out-a-subtree}

If you only want to check out a subtree of the repository for example, **/apps/geometrixx**, you can do so by typing the following:

```shell
vlt co http://localhost:4502/crx/-/jcr:root/apps/geometrixx geo
```

Doing this creates a new export root **geo** with a **META-INF** and **jcr_root** directory and puts all files below **/apps/geometrixx** in **geo/jcr_root**.

### Performing a filtered checkout {#performing-a-filtered-checkout}

If you have an existing workspace filter and you want to use it for checkout, you can either first create the **META-INF/vault** directory and place the filter there, or specify it on the command line as follows:

```shell
$ vlt co --filter filter.xml http://localhost:4502/crx/-/jcr:root geo
```

An example filter:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<workspaceFilter version="1.0">
    <filter root="/etc/designs/geometrixx" />
    <filter root="/apps/geometrixx"/>
</workspaceFilter>
```

### Using import/export instead of .vlt control {#using-import-export-instead-of-vlt-control}

You can import and export content between a JCR repository and the local file system without using control files.

To import and export content without using .vlt control:

1. Initially set up the repository:

   ```shell
   $ cd /projects
   $ svn mkdir https://svn.server.com/repos/myproject
   $ svn co https://svn.server.com/repos/myproject
   $ vlt export -v http://localhost:4502/crx /apps/geometrixx geometrixx
   $ cd geometrixx/
   $ svn add META-INF/ jcr_root/
   $ svn ci
   ```

1. Change the remote copy and update JCR:

   ```shell
   $ cd /projects/geometrixx
   $ vlt -v import http://localhost:4502/crx . /
   ```

1. Change the remote copy and update the file server:

   ```shell
   $ cd /projects/geometrixx
   $ vlt export -v http://localhost:4502/crx /apps/geometrixx .
   $ svn st
   M      META-INF/vault/properties.xml
   M      jcr_root/apps/geometrixx/components/contentpage/.content.xml
   $ svn ci
   ```

## Using VLT {#using-vlt}

To issue commands in VLT, type the following at the command line:

```shell
vlt [options] <command> [arg1 [arg2 [arg3] ..]]  
```

Options and commands are described in detail in the following sections.

## VLT Global Options {#vlt-global-options}

The following is a list of VLT options, which are available for all commands. See the individual commands for information on additional available options.

<table> 
 <tbody> 
  <tr> 
   <td><strong>Option<br /> </strong></td> 
   <td><strong>Description<br /> </strong></td> 
  </tr> 
  <tr> 
   <td>-Xjcrlog &lt;arg&gt;</td> 
   <td>Extended JcrLog options<br /> </td> 
  </tr> 
  <tr> 
   <td>-Xdavex &lt;arg&gt;</td> 
   <td>Extended JCR remoting options<br /> </td> 
  </tr> 
  <tr> 
   <td>--credentials &lt;arg&gt;</td> 
   <td>The default credentials to use</td> 
  </tr> 
  <tr> 
   <td>--config &lt;arg&gt;</td> 
   <td>The JcrFs config to use<br /> </td> 
  </tr> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>print as little as possible <br /> </td> 
  </tr> 
  <tr> 
   <td>--version</td> 
   <td>Prints the version information and exits VLT</td> 
  </tr> 
  <tr> 
   <td>--log-level &lt;level&gt;</td> 
   <td>Indicates the log level, for example, the log4j log level.</td> 
  </tr> 
  <tr> 
   <td>-h (--help) &lt;command&gt;</td> 
   <td>Prints help for that particular command</td> 
  </tr> 
 </tbody> 
</table>

## VLT Commands {#vlt-commands}

The following table describes all available VLT commands. See the individual commands for detailed information on syntax, available options, and examples.

<table> 
 <tbody> 
  <tr> 
   <td><strong>Command</strong></td> 
   <td><strong>Abbreviated Command</strong></td> 
   <td><strong>Description</strong></td> 
  </tr> 
  <tr> 
   <td>export <br /> </td> 
   <td><strong> </strong></td> 
   <td>Exports from a JCR repository (vault file system) to the local file system without control files.<br /> </td> 
  </tr> 
  <tr> 
   <td>import</td> 
   <td> </td> 
   <td>Imports a local file system to a JCR repository (vault file system).</td> 
  </tr> 
  <tr> 
   <td>checkout<br /> </td> 
   <td>co</td> 
   <td>Checks out a Vault file system. Use this for an initial JCR repository to the local file system. (<strong>Note:</strong> You must first check out the repository in subversion.)<br /> </td> 
  </tr> 
  <tr> 
   <td>analyze <br /> </td> 
   <td> </td> 
   <td>Analyzes packages.</td> 
  </tr> 
  <tr> 
   <td>status</td> 
   <td>st</td> 
   <td>Prints the status of working copy files and directories.</td> 
  </tr> 
  <tr> 
   <td>update</td> 
   <td>up</td> 
   <td>Imports changes from the repository into the working copy.</td> 
  </tr> 
  <tr> 
   <td>info</td> 
   <td> </td> 
   <td>Displays information about a local file.</td> 
  </tr> 
  <tr> 
   <td>commit</td> 
   <td>ci</td> 
   <td>Sends changes from your working copy to the repository.</td> 
  </tr> 
  <tr> 
   <td>revert</td> 
   <td>rev</td> 
   <td>Restores the working copy file to its original state and undoes most local edits.</td> 
  </tr> 
  <tr> 
   <td>resolved</td> 
   <td>res</td> 
   <td>Removes <strong>conflicted</strong> state on working copy files or directories.</td> 
  </tr> 
  <tr> 
   <td>propget</td> 
   <td>pg</td> 
   <td>Prints the value of a property on files or directories.</td> 
  </tr> 
  <tr> 
   <td>proplist</td> 
   <td>pl</td> 
   <td>Prints the properties on files or directories. <br /> </td> 
  </tr> 
  <tr> 
   <td>propset</td> 
   <td>ps</td> 
   <td>Sets the value of a property on files or directories.</td> 
  </tr> 
  <tr> 
   <td>add</td> 
   <td> </td> 
   <td>Puts files and directories under version control.</td> 
  </tr> 
  <tr> 
   <td>delete</td> 
   <td>del or rm</td> 
   <td>Removes files and directories from version control.</td> 
  </tr> 
  <tr> 
   <td>diff</td> 
   <td>di</td> 
   <td>Displays the differences between two paths.</td> 
  </tr> 
  <tr> 
   <td>console</td> 
   <td> </td> 
   <td>Runs an interactive console.</td> 
  </tr> 
  <tr> 
   <td>rcp</td> 
   <td> </td> 
   <td>Copies a node tree from one remote repository to another.</td> 
  </tr> 
  <tr> 
   <td>sync </td> 
   <td> </td> 
   <td>Allows to control the vault sync service.</td> 
  </tr> 
 </tbody> 
</table>

### Export {#export}

Exports the Vault filesystem mounted at &lt;uri&gt; to the local filesystem at &lt;local-path&gt;. An optional &lt;jcr-path&gt; can be specified in order to export just a sub-tree.

#### Syntax {#syntax}

```shell
export -v|-t <arg>|-p <uri> <jcr-path> <local-path>
```

#### Options {#options}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-t (--type) &lt;arg&gt;</td> 
   <td>specifies the export type, either <strong>platform</strong> or <strong>jar</strong>.</td> 
  </tr> 
  <tr> 
   <td>-p (--prune-missing)</td> 
   <td>specifies if missing local files should be deleted</td> 
  </tr> 
  <tr> 
   <td>&lt;uri&gt;</td> 
   <td>mountpoint uri</td> 
  </tr> 
  <tr> 
   <td>&lt;jcrPath&gt;</td> 
   <td>JCR path<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;localPath&gt;</td> 
   <td>local path<br /> </td> 
  </tr> 
 </tbody> 
</table>

#### Examples {#examples}

```shell
vlt export http://localhost:4502/crx /apps/geometrixx myproject
```

### Import {#import}

Imports the local file system (starting at `<local-path>` to the vault file system at `<uri>`. You can specify a `<jcr-path>` as import root. If `--sync` is specified, the imported files are automatically put under vault control.

#### Syntax {#syntax-1}

```shell
import -v|-s <uri> <local-path> <jcr-path>
```

#### Options {#options-1}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-s (-- sync)<br /> </td> 
   <td>puts the local files under vault control</td> 
  </tr> 
  <tr> 
   <td>&lt;uri&gt;</td> 
   <td>mountpoint uri</td> 
  </tr> 
  <tr> 
   <td>&lt;jcrPath&gt;</td> 
   <td>JCR path<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;localPath&gt;</td> 
   <td>local path<br /> </td> 
  </tr> 
 </tbody> 
</table>

#### Examples {#examples-1}

```shell
vlt import http://localhost:4502/crx . /
```

### Checkout (co) {#checkout-co}

Performs an initial check out from a JCR repository to the local filesystem starting at &lt;uri&gt; to the local filesystem at &lt;local-path&gt;. You can also add a &lt;jcrPath&gt; argument to check out a sub-directory of the remote tree. Workspace filters can be specified that are copied into the META-INF directory.

#### Syntax {#syntax-2}

```shell
checkout --force|-v|-q|-f <file> <uri> <jcrPath> <localPath>  
```

#### Options {#options-2}

<table> 
 <tbody> 
  <tr> 
   <td>--force</td> 
   <td>forces checkout to overwrite local files if they already exist</td> 
  </tr> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-f (--filter) &lt;file&gt;</td> 
   <td>specifies auto filters if none are defined</td> 
  </tr> 
  <tr> 
   <td>&lt;uri&gt;</td> 
   <td>mountpoint uri</td> 
  </tr> 
  <tr> 
   <td>&lt;jcrPath&gt;</td> 
   <td>(optional) remote path<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;localPath&gt;</td> 
   <td>(optional) local path<br /> </td> 
  </tr> 
 </tbody> 
</table>

#### Examples {#examples-2}

Using JCR Remoting:

```shell
vlt --credentials admin:admin co http://localhost:8080/crx/server/crx.default/jcr_root/
```

With the default workspace:

```shell
vlt --credentials admin:admin co http://localhost:8080/crx/server/-/jcr_root/
```

If URI is incomplete, it will be expanded:

```shell
vlt --credentials admin:admin co http://localhost:8080/crx 
```

### Analyze {#analyze}

Analyzes packages.

#### Syntax {#syntax-3}

```shell
analyze -l <format>|-v|-q <localPaths1> [<localPaths2> ...]
```

#### Options {#options-3}

<table> 
 <tbody> 
  <tr> 
   <td>-l (--linkFormat) &lt;format&gt;</td> 
   <td>printf format for hotfix links (name,id), for example <code>[CQ520_HF_%s|%s]</code></td> 
  </tr> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>&lt;localPaths&gt; [&lt;localPaths&gt; ...] <br /> </td> 
   <td>local path<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Status {#status}

Prints the status of working copy files and directories.

If `--show-update` is specified, each file is checked against the remote version. The second letter then specifies what action would be performed by an update operation.

#### Syntax {#syntax-4}

```shell
status -v|-q|-u|-N <file1> [<file2> ...] 
```

#### Options {#options-4}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-u (--show-update)</td> 
   <td>displays update information</td> 
  </tr> 
  <tr> 
   <td>-N (--non-recursive)</td> 
   <td>operates on a single directory</td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to display the status</td> 
  </tr> 
 </tbody> 
</table>

### Update {#update}

Copies changes from the repository into the working copy.

#### Syntax {#syntax-5}

```shell
update -v|-q|--force|-N <file1> [<file2> ...] 
```

#### Options {#options-5}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>--force</td> 
   <td>forces the overwrite of local files<br /> </td> 
  </tr> 
  <tr> 
   <td>-N (--non-recursive)</td> 
   <td>operates on a single directory</td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to update</td> 
  </tr> 
 </tbody> 
</table>

### Info {#info}

Displays information about a local file.

#### Syntax {#syntax-6}

```shell
info -v|-q|-R <file1> [<file2> ...] 
```

#### Options {#options-6}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-R (--recursive)</td> 
   <td>operates recursive</td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to display info<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Commit {#commit}

Sends changes from your working copy to the repository.

#### Syntax {#syntax-7}

```shell
commit -v|-q|--force|-N <file1> [<file2> ...]
```

#### Options {#options-7}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>--force</td> 
   <td>forces committing even if the remote copy is modified<br /> </td> 
  </tr> 
  <tr> 
   <td>-N (--non-recursive)</td> 
   <td>operates on a single directory</td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to commit</td> 
  </tr> 
 </tbody> 
</table>

### Revert {#revert}

Restores working copy file to original state and undoes most local edits.

#### Syntax {#syntax-8}

```shell
revert -q|-R <file1> [<file2> ...]   
```

#### Options {#options-8}

<table> 
 <tbody> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-R (--recursive)</td> 
   <td>descends recursively<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to commit</td> 
  </tr> 
 </tbody> 
</table>

### Resolved {#resolved}

Removes **conflicted** state on working copy files or directories.

>[!NOTE]
>
>This command does not semantically resolve conflicts or remove conflict markers; it merely removes the conflict-related artifact files and allows PATH to be committed again.

#### Syntax {#syntax-9}

```shell
resolved -q|-R|--force <file1> [<file2> ...]  
```

#### Options {#options-9}

<table> 
 <tbody> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-R (--recursive)</td> 
   <td>descends recursively<br /> </td> 
  </tr> 
  <tr> 
   <td>--force</td> 
   <td>resolves, even if there are conflict markers</td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to resolve</td> 
  </tr> 
 </tbody> 
</table>

### Propget {#propget}

Prints the value of a property on files or directories.

#### Syntax {#syntax-10}

```shell
propget -q|-R <propname> <file1> [<file2> ...]
```

#### Options {#options-10}

<table> 
 <tbody> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-R (--recursive)</td> 
   <td>descends recursively<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;propname&gt;</td> 
   <td>the property name<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to get the property from<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Proplist {#proplist}

Prints the properties on files or directories.

#### Syntax {#syntax-11}

```shell
proplist -q|-R <file1> [<file2> ...] 
```

#### Options {#options-11}

<table> 
 <tbody> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-R (--recursive)</td> 
   <td>descends recursively<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to list the properties from<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Propset {#propset}

Sets the value of a property on files or directories.

>[!NOTE]
>
>VLT recognizes the following special versioned properties:   
>
>**vlt:mime-type** 
>
>The mimetype of the file. Used to determine whether to merge the file. A mimetype beginning with 'text/' (or an absent mimetype) is treated as text. Anything else is treated as binary.

#### Syntax {#syntax-12}

```shell
propset -q|-R <propname> <propval> <file1> [<file2> ...]
```

#### Options {#options-12}

<table> 
 <tbody> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-R (--recursive)</td> 
   <td>descends recursively<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;propname&gt;</td> 
   <td>the property name<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;propval&gt;</td> 
   <td>the property value</td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to set the property to<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Add {#add}

Puts files and directories under version control, scheduling them for addition to repository. They will be added on next commit.

#### Syntax {#syntax-13}

```shell
add -v|-q|-N|--force <file1> [<file2> ...] 
```

#### Options {#options-13}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>-N (--non-recursive)<br /> </td> 
   <td>operates on a single directory</td> 
  </tr> 
  <tr> 
   <td>--force</td> 
   <td>forces the operation to run<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>local file or directory to add<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Delete {#delete}

Removes files and directories from version control.

#### Syntax {#syntax-14}

```shell
delete -v|-q|--force <file1> [<file2> ...] 
```

#### Options {#options-14}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)</td> 
   <td>verbose output</td> 
  </tr> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>prints as little as possible</td> 
  </tr> 
  <tr> 
   <td>--force</td> 
   <td>forces the operation to run<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>local file or directory to delete<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Diff {#diff}

Displays the differences between two paths.

#### Syntax {#syntax-15}

```shell
diff -N <file1> [<file2> ...]
```

#### Options {#options-15}

<table> 
 <tbody> 
  <tr> 
   <td>-N (--non-recursive)<br /> </td> 
   <td>operates on a single directory</td> 
  </tr> 
  <tr> 
   <td>&lt;file&gt; [&lt;file&gt; ...] <br /> </td> 
   <td>file or directory to display the differences from<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Console {#console}

Runs an interactive console.

#### Syntax {#syntax-16}

```shell
console -F <file>
```

#### Options {#options-16}

<table> 
 <tbody> 
  <tr> 
   <td>-F (--console-settings) &lt;file&gt;</td> 
   <td>specifies the console settings file. The default file is <strong>console.properties</strong>.<br /> </td> 
  </tr> 
 </tbody> 
</table>

### Rcp {#rcp}

Copies a node tree from one remote repository to another. `<src>` points to the source node and `<dst>` specifies the destination path, where the parent node must exist. Rcp processes the nodes by streaming the data.

#### Syntax {#syntax-17}

```shell
rcp -q|-r|-b <size>|-t <seconds>|-u|-n|-e <arg1> [<arg2> ...] <src> <dst>
```

#### Options {#options-17}

<table> 
 <tbody> 
  <tr> 
   <td>-q (--quiet)</td> 
   <td>Prints as little as possible.</td> 
  </tr> 
  <tr> 
   <td>-r (--recursive)</td> 
   <td>Descends recursively.<br /> </td> 
  </tr> 
  <tr> 
   <td>-b (--batchSize) &lt;size&gt;</td> 
   <td>Number of nodes to be processed before an intermediate save.</td> 
  </tr> 
  <tr> 
   <td>-t (--throttle) &lt;seconds&gt;</td> 
   <td>Number of seconds to wait after<br /> an intermediate save.</td> 
  </tr> 
  <tr> 
   <td>-u (--update)</td> 
   <td>Overwrite/delete existing nodes.</td> 
  </tr> 
  <tr> 
   <td>-n (--newer)</td> 
   <td>Respect lastModified properties for update.</td> 
  </tr> 
  <tr> 
   <td>-e (--exclude) &lt;arg&gt; [&lt;arg&gt; ...]</td> 
   <td>Regexp of excluded source paths.</td> 
  </tr> 
  <tr> 
   <td>&lt;src&gt;<br /> </td> 
   <td>The repository address of the source tree.<br /> </td> 
  </tr> 
  <tr> 
   <td>&lt;dst&gt;</td> 
   <td>The repository address of the destination node.</td> 
  </tr> 
 </tbody> 
</table>

#### Examples {#examples-3}

```shell
vlt rcp http://localhost:4502/crx/-/jcr:root/content  https://admin:admin@localhost:4503/crx/-/jcr:root/content_copy  
```

>[!NOTE]
>
>The `--exclude` options need to be followed by another option before the `<src>` and `<dst>` arguments. For example:
>
>`vlt rcp -e ".*\.txt" -r`

### Sync {#sync}

Allows to control the vault sync service. Without any arguments this command tries to put the current working directory under sync control. If executed within a vlt checkout, it uses the respective filter and host to configure the synchronization. If executed outside of a vlt checkout, it registers the current folder for synchronization only if the directory is empty.

#### Syntax {#syntax-18}

```shell
sync -v|--force|-u <uri> <command> <localPath>
```

#### Options {#options-18}

<table> 
 <tbody> 
  <tr> 
   <td>-v (--verbose)<br /> </td> 
   <td>verbose output.</td> 
  </tr> 
  <tr> 
   <td>--force</td> 
   <td>force certain commands to execute.<br /> </td> 
  </tr> 
  <tr> 
   <td>-u (--uri) &lt;uri&gt;<br /> </td> 
   <td>specifies the URI of the sync host.</td> 
  </tr> 
  <tr> 
   <td>&lt;command&gt;</td> 
   <td>sync command to execute.</td> 
  </tr> 
  <tr> 
   <td>&lt;localPath&gt;</td> 
   <td>local folder to sync.</td> 
  </tr> 
 </tbody> 
</table>

### Status Codes {#status-codes}

The status codes used by VLT are:

* ' ' no modifications  
* 'A' Added  
* 'C' Conflicted  
* 'D' Deleted  
* 'I' Ignored  
* 'M' Modified  
* 'R' Replaced  
* '?' item is not under version control  
* '!' item is missing (removed by non-svn command) or incomplete  
* '~' versioned item obstructed by some item of a different kind

## Setting up FileVault sync {#setting-up-filevault-sync}

This section describes the new synchronization feature shipped with FileVault tool (vlt) since the version 2.4.24.

The vault sync service is used to synchronize repository content with a local filesystem representation and vice versa. This is achieved by installing an OSGi service that will listen for repository changes and will scan the filesystem content periodically. It uses the same serialization format as vault for mapping the repository content to disk.

>[!NOTE]
>
>The vault sync service is a development tool and it is highly discouraged to use it on a productive system. Also note that the service can only sync with the local filesystem and cannot be used for remote development.

### Installing the service using vlt {#installing-the-service-using-vlt}

The `vlt sync install` command can be used to install the vault sync service bundle and configuration automatically.

The bundle is installed below `/libs/crx/vault/install` and the config node is created at `/libs/crx/vault/com.day.jcr.sync.impl.VaultSyncServiceImpl`. Initially the service is enabled but no sync roots are configured.

The following example installs the sync service to the CRX instance accessible by the given uri.

```shell
$ vlt --credentials admin:admin sync --uri http://localhost:4502/crx install
```

### Displaying the service status {#displaying-the-service-status}

The `status` command can be used to display information about the running sync service. ``

```shell
$ vlt sync status --uri http://localhost:4502/crx
Connecting via JCR remoting to http://localhost:4502/crx/server
Listing sync status for http://localhost:4502/crx/server/-/jcr:root
- Sync service is enabled.
- No sync directories configured.
```

>[!NOTE]
>
>The `status` command does not fetch any live data from the service but rather reads the configuration at `/libs/crx/vault/com.day.jcr.sync.impl.VaultSyncServiceImpl`.

### Adding a sync folder {#adding-a-sync-folder}

The `register` command is used to add a folder to synchronize to the configuration.

```shell
$ vlt sync register
Connecting via JCR remoting to http://localhost:4502/crx/server
Added new sync directory: /tmp/workspace/vltsync/jcr_root
```

>[!NOTE]
>
>The `register` command does not trigger a synchronization until you configure the `sync-once` configuration.

### Removing a sync folder {#removing-a-sync-folder}

The `unregister` command is used to remove a folder to synchronize from the configuration.

```shell
$  vlt sync unregister
Connecting via JCR remoting to http://localhost:4502/crx/server
Removed sync directory: /tmp/workspace/vltsync/jcr_root

```

>[!NOTE]
>
>You have to unregister a sync folder before you delete the folder itself.

### Configuring synchronization {#configuring-synchronization}

#### Service configuration {#service-configuration}

Once the service is running it can be configured with the following parameters:

* `vault.sync.syncroots`: One or many local filesystem paths that define the sync roots.  

* `vault.sync.fscheckinterval`: Frequency (in seconds) of which the filesystem should be scanned for changes. Default is 5 seconds.
* `vault.sync.enabled`: General flag that enables/disables the service.

>[!NOTE]
>
>The service can be configured with the Web console or a `sling:OsgiConfig` node (with the name `com.day.jcr.sync.impl.VaultSyncServiceImpl`) in the repository.
>
>When working with AEM there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details.

#### Sync folder configuration {#sync-folder-configuration}

Each sync folder stores configuration and status in three files:

* `.vlt-sync-config.properties`: configuration file.  

* `.vlt-sync.log`: log file that contains information about the operations performed during syncing.
* `.vlt-sync-filter.xml`: filters that define what portions of the repository are synced. The format of this file is decribed by the [Performing a filtered checkout](#performing-a-filtered-checkout) section.

The `.vlt-sync-config.properties` file allows you to configure the following properties:

**disabled** Turns the synchronization on or off. By default this parameter is set to false to allow the synchronization.

**sync-once** If non empty the next scan will synchronize the folder in the given direction, then the parameter will be cleared. Two values are supported:

* `JCR2FS`: exports all content in the JCR repository and writes to the local disk.
* `FS2JCR`: imports all content from the disk into the JCR repository.

**sync-log** Defines the log filename. By default, the value is .vlt-sync.log

### Using VLT sync for development {#using-vlt-sync-for-development}

To setup a development environment based on a sync folder proceed as follows:

1. Checkout your repository with the vlt command line:

   ```shell
   $ vlt --credentials admin:admin co --force http://localhost:4502/crx dev
   ```

   >[!NOTE]
   >
   >You can use filters to only checkout the appropriate paths. See the [Performing a filtered checkout](#performing-a-filtered-checkout) section for information.

1. Go to the root folder of your working copy:

   ```shell
   $ cd dev/jcr_root/
   ```

1. Install the sync service to your repository:

   ```xml
   $ vlt sync install
   Connecting via JCR remoting to http://localhost:4502/crx/server
   Preparing to install vault-sync-2.4.24.jar...
   Updated bundle: vault-sync-2.4.24.jar
   Created new config at /libs/crx/vault/config/com.day.jcr.sync.impl.VaultSyncServiceImpl
   ```

1. Initialize the sync service:

   ```shell
   $ vlt sync
   Connecting via JCR remoting to http://localhost:4502/crx/server
   Starting initialization of sync service in existing vlt checkout /Users/colligno/Applications/cq5/vltsync/sandbox/dev/jcr_root for http://localhost:4502/crx/server/-/jcr:root
   Added new sync directory: /Users/trushton/Applications/aem/vltsync/sandbox/dev/jcr_root
   
   The directory /Users/trushton/Applications/aem/vltsync/sandbox/dev/jcr_root is now enabled for syncing.
   You might perform a 'sync-once' by setting the
   appropriate flag in the /Users/trushton/Applications/aem/vltsync/sandbox/dev/jcr_root/.vlt-sync-config.properties file.
   ```

1. Edit the `.vlt-sync-config.properties` hidden file and configure sync to synchronize the content of your repository:

   ```xml
   sync-once=JCR2FS
   ```

   >[!NOTE]
   >
   >This step downloads the whole repository according to your filter configuration.

1. Check the log file `.vlt-sync.log` to see the progress:

   ```xml
   ***
   30.04.2017 14:39:10 A file:///Users/trushton/Applications/aem/vltsync/sandbox/dev/jcr_root/apps/geometrixx-outdoors/src/core/src/main/java/info/geometrixx/outdoors/
   30.04.2017 14:39:10 A file:///Users/trushton/Applications/aem/vltsync/sandbox/dev/jcr_root/apps/geometrixx-outdoors/src/core/src/main/java/info/geometrixx/outdoors/core/
   30.04.2017 14:39:10 A file:///Users/trushton/Applications/aem/vltsync/sandbox/dev/jcr_root/apps/geometrixx-outdoors/src/core/src/main/java/info/geometrixx/outdoors/core/product/
   30.04.2017 14:39:10 A file:///Users/trushton/Applications/aem/vltsync/sandbox/dev/jcr_root/apps/geometrixx-outdoors/src/core/src/main/java/info/geometrixx/outdoors/core/product/GeoProduct.java
   ***
   ```

Your local folder is now synchronized with the repository. The synchronization is bi-directionnal so modification from the repository will be applied to you local sync folder and vice versa.

>[!NOTE]
>
>The VLT Sync feature only supports simple files and folders but detects special vault serialized files (.content.xml, dialog.xml, etc) and ignores them silently. Thus it is possible to use vault sync on a default vlt checkout.

