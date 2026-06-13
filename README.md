# 🎮 Assembly Endgame — Flutter

A Flutter rebuild of the classic "Assembly Endgame" word-guessing game (Hangman-style), built to practice **Riverpod state management** and clean, scalable app architecture.

> This is the Flutter counterpart to the [React version](https://github.com/amirmhmdi/assembly-endgame-react) — same game, same logic, ported to a cross-platform Flutter app with proper state management instead of basic component state.

🔗 **[Live Demo](https://amirmhmdi.github.io/assembly-endgame-flutter/)**

## ✨ Features

- **Word guessing gameplay** — guess letters to reveal a hidden word before running out of attempts
- **Hangman-style progression** — incorrect guesses are tracked visually, raising the stakes with each wrong answer
- **Programming language theme** — each wrong guess "eliminates" a programming language, complete with farewell messages
- **Win / lose / playing states** — full game state machine with clear UI feedback for every outcome
- **Responsive UI** — adapts cleanly across mobile, web, and desktop screen sizes
- **Riverpod state management** — game logic is fully decoupled from the UI via providers

## 🛠 Tech Stack

- **Flutter** (Dart)
- **Riverpod** for state management
- Cross-platform targets: Android, iOS, Web, Windows, macOS, Linux

## 📂 Project Structure

```
lib/
├── main.dart              # App entry point
├── provider/
│   └── game_state.dart    # Game logic & state, managed via Riverpod
├── presentation/           # UI screens and widgets
└── utils/                   # Static data (languages, word list, helpers)
```

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and configured

### Installation

```bash
git clone https://github.com/amirmhmdi/assembly-endgame-flutter.git
cd assembly-endgame-flutter
flutter pub get
```

### Run the app

```bash
flutter run
```

## 🔗 Related Project

Check out the [React version of this game](https://github.com/amirmhmdi/assembly-endgame-react) — same concept, built with React to compare state management approaches across frameworks.
