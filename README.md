# GetX - Best Practice
Fastest - scalable - easiest - reactive - pattern

## Key Benefits of GetX?

> - Performance: focused on minimum consumption of memory and resources.
> - Productivity: intuitive and efficient tool combined with simplicity and straightforward syntax that ultimately saves development time.
> - Organization: decoupling business logic from view and presentation logic cannot get better than this. Bonus injection of dependencies and routes are also decoupled, and the data layer is out of it all.


## How to organize the code ?


```yaml
- /project_root
# This is the root directory of the project
    - /assets
        /images
        # put images here such as .png,jpg,jpeg
        /icons
        # put icons here such as .svg,.png
        /vectors
        # put vectors here such as .svg only
        /fonts
        # put fonts here which will be used in app
        /json
        # put json file to use in app
    - .env
    # setup environment variables for the app
    - /lib/app  
    # This is the root of all sub-directories of GetX
        - /data
        # This directory includes all the data manipulations
            - /provider
            # Put the files for related data
                - api_provider.dart
                # Implement api related data logics, define methods of API like GET,POST,PATH,DELETE etc...
                - db_provider.dart
                # Implement methods for database logic such as create a table,drop a table, insert data and so on...
                - storage_provider.dart
                # Implement methods for data storage related purpose
                - firebase_provider.dart
                # Implement methods for firebase data
            - /model
            # Model classes to include data into it.
                - model.dart
            - /repository
            # Repository class, used to intermediate controller with provider's data.
            # This class act like an abstract for the controller to access data.
            # This class uses the instance of API manager and form validation.
            # We inject the repository with the controller at the time of page binding.

        - /modules
        # Individual module / Page, has own View, Controller and Dependency Binding
            - /module_name
                - view.dart
                # This is the UI of the screen
                - logics.dart
                # This controller extends GetxController which controls the state of the UI 
                # when you wrap an individual widget with its Observer so that it only rebuilds when there is a change in the state of that particular widget
                - binding.dart
                # This is dependency injection, Binds controller and use instances of another class by defining into the constructor.
                # Get.lazyPut and Get.put are used to register the controller into the stack.
                # You can inject multiple controllers here
                - /local_widgets
                # Define module-specific widgets here

        - /widgets 
        # Define reusable global widgets for multiple modules
        - /utils
        # Define utility classes here
            - /helpers
            # Define classes which include basic error handling, some helper functions etc...
            # Helper class contains functions that help to assist in view and controller.
                - forms_validations.dart
                # Define custom validations, and Binds this into the controller.
                - initial_bindings.dart
                # This is the global dependency injection class which is used in whole the app.
                # intialize this file into GetMaterialApp
                - responsive.dart
                # A parent widget which is return desktop, tablet and mobile screen sizes.
                - constants.dart
                # Define the constant field that is declared with the static and final keywords
                # You can also define fields for assets here
                - date_helper.dart
                # Define custom Date functions to use in app
                - helpers.dart
                # This is the file where you can define common functions, widget snippet such as Dialogs etc...
                
        - /routes
            - routes.dart
            # Define name of the route here as constants
            - pages.dart
            # Define Page here with route name, view and binding of the page.
            # This class used into GetMaterialApp for route navigation.
            
        - /theme
        # Theme for an app 
            - text_theme.dart  
            # Define variables for customizing textTheme
            - color_theme.dart  
            # Define const colors here e.g. primary color and secondary color
            - app_theme.dart  
            # Configure the theme of the app according to the design 

        - /translations
        # Multilangual support for the app
            - /en_US
            # A Class has a Map<String,String> variable where texts are stored in key-value pair
            # You can create any specific language related file,
            # e.g. For English = en_US and For Arabic = ar_AR
            - app_translations.dart
            # This is an abstract class where all the translation files are grouped into Map<String, Map<String, String>>


- main.dart  
# main file

