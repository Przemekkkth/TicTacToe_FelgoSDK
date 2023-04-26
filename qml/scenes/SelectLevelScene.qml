import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id: selectLevelScene

    // signal indicating that a level has been selected
    signal levelPressed(string selectedLevel)

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#993300"
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
        anchors.right: selectLevelScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: selectLevelScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }

    Text{
        anchors.bottom: column.top
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Choose a difficulty level:"
    }
    // levels to be selected
    Column {
        id: column
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20
        spacing: 10


        MenuButton {
            text: "Chimpanzee"
            width: 100
            height: 50
            onClicked: {
                levelPressed("Level1.qml")
            }
        }
        MenuButton {
            text: "Human"
            width: 100
            height: 50
            onClicked: {
                levelPressed("Level2.qml")
            }
        }
        MenuButton {
            text: "RoboCop"
            width: 100
            height: 50
            onClicked: {
                levelPressed("Level3.qml")
            }
        }
    }


    // enhances the appearance of the scene
    AnimatedSprite{
        source: "../../assets/sprite/2x2sprite.png"
        frameWidth: 154
        frameHeight: 154
        frameCount: 4
        frameDuration: 1500
        width: 72
        height: 72
        interpolate: false
        anchors.right: selectLevelScene.gameWindowAnchorItem.right
        anchors.bottom: selectLevelScene.gameWindowAnchorItem.bottom
        anchors.rightMargin: 15
        anchors.bottomMargin: 15
    }

    Image{
        source: "../../assets/img/x.png"
        width: 35
        height: 35
        anchors.left: selectLevelScene.gameWindowAnchorItem.left
        anchors.top: selectLevelScene.gameWindowAnchorItem.top
        anchors.leftMargin: 15
        anchors.topMargin: 150
    }
    Image{
        source: "../../assets/img/o.png"
        width: 35
        height: 35
        anchors.left: selectLevelScene.gameWindowAnchorItem.left
        anchors.top: selectLevelScene.gameWindowAnchorItem.top
        anchors.leftMargin: 50
        anchors.topMargin: 185
    }
    Image{
        source: "../../assets/img/empty.png"
        width: 35
        height: 35
        anchors.left: selectLevelScene.gameWindowAnchorItem.left
        anchors.top: selectLevelScene.gameWindowAnchorItem.top
        anchors.leftMargin: 85
        anchors.topMargin: 220
    }
}
