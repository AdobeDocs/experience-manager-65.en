---
title: How to use the VLT Tool
description: The Jackrabbit FileVault tool (VLT) is developed by The Apache Foundation that maps the content of a Jackrabbit/AEM instance to your file system
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: development-tools
content-type: reference
exl-id: efbba312-9fc8-4670-b8f1-d2a86162d075
solution: Experience Manager, Experience Manager Sites
feature: Developing,Developer Tools
role: Developer
---
# How to Use the VLT Tool {#how-to-use-the-vlt-tool}

The Jackrabbit FileVault tool (VLT) is a tool developed by [The Apache Foundation](https://www.apache.org/) that maps the content of a Jackrabbit/AEM instance to your file system. The VLT tool has similar functions as source control system client (such as a Subversion (SVN) client), providing normal check-in, check-out and management operations, and configuration options for flexible representation of the project content.

You run the VLT tool from the command line. This document describes how to use the tool, including how to get started and get help, and a list of all [commands](#vlt-commands) and available [options](#vlt-global-options).

## Concepts and Architecture {#concepts-and-architecture}

See the [Filevault Overview](https://jackrabbit.apache.org/filevault/overview.html) and [Vault FS](https://jackrabbit.apache.org/filevault/vaultfs.html) page from the official [Apache Jackrabbit Filevault documentation](https://jackrabbit.apache.org/filevault/index.html) for a thorough overview of the concepts and strucure of the Filevault tool.

## Getting Started with VLT {#getting-started-with-vlt}

To start using VLT, you need to do the following:

1. Install VLT, update environment variables, and update global ignored subversion files.
1. Set up the AEM repository (if you have not already done so).
1. Check out the AEM repository.
1. Synchronize with the repository.
1. Test whether the synchronization worked.

### Installing the VLT Tool {#installing-the-vlt-tool}

To use the VLT tool, you first need to install it. It is not installed by default as it is an additional tool. In addition, you need to set your system's environment variable.

1. Download the FileVault archive file from the [Maven artifact repository.](https://repo1.maven.org/maven2/org/apache/jackrabbit/vault/vault-cli/)
    >[!NOTE]
    >
    >The source of the VLT tool is [available on GitHub.](https://github.com/apache/jackrabbit-filevault)
1. Extract the archive.
1. Add `<archive-dir>/vault-cli-<version>/bin` to your environment `PATH` so that the command files `vlt` or `vlt.bat` are accessed as appropriate. For example:
    
    `<aem-installation-dir>/crx-quickstart/opt/helpers/vault-cli-3.1.16/bin>`

1. Open a command line shell and execute `vlt --help`. Make sure the output is similar to the following help screen:

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
* lines of files checked out on Linux/Unix end with a `LF`
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

### Checking Out the Repository {#checking-out-the-repository}

Check out the repository using the source control system. In svn, for example, type the following (substituting the URI and path with your repository):

```shell
svn co https://svn.server.com/repos/myproject
```

### Synchronizing with the Repository {#synchronizing-with-the-repository}

You need to synchronize filevault with the repository. To do this:

1. In the command line, navigate to `content/jcr_root`.
1. Check out the repository by typing the following (substituting your port number for **4502** and your admin passwords):

   ```shell
   vlt --credentials admin:admin co --force http://localhost:4502/crx
   ```

   >[!NOTE]
   >
   >The credentials have to be specified only once upon your initial checkout. They will then be stored in your home directory inside `.vault/auth.xml`.

### Testing Whether the Synchronization Worked {#testing-whether-the-synchronization-worked}

After you have checked out the repository and synchronized it, you should test to make sure everything functions properly. An easy way to do this is to edit a **.jsp** file and see whether your changes are reflected after committing the changes.

To test the synchronization:

1. Navigate to `.../jcr_content/libs/foundation/components/text`.
1. Edit something in `text.jsp`.
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
  Export the Vault filesystem mounted at <uri> to the local filesystem at <local-path>. An optional <jcr-path> can be specified to export just a sub tree.
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

### Checking Out a Subtree {#checking-out-a-subtree}

If you only want to check out a subtree of the repository for example, `/apps/geometrixx`, you can do so by typing the following:

```shell
vlt co http://localhost:4502/crx/-/jcr:root/apps/geometrixx geo
```

Doing this creates a new export root `geo` with a `META-INF` and `jcr_root` directory and puts all files below `/apps/geometrixx` in `geo/jcr_root`.

### Performing a Filtered Checkout {#performing-a-filtered-checkout}

If you have an existing workspace filter and you want to use it for checkout, you can either first create the `META-INF/vault` directory and place the filter there, or specify it on the command line as follows:

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

### Using Import/Export Instead of .vlt Control {#using-import-export-instead-of-vlt-control}

You can import and export content between a JCR repository and the local file system without using control files.

To import and export content without using `.vlt` control:

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

|||
|--- |--- |
|Option|Description|
|`-Xjcrlog <arg>`|Extended JcrLog options|
|`-Xdavex <arg>`|Extended JCR remoting options|
|`--credentials <arg>`|The default credentials to use|
|`--config <arg>`|The JcrFs config to use|
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|print as little as possible|
|`--version`|Prints the version information and exits VLT|
|`--log-level <level>`|Indicates the log level, for example, the log4j log level.|
|`-h (--help) <command>`|Prints help for that particular command|

## VLT Commands {#vlt-commands}

The following table describes all available VLT commands. See the individual commands for detailed information on syntax, available options, and examples.

||||
|--- |--- |--- |
|Command|Abbreviated Command|Description|
|`export`||Exports from a JCR repository (vault file system) to the local file system without control files.|
|`import`||Imports a local file system to a JCR repository (vault file system).|
|`checkout`|`co`|Checks out a Vault file system. Use this for an initial JCR repository to the local file system. (Note: First check out the repository in subversion.)|
|`analyze`||Analyzes packages.|
|`status`|`st`|Prints the status of working copy files and directories.|
|`update`|`up`|Imports changes from the repository into the working copy.|
|`info`||Displays information about a local file.|
|`commit`|`ci`|Sends changes from your working copy to the repository.|
|`revert`|`rev`|Restores the working copy file to its original state and undoes most local edits.|
|`resolved`|`res`|Removes conflicted state on working copy files or directories.|
|`propget`|`pg`|Prints the value of a property on files or directories.|
|`proplist`|`pl`|Prints the properties on files or directories.|
|`propset`|`ps`|Sets the value of a property on files or directories.|
|`add`||Puts files and directories under version control.|
|`delete`|`del` or `rm`|Removes files and directories from version control.|
|`diff`|`di`|Displays the differences between two paths.|
|`console`||Runs an interactive console.|
|`rcp`||Copies a node tree from one remote repository to another.|
|`sync`||Lets you control the vault sync service.|

### Export {#export}

Exports the Vault filesystem mounted at &lt;uri&gt; to the local filesystem at &lt;local-path&gt;. An optional &lt;jcr-path&gt; can be specified to export just a sub-tree.

#### Syntax {#syntax}

```shell
export -v|-t <arg>|-p <uri> <jcr-path> <local-path>
```

#### Options {#options}

|||
|--- |--- |
|`-v (--verbose)`|verbose output|
|`-t (--type) <arg>`|specifies the export type, either platform or jar.|
|`-p (--prune-missing)`|specifies if missing local files should be deleted|
|`<uri>`|mountpoint uri|
|`<jcrPath>`|JCR path|
|`<localPath>`|local path|

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

|||
|--- |--- |
|`-v (--verbose)`|verbose output|
|`-s (-- sync)`|puts the local files under vault control|
|`<uri>`|mountpoint uri|
|`<jcrPath>`|JCR path|
|`<localPath>`|local path|

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

|||
|--- |--- |
|`--force`|forces checkout to overwrite local files if they already exist|
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|prints as little as possible|
|`-f (--filter) <file>`|specifies auto filters if none are defined|
|`<uri>`|mountpoint uri|
|`<jcrPath>`|(optional) remote path|
|`<localPath>`|(optional) local path|

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

|||
|--- |--- |
|`-l (--linkFormat) <format>`|printf format for hotfix links (name,id), for example, `[CQ520_HF_%s\|%s]`|
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|prints as little as possible|
|`<localPaths> [<localPaths> ...]`|local path|

### Status {#status}

Prints the status of working copy files and directories.

If `--show-update` is specified, each file is checked against the remote version. The second letter then specifies what action would be performed by an update operation.

#### Syntax {#syntax-4}

```shell
status -v|-q|-u|-N <file1> [<file2> ...]
```

#### Options {#options-4}

|||
|--- |--- |
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|prints as little as possible|
|`-u (--show-update)`|displays update information|
|`-N (--non-recursive)`|operates on a single directory|
|`<file> [<file> ...]`|file or directory to display the status|

### Update {#update}

Copies changes from the repository into the working copy.

#### Syntax {#syntax-5}

```shell
update -v|-q|--force|-N <file1> [<file2> ...]
```

#### Options {#options-5}

|||
|--- |--- |
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|prints as little as possible|
|`--force`|forces the overwrite of local files|
|`-N (--non-recursive)`|operates on a single directory|
|`<file> [<file> ...]`|file or directory to update|

### Info {#info}

Displays information about a local file.

#### Syntax {#syntax-6}

```shell
info -v|-q|-R <file1> [<file2> ...]
```

#### Options {#options-6}

|||
|--- |--- |
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|prints as little as possible|
|`-R (--recursive)`|operates recursive|
|`<file> [<file> ...]`|file or directory to display info|

### Commit {#commit}

Sends changes from your working copy to the repository.

#### Syntax {#syntax-7}

```shell
commit -v|-q|--force|-N <file1> [<file2> ...]
```

#### Options {#options-7}

|||
|--- |--- |
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|prints as little as possible|
|`--force`|forces committing even if the remote copy is modified|
|`-N (--non-recursive)`|operates on a single directory|
|`<file> [<file> ...]`|file or directory to commit|

### Revert {#revert}

Restores working copy file to original state and undoes most local edits.

#### Syntax {#syntax-8}

```shell
revert -q|-R <file1> [<file2> ...]
```

#### Options {#options-8}

|||
|--- |--- |
|`-q (--quiet)`|prints as little as possible|
|`-R (--recursive)`|descends recursively|
|`<file> [<file> ...]`|file or directory to commit|

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

|||
|--- |--- |
|`-q (--quiet)`|prints as little as possible|
|`-R (--recursive)`|descends recursively|
|`--force`|resolves, even if there are conflict markers|
|`<file> [<file> ...]`|file or directory to resolve|

### Propget {#propget}

Prints the value of a property on files or directories.

#### Syntax {#syntax-10}

```shell
propget -q|-R <propname> <file1> [<file2> ...]
```

#### Options {#options-10}

|||
|--- |--- |
|`-q (--quiet)`|prints as little as possible|
|`-R (--recursive)`|descends recursively|
|`<propname>`|the property name|
|`<file> [<file> ...]`|file or directory to get the property from|

### Proplist {#proplist}

Prints the properties on files or directories.

#### Syntax {#syntax-11}

```shell
proplist -q|-R <file1> [<file2> ...]
```

#### Options {#options-11}

|||
|--- |--- |
|`-q (--quiet)`|prints as little as possible|
|`-R (--recursive)`|descends recursively|
|`<file> [<file> ...]`|file or directory to list the properties from|

### Propset {#propset}

Sets the value of a property on files or directories.

>[!NOTE]
>
>VLT recognizes the following special versioned properties:
>
>`vlt:mime-type`
>
>The mimetype of the file. Used to determine whether to merge the file. A mimetype beginning with 'text/' (or an absent mimetype) is treated as text. Anything else is treated as binary.

#### Syntax {#syntax-12}

```shell
propset -q|-R <propname> <propval> <file1> [<file2> ...]
```

#### Options {#options-12}

|||
|--- |--- |
|`-q (--quiet)`|prints as little as possible|
|`-R (--recursive)`|descends recursively|
|`<propname>`|the property name|
|`<propval>`|the property value|
|`<file> [<file> ...]`|file or directory to set the property to|

### Add {#add}

Puts files and directories under version control, scheduling them for addition to repository. They will be added on next commit.

#### Syntax {#syntax-13}

```shell
add -v|-q|-N|--force <file1> [<file2> ...]
```

#### Options {#options-13}

|||
|--- |--- |
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|prints as little as possible|
|`-N (--non-recursive)`|operates on a single directory|
|`--force`|forces the operation to run|
|`<file> [<file> ...]`|local file or directory to add|

### Delete {#delete}

Removes files and directories from version control.

#### Syntax {#syntax-14}

```shell
delete -v|-q|--force <file1> [<file2> ...]
```

#### Options {#options-14}

|||
|--- |--- |
|`-v (--verbose)`|verbose output|
|`-q (--quiet)`|prints as little as possible|
|`--force`|forces the operation to run|
|`<file> [<file> ...]`|local file or directory to delete|

### Diff {#diff}

Displays the differences between two paths.

#### Syntax {#syntax-15}

```shell
diff -N <file1> [<file2> ...]
```

#### Options {#options-15}

|||
|--- |--- |
|`-N (--non-recursive)`|operates on a single directory|
|`<file> [<file> ...]`|file or directory to display the differences from|

### Console {#console}

Runs an interactive console.

#### Syntax {#syntax-16}

```shell
console -F <file>
```

#### Options {#options-16}

|||
|--- |--- |
|`-F (--console-settings) <file>`|specifies the console settings file. The default file is console.properties.|

### Rcp {#rcp}

Copies a node tree from one remote repository to another. `<src>` points to the source node and `<dst>` specifies the destination path, where the parent node must exist. Rcp processes the nodes by streaming the data.

#### Syntax {#syntax-17}

```shell
rcp -q|-r|-b <size>|-t <seconds>|-u|-n|-e <arg1> [<arg2> ...] <src> <dst>
```

#### Options {#options-17}

|||
|--- |--- |
|`-q (--quiet)`|Prints as little as possible.|
|`-r (--recursive)`|Descends recursively.|
|`-b (--batchSize) <size>`|Number of nodes to be processed before an intermediate save.|
|`-t (--throttle) <seconds>`|Number of seconds to wait after an intermediate save.|
|`-u (--update)`|Overwrite/delete existing nodes.|
|`-n (--newer)`|Respect lastModified properties for update.|
|`-e (--exclude) <arg> [<arg> ...]`|Regexp of excluded source paths.|
|`<src>`|The repository address of the source tree.|
|`<dst>`|The repository address of the destination node.|

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

Lets you control the vault sync service. Without any arguments this command tries to put the current working directory under sync control. If run within a vlt checkout, it uses the respective filter and host to configure the synchronization. If run outside of a vlt checkout, it registers the current folder for synchronization only if the directory is empty.

#### Syntax {#syntax-18}

```shell
sync -v|--force|-u <uri> <command> <localPath>
```

#### Options {#options-18}

|||
|--- |--- |
|`-v (--verbose)`|verbose output.|
|`--force`|force certain commands to execute.|
|`-u (--uri) <uri>`|specifies the URI of the sync host.|
|`<command>`|sync command to execute.|
|`<localPath>`|local folder to sync.|

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

## Setting Up FileVault Sync {#setting-up-filevault-sync}

The vault sync service is used to synchronize repository content with a local filesystem representation and conversely. This is achieved by installing an OSGi service that will listen for repository changes and will scan the filesystem content periodically. It uses the same serialization format as vault for mapping the repository content to disk.

>[!NOTE]
>
>The vault sync service is a development tool and it is highly discouraged to use it on a productive system. Also, the service can only sync with the local filesystem and cannot be used for remote development.

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
>When working with AEM, there are several methods of managing the configuration settings for such services; see [Configuring OSGi](/help/sites-deploying/configuring-osgi.md) for full details.

#### Sync folder configuration {#sync-folder-configuration}

Each sync folder stores configuration and status in three files:

* `.vlt-sync-config.properties`: configuration file.  

* `.vlt-sync.log`: log file that contains information about the operations performed during syncing.
* `.vlt-sync-filter.xml`: filters that define what portions of the repository are synced. The format of this file is decribed by the [Performing a filtered checkout](#performing-a-filtered-checkout) section.

The `.vlt-sync-config.properties` file lets you configure the following properties:

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

Your local folder is now synchronized with the repository. The synchronization is bi-directionnal so modification from the repository will be applied to you local sync folder and conversely.

>[!NOTE]
>
>The VLT Sync feature only supports simple files and folders but detects special vault serialized files (.content.xml, dialog.xml, and so on) and ignores them silently. Thus it is possible to use vault sync on a default vlt checkout.
