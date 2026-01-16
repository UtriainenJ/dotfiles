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

        margins.bottom: 4
        margins.left: 4

        implicitWidth: mWrapper.implicitWidth
        implicitHeight: mWrapper.implicitHeight

        WrapperMouseArea { 
            id: mWrapper

            margin: Config.borderThickness * 2
            drag.target: rect

            Clock {}
        }
        
    }

    PanelBorder {
        id: dockBorder

        anchors: dockWindow.anchors
        margins.bottom: dockWindow.margins.bottom - (mWrapper.margin / 2)
        margins.left: dockWindow.margins.left - (mWrapper.margin / 2)

        implicitWidth: dockWindow.implicitWidth + Config.borderThickness * 2
        implicitHeight: dockWindow.implicitHeight + Config.borderThickness * 2
    }
}
