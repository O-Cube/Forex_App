import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: 600
    height: 800

    GridLayout {
         rows: 2
         columns: 2

         StockInfoBelt {Layout.columnSpan: 2 }
         StockLegend { }
         StockCanvas { }
    }
}
