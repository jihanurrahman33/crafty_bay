# Crafty Bay

Crafty Bay is a Flutter-based e-commerce client application that consumes a REST API backend, uses GetX for state management, and integrates Firebase Crashlytics for runtime crash reporting.

## Table of Contents
- [Project Overview](#project-overview)
- [Implemented Features](#implemented-features)
- [In-Progress or Placeholder Areas](#in-progress-or-placeholder-areas)
- [Architecture and Technical Approach](#architecture-and-technical-approach)
- [Tech Stack](#tech-stack)
- [Repository Structure](#repository-structure)
- [App Navigation and Routes](#app-navigation-and-routes)
- [API Integration](#api-integration)
- [Authentication and Session Handling](#authentication-and-session-handling)
- [Error Handling and Logging](#error-handling-and-logging)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Firebase Configuration](#firebase-configuration)
- [Development Commands](#development-commands)
- [Known Limitations](#known-limitations)
- [Contributing Notes](#contributing-notes)

## Project Overview
Crafty Bay provides a mobile storefront experience with authentication, product discovery, category browsing, product details, and cart operations. The project is organized by features and follows a controller-driven UI flow using GetX bindings.

## Implemented Features
### Authentication
- User registration via API (`/auth/signup`)
- Login via API (`/auth/login`)
- OTP verification flow (`/auth/verify-otp`)
- Splash flow that decides authenticated vs unauthenticated entry

### Home and Discovery
- Home slider/banner section loaded from backend (`/slides`)
- Popular product listing on home
- Category preview and navigation

### Catalog
- Category listing with pagination support
- Product listing by category with pagination support
- Dedicated product list screen per selected category

### Product Details
- Product detail retrieval by product ID
- Product image slider
- Product size picker and color picker widgets

### Cart
- Add to cart (API-based)
- Cart item list fetch
- Cart item delete
- Quantity change interactions in UI
- Total price display in cart screen

## In-Progress or Placeholder Areas
- Wishlist screen exists but is currently UI placeholder level
- Review listing uses static sample content
- Add review screen UI exists, but submission flow is not integrated
- Checkout button exists in cart screen without completed purchase flow

## Architecture and Technical Approach
### State Management
- Uses **GetX** controllers for feature state and UI updates
- Global dependency setup is handled in `ControllerBinder`

### Dependency Binding
`lib/app/controller_binder.dart` wires:
- Auth/session controller
- Shared network client
- Feature controllers (auth, home, category, product, cart)

### Networking Layer
`lib/core/services/network/network_client.dart` provides:
- GET / POST / PUT / PATCH / DELETE wrappers
- Common headers injection
- Unified response model (`NetworkResponse`)
- Request/response logging via `logger`
- Automatic unauthorized callback handling

## Tech Stack
- **Flutter** (FVM pinned to `3.29.3`)
- **Dart SDK** `^3.7.0`
- **GetX** for state and dependency management
- **http** for API calls
- **shared_preferences** for token and user persistence
- **firebase_core** for Firebase initialization
- **firebase_crashlytics** for crash reporting
- **carousel_slider**, **flutter_svg**, **pin_code_fields** for UI components

## Repository Structure
```text
lib/
├── app/
│   ├── app.dart                      # App entry widget and GetMaterialApp config
│   ├── app_routes.dart               # Named route mapping
│   ├── app_theme.dart                # Theme definitions
│   ├── controller_binder.dart        # Global dependency injection
│   └── urls.dart                     # API endpoint definitions
├── core/
│   ├── centered_circular_progress_indicator.dart
│   ├── services/network/
│   │   ├── network_client.dart       # HTTP wrapper and error handling
│   │   └── network_response.dart
│   └── ui/widgets/snack_bar_message.dart
├── features/
│   ├── auth/                         # Login, sign-up, OTP, splash
│   ├── cart/                         # Cart list, delete, item UI
│   ├── common/                       # Shared models/widgets/controllers
│   ├── home/                         # Slider and popular products
│   ├── product/                      # Product list/details/reviews/add-to-cart
│   └── wishlist/                     # Wishlist screen placeholder
└── main.dart                         # Firebase init + Crashlytics + runApp
```

## App Navigation and Routes
Route generation is centralized in `lib/app/app_routes.dart`.

Configured route targets include:
- Splash
- Login
- Sign Up
- Verify OTP (expects `email` argument)
- Main bottom navigation container
- Product list (expects `CategoryModel` argument)
- Product details (expects `productId` argument)
- Product reviews
- Add review

Bottom navigation screens:
- Home
- Category
- Cart
- Wishlist

## API Integration
Base URL in `lib/app/urls.dart`:
- `https://ecom-rs8e.onrender.com/api`

Endpoints currently wired in code:
- `POST /auth/signup`
- `POST /auth/verify-otp`
- `POST /auth/login`
- `GET /slides`
- `GET /categories?count={count}&page={page}`
- `GET /products?count={count}&page={page}&category={id}`
- `GET /products`
- `GET /products/id/{productId}`
- `POST /cart`
- `GET /cart`
- `DELETE /cart/{cartItemId}`

## Authentication and Session Handling
Session behavior is implemented in `features/common/controllers/auth_controller.dart`:
- Access token and user profile are persisted in `SharedPreferences`
- Session restore happens on app launch path
- On unauthorized (`401`) response, user data is cleared and navigation returns to login

## Error Handling and Logging
- API status handling is normalized through `NetworkResponse`
- Non-2xx responses return backend message (`msg`) when available
- Exceptions are captured and converted into error responses
- Network request and response payloads are logged using `logger`
- Unhandled Flutter errors and platform errors are forwarded to Crashlytics in `main.dart`

## Prerequisites
- Flutter SDK compatible with project configuration (recommended via FVM)
- Dart SDK `^3.7.0`
- Android Studio and/or Xcode for mobile builds
- A configured Firebase project for Crashlytics support

## Setup Instructions
1. Clone and enter project:
   - `git clone <repo-url>`
   - `cd crafty_bay`
2. Install dependencies:
   - `flutter pub get`
3. Generate Firebase config (see next section)
4. Run app:
   - `flutter run`

## Firebase Configuration
The app calls:
- `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)`

Required setup:
1. Install FlutterFire CLI (if needed):
   - `dart pub global activate flutterfire_cli`
2. Configure Firebase in this project:
   - `flutterfire configure`
3. Ensure these files exist:
   - `lib/firebase_options.dart`
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`

## Development Commands
- Get packages: `flutter pub get`
- Static analysis: `flutter analyze`
- Run tests: `flutter test`
- Run app: `flutter run`

## Known Limitations
- Wishlist, review submission, and checkout are not fully integrated end-to-end
- Review count/content currently includes placeholder data
- Production readiness depends on backend/API stability and Firebase setup

## Contributing Notes
- Keep feature code inside its corresponding `lib/features/<feature>` module
- Add or update API paths in `lib/app/urls.dart`
- Register new controllers in `lib/app/controller_binder.dart`
- Keep navigation changes aligned with `lib/app/app_routes.dart`
