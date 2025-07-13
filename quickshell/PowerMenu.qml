import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Hyprland

import "."

PopupWindow {
    id: powerMenu
    implicitWidth: 400
    implicitHeight: 300
    color: Theme.black
    visible: false

    // Apply Hyprland blur and opacity
    HyprlandWindow.opacity: 0.7

    // Debugging: Log visibility and dimensions
    onVisibleChanged: {
        console.log("PowerMenu visible: " + visible + ", width: " + width + ", height: " + height);
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // Shortcuts Section
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Theme.darkGrey
            radius: 8 // Rounded corners
            border.color: Theme.veronica // Border color
            border.width: 1 // Border width

            ColumnLayout {
                anchors.fill: parent
                spacing: 10

                // Neovim Shortcut
                PowerMenuItem {
                    iconSource: "assets/icons/neovim_emerald.svg"
                    iconHoverSource: "assets/icons/neovim_chartreuse.svg"
                    text: "Neovim"
                    onClicked: {
                        console.log("Launching Neovim...");
                        Quickshell.runCommand("xdg-open ~/.local/share/applications/nvim.desktop")
                    }
                }
            }
        }

        // Power Controls Section
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Theme.darkGrey
            radius: 8 // Rounded corners
            border.color: Theme.veronica // Border color
            border.width: 1 // Border width

            RowLayout {
                anchors.fill: parent
                spacing: 10

                PowerMenuItem {
                    iconSource: "assets/icons/lock_emerald.svg"
                    iconHoverSource: "assets/icons/lock_chartreuse.svg"
                    text: "Lock"
                    onClicked: {
                        console.log("Locking session...");
                        Quickshell.runCommand("loginctl lock-session") // Example command, adjust as needed
                    }
                }

                PowerMenuItem {
                    iconSource: "assets/icons/reboot.svg"
                    iconHoverSource: "assets/icons/reboot_chartreuse.svg"
                    text: "Reboot"
                    onClicked: {
                        console.log("Rebooting system...");
                        Quickshell.runCommand("systemctl reboot") // Example command, adjust as needed
                    }
                }

                PowerMenuItem {
                    iconSource: "assets/icons/power.svg"
                    iconHoverSource: "assets/icons/power_chartreuse.svg"
                    text: "Shutdown"
                    onClicked: {
                        console.log("Shutting down system...");
                        Quickshell.runCommand("systemctl poweroff") // Example command, adjust as needed
                    }
                }
            }
        }
    }
}