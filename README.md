# Template project #

The following project is a template for building a Clean-Architecture-based Android app.

To import the template in Android Studio, follow the next steps:

* Copy the folder _templates/CleanArchitecture_ in _${ANDROID_STUDIO_HOME}/plugins/android/lib/templates/activities_
* Restart Android Studio
* Now you can create a new project: _File -> New -> New Project..._ and choose **Clean Architecture application**
* Replace the _.gitignore_ file with the _root/.gitignore_ template file
* Replace the _gradle.properties_ file with the _root/gradle.properties_ template file
* Replace the _gradle/wrapper/gradle-wrapper.properties_ file with the _root/gradle-wrapper.properties_ template file
* Edit the _app/build.gradle_ file and update the **com.android.support:appcompat-v7** dependency to the last version
* Edit the _AndroidManifest.xml_ file and set the application theme to @**style/MyAppTheme**
* Sync project
* Rebuild project
* Run it!
