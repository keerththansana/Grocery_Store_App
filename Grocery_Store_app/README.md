# Freshly – Grocery Store App

Freshly is a cross‑platform Flutter application that showcases a modern grocery shopping experience. Users can browse a curated catalog, add products to a persistent cart, and complete a guided checkout form. The project demonstrates clean UI, local JSON data handling, and state management with Provider.

> 🎥 **Demo:** A screen recording lives at `app.mp4` in the project root. Open it with any media player to preview the experience end‑to‑end.

---

## Features
- **Dynamic product catalog** sourced from `assets/data/grocery_items.json`, rendered in a responsive grid with high‑resolution imagery.
- **Real-time cart management** powered by `Provider`, including add/remove feedback and live totals.
- **Checkout workflow** with validation for name, address, and phone inputs plus instant confirmation messaging.
- **Multi-platform readiness** out of the box for Android, iOS, Web, Windows, macOS, and Linux via stock Flutter runners.
- **Clean theming** with a consistent orange accent, welcoming hero text, and tactile buttons optimized for touch.

---

## Tech Stack
- **Framework:** Flutter 3.x (Dart SDK ^3.5.3)
- **State Management:** `provider`
- **UI Assets:** Local PNG images under `assets/images`
- **Tooling:** Flutter CLI, Gradle/Xcode for native builds

---

## Getting Started

### Prerequisites
1. Install the [Flutter SDK](https://docs.flutter.dev/get-started/install) (channel stable, >= 3.5).
2. Ensure Dart, Android Studio/Xcode, and required platform toolchains are set up (`flutter doctor` should report no issues).

### Installation
```bash
git clone <repo-url>
cd grocery_store_app/Grocery_Store_app
flutter pub get
```

### Run the App
- **Device/emulator:** `flutter run`
- **Web:** `flutter run -d chrome`
- **Desktop (Windows/macOS/Linux):** enable desktop support (`flutter config --enable-windows-desktop`, etc.) then `flutter run -d windows`

### Optional: Execute Tests
```bash
flutter test
```
(No custom tests yet—use this as a starting point for future coverage.)

---

## Project Structure
```
Grocery_Store_app/
├── lib/
│   ├── main.dart              # App entry point + Provider wiring
│   ├── models/                # Data models (e.g., GroceryItem)
│   ├── providers/             # State containers (CartProvider)
│   ├── screens/               # UI flows (home, cart, checkout)
│   └── widgets/               # Reusable presentation components
├── assets/
│   ├── data/grocery_items.json
│   └── images/*.png
├── app.mp4                    # Demo video
└── README.md
```

---

## Customizing
- **Catalog:** Update `assets/data/grocery_items.json` to add or edit products, then run `flutter pub get` to refresh the asset bundle.
- **Branding:** Adjust colors, fonts, and copy in `lib/screens/*.dart` or add themes via `ThemeData`.
- **State Logic:** Extend `CartProvider` with quantities, coupons, or remote sync as needed.

---

## Contributing
1. Fork the repository and create a feature branch.
2. Keep Flutter format/lints clean (`flutter format .`, `flutter analyze`).
3. Submit a pull request that includes screenshots or attach the updated `app.mp4` showcasing changes when UI is affected.

---

## License
This project is currently unlicensed. Add a license file if you intend to publish or share it publicly.
