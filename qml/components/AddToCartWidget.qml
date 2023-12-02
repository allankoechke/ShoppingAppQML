import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import '../theme'

Rectangle {
    id: root
    height: 50

    Rectangle {
        height: 1
        width: parent.width
        color: 'silver'
        anchors.top: parent.top
    }

    Column {
        id: mcol
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Item {
            height: 48
            width: parent.width - 20
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                id: shopcol
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 1
                width: 50

                Image {
                    source: AppTheme.shopIcon
                    width: 16; height: 16
                    sourceSize.width: 16
                    sourceSize.height: 16
                    fillMode: Image.PreserveAspectFit
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    text: qsTr('Shop')
                    font.pixelSize: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Item {
                height: parent.height
                anchors.left: shopcol.right
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                AddCartBtn {
                    id: leftbtn
                    anchors.verticalCenter: parent.verticalCenter
                    backgroundColor: AppTheme.accentLight
                    foregroundColor: AppTheme.accent
                    leftRounded: true
                    width: parent.width/2
                    anchors.left: parent.left
                    text: qsTr('Add to cart')
                }

                AddCartBtn {
                    id: rightbtn
                    anchors.verticalCenter: parent.verticalCenter
                    backgroundColor: AppTheme.accent
                    foregroundColor: AppTheme.secondaryBg
                    rightRounded: true
                    width: parent.width/2
                    anchors.right: parent.right
                    text: qsTr('Buy now')
                }
            }
        }
    }
}
