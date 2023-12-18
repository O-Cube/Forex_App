import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "."

Rectangle {
    width: 300
    height: 40
    color: '#000000'

    // arrow color
    property bool arrowColor: false
    // text color
    property bool textColor: false
    // manipulable values
    property alias amtPercenatage: amtPercentage.text
    property alias amt: amt.text

    GridLayout {
        anchors.fill: parent
        columns: 4
        rows: 1
        rowSpacing: 1
        columnSpacing: 1

        Image {
            id: image
            source: arrowColor ? "../images/green_arrow.png" : "../images/red_arrow.png"
            Layout.alignment: Qt.AlignRight
        }

        Text {
            id: amtPercentage
            Layout.preferredWidth: 30
            font.pixelSize: 20
            color: textColor ? '#0BFA0B' : '#F7071B'
            text: "1.17%"
        }

        Text {
            id: amt
            font.pixelSize: 16
            color: textColor ? '#0BFA0B' : '#F7071B'
            text: "(-26.91)"
            Layout.alignment: Qt.AlignLeft
        }

        Rectangle {
            width: 1
            height: 25
            color: 'gray'
            Layout.alignment: Qt.AlignTop | Qt.AlignRight
        }
    }
}
