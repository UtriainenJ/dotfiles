import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

Scope {
    id: rootScope

    PanelWindow {
        id: dockWindow
        color: "transparent"

        anchors.top: true
        anchors.left: true

        margins.top: Config.dockPos.y
        margins.left: Config.dockPos.x

        implicitWidth: mWrapper.implicitWidth
        implicitHeight: mWrapper.implicitHeight

        WrapperMouseArea { 
            id: mWrapper
            margin: 50

            Clock {}
        }

        
    }

    PanelBorder {
        id: dockBorder
        attachedTo: dockWindow
    }

    AttachedTray {
        id: tray
        attachedTo: dockWindow
    }

}
