import QtQuick 2.15
import QtQuick.Controls
import '../theme'

Item {
    id: root
    height: 40
    clip: true

    property bool rounded: false
    property bool leftRounded: false
    property bool rightRounded: false
    property string foregroundColor
    property string backgroundColor
    property alias text: txt.text

    signal clicked

    Rectangle {
        anchors.fill: parent
        radius: height/2
        color: backgroundColor

        Rectangle {
            color: parent.color
            height: parent.height
            width: parent.height/2
            anchors.left: parent.left
            visible: rightRounded || rounded
        }

        Rectangle {
            color: parent.color
            height: parent.height
            width: parent.height/2
            anchors.right: parent.right
            visible: leftRounded || rounded
        }

        Label {
            id: txt
            color: foregroundColor
            anchors.centerIn: parent
            font.pixelSize: 12
            font.weight: Font.Bold
        }
    }

    Rectangle {
        id: indicator
        property real mx
        property real my

        height: width
        color: Qt.lighter(AppTheme.accent)
        x: mx - width/2
        y: my - width/2
        radius: width/2
    }

    ParallelAnimation {
        id: indicatoranim

        NumberAnimation {
            target: indicator
            property: 'width'
            from: 0
            to: root.width
            duration: 200
        }

        NumberAnimation {
            target: indicator
            property: 'opacity'
            from: 0.9
            to: 0
            duration: 200
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: function (me) {
            indicator.mx = me.x
            indicator.my = me.y
            indicatoranim.start()
            root.clicked()
        }
    }
}
