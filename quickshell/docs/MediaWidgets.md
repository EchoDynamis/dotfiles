# Media Widget Development Log

This document tracks the development process for the new MPRIS media widgets in Quickshell.

## Phase 1: MediaDisplay in Bar

**Goal:** Create a central component in `Bar.qml` to display current track information and provide basic controls.

**Plan:**

1.  **Create `Players.qml` Singleton:**
    *   A singleton component to manage MPRIS player instances.
    *   It will find the active player (e.g., YouTube Music, Cider, Spotify).
    *   It will expose the active player's metadata (track title, artist, art URL) and controls (next, previous, play/pause).
    *   This will be based on the provided `Players.qml` sample.

2.  **Create `MediaDisplay.qml`:**
    *   A new QML file for the bar's center module.
    *   It will display `trackTitle` and `trackArtist` from the `Players.qml` singleton.
    *   It will feature "previous" and "next" buttons using `previous.svg` and `next.svg`.
    *   The main text area will be clickable, emitting a signal to open the `MediaWidget`.

3.  **Integrate into `Bar.qml`:**
    *   Add `MediaDisplay.qml` to the central area of the `Bar.qml` layout.
    *   Implement the logic to listen for the click signal.

## Phase 2: MediaWidget Popup

**Goal:** A full-featured media control popup window.

**Plan:**

1.  **Create `MediaWidget.qml`:**
    *   A `PopupWindow` that appears when the `MediaDisplay` text is clicked.
    *   **Layout:**
        *   **Left:** 500x500 album art (`trackArtUrl`).
        *   **Right:**
            *   Track Title & Artist.
            *   Track progress slider (representing `position` and `length`).
            *   Control buttons: Previous, Play/Pause, Next.
    *   **Functionality:**
        *   The progress slider will require a `Timer` to update the track `position` property, as it's not updated reactively by the service.
        *   Controls will call the appropriate methods on the active player via the `Players.qml` singleton.

---
**Log:**

*   **[Timestamp]** - Initializing project. Creating `MediaWidgets.md`.
*   **[2025-07-12]** - Created `Players.qml` singleton to manage MPRIS players, prioritizing "youtube-music" and "cider".
*   **[2025-07-12]** - Created `MediaDisplay.qml` with track title/artist display and previous/next buttons. Added `onClicked` signal.
*   **[2025-07-12]** - Integrated `MediaDisplay.qml` into `Bar.qml` as the center module. Added placeholder `console.log` for `onClicked` signal.
*   **[2025-07-12]** - Created `MediaWidget.qml` with album art, track info, progress slider, and media controls.
*   **[2025-07-12]** - Integrated `MediaWidget.qml` into `Bar.qml` and connected its visibility to `MediaDisplay.onClicked`.
*   **[2025-07-12]** - Created `play.svg` and `pause.svg` icons in `assets/icons` directory.
*   **[2025-07-12]** - **FIXED:** Corrected `Players.qml` by adding missing `import` statements to resolve `Singleton is not a type` error and subsequent QML loading failures.
*   **[2025-07-12]** - **FIXED:** Removed `color` property from `Image` elements in `MediaDisplay.qml` as SVG tinting is not supported directly. Icons will now use their default embedded colors.
*   **[2025-07-12]** - **FIXED:** Removed `color` property from `Image` elements in `MediaWidget.qml` for the same reason as `MediaDisplay.qml`.
*   **[2025-07-12]** - **FIXED:** Added `import QtQuick` and `import "."` to `shell.qml` to resolve `Type Bar unavailable` error.
