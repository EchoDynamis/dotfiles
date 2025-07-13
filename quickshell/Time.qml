pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property string time: {
    Qt.formatDateTime(clock.date, "MM/dd/yy 🌎 HH:mm")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
