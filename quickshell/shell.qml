import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

import Quickshell.Hyprland

PanelWindow {
  id: shell
  color: Theme.black
  HyprlandWindow.opacity: 0.0 // Make the background fully transparent

  Bar {
    id: bar
  }
}