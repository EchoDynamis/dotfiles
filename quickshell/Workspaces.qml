import QtQuick
import Quickshell
import Quickshell.Hyprland
import "."

Row {
    spacing: 15

    Repeater {
        model: Hyprland.workspaces

        delegate: WorkspaceIndicator {
            workspace: modelData
        }
    }

    // Hyprland doesn't always emit signals for workspace changes,
    // so we poll for updates periodically.
    Timer {
        interval: 500 // milliseconds
        running: true
        repeat: true
        onTriggered: Hyprland.refreshWorkspaces()
    }
}