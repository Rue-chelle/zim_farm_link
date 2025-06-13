# 🌾 ZimFarmLink

![Work in Progress](https://img.shields.io/badge/status-in--development-yellow)
![Flutter](https://img.shields.io/badge/built%20with-Flutter-blue)
> ⚠️ **Note:** This project is currently under active development. Some features may be incomplete or subject to change.

**ZimFarmLink** is a mobile application built with **Flutter** to empower Zimbabwean farmers and agribusinesses. It connects producers, buyers, and experts through a smart agricultural platform that works both **online and offline**.

---

## 🚀 Features

- 🛒 **Marketplace**  
  Buy and sell crops, livestock, and farming equipment locally.

- 🤖 **AI Assistant**  
  Diagnose plant diseases by uploading a photo, get smart planting recommendations (coming soon).

- 👥 **Community**  
  Engage with other farmers, share tips, and stay informed.

- 📋 **Profile & Listings**  
  Manage your listings and edit your personal farmer profile.

- 📶 **Offline Support**  
  Browse saved content and add listings offline (syncs when online).


---

## 🛠️ Tech Stack

- **Frontend**: Flutter & Dart  
- **State Management**: `setState` (MVP), future: Riverpod or Bloc  
- **Backend**: Supabase / Firebase (future integration)  
- **Image Handling**: image_picker  
- **Offline DB**: `sqflite` (optional)

---

## 📦 Installation

```bash
# 1. Clone the repo
git clone https://github.com/your-username/zimfarmlink.git
cd zimfarmlink

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```
## 🧪 Development Notes

- Uses image_picker to upload listing or plant images.

- UI follows a clean, modern aesthetic with consistent color and spacing.

-  Navigation is handled via named routes (/addListing, etc).

- Works well on both Android and iOS.

## 📂 Project Structure (Simplified)
```
lib/
├── main.dart
├── app_routes.dart
├── views/
│   ├── auth/               # Login and Register screens
│   ├── home/               # Home with bottom navigation
│   ├── marketplace/        # Marketplace & Add Listing
│   ├── assistant/          # AI assistant feature
│   ├── community/          # Community discussions (placeholder)
│   └── profile/            # User profile and settings
├── widgets/                # Reusable UI components
└── models/                 # Data models (future)
```
## 🧑‍💻 Contributing

Got a feature in mind? Found a bug? Fork the repo and open a pull request!

  - 🍴 Fork it

- 👯 Clone it

- 🔧 Create your feature branch (git checkout -b feature/AmazingFeature)

- 🧪 Commit your changes (git commit -m 'Add some AmazingFeature')

- 🚀 Push to the branch (git push origin feature/AmazingFeature)

- 📝 Open a Pull Request


## 🌍 Built With ❤️ in Zimbabwe by Michelle "Alora" Samuriwo


