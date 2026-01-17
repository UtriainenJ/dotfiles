import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

Scope {
    id: rootScope

    PanelWindow {
        id: dockWindow
        color: "transparent"

        anchors.bottom: true
        anchors.left: true

        margins.bottom: 60
        margins.left: 60

        implicitWidth: mWrapper.implicitWidth
        implicitHeight: mWrapper.implicitHeight

        WrapperMouseArea { 
            id: mWrapper
            margin: Config.borderThickness * 2

            Clock {}
        }
        
    }

    PanelBorder {
        id: dockBorder
        attachedTo: dockWindow
    }
}
