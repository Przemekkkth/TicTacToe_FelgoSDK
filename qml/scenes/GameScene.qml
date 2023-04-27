import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id:gameScene
    // the filename of the current level gets stored here, it is used for loading the
    property string activeLevelFileName
    // the currently loaded level gets stored here
    property variant activeLevel
    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setLevel(fileName) {
        activeLevelFileName = fileName
    }

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#993399"
    }

    // back button to leave scene
    MenuButton {
        text: "Back to menu"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: {
            backButtonPressed()
            activeLevel = undefined
            activeLevelFileName = ""
        }
    }

    // name of the current level
    Text {
        anchors.left: gameScene.gameWindowAnchorItem.left
        anchors.leftMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        color: "white"
        font.pixelSize: 20
        text: activeLevel !== undefined ? activeLevel.levelName : ""
    }

    // load levels at runtime
    Loader {
        id: loader
        source: activeLevelFileName != "" ? "../levels/" + activeLevelFileName : ""
        onLoaded: {

            // since we did not define a width and height in the level item itself, we are doing it here
            item.width = gameScene.width
            item.height = gameScene.height
            // store the loaded level as activeLevel for easier access
            activeLevel = item
            // emit signal for level
            loader.item.sceneRestarted()
            // hide resultRect
            resultRect.visible = false
        }
    }


    ResultRectangle{
        id: resultRect
    }

    // we connect the gameScene to the loaded level
    Connections {
        // only connect if a level is loaded, to prevent errors
        target: activeLevel !== undefined ? activeLevel : null

        onResultIsShowed:{
            resultRect.visible = true
            resultRect.resulText = result
        }

        onScoreUpdated:{
            scoreText.text = "X - " + xScore + " O - " + oScore;
        }
    }

    // name of the score
    Text {
        id: scoreText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 30
        color: "white"
        font.pixelSize: 40
        text: "X - 0 O - 0 "
    }

    // restart scene to start again
    MenuButton
    {
        text: "Restart Scene"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.left: gameScene.gameWindowAnchorItem.left
        anchors.leftMargin: 10
        anchors.bottom:  gameScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 10
        onClicked: {
            loader.loaded();
            resultRect.visible = false
        }
    }
}
