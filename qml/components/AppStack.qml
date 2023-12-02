import QtQuick
import QtQuick.Controls
import '../views'

Item {
    id: root
    width: parent.width
    height: parent.height

    property alias appStack: stackview

    StackView {
        id: stackview
        anchors.fill: parent
        onDepthChanged: backButtonShown = depth > 1 // Show back button only when stackview has more than 1 item
        initialItem: Dashboard{}
    }

    function stringifyPrice(price) {
        var x = Math.floor(price).toLocaleString('en-GB', { maximumFractionDigits: 0 });
        console.log(price, x)
        return x

    }

    function getDecimals(price) {
        var numint = Math.floor(price)
        var y = 100 * (price % numint).toFixed(2)
        return y;
    }
}
