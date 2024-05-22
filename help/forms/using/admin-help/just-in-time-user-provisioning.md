---
title: Just-in-time user provisioning

description: Use just-in-time provisioning to add users to User Management after successfull authentication and dynamically assign relevant roles and groups to the new user.


contentOwner: admin
content-type: reference
geptopics: SG_AEMFORMS/categories/setting_up_and_organizing_users
products: SG_EXPERIENCEMANAGER/6.5/FORMS

exl-id: 7bde0a09-192a-44a8-83d0-c18e335e9afa
solution: Experience Manager, Experience Manager Forms
feature: Adaptive Forms
role: User, Developer
---
# Just-in-time user provisioning {#just-in-time-user-provisioning}

AEM forms supports just-in-time provisioning of users that don’t yet exist in User Management. With just-in-time provisioning, users are automatically added to User Management after their credentials are successfully authenticated. In addition, relevant roles and groups are assigned dynamically to the new user.

## Need for just-in-time user provisioning {#need-for-just-in-time-user-provisioning}

This is how traditional authentication works:

1. When a user tries to log in to AEM forms, User Management passes the user’s credentials sequentially to all available authentication providers. (Login credentials include a username/password combination, Kerberos ticket, PKCS7 signature, and so on.)
1. The authentication provider validates the credentials.
1. The authentication provider then checks whether the user exists in the User Management database. The following results are possible:

   **Exists:** If the user is current and unlocked, User Management returns authentication success. However, if the user is not current or is locked, User Management returns authentication failure.

   **Does not exist:** User Management returns authentication failure.

   **Invalid:** User Management returns authentication failure.

1. The result returned by the authentication provider is evaluated. If the authentication provider returned authentication success, the user is allowed to log in. Otherwise, User Management checks with the next authentication provider (steps 2-3).
1. Authentication failure is returned if no available authentication provider validates the user credentials.

When just-in-time provisioning is implemented, a new user is created dynamically in User Management if one of the authentication providers validates the user’s credentials. (After step 3 in the traditional authentication procedure, above.)

## Implement just-in-time user provisioning {#implement-just-in-time-user-provisioning}

### APIs for just-in-time provisioning {#apis-for-just-in-time-provisioning}

AEM forms provides the following APIs for just-in-time provisioning:

```java
package com.adobe.idp.um.spi.authentication  ;
publ ic interface IdentityCreator {
/**
* Tries  to create a user with the  in formation  provided in the <code>UserProvisioningBO</code> object.
* If the user is successfully created, a valid AuthResponse is returned along with the information using which the user was created.
* It is the responsibility of the IdentityCreator to set the User obje ct  in the cre dential map with th e  ke y  <code>UMA u thenticationUtil.authenticatedUserKey</code>
* The credentials are available in the <code>UserProvisioningBO</code> object in the 'credentials' property.
* If the IdentityCreator is unable to create a user due to any reason, it returns <code>null</code>
* @param userBO An object of <code>com.adobe. i dp.um . spi.authenti c ationUserProvisioningBO</code>
* @return */public AuthResponse create(UserProvisioningBO userBO);
/**
* Returns the name of the IdentityCreator which will be registered in preferences.
* This name is used to associate the IdentityProvider with the Auth Provider Configuration in the domain.
* @return The name of the Identity Creator which is recognized in Configuration.
*/
public String getName();
}
package com.adobe.idp.um.spi.authentication;
import com.adobe.idp.um.api.infomodel.User;
public interface AssignmentProvider {
/**
* Tries to assign roles or permissions or group memberships to users created via Just-in-time provisioning.
* @param user The User created via the Just-in-time provisioning process.
* @return a Boolean flag indicating whether the assignment was successful or not.
*/
public Boolean assign(User user);
/**
* Returns the name of the AssignmentProvider through which it is registered under preferences.
* This name is used to associate the AssignmentProvider with the Auth Provider Configuration in the domain.
* @return The name of the AssignmentProvider which is recognized in Configuration.
*/public String getName();
}
```

### Considerations while creating a just-in-time-enabled domain {#considerations-while-creating-a-just-in-time-enabled-domain}

* While creating a custom `IdentityCreator` for a hybrid domain, ensure that a dummy password is specified for the local user. Do not leave this password field empty.
* Recommendation: Use `DomainSpecificAuthentication` to validate user credentials against a specific domain.

### Create a just-in-time-enabled domain {#create-a-just-in-time-enabled-domain}

1. Write a DSC implementing the APIs in the "APIs for just-in-time provisioning" section.
1. Deploy the DSC to the Forms Server.
1. Create a just-in-time-enabled domain:

    * In Administration Console, click Settings &gt; User Management &gt; Domain Management &gt; New Enterprise Domain.
    * Configure the domain and select Enable Just In Time Provisioning. <!--Fix broken link (See Setting up and managing domains).-->
    * Add authentication providers. While adding authentication providers, on the New Authentication screen, select a registered Identity Creator and Assignment Provider.

1. Save the new domain.

## Behind the scenes {#behind-the-scenes}

Assume that a user is trying to log in to AEM forms and an authentication provider accepts their user credentials. If the user doesn’t yet exist in the User Management database, the identity check for the user fails. AEM forms now performs the following actions:

1. Create a `UserProvisioningBO` object with the authentication data and place it in a credential map.
1. Based on domain information returned by `UserProvisioningBO`, fetch and invoke the registered `IdentityCreator` and `AssignmentProvider` for the domain.
1. Invoke `IdentityCreator`. If it returns a successful `AuthResponse`, extract `UserInfo` from the credential map. Pass it to the `AssignmentProvider` for group/role assignment and any other post-processing after the user is created.
1. If the user is created successfully, return the login attempt by the user as successful.
1. For hybrid domains, pull user information from the authentication data provided to the authentication provider. If this information is fetched successfully, create the user on-the-fly.

>[!NOTE]
>
>The just-in-time provisioning feature ships with a default implementation of `IdentityCreator` that you can use to dynamically create users. Users are created with the information associated with the directories in the domain.
