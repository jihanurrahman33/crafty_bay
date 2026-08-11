# Crafty Bay

Crafty Bay is a Flutter e-commerce client app built with GetX state management and a REST API backend.

## Tech Stack

- Flutter (Dart SDK `^3.7.0`)
- GetX
- Firebase Core + Firebase Crashlytics
- HTTP + Logger
- Shared Preferences

## Features

- Email/password registration and login
- OTP verification flow
- Home screen with:
  - Hero slider
  - Category preview
  - Popular products
- Category listing with pagination
- Product listing by category with pagination
- Product details view
- Add to cart (requires authentication)
- Cart list, quantity update, total price calculation, and item removal

## Current Status

This project includes both complete and in-progress modules:

- Implemented: auth flow, home/catalog browsing, product details, cart basics
- Placeholder/incomplete: wishlist, checkout, dynamic review submission/listing

## Project Structure

```text
lib/
├── app/                    # App-level config (theme, routes, urls, bindings)
├── core/                   # Shared services/widgets (network, progress, snackbar)
├── features/
│   ├── auth/               # Sign up, login, verify OTP
│   ├── cart/               # Cart screens, controllers, models
│   ├── common/             # Shared models/controllers/widgets
│   ├── home/               # Home UI, slider, popular product logic
│   ├── product/            # Product list/details/review screens
│   └── wishlist/           # Wishlist screen (currently placeholder)
└── main.dart
```

## API Configuration

Base API URL is defined in `lib/app/urls.dart`.

Current value:

- `https://ecom-rs8e.onrender.com/api`

## Prerequisites

- Flutter SDK compatible with the project (`.fvmrc` uses Flutter `3.29.3`)
- Dart SDK `^3.7.0`
- Android Studio or Xcode (for mobile targets)

## Firebase Setup

`main.dart` initializes Firebase and Crashlytics using `DefaultFirebaseOptions.currentPlatform`, so you must provide FlutterFire-generated config before running:

1. Install FlutterFire CLI (if needed):
   - `dart pub global activate flutterfire_cli`
2. Configure Firebase:
   - `flutterfire configure`
3. Ensure generated and platform files exist:
   - `lib/firebase_options.dart`
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`

## Getting Started

1. Install dependencies:
   - `flutter pub get`
2. Run the app:
   - `flutter run`

## Development Commands

- Static analysis: `flutter analyze`
- Run tests: `flutter test`

## Notes

- User auth data and token are persisted with Shared Preferences.
- Unauthorized API responses (`401`) trigger local sign-out and redirect to login.
