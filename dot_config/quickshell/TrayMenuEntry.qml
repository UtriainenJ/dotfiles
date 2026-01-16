import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Item {
    required property QsMenuEntry menuItem
    required property int menuWidth

    implicitWidth: contentLoader.implicitWidth
    implicitHeight: contentLoader.implicitHeight

    Rectangle{
        id: backgroundRect
        color: "lightgreen"
        implicitWidth: menuWidth
        implicitHeight: contentLoader.implicitHeight
    }

    // Anchored to fill background however contents implicit size gets propagated up to the menuLayout,
    // this way we can have the whole menu width be determined by the widest entry
    Loader {
        id: contentLoader
        anchors.fill: backgroundRect

        sourceComponent: Item {
            implicitHeight: textContent.implicitHeight + 4
            implicitWidth: textContent.implicitWidth + icon.implicitWidth + buttons.implicitWidth

            Text {
                anchors.centerIn: parent
                id: textContent
                text: menuItem.text
            }

            Loader {
                id: icon
                active: menuItem.icon !== ""

                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter

                sourceComponent: IconImage {
                    id: iconImage
                    source: menuItem.icon
                    implicitSize: textContent.implicitHeight
                }
            }

            Loader {
                id: buttons
                active: menuItem.buttonType !== QsMenuButtonType.None
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                sourceComponent: Item {
                    implicitWidth: checkBox.implicitWidth
                    implicitHeight: checkBox.implicitHeight

                    CheckBox {
                        id: checkBox
                        visible: menuItem.buttonType === QsMenuButtonType.Checkbox
                        checked: menuItem.checkState
                        padding: 0
                    }

                    RadioButton {
                        id: radioButton
                        visible: menuItem.buttonType === QsMenuButtonType.RadioButton
                        checked: menuItem.checkState
                        padding: 0
                    }
                }
            }
        }
    }

    MouseArea {
        id: entryMouseArea
        anchors.fill: backgroundRect

        acceptedButtons: Qt.LeftButton
        onClicked: event => {
            if (event.button === Qt.LeftButton) {
                menuItem.triggered();
            }
        }

        hoverEnabled: true
        onEntered: backgroundRect.color = "green"
        onExited: backgroundRect.color = "lightgreen"
    }
}
