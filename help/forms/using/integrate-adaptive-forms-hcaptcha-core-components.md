---
title: How to use hCaptcha&reg; in an AEM 6.5 Forms Core Components?
description: Enhance form security with hCaptcha&reg; service effortlessly. Step-by-step guide inside!
topic-tags: Adaptive Forms, author
keywords: hCaptcha&reg; service, Adaptive Forms, CAPTCHA challenge, Bot prevention, Core Components, Form submission security, Form spam prevention
feature: Adaptive Forms, Core Components
role: User, Developer
---
# Connect your AEM Forms environment with hCaptcha&reg; {#connect-your-forms-environment-with-hcaptcha-service}


CAPTCHA (Completely Automated Public Turing test to tell Computers and Humans Apart) is a program commonly used in online transactions to distinguish between humans and automated programs or bots. It poses a challenge and evaluates user response to determine if it's a human or a bot interacting with the site. It prevents the user to proceed if the test fails and helps make online transactions secure by keeping bots from posting spam or malicious purposes.

AEM Forms 6.5 Core Components supports the following CAPTCHA solutions:

* [Google reCAPTCHA](/help/forms/using/captcha-adaptive-forms.md)
* [Cloudflare Turnstile](/help/forms/using/integrate-adaptive-forms-turnstile-core-components.md)

## Integrate AEM Forms environment with hCaptcha

hCaptcha&reg; service protects your forms from bots, spam, and automated abuse. It poses a checkbox widget challenge and evaluates the user response to determine if it's a human or a bot interacting with the form. It prevents the user to proceed if the test fails and helps make online transactions secure by keeping bots from posting spam or malicious activities.

AEM 6.5 Adaptive Forms Core Components supports hCaptcha&reg. You can use it to present a checkbox widget challenge on form submission.

<!-- ![hCaptcha&reg;](assets/hCaptcha&reg;-challenge.png)-->


### Prerequisites to integrate AEM Forms environment with hCaptcha&reg; {#prerequisite}

To configure hCaptcha&reg; with AEM Forms, you need to obtain the [hCaptcha&reg; sitekey and secret key](https://docs.hcaptcha.com/switch/#get-your-hcaptcha-sitekey-and-secret-key) from the hCaptcha&reg; website.

### Configure hCaptcha&reg; {#steps-to-configure-hcaptcha}

To integrate AEM Forms with hCaptcha&reg; service, perform the following steps:

1. Create a Configuration Container on your AEM Forms environment as it holds Cloud Configurations used to connect AEM to external services. To create a Configuration Container:
    1. Open your AEM Forms environment. 
    1. Go to **[!UICONTROL Tools > General > Configuration Browser]**.  
    1. In the Configuration Browser, you can select an existing folder or create a new folder:

        * To create a new folder and enable the Cloud Configurations option: 
            1. In the Configuration Browser, click **[!UICONTROL Create]**. 
            1. In the Create Configuration dialog, specify a name, title, and select the **[!UICONTROL Cloud Configurations]** option. 
            1. Click **[!UICONTROL Create]**.
        * To enable the Cloud Configurations option for an existing folder:
            1. In the Configuration Browser, select the folder and select **[!UICONTROL Properties]**.
            1. In the Configuration Properties dialog, enable **[!UICONTROL Cloud Configurations]**.
            1. Select **[!UICONTROL Save & Close]** to save the configuration and exit the dialog.

1. Configure the Cloud Service: 
    1. On your AEM author instance, go to ![tools-1](assets/tools-1.png) &gt; **[!UICONTROL Cloud Services]** and select **[!UICONTROL hCaptcha&reg;]**.
        ![hCaptcha&reg; in ui](assets/hcaptcha-in-ui.png)
    1. Select a Configuration Container, created or updated, as described in the previous section. Select **[!UICONTROL Create]**.
        ![Configuration hCaptcha&reg;](assets/config-hcaptcha.png)
    1. Specify **[!UICONTROL Title]**, <!--**[!UICONTROL Name]**--> **[!UICONTROL Site Key]**, and **[!UICONTROL Secret Key]** for hCaptcha&reg; service [obtained in Prerequisite](#prerequisite). Select **[!UICONTROL Create]**.

        ![Configure the Cloud Service to connect your AEM Forms environment with hCaptcha&reg;](assets/create-hcaptcha-config.png)

    >[!NOTE]
    > Users need not to modify [Client-side JavaScript validation URL](https://docs.hcaptcha.com/#add-the-hcaptcha-widget-to-your-webpage) and [Server-side validation URL](https://docs.hcaptcha.com/#verify-the-user-response-server-side) as they are already prefilled for hCaptcha&reg; validation.

   Once the hCAPTCHA service is configured, it is available for use in an [Adaptive Form based on Core Components](https://experienceleague.adobe.com/en/docs/experience-manager-core-components/using/adaptive-forms/introduction).

## Use hCaptcha&reg; in an Adaptive Forms Core Components {#using-hCaptcha&reg;-core-components}

1. Open your AEM Forms environment. 
1. Go to **[!UICONTROL Forms]** > **[!UICONTROL Forms and Documents]**.
1. Select an Adaptive Form and select **[!UICONTROL Properties]**. For the **[!UICONTROL Configuration Container]** option, select the Configuration Container that contains the Cloud Configuration for hCaptcha&reg;, and select **[!UICONTROL Save & Close]**.

    If you do not have such a Configuration Container, see section [Connect your AEM Forms environment with hCaptcha&reg;](#connect-your-forms-environment-with-hcaptcha-service) to understand how to create a Configuration Container.

    ![Select Configuration Container](/help/forms/using/assets/captcha-properties.png)

1. Select an Adaptive Form and select **[!UICONTROL Edit]** to open the form in Adaptive Forms Editor.
1. From the component browser, drag-drop or add the **[!UICONTROL Adaptive Form hCaptcha&reg;]** component onto the Adaptive Form.
1. Select the **[!UICONTROL Adaptive Form hCaptcha&reg;]** component and click properties ![Properties icon](assets/configure-icon.svg) icon. It opens the properties dialog. Specify the following properties:

    ![hCaptcha&reg; v2](assets/config-hcaptcha-v2.png)

    * **[!UICONTROL Name]:** Specify the name for your Captcha component, you can identify a form component easily with its unique name both in the form and in the rule editor.
    * **[!UICONTROL Title]:** Specify the title for your Captcha component.
    * **[!UICONTROL Configuration Settings]:** Select a Cloud Configuration configured for hCaptcha&reg;.
    * **Captcha Size:** You can select the display size of the hCaptcha&reg; challenge dialog. Use the **[!UICONTROL Compact]** option to display a small sized and the **[!UICONTROL Normal]** option to display a relatively large-size hCaptcha&reg; challenge dialog.<!-- or **[!UICONTROL Invisible]** to validate hCaptcha&reg; without explicitly rendering the checkbox widget on the user interface. -->
    * **[!UICONTROL Validation Message]:** Provide a validation message for your Captcha validation on form submission.
    * **[!UICONTROL Script Validation Message]** - This option allows you to enter a message to be displayed if the script validation fails.
        >[!NOTE]
        >You can have multiple Cloud Configurations in your environment for a similar purpose. So, choose the service carefully. If no service is listed, see [Connect your AEM Forms environment with hCaptcha&reg;](#connect-your-forms-environment-with-hcaptcha-service) to learn how to create a Cloud Service that connects your AEM Forms environment with hCaptcha&reg; service.
    <!--* **Error Message:** Provide the error message to display to the user when the Captcha submission fails.-->

1. Select **[!UICONTROL Done]**.


Now, only legitimate forms, in which the form filler successfully clears the challenge posed by the hCaptcha&reg; service are allowed for the form submission. hCaptcha&reg;

**hCaptcha&reg; is a registered trademark of Intuition Machines, Inc.**


## Frequently Asked Questions

* **Q: Can I use more than one Captcha component in an Adaptive Form?**
* **Ans:** Using more than one Captcha component in an Adaptive Form is not supported. Also, it is not recommended to use a Captcha component in a fragment or a panel marked for lazy loading.

## See Also {#see-also}

{{see-also}}
