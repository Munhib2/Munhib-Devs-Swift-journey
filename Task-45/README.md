# 💬 Practice Quote App

A simple iOS app built with **SwiftUI** to practice fetching, parsing, and displaying quotes from JSON data. 

---

## 📱 Features
* **Random Quote Generator:** Tap the "New Quote" button to load a new quote.
* **JSON Parsing:** Decodes mock JSON data using Swift's `Codable` protocol.
* **Modern UI:** Built using SwiftUI with basic glassmorphic card design.

---

## 🛠️ Tech Stack & Concepts
* **Language:** Swift
* **Framework:** SwiftUI
* **Core Concepts:** 
  * `@State` property wrappers
  * `JSONDecoder` & Decodable models
  * Separation of concerns (Views, Models, and JSON data in separate files)

---

## 📂 Project Structure
```text
Quote App/
├── ContentView.swift    # User Interface & Button logic
├── backend.swift        # Quote model & JSON decoding function
├── json.swift           # Mock JSON dataset
└── Quote_AppApp.swift   # Main app entry point
