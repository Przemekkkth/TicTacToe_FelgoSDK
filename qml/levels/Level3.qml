import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import "../js/hard_board.js" as HardBoard

Common.LevelBase {
    levelName: "RoboCop"
    onSceneRestarted: {
        HardBoard.reset()
        for(var i = 0; i < 25; ++i)
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
        anchors.verticalCenterOffset: 25
        width: 200
        height: 200
        color: "transparent"
        Grid {
            columns: 5
            rows: 5
            spacing: 5

            Repeater {
                id: mainRepeater
                model: 25
                Common.Piece {
                    width: 35
                    height: 35
                    onClicked: {
                        if(!isRunning)
                        {
                            return;
                        }
                        if(HardBoard.isEmptyPiece(modelData))
                        {
                            HardBoard.playerMove(modelData)
                            color = blockedColor
                            text = HardBoard.player
                            var pcCanMove = true
                            playTickSND()
                            if(HardBoard.checkWinner())
                            {
                                resultIsShowed(HardBoard.checkWinner())
                                isRunning = false;
                                pcCanMove = false
                                playEndSND()
                            }
                            if(pcCanMove)
                            {
                                var pcIndex = HardBoard.pcMove();
                                var pcPiece = mainRepeater.itemAt(pcIndex);
                                pcPiece.color = pcPiece.blockedByEnemyColor;
                                pcPiece.text = HardBoard.pc
                                playTickSND()
                            }
                            if(HardBoard.checkWinner())
                            {
                                resultIsShowed(HardBoard.checkWinner())
                                isRunning = false;
                                pcCanMove = false
                                playEndSND()
                            }
                        }
                        scoreUpdated(HardBoard.countOf(HardBoard.player),
                                     HardBoard.countOf(HardBoard.pc))
                    }
                } //Common.Piece
            } //Repeater
        } //Grid
    } //Rectangle
} //Common.LevelBase

