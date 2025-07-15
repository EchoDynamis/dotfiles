import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Players.qml"
import "./Theme.qml"

RowLayout {
    id: mediaDisplayRoot

    signal clicked()

    spacing: 10
    implicitWidth: 400
    implicitHeight: 50

    // Previous Button
    Button {
        id: prevButton
        implicitWidth: 20
        implicitHeight: 20
        background: Rectangle { color: "transparent" }
        Image {
            id: prevImage
            source: prevButton.hovered ? "assets/icons/previous_chartreuse.svg" : "assets/icons/previous_emerald.svg"
            anchors.fill: parent
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            sourceSize.width: 20
            sourceSize.height: 20
        }
        onClicked: {
            if (Players.active && Players.active.canGoPrevious) {
                Players.active.previous()
            }
        }
    }

    // Media Info (Song Name - Artist Name)
    MouseArea {
        id: metadataMouseArea
        Layout.preferredWidth: 400
        implicitHeight: 50 // Added implicitHeight
        hoverEnabled: true // Crucial for onEntered/onExited
        onClicked: mediaDisplayRoot.clicked()
        onEntered: {
            metadata.isHovered = true
        }
        onExited: {
            metadata.isHovered = false
        }

        Text {
            id: metadata
            property bool isHovered: false // New property
            anchors.centerIn: parent
            text: {
                if (Players.active) {
                    return (Players.active.trackTitle || "Unknown Title") + " - " + (Players.active.trackArtist || "Unknown Artist")
                } else {
                    return "No media playing"
                }
            }
            color: metadata.isHovered ? Theme.chartreuse : Theme.emerald // Bind to new property
            font.family: "Orbitron"
            font.pixelSize: 16 // Based on design language for 4K
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    // Next Button
    Button {
        id: nextButton
        implicitWidth: 20
        implicitHeight: 20
        background: Rectangle { color: "transparent" }
        Image {
            id: nextImage
            source: nextButton.hovered ? "assets/icons/next_chartreuse.svg" : "assets/icons/next_emerald.svg"
            anchors.fill: parent
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            sourceSize.width: 20
            sourceSize.height: 20
        }
        onClicked: {
            if (Players.active && Players.active.canGoNext) {
                Players.active.next()
            }
        }
    }
}
