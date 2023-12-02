import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import '../theme'
import '../models'
import '../components'

Rectangle {
    id: root
    color: '#fff'

    GridView {
        id: gv
        anchors.fill: parent
        anchors.margins: 4
        flow: GridView.FlowLeftToRight
        model: ProductsModel{}

        property int cols: width / 150

        cellWidth: cols === 0 ? width : width/cols
        cellHeight: cellWidth * 1.2

        delegate: ProductDelegate {
            shortName: model.shortName
            description: model.description
            longDescription: model.longDescription
            rating: model.rating
            numItemsSold: model.numItemsSold
            price: model.price

            onClicked: appStack.push("qrc:/AEShopping/qml/views/ProductView.qml", {shortName,description,longDescription,image: `qrc:/AEShopping/assets/products/im${index+1}.jpg`,rating,numItemsSold,price})
        }
    }
}
