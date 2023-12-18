import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: 100
    height: 120

    GridLayout {
        anchors.centerIn: parent
        columns: 2
        rows: 4
        columnSpacing: 1
        rowSpacing: 1
        uniformCellHeights: true
        uniformCellWidths: true

        Text { font.pixelSize: 16; color: '#000000'; text: "(CYN/BTC) * (0.000001)" }
        Rectangle { width: 50; height: 4; color: '#A99909'; Layout.leftMargin: 10;}
        Text { font.pixelSize: 16; color: '#000000'; text: "(USD/JPY) * (0.001)" }
        Rectangle { width: 50; height: 4; color: '#2099A9'; Layout.leftMargin: 10;}
    }
}
