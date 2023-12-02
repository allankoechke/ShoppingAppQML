import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import '../theme'
import '../components'

Rectangle {
    id: root
    color: AppTheme.secondaryBg

    property string shortName
    property string description
    property string longDescription
    property string image
    property real rating
    property int numItemsSold
    property real price

    ScrollView {
        id: sv
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: add2cartwidget.top

        Flickable {
            id: flickable
            contentHeight: maincol.height
            width: sv.width
            height: sv.height


            Column {
                id: maincol
                width: root.width
                spacing: 5

                Rectangle {
                    id: imgBg
                    width: parent.width
                    height: 9/16 * width
                    color: '#444'
                    clip: true

                    // Floating Image
                    Image {
                        property real my: flickable.contentY

                        width: parent.width
                        height: parent.height
                        source: image
                        fillMode: Image.PreserveAspectCrop
                        y: my
                    }
                }

                Row {
                    spacing: 1
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter

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
                        text: appStackView.stringifyPrice(price)
                        font.pixelSize: 16
                        font.bold: true
                        anchors.bottom: parent.bottom
                        leftPadding: 4
                    }

                    Label {
                        id: decimaltxt
                        text: '.'+getDecimals(price)
                        font.pixelSize: 12
                        font.bold: true
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 2
                    }

                    Label {
                        text: 'USD4,150.00'
                        font.pixelSize: 12
                        font.strikeout: true
                        width: parent.width - 20
                        leftPadding: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 2
                    }
                }

                Label {
                    text: qsTr('Price shown before tax.')
                    font.pixelSize: 10
                    wrapMode: Label.WordWrap
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle {
                    color: AppTheme.primaryBg
                    height: 30
                    radius: 4
                    width: root.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image {
                        source: AppTheme.truckIcon
                        width: 16; height: 16
                        sourceSize.width: 16
                        sourceSize.height: 16
                        fillMode: Image.PreserveAspectFit
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter

                        Label {
                            text: qsTr('Free Shipping')
                            font.pixelSize: 10
                            color: '#444'
                            anchors.bottom: parent.bottom
                            anchors.left: parent.right
                            anchors.leftMargin: 6
                        }
                    }
                }

                // A very long description
                Label {
                    id: desctxt
                    topPadding: 10
                    bottomPadding: 10
                    text: `${shortName} \n${description}\n\n${longDescription}`
                    font.pixelSize: 12
                    wrapMode: Label.WordWrap
                    width: parent.width - 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Row {
                    width: parent.width - 20
                    height: 30
                    anchors.horizontalCenter: parent.horizontalCenter

                    Repeater {
                        model: 5
                        delegate: Image {
                            source: AppTheme.starIcon
                            width: 16; height: 16
                            sourceSize.width: 16
                            sourceSize.height: 16
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Label {
                        leftPadding: 8
                        text: qsTr(`${rating.toFixed(1)} | ${numItemsSold}+ sold`)
                        font.pixelSize: 11
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    height: 50
                    width: parent.width - 40
                    anchors.horizontalCenter: parent.horizontalCenter

                    RowLayout {
                        anchors.fill: parent

                        Row {
                            spacing: 4
                            Layout.alignment: Qt.AlignVCenter

                            Label {
                                text: qsTr('Delivery')
                                font.pixelSize: 12
                                font.weight: Font.Bold
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Image {
                                source: AppTheme.arrowRightIcon
                                width: 24; height: 24
                                sourceSize.width: 24
                                sourceSize.height: 24
                                fillMode: Image.PreserveAspectFit
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Item {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 1
                        }

                        Row {
                            spacing: 4
                            Layout.alignment: Qt.AlignVCenter

                            Image {
                                source: AppTheme.pinIcon
                                width: 10; height: 10
                                sourceSize.width: 10
                                sourceSize.height: 10
                                fillMode: Image.PreserveAspectFit
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Label {
                                text: qsTr('To Kenya')
                                font.pixelSize: 10
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
            }
        }
    }

    AddToCartWidget {
        id: add2cartwidget
        anchors.bottom: parent.bottom
        width: parent.width
    }
}
