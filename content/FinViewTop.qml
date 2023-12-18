import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: 300
    height: 40
    color: '#000000'

    // manipulable values
    property alias entity: entity.text
    property alias entityValue: amount.text

    GridLayout {
        anchors.fill: parent
        columns: 3
        rows: 1
        rowSpacing: 1
        columnSpacing: 1

        Text {
            id: entity
            font.pixelSize: 16
            color: '#FFFFFF'
            text: "BTC/USD"
            Layout.leftMargin: 20
            Layout.bottomMargin: 10
            Layout.preferredWidth: 150
        }

        Text {
            id: amount
            font.pixelSize: 14
            color: '#FFFFFF'
            text: "44004.99"
            Layout.rightMargin: 2
            Layout.bottomMargin: 3
        }

        Rectangle {
            width: 1
            height: 25
            color: 'gray'
            Layout.alignment: Qt.AlignBottom | Qt.AlignRight
        }
    }
}
