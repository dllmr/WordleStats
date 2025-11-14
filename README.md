# WordleStats

A desktop application for calculating detailed Wordle game statistics and performance metrics.

## Overview

WordleStats is a lightweight statistics calculator that helps Wordle players analyze their game performance. Enter your game history, and get instant insights including win percentage, average guesses, and performance ratios.

## Features

- **Win Percentage**: Calculate your overall success rate
- **Mean Score**: Average number of guesses per game
- **Performance Metrics**:
  - Relative performance compared to 4-guess baseline
  - Ratio of 3-guess wins to 4-guess wins
  - Ratio of 3-guess wins to 5-guess wins
- **Input Validation**: Ensures data consistency and prevents invalid calculations
- **Real-time Results**: Instant calculation with formatted numerical output

## Requirements

- **Linux**: Pre-compiled binary for x86-64 Linux systems
- **To Build from Source**:
  - [Lazarus IDE](https://www.lazarus-ide.org/) (includes Free Pascal Compiler)
  - LCL (Lazarus Component Library) - included with Lazarus

## Installation

### Building from Source

1. Open `WordleStats.lpi` in Lazarus IDE
2. Click **Run** → **Build** (or press Ctrl+F9)
3. The compiled executable will be in the project directory

## Usage

1. Launch the application
2. Enter your Wordle statistics:
   - **Games Played**: Total number of games attempted
   - **N1-N6**: Number of games solved in 1, 2, 3, 4, 5, and 6 guesses respectively
3. Click the **Calculate** button
4. View your calculated statistics:
   - Unsolved games count
   - Win percentage
   - Mean score (average guesses)
   - Relative performance to 4-guess baseline
   - Performance ratios

## How It Works

### Calculations

- **Unsolved Count**: `Games Played - (N1 + N2 + N3 + N4 + N5 + N6)`
- **Win Percentage**: `100 × (Games Played - Unsolved) / Games Played`
- **Mean Score**: `Total Guesses / Games Played`
  - Where Total Guesses = `1×N1 + 2×N2 + 3×N3 + 4×N4 + 5×N5 + 6×N6 + 7×Unsolved`
  - Unsolved games count as 7 guesses (beyond the 6-guess maximum)
- **Relative to 4 Guesses**: `Total Guesses - (Games Played × 4)`
  - Shows how your performance compares to always guessing in 4
- **Ratio 3:4**: `N3 / N4` - Efficiency metric comparing quick wins
- **Ratio 3:5**: `N3 / N5` - Performance spread indicator

### Input Validation

The application validates that:
- Games played is greater than 0
- All guess counts (N1-N6) are non-negative
- Calculated unsolved count is non-negative
- Results display "?" if inputs are invalid

## Project Structure

```
WordleStats/
├── WordleStats          # Compiled executable (Linux x86-64)
├── WordleStats.lpr      # Main program file
├── WordleStats.lpi      # Lazarus project configuration
├── umain.pas            # Main form unit with calculation logic
├── umain.lfm            # Form layout definition
├── WordleStats.ico      # Application icon
└── lib/                 # Compiled units and build artifacts
```

## Technology

- **Language**: Object Pascal (Free Pascal)
- **IDE**: Lazarus
- **GUI Framework**: LCL (Lazarus Component Library)
- **Platform**: Cross-platform (currently compiled for Linux)

## License

This project is licensed under the MIT License.

## Acknowledgments

Built for the Wordle community to help players track and analyze their game performance.
