import QtQuick 2.0
import Felgo 3.0

Rectangle{
    id: resultRect
    anchors.centerIn: gameScene.gameWindowAnchorItem
    width: 200
    height: 120
    property alias resulText: subText.text
    visible: false
    radius: 25
    color: "#030303"
    z: 10
    Text {
        id: subText
        anchors.horizontalCenter: resultRect.horizontalCenter
        font.bold: true
        font.pixelSize: 25
        color: "white"
        text: qsTr("text")
    }
    Text {
        anchors.horizontalCenter: resultRect.horizontalCenter
        anchors.bottom: resultRect.bottom
        font.bold: true
        font.pixelSize: 25
        color: "white"
        text: qsTr("Press to hide...")
    }



    MouseArea{
        anchors.fill: parent
        onPressed: {
            resultRect.visible = false
            console.log("It is pressed")
        }
    }
}
