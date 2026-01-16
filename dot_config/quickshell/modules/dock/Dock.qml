import Quickshell
import Quickshell.Widgets
import "../shared"
import "../../" // root for Config.qml

Scope {
    id: root
    
    PanelWindow {
        id: dockWindow
        color: "transparent"
        screen: Config.dockConfig.screen

        anchors.top: true
        anchors.left: true

        margins.top: Config.dockConfig.pos.y
        margins.left: Config.dockConfig.pos.x

        implicitWidth: mWrapper.implicitWidth
        implicitHeight: mWrapper.implicitHeight

        WrapperMouseArea { 
            id: mWrapper
            margin: Config.dockConfig.dockMargin

            Clock {}
        }
    }
    PanelBorder {
        attachedTo: dockWindow
    }
}
