# Music Player Card

A simple SwiftUI music player card that loads song information from JSON and displays it in a clean music-player interface.

## What I Learned

- Creating a `Decodable` model for JSON data
- Using `JSONDecoder()` to decode JSON
- Loading decoded data into SwiftUI `@State` properties
- Using `@State` to manage changing UI state
- Using `toggle()` with a Boolean state
- Creating Play/Pause functionality
- Updating UI automatically based on state
- Using conditional expressions to change SF Symbols
- Building interactive SwiftUI buttons
- Passing `@State` properties into a function using `inout`

## Features

- Displays song title and artist
- Displays current playback time and total duration
- Play/Pause button
- Dynamic Play/Pause SF Symbol
- Playing/Paused status
- Previous and Next buttons
- Loads music information from JSON
- Clean SwiftUI music-player interface

## Data Model

The project uses a `Music` struct conforming to `Decodable`:

- `title`
- `artist`
- `currentTime`
- `duration`

## Project

The app demonstrates how decoded JSON data can be connected to a SwiftUI interface while separately managing interactive UI state with `@State`.
