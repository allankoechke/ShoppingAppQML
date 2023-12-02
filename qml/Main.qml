import QtQuick
import QtQuick.Window
import QtQuick.Controls
import 'theme'
import 'components'

ApplicationWindow {
    id: app
    width: 350
    height: 720
    visible: true
    title: qsTr("Cart Window")
    color: '#fff'

    property bool backButtonShown: false
    property bool headerWidgetShown: true
    property bool bottomTabBarShown: !true

    property ListModel cartModel: ListModel{}
    property alias headerBar: headercomponent
    property alias appStackView: appStackView

    Loader {
        id: mainLoader
    }

    header: HeaderWidget {
        id: headercomponent
        visible: headerWidgetShown

        onBackClicked: appStackView.appStack.pop()
        onMoreClicked: {
            console.log('Loading ...')
            var component = Qt.createComponent('qrc:/AEShopping/qml/components/MorePopup.qml')
            if (component.status === Component.Ready) {
                var popup = component.createObject(app)
                popup.open()
            }
        }
    }

    footer: Rectangle { color: 'green'; width: parent.width; height: 50; visible: bottomTabBarShown }
    contentData: AppStack {id: appStackView}
}
