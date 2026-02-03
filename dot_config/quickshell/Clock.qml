import QtQuick
import QtQuick.Layouts

GridLayout {

    columns: 2

    Text {
        id: clockText

        text: Time.currentTime
        font.pixelSize: 20
        font.family: "Monospace"
        font.bold: true

        Layout.alignment: Qt.AlignRight | Qt.AlignBottom
        Layout.horizontalStretchFactor: 1
        //Layout.fillWidth: true
    }

    Text {
        id: secondsText

        text: Time.seconds
        font.pixelSize: 14
        font.family: "Monospace"
        color: "gray"
        font.bold: false

        Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
        Layout.horizontalStretchFactor: 1
        //Layout.fillWidth: true
    }

    Text {
        id: dateText

        text: Time.date
        font.pixelSize: 14
        font.family: "Monospace"
        Layout.columnSpan: 2

        Layout.alignment: Qt.AlignRight | Qt.AlignTop
    }
}