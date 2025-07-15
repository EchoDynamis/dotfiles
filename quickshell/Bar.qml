import Quickshell
import QtQuick
import "."
import "./Theme.qml"
import "./MediaWidget.qml"

Scope {

  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: Theme.implicitHeightUi

      Rectangle {
          anchors.fill: parent
          color: Theme.black
      }

      Image {
        id: icon
        source: "assets/icons/arch_emerald.svg"
        height: parent.height - 10
        width: height
        fillMode: Image.PreserveAspectFit
        anchors {
          left: parent.left
          leftMargin: 10
          verticalCenter: parent.verticalCenter
        }
        
        MouseArea {
          anchors.fill: parent
          hoverEnabled: true
          onEntered: {
            icon.source = "assets/icons/arch_chartreuse.svg"
          }
          onExited: {
            icon.source = "assets/icons/arch_emerald.svg"
          }
          onClicked: {
            console.log("Arch logo clicked. Toggling PowerMenu visibility.");
            powerMenuInstance.visible = !powerMenuInstance.visible
          }
        }
      }

      Workspaces {
        id: workspaces
        anchors {
            left: icon.right
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
      }

      MediaDisplay {
          id: mediaDisplay
          anchors.centerIn: parent
          onClicked: {
              console.log("MediaDisplay clicked, toggling MediaWidget visibility.")
              mediaWidgetInstance.visible = !mediaWidgetInstance.visible
          }
      }

      ClockWidget {
        id: clockWidget // Added ID for anchoring
        anchors {
          right: parent.right
          rightMargin: 10
          verticalCenter: parent.verticalCenter
        }
      }

      PowerMenu {
        id: powerMenuInstance
        visible: false
        anchor.item: icon
        anchor.rect.x: icon.width / 2 - width / 2
        anchor.rect.y: icon.height + 8
      }

      MediaWidget {
          id: mediaWidgetInstance
          visible: false
          anchor.item: mediaDisplay
          anchor.rect.x: mediaDisplay.width / 2 - mediaWidgetInstance.implicitWidth / 2
          anchor.rect.y: mediaDisplay.height + 8
      }
    }
  }
}
