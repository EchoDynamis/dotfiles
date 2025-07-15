import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

PanelWindow {
  id: shell

  property bool mediaWidgetVisible: false

  Bar {
    id: bar
    onMediaDisplayClicked: {
      shell.mediaWidgetVisible = !shell.mediaWidgetVisible
      if (shell.mediaWidgetVisible) {
        mediaWidget.raise()
      }
    }
  }

  MediaWidget {
    id: mediaWidget
    visible: shell.mediaWidgetVisible
    anchor.window: shell
    anchor.rect.x: parent.width / 2 - width / 2
    anchor.rect.y: parent.height / 2 - height / 2
  }
}