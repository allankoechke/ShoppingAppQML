import QtQuick
import Qt5Compat.GraphicalEffects
import '../theme'

Rectangle {
    id: root
    implicitHeight: 48
    implicitWidth: 48
    color: backgroundColor
    radius: 8

    property real iconSize: 36
    property string iconColor: "#444"
    property string backgroundColor: AppTheme.primaryBg
    property alias iconsource: img.source
    property string touchHighlight: Qt.lighter(AppTheme.accent)
    property bool down: false

    signal clicked()

    Image {
        id: img
        width: down ? iconSize : iconSize
        height: width
        anchors.centerIn: parent
        sourceSize.width: iconSize
        sourceSize.height: iconSize
        scale: ma.pressed ? 0.8 : 1
        Behavior on scale { NumberAnimation { duration: 200 }}
    }

    Rectangle {
        id: indicator

        property int mx
        property int my

        width: 0
        height: width
        radius: width/2
        color: touchHighlight
        x: mx - width/2
        y: my - width/2
    }

    Rectangle {
        id: mask
        radius: height /2
        anchors.fill: parent
        visible: false
    }

    OpacityMask {
        anchors.fill: root
        source: root
        maskSource: mask
    }

    ParallelAnimation {
        id: indicatoranim

        NumberAnimation {
            target: indicator
            property: 'width'
            from: 0
            to: root.width * 1.8
            duration: 200
        }

        NumberAnimation {
            target: indicator;
            property: 'opacity'
            from: 0.9
            to: 0
            duration: 200
        }
    }

    MouseArea {
        id: ma
        anchors.fill: parent
        onPressed: down=true
        onReleased: down=false
        onClicked: function(me){
            indicator.mx = me.x
            indicator.my = me.y
            indicatoranim.start()
            root.clicked()
        }
    }
}
