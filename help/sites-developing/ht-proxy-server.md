---
title: How to use the Proxy Server Tool
description: The proxy server acts as an intermediate server that relays requests between a client and a server
contentOwner: Guillaume Carlino
products: SG_EXPERIENCEMANAGER/6.5/SITES
topic-tags: development-tools
content-type: reference
exl-id: 7222a0c3-cdb9-4c73-9d53-26f00792e439
solution: Experience Manager, Experience Manager Sites
feature: Developing,Developer Tools
role: Developer
---
# How to use the Proxy Server Tool{#how-to-use-the-proxy-server-tool}

The proxy server acts as an intermediate server that relays requests between a client and a server. The proxy server tracks all the client-server interactions and outputs a log of the entire TCP communication. This lets you monitor exactly what is going on, without having to access the main server.

You can find the proxy server in your AEM installation here:

`crx-quickstart/opt/helpers/proxy-2.1.jar`

You can use the proxy server to monitor all client-server interaction, regardless of the underlying communication protocol. For example, you can monitor the following protocols:

* HTTP for Web pages
* HTTPS for secure Web pages
* SMTP for email messages
* LDAP for user management

For example, you can position the proxy server between any two applications that communicate via a TCP/IP network; for example, a web browser and AEM. This lets you monitor exactly what happens when you request a CQ page.

## Starting the Proxy Server Tool {#starting-the-proxy-server-tool}

Start the server on the command line:

`java -jar proxy-2.1.jar <host> <remoteport> <localport> [options]`

**Parameters**

`<host>`

This is the host address of the CRX instance that you want to connect to. If the instance is on your local computer, then this is `localhost`.

`<remoteport>`

This is the host port of the target CRX instance. For example, the default of a newly installed AEM installation is **`4502`** and the default for a newly installed AEM author instance is `4502`.

`<localport>`

This is the port on your local machine that you wish to connect to access the CRX instance through the proxy.

**Options**

`-q` (quiet mode)

Does not write the output to the console window. Use this if you do not want to slow down the connection, or if you log the output to a file (see -logfile option).

`-b`(binary mode)

If you are looking for specific byte combinations in the traffic, enable binary mode. The output will then contain the hexadecimal and character output.

`-t` (time stamp log entries)

Adds a time stamp to each log output. The time stamp is in seconds, so it may not be suitable for checking single requests. Use it to locate events that occurred at a specific time if you use the proxy server over a longer time period.

`-logfile <filename>`(write to log file)

Writes the client-server conversation to a log file. This parameter also works in quiet mode.

**`-i <numIndentions>`**(add indention)

Each active connection is indented for better readability. Default is 16 levels. This feature was introduced with `proxy.jar version 1.16`.

### Log Format {#log-format}

The log entries produced by proxy-2.1.jar all have the following format:

`[timestamp (optional)] [Client|Server]-[ConnectionNumber]-[BytePosition] ->[Character Stream]`

For example, a request for a Web page may look as follows:

`C-0-#000000 -> [GET /author/prox.html?CFC_cK=1102938422341 HTTP/1.1 ]`

* C signifies that this entry comes from the client (it is a request for a Web page)
* 0 is the connection number (the connection counter starts at 0)
* #00000 the offset in the byte stream. This is the first entry, so the offset is 0.
* `[GET <?>]` is the content of the request, in the example one of the HTTP headers (url).

When a connection closes, the following information is logged:

```
C-6-Finished: 758 bytes (1.0 kb/s)
S-6-Finished: 665 bytes (1.0 kb/s)
```

This shows the number of bytes that passed between client ( `C`) and the server ( `S`) on the sixth connection and at the average speed.

**An Example of Log Output**

As an example, consider a page that produces the following code when requested:

### Example {#example}

As an example, consider a simple html document in the repository at

`/content/test.html`

Alongside an image file at

`/content/test.jpg`

The content of `test.html` is:

```xml
<html>
<head>
    <title>Test</title>
</head>
<body>
    Test<br>
    <img src="test.jpg">
</body>
</html>
```

Assuming the AEM instance is running on `localhost:4502`, the proxy is started like this:

`java -jar proxy.jar localhost 4502 4444 -logfile test.log`

The CQ/CRX instance can now be accessed though the proxy at `localhost:4444` and all communication by way of this port is logged to `test.log`.

If you now watch the output of the proxy, you see the interaction between the browser and the AEM instance.

On startup, the proxy outputs the following:

```xml
starting proxy for localhost:4502 on port 4444
using logfile: <some-dir>/crx-quickstart/opt/helpers/test.log
```

Now open a browser and access the test page:

`http://localhost:4444/content/test.html`

And you see that the browser makes a `GET` request for the page:

```shell
C-0-#000000 -> [GET /content/test.html HTTP/1.1 ]
C-0-#000033 -> [Host: localhost:4444 ]
C-0-#000055 -> [Connection: keep-alive ]
C-0-#000079 -> [User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_4) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11 ]
C-0-#000212 -> [Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8 ]
C-0-#000285 -> [Accept-Encoding: gzip,deflate,sdch ]
C-0-#000321 -> [Accept-Language: en-US,en;q=0.8 ]
C-0-#000354 -> [Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.3 ]
C-0-#000402 -> [Cookie: login-token=179ba6bd-e0a7-4909-a965-e11c7f2bc2fc%3a618bd8a8-fbaf-43c5-827d-c84c62248c5e_22ee860cc9036fee%3acrx.default%3b21148fb0-eb6c]
C-0-#000543 -> [-43c9-a2b9-c8d40618d8ae%3ad87a3d1a-5e9a-4d5a-bab1-0ee60ad6d8df_d0e4ddce0fcd84b6%3acrx.default%3b5cb95227-ea51-47bf-850b-68ad1dfd7297%3af3bbb6]
C-0-#000684 -> [59-7913-4285-8857-832c087bafd5_c484727d3b3665ad%3acrx.default; ys-cq-siteadmin-tree=o%3Awidth%3Dn%253A240%5EselectedPath%3Ds%253A/content ]
C-0-#000824 -> [ ]
```

The AEM instance responds with the contents of the file `test.html`:

```shell
S-0-#000000 -> [HTTP/1.1 200 OK ]
S-0-#000017 -> [Connection: Keep-Alive ]
S-0-#000041 -> [Server: Day-Servlet-Engine/4.1.24  ]
S-0-#000077 -> [Content-Type: text/html;charset=utf-8 ]
S-0-#000116 -> [Content-Length: 104 ]
S-0-#000137 -> [Date: Mon, 16 Jul 2012 11:23:38 GMT ]
S-0-#000174 -> [Last-Modified: Mon, 16 Jul 2012 11:19:27 GMT ]
S-0-#000220 -> [ ]
S-0-#000222 -> [<html>]
S-0-#000229 -> [<head>]
S-0-#000236 -> [    <title>Test</title>]
S-0-#000260 -> [</head> ]
S-0-#000269 -> [<body>]
S-0-#000276 -> [ Test<br>]
S-0-#000286 -> [    <img src="test.jpg">]
S-0-#000311 -> [</body>]
S-0-#000319 -> [</html>]
```

### Uses of the Proxy Server {#uses-of-the-proxy-server}

The following scenarios illustrate a few of the purposes for which the Proxy Server can be used:

**Check for Cookies and their Values**

The following log entry example shows all cookies and their values sent by the client on the sixth connection opened since the proxy started:

`C-6-#000635 -> [Cookie: cq3session=7e39bc51-ac72-3f48-88a9-ed80dbac0693; Show=ShowMode; JSESSIONID=68d78874-cabf-9444-84a4-538d43f5064d ]`

**Checking for Headers and their Values**

The following log entry example shows that the server is able to make a keep-alive connection and the content length header was properly set:

```
S-7-#000017 -> [Connection: Keep-Alive ]
 ...
 S-7-#000107 -> [Content-Length: 124 ]
```

**Checking if Keep-Alive works**

Keep-alive is a feature of HTTP that allows a client to reuse the TCP connection to the server to make multiple requests (for the page code, pictures, style sheets, and so on). Without keep-alive, the client has to establish a new connection for each request.

To check if keep-alive works:

* Start the proxy server.
* Request a page.
* If keep-alive is working, the connection counter should never go above 5 to 10 connections.
* If keep-alive is not working, the connection counter increases rapidly.

**Finding Lost Requests**

If you lose requests in a complex server setting, for example, with a firewall and a Dispatcher, you can use the proxy server to find out where the request was lost. If there is a firewall:

* Start a proxy before a firewall
* Start another proxy after a firewall
* Use these to see how far the requests are getting.

**Requests Hanging**

If you experience hanging requests from time to time:

* Start the proxy.
* Wait or write the access log into a file with each entry having a timestamp.
* When the request start hanging, you can see how many connections were open and which request is causing trouble.
