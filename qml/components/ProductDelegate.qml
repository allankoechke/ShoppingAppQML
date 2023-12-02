import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import '../theme'

Item {
    id: root
    width: gv.cellWidth
    height: gv.cellHeight

    property string shortName
    property string description
    property string longDescription
    property string imageUrls
    property real rating
    property int numItemsSold
    property real price

    property string productImg

    signal clicked

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 2
        spacing: 4

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: AppTheme.primaryBg
            radius: 8

            RoundedImage {
                id: img
                radius: parent.radius
                source: `qrc:/AEShopping/assets/products/im${index+1}.jpg`
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                scale: ma.pressed ? 0.9 : 1
                Behavior on scale { NumberAnimation { duration: 200 }}
            }

            Image {
                width: Math.min(parent.width, parent.height) * 0.4
                height: width
                sourceSize.width: width
                sourceSize.height: height
                source: AppTheme.imageIcon
                visible: !img.visible
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                scale: ma.pressed ? 0.9 : 1
                Behavior on scale { NumberAnimation { duration: 200 }}
            }
        }

        Column {
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            Layout.leftMargin: 4
            Layout.rightMargin: 4
            spacing: 2
            clip: true

            Row {
                spacing: 2

                Label {
                    id: currencytxt
                    text: qsTr('USD')
                    font.pixelSize: 12
                    font.bold: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 2
                }

                Label {
                    id: pricetxt
                    text: stringifyPrice(price)
                    font.pixelSize: 16
                    font.bold: true
                    anchors.bottom: parent.bottom
                    leftPadding: 4
                }

                Label {
                    id: decimaltxt
                    text: '.' + getDecimals(price)
                    font.pixelSize: 12
                    font.bold: true
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 2
                }
            }

            Label {
                id: desctxt
                text: shortName + ' - ' + description
                font.pixelSize: 10
                wrapMode: Label.WrapAnywhere
                maximumLineCount: 2
                width: parent.width
            }
        }
    }

    Rectangle {
        id: indicator

        property real mx
        property real my

        color: AppTheme.accentLight
        x: mx - width/2
        y: my - height/2
        height: width
        radius: width/2
    }

    ParallelAnimation {
        id: indicatorAnim

        NumberAnimation {
            target: indicator
            property: 'width'
            from: 0; to: Math.max(root.width, root.height) * 1.5
            duration: 200
        }

        NumberAnimation {
            target: indicator
            property: 'opacity'
            from: 0.9; to: 0
            duration: 200
        }
    }

    MouseArea {
        id: ma
        anchors.fill: parent
        onClicked: function (mouseEv){
            indicator.mx = mouseEv.x
            indicator.my = mouseEv.y
            indicatorAnim.start()
            root.clicked()
        }
    }
}
