import QtQuick 2.0

Item {
    // this will be displayed in the GameScene
    property string levelName
    // check user/pc can move
    property bool isRunning: true
    // this is emitted whenever the rectangle has been tapped successfully, the GameScene will listen to this signal and increase the score
    signal rectanglePressed
    // this is emiited when player or pc win a game
    signal resultIsShowed(result: string)
    // when you lose, use this signal for the starting source ;D
    signal sceneRestarted
    // this is emitted when score is changed
    signal scoreUpdated(xScore: int, oScore : int)
}
