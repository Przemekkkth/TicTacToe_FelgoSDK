import QtQuick 2.0

Item {
    // this will be displayed in the GameScene
    property string levelName
    // this is emitted whenever the rectangle has been tapped successfully, the GameScene will listen to this signal and increase the score
    signal rectanglePressed
    // this is emiited when player or pc win a game
    signal resultIsShowed(result: string)
}
