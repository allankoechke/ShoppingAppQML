import QtQuick 2.15
import QtQuick.Controls
import '../theme'

Drawer {
    id: popup
    width: app.width
    height: 300
    edge: Qt.BottomEdge

    background: Rectangle {
        anchors.fill: parent
        color: '#fff'
        radius: 8
    }

    contentItem: Item {
        anchors.fill: parent
        anchors.margins: 8

        Rectangle {
            id: drawerdraghandle
            height: 8; width: parent.width * 0.3; radius: height/2
            color: AppTheme.primaryBg
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }

        Column {
            id: col
            anchors.top: drawerdraghandle.bottom
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 4

            Label {
                text: qsTr('Additional Options')
                font.pixelSize: 12
                font.weight: Font.DemiBold
                color: '#444'
                bottomPadding: 10
            }

            Repeater {
                model: 4

                Rectangle {
                    width: col.width
                    height: 35
                    radius: 4
                    color: AppTheme.primaryBg
                    clip: true

                    Label {
                        text: qsTr('Menu Option')
                        font.pixelSize: 12
                        color: '#444'
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 8
                    }

                    Image {
                        source: AppTheme.arrowRightIcon
                        width: 20; height: 20
                        sourceSize.width: 20
                        sourceSize.height: 20
                        fillMode: Image.PreserveAspectFit
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 4
                    }

                    Rectangle {
                        id: indicator
                        property real mx
                        property real my

                        height: width
                        radius: width/2
                        color: Qt.darker(AppTheme.accentLight)
                        x: mx - width/2
                        y: my - width/2
                    }

                    ParallelAnimation {
                        id: anim

                        NumberAnimation {
                            target: indicator
                            property: 'width'
                            from: 0; to: indicator.parent.width * 1.2
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
                        anchors.fill: parent
                        onClicked: function (me){
                            indicator.mx = me.x
                            indicator.my = me.y
                            anim.start()
                            // Do whatever else
                        }
                    }
                }
            }
        }
    }
}
