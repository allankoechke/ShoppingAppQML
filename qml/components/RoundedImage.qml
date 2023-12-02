import QtQuick
import Qt5Compat.GraphicalEffects

Image {
    id: img

    property bool rounded: true
    property real radius: 4

    layer.enabled: rounded
    layer.effect: OpacityMask {
        maskSource: Item {
            width: img.width
            height: img.height

            Rectangle {
                anchors.centerIn: parent
                width: img.width
                height: img.height
                radius: img.radius
            }
        }
    }
}
