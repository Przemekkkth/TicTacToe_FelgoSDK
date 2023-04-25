import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import "../js/medium_board.js" as MediumBoard

Common.LevelBase {
    levelName: "Human"
    onSceneRestarted: {
        MediumBoard.reset()
        for(var i = 0; i < 9; ++i)
        {
            var piece = mainRepeater.itemAt(i)
            piece.text = ""
            piece.color = piece.activatedColor
        }
        isRunning = true
        scoreUpdated(0, 0)
    }

    Rectangle {
        anchors.centerIn: parent
        width: 155
        height: 155
        color: "transparent"
        Grid {
            columns: 3
            rows: 3
            spacing: 5

            Repeater {
                id: mainRepeater
                model: 9
                Common.Piece {
                    width: 50
                    height: 50
                    onClicked: {
                        if(!isRunning)
                        {
                            return;
                        }
                        if(MediumBoard.isEmptyPiece(modelData))
                        {
                            MediumBoard.playerMove(modelData)
                            color = blockedColor
                            text = MediumBoard.player
                            var pcCanMove = true
                            if(MediumBoard.checkWinner())
                            {
                                resultIsShowed(MediumBoard.checkWinner())
                                isRunning = false;
                                pcCanMove = false
                            }
                            if(pcCanMove)
                            {
                                var pcIndex = MediumBoard.pcMove();
                                var pcPiece = mainRepeater.itemAt(pcIndex);
                                pcPiece.color = pcPiece.blockedByEnemyColor;
                                pcPiece.text = MediumBoard.pc
                            }
                            if(MediumBoard.checkWinner())
                            {
                                resultIsShowed(MediumBoard.checkWinner())
                                isRunning = false;
                                pcCanMove = false
                            }
                        }
                        scoreUpdated(MediumBoard.countOf(MediumBoard.player),
                                     MediumBoard.countOf(MediumBoard.pc))
                    }
                } //Common.Piece
            } //Repeater
        } //Grid
    } //Rectangle
} //Common.LevelBase

