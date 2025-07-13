import QtQuick
import QtQuick.Layouts
import "."

Column {
    id: root
    property string iconSource: ""
    property string iconHoverSource: ""
    property string text: ""
    signal clicked

    Layout.preferredHeight: iconImage.height + textElement.implicitHeight + spacing
    Layout.preferredWidth: Math.max(iconImage.width, textElement.implicitWidth)

    spacing: 5 // Spacing between icon and text

    Image {
        id: iconImage
        source: root.iconSource
        width: 40
        height: 40
        fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: textElement
        text: root.text
        color: Theme.emerald
        font.family: Theme.fontFamilyText
        font.pixelSize: Theme.fontSizeBase
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            console.log("Mouse entered: " + root.text);
            iconImage.source = root.iconHoverSource
            textElement.color = Theme.chartreuse
        }
        onExited: {
            console.log("Mouse exited: " + root.text);
            iconImage.source = root.iconSource
            textElement.color = Theme.emerald
        }
        onClicked: {
            console.log("PowerMenuItem clicked: " + root.text);
            root.clicked()
        }
    }
}