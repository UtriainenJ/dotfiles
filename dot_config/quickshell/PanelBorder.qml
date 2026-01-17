import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {

    required property var attachedTo

    color: "transparent"
    WlrLayershell.namespace: "Qs-panel-border"

    anchors: attachedTo.anchors

    margins.top: attachedTo.margins.top - Config.borderThickness
    margins.left: attachedTo.margins.left - Config.borderThickness
    implicitWidth: attachedTo.implicitWidth + Config.borderThickness * 2
    implicitHeight: attachedTo.implicitHeight + Config.borderThickness * 2

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: Config.panelBorderRadius
        border.color: Config.borderColor
        border.width: Config.borderThickness
    }
}