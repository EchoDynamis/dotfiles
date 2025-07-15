import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell.Hyprland
import "./Players.qml"
import "./Theme.qml"

PopupWindow {
    id: mediaWidgetRoot
    visible: false
    color: Theme.black

    property string currentTimeDisplay: "0:00 / 0:00" // New property for time display

    // HyprlandWindow.opacity: 0.7

    readonly property MprisPlayer player: Players.active

    implicitWidth: 800 // Example width, adjust as needed
    implicitHeight: 750 // Expanded height to fit all controls

    function formatTime(seconds) {
        const minutes = Math.floor(seconds / 60);
        const remainingSeconds = Math.floor(seconds % 60);
        return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
    }

    

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        // Album Cover
        Image {
            id: albumArt
            Layout.preferredWidth: 500
            Layout.preferredHeight: 500
            source: player ? player.trackArtUrl : ""
            fillMode: Image.PreserveAspectFit
            sourceSize.width: 500
            sourceSize.height: 500
            Layout.alignment: Qt.AlignHCenter // Center the album art
            // Placeholder if no album art
            Rectangle {
                anchors.fill: parent
                color: Theme.darkGrey
                visible: !albumArt.source
                Text {
                    anchors.centerIn: parent
                    text: "No Album Art"
                    color: Theme.silver
                    font.pixelSize: 20
                }
            }
        }

        // Media Controls (Previous, Song Title, Next)
        GridLayout {
            Layout.fillWidth: true
            columns: 3

            Button {
                id: prevButton
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                background: Rectangle { color: "transparent" }
                Image {
                    id: prevImage
                    source: "assets/icons/previous_emerald.svg"
                    anchors.fill: parent
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }
                onClicked: {
                    if (player && player.canGoPrevious) {
                        player.previous()
                    }
                }
                onHoveredChanged: {
                    prevImage.source = hovered ? "assets/icons/previous_chartreuse.svg" : "assets/icons/previous_emerald.svg"
                }
            }

            Text {
                id: trackInfoText
                Layout.fillWidth: true
                text: player ? (player.trackTitle || "Unknown Title") + " - " + (player.trackArtist || "Unknown Artist") : "No media playing"
                color: Theme.emerald
                font.family: "Orbitron"
                font.pixelSize: 24
                font.bold: true
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }

            Button {
                id: nextButton
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                background: Rectangle { color: "transparent" }
                Image {
                    id: nextImage
                    source: "assets/icons/next_emerald.svg"
                    anchors.fill: parent
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                }
                onClicked: {
                    if (player && player.canGoNext) {
                        player.next()
                    }
                }
                onHoveredChanged: {
                    nextImage.source = hovered ? "assets/icons/next_chartreuse.svg" : "assets/icons/next_emerald.svg"
                }
            }
        }

        // Play/Pause Button
        Button {
            id: playPauseButton
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 60
            Layout.preferredHeight: 60
            background: Rectangle { color: "transparent" }
            Image {
                source: player && player.playbackState === MprisPlaybackState.Playing ? "assets/icons/pause.svg" : "assets/icons/play.svg"
                anchors.fill: parent
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
            }
            onClicked: {
                if (player && player.canTogglePlaying) {
                    player.togglePlaying()
                }
            }
        }

        // Progress Slider
        Slider {
            id: progressSlider
            Layout.fillWidth: true
            from: 0
            to: player ? player.length : 0
            value: player ? player.position : 0
            stepSize: 1
            live: true // Update value as user drags
            onMoved: {
                if (player && player.canSeek) {
                    player.seek(value)
                }
            }
            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 4
                color: Theme.darkGrey
                radius: 2
                Rectangle {
                    width: progressSlider.visualPosition * parent.width
                    height: parent.height
                    color: Theme.emerald
                    radius: 2
                }
            }
            handle: Rectangle {
                x: progressSlider.leftPadding + progressSlider.visualPosition * (progressSlider.availableWidth - width)
                y: progressSlider.topPadding + progressSlider.availableHeight / 2 - height / 2
                implicitWidth: 16
                implicitHeight: 16
                radius: 8
                color: Theme.veronica
            }
        }

        // Current Time / Total Time
        Text {
            Layout.fillWidth: true
            text: mediaWidgetRoot.currentTimeDisplay
            color: Theme.silver
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
        }
    }

    // Timer to update position
    Timer {
        id: positionUpdateTimer
        interval: 1000 // Update every second
        repeat: true
        running: player && player.playbackState === MprisPlaybackState.Playing
        onTriggered: {
            
            if (player && player.positionSupported) {
                progressSlider.value = player.position;
                mediaWidgetRoot.currentTimeDisplay = mediaWidgetRoot.formatTime(player.position) + " / " + mediaWidgetRoot.formatTime(player.length);
            } else {
                mediaWidgetRoot.currentTimeDisplay = "0:00 / 0:00"; // Reset if no player
            }
        }
    }
}