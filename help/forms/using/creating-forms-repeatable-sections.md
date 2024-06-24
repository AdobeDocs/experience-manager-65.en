---
title: Creating forms with repeatable sections
description: Repeatable sections are panels that can be dynamically added or removed to a form.
products: SG_EXPERIENCEMANAGER/6.5/FORMS
topic-tags: author
discoiquuid: 01724ca0-6901-45e7-b045-f44814ed574e
feature: Adaptive Forms,Foundation Components
exl-id: f2abae0a-f7fd-4a39-bd8c-03492ce06fe9
solution: Experience Manager, Experience Manager Forms
role: Admin, User, Developer
---
# Creating forms with repeatable sections {#creating-forms-with-repeatable-sections}

<span class="preview"> Adobe recommends using the modern and extensible data capture [Core Components](https://experienceleague.adobe.com/docs/experience-manager-core-components/using/adaptive-forms/introduction.html) for [creating new Adaptive Forms](/help/forms/using/create-an-adaptive-form-core-components.md) or [adding Adaptive Forms to AEM Sites pages](/help/forms/using/create-or-add-an-adaptive-form-to-aem-sites-page.md). These components represent a significant advancement in Adaptive Forms creation, ensuring impressive user experiences. This article describes older approach to author Adaptive Forms using foundation components. </span>

Repeatable sections are panels that can be added or removed to a form dynamically.

For example, while applying for a job, the job seeker provides previous employment details such as company name, role, project, and other information. Information of all the employers requires different but similar looking sections. In such a scenario, the employment form provides an employer section and also provides an option to dynamically add more such sections. These sections, which are added dynamically, are known as Repeatable sections.

You can use one of the following methods to create repeatable panels:

## Using Instance Manager via scripts&nbsp; {#using-instance-manager-via-scripts-nbsp}

1. In the edit mode, select a panel, then select ![cmppr](assets/cmppr.png). In the sidebar, under Properties, enable **Make Panel Repeatable**. Specify values for the **[!UICONTROL Maximum]** and **[!UICONTROL Minimum]** fields.

   The Maximum field specifies the maximum number of times a panel can appear on the page. You can specify -1 in the Maximum Count field to allow the panel to appear for infinite number of times.

   The Minimum field specifies the minimum the number times a panel appears on the form. If you set The Minimum Count filed to zero, later, you can remove all the instances via scripts after rendition is complete.

   >[!NOTE]
   >
   >To create a non-repeatable panel, set value of the Maximum and Minimum field to one. The accordion layout does not support -1 in the Maximum Count field. You can specify a high number to give the notion of infinite value.

1. The parent of the panel, which is to be repeated, should contain add and delete buttons to manage instances of the repeatable panels. Perform the following steps to insert buttons to the parent and enable scripts on the buttons:

    1. From the sidebar, drag-and-drop a button component to the parent of the panel. Select the component and select ![edit-rules](assets/edit-rules.png). The rules of the button open in the rule editor.
    1. In the Rule Editor window, click **Create**.

       Select **Visual Editor** in the Form Objects and Functions row.

        1. In the rule area, under WHEN, select state **is clicked**.
        1. Under THEN:

            * To create an add panel button, select **Add Instance**, and drag-drop the panel using ![toggle-side-panel](assets/toggle-side-panel.png) or select it using **Drop object or select here.**
            * To create a delete panel button, select **Remove Instance**, and drag-drop the panel using ![toggle-side-panel](assets/toggle-side-panel.png) or select it using **Drop object or select here.**

       Select **Code Editor** in the Form Objects and Functions row. Click **Edit Rules** and in the code area:

        * To create an add panel button, specify `this.panel.instanceManager.addInstance()`
        * To create a delete panel button, specify `this.panel.instanceManager.removeInstance(this.panel.instanceIndex)`

       Click **Done**.

       >[!NOTE]
       >
       >If a field belongs to a repeatable panel, you cannot access it directly using its name in your scripts. To access the field, specify the repeatable instance to which the field belongs using the `instances` API in `InstanceManager`. The syntax to use the `instances` API in `InstanceManager` is:
       >
       >
       >`<panelName>.instanceManager.instances[<instanceNumber>].<fieldname>`
       >
       >
       >For example, you create an adaptive form with a repeatable panel having a text box. When you pre-fill the form with three repeatable text boxes, you need the xml below:
       >
       >
       >`<panel1><textbox1>AA1</panel1></textbox1>`
       >
       >
       >`<panel1><textbox1>AA2</panel1></textbox1>`
       >
       >
       >`<panel1><textbox1>AA3</panel1></textbox1>`
       >
       >
       >To read AA1 data, specify:
       >
       >
       >`Panel1.instanceManager.instances[0].textbox.value`
       >
       >
       >To read AA2 data, specify:
       >
       >
       >`Panel1.instanceManager.instances[1].textbox.value`
       >
       >
       >For more information, see: Class: InstanceManager#instances in [AEM Forms Java API reference](https://adobe.com/go/learn_aemforms_documentation_63).

       >[!NOTE]
       >
       >When all instances of a panel are removed from an adaptive form, to add an instance of the removed panel, use the _panelName syntax to capture the instance manager of the panel and the use the addInstance API of instance manager to add the deleted instance. For example, _panelName.addInstance(). It adds an instance of the removed panel.

## Using the accordion layout for the parent panel &nbsp; {#using-the-accordion-layout-for-the-parent-panel-nbsp}

A panel has various layouts options. The Layout for accordian design option has out of the box support for repeatable panels. Perform the following steps to repeatable panel with Layout for accordian design option:

1. On the parent of panel to be repeated, select ![cmppr](assets/cmppr.png). You can see the properties in the sidebar. In the **Layout** drop-down, select **Accordion**.
1. On a panel, which is to be repeated, select ![cmppr](assets/cmppr.png). You can see the panel properties in the sidebar. Enable the **Make Panel Repeatable** tab, and specify value for the **Maximum** and **Minimum** fields.

   Now, you can use the plus (+) and delete ( ![delete-panel](assets/delete-panel.png)) buttons to add and remove the panels.

## Using repeating subforms from Form Template (XDP/XSD) {#using-repeating-subforms-from-form-template-xdp-xsd}

Repeatable subform is similar to the repeatable panels in Adaptive Forms. In AEM Forms Designer, perform the following steps to create a repeating subform:

1. In the Hierarchy palette, select the parent subform of the subform you want to repeat.
1. In the Object palette, click the Subform tab, and in the Content list, select Flowed.
1. Select the subform to repeat.
1. In the Object palette, click the Subform tab and, in the Content list, select either Positioned or Flowed.
1. Click the Binding tab and select Repeat Subform For Each Data Item.
1. To specify the minimum number of repetitions, select Min Count and type a number in the associated box. If this option is set to 0 and no data is provided for the objects in the subform at data-merge time, the subform is not placed when the form is rendered.
1. To specify the maximum number of subform repetitions, select Max and type a number in the associated box. If you do not specify a value in the Max box, the number of subform repetitions are unlimited.
1. To specify a set number of subform repetitions, regardless of the quantity of data, select Initial Count and type a number in the associated box. If you select this option and either no data is available or fewer data entries exist than the specified Initial Count value, empty instances of the subform are still placed on the form.
1. Add two buttons in the parent subform- one for adding instance and another for deleting instance of repeatable subform. For detailed steps, see [Build an action](https://help.adobe.com/en_US/AEMForms/6.1/DesignerHelp/WS107c29ade9134a2c74572b5612a87ca2b56-8000.2.html#WS107c29ade9134a2c-1f74d86012a87d4fe55-8000.2).
1. Now, link the Form Template to the Adaptive form. For detailed steps, see [Create an adaptive form based on a template](/help/forms/using/creating-adaptive-form.md#create-an-adaptive-form-based-on-a-template).
1. Use the buttons created in step 9 to add and remove subforms.

Attached .zip file contains a sample repeatable sub form.

[Get File](assets/samplerepeatablesubform.zip)

## Using repeat settings of an XML Schema (XSD) {#using-repeat-settings-of-an-xml-schema-xsd-br}

You can create repeatable panels from an XML Schema and from the minOccours & maxOccurs property of any complex type element. For detailed information about XML Schema, see [Create adaptive forms using XML Schema as Form Model](/help/forms/using/adaptive-form-xml-schema-form-model.md).

In the following code, the `SampleType`panel uses the minOccours & maxOccurs property.

```xml
<?xml version="1.0" encoding="utf-8" ?>
    <xs:schema targetNamespace="https://adobe.com/sample.xsd"
                    xmlns="https://adobe.com/sample.xsd"
                    xmlns:xs="https://www.w3.org/2001/XMLSchema"
                >

        <xs:element name="sample" type="SampleType"/>

        <xs:complexType name="SampleType">
            <xs:sequence>
                <xs:element name="leaderName" type="xs:string" default="Enter Name"/>
                <xs:element name="assignmentStartDate" type="xs:date"/>
                <xs:element name="gender" type="GenderEnum"/>
                <xs:element name="noOfProjectsAssigned" type="IntType"/>
                <xs:element name="assignmentDetails" type="AssignmentDetails"
                                            minOccurs="0" maxOccurs="10"/>
            </xs:sequence>
        </xs:complexType>

        <xs:complexType name="AssignmentDetails">
            <xs:attribute name="name" type="xs:string" use="required"/>
            <xs:attribute name="durationOfAssignment" type="xs:unsignedInt" use="required"/>
            <xs:attribute name="numberOfMentees" type="xs:unsignedInt" use="required"/>
             <xs:attribute name="descriptionOfAssignment" type="xs:string" use="required"/>
             <xs:attribute name="financeRelatedProject" type="xs:boolean"/>
       </xs:complexType>
  <xs:simpleType name="IntType">
            <xs:restriction base="xs:int">
            </xs:restriction>
        </xs:simpleType>
  <xs:simpleType name="GenderEnum">
            <xs:restriction base="xs:string">
                <xs:enumeration value="Female"/>
                <xs:enumeration value="Male"/>
            </xs:restriction>
        </xs:simpleType>
    </xs:schema>
```

>[!NOTE]
>
>For non-accordian layout, use adaptive form button components to add and remove instances.
