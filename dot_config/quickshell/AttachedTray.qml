import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell.Widgets

PanelWindow {
    id: root
    required property PanelWindow attachedTo
    required property SystemTrayItem hoveredItem

    color: "transparent"

    anchors: attachedTo.anchors
    margins.top: attachedTo.margins.top
    margins.left: attachedTo.margins.left + attachedTo.implicitWidth

    implicitHeight: attachedTo.implicitHeight
    implicitWidth: trayIconsLayout.implicitWidth + menuLayout.implicitWidth

    ColumnLayout {
    id: trayIconsLayout
    // spacing: 6 // spacing between tray icons
        Repeater {
            model: SystemTray.items
            delegate: IconImage {
                required property SystemTrayItem modelData
                source: modelData.icon
                implicitSize: 24

                MouseArea {
                    id: iconMouseArea
                    anchors.fill: parent

                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: event => {
                        if (event.button === Qt.LeftButton) {
                            modelData.activate();
                        }
                        else {
                            modelData.secondaryActivate();
                        }
                    }

                    onWheel: event => {
                        modelData.scroll(event.angleDelta.y, false); // Vertical scroll
                        modelData.scroll(event.angleDelta.x, true);  // Horizontal scroll
                    }

                    hoverEnabled: true
                    onEntered: { hoveredItem = modelData; menuCloseTimer.stop(); }
                    onExited: { menuCloseTimer.start(); }
                }
            }
        }

    }

    // hoverhandlers instead of mouseareas to avoid stealing mouse events from the menu entries
    HoverHandler {
        id: menuHoverHandler
        target: menuLayout

        onHoveredChanged: {
            if (hovered) {
                menuCloseTimer.stop();
            }
            else {
                menuCloseTimer.start();
            }
        }
    }
    HoverHandler {
        id: trayHoverHandler
        target: trayIconsLayout
    }

    Timer {
        id: menuCloseTimer
        interval: 500
        repeat: false
        onTriggered: {
            if (!menuHoverHandler.hovered &&
                !trayHoverHandler.hovered) {
                hoveredItem = null;
            }
        }
    }

    QsMenuOpener {
        id: menuOpener
        menu: hoveredItem && hoveredItem.menu ? hoveredItem.menu : null
    }

    ColumnLayout {
        id: menuLayout

        anchors.left: trayIconsLayout.right

        Repeater {
            model: menuOpener.children

            // content blocks & separators
            delegate: Item {
                implicitWidth: childrenRect.width
                implicitHeight: childrenRect.height
                Loader {
                    active: !modelData.isSeparator
                    sourceComponent: 
                    TrayMenuEntry { 
                        menuItem: modelData
                        menuWidth: menuLayout.implicitWidth
                    }
                }

                Loader {
                    active: modelData.isSeparator
                    sourceComponent:
                        Rectangle {
                            id: separator
                            implicitHeight: 2
                            color: "red"
                            implicitWidth: menuLayout.implicitWidth
                        } 
                }
            }
        }
    }
}
