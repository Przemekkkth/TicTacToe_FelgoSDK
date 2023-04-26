import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id:creditsScene

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#49a349"
    }

    // the "logo"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Tic Tac Toe"
    }

    // back button to leave scene
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: creditsScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: creditsScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }

    // polish scene
    AnimatedSprite{
        source: "../../assets/sprite/1x1sprite.png"
        frameWidth: 70
        frameHeight: 70
        frameCount: 3
        frameDuration: 1200
        width: 35
        height: 35
        interpolate: false
        anchors.left: creditsScene.gameWindowAnchorItem.left
        anchors.top: creditsScene.gameWindowAnchorItem.top
        anchors.leftMargin: 10
        anchors.topMargin: 10
    }

    AnimatedSprite{
        source: "../../assets/sprite/1x1sprite.png"
        frameWidth: 70
        frameHeight: 70
        frameCount: 3
        frameDuration: 1500
        width: 35
        height: 35
        interpolate: true
        anchors.left: creditsScene.gameWindowAnchorItem.left
        anchors.bottom: creditsScene.gameWindowAnchorItem.bottom
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
    }

    AnimatedSprite{
        source: "../../assets/sprite/1x1sprite.png"
        frameWidth: 70
        frameHeight: 70
        frameCount: 3
        frameDuration: 2500
        interpolate: true
        anchors.right:  creditsScene.gameWindowAnchorItem.right
        anchors.bottom: creditsScene.gameWindowAnchorItem.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
    }

    // credits
    Column{
        spacing: 5
        x: 100
        y: 30
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 20
        Text {
            text: qsTr("Game Credits")
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Helvetica"
            font.pointSize: 16
            font.bold: true
            font.italic: true
            color: "red"
            style: Text.Outline;
            styleColor: "white"
        }
        Text {
            text: qsTr("Producer:")
            x: -100
            font.family: "Helvetica"
            font.pointSize: 14
            font.bold: true
            font.italic: true
            color: "blue"
            style: Text.Outline;
            styleColor: "white"
        }
        Text {
            text: qsTr("Director:")
            x: -100
            font.family: "Helvetica"
            font.pointSize: 14
            font.bold: true
            font.italic: true
            color: "blue"
            style: Text.Outline;
            styleColor: "white"
        }
        Text {
            text: qsTr("Graphics Designer:")
            x: -100
            font.family: "Helvetica"
            font.pointSize: 14
            font.bold: true
            font.italic: true
            color: "blue"
            style: Text.Outline;
            styleColor: "white"
        }
        Text {
            text: qsTr("Playtester:")
            x: -100
            font.family: "Helvetica"
            font.pointSize: 14
            font.bold: true
            font.italic: true
            color: "blue"
            style: Text.Outline;
            styleColor: "white"
        }
        Text {
            text: qsTr("I")
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Helvetica"
            font.pointSize: 16
            font.bold: true
            font.italic: true
            color: "red"
            style: Text.Outline;
            styleColor: "white"
        }
    }
}
