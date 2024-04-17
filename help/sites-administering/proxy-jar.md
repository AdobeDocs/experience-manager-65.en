---
title: Proxy Server Tool (proxy.jar)
description: Learn about the Proxy Server Tool (proxy.jar) in Adobe Experience Manager.
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: operations
content-type: reference
docset: aem65
exl-id: 3df50303-5cdd-4df0-abec-80831d2ccef7
solution: Experience Manager, Experience Manager Sites
feature: Developing
role: Developer
---
# Proxy Server Tool (proxy.jar){#proxy-server-tool-proxy-jar}

The proxy server acts as an intermediate server that relays requests between a client and a server. The proxy server tracks all the client-server interactions and outputs a log of the entire TCP communication. This lets you monitor exactly what is going on, without having to access the main server.

You can find the proxy server in the appropriate installation folder:

* &lt;cq_install_path&gt;/opt/helpers/proxy.jar
* &lt;crx_install_path&gt;/opt/helpers/proxy.jar

You can use the proxy server to monitor all client-server interaction, regardless of the underlying communication protocol. For example, you can monitor the following protocols:

* HTTP for Web pages
* HTTPS for secure Web pages
* SMTP for email messages
* LDAP for user management

For example, you can position the proxy server between any two applications that communicate via a TCP/IP network; for example, a web browser and AEM. This lets you monitor exactly what happens when you request a AEM page.

## Starting the Proxy Server Tool {#starting-the-proxy-server-tool}

The tool can be found in the /opt/helpers folder of your AEM installation. To start it type:

```xml
java -jar proxy.jar <host> <remoteport> <localport> [options]
```

### Options {#options}

* **q (quiet Mode)** Does not write the requests to the console window. Use this if you do not want to slow down the connection, or if you log the output to a file (see -logfile option).
* **b (binary Mode)** If you are looking for specific byte combinations in the traffic, enable binary mode. The output contains the hexadecimal and character output.
* **t (time stamp log entries)** Adds a time stamp to each log output. The time stamp is in seconds, so it may not be suitable for checking single requests. Use it to locate events that occurred at a specific time if you use the proxy server over a longer time period.
* **logfile &lt;filename&gt; (write to log file)** Writes the client-server conversation to a log file. This parameter also works in quiet mode.
* **i &lt;numIndentions&gt; (add indention)** Each active connection is indented for better readability. The default is 16 levels. (New in proxy.jar version 1.16).

## Uses of the Proxy Server Tool {#uses-of-the-proxy-server-tool}

The following scenarios illustrate a few of the purposes for which the Proxy Server Tool can be used:

**Check for Cookies and their Values**

The following log entry example shows all cookies and their values sent by the client on the sixth connection opened since proxy start:

```xml
C-6-#000635 -> [Cookie: cq3session=7e39bc51-ac72-3f48-88a9-ed80dbac0693; Show=ShowMode; JSESSIONID=68d78874-cabf-9444-84a4-538d43f5064d ]
```

**Checking for Headers and their Values** The following log entry example shows that the server is able to make a keep-alive connection and the content length header was properly set:

```xml
S-7-#000017 -> [Connection: Keep-Alive ]
...
S-7-#000107 -> [Content-Length: 124 ]
```

**Checking if Keep-Alive works**

**Keep-Alive** means that a client reuses the connection to the server to transport multiple files (the page code, pictures, style sheets, and so on). Without keep-alive, the client has to establish a new connection for each request.

To check if keep-alive works:

1. Start the proxy server.
1. Request a page.

* If keep-alive is working, the connection counter should never go above 5 to 10 connections.
* If keep-alive is not working, the connection counter increases rapidly.

**Finding Lost Requests**

If you lose requests in a complex server setting, for example, with a firewall and a Dispatcher, you can use the proxy server to find out where the request was lost. If there is a firewall:

1. Start a proxy before a firewall
1. Start another proxy after a firewall
1. Use these to see how far the requests are getting.

**Requests Hanging**

If you experience hanging requests from time to time:

1. Start a proxy.jar.
1. Wait or write the access log into a file - with each entry having a timestamp.
1. When the request starts hanging, you can see how many connections were open and which request is causing trouble.

## The format of Log Messages {#the-format-of-log-messages}

The log entries produced by proxy.jar all have the following format:

```xml
[timestamp (optional)] [<b>C</b>lient|<b>S</b>erver]-[ConnectionNumber]-[BytePosition] ->[Character Stream]
```

For example, a request for a Web page may look as follows:

```xml
C-0-#000000 -> [GET /author/prox.html?CFC_cK=1102938422341 HTTP/1.1 ]
```

* C signifies that this entry comes from the client (it is a request for a Web page)
* 0 is the connection number (the connection counter starts at 0)
* #00000 the offset in the byte stream. This is the first entry, so the offset is 0.
* [GET &lt;?&gt;] is the content of the request, in the example one of the HTTP headers (url).

When a connection closes, the following information is logged:

```xml
C-6-Finished: 758 bytes (1.0 kb/s)
S-6-Finished: 665 bytes (1.0 kb/s)
```

This shows the number of bytes that passed between client and server on the sixth connection and at the average speed.

## An Example of Log Output {#an-example-of-log-output}

Review a simple template which produces the following code when requested:

```xml
<html>
  <head>
    <title>Welcome</title>
  </head>
  <body>
    Welcome to Playground<br>
    <img src="/logo.gif">
  </body>
</html>
```

If AEM is running on localhost:4303, start the proxy server as follows:

```xml
java -jar proxy.jar localhost 4303 4444 -logfile test.log
```

You can access the server (`localhost:4303`) without the proxy server, but if you access it via `localhost:4444`, the proxy server logs the communication. Open a browser and access a page created with the above template. After that, look at the log file.

>[!NOTE]
>
>Until proxy.jar version 1.14, the log entries of one connection are not synchronized, meaning the log entries of one client/server connection are not necessary in the correct sequential order. The newer versions (&gt;=1.14) of the proxy server do not have this issue.

When starting, the following information is written to the log:

```xml
starting proxy for localhost:4303 on port 4444
using logfile: C:\CQUnify355default\opt\helpers\test.log
```

The following header fields are listed at the start of the first connection (0), which is requesting the main HTML page:

```xml
C-0-#000000 -> [GET /author/prox.html?CFC_cK=1102936796533 HTTP/1.1 ]
C-0-#000053 -> [Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-powerpoint, application/vnd.ms-excel, application/msword, appl]
C-0-#000194 -> [ication/x-shockwave-flash, */* ]
C-0-#000227 -> [Accept-Language: de-ch ]
C-0-#000251 -> [Accept-Encoding: gzip, deflate ]
C-0-#000283 -> [User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) ]
C-0-#000347 -> [Host: localhost:4444 ]
```

The Client requests a keep-alive connection, so the server can send multiple files over the same connection:

```xml
C-0-#000369 -> [Connection: Keep-Alive ]
```

The proxy server is a good tool to verify whether cookies are properly set or not. Here, you see the following:

* cq3session cookie generated by AEM
* the show mode switch cookie generated by the CFC
* a cookie named JSESSIONID; this is automatically created by JSP if not explicitly switched off using &lt;%@ page session="false" %&gt;:

```xml
C-0-#000393 -> [Cookie: Show=ShowMode; cq3session=3bce15cf-1575-1b4e-8ea6-0d1a0c64738e; JSESSIONID=4161a56b-f193-d748-88a5-e09c5ff7ef2a ]
C-0-#000514 -> [ ]
S-0-#000000 -> [HTTP/1.0 200 OK ]
```

The server will close connection 0 after the request. Keep-alive is not possible, because the request has a question mark. This means that the server cannot return a cached version, and therefore cannot determine the content length at this point, which is required for a keep-alive connection.

```xml
S-0-#000017 -> [Connection: Close ]
S-0-#000036 -> [Server: Communique Servlet Engine/3.5.5 ]
S-0-#000077 -> [Content-Type: text/html;charset=iso-8859-1 ]
S-0-#000121 -> [Date: Tue, 14 Dec 2004 09:46:44 GMT ]
S-0-#000158 -> [Set-Cookie: JSESSIONID=4161a56b-f193-d8-88a5-e09c5ff7ef2a;Path=/author ]
S-0-#000232 -> [ ]
```

Here, the server starts sending the HTML code on connection 0:

```xml
S-0-#000234 -> [<html> ]
S-0-#000242 -> [.<head> ]
S-0-#000251 -> [..<title>Welcome</title> ]
S-0-#000277 -> [.</head> ]
S-0-#000287 -> [.<body> ]
S-0-#000296 -> [..Welcome to Playground<br> ]
S-0-#000325 -> [..<img src="/author/logo.gif"> ]
S-0-#000357 -> [.</body> ]
S-0-#000367 -> [</html>]
```

Connection 0 closes immediately after the HTML file has been served:

```xml
C-0-Finished: 516 bytes (0.0 kb/s)
S-0-Finished: 374 bytes (0.0 kb/s)
```

Now, the output starts for connection 1, which downloads the image contained in the HTML code:

```xml
C-1-#000000 -> [GET /author/logo.gif HTTP/1.1 ]
C-1-#000031 -> [Accept: */* ]
C-1-#000044 -> [Referer: http://localhost:4444/author/prox.html?CFC_cK=1102936796533 ]
C-1-#000114 -> [Accept-Language: de-ch ]
C-1-#000138 -> [Accept-Encoding: gzip, deflate ]
C-1-#000170 -> [User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0) ]
C-1-#000234 -> [Host: localhost:4444 ]
```

Again, the client requests a keep-alive connection:

```xml
C-1-#000256 -> [Connection: Keep-Alive ]
C-1-#000280 -> [Cookie: Show=ShowMode; cq3session=3bce15cf-1575-1b4e-8ea6-0d1a0c64738e; JSESSIONID=4161a56b-f193-d748-88a5-e09c5ff7ef2a ]
C-1-#000401 -> [ ]
S-1-#000000 -> [HTTP/1.0 200 OK ]
```

For connection 1, the server can provide keep-alive, because the image is static and therefore the content length is known.

```xml
S-1-#000017 -> [Connection: Keep-Alive ]
S-1-#000041 -> [Server: Communique Servlet Engine/3.5.5 ]
S-1-#000082 -> [Content-Type: image/gif ]
```

The server returns the content length of the image on connection 1:

```xml
S-1-#000107 -> [Content-Length: 124 ]
S-1-#000128 -> [Date: Tue, 14 Dec 2004 09:46:44 GMT ]
S-1-#000165 -> [ ]
```

Now that the content length is established, the server sends the image data on connection 1:

```xml
S-1-#000167 -> [GIF87a..........................,.......
...I....0.A..8......YDA.W...1..`i.`..6...Z...$@.F..)`..f..A.....iu.........$..;]
```

After the keep-alive timeout has been reached, connection 1 closes as well:

```xml
S-1-Finished: 291 bytes (0.0 kb/s)
C-1-Finished: 403 bytes (0.0 kb/s)
```

The above example is comparatively simple, because the two connections occur sequentially:

* first the server returns the HTML code
* then the browser requests the image and opens a new connection

In practice, a page may generate many parallel requests for images, style sheets, JavaScript files, and so on. This means that the logs have overlapping entries of parallel open connections. In that case, Adobe recommends using option -i to improve readability.
