# 📸 Instagram SwiftUI Demo – Copilot Agents Workshop

Welcome! This repository contains an iOS SwiftUI project designed for a hands-on workshop on **GitHub Copilot Agents**, rapid UI prototyping, and modern app architecture. The project demonstrates advanced SwiftUI techniques, dynamic localization, theme switching, UIKit-to-SwiftUI migration, and Figma-driven UI development.

---

## 🚀 Workshop Scope

You will learn how to:
- **Refactor UIKit views to SwiftUI**, including lifecycle translation.
- **Implement dynamic language switching** and full localization (English 🇺🇸 & Romanian 🇷🇴).
- **Add a theme switcher** for instant light/dark mode changes.
- **Build pixel-perfect views from Figma designs**, including asset integration.
- **Use Copilot Agents** to automate repetitive tasks and accelerate development.

---

## 🛠️ Requirements

- **macOS** with latest Xcode (15+ recommended)
- **Visual Studio Code** (**required**) with:
  - GitHub Copilot extension
  - Copilot Agents extension (for MCP/Figma integration)
- **Figma** account (for design handoff and asset export)
- Swift 5.9+ and iOS 17+ SDK

---

## 🏁 Getting Started

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd Instagram-Clone-SwiftUI-main
   ```

2. **Open in Xcode:**  
   Open `Instagram-SwiftUI.xcodeproj`.

3. **Open in VS Code:**  
   This is **required** for Copilot Agents and MCP/Figma integration. Open the project folder in Visual Studio Code.

4. **Run the app:**  
   Select a simulator and build/run as usual.

---

## 📚 Workshop Tasks

**Task 1: 🔧 Fix the “Back” Navigation Bug**  
Problem: From the Home screen, navigating to Messages leaves you stuck—no “Back” button.

**Task 2: ⚙️ UIKit → SwiftUI Refactor**  
Identify your old UIKit view.  
Scaffold a new View in SwiftUI.  
Replace the view controller instantiation with your SwiftUI view using `UIHostingController`.  
Pro-Tip: Use Copilot Agents to translate UIKit lifecycle methods into SwiftUI state and view modifiers.

**Task 3: 🌐 Add Localization & Language Switcher**  
Replace the “+” icon (Add Story/Post) with a language menu toggle.  
Extract all hard-coded strings into `Localizable.strings` keys for English 🇺🇸 and Romanian 🇷🇴.  
Goal: Show a menu instead of “+” and verify that UI text instantly updates.

**Task 4: 🎨 Theme Switcher**  
Remove the “Chat/Messages” icon and replace it with a light/dark mode toggle.  
On tap, immediately switch ColorScheme without a bottom sheet.
Ensure smooth, in-place theme changes.

**Task 5: 📱 Fetch data from Figma**  
Using MCP server fetch design assets from your Figma link.  
Download images, add them to your asset catalog.  
Build a new SwiftUI matching the Figma spec pixel-perfectly.


---

## ✨ Tips for the Live Demo

- Invoke Copilot Agents and switch between the desired models
- Have fun!