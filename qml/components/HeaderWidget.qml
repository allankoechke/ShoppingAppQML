import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtQuick.Controls
import '../theme'

Item {
    id: root
    width: parent.width
    height: 50

    signal backClicked()
    signal cartClicked()
    signal shareClicked()
    signal moreClicked()

    DropShadow {
        anchors.fill: root
        horizontalOffset: 0
        verticalOffset: 1
        radius: 8.0
        color: "#80000000"
        source: root
    }

    Rectangle {
        anchors.fill: parent
        anchors.bottomMargin: 3
        color: AppTheme.primaryBg

        RowLayout {
            anchors.fill: parent
            anchors.margins: 4

            IconButton {
                id: backbtn
                iconSize: 32
                Layout.fillHeight: true
                Layout.preferredWidth: 42
                iconsource: AppTheme.arrowLeftIcon
                Layout.alignment: Qt.AlignVCenter
                onClicked: root.backClicked()
                visible: backButtonShown
            }

            TextField {
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: backButtonShown ? 0 : 10

                background: Rectangle {
                    radius: height/2
                }

                placeholderText: qsTr('Search here ...')
                leftPadding: 10
                rightPadding: 10
                font.pixelSize: 14
            }

            IconButton {
                id: sharebtn
                iconSize: 32
                Layout.fillHeight: true
                Layout.preferredWidth: 36
                iconsource: AppTheme.shareIcon
                Layout.alignment: Qt.AlignVCenter
                onClicked: root.shareClicked()
            }

            IconButton {
                id: cartbtn
                iconSize: 24
                Layout.fillHeight: true
                Layout.preferredWidth: 36
                iconsource: AppTheme.cartIcon
                Layout.alignment: Qt.AlignVCenter
                onClicked: root.cartClicked()
            }

            IconButton {
                id: morebtn
                iconSize: 24
                Layout.preferredWidth: 30
                Layout.fillHeight: true
                iconsource: AppTheme.moreIcon
                Layout.alignment: Qt.AlignVCenter
                onClicked: root.moreClicked()
            }
        }


    }
}
