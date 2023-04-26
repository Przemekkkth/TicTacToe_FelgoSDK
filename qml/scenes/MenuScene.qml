import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id: menuScene

    // signal indicating that the selectLevelScene should be displayed
    signal selectLevelPressed
    // signal indicating that the creditsScene should be displayed
    signal creditsPressed

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#47688e"
    }

    // the "logo"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Tic Tac Toe"
    }

    // menu
    Column {
        anchors.centerIn: parent
        spacing: 10
        MenuButton {
            text: "Levels"
            onClicked: selectLevelPressed()
        }
        MenuButton {
            text: "Credits"
            onClicked: creditsPressed()
        }
    }

    // a little Felgo logo is always nice to have, right?
    Image {
        source: "../../assets/img/felgo-logo.png"
        width: 60
        height: 60
        anchors.right: menuScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.bottom: menuScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 10
    }

    // a little Felgo logo is always nice to have, right?
    Image {
        source: "../../assets/img/avatar.png"
        width: 60
        height: 60
        anchors.left: menuScene.gameWindowAnchorItem.left
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
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
        anchors.left: menuScene.gameWindowAnchorItem.left
        anchors.bottom: menuScene.gameWindowAnchorItem.bottom
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
    }

    // x Image helps close app
    Image{
        id: xImage
        source: "../../assets/img/x.png"
        width: 35
        height: 35
        anchors.right: menuScene.gameWindowAnchorItem.right
        anchors.top: menuScene.gameWindowAnchorItem.top
        anchors.rightMargin: 15
        anchors.topMargin: 15
        MouseArea{
            anchors.fill: parent
            onClicked: {
                menuScene.backButtonPressed()
            }
        }
    }
    RotationAnimation {
        id: xImageRotAnim
        target: xImage
        running: true
        property: "rotation"
        from: 0
        to: 360
        duration: 2500
        loops: Animation.Infinite
    }
}
