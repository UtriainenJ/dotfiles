import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {

    required property PanelWindow attachedTo

    color: "transparent"
    WlrLayershell.namespace: "Qs-panel-border"

    anchors: attachedTo.anchors

    margins.top: attachedTo.margins.top - Config.borderThickness
    margins.left: attachedTo.margins.left - Config.borderThickness
    implicitWidth: attachedTo.implicitWidth + Config.borderThickness * 2
    implicitHeight: attachedTo.implicitHeight + Config.borderThickness * 2

    // make the border window click-through
    mask: Region {
        item: borderRect
        intersection: Intersection.Xor
    }

    Rectangle {
        id: borderRect

        anchors.fill: parent
        color: "transparent"
        radius: Config.panelBorderRadius
        border.color: Config.borderColor
        border.width: Config.borderThickness
    }
}