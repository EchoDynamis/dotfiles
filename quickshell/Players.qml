pragma Singleton


import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Singleton {
    id: playersRoot

    readonly property list<MprisPlayer> list: Mpris.players.values
    readonly property MprisPlayer active: list.find(p => p.identity === "youtube-music" || p.identity === "cider") ?? list[0] ?? null
}
