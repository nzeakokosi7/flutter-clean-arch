# Wayver Test App

This flutter app was built using Nav2 and Provider and orchestrated following the guidelines of the clean code architecture.

## Summary

The app is a simple flutter app with two main screens, first screen shows a list of users grouped by their activity status, clicking on a user takes you to the next screen with the user's details.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/nzeakokosi7/wayve_flutter_test
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 3:**

This project uses `Mockito` library to mock classes for unit tests, that works with code generation, execute the following command to generate files:

```
dart run build_runner build
```

## Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.mocks.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:

```
*.mocks.dart
```

Make sure to add it to to your `.gitignore` file as well.

**Step 4:**

Create an environment file named `.env` at the approot folder, copy and paste these items below

```
API_BASE_URL_DEV=https://gorest.co.in/public/v1/users
API_BASE_URL_PROD=https://gorest.co.in/public/v1/users
```
Make sure to add this file to your `.gitignore` file.


## App Features:

* Splash
* Home
* Routing
* Theme
* Dio (Network client)
* Provider (State Management)
* Code Generation (Build runner, Mockito)
* Logging
* Dependency Injection (Get It)
* Network Info (Connectivity Plus)

### Libraries & Tools Used

* [Dio](https://pub.dev/packages/dio)
* [Provider](https://pub.dev/packages/provider) (State Management)
* [Logging](https://pub.dev/packages/logger)
* [Get it](https://pub.dev/packages/get_it)
* [Mockito](https://pub.dev/packages/mockito)
* [Build runner]( https://pub.dev/packages/build_runner)
* [Connectivity Plus](https://pub.dev/packages/connectivity_plus)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- core/
|- features/
|- di.dart
|- main.dart
|- main_common.dart
|- main_dev.dart
|- main_prod.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- core - All application level configuration classes within their respective directories. This directory contains the directories for `api`, `enums`, `exceptions`, `providers`, `ui` and `utils`.
2- features - Contains the different modules which represent the various features of the application
3- di.dart - This file contains an asynchronous function which injects required dependencies at app launch.
3- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title etc.
4- main_common.dart — Entry point class which supports app launch in different environments (in this case production and development environments)
5- main_dev.dart — Launches the app in development environment via main_common.dart
6- main_dev.dart — Launches the app in production environment via main_common.dart
```

### Core

This directory contains all the application level configuration classes for networking, error handling, navigation, logging and app state management
```
core/
|- api/
    |- api_helpers.dart
    |- config.dart
    |- error_response.dart
    |- http_client.dart
    |- network_info.dart
    |- server_error.dart
    |- service_state.dart
 
|- endpoints/
    |- endpoints.dart
    
|- enums
    |- environment.dart
    |- server_error_types.dart
    |- user_gender.dart
    |- user_status.dart
    
|- exceptions
    |- api_request_exception.dart
    |- app_exception.dart
    |- unknown_exception.dart
    
|- providers
    |- provider_setup.dart   
    
|- ui
    |- base/
        |- base_view.dart
        |- base_view_model.dart
        
    |- navigation/
        |- navigation.dart
    
    |- styles/
        |- colors.dart  
        |- text_styles.dart 
        
|- utils
    |- loaders/
        |- shimmer_loader.dart

    |- splash_screen/
        |- splash_screen.dart
        |- view_model.dart
    |- app_logger.dart 
    |- config-reader.dart
    |- constants.dart 
    |- data_connection_checker.dart
    |- error_helper_messages.dart
    |- extensions.dart 
```

### Features

All the business logic of your application will go into this directory, however following the clean architectural principle it containts subdirectories which represent unique app features.

Each of these feature directory contains three subdirectories or layers namely, `data`, `domain`, `presentation`.

**data:** ```Includes Repositories, Models and Services.``` Data sources implement logic of data access from different the internet it contains repositories accepts requests for a specific use case and makes appropriate network calls via the service class, organises the data and returns promise to the view models.

**domain:** ```Typically contains Entities and Use Cases.``` Entities declare data format. Use cases combine data from one or multiple repositories. The Use case is a class where you extract the business logic out of your Presenter/ViewModel. This makes the Presenter/ViewModel simpler because it only coordinates the view and calls Use case. This approach helps to write testable, supportable code.

**presentation:**  ```Contains Views/Screens, Viewmodels and Custom widgets.``` Screens are what users interact with and coordinated by ViewModel which executes one or more Use Cases, but in this case the repositories.

However for this particular app we're making just one api call, hence there was no need for use cases as at this stage it'd just be an unnecessary boilerplate code.

```
features/
    |- user_status
        |- data/
            |- models/
                |- user_model.dart
                |- user_response_model.dart
               
            |- repositories/
                |- user_repository.dart
                
            |- services
                |- user_service.dart
        
        |- domain/
            |- entities
                |- user_entity.dart
                |- user_response_entity.dart
                
        |- presentation/
            |- screens/
                |- user_detail_screen.dart
                |- user_list_screen.dart
            
            |- view_models/
                |- user_view_model.dart
                
            |- widgets/
                |- user_avatar_widget.dart
                |- user_item_group_widget.dart
                |- user_item_widget.dart

    
```

### Tests
All tests of the application would go under this directory for now we just have two unit tests and one widget test.

```
|- test/
    |- http_client_test.dart
    |- user_service_test.dart
    |- widget_test.dart
```    

### Github CI/CD
This directory contains all github workflows that run on any push to the master branch. it has only one workflow file which performs, code formatting, analysis and runs tests before building a debug android app which gets uploaded to github artifacts.

```
|- .github/
    |- workflows/
        |- flutter-ci.yml
```      

## Conclusion

I will be happy to answer any questions that you may have on this approach.


