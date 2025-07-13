import QtQuick
import "."

Text {
  id: clockText
  text: Time.time
  color: Theme.emerald
  font {
    family: Theme.fontFamilyHeaders // Using Orbitron for the clock
    pixelSize: Theme.fontSizeBase
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    onEntered: {
      clockText.color = Theme.chartreuse
    }
    onExited: {
      clockText.color = Theme.emerald
    }
  }
}
