import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import "../js/easy_board.js" as EasyBoard
import QtQuick.Controls 2.12

Common.LevelBase {
    levelName: "Chimpanzee"
    onSceneRestarted: {
        EasyBoard.reset()
        mainPiece.text = ''
        mainPiece.color = mainPiece.activatedPiece
        isRunning = true
        scoreUpdated(0, 0)
    }

    Common.Piece{
        id: mainPiece
        anchors.centerIn: parent
        width: 100
        height: 100
        onClicked: {
            mainPiece.color = mainPiece.blockedPiece
            EasyBoard.handleMove(0,0)
            text = EasyBoard.getText(0,0)
            if(isRunning)
            {
                resultIsShowed("Congratulation!\n Player X Win :D")
            }
            isRunning = EasyBoard.isRunning()
            scoreUpdated(1, 0)
        }
    }
}
