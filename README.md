# Gamma

Gamma Movie Viewer

|                                                            Photo 1                                                             |                                                              Photo 2                                                              |    
| :------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------: | 
|  ![Image 1](https://github.com/XERZES27/gamma/blob/main/content/gamma-photo-1.jpg?raw=true) | ![Image 2](https://github.com/XERZES27/gamma/blob/main/content/gamma-photo-2.jpg?raw=true)

|                                                            Video                                                            |                                                           Video  2                                                          |                                                         Video  3                                                          | 
| :------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------: |
|  ![Video 1](https://github.com/XERZES27/gamma/blob/main/content/gamma-video-3.gif?raw=true) |   ![Video 2](https://github.com/XERZES27/gamma/blob/main/content/gamma-video-4.gif?raw=true) |  ![Video 3](https://github.com/XERZES27/gamma/blob/main/content/gamma-video-5.gif?raw=true) |



## Installation

- [Install: Fvm](https://fvm.app/documentation/getting-started/installation)

 
``` fvm use 3.16.0 ```
``` fvm flutter pub get ```

## Local Run

``` fvm flutter pub run ```

## Local Build Bundle

``` fvm flutter build appbundle ```

## Local Build Apk

``` fvm flutter build apk ```

## Local Build Split Apk

``` fvm flutter build apk --split-per-abi```

## WorkFlow Build

- [Github Actions](https://github.com/XERZES27/gamma/actions/workflows/android-split-build.yml)

## Explanation

The Application is comprimised of Seven files ``` main.dart home_screen.dart route.dart data.dart cover_detail.dart cover_detail_carousel.dart youtube_trailer_player.dart ``` 

```main.dart``` is a basic wrapper that contains the app theme and systemuioverlay.
```home_screen.dart``` is a container of 3 custom carousel pageview widgets
```route.dart``` is a custom route generator that was written to avoid using router package
```data.dart``` contains references to asset files, but does not have any state management implementation because this application does not need it.
```cover_detail.dart``` is the page that is pushed to the stack when the images in the carousel are clicked, it contains a large preview of the selected image and a list of carousel previews below.
```cover_detail_carousel.dart``` is exactly like ```cover_detail.dart``` but does not have the hero widget to avoid a repeated hero declartion error.
```youtube_trailer_player.dart``` accepts a link which autoplays a youtube video, which should be the trailer of the clicked cover image.

## Used Packages

```
  youtube_player_flutter: ^9.0.0
  flutter_inappwebview: ^6.0.0
  icons_launcher: ^2.1.7
```

```
youtube_player_flutter: plays youtube videos
flutter_inappwebview: is an internal dependency of youtube_player_flutter
icons_launcher: is used (can be done without with this package) to create the respective launcher icons
```

















