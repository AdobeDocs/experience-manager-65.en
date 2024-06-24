---
title: Picture clause support for HTML5 forms
description: HTML5 forms supports XFA Picture clause for display value and formatted value for date, text, and numeric symbols.
contentOwner: robhagat
content-type: reference
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: hTML5_forms
discoiquuid: 5e344be7-46cd-4e1f-ae3a-1f89c645cffe
feature: "HTML5 Forms,Mobile Forms"
exl-id: 7f9c77c6-447a-407f-ae58-6735176dc99c
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Picture clause support for HTML5 forms {#picture-clause-support-for-html-forms}

HTML5 forms supports XFA Picture clause for display value and formatted value for date, text, and numeric symbols. Following Picture clause Expressions are supported:

* category(locale){picture-clause} | category(locale){picture-clause} | category(locale){picture-clause}
* category.subcategory{}

>[!NOTE]
>
>At present, Mobiles Forms does not support Edit Picture clause. Also, DateTime and Time Picture clause symbols are not supported.

## Supported Date Field Symbols {#supported-date-field-symbols}

Supported expression for Date Picture clause:

* date.long{}
* date.short{}
* date.medium{}
* date.full{}
* date.short{}
* date{date Picture Clause symbols}

>[!NOTE]
>
>The default pattern of picture clause is {MMM D, YYYY} pattern. If no pattern is applied, the default pattern is used.

<table>
 <tbody>
  <tr>
   <th><strong>Symbol</strong></th>
   <th>Interpretation</th>
  </tr>
  <tr>
   <td>D</td>
   <td>1- or 2-digit (1-31) day of the month</td>
  </tr>
  <tr>
   <td>DD</td>
   <td>Zero-padded two digit (01-31) day of the month.<br /> </td>
  </tr>
  <tr>
   <td>M</td>
   <td>1- or 2-digit (1-12) month of the year.<br /> </td>
  </tr>
  <tr>
   <td>MM</td>
   <td>Zero-padded two digit (01-12) month of the year.<br /> </td>
  </tr>
  <tr>
   <td>MMM</td>
   <td>Abbreviated month name of the current locale<br /> </td>
  </tr>
  <tr>
   <td>MMMM</td>
   <td>Full month name of the current locale<br /> </td>
  </tr>
  <tr>
   <td>EEE</td>
   <td>Abbreviated weekday name of the current locale<br /> </td>
  </tr>
  <tr>
   <td>EEEE</td>
   <td>Full weekday name of the current locale<br /> </td>
  </tr>
  <tr>
   <td>YY</td>
   <td>2-digit year, where 00 = 2000, 29 = 2029, 30 = 1930, and 99 = 1999<br /> </td>
  </tr>
  <tr>
   <td>YYYY</td>
   <td>4-digit year<br /> </td>
  </tr>
 </tbody>
</table>

>[!NOTE]
>
> As per design, the Date field in HTML5 Forms does not support the `MM-YYYY` pattern in edit format. However, the pattern is supported in the display format.

## Numeric Picture Clause {#numeric-picture-clause}

HTML5 forms support Numeric Picture symbols. However, there is a difference in support between PDF Forms and HTML Forms.

In **PDF Forms**, a number is formatted irrespective of the number of symbols in the Picture clause has

In **HTML Forms**, a number is formatted only if the number has digits less than the number of symbols in the Picture clause.

**Example**: Consider a Picture clause: num{zzz,zzz,zz9}.

The number **10000** is formatted as **10,000** in both HTML and PDF Forms.

The number 1000000 is formatted as 1,000,000 in PDF forms. However, in HTML Forms the number remains unformatted as 1000000.

Supported expressions for Numeric Picture clause in **HTML Forms** are:

* num.integer{}
* num.decimal{}
* num.currency{}
* num.percent{}
* num{Numeric Picture Clause Symbols}

<table>
 <tbody>
  <tr>
   <th><strong>Symbol</strong></th>
   <th><strong>Interpretation</strong></th>
   <th>Input parsing</th>
  </tr>
  <tr>
   <td>9</td>
   <td><strong>Output formatting</strong>: a single digit. Or for the zero digit if the input data is empty or a space in the corresponding position.<br /> </td>
   <td>Single digit</td>
  </tr>
  <tr>
   <td>Z</td>
   <td><strong>Output formatting</strong>: a single digit. Or for a space if the input data is empty, a space, or the zero digit in the corresponding position.<br /> </td>
   <td>Single digit or space</td>
  </tr>
  <tr>
   <td>z</td>
   <td><strong>Output formatting</strong>: a single digit. Or for nothing if the input data is empty, a space, or the zero digit in the corresponding position.<br /> </td>
   <td>Single digit or nothing</td>
  </tr>
  <tr>
   <td>E</td>
   <td><strong>Output formatting</strong>: the exponent part of a floating point number consisting of the exponential symbol (E). Followed by an optional plus or minus sign. Followed by the exponent value.<br /> </td>
   <td>Same as for output formatting</td>
  </tr>
  <tr>
   <td>CR or cr<br /> </td>
   <td>Credit symbol (CR) if the number is negative. Else nothing.</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>S or s<br /> </td>
   <td>Output formatting: a minus sign if the number is negative. Else space.<br /> </td>
   <td>Minus sign if the number is negative. Plus sign if the number is positive</td>
  </tr>
  <tr>
   <td>V</td>
   <td>Decimal radix of the prevailing locale. Allowing the decimal radix to be implied when input parsing.</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>v</td>
   <td>Decimal radix of the prevailing locale. Allowing the decimal radix to be implied when input parsing and output formatting.</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>.</td>
   <td>Decimal radix of the prevailing locale.</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>, (U+FF0C)</td>
   <td>Grouping separator of the prevailing locale</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>$ (U+FF04)</td>
   <td>Currency symbol of the prevailing locale.</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>% (U+FF05)</td>
   <td>Percent symbol of the prevailing locale.</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>( (U+FF08)</td>
   <td>Left parenthesis if the number is negative. Else space.</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>) (U+FF09)</td>
   <td>Right parenthesis if the number is negative. Else space.</td>
   <td><br type="_moz" /> </td>
  </tr>
  <tr>
   <td>t</td>
   <td>Tab Character</td>
   <td><br type="_moz" /> </td>
  </tr>
 </tbody>
</table>

## Text Picture Clause {#text-picture-clause}

HTML5 forms support the following Text Picture clause expressions:

* text{text Picture clause symbols}

| **Symbol** |**Interpretation** |
|---|---|
| A |Single alphabetic character.  |
| X |Single character.  |
| O |Single alphanumeric character.  |
| 0 (zero) |Single alphanumeric character.  |
| 9 |Single digit.  |
