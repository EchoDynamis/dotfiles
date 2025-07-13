import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "./Players.qml"
import "./Theme.qml" 

RowLayout {
    id: mediaDisplayRoot

    signal clicked()

    spacing: 10

    // Previous Button
    Button {
        id: prevButton
        Layout.preferredWidth: 40
        Layout.preferredHeight: 40
        background: Rectangle { color: "transparent" }
        Image {
            source: "assets/icons/previous.svg"
            anchors.fill: parent
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
        }
        onClicked: {
            if (Players.active && Players.active.canGoPrevious) {
                Players.active.previous()
            }
        }
    }

    // Media Info (Song Name - Artist Name)
    MouseArea {
        Layout.fillWidth: true
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
        Layout.preferredWidth: 40
        Layout.preferredHeight: 40
        background: Rectangle { color: "transparent" }
        Image {
            source: "assets/icons/next.svg"
            anchors.fill: parent
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
        }
        onClicked: {
            if (Players.active && Players.active.canGoNext) {
                Players.active.next()
            }
        }
    }
}
