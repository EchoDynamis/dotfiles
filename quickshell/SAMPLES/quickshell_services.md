# Quickshell.Services.Mpris Documentation

**Docs Version:** Release 0.1.0

---

## Overview

The `Quickshell.Services.Mpris` module provides an interface to media players via the [MPRIS](https://specifications.freedesktop.org/mpris-spec/latest/) (Media Player Remote Interfacing Specification). It allows access to playback control, metadata, and player capabilities.

> **Warning:** MPRIS support varies greatly across media players. Always verify `canXyz` and `xyzSupported` properties before using associated functionality.

> **Note:** The `TrackList` and `Playlist` interfaces are not implemented due to lack of support in available media players.

---

## Classes & Types

### Mpris

**Type:** `QtObject`, **Singleton**

```qml
import Quickshell.Services.Mpris
```

#### Properties:

- `players: ObjectModel<MprisPlayer>` (readonly) — List of connected MPRIS players.

---

### MprisPlayer

**Type:** `QtObject`, **Uncreatable**

```qml
import Quickshell.Services.Mpris
```

A media player exposed over MPRIS.

#### Boolean Capabilities (readonly unless stated otherwise):

- `canControl`
- `canGoNext`
- `canGoPrevious`
- `canPause`
- `canPlay`
- `canQuit`
- `canRaise`
- `canSeek`
- `canSetFullscreen`
- `canTogglePlaying`

#### State & Control Properties:

- `dbusName: string` — DBus service name of the player.
- `desktopEntry: string` — Name of the desktop entry, or empty.
- `fullscreen: bool` — Settable only if `canSetFullscreen` is true.
- `identity: string` — Human-readable name of the player.
- `isPlaying: bool` — True if `playbackState == MprisPlaybackState.Playing`.
- `length: real` — Track length in seconds (or `position` if `lengthSupported` is false).
- `lengthSupported: bool`
- `loopState: MprisLoopState` — Settable if `canControl` and `loopSupported`.
- `loopSupported: bool`
- `maxRate: real`
- `metadata: unknown` — Current track metadata.
- `minRate: real`
- `playbackState: MprisPlaybackState`
- `position: real` — Settable if `canSeek` and `positionSupported`.
- `positionSupported: bool`
- `rate: real` — Speed multiplier (between `minRate` and `maxRate`).
- `shuffle: bool` — Settable if `canControl` and `shuffleSupported`.
- `shuffleSupported: bool`
- `supportedMimeTypes: list<string>`
- `supportedUriSchemes: list<string>`
- `trackAlbum: string`
- `trackAlbumArtist: string`
- `trackArtUrl: string`
- `trackArtist: string`
- `trackArtists: string` — *Deprecated*, use `trackArtist` instead.
- `trackTitle: string`
- `uniqueId: int` — Opaque, unique identifier within current player.
- `volume: real` — Range from 0.0 to 1.0; settable if `canControl` and `volumeSupported`.
- `volumeSupported: bool`

#### Helper Tips:

```qml
player.trackTitle || "Unknown Title"
player.trackAlbum || "Unknown Album"
player.trackAlbumArtist || "Unknown Album"
player.trackArtist || "Unknown Artist"
```

#### Notes on `position` Updates:

Position does not update reactively unless manually monitored.

```qml
FrameAnimation {
  running: player.playbackState == MprisPlaybackState.Playing
  onTriggered: player.positionChanged()
}
Timer {
  running: player.playbackState == MprisPlaybackState.Playing
  interval: 1000
  repeat: true
  onTriggered: player.positionChanged()
}
```

#### Methods:

- `next(): void` — Play next track. Requires `canGoNext`.
- `openUri(uri: string): void` — Open URI. Often ignored by players.
- `pause(): void` — Pause playback.
- `play(): void` — Start/resume playback.
- `previous(): void` — Go to previous track. Requires `canGoPrevious`.
- `quit(): void` — Quit player. Requires `canQuit`.
- `raise(): void` — Bring player window to front. Requires `canRaise`.
- `seek(offset: real): void` — Seek by offset. Requires `canSeek`.
- `stop(): void` — Stop playback.
- `togglePlaying(): void` — Toggle play/pause. Requires `canTogglePlaying`.

---

### MprisPlaybackState

**Type:** `QtObject`, **Enum**

```qml
import Quickshell.Services.Mpris
```

Used with `MprisPlayer.playbackState`.

#### Enum Values:

- `Paused`
- `Playing`
- `Stopped`

#### Method:

- `toString(status: MprisPlaybackState): string`

---

### MprisLoopState

**Type:** `QtObject`, **Enum**

```qml
import Quickshell.Services.Mpris
```

Used with `MprisPlayer.loopState`.

#### Enum Values:

- `None`
- `Playlist`
- `Track`

#### Method:

- `toString(status: MprisLoopState): string`

---

## Credits

- **Lead Developer:** outfoxxed
- **Website Developer/Designer:** xanazf
- **Contributors:** Community

