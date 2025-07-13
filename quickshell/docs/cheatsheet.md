# QuickShell Cheatsheet

## Directory Structure

*   `/home/echodynamis/.config/quickshell/`
    *   `Bar.qml`: Defines the top bar of the QuickShell UI.
    *   `ClockWidget.qml`: Clock component.
    *   `guide.md`: General guide.
    *   `MediaDisplay.qml`: Displays concise media info and controls on the bar.
    *   `MediaWidget.qml`: Detailed media control popup.
    *   `Players.qml`: Singleton for MPRIS player management.
    *   `PowerMenu.qml`: Power control menu.
    *   `PowerMenuItem.qml`: Individual item within the PowerMenu.
    *   `shell.qml`: Main entry point/top-level QML file.
    *   `THEME.md`: Theme documentation.
    *   `Theme.qml`: QML file defining theme properties (colors, fonts, etc.).
    *   `Time.qml`: Time component.
    *   `WorkspaceIndicator.qml`: Workspace indicator component.
    *   `Workspaces.qml`: Workspaces component.
    *   `assets/`: Contains static assets like icons and images.
    *   `docs/`: Documentation files.
    *   `SAMPLES/`: Sample QML files.

## Key Components & Their Roles

*   **`shell.qml`**: The root QML file that loads and arranges major UI components.
*   **`Bar.qml`**: The primary top bar, containing elements like the clock, workspace indicator, and `MediaDisplay`.
*   **`MediaDisplay.qml`**: A compact media control widget designed for the `Bar`. It shows basic track info and playback controls (previous/next) and can trigger the `MediaWidget` popup.
*   **`MediaWidget.qml`**: A more comprehensive media control interface, intended to appear as a popup. It features album art, detailed track information, a progress slider, and full playback controls.
*   **`Players.qml`**: A QML singleton that provides an interface to MPRIS (Media Player Remote Interfacing Specification) services, allowing access to active media players and their properties (track title, artist, album art, playback state, etc.).
*   **`Theme.qml`**: Centralizes design tokens such as colors (`Theme.emerald`, `Theme.chartreuse`, `Theme.veronica`, `Theme.black`, `Theme.darkGrey`, `Theme.silver`), and potentially font definitions, ensuring consistency across the UI.
*   **`PowerMenu.qml`**: A popup menu for system power controls and shortcuts.
*   **`PowerMenuItem.qml`**: A reusable component for individual items within the `PowerMenu`.

## Custom Components (from provided sample)

*   **`ElideText`**: A custom `Text` component that handles text truncation (eliding) when content exceeds available space. It likely wraps `QtQuick.Text` and `QtQuick.TextMetrics`.
*   **`Control`**: A custom `Button`-like component, likely encapsulating visual states (normal, hovered, clicked) and handling icon display with specific styling (e.g., `StyledRect`, `MaterialIcon`). It provides properties like `icon`, `canUse`, `fontSize`, `padding`, `fill`, `primary`.
*   **`StyledRect`**: A custom `Rectangle` component with predefined styling (e.g., colors, radii, shadows) for consistent visual elements.
*   **`MaterialIcon`**: A component for displaying icons, likely from a Material Design icon font or SVG assets, with properties for `grade`, `text` (icon name), `color`, and `font.pointSize`.

## Layout Managers Used

*   **`ColumnLayout`**: Arranges items vertically.
*   **`RowLayout`**: Arranges items horizontally.
*   **`GridLayout`**: Arranges items in a grid, allowing for more complex two-dimensional layouts.
*   **`Item`**: A basic visual item that can be used as a container for other items, often used with `anchors` for flexible positioning.

## Common Properties & Concepts

*   **`Layout.fillWidth: true` / `Layout.fillHeight: true`**: Instructs an item within a `Layout` to expand to fill available space in that dimension.
*   **`anchors.*`**: Properties used to position and size items relative to their parent or sibling items (e.g., `anchors.fill`, `anchors.left`, `anchors.right`, `anchors.verticalCenter`).
*   **`implicitWidth` / `implicitHeight`**: The preferred size of an item based on its content. Layouts often use these to determine initial sizing.
*   **`onHoveredChanged`**: A signal handler for `MouseArea` or `Button` that triggers when the mouse enters or leaves the item, useful for hover effects.
*   **`MprisPlaybackState`**: An enum from `Quickshell.Services.Mpris` representing the current playback state of a media player (e.g., `Playing`, `Paused`, `Stopped`).
*   **`player.trackArtUrl`**: Property from `MprisPlayer` providing the URL to the album art.
*   **`player.trackTitle` / `player.trackArtist` / `player.trackAlbum`**: Properties from `MprisPlayer` providing metadata.
*   **`player.canGoPrevious` / `player.canGoNext` / `player.canTogglePlaying`**: Boolean properties indicating if a player supports these actions.
*   **`player.previous()` / `player.next()` / `player.togglePlaying()`**: Methods to control playback.

## Troubleshooting Tips

*   **Layout Issues**: Check parent `Layout` properties (`Layout.fillWidth`, `Layout.preferredWidth`, `spacing`) and ensure sufficient space is available. Consider using `GridLayout` for complex arrangements or `anchors` for precise relative positioning.
*   **Missing Types**: Verify `import` statements are correct and that the QML files are in the expected paths.
*   **Icon/Image Issues**: Ensure `source` paths are correct and that SVG files are properly formatted (e.g., `fill` attributes for color changes).
*   **Deprecation Warnings**: Replace `width`/`height` with `implicitWidth`/`implicitHeight` where appropriate, especially for root elements of components.