import QtQuick
import Quickshell
import Quickshell.Hyprland
import "."

Text {
    id: indicator
    property var workspace
    visible: workspace.id >= 0

    // Determine if this workspace is the one currently focused.
    readonly property bool isActive: Hyprland.focusedWorkspace ? workspace.id === Hyprland.focusedWorkspace.id : false

    text: workspace.name
    color: isActive ? Theme.electricBlue : Theme.emerald
    font.family: Theme.fontFamilyText
    font.pixelSize: Theme.fontSizeBase

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            indicator.color = Theme.chartreuse
        }
        onExited: {
            indicator.color = isActive ? Theme.electricBlue : Theme.emerald
        }
        onClicked: {
            workspace.activate()
        }
    }

    // React to the focused workspace changing.
    Connections {
        target: Hyprland
        function onFocusedWorkspaceChanged() {
            // Update the color when the focused workspace changes
            indicator.color = isActive ? Theme.electricBlue : Theme.emerald
        }
    }
}
