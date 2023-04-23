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
        color: "#ece468"
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
}
