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
        implicitWidth: 40
        implicitHeight: 40
        background: Rectangle { color: "transparent" }
        Image {
            id: prevImage
            source: prevButton.hovered ? "assets/icons/previous_chartreuse.svg" : "assets/icons/previous_emerald.svg"
            anchors.fill: parent
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
        }
        onClicked: {
            if (Players.active && Players.active.canGoPrevious) {
                Players.active.previous()
            }
        }
        onHoveredChanged: {
            console.log("Previous button hovered: " + prevButton.hovered);
        }
    }

    // Media Info (Song Name - Artist Name)
    MouseArea {
        Layout.preferredWidth: 400
        onClicked: mediaDisplayRoot.clicked()

        Text {
            id: mediaInfoText
            anchors.centerIn: parent
            text: {
                if (Players.active) {
                    return (Players.active.trackTitle || "Unknown Title") + " - " + (Players.active.trackArtist || "Unknown Artist")
                } else {
                    return "No media playing"
                }
            }
            color: Theme.emerald
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
        implicitWidth: 40
        implicitHeight: 40
        background: Rectangle { color: "transparent" }
        Image {
            id: nextImage
            source: nextButton.hovered ? "assets/icons/next_chartreuse.svg" : "assets/icons/next_emerald.svg"
            anchors.fill: parent
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
        }
        onClicked: {
            if (Players.active && Players.active.canGoNext) {
                Players.active.next()
            }
        }
        onHoveredChanged: {
            console.log("Next button hovered: " + nextButton.hovered);
        }
    }
}
