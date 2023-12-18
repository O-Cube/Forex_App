import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import DataScrapping

Window {
    width: 600
    height: 800
    visible: true
    title: qsTr("Obed Stock Application")

    StockDisplay {
        anchors.fill: parent
    }
}
