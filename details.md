# Firebase Authentication in Flutter

## Overview
This project demonstrates how to implement Firebase Authentication in a Flutter application. It includes functionality for user registration, login, and logout using Firebase Authentication.

## Firebase Integration Steps

1. **Create a Firebase Project**:
   - Go to the Firebase Console (https://console.firebase.google.com/)
   - Click on "Add Project" and follow the setup instructions
   - Enable Firebase Authentication in the Firebase Console
   - Go to Authentication > Sign-in method and enable Email/Password authentication

2. **Add Firebase to Flutter App**:
   - Install Firebase CLI: `npm install -g firebase-tools`
   - Login to Firebase: `firebase login`
   - Install FlutterFire CLI: `dart pub global activate flutterfire_cli`
   - Configure Firebase for Flutter: `flutterfire configure`
   - This will create a firebase_options.dart file in your project

## Modules Used

1. **firebase_core**: The core Firebase dependency required for all Firebase services
   - Purpose: Initializes Firebase in the Flutter application
   - Usage: `await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)`

2. **firebase_auth**: Firebase Authentication package
   - Purpose: Provides authentication services like sign-up, login, and logout
   - Features used:
     - Email/Password authentication
     - Authentication state changes listener
     - User creation and sign-in
     - Sign-out functionality

## Project Structure

- **lib/services/auth_service.dart**: Service class that handles all Firebase authentication operations
- **lib/screens/login_screen.dart**: Screen for user login
- **lib/screens/register_screen.dart**: Screen for user registration
- **lib/screens/home_screen.dart**: Home screen shown after successful authentication
- **lib/screens/authenticate.dart**: Wrapper to toggle between login and register screens
- **lib/screens/wrapper.dart**: Wrapper that handles authentication state changes
- **lib/main.dart**: Entry point of the application

## How to Run

1. **Setup Firebase**:
   - Create a Firebase project as described above
   - Configure your Flutter app with Firebase using FlutterFire CLI

2. **Install Dependencies**:
   - Run `flutter pub get` to install all required dependencies

3. **Run the App**:
   - Connect a device or start an emulator
   - Run `flutter run` to start the application

## Authentication Flow

1. When the app starts, it checks if a user is already authenticated
2. If not authenticated, the login screen is shown with an option to navigate to the register screen
3. Users can register with email and password or login with existing credentials
4. After successful authentication, users are redirected to the home screen
5. Users can log out from the home screen, which will redirect them back to the login screen

## Error Handling

The app includes basic error handling for authentication failures:
- Invalid email format
- Weak password (less than 6 characters)
- Email already in use
- Incorrect login credentials

## Future Enhancements

1. Add Google Sign-In integration
2. Implement password reset functionality
3. Add email verification
4. Improve UI/UX with better error messages and loading indicators
5. Add user profile management