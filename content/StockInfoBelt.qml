// Stock Information belt
// Displays multiple stock blocks in a belt

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import DataScrapping

Rectangle {
    width: 600
    height: 60
    color: '#000000'

    StockInformation {
        id: scrap
        onYenChanged: {
            // convert rate from qstring to float
            var rate = parseFloat(yen);
            rate = stockYen.convertCurrencyValue(rate);
            console.log(rate);
        }
    }

    Row {
        StockInfoBlock {
            id: stockYen
            commodity: "JPY/USD"
        }
        StockInfoBlock {
            id: stocKYuan
            commodity: "CNY/USD"
        }
    }
}
