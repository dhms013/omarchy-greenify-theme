import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    anchors.fill: parent
    color: "#000000"

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.BlankCursor
        acceptedButtons: Qt.NoButton
        propagateComposedEvents: true
    }

    Image {
        anchors.fill: parent
        fillMode: Image.Stretch
        source: "1.png"
        asynchronous: true
        cache: false
        visible: status === Image.Ready
      }

    Column {
        anchors.centerIn: parent
        spacing: 120

        Image {
            id: logo
            source: "logo.png"
            fillMode: Image.PreserveAspectFit
            width: parent.parent.width * 0.25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: passwordBox
            width: 500
            height: 100
            font.pixelSize: Math.round(height * 0.75)
            echoMode: TextInput.Password
            passwordCharacter: "•"
            color: "#59CF77"
            horizontalAlignment: TextInput.AlignHCenter
            placeholderText: "Enter password"
            cursorDelegate: Item {
              visible: false
            }
            placeholderTextColor: "#A0FFFFFF"
            background: Rectangle {
                color: "#00000000"
                border.color: "#59CF77"
                border.width: 5
                radius: 65
            }

            focus: true
            onAccepted: {
                sddm.login(userModel.lastUser, text, sessionModel.lastIndex)
            }
            Component.onCompleted: forceActiveFocus()
        }
    }
}
