import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {

        color: "transparent"
        WlrLayershell.namespace: "Qs-panel-border"

        Rectangle {
            anchors.fill: parent
            color: "transparent"
            radius: Config.panelBorderRadius
            border.color: Config.borderColor
            border.width: Config.borderThickness
        }

    }