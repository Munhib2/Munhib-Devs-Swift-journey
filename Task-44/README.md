# ⚡ Daily Focus – Modern iOS Quote App

A minimal, aesthetic, and modern SwiftUI iOS application designed to inspire and keep you focused every day. Built with a sleek dark glassmorphism design, real-time API integration, and full offline local storage support.

---

## 📸 Screenshots

| Home View | Saved Quotes | Native Sharing |
| :---: | :---: | :---: |
| <img src="screenshots/home.jpg" width="260" /> | <img src="screenshots/saved.jpg" width="260" /> | <img src="screenshots/share.jpg" width="260" /> |

---

## ✨ Features

- **🌐 Live Quote Fetching:** Fetches fresh inspirational quotes on demand using `ZenQuotes API`.
- **🛡️ Offline Fallback:** Includes a pre-built offline quote database so the app works seamlessly even without an active internet connection.
- **💾 Persistent Local Storage:** Built-in `UserDefaults` integration with `Codable` models keeps your saved quotes intact even after closing the app.
- **🎨 Glassmorphic Dark UI:** Native SwiftUI design with vibrant ambient glow gradients, custom typography, and responsive layouts.
- **📲 Native iOS Integration:** 
  - One-tap copy to clipboard using `UIPasteboard`.
  - Native iOS System Share sheet via `ShareLink`.
- **❤️ Favorites Management:** Save, organize, and view your favorite quotes in a clean grid layout with custom color accents.

---

## 🛠️ Tech Stack & Architecture

- **Language:** Swift 5+
- **Framework:** SwiftUI
- **Concurrency:** Swift Async/Await (`Task`, `URLSession`)
- **Persistence:** `UserDefaults` + `Codable`
- **Target OS:** iOS 16.0+

---
