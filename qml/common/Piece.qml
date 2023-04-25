import QtQuick 2.0
import Felgo 3.0

Rectangle {
    id: button
    /*!
        this will be the default size, it is same size as the contained text + some padding
    */
    width: buttonText.width+ paddingHorizontal*2
    height: buttonText.height+ paddingVertical*2

    property color activatedColor: "#00ff00"
    property color blockedColor:   "#c7c7c7"
    property color blockedByEnemyColor: "#b22222"

    color: activatedColor

    /*!
        round edges
    */
    radius: 15

    /*!
        the horizontal margin from the Text element to the Rectangle at both the left and the right side.
    */
    property int paddingHorizontal: 10
    /*!
        the vertical margin from the Text element to the Rectangle at both the top and the bottom side.
    */
    property int paddingVertical: 5

    /*!
        access the text of the Text component. It can be '', 'X', 'O'
    */
    property alias text: buttonText.text

    /*!
        this handler is called when the button is clicked.
    */
    signal clicked

    Text {
        id: buttonText
        anchors.centerIn: parent
        font.pixelSize: 18
        font.bold: true
        color: "black"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: button.clicked()
        onPressed: button.opacity = 0.9
        onReleased: button.opacity = 1
    }
}
