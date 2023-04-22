import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import "../js/easy_board.js" as EasyBoard
import QtQuick.Controls 2.12

Common.LevelBase {
    levelName: "Chimpanzee"

    Rectangle {
        color: "orange"
        width: 100
        height: 100
        radius: 10
        anchors.centerIn: parent
        MouseArea {
            anchors.fill: parent
            // since the level is loaded in the gameScene, and is therefore a child of the gameScene, you could also access gameScene.score here and modify it. But we want to keep the logic in the gameScene rather than spreading it all over the place
            onPressed: {
                EasyBoard.handleMove(0,0)
                //name.text = EasyBoard.getText(0,0)
                resultIsShowed("X Win :D")
            }
        }
    }

    Rectangle{
        id: rectangle
        anchors.centerIn: parent.Center
//        x: 100
//        y: 100
        width: 760
        height: 200
        visible: false
    }
}
