import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts


Item {
    required property QsMenuEntry menuItem
    required property int menuWidth

    implicitWidth: contentLoader.implicitWidth + 10
    implicitHeight: contentLoader.implicitHeight

    Rectangle{
        id: backgroundRect
        color: "green"
        implicitWidth: menuWidth
        implicitHeight: contentLoader.implicitHeight
    }

    Loader {
        id: contentLoader
        anchors.fill: parent

        sourceComponent: Item {
            implicitHeight: textContent.implicitHeight + 4
            implicitWidth: textContent.implicitWidth + icon.implicitWidth

            Text {
                anchors.left: parent.left
                id: textContent
                text: menuItem.text
            }

            Loader {
                id: icon
                active: menuItem.icon !== ""

                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                sourceComponent: IconImage {
                    id: iconImage
                    source: menuItem.icon
                    implicitSize: textContent.implicitHeight
                }
            }

            Loader {
                id: button
                active: menuItem.buttonType !== QsMenuButtonType.NoButton
            }
        }
    }
}
