---
title: Processing Assets Using Media Handlers and Workflows
seo-title: Processing Assets Using Media Handlers and Workflows
description: Learn about various media handlers and how to use them in workflows to perform tasks on assets.
seo-description: Learn about various media handlers and how to use them in workflows to perform tasks on assets.
uuid: 4ef96bfc-d194-4aea-8d6c-ae91d04456aa
contentOwner: asgupta
products: SG_EXPERIENCEMANAGER/6.4/ASSETS
discoiquuid: 8cd78c84-71ba-4095-b882-90d0dc00289d
---

# Processing Assets Using Media Handlers and Workflows {#processing-assets-using-media-handlers-and-workflows}

Adobe Experience Manager (AEM) Assets comes with a set of default workflows and media handlers to process assets. The workflow defines the general tasks to be executed on the assets, then delegates the specific tasks to the media handlers, for example thumbnail generation or metadata extraction.

A workflow can be defined that will automatically execute when an asset of a particular type is uploaded to the server. The processing steps are defined in terms of a series of AEM Assets Media Handlers. AEM provides some [built in handlers,](#default-media-handlers) and additional ones can be either [custom developed](#creating-a-new-media-handler) or defined by delegating the process to a [command line tool](#command-line-based-media-handler).

Media handlers are services inside AEM Assets that perform specific actions on assets. For example, when an MP3 audio file is uploaded into AEM, a workflow triggers an MP3 handler that extracts the metadata and generates a thumbnail. Media handlers are usually used in combination with workflows. Most common MIME types are supported within AEM. Specific tasks can be performed on assets by either extending/creating workflows, extending/creating media handlers or disabling/enabling media handlers.

>[!NOTE]
>
>Please refer to the [Assets supported formats](assets-formats.md) page for a description of all the formats supported by AEM Assets as well as features supported for each format.

## Default Media Handlers {#default-media-handlers}

The following media handlers are available within AEM Assets and handle the most common MIME types:

<!-- TBD: Apply correct formatting once table is moved to MD.
-->

<table> 
 <tbody> 
  <tr> 
   <td>Handler name</td> 
   <td>Service Name (in the System Console)</td> 
   <td>Supported MIME types</td> 
  </tr> 
  <tr> 
   <td>TextHandler</td> 
   <td><p>com.day.cq.dam.core.impl.handler.TextHandler</p> </td> 
   <td>text/plain</td> 
  </tr> 
  <tr> 
   <td>PdfHandler</td> 
   <td><p>com.day.cq.dam.handler.standard.pdf.PdfHandler</p> </td> 
   <td><p>application/pdf<br /> application/illustrator</p> </td> 
  </tr> 
  <tr> 
   <td>JpegHandler</td> 
   <td><p>com.day.cq.dam.core.impl.handler.JpegHandler</p> </td> 
   <td>image/jpeg</td> 
  </tr> 
  <tr> 
   <td>Mp3Handler</td> 
   <td><p>com.day.cq.dam.handler.standard.mp3.Mp3Handler</p> </td> 
   <td><p>audio/mpeg</p> </td> 
  </tr> 
  <tr> 
   <td>ZipHandler</td> 
   <td><p>com.day.cq.dam.handler.standard.zip.ZipHandler</p> </td> 
   <td><p>application/java-archive</p> <p>application/zip</p> </td> 
  </tr> 
  <tr> 
   <td>PictHandler</td> 
   <td><p>com.day.cq.dam.handler.standard.pict.PictHandler</p> </td> 
   <td><p>image/pict</p> </td> 
  </tr> 
  <tr> 
   <td>StandardImageHandler</td> 
   <td><p>com.day.cq.dam.core.impl.handler.StandardImageHandler</p> </td> 
   <td><p>image/gif</p> <p>image/png</p> <p>application/photoshop</p> <p>image/jpeg</p> <p>image/tiff</p> <p>image/x-ms-bmp</p> <p>image/bmp</p> </td> 
  </tr> 
  <tr> 
   <td>MSOfficeHandler</td> 
   <td>com.day.cq.dam.handler.standard.msoffice.MSOfficeHandler</td> 
   <td>application/msword<br /> </td> 
  </tr> 
  <tr> 
   <td>MSPowerPointHandler</td> 
   <td>com.day.cq.dam.handler.standard.msoffice.MSPowerPointHandler</td> 
   <td>application/vnd.ms-powerpoint<br /> </td> 
  </tr> 
  <tr> 
   <td>OpenOfficeHandler</td> 
   <td>com.day.cq.dam.handler.standard.ooxml.OpenOfficeHandler</td> 
   <td>application/vnd.openxmlformats-officedocument.wordprocessingml.document<br /> application/vnd.openxmlformats-officedocument.spreadsheetml.sheet<br /> application/vnd.openxmlformats-officedocument.presentationml.presentation<br /> <br /> </td> 
  </tr> 
  <tr> 
   <td>EPubHandler</td> 
   <td>com.day.cq.dam.handler.standard.epub.EPubHandler</td> 
   <td>application/epub+zip</td> 
  </tr> 
  <tr> 
   <td>GenericAssetHandler</td> 
   <td><p>com.day.cq.dam.core.impl.handler.GenericAssetHandler</p> </td> 
   <td>fallback in case no other handler was found to extract data from an asset</td> 
  </tr> 
 </tbody> 
</table>

All the handlers perform the following tasks:

* extracting all available metadata from the asset.
* creating a thumbnail image out of the asset.

It is possible to view the active media handlers:

1. In your browser, navigate to `http://localhost:4502/system/console/components`.
1. Click the link `com.day.cq.dam.core.impl.store.AssetStoreImpl`.
1. A list with all the active media handlers is displayed. For example:

![chlimage_1-437](assets/chlimage_1-437.png)

## Using Media Handlers in Workflows to perform tasks on Assets {#using-media-handlers-in-workflows-to-perform-tasks-on-assets}

Media handlers are services that are usually used in combination with workflows.

AEM has some default workflows to process assets. To view them, open the Workflow console and click the **[!UICONTROL Models]** tab: the workflow titles that start with AEM Assets are the assets specific ones.

Existing workflows can be extended and new ones can be created to process assets according to specific requirements.

The following example shows how to enhance the **[!UICONTROL AEM Assets Synchronization]** workflow so that sub-assets are generated for all assets except PDF documents.

### Disabling/Enabling a Media Handler {#disabling-enabling-a-media-handler}

The media handlers can be disabled or enabled through the Apache Felix Web Management Console. When the media handler is disabled, its tasks are not performed on the assets.

To enable/disable a media handler:

1. In your browser, navigate to `https://<host>:<port>/system/console/components`.
1. Click **[!UICONTROL Disable]** next to the name of the media handler. For example: `com.day.cq.dam.handler.standard.mp3.Mp3Handler`.
1. Refresh the page: an icon is displayed beside the media handler indicating it is disabled.
1. To enable the media handler, click **[!UICONTROL Enable]** next to the name of the media handler.

### Creating a new Media Handler {#creating-a-new-media-handler}

To support a new media type or to execute specific tasks on an asset, it is necessary to create a new media handler. This section describes how to proceed.

#### Important Classes and Interfaces {#important-classes-and-interfaces}

The best way to start an implementation is to inherit from a provided abstract implementation that takes care of most things and provides reasonable default behavior: the `com.day.cq.dam.core.AbstractAssetHandler` class.

This class already provides an abstract service descriptor. So if you inherit from this class and use the maven-sling-plugin, make sure that you set the inherit flag to `true`.

Implement the following methods:

* `extractMetadata()`: extracts all available metadata.
* `getThumbnailImage()`: creates a thumbnail image out of the passed asset.
* `getMimeTypes()`: returns the asset MIME types.

Here is an example template:

`package my.own.stuff; /** * @scr.component inherit="true" * @scr.service */ public class MyMediaHandler extends com.day.cq.dam.core.AbstractAssetHandler { // implement the relevant parts } `

The interface and classes include:

* `com.day.cq.dam.api.handler.AssetHandler` interface: This interface describes the service which adds support for specific mime types. Adding a new mime type requires to implement this interface. The interface contains methods for importing and exporting the specific documents, for creating thumbnails and extracting metadata.
* `com.day.cq.dam.core.AbstractAssetHandler` class: This class serves as basis for all other asset handler implementations and provides common used functionality.
* `com.day.cq.dam.core.AbstractSubAssetHandler` class: 
  * This class serves as basis for all other asset handler implementations and provides common used functionality plus common used functionality for subasset extraction.
  * The best way to start an implementation is to inherit from a provided abstract implementation that takes care of most things and provides reasonable default behaviour: the com.day.cq.dam.core.AbstractAssetHandler Class.
  * This class already provides an abstract service descriptor. So if you inherit from this class and use the maven-sling-plugin, make sure that you set the inherit flag to true.

The following methods need to be implemented:

* `extractMetadata()`: this method extracts all available metadata.
* `getThumbnailImage()`: this method creates a thumbnail image out of the passed asset.
* `getMimeTypes()`: this method returns the asset mime type(s).

Here is an example template:

package my.own.stuff; /&ast;&ast; &ast; @scr.component inherit="true" &ast; @scr.service &ast;/ public class MyMediaHandler extends com.day.cq.dam.core.AbstractAssetHandler { // implement the relevant parts }

The interface and classes include:

* `com.day.cq.dam.api.handler.AssetHandler` interface: This interface describes the service which adds support for specific mime types. Adding a new mime type requires to implement this interface. The interface contains methods for importing and exporting the specific documents, for creating thumbnails and extracting metadata.
* `com.day.cq.dam.core.AbstractAssetHandler` class: This class serves as basis for all other asset handler implementations and provides common used functionality.
* `com.day.cq.dam.core.AbstractSubAssetHandler` class: This class serves as basis for all other asset handler implementations and provides common used functionality plus common used functionality for subasset extraction.

#### Example: create a specific Text Handler {#example-create-a-specific-text-handler}

In this section, you will create a specific Text Handler that generates thumbnails with a watermark.

Proceed as follows:

Refer to [Development Tools](../sites-developing/dev-tools.md) to install and set up Eclipse with a Maven plugin and for setting up the dependencies that are needed for the Maven project.

After you perform the following procedure, when you upload a txt file into AEM, the file's metadata are extracted and two thumbnails with a watermark are generated.

1. In Eclipse, create `myBundle` Maven project:

    1. In the Menu bar, click **[!UICONTROL File > New > Other]**.
    1. In the dialog, expand the Maven folder, select Maven Project and click **[!UICONTROL Next]**.
    1. Check the Create a simple project box and the Use default Workspace locations box, then click **[!UICONTROL Next]**.
    1. Define the Maven project:

        * Group Id: com.day.cq5.myhandler
        * Artifact Id: myBundle
        * Name: My AEM bundle
        * Description: This is my AEM bundle

    1. Click **[!UICONTROL Finish]**.

1. Set the Java Compiler to version 1.5:

    1. Right-click the `myBundle` project, select Properties.
    1. Select Java Compiler and set following properties to 1.5:

        * Compiler compliance level
        * Generated .class files compatibility
        * Source compatibility

    1. Click **[!UICONTROL OK]**. In the dialog window, click Yes.

1. Replace the code in the pom.xml file with the following code:

   ```xml
   <project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion> 
    <!-- ====================================================================== --> 
    <!-- P A R E N T P R O J E C T D E S C R I P T I O N --> 
    <!-- ====================================================================== -->
    <parent>
     <groupId>com.day.cq.dam</groupId>
     <artifactId>dam</artifactId>
     <version>5.2.14</version>
     <relativePath>../parent</relativePath>
    </parent> 
    <!-- ====================================================================== --> 
    <!-- P R O J E C T D E S C R I P T I O N --> 
    <!-- ====================================================================== -->
    <groupId>com.day.cq5.myhandler</groupId>
    <artifactId>myBundle</artifactId>
    <name>My CQ5 bundle</name>
    <version>0.0.1-SNAPSHOT</version>
    <description>This is my CQ5 bundle</description>
    <packaging>bundle</packaging> 
    <!-- ====================================================================== --> 
    <!-- B U I L D D E F I N I T I O N --> 
    <!-- ====================================================================== -->
    <build>
     <plugins>
      <plugin>
       <groupId>org.apache.felix</groupId>
       <artifactId>maven-scr-plugin</artifactId>
      </plugin>
      <plugin>
       <groupId>org.apache.sling</groupId>
       <artifactId>maven-sling-plugin</artifactId>
       <configuration>
        <slingUrlSuffix>/libs/dam/install/</slingUrlSuffix>
       </configuration>
      </plugin>
      <plugin>
       <groupId>org.apache.felix</groupId>
       <artifactId>maven-bundle-plugin</artifactId>
       <extensions>true</extensions>
       <configuration>
        <instructions>
         <Bundle-Category>cq5</Bundle-Category>
         <Export-Package> com.day.cq5.myhandler </Export-Package>
        </instructions>
       </configuration>
      </plugin>
     </plugins>
    </build> 
    <!-- ====================================================================== --> 
    <!-- D E P E N D E N C I E S --> 
    <!-- ====================================================================== -->
    <dependencies>
     <dependency>
      <groupId>com.day.cq.dam</groupId>
      <artifactId>cq-dam-api</artifactId>
      <version>5.2.10</version>
      <scope>provided</scope>
     </dependency>
     <dependency>
      <groupId>com.day.cq.dam</groupId>
      <artifactId>cq-dam-core</artifactId>
      <version>5.2.10</version>
      <scope>provided</scope>
     </dependency>
     <dependency>
      <groupId>com.day.cq</groupId>
      <artifactId>cq-commons</artifactId>
     </dependency>
     <dependency>
      <groupId>javax.jcr</groupId>
      <artifactId>jcr</artifactId>
     </dependency>
     <dependency>
      <groupId>org.apache.felix</groupId>
      <artifactId>org.osgi.compendium</artifactId>
     </dependency>
     <dependency>
      <groupId>org.slf4j</groupId>
      <artifactId>slf4j-api</artifactId>
     </dependency>
     <dependency>
      <groupId>commons-lang</groupId>
      <artifactId>commons-lang</artifactId>
     </dependency>
     <dependency>
      <groupId>commons-collections</groupId>
      <artifactId>commons-collections</artifactId>
     </dependency>
     <dependency>
      <groupId>commons-io</groupId>
      <artifactId>commons-io</artifactId>
     </dependency>
     <dependency>
      <groupId>com.day.commons</groupId>
      <artifactId>day-commons-gfx</artifactId>
     </dependency>
     <dependency>
      <groupId>com.day.commons</groupId>
      <artifactId>day-commons-text</artifactId>
     </dependency>
     <dependency>
      <groupId>com.day.cq.workflow</groupId>
      <artifactId>cq-workflow-api</artifactId>
     </dependency>
     <dependency>
      <groupId>com.day.cq.wcm</groupId>
      <artifactId>cq-wcm-foundation</artifactId>
      <version>5.2.22</version>
     </dependency>
    </dependencies>
   ```

1. Create the package `com.day.cq5.myhandler` that contains the Java classes under `myBundle/src/main/java`:

    1. Under myBundle, right-click `src/main/java`, select New, then Package.
    1. Name it `com.day.cq5.myhandler` and click Finish.

1. Create the Java class `MyHandler`:

    1. In Eclipse, under `myBundle/src/main/java`, right-click the `com.day.cq5.myhandler` package, select New, then Class.
    1. In the dialog window, name the Java Class MyHandler and click Finish. Eclipse creates and opens the file MyHandler.java.
    1. In `MyHandler.java` replace the existing code with the following and then save the changes:

   ```java
   package com.day.cq5.myhandler; 
   import java.awt.Color; 
   import java.awt.Rectangle; 
   import java.awt.image.BufferedImage; 
   import java.io.IOException; 
   import java.io.InputStream; 
   import java.io.InputStreamReader; 
   import javax.jcr.Node; 
   import javax.jcr.RepositoryException; 
   import javax.jcr.Session; 
   import org.apache.commons.io.IOUtils; 
   import org.slf4j.Logger; 
   import org.slf4j.LoggerFactory; 
   import com.day.cq.dam.api.metadata.ExtractedMetadata; 
   import com.day.cq.dam.core.AbstractAssetHandler; 
   import com.day.image.Font; 
   import com.day.image.Layer; 
   import com.day.cq.wcm.foundation.ImageHelper; 
   
   /** 
    * The <code>MyHandler</code> can extract text files 
    * @scr.component inherit="true" immediate="true" metatype="false" 
    * @scr.service 
    * 
    **/ 
   
   public class MyHandler extends AbstractAssetHandler { 
    /** * Logger instance for this class. */ 
    private static final Logger log = LoggerFactory.getLogger(MyHandler.class); 
    /** * Music icon margin */ 
    private static final int MARGIN = 10; 
    /** * @see com.day.cq.dam.api.handler.AssetHandler#getMimeTypes() */ 
    public String[] getMimeTypes() {
     return new String[] {"text/plain"}; 
    }
   
    public ExtractedMetadata extractMetadata(Node asset) { 
     ExtractedMetadata extractedMetadata = new ExtractedMetadata(); 
     InputStream data = getInputStream(asset); 
     try { 
      // read text data 
      InputStreamReader reader = new InputStreamReader(data); 
      char[] buffer = new char[4096]; 
      String text = ""; 
      while (reader.read(buffer) != -1) { 
       text += new String(buffer); 
      } 
      reader.close(); 
      long wordCount = this.wordCount(text); 
      extractedMetadata.setProperty("text", text); 
      extractedMetadata.setMetaDataProperty("Word Count",wordCount); 
      setMimetype(extractedMetadata, asset); 
     } catch (Throwable t) { 
      log.error("handling error: " + t.toString(), t); 
     } finally { 
      IOUtils.closeQuietly(data); 
     } 
     return extractedMetadata; } 
    // ----------------------< helpers >---------------------------------------- 
    protected BufferedImage getThumbnailImage(Node node) { 
     ExtractedMetadata metadata = extractMetadata(node); 
     final String text = (String) metadata.getProperty("text"); 
     // create text layer 
     final Layer layer = new Layer(500, 600, Color.WHITE); 
     layer.setPaint(Color.black); 
     Font font = new Font("Arial", 12); 
     String displayText = this.getDisplayText(text, 600, 12); 
     if(displayText!=null && displayText.length() > 0) {
      // commons-gfx Font class would throw IllegalArgumentException on empty or null text 
      layer.drawText(10, 10, 500, 600, displayText, font, Font.ALIGN_LEFT, 0, 0); 
     } 
     // create watermark and merge with text layer 
     Layer watermarkLayer; 
     try { 
      final Session session = node.getSession(); 
      watermarkLayer = ImageHelper.createLayer(session, "/content/dam/geometrixx/icons/certificate.png"); 
      watermarkLayer.setX(MARGIN); 
      watermarkLayer.setY(MARGIN); 
      layer.merge(watermarkLayer); 
     } catch (RepositoryException e) { 
      // TODO Auto-generated catch block 
      e.printStackTrace(); 
     } catch (IOException e) { 
      // TODO Auto-generated catch block 
      e.printStackTrace(); } 
     layer.crop(new Rectangle(510, 600)); 
     return layer.getImage(); } 
    // ---------------< private >----------------------------------------------- 
    /** 
     * This method cuts lines if the text file is too long..
     * * @param text
     * * text to check
     * * @param height
     * * text box height (px)
     * * @param fontheight
     * * font height (px) 
     * * @return the text which will fit into the box 
     */ 
    private String getDisplayText(String text, int height, int fontheight) { 
     String trimmedText = text.trim(); 
     int numOfLines = height / fontheight; 
     String lines[] = trimmedText.split("\n"); 
     if (lines.length <= numOfLines) { 
      return trimmedText; 
     } else { 
      String cuttetText = ""; 
      for (int i = 0; i < numOfLines; i++) { 
       cuttetText += lines[i] + "\n"; 
      } 
      return cuttetText; 
     } 
    } 
    /**
     * * This method counts the number of words in a string 
     * * @param text the String whose words would like to be counted
     * * @return the number of words in the string
     * */ 
    private long wordCount(String text) { 
     // We need to keep track of the last character, if we have two white spaces in a row we dont want to double count 
     // The starting of the document is always a whitespace 
     boolean prevWhiteSpace = true; 
     boolean currentWhiteSpace = true; 
     char c; long numwords = 0; 
     int j = text.length(); 
     int i = 0; 
     while (i < j) { 
      c = text.charAt(i++); 
      if (c == 0) { break; } 
      currentWhiteSpace = Character.isWhitespace(c); 
      if (currentWhiteSpace && !prevWhiteSpace) { numwords++; } 
      prevWhiteSpace = currentWhiteSpace; 
     } 
     // If we do not end with a white space then we need to add one extra word 
     if (!currentWhiteSpace) { numwords++; } 
     return numwords; 
    } 
   }
   ```

1. Compile the Java class and create the bundle:

    1. Right-click the myBundle project, select **[!UICONTROL Run As]**, then **[!UICONTROL Maven Install]**.
    1. The bundle `myBundle-0.0.1-SNAPSHOT.jar` (containing the compiled class) is created under `myBundle/target`.

1. In CRX Explorer, create a new node under `/apps/myApp`. Name = `install`, Type = `nt:folder`.
1. Copy the bundle `myBundle-0.0.1-SNAPSHOT.jar` and store it under `/apps/myApp/install` (for example with WebDAV). The new text handler is now active in AEM.
1. In your browser, open the Apache Felix Web Management Console. Select the Components tab and disable the default text handler `com.day.cq.dam.core.impl.handler.TextHandler`.

## Command Line Based Media Handler {#command-line-based-media-handler}

AEM enables you to run any command-line tool within a workflow to convert assets (such as ImageMagick) and to add the new rendition to the asset. You only need to install the command-line tool on the disk hosting the AEM server and to add and configure a process step to the workflow. The invoked process, called `CommandLineProcess`, also enables to filter according to specific MIME types and to create multiple thumbnails based on the new rendition.

The following conversions can be automatically run and stored within AEM Assets:

* EPS and AI transformation using [ImageMagick](https://www.imagemagick.org/script/index.php) and [Ghostscript](https://www.ghostscript.com/)
* FLV video transcoding using [FFmpeg](https://ffmpeg.org/)
* MP3 encoding using [LAME](http://lame.sourceforge.net/)
* Audio processing using [SOX](http://sox.sourceforge.net/)

>[!NOTE]
>
>On non-Windows systems, the FFMpeg tool returns an error while generating renditions for a video asset that has a single quote (') in its filename. If the name of your video file includes a single quote, remove it before uploading to AEM.

The `CommandLineProcess` process performs the following operations in the order they are listed:

* Filters the file according to specific mime-types, if specified.
* Creates a temporary directory on the disk hosting the AEM server.  
* Streams the original file to the temporary directory.  
* Executes the command defined by the arguments of the step. The command is being executed within the temporary directory with the permissions of the user running AEM.  
* Streams the result back into the rendition folder of the AEM server.
* Deletes the temporary directory.  
* Creates thumbnails based on those renditions, if specified. The number and the dimensions of the thumbnails are defined by the arguments of the step.

### An Example Using ImageMagick {#an-example-using-imagemagick}

The following example shows you how to set up the command line process step so that every time an asset with the mime-type gif or tiff is added to /content/dam on the AEM server, a flipped image of the original is created together with three additional thumbnails (140x100, 48x48 and 10x250).

To do this, you will use ImageMagick. ImageMagick is a free software suite to create, edit, and compose bitmap images and is typically used from the command line.

First install ImageMagick on the disk hosting the AEM server:

1. Install ImageMagick: please refer to the [ImageMagick documentation](https://www.imagemagick.org/script/download.php).
1. Set up the tool so you can run convert on the command line.
1. To see if the tool is installed properly, run the following command `convert -h` on the command line.

   It displays a help screen with all the possible options of the convert tool.

   >[!NOTE]
   >
   >In some versions of Windows (for example Windows SE), the convert command may fail to run because it conflicts with the native convert utility that is part of Windows installation. In this case, mention the complete path for the ImageMagick utility used to convert image files to thumbnails. For example, `"C:\Program Files\ImageMagick-6.8.9-Q16\convert.exe" -define jpeg:size=319x319 ${filename} -thumbnail 319x319 cq5dam.thumbnail.319.319.png`.

1. To see if the tool runs properly, add a .jpg image to the working directory and run the command convert `<image-name>.jpg -flip <image-name>-flipped.jpg` on the command line.

   A flipped image is added to the directory.

Then, add the command line process step to the **[!UICONTROL DAM Update Asset]** workflow:

1. Go to the **[!UICONTROL Workflow]** console.
1. In the **[!UICONTROL Models]** tab, edit the **[!UICONTROL DAM Update Asset]** model.
1. Change the settings of the **[!UICONTROL Web enabled rendition]** step as follows:  

   **Arguments**:

   `mime:image/gif,mime:image/tiff,tn:140:100,tn:48:48,tn:10:250,cmd:convert ${directory}/${filename} -flip ${directory}/${basename}.flipped.jpg`

1. Save the workflow.

To test the modified workflow, add an asset to `/content/dam`.

1. In the file system, get a .tiff image of your choice. Rename it to `myImage.tiff` and copy it to `/content/dam`, for example by using WebDAV.
1. Go to the **[!UICONTROL CQ5 DAM]** console, for example `http://localhost:4502/libs/wcm/core/content/damadmin.html`.
1. Open the asset **[!UICONTROL myImage.tiff]** and verify that the flipped image and the three thumbnails have been created.

#### Configuring the CommandLineProcess Process Step {#configuring-the-commandlineprocess-process-step}

This section describes how to set the **Process Arguments** of the **CommandLineProcess**.

The values of the **Process Arguments** must be separated by a comma and must not start with a whitespace.

<table> 
 <tbody> 
  <tr> 
   <td> Argument-Format</td> 
   <td>Description</td> 
  </tr> 
  <tr> 
   <td> mime:&lt;mime-type&gt;</td> 
   <td><p>Optional argument. The process is applied if the asset has the same mime-type as the one of the argument.</p> <p>Several mime-types can be defined.</p> </td> 
  </tr> 
  <tr> 
   <td> tn:&lt;width&gt;:&lt;height&gt;</td> 
   <td><p>Optional argument. The process creates a thumbnail with the dimensions defined in the argument.</p> <p>Several thumbnails can be defined.<br /> </p> </td> 
  </tr> 
  <tr> 
   <td> cmd: &lt;command&gt;</td> 
   <td><p>Defines the command that will be executed. The syntax depends on the command line tool.</p> <p>Only one command can be defined.</p> <p>The following variables can be used to create the command:<br/></p> <p><code>${filename}</code>: name of the input file, e.g. original.jpg<br/><code>${file}</code>: full path name of the input file, e.g. /tmp/cqdam0816.tmp/original.jpg<br/><code>${directory}</code>: directory of the input file, e.g. /tmp/cqdam0816.tmp.<br/> <code>${basename}</code>: name of the input file without its extension, e.g. original<br/> <code>${extension}</code>: extension of the input file, e.g. jpg<br/></p></td> 
  </tr> 
 </tbody> 
</table>

For example, if ImageMagick is installed on the disk hosting the AEM server and if you create a process step using **CommandLineProcess** as Implementation and the following values as **Process Arguments**:

`mime:image/gif,mime:image/tiff,tn:140:100,tn:48:48,tn:10:250,cmd:convert ${directory}/${filename} -flip ${directory}/${basename}.flipped.jpg`

then, when the workflow runs, the step only applies to assets that have image/gif or mime:image/tiff as mime-types, it creates a flipped image of the original, converts it into .jpg and creates three thumbnails that have the dimensions: 140x100, 48x48 and 10x250.

Use the following **Process Arguments** to create the three standard thumbnails using ImageMagick:

`mime:image/tiff,mime:image/png,mime:image/bmp,mime:image/gif,mime:image/jpeg,cmd:convert ${filename} -define jpeg:size=319x319 -thumbnail "319x319>" -background transparent -gravity center -extent 319x319 -write png:cq5dam.thumbnail.319.319.png -thumbnail "140x100>" -background transparent -gravity center -extent 140x100 -write cq5dam.thumbnail.140.100.png -thumbnail "48x48>" -background transparent -gravity center -extent 48x48 cq5dam.thumbnail.48.48.png`

Use the following **Process Arguments** to create the web-enabled rendition using ImageMagick:

`mime:image/tiff,mime:image/png,mime:image/bmp,mime:image/gif,mime:image/jpeg,cmd:convert ${filename} -define jpeg:size=1280x1280 -thumbnail "1280x1280>" cq5dam.web.1280.1280.jpeg`

>[!NOTE]
>
>The **CommandLineProcess** step only applies to Assets (nodes of type `dam:Asset`) or descendants of an Asset.
