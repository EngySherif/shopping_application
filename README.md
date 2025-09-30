# Shopping App

## Project Overview
This is a Flutter Books Shopping App . The app demonstrates an interactive UI with features such as a horizontally scrollable featured books section, a responsive product grid, and a “Hot Offers” section. Users can browse products, view offers, and add items to a cart.

## Features
- Welcome Screen with **Sign Up** and **Sign In** buttons.
- Smooth animated navigation: Sign-up page fades out, Home page fades in.
- Home Screen:
  - AppBar titled **“Our Products”**.
  - Horizontal `PageView` displaying featured book images with swipe indicators.
  - Responsive `GridView` showing product cards (2 per row) with:
    - Book image
    - Book title
    - Add to Cart icon with SnackBar feedback
  - **Hot Offers** section using `ListView.builder`, displaying:
    - Offer image
    - Offer description
- Fully asset-based images for offline capability.

## Project Structure
shopping_app/
├── android/
├── assets/
|  ├── fonts/
│  └── images/ 
├── ios/
├── linux/
├── macos/
├──web/
├──windows/
├── lib/
│ ├── main.dart
│ ├── screens/
│ │ ├── HomeScreen.dart
│ │ ├── SignUpScreen.dart
│ │ ├── signin_screen.dart
│ │ └── WelcomeScreen.dart
├── test/
├── pubspec.yaml 
├── README.md

