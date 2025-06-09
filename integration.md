# Firebase Authentication Integration Guide

This document provides step-by-step instructions for integrating the Firebase authentication system from this project into a new Flutter application.

## Prerequisites

- Flutter SDK installed and configured
- Firebase account
- Basic understanding of Flutter development

## Integration Steps

### 1. Create a New Flutter Project (if needed)

```bash
flutter create your_new_project_name
cd your_new_project_name
```

### 2. Add Firebase Dependencies

Update your `pubspec.yaml` file to include the necessary Firebase packages:

```yaml:pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.15.1
  firebase_auth: ^4.9.0
  // ... existing code ...
```

Then run:

```bash
flutter pub get
```

### 3. Set Up Firebase Project

1. Go to the [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or use an existing one
3. Register your Flutter app with Firebase:
   - Click "Add app" and select the Flutter icon
   - Follow the setup instructions provided by Firebase

### 4. Install and Configure Firebase CLI and FlutterFire CLI

```bash
npm install -g firebase-tools
dart pub global activate flutterfire_cli
```

Configure your Flutter app with Firebase:

```bash
flutterfire configure --project=your-firebase-project-id
```

This will create the necessary configuration files for all platforms (Android, iOS, web).

### 5. Create Project Structure

Create the following directory structure in your project:

```
lib/
├── main.dart
├── screens/
│   ├── authenticate.dart
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── register_screen.dart
│   └── wrapper.dart
├── services/
│   └── auth_service.dart
└── widgets/
```

### 6. Copy Authentication Service

Copy the `auth_service.dart` file from this project to your new project's `lib/services/` directory.

### 7. Copy Screen Files

Copy the following files from this project's `lib/screens/` directory to your new project's `lib/screens/` directory:
- `authenticate.dart`
- `home_screen.dart`
- `login_screen.dart`
- `register_screen.dart`
- `wrapper.dart`

### 8. Update main.dart

Replace the contents of your `main.dart` file with the following, making sure to initialize Firebase:

```dart:lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Wrapper(),
    );
  }
}
```

### 9. Platform-Specific Configuration

#### Android

Ensure your `android/app/build.gradle` file has the correct minimum SDK version:

```gradle:android/app/build.gradle
android {
    // ... existing code ...
    defaultConfig {
        // ... existing code ...
        minSdkVersion 21  // Firebase requires minimum SDK 21
        // ... existing code ...
    }
    // ... existing code ...
}
```

#### iOS

Update your `ios/Runner/Info.plist` file to include necessary permissions if you plan to use additional Firebase features.

### 10. Enable Authentication in Firebase Console

1. Go to the Firebase Console > Authentication > Sign-in method
2. Enable Email/Password authentication

### 11. Run Your App

```bash
flutter run
```

## Files That Need Modification

| File | Action | Description |
|------|--------|-------------|
| `pubspec.yaml` | Modify | Add Firebase dependencies |
| `main.dart` | Replace | Initialize Firebase and set up the app entry point |
| `android/app/build.gradle` | Modify | Update minSdkVersion to 21 |

## Files That Need to be Copied

| File | Description |
|------|-------------|
| `lib/services/auth_service.dart` | Firebase authentication service |
| `lib/screens/wrapper.dart` | Handles authentication state changes |
| `lib/screens/authenticate.dart` | Toggles between login and register screens |
| `lib/screens/login_screen.dart` | Login screen UI and functionality |
| `lib/screens/register_screen.dart` | Registration screen UI and functionality |
| `lib/screens/home_screen.dart` | Home screen shown after successful authentication |

## Troubleshooting

### Common Issues

1. **Firebase initialization error**
   - Ensure you've correctly run `flutterfire configure`
   - Check that the `firebase_options.dart` file was generated

2. **Authentication not working**
   - Verify that Email/Password authentication is enabled in Firebase Console
   - Check for any error messages in the console

3. **Platform-specific issues**
   - For Android: Ensure minSdkVersion is at least 21
   - For iOS: Make sure you've added the GoogleService-Info.plist file

### Getting Help

If you encounter issues not covered in this guide, refer to the official Firebase documentation or Flutter community resources:

- [Firebase Flutter Documentation](https://firebase.google.com/docs/flutter/setup)
- [Flutter Firebase Plugins](https://github.com/firebase/flutterfire)

        