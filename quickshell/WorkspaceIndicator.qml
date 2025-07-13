import QtQuick
import Quickshell
import Quickshell.Hyprland
import "./Theme.qml" 

Text {
    id: indicator
    property var workspace
    visible: workspace.id >= 0
    property bool isHovered: false // New property to track hover state

    // Determine if this workspace is the one currently focused.
    readonly property bool isActive: Hyprland.focusedWorkspace ? workspace.id === Hyprland.focusedWorkspace.id : false

    text: workspace.name
    color: (isActive || isHovered) ? Theme.chartreuse : Theme.emerald // Color depends on active or hover state
    font.family: Theme.fontFamilyText
    font.pixelSize: Theme.fontSizeBase

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            indicator.isHovered = true
        }
        onExited: {
            indicator.isHovered = false
        }
        onClicked: {
            workspace.activate()
        }
    }
}
