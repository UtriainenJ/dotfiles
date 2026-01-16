import Quickshell
import "modules/dock"
import "modules/tray"
import "modules/shared"


Scope {
    Dock {}

    Tray { id: tray }
    PanelBorder { attachedTo: tray }
}

