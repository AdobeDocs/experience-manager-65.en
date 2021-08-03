---
title: Markdown
description: Understand how the Content Fragment editor uses markdown syntax to allow you to easily create headless content.
feature: Content Fragments
role: User
exl-id: 7a6d4a63-faf8-4e1c-95da-90db2027a2dd
---
# Markdown {#markdown}

When you are [authoring](/help/assets/content-fragments/content-fragments-variations.md#authoring-your-content), the content fragment editor uses *markdown* syntax to allow you to easily write headless content:

![markdown editor](/help/assets/content-fragments/assets/cfm-markdown-01.png)

You can define:

* [Heading Notation](/help/assets/content-fragments/content-fragments-markdown.md#heading-notation)
* [Paragraphs and Line Breaks](/help/assets/content-fragments/content-fragments-markdown.md#paragraphs-and-line-breaks)
* [Links](/help/assets/content-fragments/content-fragments-markdown.md#links)
* [Images](/help/assets/content-fragments/content-fragments-markdown.md#images)
* [Block Quotes](/help/assets/content-fragments/content-fragments-markdown.md#block-quotes)
* [Lists](/help/assets/content-fragments/content-fragments-markdown.md#lists)
* [Emphasis](/help/assets/content-fragments/content-fragments-markdown.md#emphasis)
* [Code Blocks](/help/assets/content-fragments/content-fragments-markdown.md#code-blocks)
* [Backslash escapes](/help/assets/content-fragments/content-fragments-markdown.md#backslash-escapes)

## Heading Notation {#heading-notation}

To create a header by placing a hash tag (#) in front of the heading. One hash tag (#) is used for an H1, two hash tags (##) for a H2 etc. You can use up to 6 hash tags. For example:

&nbsp;&nbsp;&nbsp;&nbsp;`## This is an H2`

&nbsp;&nbsp;&nbsp;&nbsp;`### This is an H3`

&nbsp;&nbsp;&nbsp;&nbsp;`###### This is a H6`

Optionally, you can create a H1 by underlining the text in equal signs and create a H2 by underlining the text in minus signs. For example:

&nbsp;&nbsp;&nbsp;&nbsp;`This is an H1`  

&nbsp;&nbsp;&nbsp;&nbsp;`=============`

&nbsp;&nbsp;&nbsp;&nbsp;`This is an H2`  

&nbsp;&nbsp;&nbsp;&nbsp;`-------------`

## Paragraphs and Line Breaks {#paragraphs-and-line-breaks}

A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines. A blank line is a line containing nothing but spaces or tabs. Normal paragraphs should not be indented with spaces or tabs.

A line break is created by ending a line with two or more spaces then a return.

## Links {#links}

You can create inline and reference links.

In both styles, the link text is delimited by square brackets `[]`.

These are examples of inline links:

&nbsp;&nbsp;&nbsp;&nbsp;`This is [an example](https://example.com/ "Title") inline link.`

&nbsp;&nbsp;&nbsp;&nbsp;`This is [an example of an email link](emailto:myaddress@mydomain.info)`

&nbsp;&nbsp;&nbsp;&nbsp;`[This link](https://example.net/) has no title attribute.`

A reference link has the following syntax:

&nbsp;&nbsp;&nbsp;&nbsp;`Hey you should [checkout][0] this [cool thing][wiki] that I [made][].`
  
&nbsp;&nbsp;&nbsp;&nbsp;`[0]: https://www.google.ca`  

&nbsp;&nbsp;&nbsp;&nbsp;`[wiki]: https://www.wikipedia.org`  

&nbsp;&nbsp;&nbsp;&nbsp;`[made]: https://www.stackoverflow.com`
  
## Images {#images}

The syntax for images is similar to the links. You can create inline and referenced images.

For example, an inline image has the following syntax:

&nbsp;&nbsp;&nbsp;&nbsp;`![Alt text](/path/to/img.jpg)`  
  
&nbsp;&nbsp;&nbsp;&nbsp;`![Alt text](/path/to/img.jpg "Optional title")`

The syntax includes:

* An exclamation mark: !;
* followed by a set of square brackets, containing the alt attribute text for the image;
* followed by a set of parentheses, containing the URL or path to the image, and an optional title attribute enclosed in double or single quotes.

A Reference-style image has the following syntax:

&nbsp;&nbsp;&nbsp;&nbsp;`![Alt text][id]`

Where “id” is the name of a defined image reference. Image references are defined using syntax identical to link references:

&nbsp;&nbsp;&nbsp;&nbsp;`[id]: url/to/image "Optional title attribute"`

## Block Quotes {#block-quotes}

You can quote text by adding the &gt; symbol before the text. For example:

&nbsp;&nbsp;&nbsp;&nbsp;`>This is block quotes`  

&nbsp;&nbsp;&nbsp;&nbsp;`>asdhfjlkasdhlf`  

&nbsp;&nbsp;&nbsp;&nbsp;`>asdfahsdlfasdfj`

You can have nested block quotes. For example:

&nbsp;&nbsp;&nbsp;&nbsp;`> This is the first level of quoting.` 

&nbsp;&nbsp;&nbsp;&nbsp;`>`  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`>> This is nested blockquote.`  

&nbsp;&nbsp;&nbsp;&nbsp;`>`  

&nbsp;&nbsp;&nbsp;&nbsp;`> Back to the first level.`

## Lists {#lists}

You can create both ordered and unordered lists.

To create an unordered list, use the &ast; symbol before the items in the list. For example:

&nbsp;&nbsp;&nbsp;&nbsp;`* item in list`

&nbsp;&nbsp;&nbsp;&nbsp;`* item in list`  

&nbsp;&nbsp;&nbsp;&nbsp;`* item in list`

To create an ordered list, add the numbers, followed by a period, before each item in the list. For example:

&nbsp;&nbsp;&nbsp;&nbsp;`1. First item in list.`  

&nbsp;&nbsp;&nbsp;&nbsp;`2. Second item in list.`  

&nbsp;&nbsp;&nbsp;&nbsp;`3. Third item in list.`

## Emphasis {#emphasis}

You can add italic or bold styling to your text.

To can add italics as follows:

&nbsp;&nbsp;&nbsp;&nbsp;`*single asterisks*`

&nbsp;&nbsp;&nbsp;&nbsp;`_single underscores_`

&nbsp;&nbsp;&nbsp;&nbsp;`Keyboard shortcut: Ctrl-I (Cmd-I)`

You can bold text as follows:

&nbsp;&nbsp;&nbsp;&nbsp;`**double asterisks**`

&nbsp;&nbsp;&nbsp;&nbsp;`__double underscores__`

&nbsp;&nbsp;&nbsp;&nbsp;`Keyboard shortcut: Ctrl-B (Cmd-B)`

To indicate a span of code, wrap it with backtick quotes (&grave;). Unlike a pre-formatted code block, a code span indicates code within a normal paragraph.

For example:

&nbsp;&nbsp;&nbsp;&nbsp;``Use the `printf()` function.``

## Code Blocks {#code-blocks}

Code blocks are typically used to illustrate source code. You can create code blocks by indenting the code using a tab or a minimum of 4 spaces. For example:

&nbsp;&nbsp;&nbsp;&nbsp;`This is a normal paragraph.`

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`This is a code block.`

## Backslash escapes {#backslash-escapes}

You can use backslash escapes to generate literal characters which have special meaning in formatting syntax. For example, if you wanted to surround a word with literal asterisks (instead of an HTML &lt;em&gt; tag), you can use backslashes before the asterisks, like this:

&nbsp;&nbsp;&nbsp;&nbsp;`\\*literal asterisks\\*`

Backslash escapes are available for the following characters:

&nbsp;&nbsp;&nbsp;&nbsp;` \ backslash`

&nbsp;&nbsp;&nbsp;&nbsp;`` ` backtick``

&nbsp;&nbsp;&nbsp;&nbsp;` * asterisk`

&nbsp;&nbsp;&nbsp;&nbsp;` _ underscore`

&nbsp;&nbsp;&nbsp;&nbsp;` {} curly braces`

&nbsp;&nbsp;&nbsp;&nbsp;` [] square brackets`

&nbsp;&nbsp;&nbsp;&nbsp;` () parentheses`

&nbsp;&nbsp;&nbsp;&nbsp;` # hash mark`

&nbsp;&nbsp;&nbsp;&nbsp;` + plus sign`

&nbsp;&nbsp;&nbsp;&nbsp;` - minus sign (hyphen)`

&nbsp;&nbsp;&nbsp;&nbsp;` . dot`
