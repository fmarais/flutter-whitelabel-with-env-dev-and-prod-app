# How to handle white labeling for this app

## (Part 1) Separate flavour/scheme example (dev, prod):

https://sebastien-arbogast.com/2022/05/02/multi-environment-flutter-projects-with-flavors/

https://github.com/sarbogast/buzzwordbingo/tree/final

## (Part 2) White label example (app customization):

https://github.com/ramiechaarani/whitelabel-flutter

1. This app combines both `flavour/scheme` in order to customzie our app colors and themes.
2. The app also contains an `env` split for `dev` and `prod` builds. You can add more `env` build configs by reading through the link above in `part1`. 

## Setup android studio

Add android studio config, do this for `base_project` and `brand_app`.
    
    Android Studio > Edit Configs > + > Flutter > Dart Entrypoint > [<base_project>, <brand_app>]/lib/main_dev.dart

Remember to set the `build flavour` to `dev`

    Android Studio > Edit Configs > + > Flutter > Dart Entrypoint > [<base_project>, <brand_app>]/lib/main_prod.dart

Remember to set the `build flavour` to `prod`

## Get dependencies 
`[<base_project>, <brand_app>]/pubspec.yaml`

    flutter pub get

## White label structure

### Base project
```
project/base_project/
```

- This is the `parent app` of the application.
- Styles, icons, fonts, colors, strings app icons and launch/splash screens will be overridden by the child applications.
- This is where we add all the `business logic, services, screens` etc.
- This app `can be run build/run directly`, it contains the default customizations and assets and serves as a `base for the child apps`.

#### Namespaces used
```
com.wallet.mobile.base_project
```
```
com.wallet.mobile.base_project.dev
```

### Brand app
```
project/brand_app1/
```

- This is the `child app` of the application. 
- This is where the `customization` happens.
- `Custom styles, icons, fonts, colors, strings app icons and launch/splash screens` can be added here.
- App `namespaces` will also be unique for each `<brand_app>`.
- `No business logic` contained here, only styles and app customization.
- This app `is build/run directly`, it will inherit the business logic and classes from `<base_project>` while using its own customizations and assets.

#### Namespaces used
```
com.wallet.mobile.brand_app1
```
```
com.wallet.mobile.brand_app1.dev
```

### Customization

Config: `[<base_project>, <brand_app>]/config/lib/app_config.dart`

Theme and colours: `[<base_project>, <brand_app>]/lib/main_dev.dart`

Generate the platform icons with: https://icon.kitchen

Launcher icons:
- Android
    - Generate the platform icons
    - Drop them in `<brand_app>/android/app/src/main/res/`


- iOS
    - Generate the platform icons
    - Drop them in `<brand_app>/ios/Runner/Assets.xcassets/AppIcon.appiconset/`


- Web
    - Generate the platform icons
    - Drop them in `<brand_app>/web/favicon.ico` and `<brand_app>/web/icons`

Launch screen:
- Android: None by default. <br>See: https://docs.flutter.dev/development/ui/advanced/splash-screen
- iOS: `<brand_app>/ios/Runner/Assets.xcassets/LaunchImage.imageset/`


### Namespace
When you create a new `<brand_app>` you need to set the namespaces for the following

#### Android

Placeholder namespace: `com.wallet.mobile.brand_app1`


```
<brand_app>/android/app/src/debug/AndroidManifest.xml
<brand_app>/android/app/src/main/AndroidManifest.xml
<brand_app>/android/app/src/profile/AndroidManifest.xml
```
`AndroidManifest.xml > package`
<br>
<br>
```
<brand_app>/android/app/build.gradle
```
`build.gradle > applicationId`


#### iOS

Placeholder namespace: `com.wallet.mobile.brand_app1`

Look for `PRODUCT_BUNDLE_IDENTIFIER`. x3 Occurrences in. 
```
<brand_app>/ios/Runner.xcodeproj/project.pbxproj
```

## Dependencies

### Android

- Gradle plugin: `[<base_project>, <brand_app>] > buildscript > dependencies > com.android.tools.build:gradle`
- Gradle wrapper: `[<base_project>, <brand_app>]/android/gradle/wrapper/gradle-wrapper.properties`
- App, Buildscript: `[<base_project>, <brand_app>]/android/build.gradle`
- Android, Min|Target|Compile Sdk: `[<base_project>, <brand_app>]/android/app/build.gradle`

### iOS
    TODO

## Versioning
Handled by flutter, see: `[<base_project>, <brand_app>]/pubspec.yaml`
