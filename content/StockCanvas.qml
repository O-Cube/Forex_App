import QtQuick
import QtQuick.Controls

Rectangle {
    id: rect
    width: 400
    height: 400

    Canvas {
        id: canvas
        anchors.fill: parent

        property real gridHeight: 100
        property real gridWidth: 17.5

        function drawBackground(ctx) {
            ctx.fillStyle = '#000000';
            ctx.fillRect(0, 0, rect.width, rect.height);
            var i;
            // draw horizontal lines
            ctx.beginPath();
            ctx.lineWidth = 0.2;
            ctx.strokeStyle = '#FFFFFF';
            for (i = 1; i < 4; i++ ) {
                //ctx.beginPath();
                ctx.moveTo(50, i * gridHeight);
                ctx.lineTo(rect.width, i * gridHeight);
            }
            // draw vertical DragAxis
            ctx.moveTo(50, 0);
            ctx.lineTo(50, rect.height);

            // label vertical grid
            ctx.text("1.0", 30, 1 * gridHeight);
            ctx.text("0", 30, 2 * gridHeight);
            ctx.text("-1.0", 30, 3 * gridHeight);
            // horizotal labels
            for (i = 1; i < 21; i++) {
                ctx.text(""+i, 40 + (i * gridWidth), 210);
            }
            ctx.stroke();
        }

        onPaint: {
            var ctx = getContext('2d');
            drawBackground(ctx);
        }
    }
}
