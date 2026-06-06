# Assembly Endgame

A Flutter-based word guessing game where players try to guess a secret word by identifying its constituent letters. The game features a hangman-style progression, tracking incorrect guesses with visual indicators.

## Features

- **Word Guessing**: Players guess letters to reveal a hidden word.
- **Hangman Progression**: Incorrect guesses are tracked, with visual feedback for each loss.
- **Language Support**: The game includes a list of languages with associated colors and farewell messages.
- **Game States**: Supports multiple game states including playing, game over, and win.
- **Responsive UI**: The interface adapts to different screen sizes.

## Getting Started

### Prerequisites

- Flutter SDK installed and configured.

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd assembly_endgame
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

Start the application using Flutter:

```bash
flutter run
```

## Project Structure

The project is organized into the following main directories:

- `lib/main.dart`: Entry point of the application.
- `lib/provider/game_state.dart`: Manages the game state and logic.
- `lib/presentation/`: Contains all UI widgets and screens.
- `lib/utils/`: Includes utility functions and data (languages, words).

