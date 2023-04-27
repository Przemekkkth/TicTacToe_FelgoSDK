import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import "../js/easy_board.js" as EasyBoard

Common.LevelBase {
    levelName: "Chimpanzee"
    onSceneRestarted: {
        EasyBoard.reset()
        mainPiece.text = ''
        mainPiece.color = mainPiece.activatedColor
        isRunning = true
        scoreUpdated(0, 0)
    }

    Common.Piece{
        id: mainPiece
        anchors.centerIn: parent
        width: 100
        height: 100
        onClicked: {
            mainPiece.color = mainPiece.blockedColor
            EasyBoard.handleMove(0,0)
            text = EasyBoard.getText(0,0)
            if(isRunning)
            {
                playTickSND()
                resultIsShowed("Congratulation!\n Player X Wins")
                playEndSND()
            }

            isRunning = EasyBoard.isRunning()
            scoreUpdated(1, 0)
        }
    }
}
