// stock information StockInfoBlock
// display figurative information about stock entity

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: rect
    width: 200
    height: 60
    color: '#000000'

    // determines arrow to display; true = green, false = red
    property bool changeColor: true
    // stock name
    property alias commodity: stockName.text
    // stock value
    property alias commodityValue: stockValue.text
    // stock percentage
    property alias percentageChange: stockPercent.text
    // sock net changeColor:
    property alias commodityNetChange: stockNet.text
    // array to store last 100 values
    property real lastHundredValues: [100]
    // stores number of values in recent values array
    property int numberValues: 0

    // calculates currency value with respect to USD
    function convertCurrencyValue(value) {
        return 1 / value;
    }
    // add most recent forex value / stock value into 100 recent values array
    function addValue(value) {
        for (var i = 99; i > 0; i--) {
            lastHundredValues[i] = lastHundredValues[i-1];
        }
        // add value to 0 index
        lastHundredValues[0] = value;
    }
    // percentage change in value
    function percentageChangeInValue() {
        return ((lastHundredValues[0] - lastHundredValues[1]) / lastHundredValues[1]) * 100;
    }
    // change text color of display
    function changeTextColor() {
        if ((lastHundredValues[0] - lastHundredValues[1]) > 0) {
            changeColor = true;
        }
        else
            changeColor = false;
    }

    GridLayout {
        anchors.fill: parent
        columns: 4
        rows: 2
        rowSpacing: 0
        columnSpacing: 0

        Text {
            id: stockName
            color: '#FFFFFF'
            font.pixelSize: 12
            Layout.columnSpan: 2
            Layout.leftMargin: 10
            Layout.topMargin: 4
            text: "BTC/USD"
        }

        Text {
            id: stockValue
            color: '#FFFFFF'
            font.pixelSize: 12
            Layout.leftMargin: 10
            Layout.topMargin: 4
            text: "44004.99"
        }

        Rectangle {
            width: 1
            height: 25
            Layout.row: 0
            Layout.column: 3
            color: '#FFFFFF'
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
        }

        Image {
            id: arrow
            Layout.leftMargin: 4
            source: changeColor ? "../images/green_arrow.png" : "../images/red_arrow.png"
        }

        Text {
            id: stockPercent
            color: changeColor ? '#0BFA0B' : '#BA555C'
            font.pixelSize: 16
            Layout.leftMargin: 4
            Layout.topMargin: 4
            text: "-0.22%"
        }

        Text {
            id: stockNet
            color: changeColor ? '#0BFA0B' : '#BA555C'
            font.pixelSize: 12
            Layout.leftMargin: 4
            Layout.topMargin: 4
            text: "(-63.35)"
        }

        Rectangle {
            width: 1
            height: 25
            color: '#FFFFFF'
            Layout.alignment: Qt.AlignRight | Qt.AlignTop
        }
    }
}
