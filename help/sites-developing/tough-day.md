---
title: Tough Day
description: The Tough Day test simulates the daily load of around 1000 authors in a worst-case scenario with all the operations going on at the same time.
topic-tags: testing
content-type: reference
exl-id: ceb9671c-57f9-4d81-94c0-0dbccd4d90a2
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Tough Day{#tough-day}

## What is Tough Day 2 {#what-is-tough-day}

"Tough Day 2" is an application that lets you stress test the limits of your AEM instance. It can be run out of the box with the default test suite or it can be configured to fit your testing needs. You can watch [this recording](https://experienceleague.adobe.com/docs/events/experience-manager-gems-recordings/gems2017/aem-toughday2-stress-testing-benchmarking-tool.html) for a presentation of the application.

>[!CAUTION]
>
>Tough Day 2 requires Java&trade; 8.

## How to Run Tough Day 2 {#how-to-run-tough-day}

Download the latest version of Tough Day 2 from the [Adobe Repository](https://repo1.maven.org/maven2/com/adobe/qe/toughday2/). After you download the application, you can run it out of the box by providing the `host` parameter. In the following example, the AEM instance runs locally so the `localhost` value is used:

```xml
java -jar toughday2.jar --host=localhost
```

The default suite that runs after adding the parameters is named `toughday`. It contains the following use cases:

* Create pages and live copies for them (including rollouts)
* Get Homepage
* Run queries in querybuilder
* Create asset hierarchies
* Delete assets

The suite contains 15% write actions and 85% read actions.

To run the suite tests, Tough Day 2 will install its default content package. This can be avoided by setting the `installsamplecontent`parameter to `false`, but remember that you should also change the default paths for the tests that you intend to run. If the jar is run without parameters, Tough Day 2 displays the [help information](/help/sites-developing/tough-day.md#getting-help).

As a rule, you can use the application by following this pattern:

```xml
java -jar toughday2.jar [--help | --help_full | --help_tests | --help_publish]  [<global arguments> | <actions> | --runmode | --publishmode]
```

>[!NOTE]
>
>Tough Day 2 does not have a clean-up step. As a result, it is recommended to run Tough Day 2 on a cloned staging instance and not on the main production instance. The staging instance should be dropped after the tests.
>

### Getting Help {#getting-help}

Tough Day 2 offers a wide range of help options that can be accessed from the command line. For example:

```xml
java -jar toughday2.jar --help_full
```

In the table below, you can find the relevant help parameters.

<table>
 <tbody>
  <tr>
   <td><strong>Parameter</strong></td>
   <td><strong>Description</strong></td>
   <td><strong>Example</strong></td>
  </tr>
  <tr>
   <td>--help</td>
   <td>Prints out global information, for example: the available actions, predefined suites, run modes and global parameters.</td>
   <td> </td>
  </tr>
  <tr>
   <td>--help_publish</td>
   <td>Prints out all the available publishers.</td>
   <td> </td>
  </tr>
  <tr>
   <td>--help_tests</td>
   <td>Prints the test classes and their description.</td>
   <td> </td>
  </tr>
  <tr>
   <td>--help_full</td>
   <td>Prints all the above, plus tests, publishers and suite components.</td>
   <td> </td>
  </tr>
  <tr>
   <td> --help --runmode/publishmode type=&lt;Mode&gt;</td>
   <td>Lists information about the specified run or publish mode.</td>
   <td><p>Java&trade; -jar toughday2.jar --help --runmode type=constantload</p> <p>Java&trade; -jar toughday2.jar --help --publishmode type=intervals</p> </td>
  </tr>
  <tr>
   <td>--help --suite=&lt;SuiteName&gt;</td>
   <td>Lists all the tests of a given suite and their respective configurable properties.</td>
   <td><br /> Java&trade; -jar toughday2.jar --help --suite=get_tests</td>
  </tr>
  <tr>
   <td> --help --tag=&lt;Tag&gt;</td>
   <td><br /> Lists all the items that have the specified tag.</td>
   <td>Java&trade; -jar toughday2.jar --help --tag=publish</td>
  </tr>
  <tr>
   <td>--help &lt;TestClass/PublisherClass&gt;</td>
   <td><br /> Lists all the configurable properties for the given test or publisher.</td>
   <td><p>Java&trade; -jar toughday2.jar --help UploadPDFTest</p> <p>Java&trade; -jar toughday2.jar --help CSVPublisher</p> </td>
  </tr>
 </tbody>
</table>

### Global Parameters {#global-parameters}

Tough Day 2 offers global parameters that set or change the environment for the tests. These include the host that is targeted, the port number, the protocol used, user and password for the instance and many more. For example:

```xml
java -jar toughday2.jar --host=host --protocol=https --port=4502 --duration=30m --dryrun=true
```

You can find the relevant parameters in the list bellow:

| **Parameter** |**Description** |**Default Value** |**Possible Values** |
|---|---|---|---|
| `--installsamplecontent=<Val>` |Either installs or skips the default Tough Day 2 content package. |true |true or false |
| `--protocol=<Val>` |The protocol used for the host. |http |http or https |
| `--host=<Val>` |The host name or IP that will be targeted. |  |  |
| `--port=<Val>` |The port of the host. |4502 |  |
| `--user=<Val>` |The user name for the instance. |admin |  |
| `--password=<Val>` |Password for the given user. |admin |  |
| `--duration=<Val>` |The duration of the tests. Can be expressed in **s**econds, **m**inutes, **h**ours, and **d**ays. |1d |  |
| `--timeout=<Val>` |How long a test will run before it will be interrupted and marked as failed. Expressed in seconds. |180 |  |
| `--suite=<Val>` |The value can be one or a list (separated by commas) of predefined test suites. |toughday |  |
| `--configfile=<Val>` |The targeted yaml configuration file. |  |  |
| `--contextpath=<Val>` |Instance's context path. |  |  |
| `--loglevel=<Val>` |The log level for the Tough Day 2 engine. |INFO |ALL, DEBUG, INFO, WARN, ERROR, FATAL, OFF |
| `--dryrun=<Val>` |If true, prints the resulting configuration and does not run any tests. |false |true or false |

## Customizing {#customizing}

Customization can be achieved in two ways: command-line parameters or yaml configuration files. **Configuration files are used for large custom suites and they override the Tough Day 2 default parameters. Command-line parameters override both configuration files and the default parameters.**

The only way to save a test configuration is to copy it in yaml format.

### Adding a New Test {#adding-a-new-test}

If you do not want to use the default `toughday` suite you can add a test of your choosing by using the `add` parameter. The examples below show how to add the `CreateAssetTreeTest` test either by using command-line parameters or a yaml configuration file.

By using command-line parameters:

```xml
java -jar toughday2.jar --host=localhost --add CreateAssetTreeTest
```

By using a yaml configuration file:

```xml
globals:
  host : localhost
tests:
  - add : CreateAssetTreeTest
```

### Adding Multiple Instances of the Same Test  {#adding-multiple-instances-of-the-same-test}

You can also add and run multiple instances of the same test, but each instance must have a unique name. The examples below show how to add two instances of the same test either by using command-line parameters or a yaml configuration file.

By using command-line parameters:

```xml
java -jar toughday2.jar --host=localhost --add CreateAssetTreeTest name=FirstAssetTree --add CreateAssetTreeTest name=SecondAssetTree
```

By using a yaml configuration file:

```xml
globals:
  host : localhost
tests:
  - add : CreateAssetTreeTest
    properties:
      name : FirstAssetTree
  - add : CreateAssetTreeTest
    properties:
      name : SecondAssetTree
```

### Changing the Test Properties {#changing-the-test-properties}

In case you need to change one or more of the test properties, you can add that property to the command line or the yaml configuration file. To see all the available test properties add the `--help <TestClass/PublisherClass>` parameter to the command line, for example:

```xml
java -jar toughday2.jar --help CreatePageTreeTest
```

Keep in mind that yaml configuration files will overwrite the Tough Day 2 default parameters and command-line parameters will override both the configuration files and the defaults.

The examples below show how to change the `template` property for the `CreatePageTreeTest` test either by using either command-line parameters or a yaml configuration file.

By using command-line parameters:

```xml
java -jar toughday2.jar --host=localhost --add CreatePageTreeTest template=/conf/toughday-templates/settings/wcm/templates/toughday-template
```

By using a yaml configuration file:

```xml
globals:
  host : localhost
tests:
  - add : CreatePageTreeTest
    properties:
      template : /conf/toughday-templates/settings/wcm/templates/toughday-template
```

### Working with Predefined Test Suites {#working-with-predefined-test-suites}

The examples below show how to add a test to a predefined suite and how to reconfigure and exclude an existing test from a predefined suite.

You can add a new test to a predefined suite using the `add` parameter and specifying the targeted predefined suite.

By using command-line parameters:

```xml
java -jar toughday2.jar --host=localhost --suite=toughday --add CreatePageTreeTest
```

By using a yaml configuration file:

```xml
globals:
  host : localhost
  suite : toughday
tests:
  - add : CreatePageTreeTest
```

Existing tests in a given suite can also be reconfigured using the `config`* *parameter. Also specify the suite name and the actual name of the test (not the Test Class name). You can find the test name in the `name` property of the Test Class. For further details on how to find test properties, read the [Changing Test Properties](/help/sites-developing/tough-day.md#changing-the-test-properties) section.

In the example below the default asset title for the `CreatePageTreeTest` (named `UploadAsset`) is changed to "NewAsset".

By using command-line parameters:

```xml
java -jar toughday2.jar --host=localhost --suite=toughday --config UploadAsset title=NewAsset
```

By using a yaml configuration file:

```xml
globals:
  host : localhost
  suite : toughday
tests:
  - config : UploadAsset
    properties :
      title : NewAsset
```

Also, you can also remove tests from predefined suites or publishers from the default configuration with the use of the `exclude` parameter. Also specify the suite name and the actual name of the test (not the Test C `lass` name). You can find the test name in the `name` property of the test class. In the example below, the `CreatePageTreeTest` (named `UploadAsset`) test is removed from the toughday suite.

By using command-line parameters:

```xml
java -jar toughday2.jar --host=localhost --suite=toughday --exclude UploadAsset
```

By using a yaml configuration file:

```xml
globals:
  host : localhost
  suite : toughday
tests:
  - exclude : UploadAsset
```

### Run Modes {#run-modes}

Tough Day 2 can run in one of the following modes: **normal** and **constant load**.

The **normal** run mode has two parameters:

* `concurrency` - concurrency represents the number of threads that Tough Day 2 will create for test execution. On these threads, tests will be executed until either the duration has run out or there are no more tests to execute.

* `waittime` - the wait time between two consecutive test executions on the same thread. The value must be expressed in milliseconds.

The example below shows how to add the parameters by using either the command line:

```xml
java -jar toughday2.jar --host=localhost --add CreateAssetTreeTest --runmode=normal concurrency=20
```

or by using a yaml configuration file:

```xml
runmode:
  type : normal
  waittime : 300
  concurrency : 200
```

The **constant load** run mode differs from the normal run mode by generating a constant number of started test executions, rather than a constant number of threads. You can set the load by using the run mode parameter with the same name.

### Test Selection {#test-selection}

The test selection process is the same for both run modes and it goes as follows: all tests have a `weight` property, which determines the likelihood of execution in a thread. For example, if you have two tests, one with a weight of 5 and the other with a weight of 10, the latter is two times more likely to be executed than the former.

Furthermore, tests can have a `count` property, which limits the number of executions to a given number. After this number is passed, no further executions of the test will occur. All test instances that are already running will finish the run as configured. The following example shows how to add these parameters either at the command line or by using a yaml configuration file.

```xml
java -jar toughday2.jar --host=localhost --add CreateAssetTreeTest weight=5 --add CreatePageTreeTest weight=10 count=100 --runmode=normal concurrency=20
```

or

```xml
- add : CreateAssetTreeTest
    properties :
      name : UploadAsset
      weight : 5
      base : 3
      foldertitle : IAmAFolder
      assettitle : IAmAnAsset
      count : 100

```

>[!NOTE]
>
>Due to parallel executions, the actual number of test runs will not be exactly the amount configured in the `count` parameter. Expect a deviation proportional to the number of running threads (controlled by the `concurrency parameter`).

### Dry Run {#dry-run}

A dry run parses all the given input (command-line parameters or config files), merging it with the defaults and then outputs the results. It does not execute any of the tests.

```xml
java -jar toughday2.jar --host=localhost --suite=toughday --add CreatePageTreeTest --dryrun=true
```

## Output {#output}

Tough Day 2 outputs both test metrics and logs. For further details, read the following sections.

### Test Metrics {#test-metrics}

Tough Day 2 currently reports nine test metrics that you can evaluate. Metrics with the **&#42;** symbol are reported only after successful runs:

| **Name** |**Description** |
|---|---|
| Timestamp |Timestamp of the last finished test run. |
| Passed |Number of successful runs. |
| Failed |Number of failed runs. |
| Min&#42; |Lowest duration of test execution. |
| Max&#42; |Highest duration of test execution. |
| Median&#42; |Computed median duration of all test executions. |
| Average&#42; |Computed average duration of all test executions. |
| StdDev&#42; |The standard deviation. |
| 90p&#42; |90 percentile. |
| 99p&#42; |99 percentile. |
| 99.9p&#42; |99.9 percentile. |
| Real Throughput&#42; |Number of runs divided by the elapsed execution time. |

These metrics are written with the help of publishers that can be added with the `add` parameter (similarly to adding tests). Currently, there are two options:

* **CSVPublisher** - the output is a CSV file.
* **ConsolePublisher** - the output is displayed in the console.

By default, both publishers are enabled.

Also, there are two modes in which the metrics are reported:

* The **simple** publish mode - reports the results from the beginning of the execution up to the point of publishing.
* The **intervals** publish mode - reports the results in a given time frame. You can set the time frame with the **interval** publish mode parameter.

The following example shows how to configure the `intervals` parameter either at the command line or by using a yaml configuration file.

By using command-line parameters:

```xml
java -jar toughday2.jar --host=localhost --add CreatePageTreeTest --publishmode type=intervals interval=10s
```

By using a yaml configuration file:

```xml
publishmode:
     type : intervals
     interval : 10s
     tests:
        -add : CreatePageTreeTest

```

### Logging {#logging}

Tough Day 2 creates a logs folder in the same directory where you ran Tough Day 2. This folder contains two types of logs:

* **toughday.log**: contains messages related to the application state, debugging information and global messages.
* **toughday_&lt;testname&gt;.log**: messages related to the specified test.

The logs are not overwritten, subsequent runs append messages to the existing logs. The logs have several levels, for more information see the [loglevel parameter.](#global-parameters).

<!--
#### Example Usage {#example-usage}

#### Known Issues {#known-issues}

[Get File](assets/toughday-6_1.jar)
-->
